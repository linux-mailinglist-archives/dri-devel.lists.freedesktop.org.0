Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DB8C47AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031B210E3C4;
	Mon, 13 May 2024 19:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jcupdkxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34AFA10E3C4;
 Mon, 13 May 2024 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715629189; x=1747165189;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=axOfjCJamNTYqmF0GZOa+WjoR5wefKTKSoadyUOv1g0=;
 b=JcupdkxfVa/rXMNv9BqGm4sry/PO5T4eUR0Lw7pFXzG7/GE3D/Sc0k8Z
 jgqnM5WS75pVJ5KDEESljgJe4rtV5/YSE3vxMH3XBvxK3ieb1gN3Z+1/b
 byC18+LTHR5hf9sT+skR4Ye4M70Bp9cjO9fPineYEFE3dkMvTDsc1ckoy
 6pF24+PFjE+yViXX/3rON1VUJQAve8zbuNkiSdYpTkU6fil4PrrhWFe/K
 DVy2TRIQKbVGhFU5i7wkWcHfCt43J4X1NL2lsPn2wvbl2WT8JQOZ2GfO+
 MZy6EIFFG+ByTUyQw25QbjOFBJ/NLw4gqUCt+nEk7ig911pnGjVQRf1Sd Q==;
X-CSE-ConnectionGUID: V1ANlOnOTcGe7C7GYTUWLA==
X-CSE-MsgGUID: AjPe2Yz+TpmY9klkjJugxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22253338"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="22253338"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 12:39:48 -0700
X-CSE-ConnectionGUID: 0FxuYqbJRAul+sZ9OO6rdA==
X-CSE-MsgGUID: 3SIfY+gWQHWBFvSm6EgfnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30388655"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 12:39:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm: Export drm_plane_has_format()
In-Reply-To: <20240513175942.12910-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240513175942.12910-1-ville.syrjala@linux.intel.com>
 <20240513175942.12910-3-ville.syrjala@linux.intel.com>
Date: Mon, 13 May 2024 22:39:44 +0300
Message-ID: <87le4dec1r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 13 May 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Export drm_plane_has_format() so that drivers can use it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 2 --
>  drivers/gpu/drm/drm_plane.c         | 1 +
>  include/drm/drm_plane.h             | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index 898e0e8b51be..e207759ca045 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -272,8 +272,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  /* drm_plane.c */
>  int drm_plane_register_all(struct drm_device *dev);
>  void drm_plane_unregister_all(struct drm_device *dev);
> -bool drm_plane_has_format(struct drm_plane *plane,
> -			  u32 format, u64 modifier);
>  struct drm_mode_rect *
>  __drm_plane_get_damage_clips(const struct drm_plane_state *state);
>=20=20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 268aa2299df5..a51d4dd3f7de 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -906,6 +906,7 @@ bool drm_plane_has_format(struct drm_plane *plane,
>=20=20
>  	return true;
>  }
> +EXPORT_SYMBOL(drm_plane_has_format);
>=20=20
>  static int __setplane_check(struct drm_plane *plane,
>  			    struct drm_crtc *crtc,
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 9507542121fa..dd718c62ac31 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -972,6 +972,8 @@ static inline struct drm_plane *drm_plane_find(struct=
 drm_device *dev,
>  #define drm_for_each_plane(plane, dev) \
>  	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>=20=20
> +bool drm_plane_has_format(struct drm_plane *plane,
> +			  u32 format, u64 modifier);
>  bool drm_any_plane_has_format(struct drm_device *dev,
>  			      u32 format, u64 modifier);

--=20
Jani Nikula, Intel
