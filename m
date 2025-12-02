Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26047C9BE7F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 16:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790DE10E664;
	Tue,  2 Dec 2025 15:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxSFFana";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682A810E613;
 Tue,  2 Dec 2025 15:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764688458; x=1796224458;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4/fBW4e0TE8V0SvZSEZZ4mkk01A+QLJvfkEKKtLB7V8=;
 b=jxSFFanaJo86JQKWp/dTUv4XdNnomBRmc62Cs9CA8waBHrvr2jFF7RYg
 mGwXdGYTNC8LQuAIXqYBBA/ArkJ7aqjrMbOCYKwAIZI+p9mKq0NQ41/h0
 tNRmU4dECDPYdBe2+bXMQ8GlyZdOmHP/UuAIbgvYqPguzGibTxGhjXuxk
 zJgylfJfctt7xr1z4b//AiUEQ7nqHt28E6OWEGuIaNPMk3cKzRjXYEVJg
 iK1CYQXsli2ZS5LrXH1g9apFfMMHtZvGKp41MF118bT4FSlMSZmj1jCPt
 zUvq96AyV7oeAKP7ugTAItx1kX9imeWtXaEQilkWaJSOrkUkJkPhYOyOw A==;
X-CSE-ConnectionGUID: /h44ZHnpQN2DQMOYYnVmbQ==
X-CSE-MsgGUID: 0oO7FAfGQsWVClUvRIGXKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77762222"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="77762222"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:14:18 -0800
X-CSE-ConnectionGUID: Bq80vFOdQ3OOKTENFKmEBA==
X-CSE-MsgGUID: JxKxVTNSTA6solTsD4V8Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194229448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 07:14:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:14:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 07:14:17 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 07:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRS2EREFTiXSUyCpoebWGJgttVT9OPR/38HSqjPq2+XQpEyaUsR1fpUNmCAEmNtfzfl7yIpA6lEfPtSs4DhY91fJ5JINPDho+n0PXlq4MgHWwLgrdJacgZOGV3VhMaPoqoucgQ5UoHTqNI7Zfc6cNAF8VJJmlcRevXuRxjvwgH7cBQrshl/EGCTnK8G2+aWPsMHOIp2cznrCrHppoVPQ2MNemtwhs4gc8n2g+WHxVhoeJ+RUsQOXWSk42cPNBnYeRMJLWMhFCm3z98Kw1CRMplLKwsLydf58nfrVJ9aeF+mLKrGlaK5IwpQBC2+lSwNa4+AGrqE7CsNN/E7veAY3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbV6pati+ZPhJRtR89vmCOrbzlMzXBbcBIP0m6U6Bmk=;
 b=l8qnG871WAmtCqkI1Aze3nSCrKJdf2fe5IKIB6fDDfZlJrk4scZSfwWhwSyPvgBoETWZ280XwigO+89C36OowT5RoY6/+R9PbNoArBfrcWE+afFJSPbzqredzj4KoSs+/N4pAybY2AWOQRVDPHlVVmiPlXHFFBrSSXgR5SzyWOJ+3OyHwhyFC7sTh9fvT/P1Mf2s7br3B9txmaAVc2SI1FUeVuTrqiHkrt6nnioeR5uQ8wXRj1tb9L1ejJzGAtGMYRbqXK3GevnE/0ySYC92LvEbhglBhDLyT9qbkz2GU5yd14M4UzwN9WyO+LdefYCRyoga8w5LZXIsHM1XZuR9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 15:14:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 15:14:14 +0000
