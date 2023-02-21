Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FB869E767
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 19:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E19310E2C0;
	Tue, 21 Feb 2023 18:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A81910E149;
 Tue, 21 Feb 2023 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677003811; x=1708539811;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Au1BiZQYX0QvgLqvgxqabBRUzC6LtzmciLWkT0XjbJQ=;
 b=MN9+ABDANe7vdu6pMk0eo5037+cJoUUbz+ouS2Ekbq+exenbeJDP7bN9
 nLnGwOCskhgrrBY/f4Gc++eNOfKoydy6SiX4f96g7+POuvXKPIu54hXb0
 ndquRhbUspGjUcMXYCoQaTx0rKH5Ol67M/lI3zwRRauuEqLQUxcrljcG7
 pOvNfeeWLQgwvufEPqBCY8LNpSHhcY4NySTqeaHmz+0wantCyzFZ3RLVj
 7IK5dV+eDY4ectgKdt8yJ0nDyxB5ImaI1zcnXzD4zS6fQwesQ81lC9OcJ
 7d4At1OWX/uqGHMVn86oV/uLrzHqRbTnDETcTPImrq4QZNSrvf19t2GJw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316438542"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="316438542"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 10:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="781096963"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="781096963"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2023 10:23:28 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 21 Feb 2023 10:23:28 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 21 Feb 2023 10:23:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 21 Feb 2023 10:23:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhlJflSgcjMc86ATbKPS2UVO6oMrP24c+IH5dFGwaPU1SDFhq/ky/yxsNDnCDJ8rQdZOZpOPF+im3YCmmA4Kc15Df2DpxFS4NgCYxHGz0lYufoz1pK4d5/DEZRMwu/QzcVPhGFC6yireG+kF/x99ddyyrDdMq4pwbJ+7Bz4tRO3zS7CIZ7g5ZvezKrLrr13JDN4cjeZh1+jlvv/kstQ59hLdTnMHTaYmErpqFC2nGnHd7JCcuR5ywClIyL6Lz3L1i28kaZDxktvkWAGLFPMCrHKceByhvNpI3MlUcj/7rnPXQCk3LZ+FkymNhVoaYjnls1CLLJWTlD6d6eL2s2FNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiVJR2Jqu9Bh/487WHPfDxpUiq1qzuriM7o+TfG7Wao=;
 b=nFsHlec2FRHC9BDofeWCaRfnrf/yhr8UTd9JKZeR86ybOcYFU/W9x/N4CQh9/LjBF2qLpflfwm6Wto28Mvmtf50rSVHEIg4CcZ/AmUR/sBExjf+aTNr1afkQ86ejxLHD0V5Gpf0GiEDg4c/Wo5BrebQvQpxXWPgOyMoiKI6P0zK/DcvcVV4Y8cqeOR3ktbYBrhXbPoVI23n76SGODXxxLSRsbr0Zi+zkPaR/7Awe3XQMUI9Li6Y70cot3qGh/VGuAfaMypZHWlRP+rtNSlBj7tqW2ekAZ2snbKw0ZOyWtdpoQU172jGugsr5fWveE6P1f8bIFXIlJqPY44xtkrmLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5477.namprd11.prod.outlook.com (2603:10b6:208:31f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 18:23:25 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%5]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 18:23:25 +0000
Date: Tue, 21 Feb 2023 10:23:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/sseu: fix max_subslices
 array-index-out-of-bounds access
