Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 599B5628B04
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 22:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5459310E107;
	Mon, 14 Nov 2022 21:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596E010E0CF;
 Mon, 14 Nov 2022 21:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668459883; x=1699995883;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YwdcAbaiebleGg/bU9zOS5Pp3o+HNxe/AL0UHwsT2NE=;
 b=hiIhWzwzALEdf+z9NxeNFKkgASoU1nKCUnMHMF4kMZQ5yqC4GXCpx4Ph
 K/nTVXhJDlK1y10ai/PXRBngy18pa68bfRTS1RITYqrhVEaZFZIDcQBO2
 RzjID0O8xCdAzP4ZTRb6BGn6pIQvDwdCRxcZn2kVUTu0rypoYJP2k6xG7
 Gwcp3IXwzSzR/WDN6qp6R0qtkTZNaw1UZf6i2IParcCNbSas006MQHRtF
 pHQn5gd92F5LLH3ePhDmM4zp7p7RUhSaBCLf9Qf7R0mD5Po3Bxy55JlUi
 zS461CcCO+c9tm/AQOMVOFCOrlsy1l02KZdGl8cyFCcp1S2rildofwT34 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="309710780"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="309710780"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 13:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="781081074"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="781081074"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2022 13:04:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 13:04:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 13:04:42 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 13:04:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yp820vDFK2oC62w+h3m1yVCKXcLV0SPZ4BC1vO4JJ8RTGgz7aJvYHeU+v2eO7RDJwMKQDKwdnyWIDuFz4m00dO4oJdo2VAztITh4sG2jXUeCaSbD7SFSMc07M935WHTyunM96WnKdX9cGIv1q7bMPV/ioWVoBKr8XLP2NNDYkF627L/Oam/03k0uUELKRqtaAFkHStzUGHkXINDkSJ83IBcJTXpjervIh3WwskPkro4LQzf0tM6rS327wyIcCA/OkQS4y5IKXzjI4unUMaiQuRL1qGvu300k4z6Pdp0Rw7TW5013kaD3aNo14Io5Vsa3/id5GLwDniaub642Wzozeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk/mH10GjPk79S1RFlRRTCCJBwnzrOf++2GvD19BT3E=;
 b=Epljdku2qyzegDkTxgla10QzoR8DR0AscPiMX6afetU2R3nc4xchFke1+LurCOxO5jIyZW8+avsFYHaPhsEO6/6m3BYBTFyOkEzx8G/iqyGCH9Rl4ZjAGNzoY0UhIC02aeppGnU+5GAZ3qZ10DfEl1z3ifMcpqhNQE8RjwXKo4mwkm0y1qtF0LJwkMKWmjpSTXhaf/DwUoBhSRx4VCj+Gnnr1cJgh5phDnrLCSuMX58Z1cAifgrGS6JKwnPq+QYhzjh/PCV1t/Pjn0gNGpbdVJx74Ywk2r20tiXOZlgW8FJdIIWJdXKCQ7cZiYtcHTuVlZpzmBt00AWh+K5MX79LIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 21:04:34 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::6dfc:c022:bd04:fe3e%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 21:04:34 +0000
