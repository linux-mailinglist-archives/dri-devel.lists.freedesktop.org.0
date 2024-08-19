Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818D956E3A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1F710E2B6;
	Mon, 19 Aug 2024 15:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f92iy1zC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A409810E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:07:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42817bee9e8so34380525e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724080059; x=1724684859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VDuEF/M0sRtn0Nnhbuwdy99rZg4XrOo8Jz9M322w1Qk=;
 b=f92iy1zCsrcJC4XMkvnjL3AMy3TSvUcWUvPQOX0HvGmP+8qyUW9gXAAYNu7dFXx8HC
 V8aHcqxv0VeMb8V7axuYn8/boG4dkzmivJrFVvIbU4Dbu9bCBHH3SNy5usz3236x7KdD
 IQD+xUXqqetEfmARPuJ2zpUXBifJJUu2QgoshmTdEKbV9j56oHjQITMuhwkSDNBVkzK8
 EiVhRnXfMK37i4ql517rjzzcm5nSXg9/Qwp3KPi5k1GqHMg1n1skIDWykbgrUFnM6Ofu
 VBu5K8WI8quLy8MPDRIOJIpeilx7EwTu8dSakgiZy+jwD+ts1Ms3S7LHQteTOa+rB84d
 1XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724080059; x=1724684859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VDuEF/M0sRtn0Nnhbuwdy99rZg4XrOo8Jz9M322w1Qk=;
 b=Ti1GZCf983zfm/pDjwwoeUxEfjNAI0kC/qV7qSPscdKmQdW00CC5Dt5qPFy8ZISoyj
 QHIpDBw8lm4y8C+8wpR0u7Ac3R1PNoB8wp9HFjtP7FmOVaPd4G8OVljkcPZemiw75uA/
 YShfFBlK3Ls/470m71FWlUM5Yzu6uOS12YsSEpjVUEiM6rVCm6LFJPTJ9JE35Y15XbVo
 aDIPEITo/rdLdBO7FzBtp7ObbtbjoAXjce45+Nb2e/lWEiV/sDbCtSPwrKbPjK4C4lZV
 crwSf+F/j1/ORM5eLf2o1gRaY2si/bBKKPz9aNCEDbbPKCkDqXpaj/eo5a3wzXNartQh
 69jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV64Y6yfppUBCECM6h2m6E2EEd5+kiq07beC9RbeNZN//bkBHgTk0aTPvYvtMK3t7XaVdRn9lN2n6LuR9RPGaiJlil9073QhBWtvf28p2ca
X-Gm-Message-State: AOJu0YxECS7dByNC6EldHAHuO9sK3umb7M94cgvLnzXdQeujqWaUDP5w
 xYukSM7WirhvLhJxvJqRRHB9rWHU3Eo+flUpv+eushMSO3gAoniM
X-Google-Smtp-Source: AGHT+IFzlOpU+prBYB9wMf99ByrRAx9YP54K/H6BHsBiTC+SMhLeA4EqzVFDwZ4PXZgX5PUy3M195g==
X-Received: by 2002:a05:600c:4688:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-429ed79dc4dmr79399085e9.10.1724080058498; 
 Mon, 19 Aug 2024 08:07:38 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded287d0sm168635185e9.12.2024.08.19.08.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 08:07:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH 3/3] drm/vkms: Add documentation
Date: Mon, 19 Aug 2024 17:07:36 +0200
Message-ID: <20240819150736.16839-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-clarifications-v1-3-3ee76d7d0c28@bootlin.com>
References: <20240814-google-clarifications-v1-3-3ee76d7d0c28@bootlin.com>
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

Hi Louis,

Thanks for this patch, adding some minor review comments:

