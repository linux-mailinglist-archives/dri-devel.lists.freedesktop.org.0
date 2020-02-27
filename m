Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3B1721B1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 15:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30AB6EB8A;
	Thu, 27 Feb 2020 14:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D76EB8A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 14:57:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p18so3706833wre.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c8UJCHjiQkoyahVk3JVpGT7p90RFMuXW7y1DGNJVn3I=;
 b=byT2rBhaJ3NpZXKQ3xNyKgwH/jTsZDf0x3JScBZse8RZ9ksFtO/1/rzbmUu0CFRSmu
 UdjxqFPEVzG5/nlQN1mO3unL4TpB2ZWZqMmJ1QFXtg0gtHTDJmuH5Mr9BHs1Z27Lz8kL
 uNlFPb6j5UW2b9rOFGC2vB0UPG4BqkPa/9nbKFUK4OLlUK/pY6kMcaGVXtUMgczw0Kp6
 oAm41AQENKBtmKvcKzZCOGkW797Vm6p0Mh+Z9k7y+u3Fd4p0Ai6LFLrNKSdom9zxuj/A
 QU7eFBjQf0U6mgt31hcNhrgdDBHWHjTyZwkPPZmLd1Qrq5BEShppzQjd8edcXAQXb6PS
 SaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c8UJCHjiQkoyahVk3JVpGT7p90RFMuXW7y1DGNJVn3I=;
 b=U3ZVim0DvUfBbIXoEotHp7FZwsII2YPFCydG0tuCQFneoMBw8zthy/MgJFgE3qrL/j
 Ye7RMrpkD2Idq0XEzUyCKpSBLWMd6/8UdzxOOk7MJTlwy1wPMLQqCnAEYQMY9U4Ljqln
 GOyS1Cz2i26m+0vd5Muh8/9GDthw+6E7U5NwrgFE0XmwObQlyITyS+DAHcwGJYDcc3qT
 Kq4NnlQpTGpPMNo2YxT/+bAi2LPpc4rZknOIV7D+oX5leWkbqhy6kHmvMWgUHNkesveU
 kTeTirL8hYT2JChcX7USsMSalwjY4vf6OgvZGLXZSIN5aZsgN60k6ZrGOG0LpXcDNN7g
 cuwA==
X-Gm-Message-State: APjAAAWHJgkTGWELFhqrmDYSeUqVACWK4NE+Z7MoQ3ddmHf3AnlxZdaw
 wfwUAckUZ4m2a27vrOfzAhXpJA==
X-Google-Smtp-Source: APXvYqyyrixRf/9E0uAEum8ogR5+reOoYYP6OuOAEbkyXb2Dh9c2XHojBOJxbwOJHAKTPtAucIdiBw==
X-Received: by 2002:adf:f892:: with SMTP id u18mr5040913wrp.328.1582815463904; 
 Thu, 27 Feb 2020 06:57:43 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id h15sm1262654wrr.73.2020.02.27.06.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 06:57:43 -0800 (PST)
Date: Thu, 27 Feb 2020 14:57:41 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200227145741.v3r4qzkfsrwpy33h@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
 <20200227114623.vaevrdwiduxa2mqs@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227114623.vaevrdwiduxa2mqs@holly.lan>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Bryan Wu <cooloney@gmail.com>, Gyungoh Yoo <jack.yoo@skyworksinc.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 11:46:23AM +0000, Daniel Thompson wrote:
> On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > In the unlikely event that num_entry is zero, the while loop
> > pre-decrements num_entry to cause negative array indexing into the
> > array sources. Fix this by iterating only if num_entry >= 0.
> > 
> > Addresses-Coverity: ("Out-of-bounds read")
> > Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> > 
> > V2: fix typo in commit subject line
> 
> Isn't the correct spelling "ensure"?
> 
> 
> > ---
> >  drivers/video/backlight/sky81452-backlight.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> > index 2355f00f5773..f456930ce78e 100644
> > --- a/drivers/video/backlight/sky81452-backlight.c
> > +++ b/drivers/video/backlight/sky81452-backlight.c
> > @@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
> >  		}
> >  
> >  		pdata->enable = 0;
> > -		while (--num_entry)
> > +		while (--num_entry >= 0)
> >  			pdata->enable |= (1 << sources[num_entry]);
> 
> This look still looks buggy to me (so I'd second Walter's request to
> change it to a for loop). If the code genuinely does not contain a
> bug then it probably needs a prominent comment explaining why it is
> correct not to honour sources[0]!

Ignore the "still looks buggy". A mental mis-step when switching
contexts...

I think my English is still correct though ;-)


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
