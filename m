Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5C7321C8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 23:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9109E10E54C;
	Thu, 15 Jun 2023 21:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB62410E54C;
 Thu, 15 Jun 2023 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686865019; x=1718401019;
 h=message-id:date:subject:to:references:from:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6cw6r4iS8ZK4iOPugjJrXuDZspH4IaAE82PwawdOar0=;
 b=FHEJN9dSnsT6CGp/M1Yb1kydbwp+TnGYTusAeRYN4z2Lv8/NVsNCSksa
 bUiD5oI6SYHTA2Vd0uAPlKKtMOYDLvAFhn6tPZPAsyKnDZq3DtJo17y9W
 XosnOPTzj9MXKfg2uuUBhDRmMe9iJArsjKe5izYfMDkU0XULAFufzA/oJ
 GA4CdMZsOVEt+PQN5cmOOJg4YdvYZ2NmxCM7p4MizD0pvYBGI+F3PClkx
 FwaAw7DBNOUPIiFMpdgqZ3tgMZkZHfiW19HVHXXV3b7rQksg5PXqx39TO
 V/9sVi7Hevr+kC2wWRCZ77Wbb30/UdsXFp/Zi0vl8nsGDqdIiPSIS+qEQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343787296"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="343787296"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 14:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="715759524"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="715759524"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 15 Jun 2023 14:36:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 14:36:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 14:36:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 14:36:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpFPri1kD6zdAnwL61sRDwaucS3wozJj0btTWIak/0Xg4Pm1hrA3tec43OqHO0SBxJ4kpAGbSV7O/UShN+l5QJAqNd7zwhKQzhOas42hrW2fMHC1Imw/GFo4xc0s4jeo0xa/Gt/wc0YSvIsj4vL/391IcVc1cETptgbWt6t2N+oqu/OqsBmjj2UXuywUn7Q8MJOzvxmKqq63AHsrO0C4MwgjPFVj5/bJ7Xo2viHpOSqBYU3ZLat1fQu/gJjwLVuCtV5X8d54yuLuAfwoklZm76FVyCQB63YXftq9WbxsQKsScFaNw0J2GQB/mAq5/Egx8z/jI6EHFya2UIOFNU4LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqshtpi5hVBI/3sdRhZA7t7LLfDDezpObpdkgdyJu9o=;
 b=WfVTzzC7t3zrOMdaupHnRwn7A5CtUcz+6B961SmwGA4XWh0PzrbxPZrBGDGeW9L/2Ch8yyLHYFHkiwY1Q3pmuw7//RgrmCutQQCHF2dhnIjyJrwuan5wB9fpAMdOVvveJiVQGRjlDY6h0+KK+iwq8RIUjd0nonZc6/mpj1FEfeHjZAcmIb0nYmM9NYvWLY3m7VxhTlbGXMqMt3H55DrebehCqnu0YqCQB7/GZL0yQNfH3jsSYAVchuhmY9OoyOoiUSa5XKpzpe5rlnpjwsp9sdSvliSq2tmKYbl3c8v7omF5lojK91GOaMUCYyek9xIcVzNklc1Ppp6vTPzqyJneYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 21:36:55 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571%4]) with mapi id 15.20.6455.037; Thu, 15 Jun 2023
 21:36:55 +0000
