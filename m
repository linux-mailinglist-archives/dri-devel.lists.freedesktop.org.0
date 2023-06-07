Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79010726A9F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 22:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2810E543;
	Wed,  7 Jun 2023 20:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C25610E53F;
 Wed,  7 Jun 2023 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686169049; x=1717705049;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=E6UDVjcPdFsljHzyWJtPeqtGUlqkbs2Rjoec/TuoQz0=;
 b=HqT5wvjzIMMN1DaCnWoObvtR4PGnkWjTLZsO0RXDKEKwOQmxP32zKARa
 xIjUrpb7LQ49q0P7bQKoGQopdqgs5tsaTzsR2ySgLK01UL06ZxOmKYiM9
 V/tEmxMh1IiQlcfkvB+aqdD0fVFOSgVUea44hL8eVNy3mUboSSS6aq5Ua
 rcrBeLK46FT+4xo8q8GkAIVMiJoXl+mDHlc5ublS3D/n3mVCs7f0Aifto
 8sKPv9Nl6f1uA/ZaodCQt5yPUpQvxp+PeZ8kt6urd23WtsLXF1SuADF4C
 oYwoxJ7ZQGkoWDN9y3p9AxTHEhnkPGFyABz9Q7+MF5Uk8hbw1RuATHbpC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360428713"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
 d="scan'208,217";a="360428713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 13:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="703795414"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
 d="scan'208,217";a="703795414"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 07 Jun 2023 13:17:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 13:17:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 13:17:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 13:17:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 13:17:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnyVnydfbppffi5shjr/zN091E1RPbOJLeoxerE/2jJWlnNem1geP+hyHurT2UcAWTqHDag99cDZQr5NBKjSefsZV8d2XaMSDrlhPXayyJFvSvXCP/RCyZL3s2GB9pqc20u0NTN6LgrTycsBHOSBOxP5J784B9zUtSLZVjzX4YkNs+qJljfqwKXxyMD9jnZJ0NKJFESNaMtTmN83GK5Y3HUZYWy664AAxZ5F455dktApVxubQumG8MPmXZfSVtK9VKXsDbzLxy8JyL3p30FbqKfhuOOjrB6esvl+88MFfEp/Zq30dlvaYhjkZrfoiMS/3zXMpliO/HKgNUJqArFmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQE3FPEWW8bOcavZZrw5yCvMeAxwdl6ImwHndHLlfLo=;
 b=avH8rqjSM5WFmx5cbYnjS+Cr9fvxKdKqNAUyB86Rj/yBYmTyz9F0zmmsdlhwniXro3VSFawuBwhrbOLz+4aYavOlX+T/OxkhY7p+sFuiFEF8MEtUZbsDWBxhsqE8DoO9Dg4UBvDM4FySpQAYUuF/+bAYOeR/12xToFvVGAEBiQgRK75LuYRHzhhUrpQh3d8aIj4vYHXLjh9C095Lp1zMWYqZKmLeanBo6zVCRg78d+vg0ZpZSSmjYC7yGTYIkuN8WWtDtM2hxQjdWBCwsZXEjdgVhBX4JBtiY2FrCTaJmaxNEYoNdGXF1OF0zZo1vIX42VJxYOajURqN0y6IFCLlEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 20:17:24 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8a8c:99c0:4a8e:fcd5%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 20:17:24 +0000
Content-Type: multipart/alternative;
 boundary="------------HEhgcsUi7IAv2M4XgRJyjuXw"
Message-ID: <7900227e-781d-d093-c625-e26bfdeb2203@intel.com>
Date: Wed, 7 Jun 2023 13:17:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Avoid circular locking dependency
 when flush delayed work on gt reset
