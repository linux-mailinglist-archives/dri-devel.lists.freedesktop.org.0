Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08817163D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 12:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF70E6E84F;
	Thu, 27 Feb 2020 11:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82446E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 11:46:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r7so647072wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cTBJSroA9RJ+8lBEwYkKnNGeXoVHBYBbqwTPMLg2F9o=;
 b=f6IaWn5/yo6zdY5X0ONlrcO/16bC0jHGTfMt38t7p56Jk/StSR2GrXddKXOery9A+q
 bsjgvdrg9L2Y5X/z9mPZ40VcKxSzvjl/BcWiURUpE3UAHihkGE+aNwqW/hQHYlzJgTgZ
 dfkiTG5kuvTJCd5dwZrlgZojGkh2FdtDn/Motiqg1mztRnu9q46TLh5KM8w8xNboLfWi
 8CDE32ktJ+g+I1TZDeJIVMR3WVojdFKmDI2+8Me3bjD1iR73YZ3bq3EhQ9l8C/B8ULlL
 F/KJj4448hTB1c4I+t6S2FwLOa1EMsR98TeyclEAn/s0Obty8TAwe9cBsru+gLOVAy96
 nLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cTBJSroA9RJ+8lBEwYkKnNGeXoVHBYBbqwTPMLg2F9o=;
 b=OymQZ3uBGOZU4GVYMSde9bAo+EYry1va/J1dW6o5C2dr3zGZNAPK1Wd7kV/HpwcmEt
 6NkjuORMU+ONwb12QDclNGYldF0Bpko5YUeRXpA+W/h7p8hTsrhYOXcnuBjH/lsOBxOf
 yMJlVtylOnFkt+NnF8rP0mR+J0gRSjqXqeI2sK8jxkNlRmQVJE9dCC1yIbMrPdipkeTe
 YSSGH/hAGoD5OLgvqVVpYDkpWg+2rDjDJWjFhtaOyneA3nUOfpb04hseqw+wsf2wBE/3
 FSBxUtFKIIGhi/gWH95h3Uk+toPeXfesmdONWzXT0gGa3jmJsXJ9xZFj/vfRuJjTLEDs
 HYsg==
X-Gm-Message-State: APjAAAWwr4jL7VrNNJOTA+1N80stdhnBsyVEATCCKDx0QF1NbPAY1bhr
 GuOAGDW0y0QFRAtVAOVkAuYC0w==
X-Google-Smtp-Source: APXvYqz1InEhOPcHB1heYSDPHQuazWq7emWdftcDiZpOvuTUa9UVkpntp5/WkSSXkFxYObe7pXC9kQ==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr4509410wrp.225.1582803986345; 
 Thu, 27 Feb 2020 03:46:26 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 133sm7667950wme.32.2020.02.27.03.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 03:46:25 -0800 (PST)
Date: Thu, 27 Feb 2020 11:46:23 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] backlight: sky81452: insure while loop does not
 allow negative array indexing
Message-ID: <20200227114623.vaevrdwiduxa2mqs@holly.lan>
References: <20200226195826.6567-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226195826.6567-1-colin.king@canonical.com>
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

On Wed, Feb 26, 2020 at 07:58:26PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the unlikely event that num_entry is zero, the while loop
> pre-decrements num_entry to cause negative array indexing into the
> array sources. Fix this by iterating only if num_entry >= 0.
> 
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: f705806c9f35 ("backlight: Add support Skyworks SKY81452 backlight driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: fix typo in commit subject line

Isn't the correct spelling "ensure"?


> ---
>  drivers/video/backlight/sky81452-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/sky81452-backlight.c b/drivers/video/backlight/sky81452-backlight.c
> index 2355f00f5773..f456930ce78e 100644
> --- a/drivers/video/backlight/sky81452-backlight.c
> +++ b/drivers/video/backlight/sky81452-backlight.c
> @@ -200,7 +200,7 @@ static struct sky81452_bl_platform_data *sky81452_bl_parse_dt(
>  		}
>  
>  		pdata->enable = 0;
> -		while (--num_entry)
> +		while (--num_entry >= 0)
>  			pdata->enable |= (1 << sources[num_entry]);

This look still looks buggy to me (so I'd second Walter's request to
change it to a for loop). If the code genuinely does not contain a
bug then it probably needs a prominent comment explaining why it is
correct not to honour sources[0]!


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
