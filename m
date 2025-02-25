Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67561A43D4F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE73210E62C;
	Tue, 25 Feb 2025 11:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="aUvpOggY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0E10E62B;
 Tue, 25 Feb 2025 11:20:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92A0243281;
 Tue, 25 Feb 2025 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740482424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yCLQU7203S+dlX3r5E0Pu9UF2aDsYxXkLvJUPcYkFU=;
 b=aUvpOggY5uBgdbm5giLxk3A+vMegdMySve38IohQgjdLcUdLcO6wAjdw27ShjwgZaLbvrZ
 aEnMLNbzy5+PCckyk24xSuwtWUs+J/WeT11/nTDues2OX/Vhe/sPzWr6NeATjmnPgV/jPu
 jdNoXRGsqeq09uNJJIDuDe8WeObP+vjlgnWedXSO497lyI6883QIbQRAy8QS/s2w50GboM
 5tQkANIq3VVamG17vmSKxF5kgtzyf7uYdJZhCQiBOXERXnPgAOZCEjB4p4G+cNENknoiui
 NfTKikevau0Ck5tO62TCcrHhR3VBhJxkbAlzQa8tftLItVX4Nz9hsBfKI1QHdQ==
Date: Tue, 25 Feb 2025 12:20:23 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 16/45] drm/colorop: Add 3x4 CTM type
Message-ID: <ca23393c-5785-4545-8d46-82a9a52c8070@bootlin.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-17-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220043410.416867-17-alex.hung@amd.com>
User-Agent: Mozilla Thunderbird
Content-Language: en-US
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudehjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjfgesthekredttddvudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehhfeiieetkeffgfetudefveeufeetieeiuddvkeegvdfhkefhtdelfeduhfefveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegrlhgvgidrhhhunhhgsegrmhgurdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepfigrhihlrghnugdquggvv
 hgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehhrghrrhihrdifvghnthhlrghnugesrghmugdrtghomh
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



