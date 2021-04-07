Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA980356DB1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 15:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C206E90C;
	Wed,  7 Apr 2021 13:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95916E90C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 13:46:13 +0000 (UTC)
IronPort-SDR: 9gHqatF8hfLoPpGvXUNnPy156O+CcRwREr82vtPvpYN842Cb0n+SIbUUdAwEoxIKJHzHuVXOf2
 Sv2/jmfsyKOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="192848437"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="192848437"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 06:46:00 -0700
IronPort-SDR: 86xRTNwLC+qHVimyO3v9+b8hAVJJ2UU3u2RcqkLNT4/TQ/p0mzuXHmgxmoIqpEk8HSe1kNtmCb
 ulrEoEykagHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="396668568"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 07 Apr 2021 06:45:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Apr 2021 16:45:56 +0300
Date: Wed, 7 Apr 2021 16:45:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 1/2] drm/doc: document drm_mode_get_plane
Message-ID: <YG23lE7V0qjJNJu4@intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-2-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406192118.12313-2-leandro.ribeiro@collabora.com>
X-Patchwork-Hint: comment
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 04:21:17PM -0300, Leandro Ribeiro wrote:
> Add a small description and document struct fields of
> drm_mode_get_plane.
> =

> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> =

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d1a93d2a85f9..96fc9a6da608 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,35 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
>  =

> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + */
>  struct drm_mode_get_plane {
> +	/** @plane_id: Object ID of the plane. */
>  	__u32 plane_id;
>  =

> +	/** @crtc_id: Object ID of the current CRTC. */
>  	__u32 crtc_id;
> +	/** @fb_id: Object ID of the current fb. */
>  	__u32 fb_id;
>  =

> +	/**
> +	 * @possible_crtcs: Pointer to ``__u32`` array of CRTC's that are
> +	 * compatible with the plane.
> +	 */

It's a bitmask.

>  	__u32 possible_crtcs;
> +	/** @gamma_size: Size of the legacy gamma table. */
>  	__u32 gamma_size;
>  =

> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.
> +	 */
>  	__u64 format_type_ptr;
>  };
>  =

> -- =

> 2.31.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
