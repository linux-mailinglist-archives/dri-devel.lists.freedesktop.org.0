Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6F9951405
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 07:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C7F10E2CD;
	Wed, 14 Aug 2024 05:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+YLkHwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063310E217;
 Wed, 14 Aug 2024 05:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723614347; x=1755150347;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rYcNAD/ZhMmAQuEN2b/yjHpbEfnTKbGzYShcnBTewYk=;
 b=j+YLkHwMjKtT1Mw7J+nArBwIaRhzeND3oSn882Nvs9DLSs4oSYKkFvnt
 yjL1VOM+0fj/aabgpQ5CPZngTlbbKueyvIgZ8B7HJF+YA224JK/1aJ/2m
 9JPsT56hTAsBLuUPne84WTf3RNOpmQ+QP0MEMu/q+pgCdr2beY5v2i0bN
 35AC1i0fd8xccZUxtJXP2MirSNy5CmZfISl3128QogwHmQ20usVwK+ATG
 xK+yrghMzYeXv2uXfQVw2llqfQdI7g6Xu9672J+L167rIknoE9x/bvD3h
 vt652B/J15cqopnyxDV46X0E+ntAKmzetRm7g8Nb3sKZs4MzDqX9Jr598 w==;
X-CSE-ConnectionGUID: FjP3kuO0T6W83gyi4EGaTw==
X-CSE-MsgGUID: wK3c+wSNRAmrYtjdyDTK6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="39316037"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; d="scan'208";a="39316037"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 22:45:46 -0700
X-CSE-ConnectionGUID: PBgZTAvoRZeA2A2pJe8iLw==
X-CSE-MsgGUID: Nt+yXYYFRESKqJ0wKwu0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="63828185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Aug 2024 22:45:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 22:45:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 22:45:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 Aug 2024 22:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGKNrEM72guCMzmTbN2hkqJI+WJxyy7JgREEg9DBF+FrFeMFrK/V+r6xWkeNLohM0vU9h3SvNsBB5THadplaLG1Y230RFmOTSYMBpbJ0gcTTsgulPX/whkBmx03TU6oGL7Ex+xDPN60m+XeomKiS2HcYTQYh06Fphz1xKTCafvgkhSYRW4iexaA+v/MA5ImAzjL/Z5GMegWRexW697cLvv8nln7++guf4MhLjL1bT8JtbocjtuJsOUiGyyLFuI6CfgxM4H3J6Rif7BBBCNbw4dB7PHBxJx/XjOZJfTYN88KAupcErV38eWtktkcWQCjt7+wldL1WSc5Pau+V+G59jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3b5WAYYOH9p7DjdO5XgDic5CJ5hTfAsLl2+FlualPM=;
 b=BDIiA+VV9GvIAvkhBNflJDkd4NGKiEM0EKqLRc9pqNtYfths7e4QKi4ULeCz6DR9ffTPhUdOQ8uVmDNuMpIIyWiU6BAqeaSCYuWlE+bchfrTQerYzT8vuQmZvDmRTtBKG5Wq4ckGTgvaeK3sEs1G77tGHctvJmb/1TDzSRBIXFum9oKXKEgiRkFfQQoQ1kaeyk7TXwxcM9NyCjtFd7yhPnA6a7PDdvAtkDojx7i7W6+KOKokzO62Wqwl6fHb1Tfo8XKeZPMZ+c5mxEddr5Qe6a5HP7CC9kLKutOtUYaQGYS2dMZwpwvUljcqYgdGjIW63lX9rBK4jqcYg2pzxuTd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5921.namprd11.prod.outlook.com (2603:10b6:806:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Wed, 14 Aug
 2024 05:45:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 05:45:43 +0000
Date: Wed, 14 Aug 2024 05:44:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <ltuikov89@gmail.com>, <daniel@ffwll.ch>, <felix.kuehling@amd.com>
Subject: Re: [PATCH] drm/sched: Only start TDR in drm_sched_job_begin on
 first job
Message-ID: <ZrxES0mUqRsB/iDZ@DUT025-TGLU.fm.intel.com>
References: <20240724234417.1912357-1-matthew.brost@intel.com>
 <b3efa6b1-1078-4b1c-bdaf-d8774b0d798b@amd.com>
 <ZqJmTpuTiYYQxXjA@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqJmTpuTiYYQxXjA@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5921:EE_
X-MS-Office365-Filtering-Correlation-Id: ef880bbe-927d-4177-036d-08dcbc24566b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9HrDu1EeLs2fE7Mi4ohR0k7SkL/YUWqRlIHNzpqVsDwEfZ1LzMuT5QQ4dW?=
 =?iso-8859-1?Q?WBcF2JWo6YTJnHJG4N2V8BfhhTMFxWBnMiAz9aqHMPNaIsWSEWEIdYCU1V?=
 =?iso-8859-1?Q?slme5L0p5s/6CicMcA1m3HNKwRUG7xOop6wRwsThpatixE4IY47iAqe0K2?=
 =?iso-8859-1?Q?d5Awvsl/5uMAU9+RVtAnKN7ixgvLmTBMF3a/mC8Bacm+hWP4qsBH5VoQrC?=
 =?iso-8859-1?Q?6MRfBG9EddevTWheLhmlke/0v8t4MrvP3G+0mWuneXF5nD86/IQRHAcenE?=
 =?iso-8859-1?Q?rt6qbQK3ePNuuQDOXk0OwxdyJCYXzxvzxBdXKYbnNi9gh8p0xJJh+jAWtD?=
 =?iso-8859-1?Q?ouoD0WYUdgrAAe+UyT2qulU4xkYPSnnJYjICs0aUn9Mfqqu8UKcPZgIahn?=
 =?iso-8859-1?Q?005rCmfoR1o0wF1NtQj+35hZ8xem93M1/ih1z3PFBkrjU0YoPIffU3/gmc?=
 =?iso-8859-1?Q?PYRQFA+MGRht8Rj1Zut85lMH08gKJbVyuUL4L52RwYB3LUtUlz8wZ4dI3z?=
 =?iso-8859-1?Q?fE5zVGynrKkmxOwgATvfI3bQr8F52rd8q1lfpI4vBJrQC4MefPey3wHTX8?=
 =?iso-8859-1?Q?WIK6M/ebSdzXNghk8l0eobGB6li0W+SQiwO+VISaDcQuEE/KqjNiMb9ifQ?=
 =?iso-8859-1?Q?KWeGtOzHJ5vWBV7sP63lpo1AFL2hEZ5GmuUbP4VZZvWac5koN1n178iHrZ?=
 =?iso-8859-1?Q?qevT2iUh4BBBdQWcYOoGHeiy12N5cSeTOmJY0OZZbkECFZY1iwxiMuUV3g?=
 =?iso-8859-1?Q?C+3Cwe5pA8532VbYPeiuYolMxUOLH9CuzpUEjlF/DoowzEAGfa6hGTPQF+?=
 =?iso-8859-1?Q?TYSmaItJhpv2vJJ4G6MBgl3UGji3PhjIevMQaE9lrBDTWKLCogD7OWOj2/?=
 =?iso-8859-1?Q?LHzVXnTf0fHRYlc7Zcdjk14A2zkNjCO+Cx/RYrZj9u19izNnvLBcLjpxmW?=
 =?iso-8859-1?Q?ryI2nlua49ikzkUmBw+UpGD68mCPAzf6BWnCSv4SH1oBenH7UAW+QPbUuh?=
 =?iso-8859-1?Q?VsPxwW/Ezw1C0FAHze+svLzW88lBIMxqH+sVHQGQwAotT2DxanEahq+Sf/?=
 =?iso-8859-1?Q?RhJi3NOwD/TNLyeKcsBq2fbyfgBgA6Nsp6SGcJYRjm/+u1M76weNO3po8l?=
 =?iso-8859-1?Q?9dJsSNy8c/m8mo9GLlTmnWWl25QnXNErf5Zrfmql3xNuobRwqiSCbYsxGC?=
 =?iso-8859-1?Q?AFLeG8YopAPOiZNpkGyCyZCpvgO/gAS/mhm9WaNb9CaLrE01ISDXumYW0P?=
 =?iso-8859-1?Q?ymyoqsQlX7Kp8od+BasOO2rqVsPCbicPP8a6X06U4BoVQ13BYsGN2yihLH?=
 =?iso-8859-1?Q?w/ov4eLmEVSD4/RvqXHxvUwl/G48JDQOHNHgRfAnb3TfiJuL9meeI7Ck7z?=
 =?iso-8859-1?Q?iaDrNeXtUoc3iwdWh9ePS9O+epjKZH5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nVJtmWSDG1rMyrcR2vomgne/H0Ra1wPUJOKm8IBVp/tC0ZICsawrvASpv0?=
 =?iso-8859-1?Q?fIBnBjsGe9oauNATvNjVL63VKgphEUUSFsLIy5l4k2TIabf5clu/mZjXDI?=
 =?iso-8859-1?Q?dS8a0xMBM7uT9uFyBI8Sf8P0Yy7VH8q/9aaYu03wilFrjbVWyINnaZKK0t?=
 =?iso-8859-1?Q?FLIGFdAGGQK1epw4UIQ5niLRQvoME9Ggxi/S+4hFk5+QstH+GS937oBMjq?=
 =?iso-8859-1?Q?f9XgxQKcFJ8slLXheE5FC0p4+aQSMuBUooVd0GGUtKTCKpSm0cmsGhaceC?=
 =?iso-8859-1?Q?RglVoghnZ+U959WiVz0rvgQ1G3Iyvi3I2s7SNRwrohp+Qhk6VRzFVa98L5?=
 =?iso-8859-1?Q?TEr+mLRW2RqcfogK48FB3qrGvqrnHsXQ6jCLH5PxiLlH59QCls5zmb9wKm?=
 =?iso-8859-1?Q?mmdcCgInwKacQ0nuOuu31AzAw18qyjKzS+fdMcxiuBP6K+ChSVTplCiqMp?=
 =?iso-8859-1?Q?UoikZv4sDopAMve5NuI2PBD6iDsXTKPgsTl1n5lOBw0nXzYeT3JyC2uyGC?=
 =?iso-8859-1?Q?DcZ8lc+7A5XjBL6xOQ3RWG/D1CqwOjxZMnui9CdWjPDro9yM+ZDyJf9Zui?=
 =?iso-8859-1?Q?rwSqMt9lEldO5BPVx9143litnh1KUBtsPEXmHxbphBupVX3j+UhUfAtTSy?=
 =?iso-8859-1?Q?fQDX2nJy2koNxW0xlQl7YBH+NknjhTrbLkqimtv4MNDydO3sSLeb4Xm0Vc?=
 =?iso-8859-1?Q?zt1ewXvflB0qQCEO4+7hbJvZHl/xe52RBmFd0248g+dHS5g1e99IRlPG5O?=
 =?iso-8859-1?Q?5oXUM7+0hwy1hWk09K9ZQyD84rhyB88DHTLjJcNVxoQfT7n4fmSGmqfrDV?=
 =?iso-8859-1?Q?qACCkA+72+qAMVo2rnctcE/yzbdg0XNUiuW51r1Zx2JIVv3B1FfHjzgeGk?=
 =?iso-8859-1?Q?XvI0EgCPdIne8JUwlt64leWsGBPTUQlrf30LAtzd1XVc40WJWjJ0WAh/k3?=
 =?iso-8859-1?Q?PxLZIaRQQ+O+4N6SwQ4XrUyFqvikAdQCnoCO07bpGNUQ1wHQDd080Sr7Cd?=
 =?iso-8859-1?Q?gAzXhXsBRW8DGVrB4oXTnVD17ep64jYFx7X2eYwDno3dE9Seh8FgbjdhjB?=
 =?iso-8859-1?Q?IlNmBNU/gMLm7SCQPDQ1BgJhWSl8naGO01w6PYB0UMYJEMpdEr/kW3hVcs?=
 =?iso-8859-1?Q?/UslYWphnyxvJqP5XPVjEpuoRLSAJ/wRrDQtCaliuEEtaQyX5DQg6WVlnC?=
 =?iso-8859-1?Q?80zAtNtu0CzLQUycuSqIs7vPg5K3QW86U1mBv95uJGCcRNCn53pHq/nE3x?=
 =?iso-8859-1?Q?GJpDEJSOQ6m6+41gJnfTJLN0ccVyiIiKOI0tGpDMP3vKSQSs5BgNnvQ7CF?=
 =?iso-8859-1?Q?BlGlwsdc66qAcdF1VrxtsTkacJ3Vmx2OSF9xL87A1uYBcg+8DzmgRn5liU?=
 =?iso-8859-1?Q?X9YsovkSN/Qu45uqdvApRnYRjVqu4ZZE5wuvCQI02Ix4MPIIOH6a5n3qUL?=
 =?iso-8859-1?Q?WAJ1mtdsY4+eGeKptJQ3bnQ/w/wi3w92P+3f91iCzdaXYhLQ8DRzcaWk87?=
 =?iso-8859-1?Q?277TixdLeUruxY9ZvaVn7k9iI+6ycdyFiMiZQhtASYRxz4syY8vSHovvZH?=
 =?iso-8859-1?Q?q+i4NK5kcEU//OlWNuupzjOgJ8eqEEYwV9AUDWm+UeGDjYstc8iSIht6/w?=
 =?iso-8859-1?Q?WUz1U0GKMGP8L2htgN/HADkzsui1+SI7OWSdDCUxLmoutTR3yQlIW0Iw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef880bbe-927d-4177-036d-08dcbc24566b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 05:45:43.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oMyye2NV3wv39+Kn0EvhW8EeurUWQkvrdj+/lO2x0lCw3xi9wSNH4pqHCARenuNsl1e9WCPiJuGW6tKLabqqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5921
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

On Thu, Jul 25, 2024 at 02:50:54PM +0000, Matthew Brost wrote:
> On Thu, Jul 25, 2024 at 09:42:08AM +0200, Christian König wrote:
> > Am 25.07.24 um 01:44 schrieb Matthew Brost:
> > > Only start in drm_sched_job_begin on first job being added to the
> > > pending list as if pending list non-empty the TDR has already been
> > > started. It is problematic to restart the TDR as it will extend TDR
> > > period for an already running job, potentially leading to dma-fence
> > > signaling for a very long period of with continous stream of jobs.
> > 
> > Mhm, that should be unnecessary. drm_sched_start_timeout() should only start
> > the timeout, but never re-start it.
> > 
> 
> That function checks the pending list for not empty, so it indeed starts
> it. Which is the correct behavior for some of the callers, e.g.
> drm_sched_tdr_queue_imm, drm_sched_get_finished_job
> 
> IMO best to fix this here.
> 
> Also FWIW on Xe I wrote a test which submitted a new ending spinner,
> then submitted a job every second on the same queue in a loop and
> observed the spinner not get canceled for a long time. After this patch,
> the spinner correctly timed out after 5 second (our default TDR period).
> 
> Matt

Ping Christian. Any response to above?

Pretty clear problem, would like to resolve.

Matt

> 
> > Could be that this isn't working properly.
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 7e90c9f95611..feeeb9dbeb86 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -540,7 +540,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
> > >   	spin_lock(&sched->job_list_lock);
> > >   	list_add_tail(&s_job->list, &sched->pending_list);
> > > -	drm_sched_start_timeout(sched);
> > > +	if (list_is_singular(&sched->pending_list))
> > > +		drm_sched_start_timeout(sched);
> > >   	spin_unlock(&sched->job_list_lock);
> > >   }
> > 
