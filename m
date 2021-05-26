Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2730391A6C
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABBD6EDA3;
	Wed, 26 May 2021 14:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EE36EDA3;
 Wed, 26 May 2021 14:38:01 +0000 (UTC)
IronPort-SDR: KWNmkJ1CM7Zmg8P2Lkwxr4o2gruB2eJVXF0B/1Uytb5VdX3IjDFxCvuInPuaUN6MmpjUg0EVln
 tM8dZw3sCDdw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="189857485"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="189857485"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:38:01 -0700
IronPort-SDR: 71E0ovy/GqX7eJCY2VdooB68HT3FQCbFmfiezQn9gjK2jtrNXaw6/RwMPiy8Fj/uxvgwxaMGQf
 HYwe7MJMOKBA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="476968841"
Received: from astiegle-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.167])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:37:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/params: Align visibility of device level and
 global modparams
In-Reply-To: <20210526141946.2347085-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210526100006.2205062-1-tvrtko.ursulin@linux.intel.com>
 <20210526141946.2347085-1-tvrtko.ursulin@linux.intel.com>
Date: Wed, 26 May 2021 17:37:54 +0300
Message-ID: <87fsy9blx9.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 May 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> We have a few modparams which get conditionaly exposed based on a Kconfig
> options and in most cases this also means portions of the driver
> implementing the respective feature are also left out.
>
> Align the visibility of device level and global modparams to make them
> consistent in this respect.
>
> v2:
>  * Fix misplaced parentheses.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I'd happily accept patches removing some of the module params, and just
leaving the debugfs device params in place. ;)

> ---
>  drivers/gpu/drm/i915/i915_params.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i9=
15_params.h
> index 14cd64cc61d0..4a114a5ad000 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -71,18 +71,18 @@ struct drm_printer;
>  	param(int, fastboot, -1, 0600) \
>  	param(int, enable_dpcd_backlight, -1, 0600) \
>  	param(char *, force_probe, CONFIG_DRM_I915_FORCE_PROBE, 0400) \
> -	param(unsigned long, fake_lmem_start, 0, 0400) \
> -	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT=
, 0600) \
> +	param(unsigned long, fake_lmem_start, 0, IS_ENABLED(CONFIG_DRM_I915_UNS=
TABLE_FAKE_LMEM) ? 0400 : 0) \
> +	param(unsigned int, request_timeout_ms, CONFIG_DRM_I915_REQUEST_TIMEOUT=
, CONFIG_DRM_I915_REQUEST_TIMEOUT ? 0600 : 0) \
>  	/* leave bools at the end to not create holes */ \
>  	param(bool, enable_hangcheck, true, 0600) \
>  	param(bool, load_detect_test, false, 0600) \
>  	param(bool, force_reset_modeset_test, false, 0600) \
> -	param(bool, error_capture, true, 0600) \
> +	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERR=
OR) ? 0600 : 0) \
>  	param(bool, disable_display, false, 0400) \
>  	param(bool, verbose_state_checks, true, 0) \
>  	param(bool, nuclear_pageflip, false, 0400) \
>  	param(bool, enable_dp_mst, true, 0600) \
> -	param(bool, enable_gvt, false, 0400)
> +	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 :=
 0)
>=20=20
>  #define MEMBER(T, member, ...) T member;
>  struct i915_params {

--=20
Jani Nikula, Intel Open Source Graphics Center
