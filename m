Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCF9534D7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A2310E44A;
	Thu, 15 Aug 2024 14:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T++eLcfF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C310E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6PjGgizeLL+ahPBbPESs3O3FYweeeVdNOt3xv/pMJ8=; b=T++eLcfFeWtNUetoGepup4YDPd
 kfLZCWcz5zyJAGh2uEWoz/O7YNf3oGaSmAiAUF3oe/xTqw2obSM2VM+zAyjNv552ozE37zuIms6u+
 Ii3b5CCiZ82lD+wfBfCBxxce/K7A9YTnxxorhuKGPFtn47augUZVvNC9op6Ju2lORoxLJN+eMNJq3
 2feVmd6XSydv0lVyR3xs8KP5zyXO/btJGCohLJYwSWdVpn75jK8rwlEjIxV0iaTE8IN2xa6M5GaI5
 FoJOZLiiz7Vmzca+LZngWIZ+3uHYw+9UALuQAoqVoqDfovlKcaDrdwa/6O9TkP/LDUDJIIIAMul2R
 Ks9EmSgw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sebV5-000eI3-MH; Thu, 15 Aug 2024 16:30:51 +0200
Message-ID: <92d1a047-2756-4f69-acc0-b6b161399783@igalia.com>
Date: Thu, 15 Aug 2024 11:30:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/vkms: Add documentation
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
 <20240814-google-clarifications-v1-3-3ee76d7d0c28@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240814-google-clarifications-v1-3-3ee76d7d0c28@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

I'd make this patch more incremental. First, send me a patch based on
drm-misc-next with the new documentation for the things that already
exists. Then, when you add a new field, you add the documentation with
it.

