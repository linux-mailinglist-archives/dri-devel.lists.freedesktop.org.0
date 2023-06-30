Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5175743A6E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A397510E44E;
	Fri, 30 Jun 2023 11:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09810E44E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688123411; x=1719659411;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zpjE3DPPWt9wrBYfsyksG78T/mcs2hYUBILG8zAs/Yk=;
 b=gXfsP0DR5cNXaZ0H483A13yYd29sWaj6EbFu16mii/a3zle4peQrBYIz
 ZDJ3J6Un3qhc6hEpWREhbTRpJv3W3KDWgnE0DTfy/P9HgyhmpQxSIhEYf
 8ChmhwYDkKJN+08Px7WlUL8SwYXMO1jqkbyUOwaUPWekXAdkiiT2wtMsR
 6v0pEOdFL+n2+K6nR6azLhbxzFSwwt4PKMqJGr7yvSjbj5JFsAt8UCaam
 fa6a4J6kGAkYD8nqRR8cgGZm9DguhA8XUdn7U6E5T4YTdYlKN7hFtqdan
 773EDpo2mboz1QugXY0/aGGaRJlbJ8Sh8DbNFbjU4HwVcveljHEAPHiR9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352193778"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="352193778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711783519"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="711783519"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 04:10:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 04:10:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 04:10:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 04:10:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 04:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUuUsOaqeQC8R+Fcwpj5GMXB9cxbASAnZhY6BG03WwTU0wxbCI4oCOjxFJF8ncl3+DfcCmEGnvvfDJQN51B0zLX1DZzNO0cew7Ht/9b+rXI5X240bQYdvvFUmsHYboSse5agUWTwFqWFtirije9F83B8Ke3QpTK9NM0ijad6CUBs99FoyMv1MV+3gAvr65Uwr3EdGQ4QiPK7owVnxLhF7H7H8dfISwGO90OBeToOroe8rtDfZxkqU3kRTnTsgX7dDdUf1q292ZotH0nBj2eY61J3aHhc3XUq/wE0N8hMkPxvXmguEDlPk0NNFprqw4Fa2RU98K+FCkb8lF/CmRnAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj7RGBNWyMVcr57P/hM+Fye7Sviw8cEbiT0Uv2PqZTE=;
 b=M/WrSmrE55+m15i6aMcbffpdm7lM2wBD7+H5VK8jqll6SKPSyRPqHhiJKIrCmNh67hCtqzxnVpggfrk67uxUhpEqke4Gg9j/J0mlWVkUg9o4uZBoOi/iMgQe9VNWlnBdSG7b1fdo2BHZt3m4+x2vVVPwrzcbWX9gIPdLIxte+eU194gAAy/8tR+blnBSnhzGAnDxPiiGMDugpa3lhCJIhWL5I4HS25+6M3Ytp2vUhhfERqfqY+QP2PV6Vp1mvUPjcjZL1opCOx+7dVWMKo/jCmIAZrgJYtqdF0SwEyi9gYltB4aykp+OSLAYW6QHLrdw/c7Io2sfUjnNCR/pWx5tHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by SN7PR11MB7490.namprd11.prod.outlook.com (2603:10b6:806:346::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Fri, 30 Jun
 2023 11:10:06 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 11:10:06 +0000
Message-ID: <b3b882de-1c41-8521-efc6-dc8f2a2798af@intel.com>
Date: Fri, 30 Jun 2023 13:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v2 1/3] drm/ttm: Introduce KUnit tests
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
 <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
 <2721d944-804d-929a-5d63-5119339bdf5b@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <2721d944-804d-929a-5d63-5119339bdf5b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|SN7PR11MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: df6efbe8-ca63-4f58-b2d9-08db795a8ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kpF3WmXa0kiemxNjAiMvRDx539Nfh9a3uX5D8eEAd9MJ0j7DALYHwLudOSUmNntobJwCmSoPkVHLWnkih6wzFK7R4NM5SyEk7GUnxzp8PQwcdBjmhUeRwoNKQJ/VAnBlIlojN9G6+o1l0hJwF/4c8H0LfjNlAzwy2cR0Ow3i3RAVDcrSBWecuPc2ueBGKm1OZU8ZQp0iYyecT0JB7RnqYFqUHk+Nail8lg9SNEJD9lfKNxsIwCfTPRZAHV8Jn2EYh6W0oJcNURL98D8G7UpM/ZN86gVLf/RL1Cm0uT68OkaAYaois/Ds/+jlXcif+q4eAc93TKrbjLqHmtGBCPG0Zoh+6gHKuvmvizrwiqmXZn25ylT1ZRb6vdHNkqrwcQ2lu7mOPvdfWVgzPlg5PGdIeBQoSpyzc1cCMJ8O5ZL/8m0f014aQDsHNFOI7QOJEMONHD5qdmMV1XNH/e52AWHcgYNkoCS1+QQ8id1mCEXFRyFtIaXAJKIMe18KnGuRZjOhXaNR2sHWUuN45OahJ5ql7i1dMmZXvOicq4F3N9KutY1tjJ8AjvYxRIfmjRZoia++EbQALUEC2Y8SEd51n+6xhiOoPfxth+hLLK/VohreWidZWVBvfzsUuK8iS5cwfmKs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(66899021)(5660300002)(31686004)(44832011)(66556008)(66946007)(316002)(36756003)(4326008)(478600001)(66476007)(6506007)(8936002)(8676002)(86362001)(2906002)(6512007)(26005)(966005)(54906003)(31696002)(41300700001)(6486002)(6666004)(186003)(36916002)(53546011)(38100700002)(82960400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3RQSUVHZm9EUmNaM0NYNGFmeHJrOWxxL3M5UUpCSWxTbkw2cXBQVkNCVUVV?=
 =?utf-8?B?ZUFyeFIvNnc5UzhrZVM0aGgxSkZrZHpHUjdVTGpQcCt4T0hWSUZ1WEJLc2JQ?=
 =?utf-8?B?OUtmdVQzZGZWMzhSUUJOYStuVFBPTDYwWXhBNUpLTy9YTlk3SmZNM1htKzJ3?=
 =?utf-8?B?K3FiTklpemQ3TFREK3NaNkEvaHQ5aWM3dE4wTjZ5bVRTcU5ySjZBcXg0Vmh5?=
 =?utf-8?B?dkNVZDZkdUJNN3VQY3R2VTU2Z3oyMFZCekt3OU9pUlhHMkJKQllhOEptUHNw?=
 =?utf-8?B?bmhOaHU2Vis2OXBaMllDVU02ZThjZUZhaDBiNTJPVDZYQjJNNkZXRVE2ZHJr?=
 =?utf-8?B?Y1BSdGVzeWw3TVBmK0pOeHFuMkp1Nnc3VEszNnVGNGdMK1Rubzg3eUZPOFJD?=
 =?utf-8?B?QSthYVYxYXNVaXgzbjdDdjJBRGR0d0d5TENRSkdWNzZMQzFRbGNJU1pkNEtL?=
 =?utf-8?B?azgvcHJqYTlJMU5yWGJUR3JvWEtIR2ZuVXo3QjR0bXlha0RWSTJjMnNncVJt?=
 =?utf-8?B?TG5BZlE3SmFKYmpLbXgxMkRXWWxza2xIRWJrdTE4aEZ4WG55Z3g5TFBRLzBK?=
 =?utf-8?B?SnZYN0pObE02YStoY2t5elUxWjRYY3RMUlZQamQxZTBldDlWY3NiUTBCVmtG?=
 =?utf-8?B?NnFGaENrVFBnTitWQWV4emY1KzlGSmRjd3VIRUxBUkY0elNlbWtYRVNZYksz?=
 =?utf-8?B?Q0N3V3FOSXhmUVorK3VoUHFuUEFxOW5RMC9Idm1qdkNieUl4aUluWnZsS1pz?=
 =?utf-8?B?QTlDb2c3R3JrM1FkazIrQTFNZWNkTTVIbEQ0dnJYeXVlYUVGSW5OaTFMcFFD?=
 =?utf-8?B?dTJMVnl5N0czaURNQ1JTUTcwOVhjZ2I4TDFIemlsRERWaE0yazd5YU9lUUVW?=
 =?utf-8?B?OG8zWitSNGJjbHdYdTlWUG12SHROdlYyOEFYRWJJb0J6K0ZFQ0haNitDM2Rj?=
 =?utf-8?B?aURsZGpDY0s1SGR3dHVBVnBHa2c4bDM3VmMvVmlGUmlEaXZLSzA4N1lVT2xB?=
 =?utf-8?B?WG5jcU5Oc3ZITHRoYk9qWHNzRnNJaUhKZE5JNFUveUdLUHdPb1JDd2oveGtp?=
 =?utf-8?B?K0pRbk8zdGw3WjlGVytPQkZ1aGFoWDIwNGJrS2ZFV2Q2czRhNnVQNWRJeUNh?=
 =?utf-8?B?MkNVcm1pMGV0QmlTbjNnbHlSenRVRnJvWElpbFF1ZFFYQXMyRzJ5NnVTNWd1?=
 =?utf-8?B?WTFNckdEUlNwR3FCWkJJY3VhNGYxVUZjVXZ5WlhyMzdGOERINXNRQVkzWS8v?=
 =?utf-8?B?dnVoQWFtN0pXMjZ1NnAwR1BmZGFVZnF2WWNJeUk0ZE5idzYyczNvWWozcjJp?=
 =?utf-8?B?OThGRldFTlRrUWxLbndrK3RaVG8yRU5tL1FaeTdZbncxamdJUVppcHlXcnVE?=
 =?utf-8?B?c0tibGQrcnVSS3BHSU8zTmpRVldIdmdQSVd5bmVQMUFLbGEwbjRsQ2xkSlY0?=
 =?utf-8?B?OTRKeW1BdnptVEkvckxwaGg3dlFFVnNKUjRqckRHSXY0VlZpMkhCOUluNkNv?=
 =?utf-8?B?SDg4dlYzOGJnWE16UXp3bzlZVDVsVVVOY29oU2NuM3BHZkdUZVJ0NkREUGVV?=
 =?utf-8?B?SENxWlRpTUtITFl2YmN1ZGk1SEJLaS9xbGQ5WTB5bFdEL2lqcEFjTzJzdkh2?=
 =?utf-8?B?NEVKSFUreW9mNlpPUUR2MWdwVll6aVBVcUpTSUNvSTJMVWpybVZHWXFtNUsw?=
 =?utf-8?B?ckhDL2pId0UrbFR0ck41US9BMnp2ZmVHKzk4RlAxK05aeDJBaWFpeGxzdHY0?=
 =?utf-8?B?QUsyVUg5cHdSaXFFRWRRYUhBNE5oYTJVazc2b2Z6bHBZOFIyUnRWNGpIM3BD?=
 =?utf-8?B?SmVwM1dmd3VBN1RuL3U1enpSQkplb1ltMGlqaGVnRm1rR25FcU1CdHU2ZTBO?=
 =?utf-8?B?RTY0dVVpWTlkaW90TUFGZFlEbEF2TnhRZ291Q0NMM01uVG1zRGVIWVFVS3ht?=
 =?utf-8?B?NEhSMXYyWC95dlBmTHJwbVQ0d1ZNUGxDL3RqeGlBQ2pLOE5uVEl4aFZUYmMr?=
 =?utf-8?B?Qit2elhvdVFOZ0JNb1lSNlNJUWVZSGpHNmFYcTlMMFRDU0RRYXZPd29wT3dp?=
 =?utf-8?B?ZjBraGY4WlhkM3RHUENNMWtBRXVEWjVRQ01IbEhtRGtmTTEwZlJHeG9jVjcx?=
 =?utf-8?B?WE5OTEpmR2pSbDlvRGR4Q1NETU0yS1RGSWlMRGJ6TGpGMy80THZiRGpDMjFH?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df6efbe8-ca63-4f58-b2d9-08db795a8ec5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:10:06.6056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijMBsIsVQqweklpwOSttIbKwJ4Ga2o7MQm3yB0at+gwoMTuith13Jat3JAXR+a1TpUtif7f5OvpVA+fkKNZdHfmoHJsM+q95450Wjh10+io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7490
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

Hi Christian,

I'm taking a second look at this, and I wonder what would be the benefit 
of combining the initialization of device and ttm_device. (drm_)device 
can be initialized indepedently from the test params, so we can utilize 
.init and .exit callbacks offered by KUnit[1] to prepare and release the 
device indepedently of our setup. If we were to change it so ttm_device 
is also initialized there, we'd have to manually call init/fini in every 
single test. What's more, ttm_pool tests don't depend on ttm_device, and 
I can imagine that some structs can be tested in a similar way.

Would it be fine with you to rename ttm_kunit_helper_alloc_device(), but 
leave its definition as it is?

All the best,
Karolina
-------------------------------------------------------------------
[1] - https://kunit.dev/third_party/kernel/docs/api/test.html#c.kunit_suite

On 29.06.2023 12:05, Karolina Stolarek wrote:
> Hi Christian,
> 
> Thanks a lot for taking a look at my patches.
> 
> On 29.06.2023 09:50, Christian König wrote:
>> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>>> Add the initial version of unit tests for ttm_device struct, together
>>> with helper functions.
>>>
>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>> ---
>>>   drivers/gpu/drm/Kconfig                       | 15 +++++
>>>   drivers/gpu/drm/ttm/Makefile                  |  1 +
>>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 ++
>>>   drivers/gpu/drm/ttm/tests/Makefile            |  5 ++
>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 +++++++++++++++++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 59 +++++++++++++++++++
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 29 +++++++++
>>>   7 files changed, 167 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index afb3b2f5f425..53024e44a2d5 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -194,6 +194,21 @@ config DRM_TTM
>>>         GPU memory types. Will be enabled automatically if a device 
>>> driver
>>>         uses it.
>>> +config DRM_TTM_KUNIT_TEST
>>> +        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>>> +        default n
>>> +        depends on DRM && KUNIT
>>> +        select DRM_TTM
>>> +        select DRM_EXPORT_FOR_TESTS if m
>>> +        select DRM_KUNIT_TEST_HELPERS
>>> +        default KUNIT_ALL_TESTS
>>> +        help
>>> +          Enables unit tests for TTM, a GPU memory manager subsystem 
>>> used
>>> +          to manage memory buffers. This option is mostly useful for 
>>> kernel
>>> +          developers.
>>> +
>>> +          If in doubt, say "N".
>>> +
>>>   config DRM_BUDDY
>>>       tristate
>>>       depends on DRM
>>> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
>>> index f906b22959cf..dad298127226 100644
>>> --- a/drivers/gpu/drm/ttm/Makefile
>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>> @@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o 
>>> ttm_module.o \
>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>   obj-$(CONFIG_DRM_TTM) += ttm.o
>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig 
>>> b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>> new file mode 100644
>>> index 000000000000..75fdce0cd98e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>> @@ -0,0 +1,4 @@
>>> +CONFIG_KUNIT=y
>>> +CONFIG_DRM=y
>>> +CONFIG_DRM_KUNIT_TEST_HELPERS=y
>>> +CONFIG_DRM_TTM_KUNIT_TEST=y
>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>> new file mode 100644
>>> index 000000000000..7917805f37af
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>> @@ -0,0 +1,5 @@
>>> +# SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +
>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>> +        ttm_device_test.o \
>>> +        ttm_kunit_helpers.o
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>> new file mode 100644
>>> index 000000000000..08d7314b1e35
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>> @@ -0,0 +1,54 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include <drm/ttm/ttm_resource.h>
>>> +#include <drm/ttm/ttm_device.h>
>>> +#include <drm/ttm/ttm_placement.h>
>>> +
>>> +#include "ttm_kunit_helpers.h"
>>> +
>>> +static void ttm_device_init_basic(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    struct ttm_device *ttm_dev;
>>> +    struct ttm_resource_manager *ttm_sys_man;
>>> +    int err;
>>> +
>>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>>> +
>>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>> +
>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>>> +
>>> +    ttm_sys_man = &ttm_dev->sysman;
>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
>>> +
>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
>>> +                priv->drm->anon_inode->i_mapping);
>>> +
>>> +    ttm_device_fini(ttm_dev);
>>> +}
>>> +
>>> +static struct kunit_case ttm_device_test_cases[] = {
>>> +    KUNIT_CASE(ttm_device_init_basic),
>>> +    {}
>>> +};
>>> +
>>> +static struct kunit_suite ttm_device_test_suite = {
>>> +    .name = "ttm_device",
>>> +    .init = ttm_test_devices_init,
>>> +    .exit = ttm_test_devices_fini,
>>> +    .test_cases = ttm_device_test_cases,
>>> +};
>>> +
>>> +kunit_test_suites(&ttm_device_test_suite);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> new file mode 100644
>>> index 000000000000..d03db0405484
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>> @@ -0,0 +1,59 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#include "ttm_kunit_helpers.h"
>>> +
>>> +struct ttm_device_funcs ttm_dev_funcs = {
>>> +};
>>> +EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>>> +
>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>
>> Since this function is only initializing the ttm device I think we 
>> should name it ttm_kunit_helper_init_device().
>>
>> On the other hand I don't see a good reason why it can't also allocate 
>> the device.
> 
> I believe that's a leftover from times when I thought I'll reuse DRM 
> device between the tests. No problem, I can put them into one function.
> 
> All the best,
> Karolina
> 
>>
>> Apart from that looks like a good start,
>> Christian.
>>
>>> +                  struct ttm_device *ttm,
>>> +                  bool use_dma_alloc,
>>> +                  bool use_dma32)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +    struct drm_device *drm = priv->drm;
>>> +    int err;
>>> +
>>> +    err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
>>> +                  drm->anon_inode->i_mapping,
>>> +                  drm->vma_offset_manager,
>>> +                  use_dma_alloc, use_dma32);
>>> +
>>> +    return err;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>>> +
>>> +int ttm_test_devices_init(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv;
>>> +
>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>> +
>>> +    test->priv = priv;
>>> +
>>> +    priv->dev = drm_kunit_helper_alloc_device(test);
>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
>>> +
>>> +    priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
>>> +                            sizeof(*priv->drm), 0,
>>> +                            DRIVER_GEM);
>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_init);
>>> +
>>> +void ttm_test_devices_fini(struct kunit *test)
>>> +{
>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>> +
>>> +    drm_kunit_helper_free_device(test, priv->dev);
>>> +    drm_dev_put(priv->drm);
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> new file mode 100644
>>> index 000000000000..69fb03b9c4d2
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>> @@ -0,0 +1,29 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>>> +/*
>>> + * Copyright © 2023 Intel Corporation
>>> + */
>>> +#ifndef TTM_KUNIT_HELPERS_H
>>> +#define TTM_KUNIT_HELPERS_H
>>> +
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/ttm/ttm_device.h>
>>> +
>>> +#include <drm/drm_kunit_helpers.h>
>>> +#include <kunit/test.h>
>>> +
>>> +extern struct ttm_device_funcs ttm_dev_funcs;
>>> +
>>> +struct ttm_test_devices_priv {
>>> +    struct drm_device *drm;
>>> +    struct device *dev;
>>> +};
>>> +
>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>> +                  struct ttm_device *ttm,
>>> +                  bool use_dma_alloc,
>>> +                  bool use_dma32);
>>> +
>>> +int ttm_test_devices_init(struct kunit *test);
>>> +void ttm_test_devices_fini(struct kunit *test);
>>> +
>>> +#endif // TTM_KUNIT_HELPERS_H
>>
