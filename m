Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D765356DD5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 15:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEDC6E912;
	Wed,  7 Apr 2021 13:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFEA6E912
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 13:51:15 +0000 (UTC)
IronPort-SDR: Yft9DETFRDdxq4vJdB8LPnV9DDmcWNCg/NUSpqXRtP/3bo0DmX8jy31RT0hSBrGAf4EN4DySzQ
 KJ+mbh9CWOWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="278574952"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="278574952"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 06:51:15 -0700
IronPort-SDR: j1XdGJ65WAmmrm/vTJK+J9UYeIWmDIjgen35119Vmg/dUyeOdMpLMsGMQlgxLLTCnp9pikwTz8
 /0mKhaXuhF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="448257144"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by FMSMGA003.fm.intel.com with SMTP; 07 Apr 2021 06:51:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Apr 2021 16:51:11 +0300
Date: Wed, 7 Apr 2021 16:51:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <YG24z2oeHVtzvkXy@intel.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406192118.12313-3-leandro.ribeiro@collabora.com>
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

On Tue, Apr 06, 2021 at 04:21:18PM -0300, Leandro Ribeiro wrote:
> Emphasize how userspace should use the plane format list
> (format_type_ptr) and the IN_FORMATS blob property.
> =

> Formats exposed in the plane format list (format_type_ptr) do not
> require modifiers, and formats that are present in the IN_FORMATS blob
> property support modifiers.
> =

> Note that these are not disjoint sets. If a format supports modifiers
> but the driver can also handle it without a modifier, it should be
> present in both the IN_FORMATS blob property and the plane format list.
> =

> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 4 ++++
>  include/uapi/drm/drm_mode.h | 3 +++
>  2 files changed, 7 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 0dd43882fe7c..b48d9bd81a59 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -128,6 +128,10 @@
>   *     pairs supported by this plane. The blob is a struct
>   *     drm_format_modifier_blob. Without this property the plane doesn't
>   *     support buffers with modifiers. Userspace cannot change this prop=
erty.
> + *
> + *     To find out the list of buffer formats which are supported withou=
t a
> + *     modifier, userspace should not look at this blob property, but at=
 the
> + *     formats list of the plane: &drm_mode_get_plane.format_type_ptr.
>   */
>  =

>  static unsigned int drm_num_planes(struct drm_device *dev)
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 96fc9a6da608..4293800ec095 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -340,6 +340,9 @@ struct drm_mode_get_plane {
>  	/**
>  	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
>  	 * supported by the plane. These formats do not require modifiers.
> +	 *
> +	 * To find out the list of formats that support modifiers, userspace
> +	 * must use the plane IN_FORMATS blob property.
>  	 */

Addfb2+modifiers predates the IN_FORMATS blob, so this doesn't
match reality.

>  	__u64 format_type_ptr;
>  };
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
