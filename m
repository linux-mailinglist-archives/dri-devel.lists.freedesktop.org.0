Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE062AF70
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 00:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F23310E091;
	Tue, 15 Nov 2022 23:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF6E10E091;
 Tue, 15 Nov 2022 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668555127; x=1700091127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BjiHya74Yej2ayLuy49qZ+ZLA+qM+Y2ULjq7R7ywal0=;
 b=SqdDban11IB/wuXVajQJUdqTbYKgjmHW6wDmaTWAiRJ8KIGHJ5A8UTHf
 qkg71dDYJDOw2+Zc/05rrUM2rru02U9PxD4gRcY9EhmNKvtOe3u3l6AAN
 NFNHzjfsb5wLCzOsTXCXSzEVz0HnN0AJ8Hn5QtUOVHBv5nh9pNFSLbEey
 oWCq+Zzu0eDgm8JPtfplrLGMG5fV+gCdcZA96hMBQQ9ZEa2wNW15GWUmQ
 /kZFL2nXZvoYGK2YcmKmEj+zO6k5slfQEZvR14/vAZuEkaqZtggzdK0vq
 RJ+nrWWop+vRs6Ieal8UEun6Pb0/THcmFy0NQyy9evPkChgxtAo4nJAPf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="292104567"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="292104567"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 15:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="589972531"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="589972531"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 15 Nov 2022 15:32:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 15:32:06 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 15 Nov 2022 15:32:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 15 Nov 2022 15:32:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 15 Nov 2022 15:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bebKENiHaHToik6adUrQIADbK2s/S74+ezjusmA05HzfqMyCghZ8nugPNJJROQTV3ap9ZPmSdsKzFVhe8MlytWKHS151L95XC866Cg+VEcSCAZMLH82oAkduQwDNkvqxbQfj/IkQQ1uBw7ackvMCKKpqNyw4amOI3s4ECbx1ctovMyO8yfVfmfrBh7NcF6bjV6NWzhCFW+eEn13Llh2yrnRnZtnFCIb/9TJSFKCq8Ygm7lRlUo1Bgvt4YTz82Ozuyp6wzfUjEf5d1B/lQDt3xVwW81YF5c5jINNIZC90Cu9A5KZofzQKJHiOvRM9YT60TiVB2njfrwPLBQaWH5btXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbGX9spJ4IR8ie7D0uBDkkEjZ97FwNGW+8MPuON+m2I=;
 b=Eo2euBbqJFOpFcuRhSTMkcxznSsxn2vz072FSKmZGBzx99MV1o+IFIR7uEoKMQzKnhYlj/cLAilh4rB+uvV06ffbPQviShUHDRU+3iUoxGZas11QN5dH1y5gvIDV0sj2yKja7mSuSPi02ZDxgqwCBn491iaS0Y+J10ogL0iE+zhgI3s77YQ0QQrO4BjYrvnLBw5xZb9lL4lNAFhzT7uZQAA5xi087WgsMWIUHoNy5TCIXSGaOJRVyBGgv3Ajrq5CXYKhSPG/oCLCrRE3hut6vaEhDnujBVdk1tfM0OGLSuUD4HoFo03CwwFUueFxqDK0SnJVR4wuhUc+d5/0/iCaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 23:32:04 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 23:32:04 +0000
