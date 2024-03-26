Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E413588C910
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 17:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289510F0F4;
	Tue, 26 Mar 2024 16:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsfXTOeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4393210F0ED;
 Tue, 26 Mar 2024 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711470329; x=1743006329;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KuKdKRva7inKZtOkJt9/snKXR05One/nepjuVxP0OFM=;
 b=NsfXTOeMddxNgnpo8XEMH+b64/Nf51WJHlZnRXpl9PGmIi4xagx+CG9z
 hmavxfF3/zLKhGONYSzN/OVl9qApV+inmyPDYYFvpF4R4yH3Tr7dgZGLH
 z6ccGZphO9eoKc12PHlG8s/Rw4KVeX7/1RyiKYNiq6krOHEHerG3JLKF7
 1FOY76sbpkwFLnHReftjkFya4t7IC5xOTrFMvWSXk9EpTkgB2vuCmS5x/
 gz9LcQQFccHiKaJh01eABMeFM8REe40R2ue9e9SDJNNpZ4vKwZ5Wr211Y
 EIqg/CPVT1Pp9qwxHpEOKPpeHXUqBwHj54VkbCU557sJZnqtFrmzzv2n3 g==;
X-CSE-ConnectionGUID: JDqgKmZTQP+h5gO/AekmPw==
X-CSE-MsgGUID: fqyU0TelQ0e/uI6a4QQubw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="7131669"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="7131669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="53483987"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 09:25:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 09:25:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 09:25:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 09:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMLLup+oxgcX8QR4xkCX6VUFZwM8Rk7anrQ4YkHPaQHZ9TIVIz9+rLH9x1MR3kF1P5xC4U18OpnpAJtCqn1hcc4bIamAw3O1lQM8LYsIwijl+ZvSr73a5U07YHz/HT3iz82L6T7S9+G0VHw5GyVGuQfqryPZYJgIYmqqd/HDnfissBG4jPri6bs8nkdA+f3zuGphhVfd2NygZP6tYSvfjpz1KrA9ysd+OJ/ofoeF/Tnc7jgyN/DMvLpRFzldLKaJwwxU9kob8C3Qb/mpa4UtkDHRVaGa+/oKUq7d2cdCOg22CYnWNyhoTl80jY810TtEzNHu8elCFu67/oea+JNLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BryFxigkURl8B2+ifV4qPvPp/l2n0RFh8y6lK2rUYo=;
 b=Hp8Alb3afU9RIPENbq7+SJz+7ReAw7nvKdFE7V5mZdXqNWlTjhMZ+PLvi4vrv15Pe3ybv/uciTmxGde8O2RAzks6cPE1/0FLmpv9YsvyZoBXTDAtbRI5p1ERPQgEKHNE2nUY8I2B1rcD8e/gE2qPoZL6bAjK+MlproQfpowk76HcztwTZlAE0vmtzkIfnotpvYe+YAy0MKe1i5PpHbmDqtsZGEvLz4oHKFOWeTYrnu2NT0sMgXsXz7wky46yXpphYmZvP5xoU3WwFUtMTblVrtYsFt5DEOVgoOUpqBlIsPTHMyjYe3/4pLXuScEuSoiJPFF11mceWvaTWp8O/FzHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by MN2PR11MB4535.namprd11.prod.outlook.com (2603:10b6:208:24e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 16:25:26 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 16:25:26 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>, "Buxton, Mark
 J" <mark.j.buxton@intel.com>
Subject: RE: [PATCH v6 0/3] Disable automatic load CCS load balancing
Thread-Topic: [PATCH v6 0/3] Disable automatic load CCS load balancing
Thread-Index: AQHaf5oW4CU+kiU/HESYCjQ3QZ7zDLFKNQ4Q
Date: Tue, 26 Mar 2024 16:25:26 +0000
Message-ID: <BN9PR11MB5275951CE65489FEAA8BA9BFE7352@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240313201955.95716-1-andi.shyti@linux.intel.com>
 <ZgL2o7c0R_Z7shFJ@ashyti-mobl2.lan>
In-Reply-To: <ZgL2o7c0R_Z7shFJ@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|MN2PR11MB4535:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zyQE3NXmi6thFTKImH6wD43W+hnwHdBzwHg1+ZTiJXZ9SirLWz5xGy3AkHn642wNSkf2wGy2KJgnEwNPmazZMUoOZ5zTVLwC4tmj4B3ZfAuSdGe3ITWvX3LqetOmteNUX74waz++6UCr3xbmiRNUzbK3KPRRLs99xr/m1ECaDbIZczleyjqXdIx8tNLhIMTI4YnVH69QZXcuSZz1EcN3ai8Ni6tChk8j1rYs7N4PizBl7bd5UL6B9/XTlp1ouHepGbeSu5Cjxwyssqw9+s4QYxGxSPQrTHSf+AVbdRWuXMzCYCxQnTh8klHbqyHJVbupHcayHU3Mt8rsHomu7B4pVw2+jc+ELNOY06fdoZair34mW73nSHSzTwbgkoUBukXkobiF9eokeRwOVw8X0otfLOMPUPYtKBIzmAmbmmF5rCddLdkSQT+OYOWx6hV4FL+A9gHaquHmuVecB73y2iOAbYbF4GJFK4aWPaAPRuF0/6QFc5Zxo/zW0ZFE+pvkXY0XfZExJbOjUyPAt/aUY11uVb8zVTUycUOgAqOSGsagkEmvQOyIPPl5+TbuSzmC7+tX/bhM2/jBrQWAMDts/yFru/2Snphl9IfG33Qq8fI8QvlT5OE3P3EKlCeHfwDoUgzbeLjxUpWuEJU2Yfp+y+guK3/pv7e0+j0pBGcGzfkUTwQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bYzZIoXHPCsD2Ggsid0OIiXjhOeXa1UoykwXdc7BZideMMGgAb7PCLbSSuWJ?=
 =?us-ascii?Q?UTGBGd0A+bLi0oFb10YVGtZDIP4KdXALK0amGEefXoHg8K1EJA/UdWC2TTsY?=
 =?us-ascii?Q?srpb1+rlpiNrfHmBxt+5XbxODNarqV/eXip1lAjE1xhwLuUyenG9xxUUtHV7?=
 =?us-ascii?Q?fceonfhK7VJfc5E0SxaWUMaJTC7kSTnQRqrl5M8EkmSQc0s+NJ3kLaHtfG+9?=
 =?us-ascii?Q?mWcIaoWgYiSL0s0Wh5/znsVbtxRm90PQZRekAiZ/00HSVlPJEfH6l7IZ5/qo?=
 =?us-ascii?Q?sUCFjpsFxCfbA99MRe2RcuXPYJIFW9fxb6lKfEkOXWVkE5+SahZiV7lsUKj/?=
 =?us-ascii?Q?jZuGDZwS7SJ7JtUIgLtaEFQ5ddeNr5Krd7xp67cr9xV4IchNTUx/zCwNSr6k?=
 =?us-ascii?Q?KSYKs9yo5oVAscbuBbCcYuf6vuiTBqSLRES8TShEJGDNpi5CQHv4Hl4Ssx/i?=
 =?us-ascii?Q?J4MEFGOBCMsRihjn3tUFfMVK3wjLRdqjBG7cHM9KFKUpoN7knGw91snTMMIK?=
 =?us-ascii?Q?BCoy87PFRb+GRLlG+ruSqJGNsetKyjk9kmKaNsLG7i4WTGhZxdWJRve8l85s?=
 =?us-ascii?Q?9bplcPewNNgvClQr73FUkLRYk6aqVBfgkPz5E+GxRQsDoenzvkFDqKLyylAE?=
 =?us-ascii?Q?56DBgR+mSMK2B4YfZn5WzAPujtuYBr6wZ9+/tUxswDxuDoW5k6m9oRhG5AyM?=
 =?us-ascii?Q?ZxjoPxlm9xzBG1jLOqYl2BX+3T8quh/0H6urkkNHkdQ6TZcJXZO+Dxbb/m8L?=
 =?us-ascii?Q?a/D0urmL2IAWaR07fWrqyj3/CCiztrqiWZW+i1N2T8E8qLHx6BMsSRejgKIl?=
 =?us-ascii?Q?mOwhiLezvxdcsU/dFUhbOD5ZtHPyeALf7J8i7RXrZRuBfvFZewfH8pvcrXEJ?=
 =?us-ascii?Q?YkcyG/E0SNl20RJImI8oJ+ogq9vD3XIaO9dBl8gXZQGHjIBNw8N8byhN/cu7?=
 =?us-ascii?Q?7VeHhdr7qdrRFJW6tastdRXcXcR2fZQYHWyW7nIPOQefstq1xgWP0/2yhaZ7?=
 =?us-ascii?Q?gFROlXdDjyMvoQdw3Qv+F52uyeMLxk9f9vJUujvmBWwXuaWZ8HMFnNDLkwsx?=
 =?us-ascii?Q?6e36J+NPpPu7U7wnSWd/VxFoCXdxC7lRgVfz9+82SNzthdjm2CQj+MgdJvB6?=
 =?us-ascii?Q?zFajkyOO7D/bAblIyaOlQYDhlv1duycUaG8Gfv3H1cb0Vn9RL+lyH3UZfphq?=
 =?us-ascii?Q?Ss6cMZB/rstme1QFD4u3sNKwzPwEak/SDLESEE8wUpJAA5BwDS9n/jMpnWs/?=
 =?us-ascii?Q?BhcCgvKvzRKEdibB3i26ArkCg15OHUSAtyvFK8OAa5CqYA13Ry14t0cyU7uL?=
 =?us-ascii?Q?ZjYcs4NQpW2yvx3sFJiDek1RagiaLlyEImKwSjrfrh/xF7332bmekyGsX2t4?=
 =?us-ascii?Q?4jYRWpYerA44tCiCQCYF8zSDDAzqIjdwnjRDeOB8NCvQukePPxuBw3ICe5lq?=
 =?us-ascii?Q?3ZSEZalHv5c7scnLYCVZ41MXE76+jXGcWDHQDuumsRQWYNVXsGovFXKDYrnP?=
 =?us-ascii?Q?MCQbd/552AdeQUrW3wyNjlNX+z5bPr5urwG+tf2ruP9EEGhdbSu0RJgt845C?=
 =?us-ascii?Q?3qsgbYINvnQE4U3lvoLXe++lpPx629gFiNIlxith?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2048380e-e447-4f4e-9e65-08dc4db157fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 16:25:26.0241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4WfNsui56v7365P078xhSdFpxcPAx4qjEARS0k81lXeRt2mlKYYfbitnpaQSSpg7rU4RnfMVq4e2Fr7lQUBLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4535
X-OriginatorOrg: intel.com
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

On Wed, Mar 13, 2024 at 09:19:48PM +0100, Andi Shyti wrote:
> Hi,
>=20
> this series does basically two things:
>=20
> 1. Disables automatic load balancing as adviced by the hardware
>    workaround.
>=20
> 2. Assigns all the CCS slices to one single user engine. The user
>    will then be able to query only one CCS engine
>=20
> >From v5 I have created a new file, gt/intel_gt_ccs_mode.c where
> I added the intel_gt_apply_ccs_mode(). In the upcoming patches, this=20
> file will contain the implementation for dynamic CCS mode setting.
>=20
> Thanks Tvrtko, Matt, John and Joonas for your reviews!
>=20
> Andi
>=20
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> v5 -> v6 (thanks Matt for the suggestions in v6)
>  - Remove the refactoring and the for_each_available_engine()
>    macro and instead do not create the intel_engine_cs structure
>    at all.
>  - In patch 1 just a trivial reordering of the bit definitions.
>=20
> v4 -> v5
>  - Use the workaround framework to do all the CCS balancing
>    settings in order to always apply the modes also when the
>    engine resets. Put everything in its own specific function to
>    be executed for the first CCS engine encountered. (Thanks
>    Matt)
>  - Calculate the CCS ID for the CCS mode as the first available
>    CCS among all the engines (Thanks Matt)
>  - create the intel_gt_ccs_mode.c function to host the CCS
>    configuration. We will have it ready for the next series.
>  - Fix a selftest that was failing because could not set CCS2.
>  - Add the for_each_available_engine() macro to exclude CCS1+ and
>    start using it in the hangcheck selftest.
>=20
> v3 -> v4
>  - Reword correctly the comment in the workaround
>  - Fix a buffer overflow (Thanks Joonas)
>  - Handle properly the fused engines when setting the CCS mode.
>=20
> v2 -> v3
>  - Simplified the algorithm for creating the list of the exported
>    uabi engines. (Patch 1) (Thanks, Tvrtko)
>  - Consider the fused engines when creating the uabi engine list
>    (Patch 2) (Thanks, Matt)
>  - Patch 4 now uses a the refactoring from patch 1, in a cleaner
>    outcome.
>=20
> v1 -> v2
>  - In Patch 1 use the correct workaround number (thanks Matt).
>  - In Patch 2 do not add the extra CCS engines to the exposed
>    UABI engine list and adapt the engine counting accordingly
>    (thanks Tvrtko).
>  - Reword the commit of Patch 2 (thanks John).
>=20
> Andi Shyti (3):
>   drm/i915/gt: Disable HW load balancing for CCS
>   drm/i915/gt: Do not generate the command streamer for all the CCS
>   drm/i915/gt: Enable only one CCS for compute workload
>=20
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 20 ++++++++---
>  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 39=20
> +++++++++++++++++++++  drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h | 13 +=
++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  6 ++++
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 30 ++++++++++++++--
>  6 files changed, 103 insertions(+), 6 deletions(-)  create mode=20
> 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h
>=20
> --
> 2.43.0

Acked-by: Michal Mrozek <michal.mrozek@intel.com>