Content-Language: en-GB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20230607190350.287644-1-zhanjun.dong@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230607190350.287644-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR13CA0098.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB4832:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d88e12f-7a05-43b1-0a02-08db679434b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kf0GDg5GtVquM1dcwJ/Z7C6ftgLmAOIXFl/mW2mJ3HCKco2sa6tzkzHLhS9fb13UHoyAqD8f31hryURLDwYdkJKO9V2osTLTPfyPzWyyVCeRzqK9WPTPpA8lyzZ3l3tVr2Q6OcKMdOmjc3fE6HMZdQ0lVW/cdoJ3FSxFbQtUprr9vG3/K5YJRr/yM/gdFTvE84F1mgUfdfHUKL3d+KT+dbz8lXuMTEvemdcvWNfEMqcQ5XbzuufK5qPJ0xktloQT7PII+nywyBvFVwcof1mH4EnXhFUAzgC5ZIBx8JEZkNoMDbVQNCzTY4Lgoc8Xs1SSXuydlq8eTHpXWv045tiA/AayWMlITY1Zr9A7zWp+GbLGCFa1TtV8SR+vjOMD9mvHi6WHcTSQEVNzcDIUeFSqOhWKfT9GSukH3qiUj+wOz40+w/lLI/kAR41ky1Oxua1y/yEqre93oUDjbCqcPCyODAf+IS/C092KparO5kOD1Uq434Aq6DTJqyYRfIRG7266AyRs3seQG0aIkGLqfu9YheuLMv5mSX6J7IJqUq+dBzgtWDMxzT35tvJlN4AgWHV1ijc0G60VS6Q8eleDyXTeVxg9wi5oFxmhXtqK5G9sDZzMPbtxeDNtXriI/z61xWJNxCpx22Byn9qAnixFU+qmbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(33964004)(6486002)(2906002)(82960400001)(30864003)(66946007)(66476007)(66556008)(450100002)(110136005)(36756003)(38100700002)(5660300002)(8936002)(86362001)(8676002)(31696002)(41300700001)(478600001)(6636002)(316002)(2616005)(31686004)(53546011)(26005)(6512007)(6506007)(186003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3FHendEZzMxMnRKSEV0N05KMkUzYXdCVDUzRzluL0JLbVFadmZpRWVNbStq?=
 =?utf-8?B?NitsVXR1Q3BWUkVPVHNJZ0N3bGgwUUNpOGxEbHpxOEtqK1dqTVFzbmNSdyta?=
 =?utf-8?B?V2NGYklCdHdHK1p5TjR6YktVdnF4ZmhwY2w4eHlHc1ZOUytpaXBxczBma0lv?=
 =?utf-8?B?RGp1TUQ0cjdNdWhHU0c0K2dIRkdrNUVIN2hBY0VOZWc1OVBGUWtXMXhKR0d1?=
 =?utf-8?B?NHdPVVlNTDRoZUF4MVpCcFRTZGhtWWZxNm56ZlpKMWljZHZDWWV2cVhHMTFl?=
 =?utf-8?B?dVlTQ3ZYeVJLVzBobU5LeVdhc1ozc3VYcmdDNVFYc0tZclprLzVzMU0yMElG?=
 =?utf-8?B?Z0xOcFlOcHc4K3ZZdG56MHFaeW9hWGcwbGZ5ZzlMQ2NDWTZaSVkvZjd3STBC?=
 =?utf-8?B?aXFwbDhIVE9ZTmdUbGNYVjNIQ3BLTlZ1Wi9ZYlUyQmlvc1NGUnJkYi96NTdE?=
 =?utf-8?B?WXA5c1Rtb0Y2WitJWXFlZkhOaThTb3ByUTUzNFkyMkpvbVMwYTdyZnU1MTVW?=
 =?utf-8?B?a3B4V2JtbmdLUHJCa0lKaWIvRm1taHY5aEJENU1EeW83L3ZUWDNLRFRKbUZ2?=
 =?utf-8?B?WVlyWGtuR004NnhadGNoK2Q5TWdHNjl0Q0trWUxUT05ncGl1L09kUEh5RW5J?=
 =?utf-8?B?WmtucHNlL2UxZFZKRXJ6dEV5SGxBeUdhbXB5K0VoSEhTRHJLZ1l3NlBKMWFU?=
 =?utf-8?B?ZTgyMTMrWmZ5SUh6THhwN0RnU2phdnNvMVpCdnRDelBXbWJUcFU5dWVNcS80?=
 =?utf-8?B?VURVNXZ6NkwvRVFucTFRK09MNzBCM2gzUHFoV2tFWGhldVZZTVd6MHpPcUpu?=
 =?utf-8?B?cVJJbHkvQ1ZDcXdGcDVveWNiZlZGV0F6eUFPQkJzaUJWTmVhVUQwdWRSMmlM?=
 =?utf-8?B?NUUrRHNCSlNLKzlialpxUUdNTEFBVDlZY29VTkpmQjlGaWtGdzJWaGZ6UENy?=
 =?utf-8?B?aGxFbVV3c0tJSlV6NTNNZzZpQ05iRVRhYUlUZ3o0eERYWnlManAxcE5Jd1lj?=
 =?utf-8?B?ckFiTEhrZkJyK09IendEUlV0TjZmK0lqR0thTGd6UkVjejhPWkNENStWYjQ1?=
 =?utf-8?B?bHNnUCtXVGdhT0U3L2txaHplc1NFMlZEWWY0RkJZQUtjZnhxMUZtQlFybWdT?=
 =?utf-8?B?MGR1YUZQWEc0b1QyTkY4Yk8vUlhISXlWSXJjbXZ5UjJpbDE3ZmxRYWM4RVVH?=
 =?utf-8?B?ekJLM1JvTkFUOFZnQXhicWVIbHVsR2tDUDQ4MHB0UjZ2MHowWjJuL0JBMjNu?=
 =?utf-8?B?R0g3RFVwaXhhMmRUMjFBWW4rTFdzSVlxY0JVSHowWmNuZnZ3ME84V3pQL2RQ?=
 =?utf-8?B?NzJIVThTNldjblcwV3FQaEZEMjRxYzgwc2ZxZ1NFVVkxZ3R5ZE44UFRSbGVW?=
 =?utf-8?B?TW9vZkRYQmZwNUprT3UvQng5eE1nTXF5ZHF0NkZpZ1MzVm4ySWdoVHQ4QWk3?=
 =?utf-8?B?bGN4RzBXby9BajFTTUJ3cHJSVGlMeEJQQ1dCSGZPSjNBNHBIN0NldUR3bE9R?=
 =?utf-8?B?ekdKTmRBTXdqTGsxRkNVVnFvSU83ZFRtWmhjcXVJZ1dLczhLRCtZN1M3Ujdq?=
 =?utf-8?B?ZklKZDh3SmFSMWQ4MGM0NTlBc25kSDhuRk83N3JzenF3cm9IV1ZCN0hNUitt?=
 =?utf-8?B?M2t1NFRiSURQdDdQVFhES3RaWG94Z1p3akZkSnlubmtDZnQ4YXRtNHhrakJm?=
 =?utf-8?B?Qk1wZTdBVjhpT3gzaks3MUVPNEpyTlBhemVxZUgzTHFWZzZSRFV1SFQ2Y1RG?=
 =?utf-8?B?MUVhVFNlZjNxUHQxTSt5T3FFZktacW04a01QeSsrNkVjN2VuNkszRDFGdjQw?=
 =?utf-8?B?TjFWY05qRzhtNlQ1Rm1RR3JJKzBiTFI5eTdYUEtUYjBTYkhrd3VyZnNxSzIv?=
 =?utf-8?B?UUtpczRwMjBYMnlBSzk5bEpIMVh1N1VTSit1UDRaTkNYY2Z4aVFtZFh0WnFY?=
 =?utf-8?B?WThuUEJQOHB1M3RUc3BSbE1nSXhPeVo1NGpha25odjhQL3ZjVEVmRkNVNzFs?=
 =?utf-8?B?U2U4S0dSS2U3RUFjTGpUMEovUk9iSmFBWnYzeXVnVlNkQWxkTWFReElaY3Mv?=
 =?utf-8?B?YS9NMUptWGlXVzN1UVF1RzhDb0EzdkNkVkZjaVFsR3RKeWUyRm9ERmI3OGV0?=
 =?utf-8?B?dTZzblk0MWk2N2Z3bUljOXJTcHdFTkt3cDc0bzBPZFdtTGJiS1JhU0ZKRDl5?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d88e12f-7a05-43b1-0a02-08db679434b7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 20:17:24.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJVV+L9ixoauRGM9HNeA9oD54lQuQmbuzVw0iAJ6YDgrB6acJ4vVkeP8ygplvxkuTbSn5zqUmGvbZ6Yz73BvA+NH11piQcDElBC/2SQjITY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
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

--------------HEhgcsUi7IAv2M4XgRJyjuXw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/2023 12:03, Zhanjun Dong wrote:
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
> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..cca6960d3490 100644
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
> +	guc_cancel_busyness_worker(guc, 0);
Should use true/false rather than 1/0 for bool values.

Also, this needs a comment actually in the code, not just in the patch 
description. E.g.:

    Attempting a synchronous cancel within the reset path leads to a
    circular mutex locking complaint by lockdep. However, it is safe to
    use an asynchronous cancel here. If the worker does actually run
    concurrently with a reset then it will early exit due to the
    mutex_trylock call rather than block.


>   
>   	spin_lock_irqsave(&guc->timestamp.lock, flags);
>   
> @@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
>   
>   static void guc_fini_engine_stats(struct intel_guc *guc)
>   {
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, 1);
>   }
>   
>   void intel_guc_busyness_park(struct intel_gt *gt)
> @@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
>   	 * and causes an unclaimed register access warning. Cancel the worker
>   	 * synchronously here.
>   	 */
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, 1);
>   
>   	/*
>   	 * Before parking, we should sample engine busyness stats if we need to.
> @@ -4503,7 +4506,7 @@ int intel_guc_submission_enable(struct intel_guc *guc)
>   /* Note: By the time we're here, GuC may have already been reset */
>   void intel_guc_submission_disable(struct intel_guc *guc)
>   {
> -	guc_cancel_busyness_worker(guc);
> +	guc_cancel_busyness_worker(guc, 0);
Hmm. I think this is going to need breaking up further back in the stack.

We definitely want to be doing a synchronous cancel in the general case 
of disabling submission (e.g. due to suspend or driver unload). But if 
this is happening as part of a reset call stack, then it is a problem.

AFAICT, the only way _submission_disable would be called within a reset 
is if __uc_init_hw() failed for some reason. So one option would be to 
add the sync/async flag to _submission_disable() as well and just make 
the init failure case async with other callers being sync.

A better option might be to add an 'are busyness stats enabled' boolean 
to the guc structure. And inside the cancel function, early exit if the 
worker is not actually enabled (and set the flag anywhere and everywhere 
that does a mod_work to enable it, which is just 
guc_enable_busyness_worker() I think?). That would mean that multiple 
disables do nothing. So e.g. a failed reset will cancel the worker 
asynchronously in reset prepare but then not try to cancel it again 
synchronously in submission disable. Hmm, except that init_hw has 
already enabled the worker by that point :(.

FYC: Umesh and Daniele... any thoughts?

I would be tempted to say is there any way we can just add a lockdep 
annotation to ignore this issue? The lockdep splat described in the 
patch description above seems like a false positive to me. Sure the 
reset lock is held by the reset code which is now trying to 
synchronously flush the busyness worker thread which also takes the 
reset lock. But the busyness worker thread does a trylock and will abort 
if the lock is already held. So no issue...

However. I think we do have a genuine issue with the internal delayed 
worker lock itself, which has maybe shown up in other lockdep splat 
reports. For example, if a worker thread triggers a reset (e.g. anything 
reset related coming in via a G2H) then the reset code is running inside 
a worker thread. Which is maybe holding an internal kernel worker thread 
lock? So if the reset path does a synchronous cancel of another worker 
thread, that also requires taking the worker thread lock and thus a 
deadlock occurs.

John.


>   
>   	/* Semaphore interrupt disable and route to host */
>   	guc_route_semaphores(guc, false);

--------------HEhgcsUi7IAv2M4XgRJyjuXw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 6/7/2023 12:03, Zhanjun Dong wrote:<br>
    <blockquote type="cite" cite="mid:20230607190350.287644-1-zhanjun.dong@intel.com">
      <pre class="moz-quote-pre" wrap="">This attempts to avoid circular locking dependency between flush delayed work and intel_gt_reset.
Switched from cancel_delayed_work_sync to cancel_delayed_work, the non-sync version for reset path, it is safe as the worker has the trylock code to handle the lock; Meanwhile keep the sync version for park/fini to ensure the worker is not still running during suspend or shutdown.

WARNING: possible circular locking dependency detected
6.4.0-rc1-drmtip_1340-g31e3463b0edb+ #1 Not tainted
------------------------------------------------------
kms_pipe_crc_ba/6415 is trying to acquire lock:
ffff88813e6cc640 ((work_completion)(&amp;(&amp;guc-&gt;timestamp.work)-&gt;work)){+.+.}-{0:0}, at: __flush_work+0x42/0x530

but task is already holding lock:
ffff88813e6cce90 (&amp;gt-&gt;reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-&gt; #3 (&amp;gt-&gt;reset.mutex){+.+.}-{3:3}:
        lock_acquire+0xd8/0x2d0
        i915_gem_shrinker_taints_mutex+0x31/0x50 [i915]
        intel_gt_init_reset+0x65/0x80 [i915]
        intel_gt_common_init_early+0xe1/0x170 [i915]
        intel_root_gt_init_early+0x48/0x60 [i915]
        i915_driver_probe+0x671/0xcb0 [i915]
        i915_pci_probe+0xdc/0x210 [i915]
        pci_device_probe+0x95/0x120
        really_probe+0x164/0x3c0
        __driver_probe_device+0x73/0x160
        driver_probe_device+0x19/0xa0
        __driver_attach+0xb6/0x180
        bus_for_each_dev+0x77/0xd0
        bus_add_driver+0x114/0x210
        driver_register+0x5b/0x110
        __pfx_vgem_open+0x3/0x10 [vgem]
        do_one_initcall+0x57/0x270
        do_init_module+0x5f/0x220
        load_module+0x1ca4/0x1f00
        __do_sys_finit_module+0xb4/0x130
        do_syscall_64+0x3c/0x90
        entry_SYSCALL_64_after_hwframe+0x72/0xdc

-&gt; #2 (fs_reclaim){+.+.}-{0:0}:
        lock_acquire+0xd8/0x2d0
        fs_reclaim_acquire+0xac/0xe0
        kmem_cache_alloc+0x32/0x260
        i915_vma_instance+0xb2/0xc60 [i915]
        i915_gem_object_ggtt_pin_ww+0x175/0x370 [i915]
        vm_fault_gtt+0x22d/0xf60 [i915]
        __do_fault+0x2f/0x1d0
        do_pte_missing+0x4a/0xd20
        __handle_mm_fault+0x5b0/0x790
        handle_mm_fault+0xa2/0x230
        do_user_addr_fault+0x3ea/0xa10
        exc_page_fault+0x68/0x1a0
        asm_exc_page_fault+0x26/0x30

-&gt; #1 (&amp;gt-&gt;reset.backoff_srcu){++++}-{0:0}:
        lock_acquire+0xd8/0x2d0
        _intel_gt_reset_lock+0x57/0x330 [i915]
        guc_timestamp_ping+0x35/0x130 [i915]
        process_one_work+0x250/0x510
        worker_thread+0x4f/0x3a0
        kthread+0xff/0x130
        ret_from_fork+0x29/0x50

-&gt; #0 ((work_completion)(&amp;(&amp;guc-&gt;timestamp.work)-&gt;work)){+.+.}-{0:0}:
        check_prev_add+0x90/0xc60
        __lock_acquire+0x1998/0x2590
        lock_acquire+0xd8/0x2d0
        __flush_work+0x74/0x530
        __cancel_work_timer+0x14f/0x1f0
        intel_guc_submission_reset_prepare+0x81/0x4b0 [i915]
        intel_uc_reset_prepare+0x9c/0x120 [i915]
        reset_prepare+0x21/0x60 [i915]
        intel_gt_reset+0x1dd/0x470 [i915]
        intel_gt_reset_global+0xfb/0x170 [i915]
        intel_gt_handle_error+0x368/0x420 [i915]
        intel_gt_debugfs_reset_store+0x5c/0xc0 [i915]
        i915_wedged_set+0x29/0x40 [i915]
        simple_attr_write_xsigned.constprop.0+0xb4/0x110
        full_proxy_write+0x52/0x80
        vfs_write+0xc5/0x4f0
        ksys_write+0x64/0xe0
        do_syscall_64+0x3c/0x90
        entry_SYSCALL_64_after_hwframe+0x72/0xdc

other info that might help us debug this:
 Chain exists of:
  (work_completion)(&amp;(&amp;guc-&gt;timestamp.work)-&gt;work) --&gt; fs_reclaim --&gt; &amp;gt-&gt;reset.mutex
  Possible unsafe locking scenario:
        CPU0                    CPU1
        ----                    ----
   lock(&amp;gt-&gt;reset.mutex);
                                lock(fs_reclaim);
                                lock(&amp;gt-&gt;reset.mutex);
   lock((work_completion)(&amp;(&amp;guc-&gt;timestamp.work)-&gt;work));

 *** DEADLOCK ***
 3 locks held by kms_pipe_crc_ba/6415:
  #0: ffff888101541430 (sb_writers#15){.+.+}-{0:0}, at: ksys_write+0x64/0xe0
  #1: ffff888136c7eab8 (&amp;attr-&gt;mutex){+.+.}-{3:3}, at: simple_attr_write_xsigned.constprop.0+0x47/0x110
  #2: ffff88813e6cce90 (&amp;gt-&gt;reset.mutex){+.+.}-{3:3}, at: intel_gt_reset+0x19e/0x470 [i915]

Signed-off-by: Zhanjun Dong <a class="moz-txt-link-rfc2396E" href="mailto:zhanjun.dong@intel.com">&lt;zhanjun.dong@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..cca6960d3490 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1357,9 +1357,12 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
 	mod_delayed_work(system_highpri_wq, &amp;guc-&gt;timestamp.work, guc-&gt;timestamp.ping_delay);
 }
 
-static void guc_cancel_busyness_worker(struct intel_guc *guc)
+static void guc_cancel_busyness_worker(struct intel_guc *guc, bool sync)
 {
-	cancel_delayed_work_sync(&amp;guc-&gt;timestamp.work);
+	if (sync)
+		cancel_delayed_work_sync(&amp;guc-&gt;timestamp.work);
+	else
+		cancel_delayed_work(&amp;guc-&gt;timestamp.work);
 }
 
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
@@ -1370,7 +1373,7 @@ static void __reset_guc_busyness_stats(struct intel_guc *guc)
 	unsigned long flags;
 	ktime_t unused;
 
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, 0);</pre>
    </blockquote>
    Should use true/false rather than 1/0 for bool values.<br>
    <br>
    Also, this needs a comment actually in the code, not just in the
    patch description. E.g.:<br>
    <blockquote>Attempting a synchronous cancel within the reset path
      leads to a circular mutex locking complaint by lockdep. However,
      it is safe to use an asynchronous cancel here. If the worker does
      actually run concurrently with a reset then it will early exit due
      to the mutex_trylock call rather than block.<br>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:20230607190350.287644-1-zhanjun.dong@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	spin_lock_irqsave(&amp;guc-&gt;timestamp.lock, flags);
 
@@ -1485,7 +1488,7 @@ static int guc_init_engine_stats(struct intel_guc *guc)
 
 static void guc_fini_engine_stats(struct intel_guc *guc)
 {
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, 1);
 }
 
 void intel_guc_busyness_park(struct intel_gt *gt)
