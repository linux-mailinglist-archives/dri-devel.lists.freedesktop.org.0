Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A89646CB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D84210E0EA;
	Thu, 29 Aug 2024 13:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BUuFgBlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184210E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:36:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EAE94000B;
 Thu, 29 Aug 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724938609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oj4RcjtjNEqx6JS5AmpNWk5GQ8DJcRGL7kAtiI3DBlo=;
 b=BUuFgBlZklhc1JR5srZqZqEejVC7+o3TCG73l23VPg80gp4c9pJ7OXbm03T9p/GIXLcemz
 u0b6DkNxB0R1oEbkKbcdNOIPb6tGBVgHpx2z8uvvbPvEkCzdljc3sM//Dj0u8XiRn0vD1F
 ntTWr8aJp3aJnx8nEfRFpu4gRdGqRb+MW/HRpGVZxz3xHllaBinPrrVGIdq8oJOiqb3qg7
 59gXxd7xWEIFzvuZ8c8HnwY8WOdSK4gD3jWAtwOonO+FE+v49zHWgfhHsaMvfg7vkaXZKR
 2X9kylIj/idD81BtGDxvwimdVQc/hE4pkL6/71v0QcYxg3I1r/K9Aa4tBPPymw==
Date: Thu, 29 Aug 2024 15:36:47 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v2] drm/vkms: Add documentation
Message-ID: <ZtB5b36il_s_kYIe@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
References: <20240826-google-clarifications-v2-1-2574655b0b91@bootlin.com>
 <20240827174903.2774-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827174903.2774-1-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 27/08/24 - 19:49, José Expósito a écrit :
> Hi Louis,
> 
> > Add documentation around vkms_output and its initialization.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > This series does not introduce functionnal changes, only some
> > documentation and renaming to clarify the code.
> > ---
> > Changes in v2:
> > - Dropped already applied patches
> > - Dropped useless patch as its content is deleted later
> > - Remove dependency on previous series
> > - Apply Maíra's comments
> > - Link to v1: https://lore.kernel.org/r/20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com
> 
> I think you missed my email in the previous patch:
> https://patchwork.kernel.org/project/dri-devel/patch/20240814-google-clarifications-v1-3-3ee76d7d0c28@bootlin.com/#25983103
> 
> Minor comments, but it'd be nice to get them fixed if possible.

Yes, sorry! The v3 is in your inbox.
Thanks for the review!

Louis Chauvet
 
