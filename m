Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDB3A43D56
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113BC10E62E;
	Tue, 25 Feb 2025 11:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e5MbfToX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B064F10E62E;
 Tue, 25 Feb 2025 11:21:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D479204D4;
 Tue, 25 Feb 2025 11:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740482463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHhHTQB1BKV3c9YuYnvIjNNluRo8eXyFy9tbW0LGdTE=;
 b=e5MbfToX2qHosII4s7HftZbD5qj7VBlfz35N1xstvIjthQI80+AoW0G+ShQGbuPH5c4ed9
 MV8kJXkOIz4dxNW8VEIpZvHYR2vhEoqnshC6tCMEtzQTVsA/y/WYXruOOosv/ZKMUKfOiw
 SdDXd/6Jb+Wr17QGFtre3A2uxasQ5ScbBSHl0HjpE3oZSH3C4Nm+HqXW5R6PiS9UN/p/Ae
 mlBMrXM4sPH4zpLXohtyGlAKcu7XIOXWo5/qeKrcd2Bmf5sB2KMUKNc207fBFf2OMgfQjZ
 MCWqrVFHMPnVsLlnb0e8gGIRDfKApTCujtG9QZSM5cQwcfY26qBsNbkK+mUupQ==
Date: Tue, 25 Feb 2025 12:21:01 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 18/45] drm/vkms: add 3x4 matrix in color pipeline
Message-ID: <a5d7c03d-1450-4d3f-b055-df17b19470e7@bootlin.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-19-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220043410.416867-19-alex.hung@amd.com>
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
> We add two 3x4 matrices into the VKMS color pipeline. The reason
> we're adding matrices is so that we can test that application
> of a matrix and its inverse yields an output equal to the input
> image.
> 
> One complication with the matrix implementation has to do with
> the fact that the matrix entries are in signed-magnitude fixed
> point, whereas the drm_fixed.h implementation uses 2s-complement.
> The latter one is the one that we want for easy addition and
> subtraction, so we convert all entries to 2s-complement.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
> v7:
>   - Fix checkpatch warnings
>    - Change kzalloc(sizeof(struct drm_colorop) ...) to kzalloc(sizeof(*ops[i]) ...)
>    - Change i-1to i - 1
>    - Add a new line at EOF
> 
> v6:
>   - pre-compute colors (Louis Chauvet)
>   - round matrix output (Louis Chauvet)
> 
>   drivers/gpu/drm/vkms/vkms_colorop.c  | 34 +++++++++++++++++++++++++++-
>   drivers/gpu/drm/vkms/vkms_composer.c | 33 +++++++++++++++++++++++++++
>   2 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index af319cd3de23..b407f8ae758d 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,7 +12,7 @@ static const u64 supported_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>   
> -#define MAX_COLOR_PIPELINE_OPS 2
> +#define MAX_COLOR_PIPELINE_OPS 4
>   
>   static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
>   {
> @@ -48,6 +48,38 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i - 1], ops[i]);
> +
> +	i++;
> +
> +	/* 3rd op: 3x4 matrix */
> +	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");

drm_err

> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
> +	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
> +	if (ret)
> +		goto cleanup;
> +
> +	drm_colorop_set_next_property(ops[i - 1], ops[i]);
> +
> +	i++;
> +
> +	/* 4th op: 1d curve */
> +	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
> +	if (!ops[i]) {
> +		DRM_ERROR("KMS: Failed to allocate colorop\n");

drm_err

With this change:
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +		ret = -ENOMEM;
> +		goto cleanup;
> +	}
> +
>   	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
>   	if (ret)
>   		goto cleanup;
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index b009e607a310..cdcaaf8cdb68 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>   	}
>   }
>   
> +static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
> +{
> +	s64 rf, gf, bf;
> +	s64 r, g, b;
> +
> +	r = drm_int2fixp(pixel->r);
> +	g = drm_int2fixp(pixel->g);
> +	b = drm_int2fixp(pixel->b);
> +
> +	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
> +	     drm_sm2fixp(matrix->matrix[3]);
> +
> +	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
> +	     drm_sm2fixp(matrix->matrix[7]);
> +
> +	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
> +	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
> +	     drm_sm2fixp(matrix->matrix[11]);
> +
> +	pixel->r = drm_fixp2int_round(rf);
> +	pixel->g = drm_fixp2int_round(gf);
> +	pixel->b = drm_fixp2int_round(bf);
> +}
> +
>   static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>   {
>   	struct drm_colorop_state *colorop_state = colorop->state;
> @@ -180,6 +209,10 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
>   				      colorop_state->curve_1d_type);
>   			break;
>   		}
> +	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
> +		if (colorop_state->data)
> +			apply_3x4_matrix(pixel,
> +					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);
>   	}
>   }
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

