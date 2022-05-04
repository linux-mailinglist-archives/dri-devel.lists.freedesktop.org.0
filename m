Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E921519D93
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34BD10F83D;
	Wed,  4 May 2022 11:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917B10F83D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:04:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y3so2126850ejo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pt2TRLKQnwY3ta64YfqAq6YtRrVzSU8ZCieIxo+HibQ=;
 b=NzWxRgjWaJ8cPpwY9gvgAUuop+qGDVwiYic7pmIWcXyzzOBcfNiKWRzkRcM8Jw6G32
 uVvah/flCkBXeajVH1blE7XssB73CDMuhF8mDidJwqtaFZosF76rDlWHgXFESVDRuJix
 ziaaekuqmtOgP+0TK7fChiLLKcioScxsyBI0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pt2TRLKQnwY3ta64YfqAq6YtRrVzSU8ZCieIxo+HibQ=;
 b=o0U+SVbsravrhsHFf6ZzIzsiTUyR+KssvJG+2lQSGmi+VZKs+zXcp2JsS/PzpBF9ZR
 b8e/6MOjyVxEdxUEYD9wGo1UC46f1xoSF2cfL2Bpl08TlpPhNKnzzwD6dUA+G3A+5WII
 61mGedJp7WWkoR1zKNh3JBdp0nRs/Lyup2FLi1oJCixRSILD1faLtkql8lROw7gGUv/x
 irga8XOHmRJUhjq+eDVN7sBex2F8gR8Iipl9QtKkD4JY8FAtE6GKB/VDpzPMaeHiB7HK
 Yn2nEDCXb0lIWkuMEeBx3qZ2BZMsVimjEmu51NbSf7ftu5Tc8dHGviXJvBdDWD/9WT4s
 7+WA==
X-Gm-Message-State: AOAM5317EFK3bP1LLjIRUGW4yg7vgvx93tOCdrhjiCMKbw+Gx774Fsvm
 YMMEZTUsqWgcuwLceUuRG+RQig==
X-Google-Smtp-Source: ABdhPJwghj95RFnq5nKllo8TYcKkXGpBjqk4M/XOmM8QUymJewWgtNHon9mrzNI2z0E79gtgkDiRlQ==
X-Received: by 2002:a17:907:1b14:b0:6ef:a5c8:afbd with SMTP id
 mp20-20020a1709071b1400b006efa5c8afbdmr20130483ejc.151.1651662278526; 
 Wed, 04 May 2022 04:04:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa7cb08000000b0042617ba638csm8916830edt.22.2022.05.04.04.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:04:37 -0700 (PDT)
Date: Wed, 4 May 2022 13:04:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] Revert "fbdev: Make fb_release() return -ENODEV if fbdev
 was unregistered"
Message-ID: <YnJdw89q3vxPGHQJ@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220504105140.746344-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504105140.746344-1-javierm@redhat.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 12:51:40PM +0200, Javier Martinez Canillas wrote:
> This reverts commit aafa025c76dcc7d1a8c8f0bdefcbe4eb480b2f6a. That commit
> attempted to fix a NULL pointer dereference, caused by the struct fb_info
> associated with a framebuffer device to not longer be valid when the file
> descriptor was closed.
> 
> But the solution was wrong since it was just papering over the issue, and
> also would leak any resources that might be reference counted in fb_open.
> 
> Instead, the fbdev drivers that are releasing the fb_info too soon should
> be fixed to prevent this situation to happen.

Maybe add a bit more detail here why this goes boom:

The issue was uncovered by 27599aacbaef ("fbdev: Hot-unplug firmware fb
devices on forced removal"), which added an new path that goes through the
struct device removal instead of directly unregistering the fb. Most fbdev
drivers have issues with the fb_info lifetime, because they directly call
framebuffer_release() from their device driver's ->remove callback,
instead of from fbops->fb_destroy callback. This meant that due to this
switch the fb_info was now destroyed too early, while references still
existed, while before it was simply leaked. The patch we're reverting here
reinstated that leak, hence "fixed" the regression.

With that or similar added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also thinking about this, maybe we should have a WARN_ON in
framebuffer_release if the refcount is elevated, and simply bail out in
that case? That would make this bug a lot easier to debug and less
confusing.

Maybe include that in your series to fix this properly.
-Daniel

> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/video/fbdev/core/fbmem.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 97eb0dee411c..a6bb0e438216 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1434,10 +1434,7 @@ fb_release(struct inode *inode, struct file *file)
>  __acquires(&info->lock)
>  __releases(&info->lock)
>  {
> -	struct fb_info * const info = file_fb_info(file);
> -
> -	if (!info)
> -		return -ENODEV;
> +	struct fb_info * const info = file->private_data;
>  
>  	lock_fb_info(info);
>  	if (info->fbops->fb_release)
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