Date: Tue, 15 Nov 2022 15:32:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915: Update workaround documentation
Message-ID: <Y3QhcTyGSVUPASFj@mdroper-desk1.amr.corp.intel.com>
References: <20221115192611.179981-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221115192611.179981-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: c8323950-7bef-46cb-cc0e-08dac7619a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KYHwMk/wMVjh8RqrckK5Df5Jnw1ih6gLYL0KKsscy9i6cPQkvMbLgsAeOICDpQehgp7PllTttfcI6v7AFpA1wefVjWGyNCnBFwS1EbTbxwxJC/zR0wIEa1hZYO3KsT4w6+Y0u79ZCA8gJLALeYVWKM2qTmJxG++VQ7EvyBiiuDS//Q2vgtW73PlM1AjOSHXVoJT8J1tBdn6p4m4CApSDnuXVIqnH3YjXKt63hv9jee8qcvvKC2WELa/rMIraDAzKbCDOv8/GKoQgXyCkdRAxy/qW5qzCPcFwD1Yzijk2lCTZHDLY4SsSDsTe69T0zfTejXSO/154yhjCKY4t1pE4tur754EC/2YYJb5/J57ysguL38ssuvxL5YKu4EI8Yl9smgUGw8800fuEsaCjG1OxKnaBm2Osvc+4KSOk1/h9sj7ajuAxRe227YFYYOJTD0HWLbycTKUpqHfQyEspOpgbLauaURbAWI/dAWjnWDKCiHN9tOvdgOOZVBU2PydtbwOOQXq5vZ83bCKojs+ctMHS+WM27EmaLB/Eb96HhWNoCwr/LSBDGfH++YiX6NJpMEE6vU2RQ3BqSvnGgbijLPGGKplqnTWu6lbJLEd5R6lOig7sopTglQvnC69cEXo64eumKApQZZSCsxNjfzi8m+hViyYbpkcKP4Kb+qTqKY9QaOxbi2uwIc9WQ3xQSEHIhxZMb6buRAfmTZXW6bHVxxsVMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199015)(6512007)(82960400001)(83380400001)(450100002)(66556008)(66946007)(86362001)(26005)(66476007)(316002)(15650500001)(41300700001)(2906002)(8676002)(5660300002)(186003)(38100700002)(6862004)(8936002)(4326008)(6486002)(478600001)(6506007)(6636002)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lfnFjQnlsMN99LfzYwicKdkGve/z/Ppsti8u8l6TWLwHDi1D/xP9eTuJfWP7?=
 =?us-ascii?Q?G1JRgR8JwfGKD3QhsXuCsRmo6Byr6MTgKjy9Uv3YuHWUvE5cBszzbs8yU7+A?=
 =?us-ascii?Q?VIE/0LYkO7thdhI1xM/oy7FDMrEJjv2gH1jno2QqcauawNHUCg2dUk+r3OLY?=
 =?us-ascii?Q?hiyWUt2qkGO5WuFYkpS2UOFKmaO68vdS7CQmhWgnB/WZzQf7KApoptuj8o7f?=
 =?us-ascii?Q?NcElMzbn2Z86gEuduLVVLR6z+ehvTFpR/++6L6cV6rHabDgqV/WicyhBT9Nt?=
 =?us-ascii?Q?q6cSBXFQGTYZ/UCv1g05IBtbDzv4UReuWFlKT8XFdy+tE9ORFdRFLOUraUd3?=
 =?us-ascii?Q?Q9qwcaHipHYJEzridZSSGfE2Sm+V9jldhTUOGzOoST0Uf58q/z/4eWFpc4nA?=
 =?us-ascii?Q?qWXs9d/ygFqP+U7SmAHIZP20iyLG0EQCaRuB93wqlV4tR0wS7PfI2vHJb+jl?=
 =?us-ascii?Q?S8ApBD45ug1T8vFL/6d6C3PVFPe854lEj+DYQ/KK1K4bSCyOCXHWMwAhxz/Y?=
 =?us-ascii?Q?TKe21z2gFnMqWD7x624J/RJzJ8KImVQOybCKPMr6Ya1zFx9D0//PkrL/ajC9?=
 =?us-ascii?Q?9gBzgAWD73CIccUPtafGWWnfO5Xa9mNXjKcKJjKmL0IGotR/zs0jRvMcJyUd?=
 =?us-ascii?Q?Io0TjMYEdxe3otfjRVKi+VSB87ppd9BIDVC4DGzbXhnQEAuXu/ka079f/6RV?=
 =?us-ascii?Q?MKnQTbQDZP56y7DYzX2/iocJnCX2OVvyqxDgl8rrWhK0qmEnVBIsdkYLgkwn?=
 =?us-ascii?Q?65nkrsA7xXwSUs16DPCh52vt5mv42cCqmWYi/ZXKVlr+NltcjEBK+1Acps0m?=
 =?us-ascii?Q?cpryWILSMi1hXf4QWth8lFj7UwuyshQFfIbip0ys0c7utuxuGCam9Z5lwUcI?=
 =?us-ascii?Q?NZbFxvFNlOlXxPqJGWC9z7q5vi3q41f6VjAJDBGZGPL4mD+LRJtoOcFxOvEU?=
 =?us-ascii?Q?TqHynLDaDBKr8+QDvp7R212NHGuNrkDD9tNuJQvhqiqZBU2QTuGyK2jnJkod?=
 =?us-ascii?Q?XVRGsPyyzXPc/Txbl6jBfpk+jku3CrttsAI4faTjP7JeENURn96sepZWRkC4?=
 =?us-ascii?Q?MqAdEkKPyZSDcaaxjlWm07jiUdb4YPm49QogaiCopwkDcojtbVFbpFfvFMZc?=
 =?us-ascii?Q?Dbb9f6D4QR1Lzu9B4Rdg9tQUH1DOWse9c5aBtxmH25OB9N3zGF4sHDI/jXLP?=
 =?us-ascii?Q?hmwsWvWYFXNhUIDeBT4NOFvtSiyZSMXFke6HJY5ARvHkiUZqdAjKPsiJlAE9?=
 =?us-ascii?Q?0mutRWHkI+aVA4z03rIdnNC73WX6u3Ba6kS4ByroxyOcaX7k2Z3Dw+1PQ0qy?=
 =?us-ascii?Q?d9hL8anVV27ASmTAdaPx/3Q8XOpn7D0g4UPUqdebgdfQT7bl2QPOq7a8nU6d?=
 =?us-ascii?Q?XG94RUbC9aMvMauRHjCwWKAqBUX6o+QApTD9wdPb03WbnwpglLwbIQpI5cCv?=
 =?us-ascii?Q?V/m2gV/gvXcKyecgcwFRyWFDCxUSgCxVBCyrMm7NCz7DeNSmXJkjL2d0Y4bj?=
 =?us-ascii?Q?aJ3gULHPBv5bof6H7uCoip7oPqMv4U/d46xwbv/f+7OXKS5nVvPFMsEz2qaW?=
 =?us-ascii?Q?wRv14LGI32gQ9KTZALiaO7DR+CpdtDkvd0r8u0UPinWL3B/4DeroqrmCeO28?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8323950-7bef-46cb-cc0e-08dac7619a23
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 23:32:03.9857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CCyYFUbwOqG5JVia/I1iBHONRgVOU/4z8jLttPu0ajLksl/3EP0JNDIEP+/FEeJ/w0IutbGsoPZh8i1QwxuDANQhDXA9fOPbbchOzsG82s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
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
Cc: intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 11:26:11AM -0800, Lucas De Marchi wrote:
> There were several updates in the driver on how the workarounds are
> handled since its documentation was written. Update the documentation to
> reflect the current reality.
> 
> v2:
>   - Remove footnote that was wrongly referenced, adding back the
>     reference in the correct paragraph.
>   - Remove "Display workarounds" and just mention "display IP" under
>     "Other" category since all of them are peppered around the driver.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> # v1

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 80 +++++++++++++--------
>  1 file changed, 50 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 213160f29ec3..290f9f91fdf4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -18,42 +18,62 @@
>  /**
>   * DOC: Hardware workarounds
>   *
> - * This file is intended as a central place to implement most [1]_ of the
> - * required workarounds for hardware to work as originally intended. They fall
> - * in five basic categories depending on how/when they are applied:
> + * Hardware workarounds are register programming documented to be executed in
> + * the driver that fall outside of the normal programming sequences for a
> + * platform. There are some basic categories of workarounds, depending on
> + * how/when they are applied:
>   *
> - * - Workarounds that touch registers that are saved/restored to/from the HW
> - *   context image. The list is emitted (via Load Register Immediate commands)
> - *   everytime a new context is created.
> - * - GT workarounds. The list of these WAs is applied whenever these registers
> - *   revert to default values (on GPU reset, suspend/resume [2]_, etc..).
> - * - Display workarounds. The list is applied during display clock-gating
> - *   initialization.
> - * - Workarounds that whitelist a privileged register, so that UMDs can manage
> - *   them directly. This is just a special case of a MMMIO workaround (as we
> - *   write the list of these to/be-whitelisted registers to some special HW
> - *   registers).
> - * - Workaround batchbuffers, that get executed automatically by the hardware
> - *   on every HW context restore.
> + * - Context workarounds: workarounds that touch registers that are
> + *   saved/restored to/from the HW context image. The list is emitted (via Load
> + *   Register Immediate commands) once when initializing the device and saved in
> + *   the default context. That default context is then used on every context
> + *   creation to have a "primed golden context", i.e. a context image that
> + *   already contains the changes needed to all the registers.
>   *
> - * .. [1] Please notice that there are other WAs that, due to their nature,
> - *    cannot be applied from a central place. Those are peppered around the rest
> - *    of the code, as needed.
> + * - Engine workarounds: the list of these WAs is applied whenever the specific
> + *   engine is reset. It's also possible that a set of engine classes share a
> + *   common power domain and they are reset together. This happens on some
> + *   platforms with render and compute engines. In this case (at least) one of
> + *   them need to keeep the workaround programming: the approach taken in the
> + *   driver is to tie those workarounds to the first compute/render engine that
> + *   is registered.  When executing with GuC submission, engine resets are
> + *   outside of kernel driver control, hence the list of registers involved in
> + *   written once, on engine initialization, and then passed to GuC, that
> + *   saves/restores their values before/after the reset takes place. See
> + *   ``drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c`` for reference.
>   *
> - * .. [2] Technically, some registers are powercontext saved & restored, so they
> - *    survive a suspend/resume. In practice, writing them again is not too
> - *    costly and simplifies things. We can revisit this in the future.
> + * - GT workarounds: the list of these WAs is applied whenever these registers
> + *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
> + *
> + * - Register whitelist: some workarounds need to be implemented in userspace,
> + *   but need to touch privileged registers. The whitelist in the kernel
> + *   instructs the hardware to allow the access to happen. From the kernel side,
> + *   this is just a special case of a MMIO workaround (as we write the list of
> + *   these to/be-whitelisted registers to some special HW registers).
> + *
> + * - Workaround batchbuffers: buffers that get executed automatically by the
> + *   hardware on every HW context restore. These buffers are created and
> + *   programmed in the default context so the hardware always go through those
> + *   programming sequences when switching contexts. The support for workaround
> + *   batchbuffers is enabled these hardware mechanisms:
>   *
> - * Layout
> - * ~~~~~~
> + *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
> + *      context, pointing the hardware to jump to that location when that offset
> + *      is reached in the context restore. Workaround batchbuffer in the driver
> + *      currently uses this mechanism for all platforms.
>   *
> - * Keep things in this file ordered by WA type, as per the above (context, GT,
> - * display, register whitelist, batchbuffer). Then, inside each type, keep the
> - * following order:
> + *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
> + *      pointing the hardware to a buffer to continue executing after the
> + *      engine registers are restored in a context restore sequence. This is
> + *      currently not used in the driver.
>   *
> - * - Infrastructure functions and macros
> - * - WAs per platform in standard gen/chrono order
> - * - Public functions to init or apply the given workaround type.
> + * - Other:  There are WAs that, due to their nature, cannot be applied from a
> + *   central place. Those are peppered around the rest of the code, as needed.
> + *   Workarounds related to the display IP are the main example.
> + *
> + * .. [1] Technically, some registers are powercontext saved & restored, so they
> + *    survive a suspend/resume. In practice, writing them again is not too
> + *    costly and simplifies things, so it's the approach taken in the driver.
>   */
>  
>  static void wa_init_start(struct i915_wa_list *wal, struct intel_gt *gt,
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
