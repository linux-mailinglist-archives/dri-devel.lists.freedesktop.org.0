Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D6A3217F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 09:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780F510E352;
	Wed, 12 Feb 2025 08:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YI2JsF7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E6810E352
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:52:39 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4394820123dso18321665e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739350357; x=1739955157; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4Fr4WWGFaH9Ao2CehCps/KNMRPCf+PR+0CP2ZhgjC54=;
 b=YI2JsF7+jFOZpMEOHzkm5EABacPQsk6EHR6pvLbrdu6cgH121bpOj9iI0mUKWIKns3
 1IYBrG6FXoMhyv3SV0hGhuxfFXeL0+k+/86/5zTCZ40Fe3ApgBz51dnyLNhbBEM/gAOS
 dsLZ/57gqQd5x7mnyRwi+lYti0jmYSnLoOGHUqO4mpV2Cbuov8L+GEHysm7OaplIXooo
 u+Ob0Hsvvy0lGqo2oRtn5wR2HNWUaMrw27TFdQRgBBquPsNzZSOEr5kjInH/E/xT442z
 C8LxlGUeSI0R+L80PmY1Gg/yJR5AOyt9FQvtjhhxawONahNyy6v03RzZM2CCCeZ6G3bG
 MZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739350357; x=1739955157;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4Fr4WWGFaH9Ao2CehCps/KNMRPCf+PR+0CP2ZhgjC54=;
 b=Inz601SabQXAlF+E3uGjR3Ro82UFoBoqUoS2bAKTayLLU13Ye8TuuAic/FZojvheKA
 izHtTCEv/5n299nEbjR4PDGw6InTr8znLf1PWLTDXqnS4/uzGLM7GIOkjOzSE5oRjJJr
 4Vdb9l22A346ay9CvznjTuYpuDQ183vW9NDv6Ic99u9ydan9d1OKYIKYEOgGj0QpYqHd
 9JUNBMWvAMn1AQAta1Ufe6WIYjBNRbTaCT2bmvr+dOPNK+5uzddhGF89leyk80X0vD5R
 9D+/3yy5sjNbq4WLmGCZRBMyxUOpuwfUcRqRe2zfr8rzroG6wG2mfg4daiqDl+RmCwCA
 zQoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVabfjR4pGv6ixMUH8FzJnHswrDFOXiPSIg0apiNZrvULIWtJGJ8yA1msrLiXIOmqNKUND7IpnUzV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFg+ErL0i07FRHJfGPVfcjwNMFXKsjk7psbfDUAVtGHmWbgrz4
 oU/+8kA9IEfWMTZW5ZeozdQvi81/mirndEAj7pu567tgQ+rm4fzN
X-Gm-Gg: ASbGncuUmw0gRAg+KcDlDyspB8I3hP9HRysFeSChONBY4OKO1wGt+ChxjgoFxMyMrMB
 i06/seMMOPZrlw+yeZhNAgSSZUMzp9bZr61L59r+1MQuITEPwQSyfbg1rmpgy15YYdF8tmX2nNy
 TNiOE9Ld1/3rm9gkp0ThNxWXjY21yBKhfs+g2F8v8LQK/ShpKnyTbQxJ5S+Q6RqkSo0XHrrOqwT
 6SfJQUNMbkduWUp8xMgC7Is6TTBaM6xFnGDm6QBCuu0P3TdK/8NFNGB/Zi2jw9EgrJGRXzVDaQm
 uAXp9g1PIvbEvA==
X-Google-Smtp-Source: AGHT+IEykSFyZijWB0AYHLFlfKFLHxSfMlUJsiileUyyDk2HhDRhvh/rLJzlnEP3Glj5NtvWiOYE/w==
X-Received: by 2002:a05:600c:1d1b:b0:434:a468:4a57 with SMTP id
 5b1f17b1804b1-439581bfdc2mr17243385e9.26.1739350357417; 
 Wed, 12 Feb 2025 00:52:37 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dca0b4237sm14066442f8f.85.2025.02.12.00.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 00:52:37 -0800 (PST)
Date: Wed, 12 Feb 2025 09:52:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, simona@ffwll.ch,
 melissa.srw@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/15] drm/vkms: Fix use after free and double free on
 init error
Message-ID: <Z6xhU328loIH_5lQ@fedora>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-2-jose.exposito89@gmail.com>
 <428f88f2-1f30-4018-8113-1c4716288789@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <428f88f2-1f30-4018-8113-1c4716288789@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Feb 11, 2025 at 03:33:55PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.02.25 um 12:08 schrieb José Expósito:
> > If the driver initialization fails, the vkms_exit() function might
> > access an uninitialized or freed default_config pointer and it might
> > double free it.
> > 
> > Fix both possible errors by initializing default_config only when the
> > driver initialization succeeded.
> 
> Could you send this patch separately, so that it can go into drm-misc-fixes
> quickly?

Sure, I just sent it as a separate patch.

Thanks,
Jose
 
> Best regards
> Thomas
> 
> > 
> > Reported-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Link: https://lore.kernel.org/all/Z5uDHcCmAwiTsGte@louis-chauvet-laptop/
> > Fixes: 2df7af93fdad ("drm/vkms: Add vkms_config type")
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >   drivers/gpu/drm/vkms/vkms_drv.c | 15 +++++++++------
> >   1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 7c142bfc3bd9..b6de91134a22 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -235,17 +235,19 @@ static int __init vkms_init(void)
> >   	if (!config)
> >   		return -ENOMEM;
> > -	default_config = config;
> > -
> >   	config->cursor = enable_cursor;
> >   	config->writeback = enable_writeback;
> >   	config->overlay = enable_overlay;
> >   	ret = vkms_create(config);
> > -	if (ret)
> > +	if (ret) {
> >   		kfree(config);
> > +		return ret;
> > +	}
> > -	return ret;
> > +	default_config = config;
> > +
> > +	return 0;
> >   }
> >   static void vkms_destroy(struct vkms_config *config)
> > @@ -269,9 +271,10 @@ static void vkms_destroy(struct vkms_config *config)
> >   static void __exit vkms_exit(void)
> >   {
> > -	if (default_config->dev)
> > -		vkms_destroy(default_config);
> > +	if (!default_config)
> > +		return;
> > +	vkms_destroy(default_config);
> >   	kfree(default_config);
> >   }
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
