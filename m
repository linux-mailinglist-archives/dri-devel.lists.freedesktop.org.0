Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB427F137
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 20:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126B96E057;
	Wed, 30 Sep 2020 18:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7526E057;
 Wed, 30 Sep 2020 18:20:58 +0000 (UTC)
IronPort-SDR: 0GTwuAEO5zgEGtKKFBo3FQfYm1xgR8DfuUL2x6ebHtTEDlCdJcIA33cugOqwk/bdYefuBUkEP4
 ca/hvTuG+0Aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="159902024"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="159902024"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 11:20:52 -0700
IronPort-SDR: 9Vb3E6ozvWB73NseKajot+EllQ2++xbyrAiunoR9Ya0+hNXa+vxD09CE21wMEW1aA14RUElCgw
 hLBdRA89Be2A==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="294112582"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 11:20:51 -0700
Date: Wed, 30 Sep 2020 11:20:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/edp/jsl: Update vswing table for HBR and HBR2
Message-ID: <20200930182049.GD2245633@mdroper-desk1.amr.corp.intel.com>
References: <d235e6f34182e327d8bb46383f6c3ef518b5fc23.camel@intel.com>
 <20200929200201.GH6112@intel.com>
 <a4a075597c7d3e65b25598ab696a59eccbd2a069.camel@intel.com>
 <20200929203022.GI6112@intel.com>
 <20200929210144.GA2214475@mdroper-desk1.amr.corp.intel.com>
 <20200929211148.GJ6112@intel.com> <20200929215958.GK6112@intel.com>
 <20200929233822.GC2214475@mdroper-desk1.amr.corp.intel.com>
 <20200930103812.GL6112@intel.com> <87zh57mnft.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zh57mnft.fsf@intel.com>
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
Cc: "Pandey, Hariom" <hariom.pandey@intel.com>, "Ausmus,
 James" <james.ausmus@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Surendrakumar Upadhyay,
 TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 03:57:58PM +0300, Jani Nikula wrote:
> On Wed, 30 Sep 2020, Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wr=
ote:
> > Now we have an actual difference between EHL and JSL so we
> > should split. Granted it's a bit annoying to have to do it
> > just for some vswing tables. Ideally that stuff would be
> > specified in a sane way by the VBT. But since VBT is generally
> > useless we need to deal with this on a platform level.
> =

> Just to recap, we have three basic approaches for differentiating
> platforms based on PCI ID:
> =

> - Separate platforms, each with their own device info and enum
>   intel_platform, using IS_<PLATFORM>() for checks.
> =

> - Same platform, with subplatforms, using IS_SUBPLATFORM() for
>   checks. Generally only used for the ULT/ULX checks, but there's also
>   the CNL/ICL port F case which is perhaps comparable.
> =

> - Same platform, each with their own device info, and a feature flag.
> =

> (In this case, checking the PCH is a proxy; there is no actual
> difference in the PCHs to account for the different values to be
> used. Mixing PCHs with the platforms would lead to problems.)
> =

> We've been told JSL and EHL are the same, which would argue for keeping
> them INTEL_ELKHARTLAKE. We've done this with other platforms that are
> identical. However, now it looks like they're not the same... why not if
> they're supposed to be identical? What else is there?

My understanding is that they are identical, but the design guidelines
for the *motherboards* that they will plug into are different, which
necessitates different electrical tuning values to guarantee clean
display signals.  Ville's right that it would be nice if this kind of
stuff was just available from something like the VBT instead of being
hardcoded into the driver, but sadly that's just not the case today.

So yes, none of this is related to the South Display which is the only
place we usually care about the PCH in the graphics driver.  But PCH is
correlated with board type, which is why I suggested matching on the PCH
in the first place.

If we really want to split these two platforms then I'd suggest we add a
new macro like

        #define IS_EHL_JSL(i915) ( \
                IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE) || \
                IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))

and use that everywhere else in the driver.  For the vswing code itself
we'd just do a direct IS_PLATFORM() check with just one platform or the
other provided; no need to add IS_ELKHARTLAKE/IS_JASPERLAKE macros in
that case since it would be a bug to differentiate between the two
anywhere else in the driver.


Matt

> =

> BR,
> Jani.
> =

> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center

-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
