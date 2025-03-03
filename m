Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34088A4BD4A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 12:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF1510E3CA;
	Mon,  3 Mar 2025 11:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT6A15mV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1E610E3CA;
 Mon,  3 Mar 2025 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740999820; x=1772535820;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xAS5fvkLfxtRNDq8VHykz3LpQZJ3FusAhofwYD1xGQ4=;
 b=cT6A15mVSVVQDrH8Jy1ScIoUzCSL2Bxk9ksm5kltTynlA+Q3TBthdWhM
 m3tvASOaVMFwQJxzLWyKxbTspCjKLNIWqdfTu54xJCNzqktuwq3/K2w2y
 RFhG2P70TIaQ0sDAJNCi2PeGhvHoG+HVQfP7FPOK2Y4tx2SEV0gl/y6Fi
 NFQ6AVWUQqYw1h+WELsgCs70GUzM+mkPtTRUC5l2KAkW7x8G60mq0eQ/A
 k5eBbu1X/+/m/MdHtg9Cdwh1rUT9h+W1tnVGIUjTByw5xGtY6rBxw+BeM
 Mzhhlkc2BZv0/l35STsVSvIaPdfpS5f9GJx4vPTyvXUr4m28mldp4WOqY A==;
X-CSE-ConnectionGUID: 6vUbJMOeRD6RgrwGf6IfJQ==
X-CSE-MsgGUID: TG/tN27aS9SJCNYcjOopyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41045044"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41045044"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 03:03:39 -0800
X-CSE-ConnectionGUID: kgBw7iYrRy2dZLmYIFk6RA==
X-CSE-MsgGUID: txAARF4qS1uF0BFTKX/L7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="122579440"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.122])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 03:03:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
In-Reply-To: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
Date: Mon, 03 Mar 2025 13:03:33 +0200
Message-ID: <87h64a1im2.fsf@intel.com>
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

On Mon, 03 Mar 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use IS_ENABLED() to check for CONFIG_DRM_KUNIT_TEST so
> that it picks up the modular case as well.
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index aca442c25209..27471a4eef21 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -1268,6 +1268,6 @@ int drm_client_modeset_dpms(struct drm_client_dev *=
client, int mode)
>  }
>  EXPORT_SYMBOL(drm_client_modeset_dpms);
>=20=20
> -#ifdef CONFIG_DRM_KUNIT_TEST
> +#if IS_ENABLED(CONFIG_DRM_KUNIT_TEST)
>  #include "tests/drm_client_modeset_test.c"
>  #endif

--=20
Jani Nikula, Intel
