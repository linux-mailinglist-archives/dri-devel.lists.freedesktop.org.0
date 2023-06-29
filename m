Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAB27423D8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 12:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F8410E0F9;
	Thu, 29 Jun 2023 10:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6D410E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688033988; x=1719569988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tjx4jQfHsREV7fNBMKrr4BYHjAyMXdPbNOJ9pANeeU4=;
 b=Ts1amcH4VRGAZQZ4v8/hdF+IjL0ugbiBr25ysIvIyf88kxG7Y4ima9gH
 6vkp0frRmmGvujd/Gz8Sqt9iv4XMWSHM7kwgF0LnnT3L6SndTaVSmb61L
 BTBR8bt2VO74ZKOuJQVb3j2SVs3Qn7oQ5RXShtZ8vJAxHyTXBxHXH03UU
 O5KZofAzMWVC5k9LnFoZtjmFYnXXyNV3ZFeq2LtJGeQUuu+Gn3ukdjVx8
 SvguKvW8EkU0BbdbXvmVKKbLsVo1O2qmAhqhV07SIMCSnmtoZvzfQ5+Hg
 1jfRgn38/v71ozpLpPS9a0W0BrXoCkEvrQsnjnlQmArE5BuEEdL2gfWM3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448452903"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="448452903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963937857"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="963937857"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:19:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 03:19:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 03:19:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 03:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqC4uAtgkt0qjeU2AdRHMuXvh3JFZwr91jKqs1T6eQowtTlmQfXjwC9d2T5FHovtq/BK/Lo29aRjNPHs9D1wNMqwedJf4K76oWswLv36x7uZ5qNRmQI5DYjUA7RQ4q42JHUMeG1RH89wsYeQ3BEdsBcBVgIQf0cvuLGnN2eNnE4z8uZJqfxfoenOrBR2MoI2VUSBY5VeYllNWxI05nqTA2MaLgL8jmYI3J+CGJAHpDOH4WWNsxQq3gH9l/Tbu3S3JRhB8WOuaIbRXdfAGOWytKKhi9BvOv4r92WbtateJgKeE7WewlixhbB9Weu/RSTv9YNWM7fgr+JexOIsmZtRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUr3j26Sj7wiJqycVzf5ZV9jCsneg39ORhb5VMf/P64=;
 b=DrO6a6xmEWU8UyM+0UqKrgQdeyCO9z02tVdwxnqfbkfov0ozG3zzyDUNLAbU2rwfsT++EY0PJynGLOORVqEayb7RH/+zQtPzJeoc1ag83XoNf2vrW/dZ8kLariaLMAcZ8aiBU8OxJjqIPxJ+g9VB/UHQSHgwjD7pybuZbdz39gnVrhexxjenKN2wSfvG0xQc0ML7l7kTAEX4T9hGm9VVF8V9WyfdQXSvMvAVYFflucSzPWqFUMM3RUa+b8MVEDGFabo3y4/kScP/Yfcax9XOEtQH9SyYbtpqycYyhiWK7dv6rE2eOEEanhrcQTZI9QzwdWZPMriR8lYhs5oYzlNHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CO1PR11MB5105.namprd11.prod.outlook.com (2603:10b6:303:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 10:19:44 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 10:19:43 +0000
Message-ID: <8ded6642-2e1e-4d43-aa4e-06bc8959f022@intel.com>
Date: Thu, 29 Jun 2023 12:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <c7c9cdc9f14a3f14efb6cede88a1007c550ffd68.1687779215.git.karolina.stolarek@intel.com>
 <a33ea1c3-cf7f-8e8f-0ece-4b2ef299f444@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a33ea1c3-cf7f-8e8f-0ece-4b2ef299f444@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::20) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CO1PR11MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: 478f590f-33b4-4ada-00e7-08db788a5b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsfPqznU8wYhTmDcHkR7ZvEdQd7++DN6sF+KbudZFC8pEQH/8OwdfmkpkV22QT9996WMLP9sEcan4BB8sQksL7D58/Qlh+ytR1Dz3WV22srLYAV/xxPIkS2xKIJQ3VcInrxuziLe90HoCpGZouYh1YHdESLyVUFiX1bvQ9N7mXt/zCf+QFvithy63/eM2FqNXaV+Cs5BcoZxzGVl3wHGzmxY6gL27xTCZivc0pjF1Xeu7rUSBEysV5XZ+ENgurSXBVzUj2BMsBK6cPYpceN620UKIYIbtyqot8qQvzqumpi6HQ/28XY7ckJk0x8rPD+D5tF9xR56TAqUOY0sLBMJacvTzItlwRl2XBvahvV8s2t2+ockUJfjqrxapSXSCPECJR8mO8y4kopU3xxOoepGsL2El+4vCXgL0PKRiJ6uICSjFvgqC49EUmVakxsfP4+yQyFpdDvkyEuKkt28G8xJ2817UXm3WDL10iwHhPI4XiY79IPscfaKS4UTZ6K4SomK2l7Dye/FfAjkOY1kd6oM4WFN1ceWiMoAYm6p7QkNJhZUiJB+vCwtl4ANFIWh+Y8jQnFjIE04e4YznZdlOvssKr4L/gAUziSc1LdgnMN82axCx51vmO4acRRtuWtthKaoikqgR44FsOXUrQF9S3mGHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(6512007)(66574015)(6486002)(478600001)(54906003)(186003)(26005)(2616005)(6666004)(36916002)(83380400001)(53546011)(2906002)(6506007)(44832011)(86362001)(41300700001)(36756003)(38100700002)(30864003)(5660300002)(31696002)(66946007)(4326008)(66556008)(316002)(82960400001)(8936002)(66476007)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3dyWlhZd2U1Vm9KOHE3WnkwUWNLSXp1OVdKTkRSQkRTQTdwNGlsSFM0Q0xq?=
 =?utf-8?B?eG90S2ZmeE8xV056MjYySU5rTzU2RE1VT1NrdS80MkVaTHMwT3J0UnN4dyto?=
 =?utf-8?B?T015ZnhuRFNJcElOR0FQT2hZMkVkNkJxRWNJYUo5OVZiQkIwMWhuU1AxRGNt?=
 =?utf-8?B?c1M4eFljblB2NmZKOVJ3TFNkL00yaUtYV3JhODdrQmJvUi8yUjhhU1o5YWVI?=
 =?utf-8?B?d05qcDBWeFZ2TEVyZjBocHc4OVpUT0IrUko0NG1KdlhaZUpVei9WR1M1L1px?=
 =?utf-8?B?RzU0aTNqRFVVcnZmWFEzVTdIMWVuRXJOMHJmdGdJeU1MUVh1eXpJTlo3cXZB?=
 =?utf-8?B?R2wxZDhOQ2l0Z2lwTHBHNS9QNzNheEM3MWNHZUJNODV4eTZ2TWd4Q2d5TlVQ?=
 =?utf-8?B?UXF5KzltMXNKckc5ZWpHdmJuQkR0TmorNFkydkNRTzhCcUNiQ0VGSkQvY3Nj?=
 =?utf-8?B?ZHl3QXc2bzNOSll0RytocGJ0cGhSWUVtZ3pRaUVDVm5ESElWT2szaUtQVE4y?=
 =?utf-8?B?UE82S1Z2MkVndmd1YjJkbWl1VFlZd2hVVklkRzdTQTFybnBaUDllUTBUWWJJ?=
 =?utf-8?B?TzI3QlBiNlFYRDYrR08ybEc4cHpmK3RjVzBpWHdEVEw3WDErZTQyTFpyY3lO?=
 =?utf-8?B?czEvR3ZGWFVmVXdnMHpRMXhsaFRJNDBVVGMzNzRqK0psUWwrRHFldE8zdENC?=
 =?utf-8?B?cWtnam1rZDVXTUQ4NUwvY2Z4aktKT1J4ZkZBamJBUWpBZ3dQWTZDWHNMU3RK?=
 =?utf-8?B?Qnc4L0xvOHBlK1RaaWJnN05RUEJlTlRBUGg3Y2FWZ3lzeE5BalB6QjRIZG0w?=
 =?utf-8?B?d21QYk1QK0xRV3pjV1ZHdmpwekhiOHZ1UW1sL1JyYU5Kbld0bVY4amVWdnh0?=
 =?utf-8?B?UXRLUHBKMmtleFRsS2N6d3grMFU1ejV6aWxrSlRjT2FYV1phR3ptdjJSc2tq?=
 =?utf-8?B?Y0pYdXU2cFJpZi81RlBVVUpCS2oyTDJ1VVJ2ZVVWUVF1MEcyM01VaDFvUmYy?=
 =?utf-8?B?NWtPOTczLzhUdHorblJlRVUzZ3U2N0EzVVJadHBLa1VWd2FZV2VITU0wTlVt?=
 =?utf-8?B?aGpWNlRvSTBmN2ZnSTYzekhoR0NhN285YkxxNDJUdG1kOEE4US90cW4vckx5?=
 =?utf-8?B?SkRYUDVYcTYzNUZOK2laZTcvRTdEK09hYWdYNE5oSDdNVzJDcWRYYmpyRWJH?=
 =?utf-8?B?L2F2UE5zL3grU3RKNUQvOTVmQi9mN1AwNmxTVUNIS2RTT0xMVnJXSTZoZ2hh?=
 =?utf-8?B?U1M3U1ROZnVhOWd2ZEhtNE9oVmtJS09WQmZnM05zNzFWNWtjc2dsZWkxbTR4?=
 =?utf-8?B?ME45VXVNT2ZGWVB5NURDMlh2NnVaWjJvT2RJWkZvNVlZV3g3RG12VEZKRjJm?=
 =?utf-8?B?MFNIQlZXaUtlcW9CdFQ4RmJuekVYVGhYM05TOStBekhITHNOMm16amVORmp0?=
 =?utf-8?B?SzNib3dHZVhwLy9KOTF6Y3pENWdmMVRjQVRqWDl2MDZwUEVhZEhJcGxnd09Y?=
 =?utf-8?B?ajFzNDc5blNlaTVkU1hHekk3Zktjai9uNkZSK3JveEE3Vzg4VCsrbVZRRWpo?=
 =?utf-8?B?Wm1BYmpJQ0IwYnZyYldHKzdFUFRoK2JQK0lHTHNRNmg0Tm8yVWZWUU9vK0JF?=
 =?utf-8?B?S0JOQlBEeUJBaEplbTh3bFFZK2RJVzhqQ21lS3MzQlR6TDBjWnVRRkxaK3Ni?=
 =?utf-8?B?M0J2MzZLR0pOa2dtL3RGU0t6VHZPUFVJTlB0YzdQeFYzUVBuSUROU0VDcFJF?=
 =?utf-8?B?TW5oMVdVNVNWZWFISHVaZTFRSzJnMmQwdGZBRTNPWDVrNFlxTXV2QXN5cjRj?=
 =?utf-8?B?YWdaSG51cVpYUFBkNTQ5SjRBTUhxc2FoVlY4REk1NmExZWkveW82emthM0F1?=
 =?utf-8?B?WnZPMG5ESVZHbUFGVW8wdHhiY1luay91MFFMRkNjR1ZSS1ozc0s1Sng5SXBO?=
 =?utf-8?B?bXRHS2JmT2twM3BXTHVPZjFIYWNDYnF0d01Qd3dzN2FISFZIaWQ4dFBQMExR?=
 =?utf-8?B?RlpoMndYZzNLaTN5MldSMWhHemxyRURWRlpwdElBQVREM0lRRXpGa0kvRTEx?=
 =?utf-8?B?c1pGbTJVR2U4a1JHTDdjZ3hkeWVFQUFtdTluY3ZZWUdOYkVCRi9OREI2NmRl?=
 =?utf-8?B?amhWajlPWTZjdk1TcmJwWENkZGlGcVlobVZETGJRTldNNGJnUmduV1F4VmRC?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 478f590f-33b4-4ada-00e7-08db788a5b5e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 10:19:43.8307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gk3DKFHuVwHJ9eCch5cI3JeAjOxv40SRKZz7ms+U/uljyHL1Zu31k7oyeCq6yZ9E66o8bTIveXba0Q3YHdipIuNpUYmh9SE0CS/IY3v9rQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5105
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2023 11:17, Christian König wrote:
> 
> 
> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>> Add KUnit tests that exercise page allocation using page pools
>> and freeing pages, either by returning them to the pool or
>> freeing them. Add a basic test for ttm_pool cleanup. Introduce
>> helpers to create a dummy ttm_buffer_object.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  29 ++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   5 +
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
>>   4 files changed, 441 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>> b/drivers/gpu/drm/ttm/tests/Makefile
>> index 7917805f37af..ec87c4fc1ad5 100644
>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>> @@ -2,4 +2,5 @@
>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>           ttm_device_test.o \
>> +        ttm_pool_test.o \
>>           ttm_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index d03db0405484..6ccd3e858397 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -26,6 +26,35 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>>   }
>>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>> *test,
>> +                               size_t size)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct drm_gem_object *gem_obj;
>> +    struct ttm_buffer_object *bo;
>> +
>> +    gem_obj = kunit_kzalloc(test, sizeof(*gem_obj), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, gem_obj);
>> +
>> +    drm_gem_private_object_init(priv->drm, gem_obj, size);
>> +
>> +    bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +    bo->sg = NULL;
>> +    bo->base = *gem_obj;
> 
> Hui? Why that hack? That is clearly leaking the gem object.

