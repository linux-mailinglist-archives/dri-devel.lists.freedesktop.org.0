Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D0D08055
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49410E858;
	Fri,  9 Jan 2026 08:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYNAVNRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4EE10E85F;
 Fri,  9 Jan 2026 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767949070; x=1799485070;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=1a/eS75yyIWZcpFPllckDkjXoSc9AeiUGsnNAUgVcN8=;
 b=CYNAVNRdGsTgSppPXJ53YCkGDPQwLLf0oB3hK4r+Gm+BPoZwWuD/ZRc3
 41cgHUKR7p+2iNUXjmSf3FVbL/6EdoKdTTP0CIQDYz6PagDA2c1UE46Y4
 DdvtsuuVppI6sjqFU4kf5AliX4cebEu/ql+uQMHqLUG6ly6AOvLRdHS24
 btOf/PD6qwSPEroNeUKOsyTcrfV/f4D5RfgPfC+z4syCjf6QSCOyJAMoY
 L/0v4IRKlBdzwwzsNG0OQKUdmx48ak9OWjOAvkpCBdfxljvXtCzNnuNMD
 /enpySuo2/c4I/e6lVga3cG3jXz00LTJJvNe/UB98cQkZ7IK+Dzb+VJDG Q==;
X-CSE-ConnectionGUID: CI1Js4/DQwy3udCle0/c+w==
X-CSE-MsgGUID: uhaqiaJBQqatGJtVCqpYPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80440346"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="80440346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:57:49 -0800
X-CSE-ConnectionGUID: DLTAWVfrQQCSZ/i15WEwxA==
X-CSE-MsgGUID: MSaS3n6XSQeg3Yn5eKBbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203851334"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 00:57:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] drm/i915: free _DSM package when no connectors
In-Reply-To: <20260109032549.1826303-1-kaushlendra.kumar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109032549.1826303-1-kaushlendra.kumar@intel.com>
Date: Fri, 09 Jan 2026 10:57:42 +0200
Message-ID: <fcef7bb595e9197eec717a3876d8bc0c869a4b25@intel.com>
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


Subject prefix "drm/i915/acpi:"

On Fri, 09 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrote:
> acpi_evaluate_dsm_typed() returns an ACPI package in pkg.
> When pkg->package.count =3D=3D 0, we returned without freeing pkg,
> leaking memory. Free pkg before returning on the empty case.

Fixes: 337d7a1621c7 ("drm/i915: Fix invalid access to ACPI _DSM objects")
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.14+
Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/=
i915/display/intel_acpi.c
> index 68c01932f7b4..e06f324027be 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -96,6 +96,7 @@ static void intel_dsm_platform_mux_info(acpi_handle dha=
ndle)
>=20=20
>  	if (!pkg->package.count) {
>  		DRM_DEBUG_DRIVER("no connection in _DSM\n");
> +		ACPI_FREE(pkg);
>  		return;
>  	}

--=20
Jani Nikula, Intel
