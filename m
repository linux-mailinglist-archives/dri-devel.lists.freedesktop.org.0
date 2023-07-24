Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748497601FE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 00:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CED10E373;
	Mon, 24 Jul 2023 22:05:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5CF10E373;
 Mon, 24 Jul 2023 22:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690236347; x=1721772347;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/UfBaksC60hLY+rIn+e1GDQS4VvF5x5UzdFEswpmLA0=;
 b=eJ+DSbr0JGX3jX2aAh2C9OT3U9adjWnNoNsgjoRhvCu+ArbiMmEKZ5fN
 /H0hUA3y6sV1ASADWLbR9NNEWltC9l8i/p1RLHZHIDg3EaLMYXtrHwLw5
 jU07sFPYANqglpvmrsVQ73pRsiCtiXkkWbR+KBCrOxMGkwKMl4n+I1eXk
 PbR+bX2VkiXnesDa51kx6zVG1Ygdy+KzWyXZF7VrauQDXg4MTrQIUGH5+
 AJonRWSbc6f/6FUSb2dH9iut3BPLUe7gNKzjut2Io2o2cGhJ6QmXArukW
 UWKnowLR51kNOeO/Ckan8KLoVYY6HDXgoXZfIDCoxIHLxhkedcsMRYH+r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="366450454"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="366450454"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 15:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="760975767"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; d="scan'208";a="760975767"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 24 Jul 2023 15:05:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 15:05:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 15:05:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 15:05:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4FY9or+of1LPVEkfQ9bSleoCugRAIWVUNWlwJihnXfVNxtPxy8XBkBRIvLxo4GUIA26mpkLKledKNKQerllH6sEROiN9rJHTjsbDTf6FG2nTkUotEh95mohLRhEOT3O9+3Ep4/y8tPSg8/j7487k5JNDX619QpcM3g3CZCiJbExWzBAY7Hln+ACHqiMNEInQCT+6iPvchGV7rDydR1Q5NpJFIvd3hdONJAA0fHJjJqlcriIT8UsfqUh7yqXWmMT5vr7xqbxzd4HXaUj6tZsr1HOCb3JbtTbvivxu/kcBWCevHtkJgxoQ9uy0co6CJ5yKcaXGLBUBq8SqNz/SFeNMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFEGOMvVauNIvrBBlkMLSqpCzoowFBz7jD23AAFwFtM=;
 b=QievlVfg/02Fm1esoB662Hb7ZU8hLThFXZvGZpr6MoXO4iIg2XBkUdbUoNubxq3TXIE7VBTKPH0dY1SbMZfrql8cS5TP7hUsI2CYJbf28akGbiNvlKhA0Ltmkvqe3LvZZkti7KNrogdTvljX6/USzIVatE9cqtoM4KwtYWmouLu4uDmv78qSe1oMVRLgTfmL6SM6RbEja2AggOJGZ5+ejl1KQxQ3cUScQ9ONUIYN8/ZihJHkcwkYz7qa+vsCXIPsyY4xvIQQRFykdraHUF74M06K9lv4jWTi7Tf8Q0jqix2GY1HllHUG8BDa30B0qAYFbJbI3TkHC6WJiUf4uSI1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 22:05:43 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e290:81f2:3cc4:439a]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::e290:81f2:3cc4:439a%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 22:05:43 +0000
Message-ID: <a44bdb61-7e37-9c01-1b52-ab9cb2190bfa@intel.com>
Date: Mon, 24 Jul 2023 15:05:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Avoid circular locking
 dependency when flush delayed work on gt reset