Message-ID: <Y/UMGWDtC593Ob9f@mdroper-desk1.amr.corp.intel.com>
References: <20230220171858.131416-1-andrea.righi@canonical.com>
 <c5edd07d-1535-9b25-9a48-3d71e5e22b07@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c5edd07d-1535-9b25-9a48-3d71e5e22b07@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5477:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b587a7-3637-4283-ae4b-08db1438b823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llTWr1Tm2sxZpGQvSMpKFFAreC6ggt/SGWaDH8K5vDgYORulv4G4NqlaaBre1WXXtNcnqGZS3t8L/YuQxT4YDevSVY/32gquaf8cMEM0aYdVRHeFwgus/1x2nhpMDQNIOlMMR0LLnkofKddbRPBhMzzoBvHVW55Myy2Rs4r41dd5ug1AKqg8ZTJNcrJpUYmRs6Fwhs5BZCWqIH4YeYYlfmqjWC0BKTua+0VQlhLBuwJ6ZvLQM4V+TiJir8Qd/4yYV9M7qU5xnBONnIefRdPFwcHK9NckWqTsS7CAQVJlcRkPzLEJFAZXmBuKcioFw00dez23UtiQpe3ovPzbor76gPgr/irCacwJUN8VD4P1ILOg/ceHrM/me0mAPMFNXLnxcrVKYHr8/Y6oRGLZKo93cqrxYP39A7CfJmVsgchSMRO819+vHsawMTPOi/r25LFE6B2pxMP5dIE/qEsa/h4n2XR/xXiTawpMsHrMMPtwEqJwKPD1Cb7KMCNpDG3lyLwOc84cuwPaFdXXwIVsNNEn7JttjeMGw9l/kPD+syRznbd/qQcYRNfNP1Qa5MUDlvyq3Swnx41DDqhzJZVLogo1bUcE955Et3gxN0OmeHg2kvfcHrZN9pk5DpynN/hRnaHGNc9Bp+ugIOxSrC8dpgnp9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199018)(82960400001)(66899018)(54906003)(86362001)(478600001)(4326008)(83380400001)(8676002)(6916009)(5660300002)(2906002)(38100700002)(66476007)(66556008)(66946007)(41300700001)(8936002)(53546011)(6506007)(26005)(6486002)(186003)(316002)(6512007)(6666004)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Rneple0sAHg0E/c2FnNgY6Bb7htMxYiBwvUVWQIk/oDgxQb4G6wToUpvRmY?=
 =?us-ascii?Q?MdyvLq4XPUrAmkj6SKBO7t0aQCvEDDFWPmYPF55H5uDBGnvG84vbPFqPupur?=
 =?us-ascii?Q?LBn8C3VfTp2JZpq7skhSqtoRNTO8qJDjQr+eR56x4Yj03/xtxTuCz46e1miz?=
 =?us-ascii?Q?8EFOmi1VA4rRWQ1eGzlLhhUlsSeJiZ4WVt63PRv7Vhog2U0F0PXT+q3x/E5v?=
 =?us-ascii?Q?NMxQSUW4EBvol2QugKk7JlR0bTLXP9b/MEC4j8/7HYs31bAXc/qOp3wDdCU+?=
 =?us-ascii?Q?yihZcNxX+/fYrFua/ALjP6wHDlzhfvhaPucK1V3TIqVOK96goPXIXh2ItcxS?=
 =?us-ascii?Q?t8NrUchG+GCen/25CvYd9KRUOSur51Tu3y9ISpEGODrpvua2LpK3N0U7ikdS?=
 =?us-ascii?Q?+8+MNFq1idCO3WcKwPIlZ3g3Mv6lsKDYUJKeSVwser1uNTiOYeUS5wbfUJuF?=
 =?us-ascii?Q?IyomlvcuoPKov+DS2VmVB5cTYwWHxhkTiD277ES0PQygC5aQ5mKgHY7oNXF7?=
 =?us-ascii?Q?XXa7EAX8ujIQqEzMlGShqTbwyvLpe4V47eGk/sH4G6hX3GGuU3Kzimt1Q9Fa?=
 =?us-ascii?Q?r9RGh71QYmTBfp2/p9Jvxsrgf1siL1jYhuISDoalEP1VLsMIgibCfrImLM12?=
 =?us-ascii?Q?usEGYKqR5GWEsi5pem89xoNNzyFxmXWeafTLXNopo5+fDgrjot2iMmeAa8w+?=
 =?us-ascii?Q?6Z5mU6OPKLoU8hGftcVzaE9bZ018STH9WE44KJX7IoylU4MeGG8ntnS5fmfs?=
 =?us-ascii?Q?3PTPvIpmWXmJJiBd61DQ18mwIrdQcJIDVBs1+Dhv9tzrbiO/gY5XBkTiKgvw?=
 =?us-ascii?Q?bi3y4Gu0Dz0LS+SQ/bH41u/M0Oc6OQPjAi12t/YJy1mfQ0ARf3lyaFbRokBF?=
 =?us-ascii?Q?xmxAUtrkX8KOHY8vP49xUG9N0XsstfpnNZt4/PjG4NBXKK9vhjS1rpbmiOFO?=
 =?us-ascii?Q?lO5BEUw4w1aUjcJ+NcujXbO9v+YssJ9whaEjujqKM86SRgOWJv6+7rc5aXCb?=
 =?us-ascii?Q?JDQlg80MLTU9yGyIgK9GyCE28vZTjpnxmqcKooUtnXCzvEyLDQwZe7H9IAF5?=
 =?us-ascii?Q?HlSr0SQtRNeyTZwLGSuBBbGt3UtLfp18v0jYW3uw+CY8dos26jlLCUoUKG6h?=
 =?us-ascii?Q?5G4ooTbk5Goe0PJEFMOOLMNBT20erECMiXDszLXpatLKLGU14OTXSp/cmjEh?=
 =?us-ascii?Q?fLdL+fZrX3Ap5lo63bixqDYlGG6W9/JpdYhKx90sHbUZ6Y17yVzarT5jae5v?=
 =?us-ascii?Q?HDqfVgMV4CZ3uaC/yANaxPyeemeqxVwcpnR88zwJPy/OyO4DZi9Hg7vzP6ct?=
 =?us-ascii?Q?0/H6t+bpgNtB4oCGzCrnelhmrU0L9CmKVkIanMuIXVzMy9opQ/vFhHM1dxFp?=
 =?us-ascii?Q?yO2o0Z2W9mRE+bARanlM56iT3hFkMUeVhZTE2vAh1V7t3SXz0i0PWaAmHQlM?=
 =?us-ascii?Q?JZwl3cRGvvRbuOGqFrWjOovcltrSmqfLR80SI4r8nZmdlhojk9thPA3uLPvv?=
 =?us-ascii?Q?TbXOgeBgkHGqR7nCXhWc84iTTYRhyvQkgLnBH04LNAve3voBPNXfTGK1mjFJ?=
 =?us-ascii?Q?NHaAymP7cL4A6o0yLZKGPL19Jsu5wWFPs0YOmauu4yTfKobVZFlfS16J8L8j?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b587a7-3637-4283-ae4b-08db1438b823
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 18:23:24.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3jgZknBpzJ0drOzf12dJ8uKpt6mYkFC/1bhjFXLsL8RCLSp//zQtXZwfFSPuus5kPVZhtw7/qqGDFfwOp/Ewe9BzLy5Vx5DcH2KYTL+ZJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5477
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andrea Righi <andrea.righi@canonical.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 09:01:24AM +0000, Tvrtko Ursulin wrote:
> 
> 
> On 20/02/2023 17:18, Andrea Righi wrote:
> > It seems that commit bc3c5e0809ae ("drm/i915/sseu: Don't try to store EU
> > mask internally in UAPI format") exposed a potential out-of-bounds
> > access, reported by UBSAN as following on a laptop with a gen 11 i915
> > card:
> > 
> >    UBSAN: array-index-out-of-bounds in drivers/gpu/drm/i915/gt/intel_sseu.c:65:27
> >    index 6 is out of range for type 'u16 [6]'
> >    CPU: 2 PID: 165 Comm: systemd-udevd Not tainted 6.2.0-9-generic #9-Ubuntu
> >    Hardware name: Dell Inc. XPS 13 9300/077Y9N, BIOS 1.11.0 03/22/2022
> >    Call Trace:
> >     <TASK>
> >     show_stack+0x4e/0x61
> >     dump_stack_lvl+0x4a/0x6f
> >     dump_stack+0x10/0x18
> >     ubsan_epilogue+0x9/0x3a
> >     __ubsan_handle_out_of_bounds.cold+0x42/0x47
> >     gen11_compute_sseu_info+0x121/0x130 [i915]
> >     intel_sseu_info_init+0x15d/0x2b0 [i915]
> >     intel_gt_init_mmio+0x23/0x40 [i915]
> >     i915_driver_mmio_probe+0x129/0x400 [i915]
> >     ? intel_gt_probe_all+0x91/0x2e0 [i915]
> >     i915_driver_probe+0xe1/0x3f0 [i915]
> >     ? drm_privacy_screen_get+0x16d/0x190 [drm]
> >     ? acpi_dev_found+0x64/0x80
> >     i915_pci_probe+0xac/0x1b0 [i915]
> >     ...
> > 
> > According to the definition of sseu_dev_info, eu_mask->hsw is limited to
> > a maximum of GEN_MAX_SS_PER_HSW_SLICE (6) sub-slices, but
> > gen11_sseu_info_init() can potentially set 8 sub-slices, in the
> > !IS_JSL_EHL(gt->i915) case.
> > 
> > Fix this by reserving up to 8 slots for max_subslices in the eu_mask
> > struct.
> > 
> > Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
> 
> Looks like bug was probably introduced in:
> 
> Fixes: bc3c5e0809ae ("drm/i915/sseu: Don't try to store EU mask internally in UAPI format")
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: <stable@vger.kernel.org> # v6.0+
> 
> Adding Matt to cross-check.

Yep, looks like there's one specific SKU of ICL that has 8 subslices
that we overlooked previously.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Regards,
> 
> Tvrtko
> 
> > ---
> >   drivers/gpu/drm/i915/gt/intel_sseu.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> > index aa87d3832d60..d7e8c374f153 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> > @@ -27,7 +27,7 @@ struct drm_printer;
> >    * is only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the
> >    * I915_MAX_SS_FUSE_BITS value below).
> >    */
> > -#define GEN_MAX_SS_PER_HSW_SLICE	6
> > +#define GEN_MAX_SS_PER_HSW_SLICE	8
> >   /*
> >    * Maximum number of 32-bit registers used by hardware to express the

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