Le 20/12/2024 à 05:33, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> This type is used to support a 3x4 matrix in colorops. A 3x4
> matrix uses the last column as a "bias" column. Some HW exposes
> support for 3x4. The calculation looks like:
> 
>   out   matrix    in
>   |R|   |0  1  2  3 |   | R |
>   |G| = |4  5  6  7 | x | G |
>   |B|   |8  9  10 11|   | B |
>                         |1.0|
> 
> This is also the first colorop where we need a blob property to
> program the property. For that we'll introduce a new DATA
> property that can be used by all colorop TYPEs requiring a
> blob. The way a DATA blob is read depends on the TYPE of
> the colorop.
> 
> We only create the DATA property for property types that
> need it.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> 
> v6:
>   - take ref for DATA blob in duplicate_state func (Xaver Hugl)
> 
> v5:
>   - Add function signature for init (Sebastian)
>   - Fix kernel-doc
> 
> v4:
>   - Create helper function for creating 3x4 CTM colorop
>   - Fix CTM indexes in comment (Pekka)
> 
>   drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++-
>   drivers/gpu/drm/drm_atomic_uapi.c | 29 +++++++++++++++++++++
>   drivers/gpu/drm/drm_colorop.c     | 42 +++++++++++++++++++++++++++++++
>   include/drm/drm_colorop.h         | 21 ++++++++++++++++
>   include/uapi/drm/amdgpu_drm.h     |  9 -------
>   include/uapi/drm/drm_mode.h       | 24 +++++++++++++++++-
>   6 files changed, 128 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 35136987d5e8..c58663327e6b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -787,7 +787,19 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
>   	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
>   	drm_printf(p, "\tbypass=%u\n", state->bypass);
> -	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
> +
> +	switch (colorop->type) {
> +	case DRM_COLOROP_1D_CURVE:
> +		drm_printf(p, "\tcurve_1d_type=%s\n",
> +			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
> +		break;
> +	case DRM_COLOROP_CTM_3X4:
> +		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
> +		break;
> +	default:
> +		break;
> +	}
> +

As suggested by Simon, you could add this switch in a previous patch, so 
you could avoid editing the same line twice.

With or without this change:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

>   	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
>   }
>   
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index f0c22abcc28f..7bc4978e5441 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -692,6 +692,30 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>   	return 0;
>   }
>   
> +static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
> +		struct drm_colorop_state *state,
> +		struct drm_property *property, uint64_t val)
> +{
> +	ssize_t elem_size = -1;
> +	ssize_t size = -1;
> +	bool replaced = false;
> +
> +	switch (colorop->type) {
> +	case DRM_COLOROP_CTM_3X4:
> +		size = sizeof(struct drm_color_ctm_3x4);
> +		break;
> +	default:
> +		/* should never get here */
> +		return -EINVAL;
> +	}
> +
> +	return drm_property_replace_blob_from_id(colorop->dev,
> +					&state->data,
> +					val,
> +					size,
> +					elem_size,
> +					&replaced);
> +}
>   
>   static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   		struct drm_colorop_state *state, struct drm_file *file_priv,
> @@ -701,6 +725,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   		state->bypass = val;
>   	} else if (property == colorop->curve_1d_type_property) {
>   		state->curve_1d_type = val;
> +	} else if (property == colorop->data_property) {
> +		return drm_atomic_color_set_data_property(colorop,
> +					state, property, val);
>   	} else {
>   		drm_dbg_atomic(colorop->dev,
>   			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
> @@ -723,6 +750,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>   		*val = state->bypass;
>   	} else if (property == colorop->curve_1d_type_property) {
>   		*val = state->curve_1d_type;
> +	} else if (property == colorop->data_property) {
> +		*val = (state->data) ? state->data->base.id : 0;
>   	} else {
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 954acd09673a..7d4b29c0a0cc 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -64,6 +64,7 @@
>   
>   static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>   	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
>   };
>   
>   static const char * const colorop_curve_1d_type_names[] = {
> @@ -202,11 +203,51 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
>   }
>   EXPORT_SYMBOL(drm_colorop_curve_1d_init);
>   
> +static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
> +{
> +	struct drm_property *prop;
> +
> +	/* data */
> +	prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
> +					"DATA", 0);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->data_property = prop;
> +	drm_object_attach_property(&colorop->base,
> +					colorop->data_property,
> +					0);
> +
> +	return 0;
> +}
> +
> +int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			     struct drm_plane *plane)
> +{
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
> +
>   static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>   							struct drm_colorop_state *state)
>   {
>   	memcpy(state, colorop->state, sizeof(*state));
>   
> +	if (state->data)
> +		drm_property_blob_get(state->data);
> +
>   	state->bypass = true;
>   }
>   
> @@ -288,6 +329,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
>   
>   static const char * const colorop_type_name[] = {
>   	[DRM_COLOROP_1D_CURVE] = "1D Curve",
> +	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
>   };
>   
>   const char *drm_get_colorop_type_name(enum drm_colorop_type type)
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 2f0572be37bb..e9f5c1adc2fe 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -96,6 +96,14 @@ struct drm_colorop_state {
>   	 */
>   	enum drm_colorop_curve_1d_type curve_1d_type;
>   
> +	/**
> +	 * @data:
> +	 *
> +	 * Data blob for any TYPE that requires such a blob. The
> +	 * interpretation of the blob is TYPE-specific.
> +	 */
> +	struct drm_property_blob *data;
> +
>   	/** @state: backpointer to global drm_atomic_state */
>   	struct drm_atomic_state *state;
>   };
> @@ -200,6 +208,17 @@ struct drm_colorop {
>   	 */
>   	struct drm_property *curve_1d_type_property;
>   
> +	/**
> +	 * @data_property:
> +	 *
> +	 * blob property for any TYPE that requires a blob of data,
> +	 * such as 1DLUT, CTM, 3DLUT, etc.
> +	 *
> +	 * The way this blob is interpreted depends on the TYPE of
> +	 * this
> +	 */
> +	struct drm_property *data_property;
> +
>   	/**
>   	 * @next_property:
>   	 *
> @@ -236,6 +255,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>   
>   int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
>   			      struct drm_plane *plane, u64 supported_tfs);
> +int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +			     struct drm_plane *plane);
>   
>   struct drm_colorop_state *
>   drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index efe5de6ce208..e44362e74fa1 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -1283,15 +1283,6 @@ struct drm_amdgpu_info_gpuvm_fault {
>   #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
>   #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
>   
> -/* FIXME wrong namespace! */
> -struct drm_color_ctm_3x4 {
> -	/*
> -	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> -	 * (not two's complement!) format.
> -	 */
> -	__u64 matrix[12];
> -};
> -
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 53985d2b7eea..6fc1ce24800a 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -847,6 +847,20 @@ struct drm_color_ctm {
>   	__u64 matrix[9];
>   };
>   
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 *
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| = |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 11|   | B |
> +	 *                       |1.0|
> +	 */
> +	__u64 matrix[12];
> +};
> +
>   struct drm_color_lut {
>   	/*
>   	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
> @@ -872,7 +886,15 @@ enum drm_colorop_type {
>   	 * A 1D curve that is being applied to all color channels. The
>   	 * curve is specified via the CURVE_1D_TYPE colorop property.
>   	 */
> -	DRM_COLOROP_1D_CURVE
> +	DRM_COLOROP_1D_CURVE,
> +
> +	/**
> +	 * @DRM_COLOROP_CTM_3X4:
> +	 *
> +	 * A 3x4 matrix. Its values are specified via the
> +	 * &drm_color_ctm_3x4 struct provided via the DATA property.
> +	 */
> +	DRM_COLOROP_CTM_3X4,
>   };
>   
>   /**

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