Content-Language: en-GB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20230615211542.963700-1-zhanjun.dong@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230615211542.963700-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea8966a-5ddc-49e6-6516-08db8c92200d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGNcvUF/diJ2wlE+idQ41S/Jw3lBf09Fp9/OJX4vKw32gHOUgkw80wux3uyaBfZDAFlsIkRv62vDyz9oAcx+GWolQEQZ709h73RLcS7j2T4fBYxsRF1atnJpzOy8ONMu8TmkGt/hgAeNnnx7Lbrc65X4UwFrfVWR6615qAwEOHfeZl3ggC6GyFbyyPyeDyJJolvSHz3yn5ym2jWbLsE+IhjKDvjcMqbrTQCRI6qrzBNGGazhDpjr4zvOoqqe/v6Hv6QILo6J4ZUsCD30qjkf8geFHC4npTM9Fa5cS3EfF2ezUOkKg13Cg+IBocZ1drVVJXxxx5rkD+QpWw9LQ1bS+wcAqLzA3BRjJeI2ZD5d0/lELnBhUTyN+FXiTkiwQ/3OiHBRsMs7K3WCb79Bk6GPWXDHjrBrCFvoUF+NQqITmmF1G1rOgM5H0wYgAdc/vtWiqqgTbrrC+vIzPzX65OMVzplOgiyZg08abOgp64xlYwLgsQcDRuUiGKMQtslqWJHHUttM9FGShTJSaMc368LHyKhdFM23xwbgN4QY3uu7u/6ejql36bjP9xXQcHPBmU12sFQEMiHC+bxoK2H6TTxAuf4QSxNWdAbDh9Ts0hj+qwHzP1cdSJYn4hBtfIHcqllfFC0b1/Y/BS2GDF6lqOjqQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(6506007)(26005)(186003)(36756003)(5660300002)(31696002)(8936002)(8676002)(2906002)(53546011)(38100700002)(82960400001)(86362001)(6486002)(66476007)(450100002)(66556008)(6512007)(66946007)(83380400001)(31686004)(478600001)(41300700001)(2616005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUc1NGU4WTVlcjhKWXNYVGs3UUFzdWZnMGJ5Q3JsbkJjNFpRbG15RGRLTFRu?=
 =?utf-8?B?QVIrQ2VwR0gvVjBDb1dnT21BNGozWEtzWWUvTkQzdE15UU9BUHFRaWRobTNE?=
 =?utf-8?B?eXVxMG00QUZMS01tNSs0VEMvSm5zQU9iZGJZUGRPYmM1V1lKcjhoNlgvVEs5?=
 =?utf-8?B?NHVjc2d1M0tmMWgxS2trQmMrK3QxODkydzlyYTliRG9sd3BLbmlRMjQrR2ZG?=
 =?utf-8?B?REwzZS9aY29Nbm14TUIwaGhKZUNXVHF4SzMwNVVmbG9qR2loSFRjcXd6L1pu?=
 =?utf-8?B?SGRmZzFOMWtodXk4YTlQK3lQZG5rY3JTNEdiWHdHV2psekV0aGl2bFUvS0lB?=
 =?utf-8?B?YXdTWTVMVmUrYjRFSmtWWkk4aEI3c2ZDYXFiU1BrU2VnZXNEdys5dXRSOGpU?=
 =?utf-8?B?UzhaT2pFdi9EWFI2ZWpQdmpYVzREaEpCb01pMVRRd3A5aEVoVjBLenJMMVh2?=
 =?utf-8?B?dno3VllJbGNLelVxRitxREVwQUoxd3BraERveDlVK29KeEh1OEhEQ2hmVkRo?=
 =?utf-8?B?UXBwV0hvR3JqbnduR1dWMXNoSmxReDR1RGcyN01qcnhvZ3ZMTTFQajRIVTE0?=
 =?utf-8?B?K0JOajBkaHU2cER0elByaXBxVTUrWS82ZlpoRW5HYkVmUVEwOHZ4NkwwLzg4?=
 =?utf-8?B?MWo3aVZFT2NtN0V0b2p0VUJiNnZRNTB2WXJiTThaTVJSa1lLcDFOdkcrT250?=
 =?utf-8?B?czd5YlFxMmlhTllORHJGRzFWM09rTkZUcWprMWFKQ1VKUDdHNDJFMFQrTGVL?=
 =?utf-8?B?R2M0Z0E5U1g1eTR5NmtqbXNKVUNMeUtzZVBLbVFPUDRmK0c3NExmVmpqM1hF?=
 =?utf-8?B?U3lRUHlrcGRxOHoybzNGN0lYMXdhTXBUVjhsdVZwbGFCblpLMEJMcE5HTGty?=
 =?utf-8?B?WnFPRlpxNUVvYXVYZUJ0Z1B4eWhpMEx5SjFiRGJRdnVnTXRTUWtjVXg0U0Fa?=
 =?utf-8?B?S2pmakhmQkt4VEZTeUwzS1lzYi9OZmZKVDFZMlJ4Q3ZqZTQ2MURUT2NvYzVa?=
 =?utf-8?B?eEZtTnlqeW5nN3VlbVg5czhXUTBLTllWWnlyS2pIZzg4OGp4MGdQSkUvdElB?=
 =?utf-8?B?NStSZ0c5UVZFVm9Dak5lTTRORFhjNnJRWmk4OGM2bm05YzhSNThnRjg5Q0Rr?=
 =?utf-8?B?U2FWNFVIZ1hrMlpMQ0VVTnFpM04wMnIvQVUxdk8xTFJLcC9JanRUWUZyNU1W?=
 =?utf-8?B?ZHRGbzBuRTI0YXN1YnhPQXd2ZURIYkxoUy9NSTZ5UEszeVM4REdpMGdHbDRn?=
 =?utf-8?B?MlZTQ1FzbGhmN1NWVUk3T0NGN1g0MVRWUVFvOTlwU1hDWmpnTHBpMVFHTUFV?=
 =?utf-8?B?YktoRGF4K2p3Smh2dmhuSkNNaVlpbVA1VXVHdTBKTCt0ellCS2pXdWtTU2dZ?=
 =?utf-8?B?RDBUTVUyeHNCMHpDUGtuZmYweTUyM3hrYWllcVF3TUZ0bVNnMWNFeVpDcFdL?=
 =?utf-8?B?UlZZZmlucGlMREl1OTN2SkJhMXEzRnJZeVhvMmdudDdZQVpzM3lwZEVtZWNx?=
 =?utf-8?B?NlZONlVNM016L0JCeU1WQmoza2F5anhDMVVZU3lRR3RnMGdETWFSdVEzbi9P?=
 =?utf-8?B?eU1xaU5rL3RYVGY2NCt3ZHgwYWxKajlDQWZ2Q05LTVRhUWRERVNhQlB6dkNl?=
 =?utf-8?B?WGM5dDNsMHZJeStiL3BCZ2dJNkhtUG9vSTl3WGs0bytUcUYwczR0bkt1TllI?=
 =?utf-8?B?MXpjRElnWllqaDdiWU9tNWt3Wmt6cDcwd29EUjFrZmFnYmZ5SjlCRTJtSWVn?=
 =?utf-8?B?ckY4QzVPd1I2clAvcXJVdVRuNlB1RGNmbExQQ3JSOWlQa0ROZzlIM2drVVE5?=
 =?utf-8?B?L1NIQ0ttK1JQZ3NON3VPWDM5cXV6TXIydzk4b1JsTGEyWWVnZllUWkx2SVhW?=
 =?utf-8?B?b2V3SEN6MkltK3BMSTkvVm96OWJWZUowUlJHTnI2dzEzQWJPSEZXR2FmYVht?=
 =?utf-8?B?ZFU0MXl0ekhYUTJ5Y2VPQjhnRFRKWWRBOWJpN09KOWtkdlJxSlpnOHlFbHl6?=
 =?utf-8?B?ZFN3cFY2UUtoR0dpN09nSTZnMXlocFF5b01VRllYcHo0S2IvLzVGb1VrNVR3?=
 =?utf-8?B?Sm9iZTFDWk9qSC9pbXZyMmJNbnd4MGpueDVIdWlwbGw1MVVYNkdsckxrazdX?=
 =?utf-8?B?WFVpWlFUYnllSWJKZVhuM2dhdmNPdHZORHBxTmtmTFBUYTVsSW9HakZ5U2xs?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea8966a-5ddc-49e6-6516-08db8c92200d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 22:05:43.5466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZbbpZAVGgR270dk6Jx/QmaHneCBzE7v23FNQm/mH4+gw7ZESxxsO0fdcuSsFYffG52SVeFd+H4Uk+FwC3AWzrw8Ki2YgEbIMkku1H35lto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

On 6/15/2023 14:15, Zhanjun Dong wrote:
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
This one is potentially a problem.

AFAICT, '__uc_fini_hw' is actually becomes 'intel_uc_fini_hw' (through 
the magick of UC macro-ised function declarations!). And that is only 
called from the bail out error path of GT init and the driver remove 
path. Both of those should be synchronous waits to ensure that the 
worker is guaranteed gone before unloading the driver. However, the GT 
init path is presumably called as part of a full GT reset. And in 
theory, it could fail (e.g. because the hardware is toast and hence the 
reset in the first place). And in that case, it needs to be the async 
cancel.

One option would be to pass a 'in reset' flag all the way through the GT 
init path, but that sounds really intrusive and messy. The simpler 
alternative would be to make this always synchronous and just accept 
that the circular locking warning may occur in exceedingly rare cases. 
Again, the circular lock detection is bogus because we have the early 
exit in the case of a locked mutex. So it is not an actual problem. In 
which case, living with the warning in the super rare case of a failed 
GT reset seems acceptable to me.

John.

>   
>   	__uc_sanitize(uc);
>   }