> Jose
> 
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h    | 86 ++++++++++++++++++++++++++++++++------
> >  drivers/gpu/drm/vkms/vkms_output.c | 12 ++++++
> >  2 files changed, 86 insertions(+), 12 deletions(-)
> > 
> > 
> > ---
> > base-commit: 22bc22ccf95bfa6eb6288ba4bc33d7fc0078381e
> > change-id: 20240520-google-clarifications-dede8dcbe38a
> > 
> > Best regards,
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 5e46ea5b96dc..1fc068d4de4c 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -73,29 +73,56 @@ struct vkms_color_lut {
> >  };
> >  
> >  /**
> > - * vkms_crtc_state - Driver specific CRTC state
> > + * struct vkms_crtc_state - Driver specific CRTC state
> > + *
> >   * @base: base CRTC state
> >   * @composer_work: work struct to compose and add CRC entries
> > - * @n_frame_start: start frame number for computed CRC
> > - * @n_frame_end: end frame number for computed CRC
> > + *
> > + * @num_active_planes: Number of active planes
> > + * @active_planes: List containing all the active planes (counted by
> > + *  @num_active_planes). They should be stored in z-order.
> > + * @active_writeback: Current active writeback job
> > + * @gamma_lut: Look up table for gamma used in this CRTC
> > + * @crc_pending: Protected by @vkms_output.composer_lock, true when the frame CRC is not computed
> > + *		 yet. Used by vblank to detect if the composer is too slow.
> > + * @wb_pending: Protected by @vkms_output.composer_lock, true when a writeback frame is requested.
> > + * @frame_start: Protected by @vkms_output.composer_lock, saves the frame number before the start
> > + *		 of the composition process.
> > + * @frame_end: Protected by @vkms_output.composer_lock, saves the last requested frame number.
> > + *	       This is used to generate enough CRC entries when the composition worker is too slow.
> >   */
> >  struct vkms_crtc_state {
> >  	struct drm_crtc_state base;
> >  	struct work_struct composer_work;
> >  
> >  	int num_active_planes;
> > -	/* stack of active planes for crc computation, should be in z order */
> >  	struct vkms_plane_state **active_planes;
> >  	struct vkms_writeback_job *active_writeback;
> >  	struct vkms_color_lut gamma_lut;
> >  
> > -	/* below four are protected by vkms_output.composer_lock */
> >  	bool crc_pending;
> >  	bool wb_pending;
> >  	u64 frame_start;
> >  	u64 frame_end;
> >  };
> >  
> > +/**
> > + * struct vkms_output - Internal representation of all output components in vkms
> > + *
> > + * @crtc: Base CRTC in DRM
> > + * @encoder: DRM encoder used for this output
> > + * @connector: DRM connector used for this output
> > + * @wb_connecter: DRM writeback connector used for this output
> > + * @vblank_hrtimer: Timer used to trigger the vblank
> > + * @period_ns: Period of the vblank timer, used to configure @vblank_hrtimer and to compute
> > + *	       vblank timestamps
> > + * @composer_workq: Ordered workqueue for @composer_state.composer_work.
> > + * @lock: Lock used to protect concurrent access to the composer
> > + * @composer_enabled: Protected by @lock, true when the vkms composer is active (crc needed or
> > + *		      writeback)
> > + * @composer_state: Current state of this vkms output
> > + * @composer_lock: Lock used internally to protect @composer_state members
> > + */
> >  struct vkms_output {
> >  	struct drm_crtc crtc;
> >  	struct drm_encoder encoder;
> > @@ -103,28 +130,38 @@ struct vkms_output {
> >  	struct drm_writeback_connector wb_connector;
> >  	struct hrtimer vblank_hrtimer;
> >  	ktime_t period_ns;
> > -	/* ordered wq for composer_work */
> >  	struct workqueue_struct *composer_workq;
> > -	/* protects concurrent access to composer */
> >  	spinlock_t lock;
> >  
> > -	/* protected by @lock */
> >  	bool composer_enabled;
> >  	struct vkms_crtc_state *composer_state;
> >  
> >  	spinlock_t composer_lock;
> >  };
> >  
> > -struct vkms_device;
> > -
> > +/**
> > + * struct vkms_config - General configuration for VKMS driver
> > + *
> > + * @writeback: If true, a writeback buffer can be attached to the CRTC
> > + * @cursor: If true, a cursor plane is created in the VKMS device
> > + * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
> > + * @dev: Used to store the current vkms device. Only set when the device is instantiated.
> > + */
> >  struct vkms_config {
> >  	bool writeback;
> >  	bool cursor;
> >  	bool overlay;
> > -	/* only set when instantiated */
> >  	struct vkms_device *dev;
> >  };
> >  
> > +/**
> > + * struct vkms_device - Description of a vkms device
> > + *
> > + * @drm - Base device in DRM
> > + * @platform - Associated platform device
> > + * @output - Configuration and sub-components of the vkms device
> > + * @config: Configuration used in this vkms device
> > + */
> >  struct vkms_device {
> >  	struct drm_device drm;
> >  	struct platform_device *platform;
> > @@ -132,6 +169,10 @@ struct vkms_device {
> >  	const struct vkms_config *config;
> >  };
> >  
> > +/*
> > + * The following helpers are used to convert a member of a struct into its parent.
> > + */
> > +
> >  #define drm_crtc_to_vkms_output(target) \
> >  	container_of(target, struct vkms_output, crtc)
> >  
> > @@ -144,12 +185,33 @@ struct vkms_device {
> >  #define to_vkms_plane_state(target)\
> >  	container_of(target, struct vkms_plane_state, base.base)
> >  
> > -/* CRTC */
> > +/**
> > + * vkms_crtc_init() - Initialize a CRTC for vkms
> > + * @dev: DRM device associated with the vkms buffer
> > + * @crtc: uninitialized CRTC device
> > + * @primary: primary plane to attach to the CRTC
> > + * @cursor plane to attach to the CRTC
> > + */
> >  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >  		   struct drm_plane *primary, struct drm_plane *cursor);
> >  
> > +/**
> > + * vkms_output_init() - Initialize all sub-components needed for a vkms device.
> > + *
> > + * @vkmsdev: vkms device to initialize
> > + * @possible_crtc_index: CRTC which can be attached to the planes. The caller must ensure that
> > + * possible_crtc_index is positive and less or equals to 31.
> > + */
> >  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> >  
> > +/**
> > + * vkms_plane_init() - Initialize a plane
> > + *
> > + * @vkmsdev: vkms device containing the plane
> > + * @type: type of plane to initialize
> > + * @possible_crtc_index: CRTC which can be attached to the plane. The caller must ensure that
> > + * possible_crtc_index is positive and less or equals to 31.
> > + */
> >  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> >  				   enum drm_plane_type type, int index);
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 5ce70dd946aa..da69beb43ab0 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -21,6 +21,7 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
> >  {
> >  	int count;
> >  
> > +	/* Use the default modes list from DRM */
> >  	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> >  	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> >  
> > @@ -58,6 +59,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  	int writeback;
> >  	unsigned int n;
> >  
> > +	/*
> > +	 * Initialize used plane. One primary plane is required to perform the composition.
> > +	 *
> > +	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> > +	 * composition.
> > +	 */
> >  	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> >  	if (IS_ERR(primary))
> >  		return PTR_ERR(primary);
> > @@ -76,6 +83,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  			return PTR_ERR(cursor);
> >  	}
> >  
> > +	/* [1]: Allocation of a CRTC, its index will be 1 */
> >  	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> >  	if (ret)
> >  		return ret;
> > @@ -95,6 +103,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
> >  		DRM_ERROR("Failed to init encoder\n");
> >  		goto err_encoder;
> >  	}
> > +	/*
> > +	 * This is an hardcoded value to select crtc for the encoder.
> > +	 * 1 here designate the first registered CRTC, the one allocated in [1]
> > +	 */
> >  	encoder->possible_crtcs = 1;
> >  
> >  	ret = drm_connector_attach_encoder(connector, encoder);
> 
