Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1C96D8A2
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C14610E122;
	Thu,  5 Sep 2024 12:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CNrm6QW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E009110E122
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:33:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso5994565e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539629; x=1726144429; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwuyy1ZNTgxFINfUg5AqR7+zgE8pTpBHNg7t5awDUAo=;
 b=CNrm6QW3GnumGAAlzKkR7iCMHnmow7CGr+FUSLhjy4qDHtE5KnfhRVWUTRuOL4jNgn
 fk3USR+xQ78XmxEejIHPbphStelX5coltySbe9DbYjxBqq+Y9/XtMWLLhMrsWWxMV6zB
 e4eePsuCARq3J2/j0vI7c88782kaNTtD+QZbT8f2Vs5QMWm1OhbvJd42zvTCtP+BbRNn
 eewD6lz9BN5TXzIRxwZv3Pt9wV5dtFBUD63+gmaSfL4BWDJC0Wp72DD288EvN5h6K0Uw
 nRXwErTq0VyIEZJZXdhtkDb9Muiwa2rvrMzgBe5+T1AmJWdL4Dmt2V5iN2rk7agNlHit
 xw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539629; x=1726144429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwuyy1ZNTgxFINfUg5AqR7+zgE8pTpBHNg7t5awDUAo=;
 b=ZAWijQNpwAqVVQHCFfvpnhqdECzqLK/djPAkao+ds03y6sBVOXw+yEmKEoAUAIn7rs
 zhagq8A+iEcvW1mlslHcSLR3RtEMjW6QFm+JZLDJuHz0BzAXKvt2HBqlduthnAd4t1KQ
 ngu186IQe+yZtLynEgjeF7nBF1ge7Hu9PRxNOMudDptvm9EBHiASQiKS1+cOD1kc1Qwv
 wVlWYk+qDw+9u61UjBWaVaJyxdoUVB5EGxEYjaCiNchVmXuHZ4+4v7h1oq+E9uw44jzY
 aOc/u473XvgsBn1g9h2HxHwjjkAokJYgOV30TmkWY4zni/4SwKk629ebig92QhvdSdNK
 qNcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvxAupxrPNGtVj0Qm9F4TQ3FDcZWVzncQWEpkDUJyFqncV7JaW9s17Arbr3BpUw1eOXSAgKjERDRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE4LErDv8esY/Y+n9Irj1yZJonTHhQ589+Vw2UVHa/0/wNTmzk
 bqSd3qvWZLSMVIfP6Uho/iFxQKvpIYHjXLQNHtoZWC/a74T63txm
X-Google-Smtp-Source: AGHT+IGrgigEpAIROvdA9Bok6YQnXL840jLtlYO2J4UtOSMk3zjwzp97SOCB6TgiRknRHwViOo3xbA==
X-Received: by 2002:a05:600c:a06:b0:42a:a6d2:3270 with SMTP id
 5b1f17b1804b1-42bb01c0f9fmr178461415e9.21.1725539629190; 
 Thu, 05 Sep 2024 05:33:49 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c17fed40csm185844995e9.0.2024.09.05.05.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:33:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 04/15] drm/vkms: Add a validation function for vkms
 configuration
Date: Thu,  5 Sep 2024 14:33:48 +0200
Message-ID: <20240905123348.3077-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-4-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-4-6e179abf9fd4@bootlin.com>
MIME-Version: 1.0
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

> As the configuration will be used by userspace, add a validator to avoid
> creating a broken DRM device

This is something I considered to include in my configfs series, however,
I'm not sure if the set of rules used to validate a device configuration
are already implemented somewhere in the DRM core and we could try to
expose them to avoid duplicating them.

I'd be nice if someone with a better understanding of the DRM core code
could give us some pointers about the best way to implemet these validation
rules.

Also, if we end up implemeting the rules in VKMS, it'd be nice to print
to dmesg some information so the user can figure out what and why failed.

> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c |  5 +++++
>  drivers/gpu/drm/vkms/vkms_config.h | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index ad5d814e6e83..d8348af9587e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -21,6 +21,11 @@ void vkms_config_destroy(struct vkms_config *config)
>  	kfree(config);
>  }
>  
> +bool vkms_config_is_valid(struct vkms_config *config)
> +{
> +	return true;
> +}
> +
>  static int vkms_config_show(struct seq_file *m, void *data)
>  {
>  	struct drm_debugfs_entry *entry = m->private;
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index b28483173874..363f5bc8f64b 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -29,4 +29,18 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
>  struct vkms_config *vkms_config_create(void);
>  void vkms_config_destroy(struct vkms_config *config);
>  
> +/**
> + * vkms_config_is_valid() - Validate a configuration
> + *
> + * Check if all the property defined in the configuration are valids. This will return false for
> + * example if:
> + * - no or many primary planes are present;
> + * - the default rotation of a plane is not in its supported rotation;
> + * - a CRTC don't have any encoder...
> + *
> + * @vkms_config: Configuration to validate
> + */
> +bool vkms_config_is_valid(struct vkms_config *vkms_config);
> +
> +
>  #endif //_VKMS_CONFIG_H
> 