Date: Tue, 2 Dec 2025 07:14:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 9/9] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aS8CQ0jjDPZs93zn@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-10-matthew.brost@intel.com>
 <aS6V7cdFb7/sbG3S@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS6V7cdFb7/sbG3S@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR04CA0184.namprd04.prod.outlook.com
 (2603:10b6:303:86::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 04601d02-570d-4f66-f80c-08de31b5745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U13zcR5HTQZgl1Fovd0D530xQ840RDmcfJVwyLWywKJdfqWV9gYZfCs4hjCu?=
 =?us-ascii?Q?WabU2D5VqstdDRal3gGA0ZQL7vepbdAXmDjDYU2UXXKzARV2pxE9Nj9SjkOJ?=
 =?us-ascii?Q?MiGQJnlL0RzCsfKnKoyEITm6SbYXSZTOTrqp3DlvOt/YxTwzX7ZVIxOrUOCE?=
 =?us-ascii?Q?mAV9qMWWLiPQZ8ddcXllN7jV2jRyxitgxxmwHov6yUEKXhoB4nDjzKSN90Ij?=
 =?us-ascii?Q?l0IG+2i8ZpdqDnf49AWTsyfapivfsjhNfO5wu9AQqu5nWV/+gLyFku/vHLiV?=
 =?us-ascii?Q?QJiHf8nx7tWARyJ4/4R4Ij/fPaes9IEmHY06Evz4K3kCwjgp2HmLKee9byhT?=
 =?us-ascii?Q?cHOykBXxUPkCqSWDtRU1wIVIL8WTMfCKCRYEBhtCG595TBMwRXnHcFdACpeX?=
 =?us-ascii?Q?Epu8oMZC6pUCaPKJugHehRDSkycN2he0LcfIaOamKNMITO42YK+8Rt/Wbahh?=
 =?us-ascii?Q?sZSYaAFTIiAjkIYheoU56Nef49K0jKhlRczPhxBaxAmZnvdgxijMTOgi5R0G?=
 =?us-ascii?Q?PwlFJFqtSrGH7GK1A19edunql8GBZTV/YaC1sXC7QbWPKp+miaYa/sEb2e6e?=
 =?us-ascii?Q?QKOwOE94ssiOBHI5/GQsDuPJDXtDDG0REdBnv71mzWwqXG88nKV/yBTiTJaT?=
 =?us-ascii?Q?4TXNcklaPhzZHecO/YwQek/UyC0eENFvue16Y3bEiVMowDHJ7jMyEYyOK58l?=
 =?us-ascii?Q?YmCDzV9XRr4ZByNfCMvsDttRPaJBOb99WiPp6xQn7JaKXfsjsP0ypRV4Z+3N?=
 =?us-ascii?Q?hNsF7a8aAzXU2xFi2MHyHXCo90cxxfO47xHZBC2bQdTtAMpBNfzi+zXKRrxk?=
 =?us-ascii?Q?uYOfaxK3wCIS8ICnQSS9DHT7K+3+fFQU2NXZc6LNYCIp7qizK9anLxg+Q2VQ?=
 =?us-ascii?Q?avhvyQBSjmXIUZStQGon8N8BZeZkip1Ervd9i/OPFAYDrSTle667JdCUvYL0?=
 =?us-ascii?Q?FkZiKNUhl7mbtEmP/HMd/I9TfLeHVsEEsfIQmbDu6dVah5/PcaRoV9Ia3v6l?=
 =?us-ascii?Q?Pf0htkzrWuAwua9emtST1VWyB/0v/MnLWdm9RKDT8s2AIdFgkS4Z1penZ/xG?=
 =?us-ascii?Q?FHfVha+rZHaR87+hL4h2oH9zNavudLBiMsDUOPPMlAGx/sGMsDxZZJ5AB47C?=
 =?us-ascii?Q?z8TY9939CGCPHL+pifR8n5v3MPISwTmYJqNCnrmNkZGTB0lZxK+1Zx4+e3QM?=
 =?us-ascii?Q?deS+7i8k3b6yQoX2emd+tGR1f6JOM1xZHAGo2MCz8EbQKxXYP1C+yEiFlu32?=
 =?us-ascii?Q?GkObOTIrvRKO092oZ3hO34UMBiqP4rfNgYqSRQ99camvDndzc7Z+nb3MTDZk?=
 =?us-ascii?Q?Stac17ftEl16mrtDHfZJZGed6JKZQyHSszUEHKfDN4Dxd9FayI7P7I0QNT6t?=
 =?us-ascii?Q?SKqcFLod3pM4/ZEoFIqPgNWelopLi+gcmRmRzFZQlSRZ3fV5mZU62SJ+wK+5?=
 =?us-ascii?Q?4COQM/OBd5jf7vTkEG/IrzuZ1dZ0c+V8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M8EL3Z8ZACOu1WRNaA5dArZCsiJ595R9vU9FP9fSBSAMw5YkS/4Mtce+sCAC?=
 =?us-ascii?Q?wDf+ZxKGoBFtZK4psimHJkdcTXlmjELW4Ny8MmxTcCpM/EBcfgjwTfJ4DD2k?=
 =?us-ascii?Q?ygZ2b6spZy3+8Nm2ZBuf2J0cgVXYAh6B7bmeSGbV8N+bb/ndtSsaUkXx0eIe?=
 =?us-ascii?Q?mHuABz1TQYE3eVt8xeLsfojYOFqKBc357idtIekwZPi9dH/IPENi6AcbcTHS?=
 =?us-ascii?Q?VrkkNPnAnJf4hCDccUhIQhbSm+G1//n2akofmRpGRPTckDaLpnoTntCsO6q5?=
 =?us-ascii?Q?baH6R1KDHMswYwu+FwrbZ2uZLaxqU0NQXjCeH/3XZaI0/hzk6N7cNDG5mdF4?=
 =?us-ascii?Q?OuIopU4tBPC5keYSABnQX2N4Jtqid8F03skT1dt5k+bnh9cRCaSq+RAcbWT3?=
 =?us-ascii?Q?JGnBPyoIJiOSVz6aEuPSh3+AGJKQbtRu6f6llSd+tPPYDdcykrzj6v4Nkomy?=
 =?us-ascii?Q?RJ9+Ygs1uT7jzcSYCrKZpNPmhEmB9gEgE6USP05rMK5zXdHBVMq6VrZ/ryUw?=
 =?us-ascii?Q?dn2Xdk2GJuceWwxtGgDaHH0Itdc9hW6tadzDuMlrkxTw8rmAjtVIL5LDHRah?=
 =?us-ascii?Q?3BuDT3qqNaLALiDVDDd9NbGo07Dwbp/FW2iU1XOFr7LhHPxcVCFG0rNrmT/1?=
 =?us-ascii?Q?+IWGFkY/K9t5a64IpUesoyAWb4DiGyzyUL5p+axRym4q4N5HNRCTlKi0xFif?=
 =?us-ascii?Q?SSIbt4Do1L40OWVyC1Ur6c2ifkXriDUrkaBlmLGdIX8XJ4LsULPnziK7ZSK8?=
 =?us-ascii?Q?DbCoBTl8Ac2J16RZt/AwPWuVVqJQmQvGxsvkiG9PBBmIY8aGmlVRxPSmCAQp?=
 =?us-ascii?Q?Nv5sllX3Hfy9LmAeKSag7ieNwk6bvq9i4laDyCwyV/yU3e532a/7Kiktwx3G?=
 =?us-ascii?Q?OMmodcER+hm1cGRcVRSJWdsoUgz05TQeHA8/cbd3wghV96G71hDAaCeUNYCp?=
 =?us-ascii?Q?9k35Mj2ceR2J3o9dspsb6CbfWPtzBLhuRCK5h2itWnQFrGwqBsx0JiTVjJGk?=
 =?us-ascii?Q?d7wxVNPMEFAk1KdWqd8D71bM0EMrU4ZLp6AoVMOvt8Dkn1wf/jvzcdfGlw1b?=
 =?us-ascii?Q?pmd8ZOoc69mhcfb40+22SQMURwQ05bgpHhEQ1zeiz4cBlJiEkMgLGZ2vfxAM?=
 =?us-ascii?Q?cJ7diXQwfo//ZSrVtsYjoVtW0fmbt7L/QYVVCAHqBwxiEvnTbIcM8lPLhL77?=
 =?us-ascii?Q?Xk228IEB/jRzhpHTD2Nsy5oBKVKdriTP+BXU0rwYuDPXT86RkUp3z4tAWau4?=
 =?us-ascii?Q?fhiMcSJNW15Cw1jYdQIGr678DGWtnV1xYNruIxuOa1RwkXnEl+M8T9IBq5x4?=
 =?us-ascii?Q?3ulgCEeavDsNPrJk8Bez6KGLwfSSAAtoS9dDMgEY1oSDQyciHyk4KMslaw6i?=
 =?us-ascii?Q?yvAfpf4rbf9Zca07R9gEpLSpE+36vtPQP3NNjpvKReNm5wbPgv2InfwtPmMX?=
 =?us-ascii?Q?LBeJcwjRgZD3JwvmYb/rlHqcLZoPZX/mstuZv8e7oHMtgzNSICCOVoTQqZB/?=
 =?us-ascii?Q?sP8ZkWoMc47wLZWU5rW3GIqcDRc7jpyYJXU0HbXXW7s6dWGf85pD9fJv/tma?=
 =?us-ascii?Q?5Zb/ZOB6pYVANXdlUoWlWSmWGCT0KOBR4p6SaNNYV22Ibha0dJ26nu4JdmL7?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04601d02-570d-4f66-f80c-08de31b5745d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:14:14.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTQYy7nOvyD3QFk45dOXL4oRsZo/oNXwvG3T0ePf6v7Ew0miJNkqys/3LLdLhb7J4K4xvmG74CyhMZxWXZh9Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
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

On Mon, Dec 01, 2025 at 11:31:57PM -0800, Umesh Nerlige Ramappa wrote:
> On Mon, Dec 01, 2025 at 10:39:54AM -0800, Matthew Brost wrote:
> > We now have proper infrastructure to accurately check the LRC timestamp
> > without toggling the scheduling state for non-VFs. For VFs, it is still
> > possible to get an inaccurate view if the context is on hardware. We
> > guard against free-running contexts on VFs by banning jobs whose
> > timestamps are not moving. In addition, VFs have a timeslice quantum
> > that naturally triggers context switches when more than one VF is
> > running, thus updating the LRC timestamp.
> 
> I guess some workloads are configured to just keep running on VFs without
> switching. I am assuming they are classified as Long Running and are not
> affected by TDR. If so, the timeouts should still work reasonably on a VF
> considering switching is usually in milliseconds and timeouts are much
> larger.
> 
> > 
> > For multi-queue, it is desirable to avoid scheduling toggling in the TDR
> > because this scheduling state is shared among many queues. Furthermore,
> > this change simplifies the GuC state machine. The trade-off for VF cases
> > seems worthwhile.
> > 
> > v5:
> > - Add xe_lrc_timestamp helper (Umesh)
> > v6:
> > - Reduce number of tries on stuck timestamp (VF testing)
> > - Convert job timestamp save to a memory copy (VF testing)
> > v7:
> > - Save ctx timestamp to LRC when start VF job (VF testing)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_guc_submit.c      | 97 ++++++-------------------
> > drivers/gpu/drm/xe/xe_lrc.c             | 42 +++++++----
> > drivers/gpu/drm/xe/xe_lrc.h             |  3 +-
> > drivers/gpu/drm/xe/xe_ring_ops.c        | 25 +++++--
> > drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
> > drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
> > 6 files changed, 76 insertions(+), 94 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 8190f2afbaed..dc4bf3126450 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
> > #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
> > #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
> > #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> > -#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> > -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> > -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> > +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
> > 
> > static bool exec_queue_registered(struct xe_exec_queue *q)
> > {
> > @@ -202,21 +200,6 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
> > 	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> > -{
> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> > -}
> > -
> > -static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> > -{
> > -	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > -}
> > -
> > -static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> > -{
> > -	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> > -}
> > -
> > static bool exec_queue_pending_resume(struct xe_exec_queue *q)
> > {
> > 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> > @@ -232,21 +215,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
> > 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
> > }
> > 
> > -static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > -{
> > -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> > -}
> > -
> > -static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > -{
> > -	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > -}
> > -
> > -static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> > -{
> > -	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> > -}
> > -
> > static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > {
> > 	return (atomic_read(&q->guc->state) &
> > @@ -1006,7 +974,16 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> > 		return xe_sched_invalidate_job(job, 2);
> > 	}
> > 
> > -	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
> > +	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> > +	if (ctx_timestamp == job->sample_timestamp) {
> > +		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > +			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > +			   q->guc->id);
> > +
> > +		return xe_sched_invalidate_job(job, 0);
> > +	}
> > +
> > +	job->sample_timestamp = ctx_timestamp;
> > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> > 
> > 	/*
> > @@ -1132,16 +1109,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	}
> > 
> > 	/*
> > -	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> > -	 * modify scheduling state to read timestamp. We could read the
> > -	 * timestamp from a register to accumulate current running time but this
> > -	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> > -	 * genuine timeouts.
> > +	 * Check if job is actually timed out, if so restart job execution and TDR
> > 	 */
> > +	if (!skip_timeout_check && !check_timeout(q, job))
> > +		goto rearm;
> > +
> > 	if (!exec_queue_killed(q))
> > 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> > 
> > -	/* Engine state now stable, disable scheduling to check timestamp */
> > +	set_exec_queue_banned(q);
> > +
> > +	/* Kick job / queue off hardware */
> > 	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
> > 		int ret;
> > 
> > @@ -1163,13 +1141,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			if (!ret || xe_guc_read_stopped(guc))
> > 				goto trigger_reset;
> > 
> > -			/*
> > -			 * Flag communicates to G2H handler that schedule
> > -			 * disable originated from a timeout check. The G2H then
> > -			 * avoid triggering cleanup or deregistering the exec
> > -			 * queue.
> > -			 */
> > -			set_exec_queue_check_timeout(q);
> > 			disable_scheduling(q, skip_timeout_check);
> > 		}
> > 
> > @@ -1198,22 +1169,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 			xe_devcoredump(q, job,
> > 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > 				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > -			set_exec_queue_banned(q);
> > 			xe_gt_reset_async(q->gt);
> > 			xe_sched_tdr_queue_imm(sched);
> > 			goto rearm;
> > 		}
> > 	}
> > 
> > -	/*
> > -	 * Check if job is actually timed out, if so restart job execution and TDR
> > -	 */
> > -	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> > -	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> > -		clear_exec_queue_check_timeout(q);
> > -		goto sched_enable;
> > -	}
> > -
> > 	if (q->vm && q->vm->xef) {
> > 		process_name = q->vm->xef->process_name;
> > 		pid = q->vm->xef->pid;
> > @@ -1244,14 +1205,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> > 			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> > 		if (!xe_sched_invalidate_job(job, 2)) {
> > -			clear_exec_queue_check_timeout(q);
> > 			xe_gt_reset_async(q->gt);
> > 			goto rearm;
> > 		}
> > 	}
> > 
> > -	set_exec_queue_banned(q);
> > -
> > 	/* Mark all outstanding jobs as bad, thus completing them */
> > 	xe_sched_job_set_error(job, err);
> > 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> > @@ -1266,9 +1224,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	 */
> > 	return DRM_GPU_SCHED_STAT_NO_HANG;
> > 
> > -sched_enable:
> > -	set_exec_queue_pending_tdr_exit(q);
> > -	enable_scheduling(q);
> > rearm:
> > 	/*
> > 	 * XXX: Ideally want to adjust timeout based on current execution time
> > @@ -1898,8 +1853,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 			  q->guc->id);
> > 	}
> > 
> > -	if (pending_enable && !pending_resume &&
> > -	    !exec_queue_pending_tdr_exit(q)) {
> > +	if (pending_enable && !pending_resume) {
> > 		clear_exec_queue_registered(q);
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> > 			  q->guc->id);
> > @@ -1908,7 +1862,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 	if (pending_enable) {
> > 		clear_exec_queue_enabled(q);
> > 		clear_exec_queue_pending_resume(q);
> > -		clear_exec_queue_pending_tdr_exit(q);
> > 		clear_exec_queue_pending_enable(q);
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
> > 			  q->guc->id);
> > @@ -1934,7 +1887,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> > 		if (!pending_enable)
> > 			set_exec_queue_enabled(q);
> > 		clear_exec_queue_pending_disable(q);
> > -		clear_exec_queue_check_timeout(q);
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
> > 			  q->guc->id);
> > 	}
> > @@ -2308,13 +2260,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > 
> > 		q->guc->resume_time = ktime_get();
> > 		clear_exec_queue_pending_resume(q);
> > -		clear_exec_queue_pending_tdr_exit(q);
> > 		clear_exec_queue_pending_enable(q);
> > 		smp_wmb();
> > 		wake_up_all(&guc->ct.wq);
> > 	} else {
> > -		bool check_timeout = exec_queue_check_timeout(q);
> > -
> > 		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
> > 		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
> > 
> > @@ -2322,11 +2271,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > 			suspend_fence_signal(q);
> > 			clear_exec_queue_pending_disable(q);
> > 		} else {
> > -			if (exec_queue_banned(q) || check_timeout) {
> > +			if (exec_queue_banned(q)) {
> > 				smp_wmb();
> > 				wake_up_all(&guc->ct.wq);
> > 			}
> > -			if (!check_timeout && exec_queue_destroyed(q)) {
> > +			if (exec_queue_destroyed(q)) {
> > 				/*
> > 				 * Make sure to clear the pending_disable only
> > 				 * after sampling the destroyed state. We want
> > @@ -2436,7 +2385,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > 	 * guc_exec_queue_timedout_job.
> > 	 */
> > 	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> > +	if (!exec_queue_banned(q))
> > 		xe_guc_exec_queue_trigger_cleanup(q);
> > 
> > 	return 0;
> > @@ -2517,7 +2466,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> > 
> > 	/* Treat the same as engine reset */
> > 	set_exec_queue_reset(q);
> > -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> > +	if (!exec_queue_banned(q))
> > 		xe_guc_exec_queue_trigger_cleanup(q);
> > 
> > 	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 166353455f8f..38b0c536f6fb 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -852,7 +852,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
> >  *
> >  * Returns: ctx timestamp value
> >  */
> > -u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > +static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> > {
> > 	struct xe_device *xe = lrc_to_xe(lrc);
> > 	struct iosys_map map;
> > @@ -2380,35 +2380,31 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
> > }
> > 
> > /**
> > - * xe_lrc_update_timestamp() - Update ctx timestamp
> > + * xe_lrc_timestamp() - Current ctx timestamp
> >  * @lrc: Pointer to the lrc.
> > - * @old_ts: Old timestamp value
> >  *
> > - * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> > - * update saved value. With support for active contexts, the calculation may be
> > - * slightly racy, so follow a read-again logic to ensure that the context is
> > - * still active before returning the right timestamp.
> > + * Return latest ctx timestamp. With support for active contexts, the
> > + * calculation may bb slightly racy, so follow a read-again logic to ensure that
> > + * the context is still active before returning the right timestamp.
> >  *
> >  * Returns: New ctx timestamp value
> >  */
> > -u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> > +u64 xe_lrc_timestamp(struct xe_lrc *lrc)
> > {
> > -	u64 lrc_ts, reg_ts;
> > +	u64 lrc_ts, reg_ts, new_ts;
> > 	u32 engine_id;
> > 
> > -	*old_ts = lrc->ctx_timestamp;
> > -
> > 	lrc_ts = xe_lrc_ctx_timestamp(lrc);
> > 	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
> > 	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
> > -		lrc->ctx_timestamp = lrc_ts;
> > +		new_ts = lrc_ts;
> > 		goto done;
> > 	}
> > 
> > 	if (lrc_ts == CONTEXT_ACTIVE) {
> > 		engine_id = xe_lrc_engine_id(lrc);
> > 		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
> > -			lrc->ctx_timestamp = reg_ts;
> > +			new_ts = reg_ts;
> > 
> > 		/* read lrc again to ensure context is still active */
> > 		lrc_ts = xe_lrc_ctx_timestamp(lrc);
> > @@ -2419,9 +2415,27 @@ u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> > 	 * be a separate if condition.
> > 	 */
> > 	if (lrc_ts != CONTEXT_ACTIVE)
> > -		lrc->ctx_timestamp = lrc_ts;
> > +		new_ts = lrc_ts;
> > 
> > done:
> > +	return new_ts;
> > +}
> > +
> > +/**
> > + * xe_lrc_update_timestamp() - Update ctx timestamp
> > + * @lrc: Pointer to the lrc.
> > + * @old_ts: Old timestamp value
> > + *
> > + * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> > + * update saved value.
> > + *
> > + * Returns: New ctx timestamp value
> > + */
> > +u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> > +{
> > +	*old_ts = lrc->ctx_timestamp;
> > +	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
> > +
> > 	trace_xe_lrc_update_timestamp(lrc, *old_ts);
> > 
> > 	return lrc->ctx_timestamp;
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> > index a32472b92242..93c1234e2706 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > @@ -142,7 +142,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
> > 
> > u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> > u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
> > -u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> > u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> > u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> > int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> > @@ -162,4 +161,6 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
> >  */
> > u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
> > 
> > +u64 xe_lrc_timestamp(struct xe_lrc *lrc);
> > +
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index ac0c6dcffe15..3dacfc2da75c 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -233,13 +233,26 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
> > 	return 0;
> > }
> > 
> > -static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> > +static int emit_copy_timestamp(struct xe_device *xe, struct xe_lrc *lrc,
> > +			       u32 *dw, int i)
> > {
> > 	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> > 	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> > 	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> > 	dw[i++] = 0;
> > 
> > +	/*
> > +	 * Ensure CTX timestamp >= Job timestamp during VF sampling to avoid
> > +	 * arithmetic wraparound in TDR.
> > +	 */
> > +	if (IS_SRIOV_VF(xe)) {
> > +		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
> > +			MI_SRM_ADD_CS_OFFSET;
> > +		dw[i++] = RING_CTX_TIMESTAMP(0).addr;
> > +		dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> > +		dw[i++] = 0;
> > +	}
> 
> Is this change for a different issue OR is it the same issue that is fixed
> in patch 8?
> 

This is covering the case where the LRC timestamp is less than job
timestamp. Consider the case a context switches on with timestamp of 1,
by the time job timestamp is saved the value is 2. The TDR would see
this as wrap, thus immediately timeout the job upon first TDR fire. It
is possible the job only switched on the hardware at very end of TDR
period.

This code ensures LRC timestamp >= job timestamp on first switch in. So
this code is needed in addition to the previous patch.

Matt

> otherwise, LGTM,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Thanks,
> Umesh
> 
> > +
> > 	return i;
> > }
> > 
> > @@ -253,7 +266,7 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> > 
> > 	*head = lrc->ring.tail;
> > 
> > -	i = emit_copy_timestamp(lrc, dw, i);
> > +	i = emit_copy_timestamp(gt_to_xe(gt), lrc, dw, i);
> > 
> > 	if (job->ring_ops_flush_tlb) {
> > 		dw[i++] = preparser_disable(true);
> > @@ -308,7 +321,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > 
> > 	*head = lrc->ring.tail;
> > 
> > -	i = emit_copy_timestamp(lrc, dw, i);
> > +	i = emit_copy_timestamp(xe, lrc, dw, i);
> > 
> > 	dw[i++] = preparser_disable(true);
> > 
> > @@ -362,7 +375,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> > 
> > 	*head = lrc->ring.tail;
> > 
> > -	i = emit_copy_timestamp(lrc, dw, i);
> > +	i = emit_copy_timestamp(xe, lrc, dw, i);
> > 
> > 	dw[i++] = preparser_disable(true);
> > 	if (lacks_render)
> > @@ -406,12 +419,14 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
> > 				     struct xe_lrc *lrc, u32 *head,
> > 				     u32 seqno)
> > {
> > +	struct xe_gt *gt = job->q->gt;
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> > 	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > 
> > 	*head = lrc->ring.tail;
> > 
> > -	i = emit_copy_timestamp(lrc, dw, i);
> > +	i = emit_copy_timestamp(xe, lrc, dw, i);
> > 
> > 	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> > index cb674a322113..39aec7f6d86d 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -110,6 +110,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
> > 		return ERR_PTR(-ENOMEM);
> > 
> > 	job->q = q;
> > +	job->sample_timestamp = U64_MAX;
> > 	kref_init(&job->refcount);
> > 	xe_exec_queue_get(job->q);
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index 7c4c54fe920a..13c2970e81a8 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -59,6 +59,8 @@ struct xe_sched_job {
> > 	u32 lrc_seqno;
> > 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
> > 	u32 migrate_flush_flags;
> > +	/** @sample_timestamp: Sampling of job timestamp in TDR */
> > +	u64 sample_timestamp;
> > 	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
> > 	bool ring_ops_flush_tlb;
> > 	/** @ggtt: mapped in ggtt. */
> > -- 
> > 2.34.1
> > 
