Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11995A092F5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 15:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFA710E507;
	Fri, 10 Jan 2025 14:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzxl1hHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9018210E507;
 Fri, 10 Jan 2025 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736518098; x=1768054098;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=z6iB1x75vLmX2Zbzl+m2MgP9vamsLwAWdO6rahOMCLw=;
 b=bzxl1hHzL+F9odCl1Pflzu/bVYFN76VJZTmQDs0U7/rz5G2srLWK2rLp
 r+W6j/MSLs70BoGvKBoFV+kkZeF8Eepc1L7lNbalbAyILvnvKHWCmcr61
 IuiNy7p8LoOH47Lhw7A3ZgDHQdTx+jn0TST7l3qK6CWkoLJK8ki/5UUl9
 VHC/0lSCnCZCluohEnUKN5MZxGB/abrJqUpPQFPzBP/RljgSeCU72XAdT
 35Qg8A1L9Zep7LjaLiWBlCO034h/sQ0AolNRV8rXk4ou186QOGpu4Wwet
 iJlBHK3+EFZusRB2k8qfPHfFK8gVQ16D+rzxP/QXX2WMADO5nBWcRfN3B w==;
X-CSE-ConnectionGUID: lomOAcL5SpmaC/7npCVBQw==
X-CSE-MsgGUID: 3zdc+ir+QGSGyaOxmS1H3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="48179551"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="48179551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 06:08:18 -0800
X-CSE-ConnectionGUID: JgFqDOJASg+23hA1HrdPTw==
X-CSE-MsgGUID: mFyFuh4tT2CugqE2nysxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103799267"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jan 2025 06:08:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 06:08:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 06:08:17 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 06:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1W5nd8S1FJa3m+cg4nymXw04zgIYMxBnwdl6cS681Ib78XDOtj+htX04z23bdMftdaoIEUDN0pfAAiCAuJUttZmi9mIsTHggYvoNNhFt/RnMesk1Pet0mHcbZxAemoQENf2cxbNf8XkUiy0T+EECumsNna4N+QPhnO2IFrkWVbPViUwwIdmLtmXJrSTxfle9wzAYnF5f7b6ixo9YewNWsHtVm8825FtL7pTi5Avcf8x2NWINonEMqJM4enp3Aij19O6nPC0q0oZAEryCcR/uw+mzujUnQ3paLwPX846qRSXpScHaq1WVOYUcXaBhYypiYq6JuPkJrCAHXRhAFjAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbgsDfJtA1KkxOUAE4+j/nk07m6LYXksT3OWq7KuE/s=;
 b=ul0FvSRt2TNm/imZgfo6uKqOHhRG9OM9hYxQKiDbs9DFiMCJjTFvCtHLCkJUh61l8IY3Ncaq5s3mwymsK19O6eN5Jpfk+TjSj0woYnYbVfYXWtXcaoD6ZecsjymyEI52oEqJ43E7M9noJ9EG2U/ENfk5WBHatmlqWd1XcAtKH1hnNoYwXhSeFGQXUBpYL+Nj745hvKEvr4rCbajTuW3850yM6fFEAHkqK2sCQ19+at7XnoJE2BNy76E/M4z3KXno5hrjBRMGQRELz6VToVyGCCm1vcPiDFWyJFZ/N2kAXfThyE38X002beNoJ2HsAzz+wlU0VqsxJrjCVxAlKLqgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 14:08:15 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 14:08:15 +0000
Date: Fri, 10 Jan 2025 14:08:06 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH] drm/i915/gt: Ensure irqs' status does not change with
 spin_unlock