@@ -1500,7 +1503,7 @@ void intel_guc_busyness_park(struct intel_gt *gt)
 	 * and causes an unclaimed register access warning. Cancel the worker
 	 * synchronously here.
 	 */
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, 1);
 
 	/*
 	 * Before parking, we should sample engine busyness stats if we need to.
@@ -4503,7 +4506,7 @@ int intel_guc_submission_enable(struct intel_guc *guc)
 /* Note: By the time we're here, GuC may have already been reset */
 void intel_guc_submission_disable(struct intel_guc *guc)
 {
-	guc_cancel_busyness_worker(guc);
+	guc_cancel_busyness_worker(guc, 0);</pre>
    </blockquote>
    Hmm. I think this is going to need breaking up further back in the
    stack.<br>
    <br>
    We definitely want to be doing a synchronous cancel in the general
    case of disabling submission (e.g. due to suspend or driver unload).
    But if this is happening as part of a reset call stack, then it is a
    problem.<br>
    <br>
    AFAICT, the only way _submission_disable would be called within a
    reset is if __uc_init_hw() failed for some reason. So one option
    would be to add the sync/async flag to _submission_disable() as well
    and just make the init failure case async with other callers being
    sync.<br>
    <br>
    A better option might be to add an 'are busyness stats enabled'
    boolean to the guc structure. And inside the cancel function, early
    exit if the worker is not actually enabled (and set the flag
    anywhere and everywhere that does a mod_work to enable it, which is
    just guc_enable_busyness_worker() I think?). That would mean that
    multiple disables do nothing. So e.g. a failed reset will cancel the
    worker asynchronously in reset prepare but then not try to cancel it
    again synchronously in submission disable. Hmm, except that init_hw
    has already enabled the worker by that point :(.<br>
    <br>
    FYC: Umesh and Daniele... any thoughts?<br>
    <br>
    I would be tempted to say is there any way we can just add a lockdep
    annotation to ignore this issue? The lockdep splat described in the
    patch description above seems like a false positive to me. Sure the
    reset lock is held by the reset code which is now trying to
    synchronously flush the busyness worker thread which also takes the
    reset lock. But the busyness worker thread does a trylock and will
    abort if the lock is already held. So no issue...<br>
    <br>
    However. I think we do have a genuine issue with the internal
    delayed worker lock itself, which has maybe shown up in other
    lockdep splat reports. For example, if a worker thread triggers a
    reset (e.g. anything reset related coming in via a G2H) then the
    reset code is running inside a worker thread. Which is maybe holding
    an internal kernel worker thread lock? So if the reset path does a
    synchronous cancel of another worker thread, that also requires
    taking the worker thread lock and thus a deadlock occurs.<br>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20230607190350.287644-1-zhanjun.dong@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	/* Semaphore interrupt disable and route to host */
 	guc_route_semaphores(guc, false);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------HEhgcsUi7IAv2M4XgRJyjuXw--