Date: Mon, 14 Nov 2022 13:04:30 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/i915: Update workaround documentation
Message-ID: <Y3KtXo5YxlXuhPbC@mdroper-desk1.amr.corp.intel.com>
References: <20221108003028.2350143-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221108003028.2350143-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0007.prod.exchangelabs.com (2603:10b6:a02:80::20)
 To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SA2PR11MB4889:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d825b1-2453-4211-fc6b-08dac683d42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0KM7mPzu6eXzL1VMUfsVLYX+KGFakOBkiTS/xKFkedi+s5vatc7BeLN4cUwR+Ngrh9wnaHX6q05NM1Iz1ODOSNVbnakQqKaT8g4wyBCpbpy8HbHxMzNG17jvn7H2WvEmsyzTWTrcowBjc70pAh3LmKV45C1xuz64mE9/qASuB7IYxO9c10nE1kDWo1ntMFiVC44PV+/xH4li9exrCHFJGzIiSkkkKjJACpIXbnBnd/U0ue30AYSK1xtA9Su4fNc2W/jM/6x84J23v/xV5dGSd41wZeRXw9akG07QAB4mRhxTRoSqHHTQZKLteHo7quBenYfU9EfTPSzTniAzeXwh6IkOeqRQT/LV0cuSAImYakAnFKwzDPjmwlyOw2kHFe2WIX9utrGBdUhhvxluAdmB4+LoPiyNcqV5V2jSxFUuLE4q21eyKQPymDppp2dctUrCzIYLYGYSfuTrwZgTl/sntlLs5Wp/odZrlkM4jOvnPG+/VEgnhysZRqyvdcqArPqO4KBUC+A5dvNZSoHnq/tgfWjtiuuWfOscaaPvU8V6faJoOQKCDSnC4BE1EVjBSa61dAiikJnfFAtGT/srHWID9LlV/zlJd/t3y41pGf06469kMsgqVI8FXOxNv9wnQ2CLL8m60pxB2/xKfH9ndFFzRWa/nfJMDkf3QIQdyag2rLJwu6OW6MJvSJM2rYJGkrRc1d0rSH0eVEV6G9brKl1myw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199015)(41300700001)(6862004)(8936002)(6486002)(478600001)(2906002)(15650500001)(5660300002)(82960400001)(38100700002)(83380400001)(6512007)(26005)(6666004)(6506007)(86362001)(6636002)(66476007)(66556008)(186003)(4326008)(66946007)(8676002)(316002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mb7WQQZ/4KKFus9FoXSURa/yWkC2QQrI4kztjcTqSmZXbv707EZwTa2E28Tr?=
 =?us-ascii?Q?1MOHCf72bv9kgAtefXvepD4EISrqvgEA71F1JHlBeBWJkts+Vqdhmw+Owu+v?=
 =?us-ascii?Q?g64cKnXyLUDI2Uopi+pVKOao0H3PWGtuyXZ4GU7Hx7pAMWHvv871BNcCSRLx?=
 =?us-ascii?Q?eIuahkei3uQ0SdeL+pHQcHEpkWf3Tn3s0DHV4Xh7r5niFyqed1vDDtMx5FQ/?=
 =?us-ascii?Q?ap0mgro8xiVis6mWAZ6l7k5OjjTv14EhXVmXBZ2SZ/gRfVtrVxwEqXJ8+tnS?=
 =?us-ascii?Q?K4lMlm9jFaRm5DfB3QWI/gWGIpWXc0tvkiGWrSWUOP2bob1KX2FTHh+xw6Vv?=
 =?us-ascii?Q?gUDajyzS3yGZtF+cNHe8L3Rrs5J75CEUoNPcnJzlAAbZcXZh85x6z2L99lz3?=
 =?us-ascii?Q?1CSH8R9NalWPW4/EIoGMUvsTYDy5rXrNwXr8Cnczt3BR4aVOyLbF/Gk2DfB/?=
 =?us-ascii?Q?iIfeYtmQeABZ4O0x4m0gc8UGMStOSK75ibYBi3uaT5v8YxJB7m2e84h/epzv?=
 =?us-ascii?Q?fjcKa7iZTLi0JXJbzS/uiVgyERVrZ3QlfL3zDYvavTrlk2s2phUdMC1KfQJY?=
 =?us-ascii?Q?fJ3PzH9HopDacmDR9oM4Jf/b7CJkJFIFMq2b2L/8M89tAhDtYB58OjWrRppQ?=
 =?us-ascii?Q?HyfYxwUFrIXBb13EvWpVwKxRb5k9mh/ZG1plW+ZsFjLU9o5+i8aDuqvPqcEq?=
 =?us-ascii?Q?zj7Y1FCbedMDk41hNnz00hr1h0EJ2XZ0h7QaHy7S6vo/kXeKDMnePaeXXpvi?=
 =?us-ascii?Q?gGDqne3smKxAcOT5XCsfFlY4pAE49IDtIvfPsY7zhsNPBgom7GJMhis/r21r?=
 =?us-ascii?Q?lFvCs72YYxBxPmz2tePT9LVON9z2tC9SmByBwCBJNJE8IcB1pAPWEux/FJI6?=
 =?us-ascii?Q?KFbXAT7HWRMhLq/HYD+W9R9HfcpJaHnYT8QD1ycNKk/3upwLxzgysv1uHEp3?=
 =?us-ascii?Q?6uUO52VxVfVXi7bnkH3m6QGT3H8MqR5EofzFSWYe+OHfX4jEYwZEvfMeUoaz?=
 =?us-ascii?Q?eyNLTK3TB5cUem8VDAeDfWgAfJU/HdSBbWq1gRyvKV/qByOG0OqyZcHZsDmM?=
 =?us-ascii?Q?SMBRJg3I57n4GBLeW3AHseB7Fqicwg3vYhKzxIdZwkf1tVG4nYVaWpU5wtXk?=
 =?us-ascii?Q?z1+ROS6jWkjZQ7OncOOtLRmpC4Z89dYWgEsiIuBiNvf4W+2nMtRUett4T7YJ?=
 =?us-ascii?Q?8iy/s+3g/340IKxhkMwnMrPLwuvtGJUkaXZoIORrP7KJrL3u8PAHdC8y5asi?=
 =?us-ascii?Q?47f7fn6M32o+I/Zpn8M9mcgKaJ18i//9bHVCleRCg97Gtd+XOiF93sfDSVAY?=
 =?us-ascii?Q?Jbzi2MurX6wHAW4OMyO/mReQ/Mnf/PLQkwECyUCbCvUFp+V68ddGvrp5flXJ?=
 =?us-ascii?Q?A88LjJQ7X9/x18RAcy1BJgNkSRUXHJfVJbhoExRRXfvItSiZRwi2m8Q0a14X?=
 =?us-ascii?Q?dxEHc8kyny/PPHRH7hSx7DDZxU0mM062Bt3tnTguoSf6j6ddMWZ20QPA9uva?=
 =?us-ascii?Q?ZJk/0yRcGfhmD38BIQQLKMXvFIMl6kAuL6UBymPMzYs9NurcXUTh9If3fCcA?=
 =?us-ascii?Q?nX+ov39R3/9i6bJWDxVCRX0MfuwoC+UOIK9Z/bBdy6oX5LCkAVWv/NX4Yj4Q?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d825b1-2453-4211-fc6b-08dac683d42a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 21:04:34.7697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJSov+ww4UA1t0PuGJQIDks20QUd9n2rYUXApJTMFGxuUNObDmb5l4ckuHKj8ow50ZOnLrn2gGavvda9PPBacAI/HI6uxitAxPHrCqW/8Rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 04:30:28PM -0800, Lucas De Marchi wrote:
> There were several updates in the driver on how the workarounds are
> handled since its documentation was written. Update the documentation to
> reflect the current reality.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 87 +++++++++++++--------
>  1 file changed, 56 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 3cdf5c24dbc5..0db3713c1beb 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -17,43 +17,68 @@
>  /**
>   * DOC: Hardware workarounds
>   *
> - * This file is intended as a central place to implement most [1]_ of the
> - * required workarounds for hardware to work as originally intended. They fall
> - * in five basic categories depending on how/when they are applied:
> + * This is intended as a central place to implement most [1]_ of the

Your footnotes don't hook up properly anymore.  The original code had
[1] and [2], but the new code hooks [1] to what used to be [2].

Since we moved this file under gt/ a while back, I wonder if we should
note somehow that sgunit/soc workarounds and display workarounds aren't
expected to be part of this file?

> + * required workarounds for hardware to work as originally intended. Hardware
> + * workarounds are register programming documented to be executed in the driver
> + * that fall outside of the normal programming sequences for a platform. There
> + * are some basic categories of workarounds, depending on how/when they are
> + * applied:
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
> + *   revert to their default values: on GPU reset, suspend/resume, etc.

This is where the new [1] used to be referenced from.

>   *
> - * Layout
> - * ~~~~~~
> + * - Register whitelist: some workarounds need to be implemented in userspace,
> + *   but need to touch privileged registers. The whitelist in the kernel
> + *   instructs the hardware to allow the access to happen. From the kernel side,
> + *   this is just a special case of a MMIO workaround (as we write the list of
> + *   these to/be-whitelisted registers to some special HW registers).
>   *
> - * Keep things in this file ordered by WA type, as per the above (context, GT,
> - * display, register whitelist, batchbuffer). Then, inside each type, keep the
> - * following order:
> + * - Workaround batchbuffers: buffers that get executed automatically by the
> + *   hardware on every HW context restore. These buffers are created and
> + *   programmed in the default context so the hardware always go through those
> + *   programming sequences when switching contexts. The support for workaround
> + *   batchbuffers is enabled these hardware mechanisms:
>   *
> - * - Infrastructure functions and macros
> - * - WAs per platform in standard gen/chrono order
> - * - Public functions to init or apply the given workaround type.
> - */
> + *   #. INDIRECT_CTX: A batchbuffer and an offset are provided in the default
> + *      context, pointing the hardware to jump to that location when that offset
> + *      is reached in the context restore. Workaround batchbuffer in the driver
> + *      currently uses this mechanism for all platforms.
> + *
> + *   #. BB_PER_CTX_PTR: A batchbuffer is provided in the default context,
> + *      pointing the hardware to a buffer to continue executing after the
> + *      engine registers are restored in a context restore sequence. This is
> + *      currently not used in the driver.
> + *
> + * - Display workarounds. The list is applied during display clock-gating
> + *   initialization. However most of the display workarounds may be considered
> + *   to fall under the "Others" category below.

We don't have any such list today.  And if we do add one, I'm not sure
it would happen here in gt/.  Maybe we should just add this as an extra
"or" in the "Other" description below for now?


Matt

> + *
> + * - Other:  There are WAs that, due to their nature, cannot be applied from a central
> + *   place. Those are peppered around the rest of the code, as needed.
> + *
> + * .. [1] Technically, some registers are powercontext saved & restored, so they
> + *    survive a suspend/resume. In practice, writing them again is not too
> + *    costly and simplifies things, so it's the approach taken in the driver.
> +  */
>  
>  static void wa_init_start(struct i915_wa_list *wal, const char *name, const char *engine_name)
>  {
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
