Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35A1D2FE4
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5B36EB2E;
	Thu, 14 May 2020 12:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8155E6EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:36:58 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y16so3880960wrs.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ifRD49o1LZImX+UuQT8Fu8icSNPBuzwAgca/8KAC1VQ=;
 b=g4NrS6CmKdjIA9u0pd/FCfKYjI0Z9XIkumKsx1shIlbQFRExMucRX1rpw0LOxfj8rr
 hXllo/f0mA8e1ExqLxmjA+7sXtQwWDq9EVT99apo/NJ3H0me8eGS4kzvi32ZMPw+wZ3N
 Biqqn0plYWKex9E+QKH98mq0oYJt6HtNxZSAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ifRD49o1LZImX+UuQT8Fu8icSNPBuzwAgca/8KAC1VQ=;
 b=rWNGTI0dxjMOUZ+qz5dKQilr4N9xHvwBMOvos6G80mvhjstB/sT1EDaaIQbZye/UEE
 IBygWY9dkjiSpa3iFCjcIWL9k9qN55kg0lv+4gYJb1t2eUf4wP7dR3O3Q16xd4IH+DZM
 tnzbxEJmJ3NjG+KiTR+8qrxav59YhL+yzihT9fotMW54aDGxCaNrrf83s3xkmTyXDI9W
 uUZwc+7gpxHIVGLSb0GIAVKkav+5vB1+jup75JPQTuGM7B4fb1TwBAvuq1dOg9jdz9Sr
 ZXmMPIPD6RngQxGU1/qv+kqmFL24yrnN4+8LZ515VD2euj+wKz8Oyugqc1Ra9fKuet0f
 QLDg==
X-Gm-Message-State: AOAM532X2jY4fqF/Dzuyn3Wc8DbpsUSaulPcDSR/Z2qBC3VjWDmuZmWw
 NgMtY3NDClZ2tTzArq2oQ3sZbw==
X-Google-Smtp-Source: ABdhPJyI/apxDuOLoOJU4jQNgnMw2wloGWznn0DlMO1xwK2hzM6OwLzIDSPZS9HCfxsSgkD8GvupQQ==
X-Received: by 2002:adf:f102:: with SMTP id r2mr5021205wro.376.1589459817152; 
 Thu, 14 May 2020 05:36:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k17sm38882843wmi.10.2020.05.14.05.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:36:56 -0700 (PDT)
Date: Thu, 14 May 2020 14:36:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 08/11] drm: constify sysrq_key_op
Message-ID: <20200514123654.GT206103@phenom.ffwll.local>
Mail-Followup-To: Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-8-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513214351.2138580-8-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 10:43:48PM +0100, Emil Velikov wrote:
> With earlier commits, the API no longer discards the const-ness of the
> sysrq_key_op. As such we can add the notation.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jslaby@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Please keep me in the CC list, as I'm not subscribed to the list.
> 
> IMHO it would be better if this gets merged this via the tty tree.

Shouldn't conflict, looks all reasonable for merging through tty as one
series.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index a9771de4d17e..533767100efe 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -307,13 +307,13 @@ static void drm_fb_helper_sysrq(int dummy1)
>  	schedule_work(&drm_fb_helper_restore_work);
>  }
>  
> -static struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
> +static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
>  	.handler = drm_fb_helper_sysrq,
>  	.help_msg = "force-fb(V)",
>  	.action_msg = "Restore framebuffer console",
>  };
>  #else
> -static struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
> +static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
>  #endif
>  
>  static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
> -- 
> 2.25.1
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
