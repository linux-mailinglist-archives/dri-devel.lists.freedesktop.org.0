Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95AB2A2070
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EBA6EB1C;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37A6E1B8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 10:32:55 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l2so13625183lfk.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 02:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=somia-fi.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XccLLBP9fbRYIFzEXKVSu/gBJa6cdMsyr2qn7Nbznok=;
 b=WwwV+CZl0NVtbCCh/l8XgYPXAFhUHgNsHltaOXJGKtTvTglrbNZbWRtUuEwc0hbGdt
 qsCJSM5z2o+axm2vx0NKfKdx7cu9JsH8ZWbxdiSN1fmmTEiTLdtxcaC7iQ33gcBBGdlb
 Kz7Ua5HmTR1xDMN4qaohI/9TqjGHd0YJ6WDwTBQSwpm4UKTPZLXv3avbi/RJTbpuKgx2
 U41eXekBeFPjVKQdCQW4G93sMykidUcnfcLKXpRXTCQ7bMIFxHfPoQdClUHyXSYrQlTt
 gJt3zKO4ml5cAaoa3b1vk+l6KwQsqOBrhSrz/hN1WumVQoSjzkVtvsHVJn5oBaGZS2y6
 w0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XccLLBP9fbRYIFzEXKVSu/gBJa6cdMsyr2qn7Nbznok=;
 b=unxQCDw+i51Rjd5S1awJnnXOqBzQw3XA36C2Ka6ZogNfO5FUImA/klFhMO02EDdFdF
 HDV006TPRedBho+G5KgzcoIn3/P5g2ZWaLDGuWir/61uFhDzZ09iFLCRMWvv7fooFj2S
 qoYJFHtnRhkYphkAdyx5E5OFnlqkq7iBV6IPaQsHz0zzOvQaL7P+UakCKC2Am+B70Pf0
 b5tzx0Vprgepm2gFLEKedFxC9BbZzICYtM670wXH3+5+S763JtipTx+Q5bllUL4pjj43
 oVQ0AFdch1x6GaxWimqjCkWi9Xs5ymzlL0o8UlNZh9BW/1Hou5yGPjRvwffp0ixp+uO7
 U+aA==
X-Gm-Message-State: AOAM533WMEppDZFZV0BxeOJT9dEQs0A5yE6EIiySc2Du3kIyRPfQqdeF
 3WoLbwWQhTRfuVq1uzYaIFCnHg==
X-Google-Smtp-Source: ABdhPJzVLNrNcDLn6wEEouuMkd8Z++tSxcYxH3ylGbIuf4MrUF2yQHmMz/+jFeFirOfZDR+sMtJdjA==
X-Received: by 2002:a19:83c9:: with SMTP id f192mr3746517lfd.148.1604226773613; 
 Sun, 01 Nov 2020 02:32:53 -0800 (PST)
Received: from ubuntu (cable-hki-50dc37-152.dhcp.inet.fi. [80.220.55.152])
 by smtp.gmail.com with ESMTPSA id s7sm1628612ljc.10.2020.11.01.02.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 02:32:53 -0800 (PST)
From: Hassan Shahbazi <hassan.shahbazi@somia.fi>
X-Google-Original-From: Hassan Shahbazi <hassan@ninchat.com>
Date: Sun, 1 Nov 2020 12:32:44 +0200
To: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] staging: fbtft: fb_watterott: fix usleep_range is
 preferred over udelay
Message-ID: <20201101103244.GA284952@ubuntu>
References: <20201101002010.278537-1-hassan@ninchat.com>
 <20201101063948.GB432418@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101063948.GB432418@kroah.com>
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:57 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 01, 2020 at 07:39:48AM +0100, Greg KH wrote:
> On Sun, Nov 01, 2020 at 02:20:10AM +0200, Hassan Shahbazi wrote:
> > Fix the checkpath.pl issue on fb_watterott.c. write_vmem and
> > write_vmem_8bit functions are within non-atomic context and can
> > safely use usleep_range.
> > see Documentation/timers/timers-howto.txt
> > 
> > Signed-off-by: Hassan Shahbazi <hassan@ninchat.com>
> > ---
> >  drivers/staging/fbtft/fb_watterott.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
> > index 76b25df376b8..afcc86a17995 100644
> > --- a/drivers/staging/fbtft/fb_watterott.c
> > +++ b/drivers/staging/fbtft/fb_watterott.c
> > @@ -84,7 +84,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
> >  			par->txbuf.buf, 10 + par->info->fix.line_length);
> >  		if (ret < 0)
> >  			return ret;
> > -		udelay(300);
> > +		usleep_range(300, 310);
> >  	}
> >  
> >  	return 0;
> > @@ -124,7 +124,7 @@ static int write_vmem_8bit(struct fbtft_par *par, size_t offset, size_t len)
> >  			par->txbuf.buf, 10 + par->info->var.xres);
> >  		if (ret < 0)
> >  			return ret;
> > -		udelay(700);
> > +		usleep_range(700, 710);
> 
> How do you know that these ranges are ok?  Are you able to test these
> changes with real hardware?
> 
> thanks,
> 
> greg k-h

No, I don't have the hardware to test with. I just used the current
value as the minimum and added an epsilon to it for the maximum
param.

best, hassan shahbazi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
