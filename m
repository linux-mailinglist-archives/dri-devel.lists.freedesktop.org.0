Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B47BC23B1
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 19:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B8210E6F7;
	Tue,  7 Oct 2025 17:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lyU4zg7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3A10E1C6;
 Tue,  7 Oct 2025 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759857341; x=1791393341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ndu/+48ATtqs9oKu/Ja6E867ipeaVYW9z4UmdW+kAq0=;
 b=lyU4zg7hLf66SJZ+lC4/+sGVyylIWkLXzLqSC19HKS2998Bol5oHKOGs
 4Fstj7c8T/6tjmQlb5tfppCTQ8fvj71Tuqh6RjIDn9eoDUECnSl6Z/6oN
 UX+QMSlzIT9gRDtT/YaVadKKGgkrk5mQ4s6+FYKNqg07r6MBCpgNKNHWe
 GBkwPkzMF1ztX98XvRvJBCSclkR2hwfWYc41m9TPUSHXYMWsZNjE6xoyE
 Kxq0i/a9raYUbNF5kjUFhNOXPCsUO/1t6Iuhq3mCp12wsFW3uqwj54arY
 EO8eE+5dg5KDvq3YMyuarOkw40HPvD49ZTleif79KE+CMf3TgFI/C9Rd3 A==;
X-CSE-ConnectionGUID: O5ykbJt/R6GM9EySVhnbkQ==
X-CSE-MsgGUID: sjL4oFcBQ7qIzso5UI/PnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61932136"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61932136"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:15:41 -0700
X-CSE-ConnectionGUID: vkeF8aDDTgu41I4ntqceYw==
X-CSE-MsgGUID: sUwdqapIQrCcTGQdrWztkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="210861379"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:15:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:15:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:15:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJRZ3Pck1e5vpK/ctYz/UTpAttaXa74pwyjMsce4ZgGw1mOH90xv4hKG2a9hgWfiksZnZAhQLAsO5XyRvDhErlsAYcsyCdNVthumclorHe6ipfwpe1WvDDrbWulT5eg2qW77s6Ss5+OP68kOVyd0DzXbBrD1tw9Tj45DZI/Xyner7IKw8N0WfHnr96TJUBWK6peo0CbF+xOTYiX8zTPJKf1+Ck/cdRON2uDp5fs2Ma4ISf7MEo+S4S5f4B9WD7GjfLPEYPdy4i11bNft41eGUJy9ZLVHBq3POROS7YKGxSqg212RqtJlMLlabapIa353CTOfBBwizgSpNNiN2YxMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Q7J7aJ5ne+/QL7a+af1RH15qw2T6eENFQWdSgDxnhw=;
 b=WR1nmL1T022EsVUmU670F1ss2gDSyPSiLF3csKnQgiOBEsG9YkZO159GOk5FaTu3TU52LCaZMeAfAGXSjG2Guv0iMQEoNYVW1gGkomqftKOOSyVBvMxpZHFQbT+SYsKfiaAfkPbsWiiIVRc8nXcg/ILgpH4QWKgXnWFDApvAF5Lkj/Ia66W8g2G8osMsvVRFbj2TjRFPvlFrjhts3TDk+qev8TUiK/pFzz6bqHNNlH4N83Atf5BjXYbFtbowrms7mCkIv1XmHTYpZWrSvR6mMrAuEMc6mOzgePl2Bk2uopsULQaBb5YLIfahQ+knixIKdyGpDc1KW1f2Kw07rndPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 17:15:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:15:37 +0000
