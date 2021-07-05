Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC53BBC68
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 13:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356389834;
	Mon,  5 Jul 2021 11:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A820E897EF;
 Mon,  5 Jul 2021 11:48:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="189344133"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="189344133"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 04:48:33 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="480707140"
Received: from dmalinva-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.23.39])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 04:48:31 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210702201708.2075793-1-daniel.vetter@ffwll.ch>
References: <20210702201708.2075793-1-daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Improve debug Kconfig texts a bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162548570352.15289.12980604779254635228@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 05 Jul 2021 14:48:23 +0300
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-07-02 23:17:08)
> We're not consistently recommending these for developers only.
>=20
> I stumbled over this due to DRM_I915_LOW_LEVEL_TRACEPOINTS, which was
> added in
>=20
> commit 354d036fcf70654cff2e2cbdda54a835d219b9d2
> Author: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Date:   Tue Feb 21 11:01:42 2017 +0000
>=20
>     drm/i915/tracepoints: Add request submit and execute tracepoints
>=20
> to "alleviate the performance impact concerns."
>=20
> Which is nonsense.

I think that was the original reason why the patch was developed and
it got merged primarily for the latter reason. Unfortunately the patch
commit messages don't always get rewritten.

> Tvrtko and Joonas pointed out on irc that the real (but undocumented
> reason) was stable abi concerns for tracepoints, see
>=20
> https://lwn.net/Articles/705270/
>=20
> and the specific change that was blocked around tracepoints:
>=20
> https://lwn.net/Articles/442113/
>=20
> Anyway to make it a notch clearer why we have this Kconfig option
> consistly add the "Recommended for driver developers only." to it and
> all the other debug options we have.
>=20
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Regards, Joonas

> ---
>  drivers/gpu/drm/i915/Kconfig.debug | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kc=
onfig.debug
> index 2ca88072d30f..f27c0b5873f7 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -215,6 +215,8 @@ config DRM_I915_LOW_LEVEL_TRACEPOINTS
>           This provides the ability to precisely monitor engine utilisati=
on
>           and also analyze the request dependency resolving timeline.
> =20
> +         Recommended for driver developers only.
> +
>           If in doubt, say "N".
> =20
>  config DRM_I915_DEBUG_VBLANK_EVADE
> @@ -228,6 +230,8 @@ config DRM_I915_DEBUG_VBLANK_EVADE
>           is exceeded, even if there isn't an actual risk of missing
>           the vblank.
> =20
> +         Recommended for driver developers only.
> +
>           If in doubt, say "N".
> =20
>  config DRM_I915_DEBUG_RUNTIME_PM
> @@ -240,4 +244,6 @@ config DRM_I915_DEBUG_RUNTIME_PM
>           runtime PM functionality. This may introduce overhead during
>           driver loading, suspend and resume operations.
> =20
> +         Recommended for driver developers only.
> +
>           If in doubt, say "N"
> --=20
> 2.32.0.rc2
>=20
