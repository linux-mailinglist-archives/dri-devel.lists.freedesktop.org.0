Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4A529C872
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 20:14:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E786EC19;
	Tue, 27 Oct 2020 19:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282326EC19
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:13:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c194so2422129wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=P3J/+0GiuC41DT0MOvT+FF9RAHnRvTVHa938Xwr2s1o=;
 b=iAotOM6WKIuDQ6FgXb5rOAYby/U4SAR7GX1dfobxCt0NUEUYvR3JU5IbXXXzzEzb+x
 NVw1W6NV+zW7ZjBUjaeVYKNjF3on3pNs1Hgp6GQgb8ezNmvtVbTVJ9+wG1SxiBt1nZ0N
 E1jWM77BDsGkX6UGDdQshv1RZmgj9/9Fqg5Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=P3J/+0GiuC41DT0MOvT+FF9RAHnRvTVHa938Xwr2s1o=;
 b=OPvgvZZMO1c9s+Ox469MJe0g+6/bh7YcRcG8OKMgamgHuHpbC80GGX+P1T4tGisPe1
 jA8E2gP0+2o91oXIEXXJE/YwP0JOmHVxg3/if/qhh6p3G3nF5JNDsY65veZ6RrGxfA4t
 s7+GpripLYq29rPlWLQd+gtOEHA2rpW/o2R4x/2Z7p7LqQyDOZa0vjTfI6190cPo8UTx
 gFVCDlHggEdHUWFO+YC2jn5Gs6JNZUGBAuJkgnMMG+3nILBkiNfJTojwRe7yNOVfIqrI
 LPi1XiXvaiW4o3i2K6+H0hc8ZosvKPEjSpRtMRuVWtEByqbdmc8jMwq3EpJN9o9NWtdI
 So6w==
X-Gm-Message-State: AOAM53277+F9PkERnmCvwGf8oXfGCi5qSkEpw0Ghsk7wj9MjspCTzObR
 Q5oZ7OpvUWbOQpxkrRjf4+I4nw==
X-Google-Smtp-Source: ABdhPJxjvWUPnbB7pc9K8JYx7BBlTro1Je2YY0UCsz4EPGzzcVzaADg0zmoo0CDvgaDra903bJTkUw==
X-Received: by 2002:a1c:e919:: with SMTP id q25mr4233791wmc.142.1603826035820; 
 Tue, 27 Oct 2020 12:13:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m1sm3070487wmm.34.2020.10.27.12.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:13:55 -0700 (PDT)
Date: Tue, 27 Oct 2020 20:13:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 4/5] fbcon: Avoid hard-coding built-in font charcount
Message-ID: <20201027191353.GO401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
 <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 12:37:29PM -0400, Peilin Ye wrote:
> fbcon_startup() and fbcon_init() are hard-coding the number of characters
> of our built-in fonts as 256. Recently, we included that information in
> our kernel font descriptor `struct font_desc`, so use `font->charcount`
> instead of a hard-coded value.
> 
> This patch depends on patch "Fonts: Add charcount field to font_desc".
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

So I think this is correct, but it also doesn't do a hole lot yet. fbcon.c
still has tons of hard-coded 256 all over, and if (p->userfont).

I think if we instead set vc->vc_font.charcount both in fbcon_init and in
fbcon_do_set_font (probably just replace the userfont parameter with
font_charcount for now), then we could replace these all with
vc->vc_font.charcount. And the code would already improve quite a bit I
think.

With just this change here I think we have even more inconsistency, since
for built-in fonts vc->vc_font.charcount is now set correctly, but for
userfonts we need to instead look at FNTCHARCNT(vc->vc_font.data).

We'd still need to maintain p->userfont because of the refcount chaos, but
that is much more work.

Or do I miss something here?
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index cef437817b0d..e563847991b7 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1004,7 +1004,7 @@ static const char *fbcon_startup(void)
>  		vc->vc_font.width = font->width;
>  		vc->vc_font.height = font->height;
>  		vc->vc_font.data = (void *)(p->fontdata = font->data);
> -		vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> +		vc->vc_font.charcount = font->charcount;
>  	} else {
>  		p->fontdata = vc->vc_font.data;
>  	}
> @@ -1083,8 +1083,7 @@ static void fbcon_init(struct vc_data *vc, int init)
>  			vc->vc_font.width = font->width;
>  			vc->vc_font.height = font->height;
>  			vc->vc_font.data = (void *)(p->fontdata = font->data);
> -			vc->vc_font.charcount = 256; /* FIXME  Need to
> -							support more fonts */
> +			vc->vc_font.charcount = font->charcount;
>  		}
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