Date: Tue, 7 Oct 2025 10:15:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
Message-ID: <aOVKt1kQlBEYxctO@lstrano-desk.jf.intel.com>
References: <20250901083107.10206-2-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250901083107.10206-2-phasta@kernel.org>
X-ClientProxiedBy: BYAPR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:a03:80::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: f2966e24-2159-4017-6f95-08de05c52262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YGmeIP+w5v3XhXat1G61IIRuSHkBvwOUrXyaO7X/ICRd3jgG5oqn9rbZJ9/w?=
 =?us-ascii?Q?ObRO21IjKtcGL/7e6op4LB0PBd1d+c8V9gqmnhA0x70KFLNEugzGU4IlAGKh?=
 =?us-ascii?Q?1FTDUK566KWBlPeSRhEvYPioktgvf3r0o9JHpS0yDV9ngeZ56pIPqu/yZCnH?=
 =?us-ascii?Q?4rbJysSWGOVvogTRV08xb9yWHEtZIOJEwIn8oK0nT6XXD7zcSi+mQFQ+dJoQ?=
 =?us-ascii?Q?ctdL4fVMWRCmuJ+JEistXb1w203Mlc8y3sz3CVmbR8rj9BhIKb/0b+St83wM?=
 =?us-ascii?Q?E5LKT5CWY8Axs6ZyE6XVkgulV7P93XpeI/MnXLDSqhhHOra5r5D/KsFaahd7?=
 =?us-ascii?Q?Q4qapbtMpQMrPR9nF2wNfVjdiK9BCNdZQACa7jF4xuVm4WIT6HWyOW7sOvoA?=
 =?us-ascii?Q?OvAET4KWtwKW17PpYZCZd507K8qT9bn+0umxNQe8zMqhtuLpNjN2xwW1Hvoh?=
 =?us-ascii?Q?46lD1lrE6doEhz89YvPBxcQviWx7oOdchIpriw5ym0BGUgmHi58NxxUQTpkT?=
 =?us-ascii?Q?AI/lxtdXPbqFCmdwpYKg7x3Z5SlF/qkQVbcLoRldfPQfC8up1IGS4ltM2VTR?=
 =?us-ascii?Q?UBKmHZArW2LECl7AwE+JdM0sKXeh+KfejcPhaH/p2eWaRRJ7HIJcnlB797mJ?=
 =?us-ascii?Q?55PFqnIe7Es/uL6h3a/8eW3pj0g9nPh11Ugv5TanD8sBrCoIVPMwJN0TdBYE?=
 =?us-ascii?Q?Rf5hmSAsi7Rm2XhouN3zntyGjG930l9cLrepYjECmqjLgCVhlCg5Yun9PR/8?=
 =?us-ascii?Q?ez6L4PskrCly99+3LSTsrhIZ0l+sGRn1Q/ylLAIteMvkNhC+SClG+c/+fOe5?=
 =?us-ascii?Q?2+/U4aTp5ylmi3yG5kWJDcfSQL4WqLL2ve2OmB1NRTVrkOkR7DJjnRIjnZX+?=
 =?us-ascii?Q?vQ2RvO8ys8tVcvr9Ko5z8krKYHeU7qYLLbvmkcPVcfaotcjGtuUvfyLgY5gg?=
 =?us-ascii?Q?SkD0M/bUPlDf+/cI1nIECmC5QC/zKk3F1sWv3J7vu0brFfQAIfsRwc2Rz+HJ?=
 =?us-ascii?Q?+tah064agY/g+CGPrCzy8a6cDTIjWERBvh1fOkyFwCL30Mnw4Iyy/Ru2fqoZ?=
 =?us-ascii?Q?YAWWjc9ALjHXdDTiJo7m5p4zUnNWh9UbMvylMVr7gXhyWmzWhsYfhxwkph6b?=
 =?us-ascii?Q?QF9yAJmL2c5+BAp+h8cjQGJzoYs7pO6pLh5m5X+NMdrM396qDZnyPbA70VcG?=
 =?us-ascii?Q?9XgiTQP3uTTQuXQq2pqA52OPGEg+puxWTGhnlnHWOdXOtD4umGAcjRNnMHte?=
 =?us-ascii?Q?tupWcwVzAiUJijiit4ygNorlD581BbbGrVXzW8MRytbNQrgLg072eD5FTjSD?=
 =?us-ascii?Q?SyelLQO2vCCOItUIYzdauG+Hs0Pfc+Rm4cE5Dg+nJx/2DY2o9HbWvHLp7Oso?=
 =?us-ascii?Q?HrC1aninO2EjlwjlR3HzWV+EywvdHQnSVKr2x015z+ezD63u8v1lNWjqVoCa?=
 =?us-ascii?Q?J7DDnRvJQJowcuLkKHSpmjOUQ97yQFOV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TeEQIIcNPcJau1jSWjvMPHJ2SX/yOM9u95AGuDM9XRuzY8NMv/ICNqO/jZVs?=
 =?us-ascii?Q?ic3AoRt04Oi0D3usNqS4OmJMuUVtJQ4taYZC8qTaywfEFlATD+UUCDL7nHkz?=
 =?us-ascii?Q?wkFr7mbCYHSGQz2I5bA/ztijAmMLUeQfsVDzZx//Gq8cqmFDpI8yTEIXYhuz?=
 =?us-ascii?Q?wtn0QMH72xvggtPLoG63MeYYSkbtc3pwQ5uuG6a6sXmcqoJ534ddwMNScUDw?=
 =?us-ascii?Q?JRJRxqiIRmEPx9sANUFu8gVIK29XGf3Ugvcw6+9v4P4acsMjZMKoYAQIccxd?=
 =?us-ascii?Q?x2eVfw9MrHrluSZzf554jb3O0JbDVKbb5Zp25R09/ccyHFDa5Hcze0Jkd7Sh?=
 =?us-ascii?Q?k9ytXFYTdHZYypqYcfqgacsSl3UkQWYlLcBTYo8QQSTWWZgn9d9B/m7Jp66+?=
 =?us-ascii?Q?+T8w47QSiy+Vi0e6Zmc1TPlXrxTeniXvRsq7z/B/y19/fcMq3K9JYAsdCys5?=
 =?us-ascii?Q?HtgfcPL4/e9UoYBEQSMhPvr1ivBScgmYYicKbSpBfgbvafQRxC+EBP56uu6H?=
 =?us-ascii?Q?WolsxvOgYo2ZsCSTieci4rx92zK5pAtWJt3IOhj1M2570w9rMSI8DCJHTxCf?=
 =?us-ascii?Q?kpRLi/8kGVsAZebPQDm3/dH9plyletOJjsVMMFwnIBROT/fH34V9Ta9zjoSi?=
 =?us-ascii?Q?KvHUGZAd0XFDjaKagpmNmTzK119ufc/xVSdPqjAvXU01Inmam1a7HdTx2G7f?=
 =?us-ascii?Q?E+zJL/uFscR3NeHRjzDqk79D5hQEFsIT7ZfD3GPRGvsw/GYFFgwnoAAK1Dwd?=
 =?us-ascii?Q?sYA/VxRXBV2K+DnkfSpK0+EgU66V9NBH4Psu50oGiyg3BpDzsV4myEyDCoYu?=
 =?us-ascii?Q?ylUeVNAQGWtyQ0u46L7P2xPazXvVvOniy7rXBMCZK56vmxJNvMYj75U02Jvn?=
 =?us-ascii?Q?7SLepZzwsEVfqP68kP/BJNb37x7vyuhIbncGW+oF7KgodkuUnVnRAntO1+Mk?=
 =?us-ascii?Q?Wd/xEqtu1+S5o3oRUSqMLpfpRiHzSal79WRw2ua/BZnnIzupyqFqVBeRhfS/?=
 =?us-ascii?Q?Rh+Bja0OCKQm3EGbQO/rHQ5OOReGcIDLxzcy3vivQ3MtaAX3qhYknVrvTH91?=
 =?us-ascii?Q?WraLvMTFmLR/28vwaC8gI3BoGJA4m/snuih6Gns8FbThTOAqxWAX5k1xp22b?=
 =?us-ascii?Q?EGYL1NLjQ+QvAl3szgbZp/I05NhrYr9XpTLAt8ahOwpuzEYzdUlLgYg144k/?=
 =?us-ascii?Q?x23igXpof+PchBkYoYI50Ak3MxMDGoJTAKfVbzcCYW9BWo8o6X+ICfCr3Lzd?=
 =?us-ascii?Q?nALROqPucLgY5mu59c2cW/BETmY9LOcNAoB0lF/P6vaCc5NbV5piwLX2UaXu?=
 =?us-ascii?Q?KDfG/fTDjxRkkfPhWnPUcvKpuvQ3WUjyeDxnR5j2ujdg7/KjipkYkNNo7H90?=
 =?us-ascii?Q?nqPnJvfkQo9Gq3Y9Bo5Ju9ZyjcXxlaALdX7RuSyLcoCO31W7UuHW75Dmc2a4?=
 =?us-ascii?Q?jxnrCQ6Gzs34QSRHz6QXZ1Ebu7ZPLJagHB8ym/xhlsYT+zgSBRp26C6m7TtB?=
 =?us-ascii?Q?oZS2wDczMiW2bKRaQdeUMoo530Eqv9K5S91DTteUZX+Tf9plRv5aFtA6bwAX?=
 =?us-ascii?Q?MzSVt56sBNT3RIj2E0C336JzJX2i435Zq5N+A/2pY8DUidZSmxwxlPU9SOUH?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2966e24-2159-4017-6f95-08de05c52262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:15:37.9117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miSDi5ICpv78EbxRfVnvejqVNVVD+QyvpZvapBcGoUKnLOJwObamFr+ffeeAHb1flqSyLhGkJzYjYejawu4cjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
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

