Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF0AB454E
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 22:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB8A10E465;
	Mon, 12 May 2025 20:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LSBdQCmS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2F10E1C9;
 Mon, 12 May 2025 20:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+s+PiCUM+b0NwvbJ+Im+TllGRvAH0CmJ6N1UuNyKKVc=; b=LSBdQCmSU2Bk42iK9Ko370Htr+
 rledE63SN/2wQO44o6G3P1rRlO9D/cfBYoRrSJkG90HaCMyRKm1m9yN53A1qcQA7UHDvNGa0pLUem
 8mSRsiO+iML+O9jd3OIL6UVDaIv+8Eza33abMJ+jDxJ8/wnUZRjKb9rJbszvl6P07YbCCPNcIgaED
 ss0ctdsy8C0WfTTVvHEG+Ep/oGczM4/RT2RlLPpxrtU34LVt5K8Jm8VtDvkamVuiWFjat9WAQXsth
 Ac3J+2LN4zRX8DuOcUxy8EQjEWvq65oudTCJz2MDAImV0ITTKR+H2S5P4xbuSiIVU7gylG9cC6jMF
 MwPXnvmA==;
Received: from [189.6.16.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEZGu-007FO8-4w; Mon, 12 May 2025 22:02:33 +0200
Message-ID: <eaf332fe-d226-44c7-b397-66352d368ddd@igalia.com>
Date: Mon, 12 May 2025 17:02:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 36/43] drm/colorop: Add mutliplier type
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, Daniel Stone <daniels@collabora.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-37-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250430011115.223996-37-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 29/04/2025 22:11, Alex Hung wrote:

Typo in the commit msg: mutliplier -> multiplier
> This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.
>
> It's a simple multiplier to all pixel values. The value is
> specified via a S31.32 fixed point provided via the
> "MULTIPLIER" property.
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> V9:
>   - Update function names by _plane_ (Chaitanya Kumar Borah)
>
> v7:
>   - Modify size_property to lut_size_property
>
>   drivers/gpu/drm/drm_atomic.c      |  3 +++
>   drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
>   drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
>   include/drm/drm_colorop.h         | 16 +++++++++++++++
>   include/uapi/drm/drm_mode.h       | 11 +++++++++++
>   5 files changed, 67 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 1dda90554e46..907ca790689f 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
>   	case DRM_COLOROP_CTM_3X4:
>   		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
>   		break;
> +	case DRM_COLOROP_MULTIPLIER:
> +		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
> +		break;
>   	default:
>   		break;
>   	}
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 0cd250db3981..a7f1d75bb4ea 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -739,6 +739,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
>   		state->bypass = val;
>   	} else if (property == colorop->curve_1d_type_property) {
>   		state->curve_1d_type = val;
> +	} else if (property == colorop->multiplier_property) {
> +		state->multiplier = val;
>   	} else if (property == colorop->data_property) {
>   		return drm_atomic_color_set_data_property(colorop, state,
>   							  property, val);
> @@ -764,6 +766,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>   		*val = state->bypass;
>   	} else if (property == colorop->curve_1d_type_property) {
>   		*val = state->curve_1d_type;
> +	} else if (property == colorop->multiplier_property) {
> +		*val = state->multiplier;
>   	} else if (property == colorop->lut_size_property) {
>   		*val = colorop->lut_size;
>   	} else if (property == colorop->data_property) {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 6c87f5b9f7f9..a3cf62c5e263 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
>   	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
>   	{ DRM_COLOROP_1D_LUT, "1D LUT" },
>   	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
> +	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
>   };
>   
>   static const char * const colorop_curve_1d_type_names[] = {
> @@ -327,6 +328,37 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
>   }
>   EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   
> +/**
> + * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @plane: The associated drm_plane
> + * @return zero on success, -E value on failure
> + */
> +int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				struct drm_plane *plane)
> +{
> +	struct drm_property *prop;
> +	int ret;
> +
> +	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
> +	if (ret)
> +		return ret;
> +
> +	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	colorop->multiplier_property = prop;
> +	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_colorop_mult_init);
> +
>   static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
>   							struct drm_colorop_state *state)
>   {
> @@ -418,6 +450,7 @@ static const char * const colorop_type_name[] = {
>   	[DRM_COLOROP_1D_CURVE] = "1D Curve",
>   	[DRM_COLOROP_1D_LUT] = "1D LUT",
>   	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
> +	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
>   };
>   
>   const char *drm_get_colorop_type_name(enum drm_colorop_type type)
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 52e965577bd8..888184aef7a0 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -146,6 +146,13 @@ struct drm_colorop_state {
>   	 */
>   	enum drm_colorop_curve_1d_type curve_1d_type;
>   
> +	/**
> +	 * @multiplier:
> +	 *
> +	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
> +	 */
> +	uint64_t multiplier;
> +
>   	/**
>   	 * @data:
>   	 *
> @@ -273,6 +280,13 @@ struct drm_colorop {
>   	 */
>   	struct drm_property *curve_1d_type_property;
>   
> +	/**
> +	 * @multiplier_property:
> +	 *
> +	 * Multiplier property for plane gain
> +	 */
> +	struct drm_property *multiplier_property;
> +
>   	/**
>   	 * @lut_size_property:
>   	 *
> @@ -330,6 +344,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
>   					struct drm_plane *plane, uint32_t lut_size);
>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				   struct drm_plane *plane);
> +int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				struct drm_plane *plane);
>   
>   struct drm_colorop_state *
>   drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index dde250dd7a51..fa5e1ddaf4f0 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -919,6 +919,17 @@ enum drm_colorop_type {
>   	 * | B |   | 8  9  10 12 |   | B |
>   	 */
>   	DRM_COLOROP_CTM_3X4,
> +
> +	/**
> +	 * @DRM_COLOROP_MULTIPLIER:
> +	 *
> +	 * enum string "Multiplier"
> +	 *
> +	 * A simple multiplier, applied to all color values. The
> +	 * multiplier is specified as a S31.32 via the MULTIPLIER
> +	 * property.
> +	 */
> +	DRM_COLOROP_MULTIPLIER,
>   };
>   
>   /**

