Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF680435E82
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 12:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F8E6EB44;
	Thu, 21 Oct 2021 10:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0A56EB3E;
 Thu, 21 Oct 2021 10:01:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216158394"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="216158394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 03:00:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="495058903"
Received: from ssuryana-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.45.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 03:00:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: Re: [RFC PATCH 0/4] drm/dp: Use DP2.0 DPCD 248h updated
 register/field names for DP PHY CTS
In-Reply-To: <20211021050713.836498-1-khaled.almahallawy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211021050713.836498-1-khaled.almahallawy@intel.com>
Date: Thu, 21 Oct 2021 13:00:39 +0300
Message-ID: <8735ouofy0.fsf@intel.com>
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

On Wed, 20 Oct 2021, Khaled Almahallawy <khaled.almahallawy@intel.com> wrot=
e:
> This series updates DPCD 248h register name and PHY test patterns names t=
o follow DP 2.0 Specs.
> Also updates the DP PHY CTS codes of the affected drivers (i915, amd, msm)
> No functional changes expected.
>=20=20
> Reference: =E2=80=9CDPCD 248h/10Bh/10Ch/10Dh/10Eh Name/Description Consis=
tency=E2=80=9D
> https://groups.vesa.org/wg/AllMem/documentComment/2738

You can't do renames like this piece by piece. Every commit must build.

Incidentally, this is one of the reasons we often don't bother with
renames to follow spec changes, but rather stick to the original names.

However, in this case you could switch all drivers to the different test
pattern macros piece by piece, as they're already there.


BR,
Jani.


>
> Khaled Almahallawy (4):
>   drm/dp: Rename DPCD 248h according to DP 2.0 specs
>   drm/i915/dp: Use DP 2.0 LINK_QUAL_PATTERN_* Phy test pattern
>     definitions
>   drm/amd/dc: Use DPCD 248h DP 2.0 new name
>   drm/msm/dp: Use DPCD 248h DP 2.0 new names/definitions
>
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c |  2 +-
>  drivers/gpu/drm/drm_dp_helper.c                  |  6 +++---
>  drivers/gpu/drm/i915/display/intel_dp.c          | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c              | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                 | 12 ++++++------
>  drivers/gpu/drm/msm/dp/dp_link.c                 | 16 ++++++++--------
>  include/drm/drm_dp_helper.h                      | 13 +++----------
>  7 files changed, 33 insertions(+), 40 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
