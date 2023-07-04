Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C5A746A86
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D89210E29A;
	Tue,  4 Jul 2023 07:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBF810E295
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688455428; x=1719991428;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gyr+TZOTfdwwYvRS70VKilnLrs2d6X+3RV+haTz4rxg=;
 b=AhaxPXICHoJo2uGIto64v7I+WiM/hA8UulJVibbi0Uh4YsgFwI5/+Wku
 bcCVTPO+5vM9qexa9iQBTBsgRVQGO7CmmUzOab8itJyrz2oPG+ycXXmcW
 Cai354Con8QIS20kLbmLMrJLe76hep+RScHxJC8qipOPB+9XwmGU8/S8k
 M0JIJ50qqDjtca8lgSlcn30QoJL/OwiM6ffSPcgED8L10Jv397q/1entz
 4sBJwMJDi58oTtSS3wZECT0LY3voMKsGzJlnMfieTYUZDz+pFkF/7BBZ1
 O6oPH4vugS/v+8wr9S+olCiEyJQ+ye/UGZ7VFQxrI+mUEUXrTtWo6hm3l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365624738"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="365624738"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748336855"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="748336855"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 04 Jul 2023 00:23:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 00:23:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 00:23:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 00:23:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zdf7jv/jEd7V36gUyXkANt+cAbeF216Te9WZMsOT7tLM/8v9fvvr05vn3kh3ASBRuLuizNRrohaEonHouYzTfLwaCDKlbu5VodTqdQ60XJ+348wbXJvxY7l2CrWa+YoRQ+U3Ded7UdWI2q8uLOvi/lp7leNpi+sDsOiGHzcES8Hh/Tl4Dbcptw7CB5Szhvcg4+FMBpHAS+T5GTSV4zRMHZTCE5IJKZGpSHlB9Tla38rR6gz8zQpSCaAtW9Fd5fex50mOv9HaWvh1u8rQzdJWlTczip+YFsqDqepIWBsup9ZhmeahHXAO+CEd0v/ch4nlk100bbaCkQVk747xitbDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL0rdiyvKYgOkuQlU63PfIAaqejghDDVNaLkpEBAVEc=;
 b=jDNgzPSUD7SOp9EkzESVeFxYPp8CGD2IdHjd9WwuSdZs5nvIzsfMIsmoqfcy9SGp+sDtTyc7Z8ZDPRJ5PAAHv1/g95b4Yg0eoO/8aq+5YV31dJvEpCF1hm2kxCdk3Si3SYj/7dTujUo9f4ytBLEtPnqH4Z6DsUykohiaZtLcOt7X8jNv+BP60m5+LaetS3cD0Qo6qbQUeFjsT7H1KmWqDHbCJnSN72jXI6rJQQahbpa1aBW+AmuA8XkXmEOkU+h86n9OvKzf9NaMq5yWQq2bXm5RhmDCaNEjCy6AWbga2IvO1QndU5wCVR3J6SxHYrwCt9aDS7XgCDoOEtfVpFK21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 07:23:38 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 07:23:38 +0000
