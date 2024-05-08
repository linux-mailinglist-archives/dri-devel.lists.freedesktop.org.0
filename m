Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE88BFD80
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 14:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819D10FBDF;
	Wed,  8 May 2024 12:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aulbh4TZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFEC10FBDF;
 Wed,  8 May 2024 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172291; x=1746708291;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mStDaOIBof6nkvfJTTA2WakkMXbsyPNsLLecUQ0edXU=;
 b=Aulbh4TZaVz1AYRUbBEbqTJUZOm/M0F2IOMssAtmQm5qrQngwEMSxJQ3
 idogc2coYi5vi1tH6rxoL30t+uv0q4usGtZTXlSsGz0qiXLWlCdQTAI3w
 gfl/KhG0YDnqwAc7+w7nlPiE+fbsNKRBCsmfgo9SHqauw35K1QPJuM4kp
 knhXk0k9Xk2KN3yq8sIE7FutBqq18wm1c7ECp1xvxKmkiYEDYlN1isabF
 u4lEXl86TD2pSRu/NpAepFbguKKKZ0ZHoge7toMvbgNXt3c9mEgvBoY4e
 QT/I6/GFiYw/SBGT4a/uplIKnZB8MyTktgzkbuS0WZmUYxqsWZzbFxbHA g==;
X-CSE-ConnectionGUID: Z3y92lglRtG6eSJqsAF54w==
X-CSE-MsgGUID: anh0fsYWQD6gmnQy9i05eQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22420050"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22420050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:44:51 -0700
X-CSE-ConnectionGUID: CixpyuwIRZKz7FKbXKaQfw==
X-CSE-MsgGUID: VZz1qQgqQ0OmIOV63CAxxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33420174"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 05:44:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 05:44:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 05:44:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 05:44:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeZXJ/0gH0Ne0SuVpWM3r8KZwu4ShJkKH7dFdOacUK+sGCtcTbWy8b6DiSXw+RXZzf1/Nh2vb9kT4bCAtfXmM8kHBJBsqrF1LNTykL62cTjD6bJUGZFpZc69HyrVnptxQUDAye5/71EJa0ugew35UGwiuoYAcwabdvAd3UCRDJP8OQcnKg4SNoNW+9JCgoG/sENR7WvNy3sVTPB51dbSnCtdng+hreeG7lvg+3fXjy3tnvFEaNG7ga/mutF04vyP0AWrv6kLEIH1MUaRqZaVUbSad+GLGqkPesO8CRRc8Z4YVrHMhdrUp90lDnhVOxY46iEGx8KMF3Z+sEVE+jDUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+qG+RllsEBWZN6kq3oOZ9FokjgUjbAjADpexJZkXnc=;
 b=FiYxRs0b0ABgdwRY/DPh6nJ18gTM9BqME38EH8YpdyZz5MoS7pTQh3XfUJtdHFry1C3q3ZTlAi0DRmacwOwONW1G1nXePuLIWzMhb/w0ui6l2vA0URsQsPguNWB7M2kvteWJXYMORBzRz24mHa6OCUC0kv3hJiRVe0y3KY8JCTdiRHQUjrYoEFGVwsaKnaAT8oWSnYLkc/Tt3B9WA7t/kPB0lA/Iw9tk1C/jcUR3YeFW8tKJxo8ljXShfC4IDMJ2cDnSD5WgMJqL0eF9/Lv9pdn5CeoX2jgonOn+3lHaxm1dlIrrnboyOh3LinUTlbadj3EXLsIv+xM0G8bYRuyNig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 12:44:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:44:48 +0000