On 8/14/24 05:47, Louis Chauvet wrote:
> Add documentation around vkms_output and its initialization.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_drv.h    | 81 ++++++++++++++++++++++++++++++++------
>   drivers/gpu/drm/vkms/vkms_output.c | 12 +++++-
>   2 files changed, 80 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 3028678e4f9b..8f6c9e67e671 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -147,29 +147,51 @@ struct vkms_color_lut {
>   };
>   
>   /**
> - * vkms_crtc_state - Driver specific CRTC state
> + * struct vkms_crtc_state - Driver specific CRTC state
> + *
>    * @base: base CRTC state
>    * @composer_work: work struct to compose and add CRC entries
> - * @n_frame_start: start frame number for computed CRC
> - * @n_frame_end: end frame number for computed CRC
> + *
> + * @num_active_planes: Number of active planes
> + * @active_planes: List containing all the active planes (counted by
> + *  @num_active_planes). They should be stored in z-order.
> + * @active_writeback: Current active writeback job
> + * @gamma_lut: Look up table for gamma used in this CRTC > + * @crc_pending: Protected by @vkms_output.composer_lock.
> + * @wb_pending: Protected by @vkms_output.composer_lock.
> + * @frame_start: Protected by @vkms_output.composer_lock.
> + * @frame_end: Protected by @vkms_output.composer_lock.

Apart from being protected by @vkms_output.composer_lock, what those
variables represent?

>    */
>   struct vkms_crtc_state {
>   	struct drm_crtc_state base;
>   	struct work_struct composer_work;
>   
>   	int num_active_planes;
> -	/* stack of active planes for crc computation, should be in z order */
>   	struct vkms_plane_state **active_planes;
>   	struct vkms_writeback_job *active_writeback;
>   	struct vkms_color_lut gamma_lut;
>   
> -	/* below four are protected by vkms_output.composer_lock */
>   	bool crc_pending;
>   	bool wb_pending;
>   	u64 frame_start;
>   	u64 frame_end;
>   };
>   
> +/**
> + * struct vkms_output - Internal representation of all output components in vkms
> + *
> + * @crtc: Base crtc in drm

s/crtc/CRTC and s/drm/DRM

> + * @encoder: DRM encoder used for this output
> + * @connector: DRM connector used for this output
> + * @wb_connecter: DRM writeback connector used for this output
> + * @vblank_hrtimer:
> + * @period_ns:

Empty?

> + * @composer_workq: Ordered workqueue for composer_work

Add reference to composer_work

> + * @lock: Lock used to project concurrent acces to the composer

s/acces/access

> + * @composer_enabled: Protected by @lock.
> + * @composer_state:

Empty?

> + * @composer_lock: Lock used internally to protect @composer_state members
> + */
>   struct vkms_output {
>   	struct drm_crtc crtc;
>   	struct drm_encoder encoder;
> @@ -177,28 +199,38 @@ struct vkms_output {
>   	struct drm_writeback_connector wb_connector;
>   	struct hrtimer vblank_hrtimer;
>   	ktime_t period_ns;
> -	/* ordered wq for composer_work */
>   	struct workqueue_struct *composer_workq;
> -	/* protects concurrent access to composer */
>   	spinlock_t lock;
>   
> -	/* protected by @lock */
>   	bool composer_enabled;
>   	struct vkms_crtc_state *composer_state;
>   
>   	spinlock_t composer_lock;
>   };
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

s/instancied/instantiated

> + */
>   struct vkms_config {
>   	bool writeback;
>   	bool cursor;
>   	bool overlay;
> -	/* only set when instantiated */
>   	struct vkms_device *dev;
>   };
>   
> +/**
> + * struct vkms_device - Description of a vkms device
> + *
> + * @drm - Base device in drm

s/drm/DRM

> + * @platform - Associated platform device
> + * @output - Configuration and sub-components of the vkms device
> + * @config: Configuration used in this vkms device
> + */
>   struct vkms_device {
>   	struct drm_device drm;
>   	struct platform_device *platform;
> @@ -206,6 +238,10 @@ struct vkms_device {
>   	const struct vkms_config *config;
>   };
>   
> +/*
> + * The following helpers are used to convert a member of a struct into its parent.
> + */
> +
>   #define drm_crtc_to_vkms_output(target) \
>   	container_of(target, struct vkms_output, crtc)
>   
> @@ -218,12 +254,33 @@ struct vkms_device {
>   #define to_vkms_plane_state(target)\
>   	container_of(target, struct vkms_plane_state, base.base)
>   
> -/* CRTC */
> +/**
> + * vkms_crtc_init() - Initialize a crtc for vkms
> + * @dev: drm_device associated with the vkms buffer

DRM device

> + * @crtc: uninitialized crtc device
> + * @primary: primary plane to attach to the crtc
> + * @cursor plane to attach to the crtc

s/crtc/CRTC everywhere

> + */

New line

>   int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   		   struct drm_plane *primary, struct drm_plane *cursor);
> +/**
> + * vkms_output_init() - Initialize all sub-components needed for a vkms device.
> + *
> + * @vkmsdev: vkms device to initialize
> + * @possible_crtc_index: Crtc which can be attached to the planes. The caller must ensure that
> + * possible_crtc_index is positive and less or equals to 31.
> + */
>   

Delete line

>   int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
>   
> +/**
> + * vkms_plane_init() - Initialize a plane
> + *
> + * @vkmsdev: vkms device containing the plane
> + * @type: type of plane to initialize
> + * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that

s/crtc/CRTC everywhere

> + * possible_crtc_index is positive and less or equals to 31.
> + */
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>   				   enum drm_plane_type type, int possible_crtc_index);
>   
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index d42ca7d10389..36db2c8923cb 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -21,6 +21,7 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
>   {
>   	int count;
>   
> +	/* Use the default modes list from drm */

s/drm/DRM

>   	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
>   	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
>   
> @@ -58,8 +59,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>   	int writeback;
>   	unsigned int n;
>   
> +	/*
> +	 * Initialize used plane. One primary plane is required to perform the composition.
> +	 *
> +	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
> +	 * composition.
> +	 */
>   	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc_index);
> -
>   	if (IS_ERR(primary))
>   		return PTR_ERR(primary);
>   
> @@ -96,6 +102,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>   		DRM_ERROR("Failed to init encoder\n");
>   		goto err_encoder;
>   	}
> +	/*
> +	 * This is an hardcoded value to select crtc for the encoder.
> +	 * 1 here designate the first registered CRTC, the one allocated in [1]

Where is [1]?

Best Regards,
- Maíra

> +	 */
>   	encoder->possible_crtcs = 1;
>   
>   	ret = drm_connector_attach_encoder(connector, encoder);
> 