Message-ID: <5d488a7e-d784-fd13-f4b9-fafc44234d01@intel.com>
Date: Tue, 4 Jul 2023 09:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
 <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
 <13fb6ee2-d157-7e1e-90ae-b1828e5a2745@intel.com>
 <21035a4e-daad-3928-1535-3d58bc82564b@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <21035a4e-daad-3928-1535-3d58bc82564b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::7) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: eba4ba94-1dfe-4ae4-1e1a-08db7c5f958c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: djPg4btgLuQ+ymMzgTJflv4kx+T4zoEcqjuv4yOwhJrc4BaS7b3yypplvrgSFI4nJkEM1YB+bL5qtL6cjVDIIXqVD5lhHk4nEkjdpw465aNeRk/C7egxQc+BVdbJddvaRseWMdtFN5UK3XdW4gLzvPX7MoDWxvW1Q4yuQuT4CmhI6ZZ1rSs+od+cHiGT1cVgx4U/rlZM28iXOlPGKo0t420GR63b2oKcx50TobMlyFJxMQKu/Lvag+kU7DtrDIrzYsXb/CL86bqow73Asnb3+v+YgiwNcbHJa4AJyHZ3e/B9hPHZ+yx9cKm/QGqSicdCLodhdG+HQRjpXZRWQT1PxLZaWeub+krr+UJsM/CUOZNYxjOOTvNFHUk1yy/ws5l1GcPG3tQ4AattyDhsY5dfttYuKbT8ai0ADyvltpj+3g0XW5Haxsm6dWg9shUk9ytLju86XTVCFqmBZtwr8K2aCvbmuvE5KqV2ciAgpJNHzhMTwZjWfQ1GhVnF67MgTrYKyG57q3IJOxQb8Wsqct8ZlkpYZ3sOPArPL4uOGdXtnEGXxHYxJqWe2ID8Nz0tsLey9RJ+J57Y76FpJG1R+BITHlk/POZjP1R8Hb3paNLW1T4ONAtUJl+SK338JILt884sVcZFX9r+PPE5uhTBG0SUEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(30864003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(44832011)(36756003)(86362001)(31696002)(186003)(2616005)(82960400001)(478600001)(31686004)(26005)(6512007)(6506007)(6666004)(6486002)(316002)(36916002)(66476007)(4326008)(66946007)(66556008)(53546011)(54906003)(38100700002)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWRpc1ZmMzBSVU01bWo4dGtjM1NGaWFZamhKRWNpSTR2M0hVYjZHYTAxOFBm?=
 =?utf-8?B?TEsxNlZIelhObTlUTW9rcVY4ZnpDWWpOUGJLMm9DMk5tcERnenhSaGJSZTdI?=
 =?utf-8?B?MVkraUQ3TThuSUtvWXk1MW41WWxvc0sxSTVicmUxeDBGWGN2ZUI0VHVHK2x0?=
 =?utf-8?B?UGNNYzlCejdxcGd2VDdJaE9UZnNJdXlOMUJsRTJxZ2Z4eVFGTmNBd01VRGtO?=
 =?utf-8?B?TFIzNU1ucDY4STRXTndJY25yQ2dZNk9VT2xqWk42eWQzT0Zsc014dGZVK1Jt?=
 =?utf-8?B?QTRhbzhnWEtXZ2pPbnl0bjYrMWZCZlNRNVl2a0Jvd3JaQU1GZ214akwrRjZX?=
 =?utf-8?B?RUYxbTM2Q2liOVpMVHBoSWlSMllOMVZ3eFUvK0lKdE51MnFGVlVIbEJtNUNi?=
 =?utf-8?B?RnpPbmtDSzNSTEMxbjhnZEJZaTZDZ0EreGlmaVhhdS9qR0tLNGxjc2FuV2M5?=
 =?utf-8?B?OG9MblEyOERSOG9nR0thOVhNcUhiaGp3UC9KdG1nQlo3QnRkbEZ2Uk5TbXFq?=
 =?utf-8?B?QmNwM0hsZnVJZEdrWkJNUTc5bnhZY0xNQmNZNTEwZElXQ0dzWG1hU1RqZmJW?=
 =?utf-8?B?bUFHeUYxL1VGcmdqNjc4VFlPTUlqa2JiMWNYamV2MDBtOXV3U0paaFF6Z1Nn?=
 =?utf-8?B?SHA5Zi9VTk4vWmpoWGQ1ekNCMTVIMkFtTjNBR3o0TExxM2dKMlZvMjJiWmRZ?=
 =?utf-8?B?NVZCUVFYYmVRbmxwemk4cjdPNjJIb3J2TlRQSDc4OHJ2ZXFLeFlYenJDVDhz?=
 =?utf-8?B?NTJwTHJZYTNleXpCRG9xWmM4T0NzTDRTUjBUOHZuVTQvZEVpUEVvcitjZVk3?=
 =?utf-8?B?bnpYVUtqcWs4aC9KalJVUWNKdmswWGZ2QXljUGZmbGRJUFlDRFYxWHE4QkxG?=
 =?utf-8?B?cytiY3ozY1FJVDJZaWNOK1EyZTF1OE02cFdzaDVXbFgycUJNaWNtaVB5cit4?=
 =?utf-8?B?c2lHbEtlNmw0T0pZRnhtcCtOdjRDalVRY0ROTVViMzlyaFZmVThOZkNHaFoy?=
 =?utf-8?B?OGZwUHRRcVJ6ZFFtUUIxUWpHYWUrbS9haEJOcm5CSXFoOG1yb3Q4bk5tQWNN?=
 =?utf-8?B?K0RXTzdPVFJsS1hxeUlOaWpKczlQWU52cTYxaGJEK2F2dlorZGwrdEc3cFZD?=
 =?utf-8?B?SnVZY0xEUk9ObS9oU3c5OHp3cTJzOEI2M2dlUjBuZHdDck9DekErUjczb2dn?=
 =?utf-8?B?YWdTT1BqTWZkTEJXMWx4bnMzNEt3QzFyYzZMZkVDRm1VMTI4NmlhNnZBZDNZ?=
 =?utf-8?B?YjR2TUdTMmpKMS84K25aZzdRWi9pUS9OL2pJdGx3NDNBRVhOeWk2QlBCVUJt?=
 =?utf-8?B?MWwweEZmQmVhMi9yZnprbkttZTRKKy9zeFRod20vaGdRTnhMVEllVyt6N2pD?=
 =?utf-8?B?cjV5ODVGT2xyZ1hTOGtCcWEzMVVuY1RISWhmQlJFaGg0R2tJTjBkMW5VZnZn?=
 =?utf-8?B?ZFRFaUdMMmdneTQ3VDJlUy9PVVJ0OUg1R2JYRzcwK285OVNCaERKL2J5Y3Zn?=
 =?utf-8?B?NFFPMnBrcGZPUlR4aWVGSGtwbUZQN3dJVmxmREhGazRiczRUU2xpWXlFMjRG?=
 =?utf-8?B?TDNzNUI3OERIWWdQVVN1WGhyTkpnMDI2emttSUM4L2pJTUZYTEZEZnZudUFh?=
 =?utf-8?B?YmhQbkFXTGVRVkhhNzE5UXZ2V0RWdTFERmtjelVpMVhXTCtJM1FHZElVN3Ry?=
 =?utf-8?B?eDA5aVBpTnNNcEx3bXVwWS9PZ1VuU3VnVkdtc3JCTDFkTFBXUWtvK3JjSHYv?=
 =?utf-8?B?QjRpTSsveE5BVFZpNS9IcTR4V3VlSDQrRTNiU3c0cjk3dFRrOXMxcjRBV2Jo?=
 =?utf-8?B?a0ZMcUJjaUd0WlREYlZwcHNUUVB2ejZHL2R4VnRwWStjMXZVaE1NU0pyZFFa?=
 =?utf-8?B?bTd6OW02NnM3MnNPSjVzSlFaUllROHZLQTVzOURGWkV3dElZcTBoU0phYkYy?=
 =?utf-8?B?b21WNFFoQkZOb2g0WmtJL1pUNTRQTkU0eTI0MTZDQlFjQTNaUXQxRlg3bXVs?=
 =?utf-8?B?b2U2K05nK216V0JXTWVKK3Myc3pJd0Z3YUNFQU5lMkZjeXFTNWZNS2Z4MmVW?=
 =?utf-8?B?R21za1lZQnJVb3RycHpXNzBhQnl6NWlUOTI3TGFjRzVtZVdpTVZyZjFEYkZu?=
 =?utf-8?B?aEw4VUlHYllHWFNCQlhxTWdIMDUxU3AwczBFQzAxK2p0UFJTUTdxV0dsS1JR?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eba4ba94-1dfe-4ae4-1e1a-08db7c5f958c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 07:23:38.0118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK/dpNQAyQWRZcj8mpQ4E8YSg4c8vQ0hZo5+oCL1G18eVniO2oaY/bnhlFLu0Kd8B/CIBs3YZ2+dcAXT+nzNIlxriHIX0htNpQlDorxTnEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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

On 4.07.2023 09:01, Christian König wrote:
> Am 04.07.23 um 08:35 schrieb Karolina Stolarek:
>> On 3.07.2023 13:21, Christian König wrote:
>>>
>>>
>>> Am 03.07.23 um 09:58 schrieb Karolina Stolarek:
>>>> Add KUnit tests that exercise page allocation using page pools
>>>> and freeing pages, either by returning them to the pool or
>>>> freeing them. Add a basic test for ttm_pool cleanup. Introduce
>>>> helpers to create a dummy ttm_buffer_object.
>>>>
>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  15 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 405 
>>>> ++++++++++++++++++
>>>>   4 files changed, 425 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>> index 7917805f37af..ec87c4fc1ad5 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>>> @@ -2,4 +2,5 @@
>>>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>>           ttm_device_test.o \
>>>> +        ttm_pool_test.o \
>>>>           ttm_kunit_helpers.o
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> index 428a8a4ac9dc..9384679fccb0 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> @@ -26,6 +26,21 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_init_device);
>>>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>>>> *test,
>>>> +                               size_t size)
>>>> +{
>>>> +    struct drm_gem_object gem_obj = { .size = size };
>>>> +    struct ttm_buffer_object *bo;
>>>> +
>>>> +    bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>>> +
>>>> +    bo->base = gem_obj;
>>>> +
>>>> +    return bo;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
>>>> +
>>>>   int ttm_test_devices_init(struct kunit *test)
>>>>   {
>>>>       struct ttm_test_devices_priv *priv;
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> index bf0b1000a8ee..41ad38dd34e5 100644
>>>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> @@ -7,6 +7,7 @@
>>>>   #include <drm/drm_drv.h>
>>>>   #include <drm/ttm/ttm_device.h>
>>>> +#include <drm/ttm/ttm_bo.h>
>>>>   #include <drm/drm_kunit_helpers.h>
>>>>   #include <kunit/test.h>
>>>> @@ -23,6 +24,9 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>>>                     bool use_dma_alloc,
>>>>                     bool use_dma32);
>>>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>>>> *test,
>>>> +                               size_t size);
>>>> +
>>>>   int ttm_test_devices_init(struct kunit *test);
>>>>   void ttm_test_devices_fini(struct kunit *test);
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>> new file mode 100644
>>>> index 000000000000..85806f72df22
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>>>> @@ -0,0 +1,405 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#include <linux/mm.h>
>>>> +
>>>> +#include <drm/ttm/ttm_tt.h>
>>>> +#include <drm/ttm/ttm_pool.h>
>>>> +
>>>> +#include "ttm_kunit_helpers.h"
>>>> +
>>>> +struct ttm_pool_test_case {
>>>> +    const char *description;
>>>> +    unsigned int order;
>>>> +    bool use_dma_alloc;
>>>> +};
>>>> +
>>>> +static struct ttm_operation_ctx simple_ctx = {
>>>> +    .interruptible = true,
>>>> +    .no_wait_gpu = false,
>>>> +};
>>>> +
>>>> +static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
>>>> +                       uint32_t page_flags,
>>>> +                       enum ttm_caching caching,
>>>> +                       size_t size)
>>>> +{
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    int err;
>>>> +
>>>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>>> +
>>>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    err = ttm_tt_init(tt, bo, page_flags, caching, 0);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    /* We don't need this BO later, release it */
>>>> +    ttm_bo_put(bo);
>>>
>>> That won't work. A BO must always outlive the TT object allocated for 
>>> it. >
>>> Otherwise you can get crashes during TT release.
>>
>> OK, I can keep it around, probably as an another test->priv member.
>>
>> I thought that for these mocks it should be fine -- 
>> ttm_tt_init_fields() only takes the scatter list from BO which is not 
>> in use (as for now, at least) and in ttm_tt_fini() we don't even touch 
>> that field.
> 
> Yeah, it might work for the mock test. But this is not how the interface 
> is supposed to be used.

I'll correct it in the next version then, thanks for taking a look.

All the best,
Karolina

> 
> The lifetime of the TT object is tied to the one of the BO, e.g. when 
> the BO is destroyed and has a TT object associated with it that object 
> is destroyed as well.
> 
> Regards,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +
>>>> +    return tt;
>>>> +}
>>>> +
>>>> +static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
>>>> +                           size_t size,
>>>> +                           enum ttm_caching caching)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_tt *tt;
>>>> +    int err;
>>>> +    unsigned long order = __fls(size / PAGE_SIZE);
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, order, caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>>> +
>>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +
>>>> +    return pool;
>>>> +}
>>>> +
>>>> +static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
>>>> +    {
>>>> +        .description = "One page",
>>>> +        .order = 0,
>>>> +    },
>>>> +    {
>>>> +        .description = "More than one page",
>>>> +        .order = 2,
>>>> +    },
>>>> +    {
>>>> +        .description = "Above the allocation limit",
>>>> +        .order = MAX_ORDER + 1,
>>>> +    },
>>>> +    {
>>>> +        .description = "One page, with coherent DMA mappings enabled",
>>>> +        .order = 0,
>>>> +        .use_dma_alloc = true,
>>>> +    },
>>>> +    {
>>>> +        .description = "Above the allocation limit, with coherent 
>>>> DMA mappings enabled",
>>>> +        .order = MAX_ORDER + 1,
>>>> +        .use_dma_alloc = true,
>>>> +    },
>>>> +};
>>>> +
>>>> +static void ttm_pool_alloc_case_desc(const struct 
>>>> ttm_pool_test_case *t,
>>>> +                     char *desc)
>>>> +{
>>>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>>>> +}
>>>> +
>>>> +KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
>>>> +          ttm_pool_alloc_case_desc);
>>>> +
>>>> +static void ttm_pool_alloc_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    const struct ttm_pool_test_case *params = test->param_value;
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct page *fst_page, *last_page;
>>>> +    int err;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int expected_num_pages = 1 << params->order;
>>>> +    size_t size = expected_num_pages * PAGE_SIZE;
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, 
>>>> params->use_dma_alloc,
>>>> +              false);
>>>> +
>>>> +    KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
>>>> +    KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
>>>> +    KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>>> +
>>>> +    fst_page = tt->pages[0];
>>>> +    last_page = tt->pages[tt->num_pages - 1];
>>>> +
>>>> +    if (params->order <= MAX_ORDER) {
>>>> +        if (params->use_dma_alloc) {
>>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
>>>> +        } else {
>>>> +            KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
>>>> +        }
>>>> +    } else {
>>>> +        if (params->use_dma_alloc) {
>>>> +            KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
>>>> +            KUNIT_ASSERT_NULL(test, (void *)last_page->private);
>>>> +        } else {
>>>> +            /*
>>>> +             * We expect to alloc one big block, followed by
>>>> +             * order 0 blocks
>>>> +             */
>>>> +            KUNIT_ASSERT_EQ(test, fst_page->private,
>>>> +                    min_t(unsigned int, MAX_ORDER,
>>>> +                          params->order));
>>>> +            KUNIT_ASSERT_EQ(test, last_page->private, 0);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    const struct ttm_pool_test_case *params = test->param_value;
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_buffer_object *bo;
>>>> +    dma_addr_t dma1, dma2;
>>>> +    int err;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int expected_num_pages = 1 << params->order;
>>>> +    size_t size = expected_num_pages * PAGE_SIZE;
>>>> +
>>>> +    tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    bo = ttm_kunit_helper_ttm_bo_init(test, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>>>> +
>>>> +    err = ttm_sg_tt_init(tt, bo, 0, caching);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>>> +
>>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +    KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
>>>> +
>>>> +    dma1 = tt->dma_address[0];
>>>> +    dma2 = tt->dma_address[tt->num_pages - 1];
>>>> +
>>>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_alloc_order_caching_match(struct kunit *test)
>>>> +{
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int order = 0;
>>>> +    size_t size = PAGE_SIZE;
>>>> +    int err;
>>>> +
>>>> +    pool = ttm_pool_pre_populated(test, size, caching);
>>>> +
>>>> +    pt = &pool->caching[caching].orders[order];
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
>>>> +{
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>>>> +    int err;
>>>> +    enum ttm_caching tt_caching = ttm_uncached;
>>>> +    enum ttm_caching pool_caching = ttm_cached;
>>>> +    size_t size = PAGE_SIZE;
>>>> +    unsigned int order = 0;
>>>> +
>>>> +    pool = ttm_pool_pre_populated(test, size, pool_caching);
>>>> +
>>>> +    pt_pool = &pool->caching[pool_caching].orders[order];
>>>> +    pt_tt = &pool->caching[tt_caching].orders[order];
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, tt_caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>>>> +
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_alloc_order_mismatch(struct kunit *test)
>>>> +{
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt_pool, *pt_tt;
>>>> +    int err;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int order = 2;
>>>> +    size_t fst_size = (1 << order) * PAGE_SIZE;
>>>> +    size_t snd_size = PAGE_SIZE;
>>>> +
>>>> +    pool = ttm_pool_pre_populated(test, fst_size, caching);
>>>> +
>>>> +    pt_pool = &pool->caching[caching].orders[order];
>>>> +    pt_tt = &pool->caching[caching].orders[0];
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, caching, snd_size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
>>>> +
>>>> +    err = ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
>>>> +
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_free_dma_alloc(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int order = 2;
>>>> +    size_t size = (1 << order) * PAGE_SIZE;
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>>> +
>>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
>>>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +
>>>> +    pt = &pool->caching[caching].orders[order];
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>>> +
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_free_no_dma_alloc(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    struct ttm_tt *tt;
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int order = 2;
>>>> +    size_t size = (1 << order) * PAGE_SIZE;
>>>> +
>>>> +    tt = mock_ttm_tt_init(test, 0, caching, size);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, tt);
>>>> +
>>>> +    pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, pool);
>>>> +
>>>> +    ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
>>>> +    ttm_pool_alloc(pool, tt, &simple_ctx);
>>>> +
>>>> +    pt = &pool->caching[caching].orders[order];
>>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>>>> +
>>>> +    ttm_pool_free(pool, tt);
>>>> +    ttm_tt_fini(tt);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
>>>> +
>>>> +    ttm_pool_fini(pool);
>>>> +}
>>>> +
>>>> +static void ttm_pool_fini_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_pool *pool;
>>>> +    struct ttm_pool_type *pt;
>>>> +    enum ttm_caching caching = ttm_uncached;
>>>> +    unsigned int order = 0;
>>>> +    size_t size = PAGE_SIZE;
>>>> +
>>>> +    pool = ttm_pool_pre_populated(test, size, caching);
>>>> +    pt = &pool->caching[caching].orders[order];
>>>> +
>>>> +    KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
>>>> +
>>>> +    ttm_pool_fini(pool);
>>>> +
>>>> +    KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
>>>> +}
>>>> +
>>>> +static struct kunit_case ttm_pool_test_cases[] = {
>>>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic, 
>>>> ttm_pool_alloc_basic_gen_params),
>>>> +    KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
>>>> +             ttm_pool_alloc_basic_gen_params),
>>>> +    KUNIT_CASE(ttm_pool_alloc_order_caching_match),
>>>> +    KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
>>>> +    KUNIT_CASE(ttm_pool_alloc_order_mismatch),
>>>> +    KUNIT_CASE(ttm_pool_free_dma_alloc),
>>>> +    KUNIT_CASE(ttm_pool_free_no_dma_alloc),
>>>> +    KUNIT_CASE(ttm_pool_fini_basic),
>>>> +    {}
>>>> +};
>>>> +
>>>> +static struct kunit_suite ttm_pool_test_suite = {
>>>> +    .name = "ttm_pool",
>>>> +    .init = ttm_test_devices_init,
>>>> +    .exit = ttm_test_devices_fini,
>>>> +    .test_cases = ttm_pool_test_cases,
>>>> +};
>>>> +
>>>> +kunit_test_suites(&ttm_pool_test_suite);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>
> 
