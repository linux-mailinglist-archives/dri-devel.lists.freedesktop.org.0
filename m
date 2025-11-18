Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF77C6B165
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376D10E1CD;
	Tue, 18 Nov 2025 18:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PVFOPWvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3C910E1CD;
 Tue, 18 Nov 2025 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763489016; x=1795025016;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D0a3YwXehT9WQWXjaMnUg2Ji7W8IJrZ78kGgSpny5I8=;
 b=PVFOPWvdxZh+yH3vz33LljHDLU4Ln8sk5MmDzJ2WhSeVDPO6+daNnd8S
 HEL5qI5ZUbPC1ZvWeNLtvZpmp38bvyfdUkgEYLWY7anqvPP6gaIoUF7d3
 7UgK9MXepKBNZrTCHDDr+v7T6DVB7j2XPj9fAdqvhpyoKQLF6qi8PoC8w
 e3XZTGs8dIVFbag7/5RbZvV7IO04T34LlI/qx0HZAAfdmSmebsuMSTH3r
 hKlj2RS6iMonC4PuSMoIOFH1/gtDL1avHfPueXbkagke+7b20SOgdeo7k
 82UkTowdeCVNL0B4aKT2F0Tkfn+94+UV6LyP0BXWqFs0sCC5wiDuNw/nf Q==;
X-CSE-ConnectionGUID: 6yOFvDOoS7yJLeGpNe1Xhg==
X-CSE-MsgGUID: w77SOo6DTwy+t35NrHowgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76976005"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="76976005"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:03:35 -0800
X-CSE-ConnectionGUID: OC5HIxa8Qqm3udsXy2ZRng==
X-CSE-MsgGUID: 1bV7PHKMR8mG92S22iyoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190083625"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 10:03:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:03:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 10:03:34 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 10:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=noVpmVOvh06ElAM/RWJWiNw/k2IbMQvondocTFibVA8xbDvtj0gMmwwk4rt2hmZuZi43mRDtwwqQimu40atxmyIh/W6oEt5egbtl2ZcFt0qdkuj45jTg8EmS3TJ8nBamQ4heESNSvW7Gze/GZFdfcbdZMjmQOZNngK/9P1cJz/aRVDWKFM2PAn7YOIg0cY3FcNjCQ4fDHFKbCS7ZlHtrHj4hzDSTPkVLuHncCWUMq+sxK4o5scsnK4TvfvCOGTFsGnibACkxo494IqWCmTN+YluB51yMMN1q2B8j28iXkn6NCXQx6i+KeCYI/4UhnLUD6xV9C5gLexlJS5+pePXTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRpkXMYSlp0XZnax6f56yjVu0hbAqH60LbCHPgfd3Z0=;
 b=uVh1oFFdybI/zsd0kVxU/JxwsCHmB7WjcuS2FK71eKCJopuU27A+NJxW1KH0r7DezKvR+f0bYCbfU1NO4LkWeNjnuZBkXOwpnIjZ8fLQFMFbqvUYhsxaNzg6+guxH4ER9QCZnuDTF0nAZXFMle0YtHRVKttirXUI0ssCt7Y9XY+sFs+aWezWBatINs9W6XGLXjxT00jYcuZ50E0PI+Eq48k6uWU/XxkDh7F6E6BvXFvOp3QyPJ9nPwAv5D1EwxtNHkSDr2oZc9HKe/GGI7kq8SRKOT4VdyDTZwbejAD9/Y+vawNlGse+K8vwI5vUV04mQZg4fKjGh5jl3vMkw0QQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 18:03:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 18:03:26 +0000
Date: Tue, 18 Nov 2025 10:03:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 6/7] drm/xe: Remove special casing for LR queues in
 submission