Huh, you're right... I believe that I had some problems with either 
device cleanup or allocs. I'll double-check and see if I can get rid of it.

> Apart from that looks really good to me,
> Christian.

Thank you. I had some questions around testing > MAX_ORDER in v1 
email[1], could you take a look and see if checks in 
ttm_pool_alloc_basic() are correct?

Many thanks,
Karolina

----------------------------------------------------------------
[1] - message-id: b08037ef-156c-0f5d-1fde-e2c55d7655fb@intel.com

> 
>> +
>> +    return bo;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
>> +
>> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo)
>> +{
>> +    drm_gem_object_release(&bo->base);
>> +    ttm_bo_put(bo);
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_fini);
>> +
>>   int ttm_test_devices_init(struct kunit *test)
>>   {
>>       struct ttm_test_devices_priv *priv;
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> index 69fb03b9c4d2..abb8279f18c7 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> @@ -7,6 +7,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/ttm/ttm_device.h>
>> +#include <drm/ttm/ttm_bo.h>
>>   #include <drm/drm_kunit_helpers.h>
>>   #include <kunit/test.h>
>> @@ -23,6 +24,10 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
>>                     bool use_dma_alloc,
>>                     bool use_dma32);
>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>> *test,
>> +                               size_t size);
>> +void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo);
>> +
>>   int ttm_test_devices_init(struct kunit *test);
>>   void ttm_test_devices_fini(struct kunit *test);
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> new file mode 100644
>> index 000000000000..0bc6415c3067
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -0,0 +1,406 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <linux/mm.h>
>> +
>> +#include <drm/ttm/ttm_tt.h>
>> +#include <drm/ttm/ttm_pool.h>
>> +
>> +#include "ttm_kunit_helpers.h"
>> +
>> +struct ttm_pool_test_case {
>> +    const char *description;
>> +    unsigned int order;
>> +    bool use_dma_alloc;
>> +};
>> +
>> +static struct ttm_operation_ctx simple_ctx = {
>> +    .interruptible = true,
>> +    .no_wait_gpu = false,
>> +};
>> +
>> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
>> +                       uint32_t page_flags,
>> +                       enum ttm_caching caching,
>> +                       size_t size)
>> +{
>> +    struct ttm_tt *tt;
>> +    struct ttm_buffer_object *bo;
>> +    int err;
>> +
>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    err = ttm_tt_init(tt, bo, page_flags, caching, 0);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    /* We don't need this BO later, release it */
>> +    ttm_kunit_helper_ttm_bo_fini(bo);
>> +
>> +    return tt;
>> +}
>> +
>> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>> +                           size_t size,
>> +                           enum ttm_caching caching)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct ttm_pool *pool;
>> +    struct ttm_tt *tt;
>> +    int err;
>> +    unsigned long order = __fls(size / PAGE_SIZE);
>> +
>> +    tt = mock_ttm_tt_init(test, order, caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +
>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +
>> +    return pool;
>> +}
>> +
>> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
>> +    {
>> +        .description = "One page",
>> +        .order = 0,
>> +    },
>> +    {
>> +        .description = "More than one page",
>> +        .order = 2,
>> +    },
>> +    {
>> +        .description = "Above the allocation limit",
>> +        .order = MAX_ORDER + 1,
>> +    },
>> +    {
>> +        .description = "One page, with coherent DMA mappings enabled",
>> +        .order = 0,
>> +        .use_dma_alloc = true,
>> +    },
>> +    {
>> +        .description = "Above the allocation limit, with coherent DMA 
>> mappings enabled",
>> +        .order = MAX_ORDER + 1,
>> +        .use_dma_alloc = true,
>> +    },
>> +};
>> +
>> +static void ttm_pool_alloc_case_desc(const struct ttm_pool_test_case *t,
>> +                     char *desc)
>> +{
>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
>> +          ttm_pool_alloc_case_desc);
>> +
>> +static void ttm_pool_alloc_basic(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    const struct ttm_pool_test_case *params = test->param_value;
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct page *fst_page, *last_page;
>> +    int err;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int expected_num_pages = 1 << params->order;
>> +    size_t size = expected_num_pages * PAGE_SIZE;
>> +
>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +
>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, params->use_dma_alloc,
>> +              false);
>> +
>> +    KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
>> +    KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>> +    KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>> +
>> +    fst_page = tt->pages[0];
>> +    last_page = tt->pages[tt->num_pages - 1];
>> +
>> +    if (params->order <= MAX_ORDER) {
>> +        if (params->use_dma_alloc) {
>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
>> +        } else {
>> +            KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
>> +        }
>> +    } else {
>> +        if (params->use_dma_alloc) {
>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>> +            KUNIT_ASSERT_NULL(test, (void *)last_page->private);
>> +        } else {
>> +            /*
>> +             * We expect to alloc one big block, followed by
>> +             * order 0 blocks
>> +             */
>> +            KUNIT_ASSERT_EQ(test, fst_page->private,
>> +                    min_t(unsigned int, MAX_ORDER,
>> +                          params->order));
>> +            KUNIT_ASSERT_EQ(test, last_page->private, 0);
>> +        }
>> +    }
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    const struct ttm_pool_test_case *params = test->param_value;
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_buffer_object *bo;
>> +    dma_addr_t dma1, dma2;
>> +    int err;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int expected_num_pages = 1 << params->order;
>> +    size_t size = expected_num_pages * PAGE_SIZE;
>> +
>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +    err = ttm_sg_tt_init(tt, bo, 0, caching);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +
>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>> +
>> +    dma1 = tt->dma_address[0];
>> +    dma2 = tt->dma_address[tt->num_pages - 1];
>> +
>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
>> +{
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int order = 0;
>> +    size_t size = PAGE_SIZE;
>> +    int err;
>> +
>> +    pool = ttm_pool_pre_populated(test, size, caching);
>> +
>> +    pt = &pool->caching[caching].orders[order];
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>> +
>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
>> +{
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>> +    int err;
>> +    enum ttm_caching tt_caching = ttm_uncached;
>> +    enum ttm_caching pool_caching = ttm_cached;
>> +    size_t size = PAGE_SIZE;
>> +    unsigned int order = 0;
>> +
>> +    pool = ttm_pool_pre_populated(test, size, pool_caching);
>> +
>> +    pt_pool = &pool->caching[pool_caching].orders[order];
>> +    pt_tt = &pool->caching[tt_caching].orders[order];
>> +
>> +    tt = mock_ttm_tt_init(test, 0, tt_caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>> +
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
>> +{
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>> +    int err;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int order = 2;
>> +    size_t fst_size = (1 << order) * PAGE_SIZE;
>> +    size_t snd_size = PAGE_SIZE;
>> +
>> +    pool = ttm_pool_pre_populated(test, fst_size, caching);
>> +
>> +    pt_pool = &pool->caching[caching].orders[order];
>> +    pt_tt = &pool->caching[caching].orders[0];
>> +
>> +    tt = mock_ttm_tt_init(test, 0, caching, snd_size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>> +
>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>> +    KUNIT_ASSERT_EQ(test, err, 0);
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>> +
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_free_dma_alloc(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int order = 2;
>> +    size_t size = (1 << order) * PAGE_SIZE;
>> +
>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +
>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>> +
>> +    pt = &pool->caching[caching].orders[order];
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>> +
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
>> +{
>> +    struct ttm_test_devices_priv *priv = test->priv;
>> +    struct ttm_tt *tt;
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int order = 2;
>> +    size_t size = (1 << order) * PAGE_SIZE;
>> +
>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>> +
>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>> +
>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>> +
>> +    pt = &pool->caching[caching].orders[order];
>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>> +
>> +    ttm_pool_free(pool, tt);
>> +    ttm_tt_fini(tt);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>> +
>> +    ttm_pool_fini(pool);
>> +}
>> +
>> +static void ttm_pool_fini_basic(struct kunit *test)
>> +{
>> +    struct ttm_pool *pool;
>> +    struct ttm_pool_type *pt;
>> +    enum ttm_caching caching = ttm_uncached;
>> +    unsigned int order = 0;
>> +    size_t size = PAGE_SIZE;
>> +
>> +    pool = ttm_pool_pre_populated(test, size, caching);
>> +    pt = &pool->caching[caching].orders[order];
>> +
>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>> +
>> +    ttm_pool_fini(pool);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>> +}
>> +
>> +static struct kunit_case ttm_pool_test_cases[] = {
>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic, 
>> ttm_pool_alloc_basic_gen_params),
>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
>> +             ttm_pool_alloc_basic_gen_params),
>> +    KUNIT_CASE(ttm_pool_alloc_order_caching_match),
>> +    KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
>> +    KUNIT_CASE(ttm_pool_alloc_order_mismatch),
>> +    KUNIT_CASE(ttm_pool_free_dma_alloc),
>> +    KUNIT_CASE(ttm_pool_free_no_dma_alloc),
>> +    KUNIT_CASE(ttm_pool_fini_basic),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite ttm_pool_test_suite = {
>> +    .name = "ttm_pool",
>> +    .init = ttm_test_devices_init,
>> +    .exit = ttm_test_devices_fini,
>> +    .test_cases = ttm_pool_test_cases,
>> +};
>> +
>> +kunit_test_suites(&ttm_pool_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
> 
