Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A104B33736A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 14:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0306EC5E;
	Thu, 11 Mar 2021 13:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0066EC5D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 13:08:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a18so1766987wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 05:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qrZXdv7fA+TcxxTTrB5ztlGjFi4s6fIUC/dA2snL+J4=;
 b=H1Mx4eM+pBm8MyWuGXMOKHl3WtuARTV9DvGf+45bIvtmO0jV3xm/8C3F3IzIlvCuWB
 /sJU/QgidjO8Yc7gPPwK3BePumHRo34w09nStf7KTuFip2dqg6aQOUR8jnO1rK8qgpfd
 jV0YXuHYWNxUEr8ckF70BRM49DclZ2EjZg9RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qrZXdv7fA+TcxxTTrB5ztlGjFi4s6fIUC/dA2snL+J4=;
 b=OZHQNVCDGb8VkjeLKOmiCxYPq84q+tgzyuRY+PCo36L/MSUlkIHxQZ1d54RP2EsFNG
 OFPMwLbey/CCmBUwI7iwvHW6/xjeRdtJVluj6O0bzUFtV+z7U9kx6dOSjn1gdV2Atx/C
 7DLndzcAdFBcNRUIJKMJvT8L3ozUsq11eGGN1uzTYq5igaI6aeHNzRRzy2fpDWZX3lTC
 JR3OqkryX0rLxPIdJLsCvcVJoYCBkJAXkjB1XWgc2f09tY7e6v1xQapyp5Fg3RC0xvtF
 5OresMiiauxRqhZfh6nub699etickts1X8ATNJ8ERS5y/gXLKUOGApEMsedHpo52jZpy
 2sYw==
X-Gm-Message-State: AOAM5314StmgeBT9mT0r4oQDw9BZXLAJGjFM1t0VqWu2sy9DjJBfwgRO
 rj1/dK7H1+iJ38ZOMMpDug3CjQ==
X-Google-Smtp-Source: ABdhPJw/Fk5Unx0u9LEM2CG3q6jKm9fGk6h7EJuj5MzNUKYgO1OO/uCt2XtGHsu0Cdq/UlAXo2DtKg==
X-Received: by 2002:a5d:58e8:: with SMTP id f8mr8698775wrd.102.1615468097072; 
 Thu, 11 Mar 2021 05:08:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j12sm3883091wrx.59.2021.03.11.05.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 05:08:16 -0800 (PST)
Date: Thu, 11 Mar 2021 14:08:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH 04/44] vgacon: comment on vga_rolled_over
Message-ID: <YEoWPoXq0Ob5+2yS@phenom.ffwll.local>
Mail-Followup-To: Jiri Slaby <jslaby@suse.cz>, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20210302062214.29627-1-jslaby@suse.cz>
 <20210302062214.29627-4-jslaby@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302062214.29627-4-jslaby@suse.cz>
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 07:21:34AM +0100, Jiri Slaby wrote:
> Long time ago, I figured out what this number is good for and documented
> that locally. But never submitted, so do it now.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

I think Greg volunteered to take care of these ... Also my brain is toast
and I'm not even close to ready to grok vc code to review this properly
:-/

Cheers, Daniel
> ---
>  drivers/video/console/vgacon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
> index 962c12be9774..0d26e821e73b 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -96,7 +96,7 @@ static bool 		vga_is_gfx;
>  static bool 		vga_512_chars;
>  static int 		vga_video_font_height;
>  static int 		vga_scan_lines		__read_mostly;
> -static unsigned int 	vga_rolled_over;
> +static unsigned int 	vga_rolled_over; /* last vc_origin offset before wrap */
>  
>  static bool vgacon_text_mode_force;
>  static bool vga_hardscroll_enabled;
> -- 
> 2.30.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