Message-ID: <4499c63d-5635-8fea-fffa-74bee92bc1d0@intel.com>
Date: Thu, 15 Jun 2023 17:36:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20230615211542.963700-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20230615211542.963700-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0104.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::45) To SN6PR11MB2622.namprd11.prod.outlook.com
 (2603:10b6:805:57::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2622:EE_|SA2PR11MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: bee6e798-b1cc-4f7e-ffa8-08db6de8a33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWBqqg7aUVIsSab9RfA9HnD+sbAqeeLBFF4Yp3j8b5TgJkVs2l8v7hbd97SO9mCQEON44Xq0qpN199lG4uykniflOm0ltLtHOvOZbqYtnw6Oh1ijyX49FT/mjlzeU/FisdrDbYAF5m8VMW53x2ykQw0azY5UFxEpWIXzQv/GqZ1HHxpSiqXgBxfEKOKfxl1nBW+wyBYKrIuh7ZcZfeFihgZRdv4BbnpFbG4tOg/4SpYah+7LzFtAQaFt3+4vIbeLQzzU5Gag7xCR1oRyQsBH9ssJQyonDdeB5K4ZIsC4rUlWlhJDBI8FA6DIrnt9MtUtKk4P9ooz2AWiLp5b1ScsLvtHZi3tZxz1D0WL+C1qBMacxX3AN4rak9cjCNYwc5BN6u8xkD8szkt/1Dg6NomunS2Uhqifm+x+BeuQ3NZ6DzA4/tFDxQme2Gi+TwGvtodwrSEE7NN0c6DXjzbzqA7JJMsLVL9eDMIZgscRP4KFcpXdF4zZBNVlZRwBZrXEioyyQKrU/0F/icALm9Sm1Hew2tam4j5MX1EIcBjnEZunvG9k/wOS56c3vr50nirrCX2vwTmEHV7toVVgdPfCHmACGyhDPjm1WBcpITwS+/L8EatyRykNVZSwVYpOgNJfVi9pcKBOGuxLtB0zkYCLZxY/7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199021)(5660300002)(82960400001)(38100700002)(2616005)(83380400001)(6506007)(2906002)(186003)(53546011)(26005)(6512007)(478600001)(66556008)(66946007)(66476007)(316002)(6666004)(8936002)(6486002)(8676002)(41300700001)(86362001)(31696002)(36756003)(4326008)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3JwVUZZc2lTZkNISWdBWW5JQnRnWmE2bGEvV25qa1FNNW5TUVZ4STNNOHhz?=
 =?utf-8?B?N282c29QYzRWYXdhT215amRQdXZHeVZFV3k2SjdhZndtQ1hwdHZuaDRMbXVT?=
 =?utf-8?B?VU91TjJxRm9QNCtFNHVzZ3o4SVFzelJpbHh2QmhueTBUb3VKY3M2Q05uZjNJ?=
 =?utf-8?B?K3VVYTZjS2ZHd3NGdjV6UGZhU0k1eVY3NDNsc25IN2dSc2l1di9aalhkWUgy?=
 =?utf-8?B?VmZDb09UaU9OMUl5L0hoemxKS2c0aGFkMjVkMGRrMVFMRTZWVENaU3cxZ2k1?=
 =?utf-8?B?WThRdFVxUE41WE9xdUdyczUwcEszMjJCZmIvZzZGVG1PUWZhTWtqOG9DaFdn?=
 =?utf-8?B?WGdMZUNtN3c4NGc2d001cGFvUVVFdndnVU51cEVQN0UxREZwNGd0SXRZZm5G?=
 =?utf-8?B?ZFptd0t4c1k1YmRNYi9ucldhRTR6Sjk0MDRmWW9OTkRrdUZMSkJBaWI2N0lq?=
 =?utf-8?B?NTNDOEtMajdKMTBXcnFiYjVibEVhUDZ3aXZ0bWdteWhaWmUrRjNpTWE1d213?=
 =?utf-8?B?NlpZaGNrRlNiRlg2Rk01ZktvNGZXSGxIcGNma3pZOUx3VnE3bitOU3I1Ny9r?=
 =?utf-8?B?dTUrRTFaRmFWTzlRVmJ5UDljUGZtREU3NTRGbHMvbmZwNm5QdlBlV0x4VFMx?=
 =?utf-8?B?WHhscHpFOU5ZUWdGemZqSmNTbVVkc0ZGdGdFdlFERWYvNzNFSENaNlg4TTZ0?=
 =?utf-8?B?dnlNTGkzenlHTjBrTHFSRWYxZVZ3WWNGaGdYZjVNRWx1M0RKUTBVWmY1dFFl?=
 =?utf-8?B?bWROeFROaW0veFZJb3U2ejVydUZNZlowWlVnK2p4MFpNRWRjZmx2MjFTMHdP?=
 =?utf-8?B?di95bTh5anNSdTBKc1JDNWFXTFprcVQ5ZzZSRlBlWHhBVVRTc1M2WGFRbEpr?=
 =?utf-8?B?djgzVlR6L2pEanZ2cVRqcHgxUm9jMTE1b1NtV0Z1ellORWNGR3RORXhMU3Ro?=
 =?utf-8?B?ZWlFb3pSSCsxN1oyRTdsVHA4bGZ6VElzWHptRzVkcjQwelFCczRITXMxSkpB?=
 =?utf-8?B?eW9LaWZ2d1BRN1p2S1JTaFNQVTg0T3FONXhTMkFGRU02UHEyeDhmYnFSczlK?=
 =?utf-8?B?d1h0NDgzbnY1bFdYd1FpY1U1MmNvdm9MeFI4OFdRVXdNZzJNQ3ZKQlhKQ3d3?=
 =?utf-8?B?RVI0WlcySXE0Zm1xbmUwKzhaU2IrMUllWXVmQnRyRDVCeTJxbFdmYnE2NjVO?=
 =?utf-8?B?K1AwVnlGTFJDVDVxMTlTSUVsVFZWdzRONHNtZHBnbG84NzVwbUJhNTdKY0xJ?=
 =?utf-8?B?WHJzQXVrcEJPS0Q3L0hlZHk5WHRSSjliSnhuazlaNm9mY0dTdzdIUXB0RUxF?=
 =?utf-8?B?aE9NSmJrU3ZWa3VBeVd5V0YzMDRheGhKV3NzaXBRMTk4TmpSVVNQTzcvU2pW?=
 =?utf-8?B?T1JWNDVaeC8wcGVGcjhCNjByUkhsekY5WHNPWWdyallJU2pJcE9uYWlBKzBK?=
 =?utf-8?B?REQ3TkNuSDcrUkp4WG9ZMXlCZktUMDEycGhZMnJpbFMycXdTN0lseDYyenVM?=
 =?utf-8?B?VWxyZE4xZjhkTjBpejBpLzVlaEFCMUVXQUJKdDlxRmU3ZjZoTXc1ZEdSeFVX?=
 =?utf-8?B?UHRPUmxCek1jTkk5TXFESFdPTjA1UjU1cE1mUlltZWQ3M0h0bk42RlF5VnRz?=
 =?utf-8?B?QjhSNXNOL0tQMUJjSklPOE1LdUV3dW1aWnRpMGN5aVAzYndaSFZ3MytQWEpi?=
 =?utf-8?B?UjBETWtubzBFbGwzTDRDSUVjK3FzZ0pTUTl3U01NYms0b2lVeE92NGEzRTJn?=
 =?utf-8?B?aytidHBNeWhIUU4zUjNLWGpmNGpWajJQOHNLd3NSTjVxeTBTZmFqMHlKTWJQ?=
 =?utf-8?B?b3NjTmM3Y1RRaXBzN1YxZHUrQWI4anFoVTFYcW1KRWJ5NEN6clJzd3paMDlM?=
 =?utf-8?B?LytCU0Frb0VaM09EdmVycVpnSVZpUzFEdjdvT01LRkNUTnVteHRxQVpWaWIz?=
 =?utf-8?B?K0EvUW1YUmo1eHAvWGVyOVB3QzZLOVZiSDNycGppOFBZRUc0ZXJDTkZzTG1J?=
 =?utf-8?B?VTRuY3IvcUN2WWw3VWxpc3VDZXlacVZBbjQ2VHVkSFVLNldwQXFZdldKV2pq?=
 =?utf-8?B?OHdiemJFK29lQlRFWTF3U2U1Vjk5dndUVDFFWGlDdVpJcjd0OWpsRWhGbmFO?=
 =?utf-8?Q?iOCFXN2yHPUhibi99boZVA14e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bee6e798-b1cc-4f7e-ffa8-08db6de8a33c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 21:36:54.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axaybFjgu6WYjxGfivnecc9x0vHX7lmNN2jV/uErXCKuTHZzq7cVVkLh9Qty8yfna8ea8jUOYmtxKC39AM8Umw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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