Message-ID: <gtrmxhovj2qpmcica76f7uxharhztbt7fdoromyxbsd7ltjvuq@lhnv2wcxm7or>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: DB7PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:10:52::44) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: deed5f79-70cd-4962-b66c-08dd31803993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzdiaE1wYWJDVm9FaG9vNmc5VmtyT0ZJTWhPRmlGb3MzUnVOTEkzVjFoTDRa?=
 =?utf-8?B?aHQ4UmduL0ZMaXhmMlBSRHRwTThDdjUrM2lmNStZb2drQUJKd1cyZi9LMDdJ?=
 =?utf-8?B?VkgzUkFZaU1MQVk3S1RMNEFKTDNmZzBFd2QvWThzZFVFV0FaQUpOcGdIb3dK?=
 =?utf-8?B?UmdMckJuMHpVOTZvaW5mZW1nR2F6SWJvUWpTRmM2MVJKcXBoRUZSRXRBeE1i?=
 =?utf-8?B?MmZqSjBBRENzbS9nU1N6Qi9ZQm1HVXZZd2tEaXBMaDNXYXErWlhuUEc1dFBV?=
 =?utf-8?B?enZ2aDVBMGRrblV5SXhlS3VIVEYwdzV4cWdEV3VYL0NuSXdTSEJ1UlBTQy8r?=
 =?utf-8?B?WUdQMGhBbUl3aEdrSk5jYnlhd2ZpMzhDVXZKa1ZiM0ZYS0g4M21scFNTcUt5?=
 =?utf-8?B?Smt0NG9BQ005TXMwNE9QNFlXRGlpZU0zL0NKeG9ieGc0MDVCeXJKUEpLM0Nx?=
 =?utf-8?B?L2RLT29CK0VtcGNoRlZkOERBUkt5WkZjdFhTZ0tZVnFhR2FoVDZRWndkMGtV?=
 =?utf-8?B?REdLMzU1Q0llWHZWVU9Kc1R6MEpsSDlndTEvVWZhNDFLLzlvdXh4MGlZYVho?=
 =?utf-8?B?YzRGS3ZhM3ZabU56SzRVTmFPMG84Zk1kc1BZWWdMNkNEazgzOU11RWMxVlRP?=
 =?utf-8?B?VVkzekJZRVNwSGhtRjZwS21Qa2sxcHV4ZnQ2K1BLalEzNnpuY3plTDJ4dk94?=
 =?utf-8?B?NFhQOGo1SytlTm9YSEtLaWN0RC9xWURNU1VkUkFURHNjVDJSQ2t1c3llR2xm?=
 =?utf-8?B?M3AvTkdGZnlaUkU4SkhhVHpWcUc1TE4xZCtoY0dqYXlSOERTZUV2ekJPSXFq?=
 =?utf-8?B?U1RpUGc4K1l4OFgyK202YWZ4WmlEVkp4R2EyT01VSmVzUjdwTjViZjcxZDl5?=
 =?utf-8?B?UXFVUGFZajhvbEtoaXI1dmJJTnBsV1VWK0FINzd0RUtBcVh2T3BYL1BaMmZ0?=
 =?utf-8?B?RGdNQlJCKy9BcGpQWTY3V1dtLzJKSkthaDJWaDBEdmtPVVZrR1hZaW5ZNmJt?=
 =?utf-8?B?MWo3dVVXS1pXeXFJMGE0MFVtR0psRE9JYjZsejN6ZkNMNEpUR0NudkdVbnV5?=
 =?utf-8?B?ck1BRWJ5NGN2T0tJMDl1OFRzY2FWVWxPZFVielIzTmVpR3poZmVJQW4wYy9p?=
 =?utf-8?B?YzZVU1lJbUdpNmJKbFN5bnE2RldNZFhja0cxeUd6WXRoNTlFQnFuR2pzdkZJ?=
 =?utf-8?B?TmpLTlZxNVhyTEtSbitTRFEvQ3pNMEswSHdyUTFHeGJHUWpCS1ZRYVR4RnRC?=
 =?utf-8?B?NGFaS0IxeEMxY3M4bUJGYVdPbGVpTjBENExZdWJvVERDbFo1UXJIUDNZWEQ4?=
 =?utf-8?B?Y0FPVlFONmJ1WWR4Ung4UkhXQlRDZEpqMmZ5NFBWMTBNbGl5RitGS1p6L1c2?=
 =?utf-8?B?YzhoWnhEYnNGOVZzaGdDUjlaT29iN241QnNRZVFodVR6TWUzYnNNbUx3STNa?=
 =?utf-8?B?WFJtc3pzNnlYbFc0aUIwb2xQOXlwNXZud2thU1c0WkZvY1hBaGY3bFREQ3o2?=
 =?utf-8?B?bmpHaVlyY0xGSDdJNmVDbkVzNVZMbWtjTEhnUFF1UDZraENSR2lmRGZxQzNl?=
 =?utf-8?B?Q0lIVEliYlFmZDNpdU5uV3BXQlh6OFJNVExQWWhpTnQzd0E4SHZBL24yTm9Y?=
 =?utf-8?B?L0dHRzlLQTl2Tms1eUFreU13OUFWL0dwZGk2VXhVQ0Q2NVVDQUdCUGZENUVy?=
 =?utf-8?B?cDNEV2RoalFYcytZalU0R2IzTzM4eXJuVkRXMkhLL0xXamNFbmlZZ3pJLy9D?=
 =?utf-8?B?UmRpMFZEa2JhU29NNmhDQjltSERqM3lSTnU3QllCc0hNbmhoNWw3MloreVUr?=
 =?utf-8?B?TU1TTCswVVlOK0lTWUo2WG1rWnFxSzV1WkhVWnhNSTkvZ2d2Mks1Z25rditW?=
 =?utf-8?Q?6NtSjcm4Jf4fF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxXTko0K0NuMlFtZVdEcytPMFBTT2pDV3VRR0RNYlFZZlA4cmt3OGVKNHlE?=
 =?utf-8?B?NnRIdXpnUDc3ajFXOHJqWmNsOHdMNjV4eGVvRVNHWXltYVlaUTcxTkFzS3li?=
 =?utf-8?B?ekNaamNabmtJWi9kYktxVitJNWh5aG45KzhMZzlQaXBvckl3OE9uMlplZ2Fv?=
 =?utf-8?B?QmNxdDkwaEpyVHlxVkJEVC9JTXNCUkpLLzhhRDI4MEVwb2FGWWxLek8reXVq?=
 =?utf-8?B?dVIzc2VuNWRoU3lTeVFiTGJrVTFqVjI3Z0s5TkQ4aW5ZaEtLQWY4MFhRY1dV?=
 =?utf-8?B?K1lFaTF0cjNibUwycjBxTHNFa05ldVN3U01WajFwbEg0T094dnJmRXI0cjJy?=
 =?utf-8?B?MTNqNHVYbXd2d2pYeDVBUnBnb3hwb29jWk1VOTZjZGZzZzMraUY1MTNreE9D?=
 =?utf-8?B?Z2ZSSnhzUzRBMW1KWmhGTi9xaXMwU3dvcGFhVTBFRUtYRzNWOXR4TGM1amZT?=
 =?utf-8?B?NkZTQVAyZjc3WWFVNzFCNFNHQTM1dW1zUmlFdi9Kc2l3YnpKVDd6MVN6RDk1?=
 =?utf-8?B?aUJHWUkvODNUdXB0aHRIdHFFa0RSRllVbWNwU2xKdmJUQTFKKzA1RHdhUEs5?=
 =?utf-8?B?S3RmK2pRdkc2YmxyTTh6T2RYRVJvUnl2V0dEOWtreUw4Q25aTUJCYUpCWkpD?=
 =?utf-8?B?eVFQYXF1eWtKWkNZQjQ3Y1Rid281SnlQUlgxbHpOZ0p1ekc1Q1UxbDdsUDJY?=
 =?utf-8?B?VGhtU0drYkFzZ1l5MXQwLzdLS3ZuMkwvckUzTTV0dDNNMnFMV0FJZ09uV2Rt?=
 =?utf-8?B?eXBPQStjenlObU9WNnl5QTVPc1pOMHh5bGpla3h1TkJPcmQ4V0c0NjBVcm9S?=
 =?utf-8?B?NCs3QWJURitzYUFhdCtNdzlnZ25xakpPdlFOUHFJQzJoTXhIUXRmcVBxRXFo?=
 =?utf-8?B?c1NRNFN5L1NXdUNmQWxMcUNWbkd2aXIxTjBCOWxmZTIxZEZiYUh6NzBYckZl?=
 =?utf-8?B?ZXArR0ZGZTZzZWhmbHhXOWtMaFlaQUNnOHBQWitiM0krM1c5UFhiTnZtb1Iy?=
 =?utf-8?B?YkV4TzllZWV5RFlEbi90cjhhZzNsV2FsblhDbXN6c2RsZHAxZkQ3NFd5YS9X?=
 =?utf-8?B?enhYbnNzbi81TnJmRVI1VnRUNU0vWmVUb2YwaDNFbmE2dGZPYmJlaXBZZWQr?=
 =?utf-8?B?Nk5jVE5LK0pleVg1Q0V1UGluMGV4OWNOODR1aU5BTjhicGs4WVdpVDk2Wm1B?=
 =?utf-8?B?Q1B1VFhqUmNsejEvRkxKYWJjemJYZ3ViZ1lLTHZTaTBxVEJaQ1VRLzZVeWRl?=
 =?utf-8?B?bWRTY2tQTDhTZExjaks4aXdVd0ViMmwyMFlqVEhKRGNRK3ZLRTFsZXo3U1JI?=
 =?utf-8?B?WGZTM0tWVFdtaEFkSldSRjJOLzJTNXBucnRpdU5rNEdCSnhEWGM1SlRDMldU?=
 =?utf-8?B?OHZ5bm1yeEdvcDRCUVhuMGtHOStYWmpMRGJoa003dTM3QjRWRjFXbUJBVUxH?=
 =?utf-8?B?b3gzQWNGSlBDcU11ZW1CSlBHNlFBTzVCeDRRMkFLZHZWZnVVWEwrTzREdG0w?=
 =?utf-8?B?OWVEU09mblJEWUkrVnRKSXBkQ1NDSmZGK0dIWkRpOGc4VkhtZFlOVmRsWnRy?=
 =?utf-8?B?SWZQOFBES21KdzdpWDBNOTJROTlPM0JOWStOL3gxb3pqeGRtTFB2aWI0cEZv?=
 =?utf-8?B?VmNtZjFvV0Q3VVlVZnJldE9sTXJpYnlaeWlkQkhrWFMrTXBsNW1Yd2N2T1E2?=
 =?utf-8?B?UmhFQWdyUHJuL1EySFp4STk1UlZSVldOby9Vb05xZUVHZ3ZxMkRpcFIxYXY1?=
 =?utf-8?B?dDVCODk4QzVqcmVIUXBzeDhGT25XK0EvaUw1MEZkMTFRNldkTUZseGNYQ0FC?=
 =?utf-8?B?WW1VZE84MFZhKzdYS1MvbXA5RnhJSkQ2YmdDV3pWbnIweVl2eHpJVllBR1B6?=
 =?utf-8?B?MnJoZnVNVTlvRS84aUlrNi9lam82TFE3NUYyM1B3L3NIR3lnSzRPMUwrcStr?=
 =?utf-8?B?OHpNcHRFSjZrN2V3Mk15UVIzK2FmWlo3MVhwZkdkRXczTWpucGQvVDB0MHFz?=
 =?utf-8?B?U0FzbnZzem8xSy9OZlJMM3hBMjV2TjdmRFE3RmxSSWtBUnA2SWhlVkt3VzRZ?=
 =?utf-8?B?UFNKSUI5blE0MmZsYjk3bnhncUV4a29tNTljT1NCdTkvZWk5eXNFVWY0NDEr?=
 =?utf-8?B?Z0VOSFBZNWJ1dnErdkF3NlBjMWRQTHZMMnJjUENMUmxxRVYwMWNQNDdnWCtX?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deed5f79-70cd-4962-b66c-08dd31803993
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 14:08:15.0132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwQuWK7th/dnUAwB37TcAnaPjlE6qBXDZPh0Bf0pamePgqlkh3u02K2ORsY5IDvfmcFy/Ql6La55g6zLkdH5IsjE/akqViZKX/VgKFhYnTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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

spin_unlock() function enables irqs regardless of their state
before spin_lock() was called. This might result in an interrupt
while holding a lock further down in the execution, as seen in
GitLab issue #13399.

Try to remedy the problem by saving irq state before spin lock
acquisition.

Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
This issue is hit rarely on CI and I was not able to reproduce
it locally. There might be more places where we should save and
restore irq state, so I am not adding "Closes" label for the
issue yet.

 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 12f1ba7ca9c1..e9102f7246f5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4338,10 +4338,11 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 static void guc_retire_inflight_request_prio(struct i915_request *rq)
 {
 	struct intel_context *ce = request_to_scheduling_context(rq);
+	unsigned long flags;
 
-	spin_lock(&ce->guc_state.lock);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
 	guc_prio_fini(rq, ce);
-	spin_unlock(&ce->guc_state.lock);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 }
 
 static void sanitize_hwsp(struct intel_engine_cs *engine)
-- 
2.34.1