Message-ID: <aRy063wOoY14qb5i@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-7-matthew.brost@intel.com>
 <aRwWC46dgXKjRGVW@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRwWC46dgXKjRGVW@nvishwa1-desk>
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 23641c74-a05b-4987-82d8-08de26ccc582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qAiPif2NJOOeWMV0DP6RxE0fLMwzeKsG1/SNYEoVEhtA+7XQWpmBDz1QmrZc?=
 =?us-ascii?Q?o8uIpMB81iTXw2c97+n7k1K2os6Yu4w8snrAf/Em9v8by/WmsouOo3xcfusj?=
 =?us-ascii?Q?q/zKVUJv4FD5dVGdjH6ntqf1gtFuwUQDSq7JHWBBGT8V+x8wzdKT1nw2Pgri?=
 =?us-ascii?Q?HGUQH7gqAKOJVPNrtJWpEEPi6LfWqpZqMyEt5QMfJahFvsPs1SShEqJ+cduH?=
 =?us-ascii?Q?SGOKupZu0vZZ0zM8sNZYqmTx4L7twB+5XJipv3gxMFKHwsIyOEpDdfkilpP+?=
 =?us-ascii?Q?OJqVyp6esIJWmfHvy4BdvsxhvCcnHmNiTygvjWyBhp4bY8HJwTrZeCwSUXOy?=
 =?us-ascii?Q?ABzuqbRUSTO0P/rBxSYO30EI52KHo15l6fL1n2Hts4KGaIcx41F7mKxtz3GP?=
 =?us-ascii?Q?byud9jM1kQY/jQ1LiJFcx2iYSrJ9zAo53gfNP1S3o0NzTCaaYpQv7y+SfTXa?=
 =?us-ascii?Q?L3gzMQ8zKBV1mU+EaVjz7ZogTQaXseZFR9Ja+0u6krxmLfpwd3x6lrFZFT7w?=
 =?us-ascii?Q?JaZhpdzE4fwoxUPr6oLaGQ4FOTvrLILETsBCv6PBtCUbLiuCeN7bPppM0Inm?=
 =?us-ascii?Q?Kp2N45nLA7/3a6GTGjaawZdl3NW3YoE4ptwH8rztSdgi2d2KaUTcfA9tvtZb?=
 =?us-ascii?Q?skM57Zdk+hin5Si1hy+OJRibeOYJ7a/Q9U5/+pdMrwkk9e3tJvTV1dlb1kz0?=
 =?us-ascii?Q?QyAPai8HqDif32R22N1S65bWiOf+hqLE+qlK83jeIxhHcAN9sbNWaatq/ZeP?=
 =?us-ascii?Q?myaNaG56sN82eG4occxdaIwhqVg/8c1HjpVEvKSOGt5YikQSvaFLfpWv91pl?=
 =?us-ascii?Q?VM1v7nOqriTaMy/L2qBYokJ/uL2LKC9cuK4yt9sMEbVlQmcDdqILWDAIGbdb?=
 =?us-ascii?Q?1ILWEmgVzc/u8sgC+5s7FWS+bvH8DP8+qSI9X261K0LkD5JsvIy2SU3Y4UgU?=
 =?us-ascii?Q?6SZTiNHMdPjSVRrI2YiaouWStefB6zxSg0+1UsJlKFohPgg8bl9/fHl2pHnV?=
 =?us-ascii?Q?J3PNcDV3BFpNjTlcxtn418WDqdPOtDaaLNv+FI8XG2ULhH9aDi9KWNKGKr3X?=
 =?us-ascii?Q?8E88Nx4RS1GfRPUwB9EBSsUJtwmJnRwlkkb+6mMgwfWP1/j7EpmjZeUUhMw0?=
 =?us-ascii?Q?CcJ0jT3YWoUBp21A0R8NFUyUCY4UNVPFImk4+e6QyuHLOgeettdLTXNYV3ot?=
 =?us-ascii?Q?zPpAgzmAksUArvoJduPxfaGYmoojcf1Bcbuea+2ylEO3UD76LEOT5JBC36px?=
 =?us-ascii?Q?kKhN6408EfUQbh8TWkGGn7dBEbiicb1RpZ8bvxpuE4XoWPfK0Cn5Z9MY2CGD?=
 =?us-ascii?Q?lB9UhwptLCfXBNAxL5wW2XuxSPPQuVrjU9ai5LKcugcsXBHcj7O7rApKJ+jY?=
 =?us-ascii?Q?JpIRsqm5Njcg53kePWZq1EEs7s8f4JajrrlpiaknlZ/bOpimI06ual2m7ELl?=
 =?us-ascii?Q?XNIXVK0Dt4ENbdgkqoW5MzD7M7pmwFwE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhh1AujHbV2WFxRYKLpJWk/4dL0AC7iVE30Jmi5S1nIItQPUMVKtaZcxjMbD?=
 =?us-ascii?Q?NcJDVZhKSrFx174mP3+MB+GNgZITs0Yw2gfTkKn1OKBKh82s6t/YyGmntXZc?=
 =?us-ascii?Q?N0+BZ53m4UcDAFY0rRdo3A8R/74tUNXjhaxLK8AW4Q9K/HZlkA9+yEhkvpZr?=
 =?us-ascii?Q?lUWI47jXdA+mLlkHjkkN/OzBofFfSVupVIWtpLcFvef5hBKXoRyMk2561Iia?=
 =?us-ascii?Q?v9IDO9cXVLUvak4av9pAij3YNsC/xa0PrkUjCQyVokcT0d/H5Es1mxlW9cPp?=
 =?us-ascii?Q?l5WlNV9E+bflIQpHELx1I3OBVK7tFGG+98X6riJ8G3MdS753DRwCHzJ2SSh6?=
 =?us-ascii?Q?qqrnbOKR/7iSNapnuUNIONZhB8f4lpqn/bvulRJfhjGRAC7Ha8l+umRS/Q17?=
 =?us-ascii?Q?y0eV1coP86M012l+NzGnkYt7ULHjeF0MO5UYJDHEDPXLT3ap2i8GuS+f4DXg?=
 =?us-ascii?Q?ws55alGyYhRYulpe2UvgOLk4Y8/iirr5aql6bQFmErnLxGAXMZUibMVlr+pk?=
 =?us-ascii?Q?aPFfdyYuGyyN2p4jC47BaL+6zz91A7mj63L3mcISm8UGpxd+CZginwpRbSFk?=
 =?us-ascii?Q?jGFYPAMn2E/Nv1my3BhfMCaftRnxwYtC0XhAkt1Y1NDgn/fE+id9qTSysw8g?=
 =?us-ascii?Q?LWHVdSs+mjURmX+TErwiiqAtzTmCP992mUsJnmXZRDTmRqJQuWO2ed/iulmM?=
 =?us-ascii?Q?4BvBkqXTu2YYG2bAV/64CxxwN6ADZpis9SRbLjr0aoo+qHWFxKvtNZpCokXV?=
 =?us-ascii?Q?TQZGy2BIOQjnRnG3fm7Ha+LpXNvaOg/v8EXNAgQT2WmKO4Bbx0gDLws4o++z?=
 =?us-ascii?Q?v5bROpelWPmbutEa3dkTu5dlr2mB9xCZxmV55bvQI2eENJ/v3OGywccfPveR?=
 =?us-ascii?Q?8P/k7yB97X6rPh12ldRuv5B+W8Uq6DVgrpnB/2eaRn8Er8KxR7XeVtQgofZk?=
 =?us-ascii?Q?0P3DaBupJem83MOeeDiSCXSLOKLK6bEawZ+BWR3UVvytJxIaC/bvrMjmgZkd?=
 =?us-ascii?Q?DUmFwpSGKuR7+IElCfbya5ZXvLTyjQ+3Y3JTxPFqmCQAVL4W3BB9Cap1Yl0v?=
 =?us-ascii?Q?FmIcie0SOaSumETxFjpbzIrVSc749O7ahCRGrfZhca3wlUpYL7E4yi+8Rkxe?=
 =?us-ascii?Q?I17ZvI9t1TaTohKvfxDTWKtv5tsmA0pik5F+D9JHsachou4FXZRIUL6afHYo?=
 =?us-ascii?Q?JOB2/5gwZK/nP5Ub60brzaFvAOVp/Brfg5RaqPQmpB2mdXE0OdvXeLBElDBR?=
 =?us-ascii?Q?uZGCZJEOQWNHOwV60W+FjN0JJi0D0fZEzfJTuhpf0f2DgQztexC2HAnZ+hIt?=
 =?us-ascii?Q?YGAlaF+X1d3LyufNyrtYx1EcshyF5LWiKJBwry/6UBLZnveXv1ij8P10o4tI?=
 =?us-ascii?Q?L84hbLvejZczaZxM18PpOP+a5bEpCfvQaCHe3HFgo+bPbZwal69kNiDc8Nza?=
 =?us-ascii?Q?ZvCYBiFAS7UvDMnRaRtyn043U90gYx4OkX7wOx0KkkCCMA/YfJ8i1O3niJ1s?=
 =?us-ascii?Q?DqtJTkaO5ZevWX4mONGdV6LrgE4dS/ONDi6thLUZFbexnkaNBo/nwBwWEnoO?=
 =?us-ascii?Q?GrFkiqZ5DCMTVZg5JJIbsz0PhUbCtQUAGvB98EeowACO6aiIhngp006RR+de?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23641c74-a05b-4987-82d8-08de26ccc582
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:03:26.3584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUwJ+qAQmAWf2NqEL55ED0rKEUrEW37D8DlY/zv0o72J4PtLFAtOdTyOgWxvvVaWBnqeai1JV2f73oIBVtyBOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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