On Mon, Sep 01, 2025 at 10:31:08AM +0200, Philipp Stanner wrote:
> This reverts:
> 
> commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")

I've been scanning some recent DRM scheduler changes.

I think we should likely revert:

bf8bbaefaa6a drm/sched: Avoid memory leaks with cancel_job() callback

5f46f5c7af8c was the only user of cancel_job. I'm not sure why we'd
carry dead code in DRM scheduler unless you have plans to make use of
this function soon.

Matt

> 
> from the drm/sched teardown leak fix series:
> 
> https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.org/
> 
> The aforementioned series removed a blocking waitqueue from
> nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
> prevents jobs from leaking, which the series fixed.
> 
> The waitqueue, however, also guarantees that all VM_BIND related jobs
> are finished in order, cleaning up mappings in the GPU's MMU. These jobs
> must be executed sequentially. Without the waitqueue, this is no longer
> guaranteed, because entity and scheduler teardown can race with each
> other.
> 
> Revert all patches related to the waitqueue removal.
> 
> Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")
>   - Add Fixes-tag
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
>  drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
>  drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++---------------
>  drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 +++---
>  5 files changed, 24 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 9f345a008717..869d4335c0f4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  	return ret;
>  }
>  
> -void
> -nouveau_fence_cancel(struct nouveau_fence *fence)
> -{
> -	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&fctx->lock, flags);
> -	if (!dma_fence_is_signaled_locked(&fence->base)) {
> -		dma_fence_set_error(&fence->base, -ECANCELED);
> -		if (nouveau_fence_signal(fence))
> -			nvif_event_block(&fctx->event);
> -	}
> -	spin_unlock_irqrestore(&fctx->lock, flags);
> -}
> -
>  bool
>  nouveau_fence_done(struct nouveau_fence *fence)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 9957a919bd38..183dd43ecfff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
>  
>  int  nouveau_fence_emit(struct nouveau_fence *);
>  bool nouveau_fence_done(struct nouveau_fence *);
> -void nouveau_fence_cancel(struct nouveau_fence *fence);
>  int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
>  int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 0cc0bc9f9952..e60f7892f5ce 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -11,7 +11,6 @@
>  #include "nouveau_exec.h"
>  #include "nouveau_abi16.h"
>  #include "nouveau_sched.h"
> -#include "nouveau_chan.h"
>  
>  #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
>  
> @@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
>  {
>  	struct nouveau_sched *sched = job->sched;
>  
> -	spin_lock(&sched->job_list.lock);
> +	spin_lock(&sched->job.list.lock);
>  	list_del(&job->entry);
> -	spin_unlock(&sched->job_list.lock);
> +	spin_unlock(&sched->job.list.lock);
> +
> +	wake_up(&sched->job.wq);
>  }
>  
>  void
> @@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
>  	}
>  
>  	/* Submit was successful; add the job to the schedulers job list. */
> -	spin_lock(&sched->job_list.lock);
> -	list_add(&job->entry, &sched->job_list.head);
> -	spin_unlock(&sched->job_list.lock);
> +	spin_lock(&sched->job.list.lock);
> +	list_add(&job->entry, &sched->job.list.head);
> +	spin_unlock(&sched->job.list.lock);
>  
>  	drm_sched_job_arm(&job->base);
>  	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
> @@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
>  	nouveau_job_fini(job);
>  }
>  
> -static void
> -nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
> -{
> -	struct nouveau_fence *fence;
> -	struct nouveau_job *job;
> -
> -	job = to_nouveau_job(sched_job);
> -	fence = to_nouveau_fence(job->done_fence);
> -
> -	nouveau_fence_cancel(fence);
> -}
> -
>  static const struct drm_sched_backend_ops nouveau_sched_ops = {
>  	.run_job = nouveau_sched_run_job,
>  	.timedout_job = nouveau_sched_timedout_job,
>  	.free_job = nouveau_sched_free_job,
> -	.cancel_job = nouveau_sched_cancel_job,
>  };
>  
>  static int
> @@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>  		goto fail_sched;
>  
>  	mutex_init(&sched->mutex);
> -	spin_lock_init(&sched->job_list.lock);
> -	INIT_LIST_HEAD(&sched->job_list.head);
> +	spin_lock_init(&sched->job.list.lock);
> +	INIT_LIST_HEAD(&sched->job.list.head);
> +	init_waitqueue_head(&sched->job.wq);
>  
>  	return 0;
>  
> @@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
>  	return 0;
>  }
>  
> +
>  static void
>  nouveau_sched_fini(struct nouveau_sched *sched)
>  {
>  	struct drm_gpu_scheduler *drm_sched = &sched->base;
>  	struct drm_sched_entity *entity = &sched->entity;
>  
> +	rmb(); /* for list_empty to work without lock */
> +	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
> +
>  	drm_sched_entity_fini(entity);
>  	drm_sched_fini(drm_sched);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index b98c3f0bef30..20cd1da8db73 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -103,9 +103,12 @@ struct nouveau_sched {
>  	struct mutex mutex;
>  
>  	struct {
> -		struct list_head head;
> -		spinlock_t lock;
> -	} job_list;
> +		struct {
> +			struct list_head head;
> +			spinlock_t lock;
> +		} list;
> +		struct wait_queue_head wq;
> +	} job;
>  };
>  
>  int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index d94a85509176..79eefdfd08a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  	u64 end = addr + range;
>  
>  again:
> -	spin_lock(&sched->job_list.lock);
> -	list_for_each_entry(__job, &sched->job_list.head, entry) {
> +	spin_lock(&sched->job.list.lock);
> +	list_for_each_entry(__job, &sched->job.list.head, entry) {
>  		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
>  
>  		list_for_each_op(op, &bind_job->ops) {
> @@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  
>  				if (!(end <= op_addr || addr >= op_end)) {
>  					nouveau_uvmm_bind_job_get(bind_job);
> -					spin_unlock(&sched->job_list.lock);
> +					spin_unlock(&sched->job.list.lock);
>  					wait_for_completion(&bind_job->complete);
>  					nouveau_uvmm_bind_job_put(bind_job);
>  					goto again;
> @@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
>  			}
>  		}
>  	}
> -	spin_unlock(&sched->job_list.lock);
> +	spin_unlock(&sched->job.list.lock);
>  }
>  
>  static int
> -- 
> 2.49.0
> 
