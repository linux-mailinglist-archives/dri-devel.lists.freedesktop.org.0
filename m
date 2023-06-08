Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969E728A16
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4723889048;
	Thu,  8 Jun 2023 21:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B6389048;
 Thu,  8 Jun 2023 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686259048; x=1717795048;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rQJsHarNj91LMixFRm1rP3y9J3FPewtX4aslKj5hhWQ=;
 b=hes4CkK85O6vdUrDZSLhPaWh0kEiVIn8C2eYPd+29SzzG3pBjgnV/Ssz
 hOzYaAAnq9gZSM+dFyEaXQaXilCWCMna6+q+Whgkx66jDK1exO3thLy4x
 pPrWGydPXj0+gciI9yXmJ7Z0rVnVwRUj26sJ3DfJg4Gbw5M6ocjdOcmgm
 5F+Wlk8FQZvv20fhoaEfO/+NNnhUQJDjOY78vylGfoGPqmWZJlSmdam4K
 W5E0KPkMrEH0a7RA0o5XPo6tJugH6vL0Vh0CYN4e0mUHGnufIbZ9x68JL
 I0NA/6QprbWyV4CQrlwHboZuP+7fxV3PRQo2PUN0CObgSzTjVESb1C0rr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337073124"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="337073124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 14:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713252319"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="713252319"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 14:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 14:17:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 14:17:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 14:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpunCEbK/87etkda0s0m26UtDS/mMXUDPyY2D+mrwRou2iwY10Knusn0o2tVJyIuJFYq+krS7CIDmJ9hJjSCa6ooLHPja4psLZGmjhKEqPCVqoXpFGYzmCLx/Mj8knDCiZo7tVpfqTjfZrc8jm2w5P5kQyhPaNjs7aCOrkxHH3S1gy/Mch+f5x+CogFFIothg5xeYfDWMt+Tp5U2zFAxCiQo4mc601fcMZaVA9c6OlwsNSwUCqyXb9Ixmlzxsablc0hHQoiO2REkw+9mD9Wix1SDKfwbdE3sbAZyhiM9IiodPpdTt7q1sVsgidUMBZ5ERIgXIsr6hMZXpmJujIWarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68Efo/lcT6gFunlJpIZ7QtmPGce3g1pyeFedcwAz8As=;
 b=iiZNdisPIatUkpavUGfrua5G7DmMflt1CSO1OdZss/qc3hHqlMTsgSvWcqoguTOsLhReBmzGao3GJckow/IhSz2H/rQ+kqDMZT1NRyn8r5SBPONacU+jBoywJI2wypolE8f0p3/ubz2bkmFjVFKVeDR0qvwOAOI2vqofzv8tyielU4gJpOdfRRin4XdXx/EVl/gR7HmrP/nqxDs+MD89SwVBTF8EoynNjqxxbOoPWXF4CQcplA+nTmz6DyAy/c6rRIi6p3SynDlbz68qyLeV36UWEJ57P5VUvMb3zURJSz8XdLP7VVqr2bCT9BamCnuGeXtEvgq2xjQYJYgg+b3LoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2622.namprd11.prod.outlook.com (2603:10b6:805:57::31)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Thu, 8 Jun
 2023 21:17:27 +0000
