Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8138FA13E71
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E2610E091;
	Thu, 16 Jan 2025 15:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="deyAyeLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07C010E091
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:56:11 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43635796b48so7409715e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737042910; x=1737647710; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ipXXq8RDzGtjCL4rhS+FjInCIhtOTIGOxDGy8AYY1JY=;
 b=deyAyeLdNa/YXy5Z47nfh68GCODqRMlwkrOaP7K7IDercrM7b+b0dDSN7yTM8xt8eG
 Za/juAU6vGrtrxKT6+O/6GdIoyxOBS47moHY9JgXsS4fWLOBQs/uO9bNImERbqNHoMsf
 bDfRGa0ZlKuxOo7612fQTnla7YIh81K5aHzRxHpnqEgXz2TOjS9cY346rO65SfmEFJzh
 s6y1+1+87yDIrF5+i14njrcV5P0nnPaYLU8PN+k7BkC5Cicvy+1ngn5RS3ojLeqJ0CVt
 Kz1QU1B7i8oo3ukbgJsfrD9xbnX54JHPFtFk/1pg62bZt3wZN+uRnRusOmtDRG3mhzX9
 5G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042910; x=1737647710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ipXXq8RDzGtjCL4rhS+FjInCIhtOTIGOxDGy8AYY1JY=;
 b=ZK+puF0IzlL3rflXVnx3dID4SUfyqPfUK2CrhSqBVr6mTV5HfGtm2pRAT4vPVekpDH
 +DnxnoltvmkB0Y4eK4pYy0oYz/QJKnAIDd/Ii1RazfEjrIE/EEemyZFzwMBjaJDaRXRo
 aPAaUxeeyQ+T/kD60yqqOjZpZDld/DaiV9ODMbqygKwW7JDrhZDtMx8zEzvo4++e94A5
 lIgK+jU0nWNyF3UsCwldRgLMat/5a30ZD+oOwLN40wmbtrgfEL+nhZbG5EXDTwJ4IyYt
 wSsV4F+okq87weqwiprRw+a3jtnWVy5ezFq2FxKygWO+QNfxDr8CQzt7UAJE8Wfeyr5/
 7+BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWJWpiivT3pqXWau47EVAMbDYPFyuLefcSHK5y3qpjuAIlCA6KflTUxUsBdJG7cigEy4q+YkFnY9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbUcldfpKu2AXnQuUPPgSiKDuNrzJfjwUhubgEqzMaLTQOKPzQ
 3B1EE4DB+8GqyEmu8dmh/WRNfhZoea3eoDKpZmSjOhjtVid0e3t7
X-Gm-Gg: ASbGncuw119+bTsDEtYuMMNTsqycnd7jgdm+OzWV1U0giM0GP5GTI8pMh2RqC6iuD3C
 1WQXE+EXRa41m7sbmPM9VpoV6TlyAuEozgIRAdqBM7b1o4qYZ/9NcVjvKezt5QFQ3ezRWF2yqZY
 xkWKw0nCBa2cgSTzu3ypQAWfGJ53SRUdCUARKPogq+0RHcb5ZSrCf3C63Miw8d6/e87hmiwQRZE
 giEUUHKmN7Tr+mIi8ekxxh1SmMQnn+XCtdJKbGHkkZHktiJRWTlB3mW0g==
X-Google-Smtp-Source: AGHT+IEpRyrrW3YyEx6ouKaFnnsoiFIsOVnIEBjt4llBGWy91vd5zqqCb3uvNB53PtG0NhUma5kU2g==
X-Received: by 2002:a05:600c:4f55:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-437c6b468a7mr70363085e9.13.1737042910175; 
 Thu, 16 Jan 2025 07:55:10 -0800 (PST)
Received: from fedora.. ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c73e7140sm64981505e9.0.2025.01.16.07.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:55:09 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v8 4/8] drm/vkms: Switch to managed for crtc
Date: Thu, 16 Jan 2025 16:55:06 +0100
Message-ID: <20250116155507.3491-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114-google-vkms-managed-v8-4-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-4-da4254aa3dd5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

> The current VKMS driver uses managed function to create crtc, but
> don't use it to properly clean the crtc workqueue. It is not an
> issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks!

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++++-
>  drivers/gpu/drm/vkms/vkms_drv.c  | 9 ---------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 28a57ae109fcc05af3fe74f94518c462c09119e3..434c35d5e9477d2961826262591db8ab43838e09 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -4,6 +4,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -296,7 +297,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
>  
> -	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> +	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
> +	if (IS_ERR(vkms_out->composer_workq))
> +		return PTR_ERR(vkms_out->composer_workq);
>  	if (!vkms_out->composer_workq)
>  		return -ENOMEM;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e0409aba93496932b32a130ebb608ee53b1a9c59..7c142bfc3bd9de9556621db3e7f570dc0a4fab3a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
>  
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
> -static void vkms_release(struct drm_device *dev)
> -{
> -	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
> -
> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> -}
> -
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *dev = old_state->dev;
> @@ -108,7 +100,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
>  
>  static const struct drm_driver vkms_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
> -	.release		= vkms_release,
>  	.fops			= &vkms_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  	DRM_FBDEV_SHMEM_DRIVER_OPS,
> 