Date: Wed, 8 May 2024 07:44:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 5/6] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <jouuhqg7lqahzjs33g3ru5vstitfkdvzuxujloukrqpufvn5oj@dnpcyzsnfqvx>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
 <20240507224510.442971-6-lucas.demarchi@intel.com>
 <2e7c4f62-a539-4985-8bd7-2f6d6030e6dd@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2e7c4f62-a539-4985-8bd7-2f6d6030e6dd@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: f14a3d5e-d38c-4fb1-443c-08dc6f5ca5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QMpTSaH2oDrWFZB6+bMbKbg87cLhHc9zbZV2VPOqR1fR3ukCkJcg5Jz+IyIM?=
 =?us-ascii?Q?DJ7MjatH+St3avfgrK2bjVdpFyPUjEhI18E2a1SyoY7U2RJ8QRSRTuxlOH/4?=
 =?us-ascii?Q?KNBOSMwN3AZmcCpBHuofvjYq/Rg4U+jz3WA59PmfFOdfwXvk5LGEgSAKMS2t?=
 =?us-ascii?Q?tauK1hzgxzZlxzPDib5S+tRBcKFvCNiZKs+Bf6zGvI/jxRqr5EEYFp1L15mz?=
 =?us-ascii?Q?n9xyfVx4U+9e+/wFF4AzZTpoQhSuI+sh91RWA5lfnwAAYwAJ5kw/NhRS3a50?=
 =?us-ascii?Q?CF13RT8XQq4wBa/Cn7eXx2rqzm6q2Arceyjgy23Wh8SEcNEQmwDbyVd9i9X5?=
 =?us-ascii?Q?yy9w88Iw2RQIiS2tjOA8uRuGG5XdNwMwjh9T90OVnizpMS7Gbz8wmvQRpXue?=
 =?us-ascii?Q?2j2Dp+7QMMNJ2lDZxTIsVWX7W8F963BeiNFAotyxLZdUgsJSwwjqwqCA7R4x?=
 =?us-ascii?Q?6GVhl6GEfFYx9RpS/ALp2wue4WA9HDO/BhG4wcq72zQ4uuK/S9Fxv8l0QJNW?=
 =?us-ascii?Q?GVJol9XWnAnyPKFOBLf9nbazBGCpMuDYTmTwFyEZ7DxfwV5C//k1hVwP4Txr?=
 =?us-ascii?Q?4Yac9Ge0LWfgmsAa23ML0vSuwR5TEZTwiaa7TuVs5ND9iKYfjABvUyrludHe?=
 =?us-ascii?Q?D2YAAH1vV9n/TsVTXL5BBeVEhZeZ43Li550YKlRxBGkVzM/GAwFx4UDAG3Up?=
 =?us-ascii?Q?Vh1reyv3EvMaPvNwaVeK91USM/gbG2y/ii6hbhn+ikk9nkVrAzrbjZLcWhKr?=
 =?us-ascii?Q?ppolDXIupUvzaksWuLfr8gXnNnP0vjOgPxs6yxcFFDjGObUv+OZ97ptmUtpu?=
 =?us-ascii?Q?HVFfCMZNlu60eN8hjvtaeiIYoroT7a8JXNQ6yZNsSrZgyO4KR/81pXht5I+v?=
 =?us-ascii?Q?UAYUdZrNmacPEJRdJN/5BqCgZ2ldT+jrLMIYg1hWpD4/8c3/5Q2HSCyFyUUg?=
 =?us-ascii?Q?Ij5xMfWDkzLWEddegMd6NVsO/nicCYSS+gjXjULbaPWs9pLFo9SufBArG8iL?=
 =?us-ascii?Q?RIToxxqVWb4MqcYlB0cTETJnItX7xkSz+L8e9NSYGomr35ZQ6jMon30ESFqg?=
 =?us-ascii?Q?wrwoLtYskpfrZrjYF28vo+njSRYXQINCclezIlEvUoPFyRMttM9u4RIYXhLb?=
 =?us-ascii?Q?rAMSSvQLjw1vFG/7K8QrTq+w8xLM9f4FUsiy54az00HKpJaicHjyaAhD3rmY?=
 =?us-ascii?Q?PP0euPk4F5EMhFhm10nS9mfsAVL+++STmOITgFy89q6EdOiThG9Z9VBLtYld?=
 =?us-ascii?Q?9ful2Lr7JZYElKNnob/xWA58RyrXaTd5lIY9P9bScoFZ006baLXHO/jJ+WS/?=
 =?us-ascii?Q?buE93sR7mgjB2n1VYPyo/dnWmyNk6nMil5uKSvzFoEByHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IjnToOjwucFBK5s4FuUXs+oLwCVAoLWHtbjDQSBBQKmtzIDHPpE1VUMHwmS3?=
 =?us-ascii?Q?mDGitl6I7u1QDyP19219qKh/6hr5hDMmubJXuKaht/04dBqo8uAhm+8QOcdl?=
 =?us-ascii?Q?PvGQ4/ErfzpFdaMt4hd8orMUimrbMvhozickBOc++vZ3Dawoi3lhsKbbaJig?=
 =?us-ascii?Q?buM6CAkGXCUHsARnwEwZn6z8TSvydj2f1MQOr3XMUN4Ag7X+uVko2UdmXcOy?=
 =?us-ascii?Q?zuD4aAhQx6jlXTs49w1uatOco9SICrRT8N0/erjMnoKxT6uX66oFnC5CX0jz?=
 =?us-ascii?Q?5z6qCkZnibGfAU7FCT6tQalRbb4Zt3btoIHxqb4PeWUWMOi+7oevUO07OXKF?=
 =?us-ascii?Q?kW+ReQ30Y0OmA/wdAma9U+C8g9C/kVR91SR1Fd1+jpq4FDfHRpfLNoymjK9j?=
 =?us-ascii?Q?Z0IGLOt8O1fUbto2keirnkESBTtwAk3Phw1VexYDsXxsA4UpaGtFIeI/aiN4?=
 =?us-ascii?Q?+KzeaN2KQuAL7F2QtoLXdns/9nIAPmcpIoIQf81pUIaoo65T47dDJHZPTZEB?=
 =?us-ascii?Q?HNI3FT1qq34UwhdaZAXXc3NK2LJR058mrZuPvXnpopooCxRpoM1lBvmIOFTT?=
 =?us-ascii?Q?ylZs1x/NGPOua0naHT+P0nYLLxa8N104p/duIeFmGYfG+5sdQU+syzNOIQRE?=
 =?us-ascii?Q?i3mNtntmjNay/RbYHrhevfRQRrrqoJomXoGVcbsGMOvTVTrFIsKvg+EhhEMx?=
 =?us-ascii?Q?Bt6vFCq14+bXbizy/b8EHnmD+F7kedVGWpY5UKRjE96TyK6AlkC8mVcTNjAz?=
 =?us-ascii?Q?sUIZ0aRNSbV46BKQJcOY4TIJGC36M36gYFHe3+VFyzgZti3SN7ON+xCys5Aq?=
 =?us-ascii?Q?2kyFLIfuHG+eSqWJ+5CABbE6G+tzfJ6BFp/Vyx04d8Ar2w1th+c/VKgYEMiq?=
 =?us-ascii?Q?FB5Vkdk4aABsiul8dXrKL1qBYH71lO8QdyTxwctZamXTgRcwaLoSrWH9HCF+?=
 =?us-ascii?Q?wzOZb0C8atUBdjr/QjmaJd5NscnhnuCNT4Nwe2jKcldbSTcNND17tPVQB/T+?=
 =?us-ascii?Q?M2b2HR4MwTaW3lkeDDYYnvDFABe3AZpI3bEtlOBau0h9ChKciIZhRv+7KdPv?=
 =?us-ascii?Q?DT0Ss0onowjL7WYzEHu41xH8UQRSShcHafAZC3Qy8e6G9x4l5F+eosMM5Gve?=
 =?us-ascii?Q?nRBzRIYmcF6TjTkz5yxZm5kMDsyB+n+0pLX7nVVesFBn1pmafdFgYwB9+GdZ?=
 =?us-ascii?Q?NNZ4MFvy2S75yFYqe2PQC47WWiioqSN0zohRkkPXPIIPt3R1YJ76fjW3EOU+?=
 =?us-ascii?Q?uYeVTEccs0Pp/twdBqibT7103zyHRoaSdld2Cpo3x4jXZlnScK9LogJIcCuC?=
 =?us-ascii?Q?ZchNfAGc7vqyKY+JtzFCcDwXvpdmfBZl4QbkGclZPK77uR/MHPp6YKz6S62/?=
 =?us-ascii?Q?OyBaPd4gpzy6ur1Zr5IU5S4XtrvyBygb2HKCffvZAj5SsxmFtJTWTQN4mLRf?=
 =?us-ascii?Q?FruSpIKXug3x5/RugCdW1hewJoeY3YmyY7eLz4+sDBs2+2dU4z+oKkWD3DF8?=
 =?us-ascii?Q?MABk1lsUK7Q1GfCDj1AlRAgHASrvnO7iKmHo91KvMK/aWRVN0VlGE4CsA5Ed?=
 =?us-ascii?Q?kZbztjezxEpzMeILUWmLzz4Xii2bhVQwJzcisR1jFusIAGk4WzfVTbs0vpo7?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14a3d5e-d38c-4fb1-443c-08dc6f5ca5a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:44:48.8241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0ocKWb+e5AS4V472beO3fjNR9KG6XNi74oNFN2DKdyI2/suqoICvYRY11pKiU1mRg9JVJ01yCT1lysMwj33ChQjCDbQOMlfhYe+miCK5JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
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