> Add documentation around vkms_output and its initialization.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    | 81 ++++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/vkms/vkms_output.c | 12 +++++-
>  2 files changed, 80 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 3028678e4f9b..8f6c9e67e671 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -147,29 +147,51 @@ struct vkms_color_lut {
>  };
>  
>  /**
> - * vkms_crtc_state - Driver specific CRTC state
> + * struct vkms_crtc_state - Driver specific CRTC state

Not in this line, but around line 55, the documentation for vkms_plane_state
is missing the "struct" keyword:

- * vkms_plane_state - Driver specific plane state
+ * struct vkms_plane_state - Driver specific plane state

I'd be nice to add it since we are improving the documentation.

> + *
>   * @base: base CRTC state
>   * @composer_work: work struct to compose and add CRC entries
> - * @n_frame_start: start frame number for computed CRC
> - * @n_frame_end: end frame number for computed CRC
> + *
> + * @num_active_planes: Number of active planes
> + * @active_planes: List containing all the active planes (counted by
> + *  @num_active_planes). They should be stored in z-order.
> + * @active_writeback: Current active writeback job
> + * @gamma_lut: Look up table for gamma used in this CRTC
> + * @crc_pending: Protected by @vkms_output.composer_lock.
> + * @wb_pending: Protected by @vkms_output.composer_lock.
> + * @frame_start: Protected by @vkms_output.composer_lock.
> + * @frame_end: Protected by @vkms_output.composer_lock.
>   */
>  struct vkms_crtc_state {
>  	struct drm_crtc_state base;
>  	struct work_struct composer_work;
>  
>  	int num_active_planes;
> -	/* stack of active planes for crc computation, should be in z order */
>  	struct vkms_plane_state **active_planes;
>  	struct vkms_writeback_job *active_writeback;
>  	struct vkms_color_lut gamma_lut;
>  
> -	/* below four are protected by vkms_output.composer_lock */
>  	bool crc_pending;
>  	bool wb_pending;
>  	u64 frame_start;
>  	u64 frame_end;
>  };
>  
> +/**
> + * struct vkms_output - Internal representation of all output components in vkms

I think that VKMS is usually spelled in capital letters in other places.

> + *
> + * @crtc: Base crtc in drm
> + * @encoder: DRM encoder used for this output
> + * @connector: DRM connector used for this output
> + * @wb_connecter: DRM writeback connector used for this output
> + * @vblank_hrtimer:
> + * @period_ns:

My suggestion when reviewing a previous version of this patch in your
GitHub fork was:

 @vblank_hrtimer: Timer used to simulate vblank events
 @period_ns: vblank period, in nanoseconds

> + * @composer_workq: Ordered workqueue for composer_work
> + * @lock: Lock used to project concurrent acces to the composer
> + * @composer_enabled: Protected by @lock.
> + * @composer_state:

I think that @composer_state is "Protected by @lock" as well.

> + * @composer_lock: Lock used internally to protect @composer_state members
> + */
>  struct vkms_output {
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> @@ -177,28 +199,38 @@ struct vkms_output {
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> -	/* ordered wq for composer_work */
>  	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
>  	spinlock_t lock;
>  
> -	/* protected by @lock */
>  	bool composer_enabled;
>  	struct vkms_crtc_state *composer_state;
>  
>  	spinlock_t composer_lock;
>  };
>  
> -struct vkms_device;
> -
> +/**
> + * struct vkms_config - General configuration for VKMS driver
> + *
> + * @writeback: If true, a writeback buffer can be attached to the CRTC
> + * @cursor: If true, a cursor plane is created in the VKMS device
> + * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
> + * @dev: Used to store the current vkms device. Only set when the device is instancied.

s/vkms/VKMS and s/instancied/instantiated

> + */
>  struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
> -	/* only set when instantiated */
>  	struct vkms_device *dev;
>  };
>  
> +/**
> + * struct vkms_device - Description of a vkms device

s/vkms/VKMS

> + *
> + * @drm - Base device in drm
> + * @platform - Associated platform device
> + * @output - Configuration and sub-components of the vkms device

s/vkms/VKMS

> + * @config: Configuration used in this vkms device

s/vkms/VKMS

> + */
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> @@ -206,6 +238,10 @@ struct vkms_device {
>  	const struct vkms_config *config;
>  };
>  
> +/*
> + * The following helpers are used to convert a member of a struct into its parent.
> + */
> +
>  #define drm_crtc_to_vkms_output(target) \
>  	container_of(target, struct vkms_output, crtc)
>  
> @@ -218,12 +254,33 @@ struct vkms_device {
>  #define to_vkms_plane_state(target)\
>  	container_of(target, struct vkms_plane_state, base.base)
>  
> -/* CRTC */
> +/**
> + * vkms_crtc_init() - Initialize a crtc for vkms

s/vkms/VKMS

> + * @dev: drm_device associated with the vkms buffer

s/vkms/VKMS

> + * @crtc: uninitialized crtc device
> + * @primary: primary plane to attach to the crtc
> + * @cursor plane to attach to the crtc
> + */
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
> +/**
> + * vkms_output_init() - Initialize all sub-components needed for a vkms device.

s/vkms/VKMS

> + *
> + * @vkmsdev: vkms device to initialize

s/vkms/VKMS

> + * @possible_crtc_index: Crtc which can be attached to the planes. The caller must ensure that
> + * possible_crtc_index is positive and less or equals to 31.

Missing "@". Also, since the second patch of this series won't be applied,
remember to rename the documentation to "@index".
> + */
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
>  
> +/**
> + * vkms_plane_init() - Initialize a plane
> + *
> + * @vkmsdev: vkms device containing the plane

s/vkms/VKMS

> + * @type: type of plane to initialize
> + * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
> + * possible_crtc_index is positive and less or equals to 31.
> + */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  				   enum drm_plane_type type, int possible_crtc_index);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index d42ca7d10389..36db2c8923cb 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -21,6 +21,7 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
>  	int count;
>  
> +	/* Use the default modes list from drm */
>  	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
>  	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
>  
> @@ -58,8 +59,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  	int writeback;
>  	unsigned int n;
>  
> +	/*
> +	 * Initialize used plane. One primary plane is required to perform the composition.
> +	 *
> +	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> +	 * composition.
> +	 */
>  	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc_index);
> -
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> @@ -96,6 +102,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
>  	}
> +	/*
> +	 * This is an hardcoded value to select crtc for the encoder.

s/an/a

> +	 * 1 here designate the first registered CRTC, the one allocated in [1]
> +	 */

I think that replacing "= 1;" with "= BIT(0);" might help to understand
that possible_crtcs is a bitmask and also that CRTC 0 is used by default.
We might even be able to drop the comment... Even though this will change
with our configfs changes quite a lot.

>  	encoder->possible_crtcs = 1;
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