Cc: daniele.ceraolospurio@intel.com, umesh.nerlige.ramappa@intel.com,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V3 is to follow John's suggestion option 1. The better option is in 
discussion and might have boarder impact.

Meanwhile we can start with option 1, check CI system report and see if 
issue getting better.


Regards,

Zhanjun Dong

On 2023-06-15 5:15 p.m., Zhanjun Dong wrote:
> This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
> Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.
>
> WARNING: possible circular locking dependency detected
> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
> ------------------------------------------------------
> kms_pipe_crc_ba/6415 is trying to acquire lock:
> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
>
> but task is already holding lock:
> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>
> which lock already depends on the new lock.
>
> the existing dependency chain (in reverse order) is:
>
> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>          lock_acquire+0xd8/0x2d0
>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>          intel_gt_init_reset+0x65/0x80 [i915]
>          intel_gt_common_init_early+0xe1/0x170 [i915]
>          intel_root_gt_init_early+0x48/0x60 [i915]
>          i915_driver_probe+0x671/0xcb0 [i915]
>          i915_pci_probe+0xdc/0x210 [i915]
>          pci_device_probe+0x95/0x120
>          really_probe+0x164/0x3c0
>          __driver_probe_device+0x73/0x160
>          driver_probe_device+0x19/0xa0
>          __driver_attach+0xb6/0x180
>          bus_for_each_dev+0x77/0xd0
>          bus_add_driver+0x114/0x210
>          driver_register+0x5b/0x110
>          __pfx_vgem_open+0x3/0x10 [vgem]
>          do_one_initcall+0x57/0x270
>          do_init_module+0x5f/0x220
>          load_module+0x1ca4/0x1f00
>          __do_sys_finit_module+0xb4/0x130
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> -> #2 (fs_reclaim){+.+.}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          fs_reclaim_acquire+0xac/0xe0
>          kmem_cache_alloc+0x32/0x260
>          i915_vma_instance+0xb2/0xc60 [i915]
>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>          vm_fault_gtt+0x22d/0xf60 [i915]
>          __do_fault+0x2f/0x1d0
>          do_pte_missing+0x4a/0xd20
>          __handle_mm_fault+0x5b0/0x790
>          handle_mm_fault+0xa2/0x230
>          do_user_addr_fault+0x3ea/0xa10
>          exc_page_fault+0x68/0x1a0
>          asm_exc_page_fault+0x26/0x30
>
> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>          lock_acquire+0xd8/0x2d0
>          _intel_gt_reset_lock+0x57/0x330 [i915]
>          guc_timestamp_ping+0x35/0x130 [i915]
>          process_one_work+0x250/0x510
>          worker_thread+0x4f/0x3a0
>          kthread+0xff/0x130
>          ret_from_fork+0x29/0x50
>
> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>          check_prev_add+0x90/0xc60
>          __lock_acquire+0x1998/0x2590
>          lock_acquire+0xd8/0x2d0
>          __flush_work+0x74/0x530
>          __cancel_work_timer+0x14f/0x1f0
>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>          reset_prepare+0x21/0x60 [i915]
>          intel_gt_reset+0x1dd/0x470 [i915]
>          intel_gt_reset_global+0xfb/0x170 [i915]
>          intel_gt_handle_error+0x368/0x420 [i915]
>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>          i915_wedged_set+0x29/0x40 [i915]
>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>          full_proxy_write+0x52/0x80
>          vfs_write+0xc5/0x4f0
>          ksys_write+0x64/0xe0
>          do_syscall_64+0x3c/0x90
>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> other info that might help us debug this:
>   Chain exists of:
>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>    Possible unsafe locking scenario:
>          CPU0                    CPU1
>          ----                    ----
>     lock(&gt->reset.mutex);
>                                  lock(fs_reclaim);
>                                  lock(&gt->reset.mutex);
>     lock((work_completion)(&(&guc->timestamp.work)->work));
>
>   *** DEADLOCK ***
>   3 locks held by kms_pipe_crc_ba/6415:
>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>
> v2: Add sync flag to guc_cancel_busyness_worker to ensure reset path calls asynchronous cancel.
> v3: Add sync flag to intel_guc_submission_disable to ensure reset path calls asynchronous cancel.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 ++++++++++-------
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h   |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c           |  4 ++--
>   3 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..ef4300246ce1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1357,9 +1357,12 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>   	mod_delayed_work(system_highpri_wq, &guc->timestamp.work, guc->timestamp.ping_delay);
>   }
>   
> -static void guc_cancel_busyness_worker(struct intel_guc *guc)
> +static void guc_cancel_busyness_worker(struct intel_guc *guc, bool sync)
>   {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	if (sync)
> +		cancel_delayed_work_sync(&guc->timestamp.work);
> +	else
> +		cancel_delayed_work(&guc->timestamp.work);
>   }
>   
>   static void __reset_guc_busyness_stats(struct intel_guc *guc)
> @@ -1370,7 +1373,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
>   	unsigned long flags;
>   	ktime_t unused;
>   
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, false);
>   
>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>   
> @@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
>   
>   static void guc_fini_engine_stats(struct intel_guc *guc)
>   {
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, true);
>   }
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
> @@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>   	 * and causes an unclaimed register access warning. Cancel the worker
>   	 * synchronously here.
>   	 */
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, true);
>   
>   	/*
>   	 * Before parking, we should sample engine busyness stats if we need to.
> @@ -4501,9 +4504,9 @@ int intel_guc_submission_enable(struct intel_guc *guc)
>   }
>   
>   /* Note: By the time we're here, GuC may have already been reset */
> -void intel_guc_submission_disable(struct intel_guc *guc)
> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync)
>   {
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, sync);
>   
>   	/* Semaphore interrupt disable and route to host */
>   	guc_route_semaphores(guc, false);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index c57b29cdb1a6..a77de0d6ed58 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -16,7 +16,7 @@ struct intel_engine_cs;
>   void intel_guc_submission_init_early(struct intel_guc *guc);
>   int intel_guc_submission_init(struct intel_guc *guc);
>   int intel_guc_submission_enable(struct intel_guc *guc);
> -void intel_guc_submission_disable(struct intel_guc *guc);
> +void intel_guc_submission_disable(struct intel_guc *guc, bool sync);
>   void intel_guc_submission_fini(struct intel_guc *guc);
>   int intel_guc_preempt_work_create(struct intel_guc *guc);
>   void intel_guc_preempt_work_destroy(struct intel_guc *guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 18250fb64bd8..edf13f89830e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -566,7 +566,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>   	 * We've failed to load the firmware :(
>   	 */
>   err_submission:
> -	intel_guc_submission_disable(guc);
> +	intel_guc_submission_disable(guc, true);
>   err_log_capture:
>   	__uc_capture_load_err_log(uc);
>   err_rps:
> @@ -597,7 +597,7 @@ static void __uc_fini_hw(struct intel_uc *uc)
>   		return;
>   
>   	if (intel_uc_uses_guc_submission(uc))
> -		intel_guc_submission_disable(guc);
> +		intel_guc_submission_disable(guc, false);
>   
>   	__uc_sanitize(uc);
>   }