On Wed, May 08, 2024 at 09:34:59AM GMT, Tvrtko Ursulin wrote:
>
>On 07/05/2024 23:45, Lucas De Marchi wrote:
>>From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>Add a helper to accumulate per-client runtime of all its
>>exec queues. This is called every time a sched job is finished.
>>
>>v2:
>>   - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>>     runtime when job is finished since xe_sched_job_completed() is not a
>>     notification that job finished.
>>   - Stop trying to update runtime from xe_exec_queue_fini() - that is
>>     redundant and may happen after xef is closed, leading to a
>>     use-after-free
>>   - Do not special case the first timestamp read: the default LRC sets
>>     CTX_TIMESTAMP to zero, so even the first sample should be a valid
>>     one.
>>   - Handle the parallel submission case by multiplying the runtime by
>>     width.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_device_types.h |  9 +++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 35 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>  drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>>  5 files changed, 48 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>index 906b98fb973b..de078bdf0ab9 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -560,6 +560,15 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>+	/**
>>+	 * @runtime: hw engine class runtime in ticks for this drm client
>>+	 *
>>+	 * Only stats from xe_exec_queue->lrc[0] are accumulated. For multi-lrc
>>+	 * case, since all jobs run in parallel on the engines, only the stats
>>+	 * from lrc[0] are sufficient.
>>+	 */
>>+	u64 runtime[XE_ENGINE_CLASS_MAX];
>>+
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>>  };
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>index 395de93579fa..86eb22e22c95 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>@@ -769,6 +769,41 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  		q->lrc[0].fence_ctx.next_seqno - 1;
>>  }
>>+/**
>>+ * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>>+ * @q: The exec queue
>>+ *
>>+ * Update the timestamp saved by HW for this exec queue and save runtime
>>+ * calculated by using the delta from last update. On multi-lrc case, only the
>>+ * first is considered.
>>+ */
>>+void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>>+{
>>+	struct xe_file *xef;
>>+	struct xe_lrc *lrc;
>>+	u32 old_ts, new_ts;
>>+
>>+	/*
>>+	 * Jobs that are run during driver load may use an exec_queue, but are
>>+	 * not associated with a user xe file, so avoid accumulating busyness
>>+	 * for kernel specific work.
>>+	 */
>>+	if (!q->vm || !q->vm->xef)
>>+		return;
>>+
>>+	xef = q->vm->xef;
>>+
>>+	/*
>>+	 * Only sample the first LRC. For parallel submission, all of them are
>>+	 * scheduled together and we compensate that below by multiplying by
>>+	 * width
>>+	 */
>>+	lrc = &q->lrc[0];
>>+
>>+	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>>+	xef->runtime[q->class] += (new_ts - old_ts) * q->width;
>
>I think in theory this could be introducing a systematic error 
>depending on how firmware handles things and tick resolution. Or even 
>regardless of the firmware, if the timestamps are saved on context 
>exit by the GPU hw itself and parallel contexts do not exit 100% 
>aligned. Undershoot would be I think fine, but systematic overshoot 
>under constant 100% parallel load from mutlitple client could 
>constantly show >100% class utilisation. Probably not a concern in 
>practice but worthy a comment?

Ok... just extend the comment above? I could have looped through the
LRCs to read the timestamp, but I didn't like reading them in slightly
different times, which could give slight different results if they are
in a running state.  This way here it doesn't have this problem at the
expense of "we have to trust the hw/firmware". We can switch to the loop
eventually if our level of trust decreases after getting more data/test :)

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>+}
>>+
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>>  {
>>  	struct xe_exec_queue *eq = q, *next;
>>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>>index 48f6da53a292..e0f07d28ee1a 100644
>>--- a/drivers/gpu/drm/xe/xe_exec_queue.h
>>+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>>@@ -75,5 +75,6 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
>>  					       struct xe_vm *vm);
>>  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>>  				  struct dma_fence *fence);
>>+void xe_exec_queue_update_runtime(struct xe_exec_queue *q);
>>  #endif
>>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>>index dece2785933c..a316431025c7 100644
>>--- a/drivers/gpu/drm/xe/xe_execlist.c
>>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>>@@ -307,6 +307,7 @@ static void execlist_job_free(struct drm_sched_job *drm_job)
>>  {
>>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>+	xe_exec_queue_update_runtime(job->q);
>>  	xe_sched_job_put(job);
>>  }
>>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>index d274a139010b..e0ebfe83dfe8 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>@@ -749,6 +749,8 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>  {
>>  	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>+	xe_exec_queue_update_runtime(job->q);
>>+
>>  	trace_xe_sched_job_free(job);
>>  	xe_sched_job_put(job);
>>  }