Received: from SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571]) by SN6PR11MB2622.namprd11.prod.outlook.com
 ([fe80::91eb:a6da:c4ea:2571%4]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 21:17:26 +0000
Message-ID: <0ed926fe-9a9a-27d3-ff58-d388aa9ba981@intel.com>
Date: Thu, 8 Jun 2023 17:17:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230607190350.287644-1-zhanjun.dong@intel.com>
 <ZIEedejxx6DvpFgS@ashyti-mobl2.lan>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ZIEedejxx6DvpFgS@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To SN6PR11MB2622.namprd11.prod.outlook.com
 (2603:10b6:805:57::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2622:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 484a8c31-9149-4fd1-f32b-08db6865c252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfVmnj02MDJiVHNwPLN1rFZHlcxgjwJiDAYyIhQyyuP8oKn5mgiVCt/mBns66qAvIYRSB2dyGGowc3kdgrNJRJCkp/asAgyz/oJ4S7C46TqaQmITc3mcR7Q67QcRyLgfkpnpkPycC6f8LL6QZTgkcmVJKeduM0MwnPJ4cpFHhH0gUWV3Uw4frlVnHg7jkZTVq4equh7cczI2/kUmvxJLqWYeIxpG/qCkPK6/ZigKAdxIwJ4j4sC0qtdL164bBvqbaJ87HcSnW7b11GO0agKSSe9OaFyrv0923z/z8IEGVqkov6Yn785ZOfoHnE3zhX4jQ4hypeNkjSkdUKDLLBKZwCKPQSfm8EGzcvrYf8F1TEqJ2dHBtDaW9uuWkngbe30nPz60tPtAgEZHQXFbyRhAPQ/uLhiolV0P4RC4EBl4+eIsH3l4QuczgBBKgpTyr2TwLB9BtsOju2IZBNLCrtSgOwGxc63m9iOfDOWKe07iTPBzpx8P+1S1rOZ2BeEx7kQBWsufaNKLQ+7RJSGU373T4vA4F4nVyI/3TdMugv4x6wTd2bVdBWgPDJSD8gnwPGnQvf8aZsJQXblacmLbv2hEjp4bSA2bEO/LHv/lUY6Pjcsh9mSJdI0hyCIFZuM5FIr849k+ZM1GLthaJM3zTwi5ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2622.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(186003)(2616005)(31686004)(82960400001)(2906002)(8676002)(6666004)(6486002)(8936002)(478600001)(31696002)(66476007)(38100700002)(5660300002)(41300700001)(86362001)(66946007)(4326008)(66556008)(6916009)(26005)(53546011)(6506007)(316002)(36756003)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXUvSjc5ZlJ5bFh5b2pRWXgwTi8zUjR2YldVQ0Z1T3BscHliOXd6QU1KNnpo?=
 =?utf-8?B?UjIyNVlibnc4bEozZU56cVluME5jRTVRUUhyN2l0dTRKVE9QQUdUWWY5YzJs?=
 =?utf-8?B?S2VERjF2OTFMS1N3Y2xiM2xlSXo0RzE1dS83eWRxVDZaV1ZJY2FxTmw3OEs2?=
 =?utf-8?B?Y3h0TURpZi9BeEJTZEJzVHVHNVBCNFhwOGJKMHBIZnRQamtxeDZFTTZORitB?=
 =?utf-8?B?aGlnUHFDdVRraXd0ZEFpYnAxb2J0UStwT2IwZkpYcTFvS3IvUkxVU1hnMm90?=
 =?utf-8?B?K1hVNEIxL1dsaThQVGxuT1FEMG1CWG9SYk5ueWJlSWpHSFlkTXg2TnhESU4w?=
 =?utf-8?B?eUlDb2dESkdFcHhSc1ZXZnJPc2EzQnVjV0V4T2I1K21kbkJWL3hsSm1Rd1gy?=
 =?utf-8?B?U0VBbDliMS9LMEJrVWV6YWpUY09YVnJ6a1U0c0g5ZDdvenhjaG1NbCthVlhF?=
 =?utf-8?B?UWhhVG5VOGdCcStDelhPT2xQTFlLbUZDSmRTczViaXl0SGdFc0N2ZjdlZ2hH?=
 =?utf-8?B?MEpDNUc5VVJBT2RqbUZMUHZTakxxQ05OaHB0eithVVYvaktXQ0tDb1pZbE4x?=
 =?utf-8?B?blZvbUhNeCtmajJmei9WcHAvVDRuMEc1NUJBWHdCc0wrclVvWDIzbnJVMFBi?=
 =?utf-8?B?emZBaUlWdWxKWC9HUkhjRGg0RXU5Y0QxY0RvRTFwTXhKNDhubHZESFVqT0RP?=
 =?utf-8?B?MXdMYlA2OHFmcy9Sdy9jWFZDVnFWN1haY3RXYkdkbnUyQVdyTzlSWVl2NDBL?=
 =?utf-8?B?UzBabzlOU0JweXl3UEsvanBXMHVDQUtTY0hXRGppK3FzZklveW1IWFFHOGtX?=
 =?utf-8?B?bHBIZm8zZEt1TU1OcEZRMkIvYmpleHNlQ1ZMZ3YwZGRCbTNkNUhTUHdYdVNo?=
 =?utf-8?B?NzY4aVQ3UVlOYU5DbGRIeGRGOTJoNCtrVG5WOHJXMFdzQlNmNHNKZUZwWTlx?=
 =?utf-8?B?UG1jWDNUcUdteFU5SEdINW9ZOEZNS0dxL3hieUFYMDI3STgvQm8vWTl4NTV2?=
 =?utf-8?B?Z3NMUGpBcmpaQnhKSkxoMGhkdWZQRnJoU2Z6UXp3aXRGTFMyR3diWHZ5L1du?=
 =?utf-8?B?b3c0RllxcWRETk5nVEc4T05GbGxkSlFmNVZvV0hnMUpRMi9ZWm82NHNMdXVC?=
 =?utf-8?B?OUprZ1V1ekNTWVVMT1VhSlB3Zytuc0JodHowRWR4SG1YeTJOSTc4RjJETm9i?=
 =?utf-8?B?L05LcFg0L3d1T0x5ODQ4U3lqN0tYby8vRktRMzh3UEpsVU90WUpURXhzL2ZK?=
 =?utf-8?B?SDdkdExyKy9HTmh2QVlPUDBZRlBTV3R3RmRRZVhvZXVnUXdmNzJPTzBoMGEv?=
 =?utf-8?B?Z2xGYkMrTzZLaGNtaSt1QlM2azk2SXBYVGJENHB6OGpzU3FyMUNXSEI2bEVO?=
 =?utf-8?B?cUFFYTRiWjV1UVY3SkdEbXROdG1tSFVpVjdsYzNRb1M5cEVQV2NFanNpd0Jp?=
 =?utf-8?B?Ui8rZzJTYWhWdHlXT1UrUGJTdzV3ZHpIa3BCUEhsYXQ4cXNhNzJpZ2xZQ3kv?=
 =?utf-8?B?Nkl4Q0hRL0tRU1BOUjFmNDhZd0FtTE1vRVBYTlE5NFBudnlBOEN1bFZHcWVD?=
 =?utf-8?B?c3ExOU80VzFhekdPZ2pzbS9jQXZDUGhRZk5Na2xIbml5NlY3b2tFcUZFcWdp?=
 =?utf-8?B?UTdCZ2RUazFqMTlGc0tjVUgzZXVidW1zUEdFUHFUTWoxSXlheTJLWDdsTlVa?=
 =?utf-8?B?bmpyS2Y4WisvS3N6Um5VR0l6VDNidTVlaU9OZWJ2bytVRzdWbVN6QnRrUEMv?=
 =?utf-8?B?b1JFV2dLTXRWY2lTVDVHS2k4clBiRUkzSGNpSUtoOGRrV1B5Y211K0NyNTFW?=
 =?utf-8?B?V3haMCtaeHRBbGtHeURvZ1pXYnlqcXVoTUFBa2hjUWxiaW1FeEtIN2ErUUZj?=
 =?utf-8?B?akxEUjVMdUw4L2FFSDZaOEdZcm5zL2xrUFpMK2cxM0o4aFFIb09BWUpzOHQ1?=
 =?utf-8?B?MXNrSU1YcFZsODI4eDYrQk5Lc05uSUNuSGNVOGs2UllEWExhSytmbWwrR1kw?=
 =?utf-8?B?N1cxZFVrTWt3c3Jrb2t4SlhEQ0p3OGtqdEdxdk1jMlk2RGdoNzFoQkVnT296?=
 =?utf-8?B?cFhKZE5BTnJ3WTI5WFpnQmJGZC9sd1paVE45V251QVE2Z05xQTZnNllvQUtx?=
 =?utf-8?Q?+Cbf4AqXXu3+FT+1Ll9ro0oAd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 484a8c31-9149-4fd1-f32b-08db6865c252
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2622.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 21:17:26.6015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUIoimK1+cbJkGIzpG1/DoVZsU7jDsqbmF/o9wBHCELxgJSLSVPM3IloFVUUiPv5bMa/UwrmxKNNrinpGgHVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
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

Hi Andi,

Thanks for comments. Info would be updated on next revision, which is on 
the way.

Regards,

Zhanjun Dong

On 2023-06-07 8:19 p.m., Andi Shyti wrote:
> Hi Dong,
>
> On Wed, Jun 07, 2023 at 12:03:50PM -0700, Zhanjun Dong wrote:
>> This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
>> Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.
>>
>> WARNING: possible circular locking dependency detected
>> 6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
>> ------------------------------------------------------
>> kms_pipe_crc_ba/6415 is trying to acquire lock:
>> ffff88813e6cc640 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530
>>
>> but task is already holding lock:
>> ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #3 (&gt->reset.mutex){+.+.}-{3:3}:
>>          lock_acquire+0xd8/0x2d0
>>          i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
>>          intel_gt_init_reset+0x65/0x80 [i915]
>>          intel_gt_common_init_early+0xe1/0x170 [i915]
>>          intel_root_gt_init_early+0x48/0x60 [i915]
>>          i915_driver_probe+0x671/0xcb0 [i915]
>>          i915_pci_probe+0xdc/0x210 [i915]
>>          pci_device_probe+0x95/0x120
>>          really_probe+0x164/0x3c0
>>          __driver_probe_device+0x73/0x160
>>          driver_probe_device+0x19/0xa0
>>          __driver_attach+0xb6/0x180
>>          bus_for_each_dev+0x77/0xd0
>>          bus_add_driver+0x114/0x210
>>          driver_register+0x5b/0x110
>>          __pfx_vgem_open+0x3/0x10 [vgem]
>>          do_one_initcall+0x57/0x270
>>          do_init_module+0x5f/0x220
>>          load_module+0x1ca4/0x1f00
>>          __do_sys_finit_module+0xb4/0x130
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> -> #2 (fs_reclaim){+.+.}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          fs_reclaim_acquire+0xac/0xe0
>>          kmem_cache_alloc+0x32/0x260
>>          i915_vma_instance+0xb2/0xc60 [i915]
>>          i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
>>          vm_fault_gtt+0x22d/0xf60 [i915]
>>          __do_fault+0x2f/0x1d0
>>          do_pte_missing+0x4a/0xd20
>>          __handle_mm_fault+0x5b0/0x790
>>          handle_mm_fault+0xa2/0x230
>>          do_user_addr_fault+0x3ea/0xa10
>>          exc_page_fault+0x68/0x1a0
>>          asm_exc_page_fault+0x26/0x30
>>
>> -> #1 (&gt->reset.backoff_srcu){++++}-{0:0}:
>>          lock_acquire+0xd8/0x2d0
>>          _intel_gt_reset_lock+0x57/0x330 [i915]
>>          guc_timestamp_ping+0x35/0x130 [i915]
>>          process_one_work+0x250/0x510
>>          worker_thread+0x4f/0x3a0
>>          kthread+0xff/0x130
>>          ret_from_fork+0x29/0x50
>>
>> -> #0 ((work_completion)(&(&guc->timestamp.work)->work)){+.+.}-{0:0}:
>>          check_prev_add+0x90/0xc60
>>          __lock_acquire+0x1998/0x2590
>>          lock_acquire+0xd8/0x2d0
>>          __flush_work+0x74/0x530
>>          __cancel_work_timer+0x14f/0x1f0
>>          intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
>>          intel_uc_reset_prepare+0x9c/0x120 [i915]
>>          reset_prepare+0x21/0x60 [i915]
>>          intel_gt_reset+0x1dd/0x470 [i915]
>>          intel_gt_reset_global+0xfb/0x170 [i915]
>>          intel_gt_handle_error+0x368/0x420 [i915]
>>          intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
>>          i915_wedged_set+0x29/0x40 [i915]
>>          simple_attr_write_xsigned.constprop.0+0xb4/0x110
>>          full_proxy_write+0x52/0x80
>>          vfs_write+0xc5/0x4f0
>>          ksys_write+0x64/0xe0
>>          do_syscall_64+0x3c/0x90
>>          entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>
>> other info that might help us debug this:
>>   Chain exists of:
>>    (work_completion)(&(&guc->timestamp.work)->work) --> fs_reclaim --> &gt->reset.mutex
>>    Possible unsafe locking scenario:
>>          CPU0                    CPU1
>>          ----                    ----
>>     lock(&gt->reset.mutex);
>>                                  lock(fs_reclaim);
>>                                  lock(&gt->reset.mutex);
>>     lock((work_completion)(&(&guc->timestamp.work)->work));
>>
>>   *** DEADLOCK ***
>>   3 locks held by kms_pipe_crc_ba/6415:
>>    #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
>>    #1: ffff888136c7eab8 (&attr->mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
>>    #2: ffff88813e6cce90 (&gt->reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Andrzej's r-b is missing here.
>
>> ---
> Please add a version to your patch and a changelog.
>
> Thanks,
> Andi