On Mon, Nov 17, 2025 at 10:45:31PM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:25PM -0700, Matthew Brost wrote:
> > Now that LR jobs are tracked by the DRM scheduler, there's no longer a
> > need to special-case LR queues. This change removes all LR
> > queue-specific handling, including dedicated TDR logic, reference
> > counting schemes, and other related mechanisms.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
> > drivers/gpu/drm/xe/xe_guc_submit.c           | 129 +------------------
> > 2 files changed, 7 insertions(+), 124 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index a3b034e4b205..fd0915ed8eb1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -33,8 +33,6 @@ struct xe_guc_exec_queue {
> > 	 */
> > #define MAX_STATIC_MSG_TYPE	3
> > 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> > -	/** @lr_tdr: long running TDR worker */
> > -	struct work_struct lr_tdr;
> > 	/** @destroy_async: do final destroy async from this worker */
> > 	struct work_struct destroy_async;
> > 	/** @resume_time: time of last resume */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index ab0f1a2d4871..bb1f2929441c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -674,14 +674,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> > 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> > 	}
> > 
> > -	/*
> > -	 * We must keep a reference for LR engines if engine is registered with
> > -	 * the GuC as jobs signal immediately and can't destroy an engine if the
> > -	 * GuC has a reference to it.
> > -	 */
> > -	if (xe_exec_queue_is_lr(q))
> > -		xe_exec_queue_get(q);
> > -
> > 	set_exec_queue_registered(q);
> > 	trace_xe_exec_queue_register(q);
> > 	if (xe_exec_queue_is_parallel(q))
> > @@ -854,7 +846,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > 	struct xe_exec_queue *q = job->q;
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
> > +	bool killed_or_banned_or_wedged =
> > 		exec_queue_killed_or_banned_or_wedged(q);
> > 
> > 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> > @@ -871,15 +863,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> > 		job->skip_emit = false;
> > 	}
> > 
> > -	/*
> > -	 * We don't care about job-fence ordering in LR VMs because these fences
> > -	 * are never exported; they are used solely to keep jobs on the pending
> > -	 * list. Once a queue enters an error state, there's no need to track
> > -	 * them.
> > -	 */
> > -	if (killed_or_banned_or_wedged && lr)
> > -		xe_sched_job_set_error(job, -ECANCELED);
> > -
> 
> Why this piece of code here is being removed?
> 

