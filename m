Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39126482387
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 11:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C23289C25;
	Fri, 31 Dec 2021 10:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8336389C25;
 Fri, 31 Dec 2021 10:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640947876; x=1672483876;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=BZ4O5QFeYWUSe5kjchtHnivDOh9/Aw7zw8541nyz70A=;
 b=O4y3+U9A+H6LhyFOHedQ0g7ZLrF4wlR47QYB9lm29auh8k5hSbmquPBk
 1rtcVn/lQZf+mZpC6abB0+8SdbsymbLp/NGqthzKZup/LISJTrRGPelrR
 G5h64poqSECIfWGnyk2dVhUeAbOXB6lbvvCxYNzDEBb3mE/H2ML7PMvXu
 h6GP3BSo/u0bBlvrUon5ffbgX5/tafkWlhIQ5mQPnL6+iEnvt5g4MRVXY
 BFX9a7cwb8Gi6mb9KXwxqJO0GWRgTNMBMneuMvGKtp3fBeIwHHRI6YA9j
 BIUP2ak6KFFnK5kR+u5kemuCR/ERBnsv7HwMyGPDvD7qfXvj9rnVIedKz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="229113596"
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="229113596"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 02:51:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="687467609"
Received: from arudakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.25.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 02:51:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Anisse Astier <anisse@astier.eu>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/2] GPD Win Max display fixes
In-Reply-To: <20211229222200.53128-1-anisse@astier.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211229222200.53128-1-anisse@astier.eu>
Date: Fri, 31 Dec 2021 12:51:10 +0200
Message-ID: <8735m9jbdt.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Anisse Astier <anisse@astier.eu>, Daniel Dadap <ddadap@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Dec 2021, Anisse Astier <anisse@astier.eu> wrote:
> This patch series is for making the GPD Win Max display usable with
> Linux.

Thanks, pushed to drm-intel-next. Sorry for the delay in dealing with
the patches.

BR,
Jani.


>
> The GPD Win Max is a small laptop, and its eDP panel does not send an
> EDID over DPCD; the EDID is instead available in the intel opregion, in
> mailbox #5 [1]
>
> The second patch is just to fix the orientation of the panel.
>
> Changes since v1:
>  - rebased on drm-tip
>  - squashed patch 1 & 2
>  - picked up Reviewed-by from Hans de Goede (thanks for the review)
>
> Changes since v2:
>  - rebased on drm-tip
>  - updated commit message
>
> When v2 was initially sent [3] Ville Syrj=C3=A4l=C3=A4 suggested that it =
might be
> a good idea to use the ACPI _DDC method instead to get the EDID, to
> cover a wider range of hardware. Unfortunately, it doesn't seem
> available on GPD Win Max, so I think this work should be done
> independently, and this patch series considered separately.
>
> Change since v3:
>  - edits following Jani's review:
>     - The EDID from the opregion is now only used as a fallback: if we
>       cannot get any edid from the edp connector, then we attempt to get
>       it from the opregion. This works for the GPD Win Max.
>     - all other remarks should have been taken into account
>  - rebased on drm-tip
>  - added Co-developed-by
>  - reordered signed-off-by and reviewed-by in second patch (thanks
>    Maarten!)
>
> Changes since v4:
>  - checkpatch.pl fixes
>  - rebased on drm-tip
>  - Note: patch #1 is incomplete, still missing Jani's signed-off-by
>
>
> [1]: https://gitlab.freedesktop.org/drm/intel/-/issues/3454
> [2]: https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.=
17051-1-jani.nikula@intel.com/
> [3]: https://patchwork.kernel.org/project/intel-gfx/patch/20210531204642.=
4907-2-anisse@astier.eu/
>
>
> Anisse Astier (2):
>   drm/i915/opregion: add support for mailbox #5 EDID
>   drm: Add orientation quirk for GPD Win Max
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    |  6 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  7 +++
>  drivers/gpu/drm/i915/display/intel_opregion.c | 55 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_opregion.h | 10 ++++
>  4 files changed, 77 insertions(+), 1 deletion(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