The TDR will always run for LR jobs now, that path will error out the
job. Prior to this, the LR cleanup function only ran once.

> > 	return job->fence;
> > }
> > 
> > @@ -923,8 +906,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> > 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> > 		xe_sched_submission_start(sched);
> > 		xe_gt_reset_async(q->gt);
> > -		if (!xe_exec_queue_is_lr(q))
> > -			xe_sched_tdr_queue_imm(sched);
> > +		xe_sched_tdr_queue_imm(sched);
> > 		return;
> > 	}
> > 
> > @@ -950,10 +932,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> > 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> > 	wake_up_all(&xe->ufence_wq);
> > 
> > -	if (xe_exec_queue_is_lr(q))
> > -		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> > -	else
> > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +	xe_sched_tdr_queue_imm(&q->guc->sched);
> > }
> > 
> > /**
> > @@ -1009,78 +988,6 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> > 	return true;
> > }
> > 
> > -static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > -{
> > -	struct xe_guc_exec_queue *ge =
> > -		container_of(w, struct xe_guc_exec_queue, lr_tdr);
> > -	struct xe_exec_queue *q = ge->q;
> > -	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct xe_gpu_scheduler *sched = &ge->sched;
> > -	struct drm_sched_job *job;
> > -	bool wedged = false;
> > -
> > -	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > -
> > -	if (vf_recovery(guc))
> > -		return;
> > -
> > -	trace_xe_exec_queue_lr_cleanup(q);
> 
> Remove the trace event as well in xe_trace.h?
> 

Yes, will do.

Matt

> Niranjana
> 
> > -
> > -	if (!exec_queue_killed(q))
> > -		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > -
> > -	/* Kill the run_job / process_msg entry points */
> > -	xe_sched_submission_stop(sched);
> > -
> > -	/*
> > -	 * Engine state now mostly stable, disable scheduling / deregister if
> > -	 * needed. This cleanup routine might be called multiple times, where
> > -	 * the actual async engine deregister drops the final engine ref.
> > -	 * Calling disable_scheduling_deregister will mark the engine as
> > -	 * destroyed and fire off the CT requests to disable scheduling /
> > -	 * deregister, which we only want to do once. We also don't want to mark
> > -	 * the engine as pending_disable again as this may race with the
> > -	 * xe_guc_deregister_done_handler() which treats it as an unexpected
> > -	 * state.
> > -	 */
> > -	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> > -		struct xe_guc *guc = exec_queue_to_guc(q);
> > -		int ret;
> > -
> > -		set_exec_queue_banned(q);
> > -		disable_scheduling_deregister(guc, q);
> > -
> > -		/*
> > -		 * Must wait for scheduling to be disabled before signalling
> > -		 * any fences, if GT broken the GT reset code should signal us.
> > -		 */
> > -		ret = wait_event_timeout(guc->ct.wq,
> > -					 !exec_queue_pending_disable(q) ||
> > -					 xe_guc_read_stopped(guc) ||
> > -					 vf_recovery(guc), HZ * 5);
> > -		if (vf_recovery(guc))
> > -			return;
> > -
> > -		if (!ret) {
> > -			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> > -				   q->guc->id);
> > -			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
> > -				       q->guc->id);
> > -			xe_sched_submission_start(sched);
> > -			xe_gt_reset_async(q->gt);
> > -			return;
> > -		}
> > -	}
> > -
> > -	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> > -		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > -
> > -	drm_sched_for_each_pending_job(job, &sched->base, NULL)
> > -		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
> > -
> > -	xe_sched_submission_start(sched);
> > -}
> > -
> > #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> > 
> > static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > @@ -1150,8 +1057,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
> > 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> > 		set_exec_queue_banned(q);
> > 		xe_gt_reset_async(q->gt);
> > -		if (!xe_exec_queue_is_lr(q))
> > -			xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		xe_sched_tdr_queue_imm(&q->guc->sched);
> > 	}
> > }
> > 
> > @@ -1189,8 +1095,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	pid_t pid = -1;
> > 	bool wedged = false, skip_timeout_check;
> > 
> > -	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> > -
> > 	/*
> > 	 * TDR has fired before free job worker. Common if exec queue
> > 	 * immediately closed after last fence signaled. Add back to pending
> > @@ -1395,8 +1299,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
> > 	xe_pm_runtime_get(guc_to_xe(guc));
> > 	trace_xe_exec_queue_destroy(q);
> > 
> > -	if (xe_exec_queue_is_lr(q))
> > -		cancel_work_sync(&ge->lr_tdr);
> > 	/* Confirm no work left behind accessing device structures */
> > 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > 
> > @@ -1629,9 +1531,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> > 	if (err)
> > 		goto err_sched;
> > 
> > -	if (xe_exec_queue_is_lr(q))
> > -		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
> > -
> > 	mutex_lock(&guc->submission_state.lock);
> > 
> > 	err = alloc_guc_id(guc, q);
> > @@ -1885,9 +1784,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	/* Clean up lost G2H + reset engine state */
> > 	if (exec_queue_registered(q)) {
> > -		if (xe_exec_queue_is_lr(q))
> > -			xe_exec_queue_put(q);
> > -		else if (exec_queue_destroyed(q))
> > +		if (exec_queue_destroyed(q))
> > 			__guc_exec_queue_destroy(guc, q);
> > 	}
> > 	if (q->guc->suspend_pending) {
> > @@ -1917,9 +1814,6 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > 				trace_xe_sched_job_ban(job);
> > 				ban = true;
> > 			}
> > -		} else if (xe_exec_queue_is_lr(q) &&
> > -			   !xe_lrc_ring_is_idle(q->lrc[0])) {
> > -			ban = true;
> > 		}
> > 
> > 		if (ban) {
> > @@ -2002,8 +1896,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 	if (pending_enable && !pending_resume &&
> > 	    !exec_queue_pending_tdr_exit(q)) {
> > 		clear_exec_queue_registered(q);
> > -		if (xe_exec_queue_is_lr(q))
> > -			xe_exec_queue_put(q);
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> > 			  q->guc->id);
> > 	}
> > @@ -2060,10 +1952,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> > 
> > 	/* Stop scheduling + flush any DRM scheduler operations */
> > 	xe_sched_submission_stop(sched);
> > -	if (xe_exec_queue_is_lr(q))
> > -		cancel_work_sync(&q->guc->lr_tdr);
> > -	else
> > -		cancel_delayed_work_sync(&sched->base.work_tdr);
> > +	cancel_delayed_work_sync(&sched->base.work_tdr);
> > 
> > 	guc_exec_queue_revert_pending_state_change(guc, q);
> > 
> > @@ -2435,11 +2324,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> > 	trace_xe_exec_queue_deregister_done(q);
> > 
> > 	clear_exec_queue_registered(q);
> > -
> > -	if (xe_exec_queue_is_lr(q))
> > -		xe_exec_queue_put(q);
> > -	else
> > -		__guc_exec_queue_destroy(guc, q);
> > +	__guc_exec_queue_destroy(guc, q);
> > }
> > 
> > int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > -- 
> > 2.34.1
> > 
