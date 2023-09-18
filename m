Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0A7A48B8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 13:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61A10E027;
	Mon, 18 Sep 2023 11:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35E910E027
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695037721; x=1726573721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=geLW4g44OksETFuHTsMO2SAkyw/3S7RyNIj290QJoGo=;
 b=VurvomETROn6pSQl3Jp5Y9wBvssRliG4EmhZ/C3wfa5EnbKXuF3xv4kn
 wBj9m6mvo/I8eJqXgmvzagAR6h4sKtGD5jHZskvkFG4p52L76okzOyJ9G
 WRstkI48FBpovpFd5nMTru3G7uMyZ7mz97afbEfvxG+5f46OW7jgYRLnE
 PRBHX94qNAjtDR/vJRBRN2EvM3zuXYi1iunNoXQ6lXIAqzd6lYzlhAWMf
 /weDdjeUizmG4sZZfrP7IUE22UFukzvFkJdNtPmQclo/+E9T6mX7hDp2o
 /OH5SAsMFH5TapzaE8WgdeYJmbuHqn9TUlNI9W1b82T55pcg46OxfTPbs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="443709798"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="443709798"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 04:48:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="835989693"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="835989693"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 04:48:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 04:48:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 04:48:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 04:48:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 04:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSZ7nfu850xY8sfrqUKRUVs/Wp816bL2X7gevX/puOKQ1hf8L7DTlJZaAV11cpzh1TZKso5LDM2lsLLKSwiJJSVwPZLWbecDB9ZIVpm/t+yh7TdHfwdY5BTXgS+W7rqBW8SBXVIK8DNGOc7NQPR+QmwHkh6HD6noKUC9Vv/kLpTlhrbiUHd5lxK9Rpza243ew8JY0aMyZt0s9v9PaJRvvK9yQI4IPj6TkL19aJ+pltEjqJokUo3c3UkC0NjYBRpU0FLArm4/gJrZHcfbkyUTHHNX55jr3Gr6tqegDiB5GgG2FHbARDKp+hu3Ahu17vANsu9lCYEsLxlqcfMlkHkYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTqcMwwgKp8zYzQdEBUA0F3ATmn27p8KYph1fzj6Y2M=;
 b=OG2/BC5LWTO9tMLqdF57MvkCzEpnEMzeJDuGQ3dJMiJWpMBTQObcJLPecctUYEJAYA92inFl+djitB+8qX1bo52vm0+UziNOW3fawhrxOVfuApuYWT0RhIA1f4xjvN/EkAH/L/x9ju/Z6++yXnjuDzEtBcmWIMIKz5jUqSEPwPqfcSCSAh6Y2SoLjirSNwdh3uSmg5ITq174Na//ZIobQ9igOQC5N1F5xI1MzrZqBy1Fysc/scwMADF7g4hIMSBFnkfNJi0P4ssFsXad+7nMzzinpSrXdjwgDYXxYydO/+cs4SSdr+hMGbPcpFf+W3FOBKrhBR9nz/v+SmDi3qkRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 11:48:32 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:48:32 +0000
Message-ID: <b662f3ae-037d-ffee-9aae-6c51c5d4f587@intel.com>
Date: Mon, 18 Sep 2023 13:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/4] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1694517411.git.karolina.stolarek@intel.com>
 <97d52e1c257f91c7d0ff53a764fe1e590c070691.1694517411.git.karolina.stolarek@intel.com>
 <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <c4e66bca-a8e8-da53-1a96-7dbdd8a6d5bf@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::19) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 87354120-898c-4c82-a1b2-08dbb83d2e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEAMpvRKDkFltbzN46H5ifuzt+6Z0eq0JnmO+oLy6CQne77ZvbhjgtaG2KTQnMOTsSqwjfvEiTP8WJZhJ1GZVwI29KGfbIGZ2U90HvWHpYPnLcfdMCZBASqhWOieu6+hIIwYXylLcVYaADjyyEDZzr6aIP3JofjyUT8JX6Qx62kPQnVF4oV2u/5QtRrXoruF6GNLNh+HWNMDETFhv77wmI1tc5uYAQ5meNI30sFrYs+C7KuX+Gbmul/WVQq/ySrm7RYD8mxn+LanFFtjbO3UWxL5xh2mu6GKgwXgPC7d9HcEq+ql2ix+tuCDVP92puy5dMibIFUESsBd5h7Tg+rtseblXmqQzHzmXEhl0xIcbxhE1wloAJjFf5AJZYi8njPz5ULMNs5CNO9Je4Ap7Gp5i2TBZQQSirusXSVHr4qDmr59tJUABwewKBqt6w5DkQEAgXhxNH+Mgw0oT6s5DqMnN+zKL9A6LRdNUygnA/EGfcm0ZnOOPJxmc8DezLzrsOw3Fn9+1aHNYWPgm6W2Gv8MCV7bXZEYUmNsRIbL8AkUREraps2gKVyhxUPKsGIqpuTv7Nl6JTWqZNni/e7T3sOBh3GvbTQvLsZ0doKN84AwTy7yEKDANPuqUjd2C4dw3ytzp04401NQj3L4gkKpSSr7Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(1800799009)(451199024)(186009)(66556008)(66476007)(41300700001)(66946007)(66574015)(316002)(8936002)(8676002)(4326008)(6506007)(53546011)(6486002)(36916002)(6512007)(6666004)(478600001)(83380400001)(26005)(2616005)(31696002)(86362001)(2906002)(30864003)(82960400001)(38100700002)(44832011)(5660300002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE4wVThGMjRIV29FWUhKS0ZXOVFoZ3ZRdWduZlVnelgzN2RiMkEyUmpUVXZO?=
 =?utf-8?B?NGV3a2hFZzZSc1JZSytxU09xY0dlZUlTNksrMHJEQlk3Kzh0Y3BVYW1Vdnhx?=
 =?utf-8?B?Wk05MWN5c08vRy95d2I1VHUvZWdHMnJnTTlwaGRnNXVHbGxvMVBXVzU2WFhC?=
 =?utf-8?B?U3VUWXlOc0xHYWRlQkFLdWNHWnpkQlJOaERZZmRVWEl3QnorR0RHVGdjZ0J4?=
 =?utf-8?B?OVJtS3dHS3d2UDBRQktRb1k5RkhGZElTQnlkcVorVk9MOURqVHFoM3lBeFN2?=
 =?utf-8?B?bkNyQnVvajI3bVlmT09rNEhwUGhxbWhDNzRDanpGaFJDdzNwRk5kallGM2l6?=
 =?utf-8?B?K2FkZEJMckc1emFEWFVkSzVnOUxyOFU3UTVnWGlFdFF6cmZJVjdFKzJMTHBP?=
 =?utf-8?B?UGVMd0hKaHF3ZDBTQ1kxbStESlBJblF4VkJyWGwxQXhTVnlyejlxTFZzeGZI?=
 =?utf-8?B?TWovWE9MWHhVRGg4ZjFORmFHa1p1Qk1uUnExUzNZZEU2Snc2cXZINW5WVVlz?=
 =?utf-8?B?ZUFMMVVzdVFCcWZWUGwvQ1FHaVBWTEZGb21hS2tZYjhsUTRUSk1HYnNmSjhJ?=
 =?utf-8?B?QlVhRkUxV01BNDk5bnFsWHNQOHZadDdvOTZENkhiWE1GVCt6NkV6RjlzOHFN?=
 =?utf-8?B?VkpQNFVpWWhwNTBCdzhPd3pYRlFmbEJnRmE1TG9KKzQ5Z2pLdUhNMVZsVUc3?=
 =?utf-8?B?TXA3NWM5RW5kM0g3TW03TWJxd0RyVUg5cVFobTN3ZldZcU15c2YrTjB1eU1L?=
 =?utf-8?B?UmlFS0JoQ3EyMDE2M0dxYnJwdGxmMmswMnp0US8ySnJmMDZFOElRRlYyOGZ3?=
 =?utf-8?B?OFVWanc5V0o2YTlhWkhyLzBGMjFjSkFFUS84TzBxUlM1KzdKa3FFR3BkNCtT?=
 =?utf-8?B?UnBFOEhIaXJSS0ZZNVI1NG5ZWFpEYzNrSWpEbVFDSUw5WHpBWTNrQXUxVkht?=
 =?utf-8?B?dFd0bUFkNnI4akN6Y0ZhYU5GMjZCSGtDVnBSbFdmZXo0N01TR0VoMmRJMm1i?=
 =?utf-8?B?SmNGNXg4STg2UHRqNzNUbjdhaDJOWDdWeFdtT3ZzRjAycEdRMTdDenB4NEo3?=
 =?utf-8?B?ZEJLM1ZKdlNybjNac2xXVEF0blhLR0w4V3Z1VTNpeklCZXNpZGdhNnJxT2d1?=
 =?utf-8?B?WHJLSGYrTlVqR2hVc05vbWtjdllYV3lDRnVGU2t6U2Qxc0NTQzFtcFIyOWVT?=
 =?utf-8?B?NUtKQTZ4Rm9oWXA4QTdtSlRrZ2NFbkYvempCRlUwbmd4dU9LVU9GWStzZ0hD?=
 =?utf-8?B?RmJKaDVhQmFPSHJHeCtzdXJXcDhvdjh3aU02RmF2MS9iM0ZNQkJQcDJxNW8y?=
 =?utf-8?B?RHJyQ1I5ajBRaGs4enY0Z2svcXRzVjVnRENCOHhEWWk0ZzkvNFBnM2gvdk9O?=
 =?utf-8?B?Rk1rNFZDRHBQcERocTBRSWRvT0dZMWhZQXlMUEJ6RzFqV25IRkJiS1pUZ0V5?=
 =?utf-8?B?R25IOFlTUUFvR3pmcW8rMTFCbnRmeU0vQ1BlV2U5Qkl6SDlVaVJqbUZMOFZQ?=
 =?utf-8?B?Q3dnTjAycVpES0Q0SEdDS2ZqdHFWNE9jNDA0MjN4WUY2VjJDY05hQVpBM0pl?=
 =?utf-8?B?L3ZTTTFCaVM0RElvM0Y2c1Z0RzBtbFA2K3drYkx1RVZnOSs2bm9RV05ZWVE5?=
 =?utf-8?B?ckttZzNXTkpyTE1oWlJCMFdFUTNVNnFlOE52ekJpYWZYcklLSUFKTHp5V3Yr?=
 =?utf-8?B?NFFCWmdVMElNK013cmwvMHZNTkxNYTVCSmZlaUc2ZkNpbVpTeExsQ2ZMTVc2?=
 =?utf-8?B?cHZsT1UyYUNLaGkrTElBc0VUNzRZZEoyRHpzVGtxYXp1RUhpOGRRMGtRQ3Vh?=
 =?utf-8?B?QXBQdkpsZk9ycFh1N0NjTytkMk4yMVl2emxDcjVSZ1dQeEdZb0pKc0MwZUNI?=
 =?utf-8?B?V01Bc2pxZFZyaVUzclJRaVNlbmVsZVZudUlwT3U0UlVlOGsxWFphRmh1cVFQ?=
 =?utf-8?B?akNNd1pYTmZIRWRwT05oakZoYkFKaHI5WERrSjdGYVV0OXhwRTFLN3JoOGRL?=
 =?utf-8?B?ajFFem9Nd3dSa1FEM3JZQzNEQkRCT0o2ZHBvVkRqdDlkeWlKYjJOaXFtY3Zo?=
 =?utf-8?B?cFROUEF4R3ZWTVFzL3BFRUhFWmNuVUVKYnpheExLWTN6WlM5a1BrMk9mWlpG?=
 =?utf-8?B?amRuSVRkSWlneWFVcFhNU24vbnNnWnJkK0dhOS81ZlR4WVJXMGxWZi9CUmts?=
 =?utf-8?B?UWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87354120-898c-4c82-a1b2-08dbb83d2e64
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:48:31.9133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRYED7q2A8IxKkhpUxwuBZ/IqqBD2HsAEudxY8Z70dCCRBOZbUykPt7WaD1FZfYRHplDAfw95iUtj1zSUX2cvXLvZ+/Q/murramZ6Ry+ICs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.09.2023 14:54, Christian König wrote:
> Am 12.09.23 um 13:49 schrieb Karolina Stolarek:
>> Test initialization of ttm_resource using different memory domains.
>> Add tests for a system memory manager and functions that can be
>> tested without a fully-featured resource manager. Update
>> ttm_bo_kunit_init() to initialize BO's kref and reservation object.
>> Export ttm_resource_alloc symbol for test purposes only.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>   5 files changed, 366 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>> b/drivers/gpu/drm/ttm/tests/Makefile
>> index ec87c4fc1ad5..c92fe2052ef6 100644
>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>> @@ -3,4 +3,5 @@
>>   obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>           ttm_device_test.o \
>>           ttm_pool_test.o \
>> +        ttm_resource_test.o \
>>           ttm_kunit_helpers.o
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index 81661d8827aa..eccc59b981f8 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -38,10 +38,33 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct 
>> kunit *test,
>>       bo->base = gem_obj;
>>       bo->bdev = devs->ttm_dev;
>> +    kref_init(&bo->kref);
>> +
>> +    dma_resv_init(&bo->base._resv);
>> +    bo->base.resv = &bo->base._resv;
>> +
> 
> I'm really wondering if we shouldn't now initialize the GEM object 
> properly?
> 
> That would also initialize the reservation object if I remember correctly.

Do you mean by using drm_gem_object_init()?

> 
> The solution with EXPORT_SYMBOL_FOR_TESTS_ONLY looks really nice I think 
> and apart from that I can't see anything obviously wrong either, but I 
> only skimmed over the code.

I'm also glad with EXPORT_SYMBOL_FOR_TESTS_ONLY solution, it's much 
better now. Right, you can take a closer look at the next version. I'll 
try to get an actual GEM object here, if you think that's feasible.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
>>       return bo;
>>   }
>>   EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>> +                       uint32_t mem_type, uint32_t flags,
>> +                       size_t size)
>> +{
>> +    struct ttm_place *place;
>> +
>> +    place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, place);
>> +
>> +    place->mem_type = mem_type;
>> +    place->flags = flags;
>> +    place->fpfn = size >> PAGE_SHIFT;
>> +    place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
>> +
>> +    return place;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
>> +
>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
>>   {
>>       struct ttm_test_devices *devs;
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> index e261e3660d0b..f38140f93c05 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> @@ -8,6 +8,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/ttm/ttm_device.h>
>>   #include <drm/ttm/ttm_bo.h>
>> +#include <drm/ttm/ttm_placement.h>
>>   #include <drm/drm_kunit_helpers.h>
>>   #include <kunit/test.h>
>> @@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices 
>> *priv,
>>   struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
>>                           struct ttm_test_devices *devs,
>>                           size_t size);
>> +struct ttm_place *ttm_place_kunit_init(struct kunit *test,
>> +                       uint32_t mem_type, uint32_t flags,
>> +                       size_t size);
>>   struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
>>   struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>> new file mode 100644
>> index 000000000000..851cdc43dc37
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +#include <drm/ttm/ttm_resource.h>
>> +
>> +#include "ttm_kunit_helpers.h"
>> +
>> +#define RES_SIZE        SZ_4K
>> +#define TTM_PRIV_DUMMY_REG    (TTM_NUM_MEM_TYPES - 1)
>> +
>> +struct ttm_resource_test_case {
>> +    const char *description;
>> +    uint32_t mem_type;
>> +    uint32_t flags;
>> +};
>> +
>> +struct ttm_resource_test_priv {
>> +    struct ttm_test_devices *devs;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +};
>> +
>> +static const struct ttm_resource_manager_func 
>> ttm_resource_manager_mock_funcs = { };
>> +
>> +static int ttm_resource_test_init(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv;
>> +
>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +    priv->devs = ttm_test_devices_all(test);
>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs);
>> +
>> +    test->priv = priv;
>> +
>> +    return 0;
>> +}
>> +
>> +static void ttm_resource_test_fini(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +
>> +    ttm_test_devices_put(test, priv->devs);
>> +}
>> +
>> +static void ttm_init_test_mocks(struct kunit *test,
>> +                struct ttm_resource_test_priv *priv,
>> +                uint32_t mem_type, uint32_t flags)
>> +{
>> +    size_t size = RES_SIZE;
>> +
>> +    /* Make sure we have what we need for a good BO mock */
>> +    KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
>> +
>> +    priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
>> +    priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
>> +}
>> +
>> +static void ttm_init_test_manager(struct kunit *test,
>> +                  struct ttm_resource_test_priv *priv,
>> +                  uint32_t mem_type)
>> +{
>> +    struct ttm_device *ttm_dev = priv->devs->ttm_dev;
>> +    struct ttm_resource_manager *man;
>> +    size_t size = SZ_16K;
>> +
>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>> +
>> +    man->use_tt = false;
>> +    man->func = &ttm_resource_manager_mock_funcs;
>> +
>> +    ttm_resource_manager_init(man, ttm_dev, size);
>> +    ttm_set_driver_manager(ttm_dev, mem_type, man);
>> +    ttm_resource_manager_set_used(man, true);
>> +}
>> +
>> +static const struct ttm_resource_test_case ttm_resource_cases[] = {
>> +    {
>> +        .description = "Init resource in TTM_PL_SYSTEM",
>> +        .mem_type = TTM_PL_SYSTEM,
>> +    },
>> +    {
>> +        .description = "Init resource in TTM_PL_VRAM",
>> +        .mem_type = TTM_PL_VRAM,
>> +    },
>> +    {
>> +        .description = "Init resource in a private placement",
>> +        .mem_type = TTM_PRIV_DUMMY_REG,
>> +    },
>> +    {
>> +        .description = "Init resource in TTM_PL_SYSTEM, set placement 
>> flags",
>> +        .mem_type = TTM_PL_SYSTEM,
>> +        .flags = TTM_PL_FLAG_TOPDOWN,
>> +    },
>> +};
>> +
>> +static void ttm_resource_case_desc(const struct 
>> ttm_resource_test_case *t, char *desc)
>> +{
>> +    strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, 
>> ttm_resource_case_desc);
>> +
>> +static void ttm_resource_init_basic(struct kunit *test)
>> +{
>> +    const struct ttm_resource_test_case *params = test->param_value;
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource *res;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource_manager *man;
>> +    uint64_t expected_usage;
>> +
>> +    ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    if (params->mem_type > TTM_PL_SYSTEM)
>> +        ttm_init_test_manager(test, priv, params->mem_type);
>> +
>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>> +    expected_usage = man->usage + RES_SIZE;
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>> +
>> +    ttm_resource_init(bo, place, res);
>> +
>> +    KUNIT_ASSERT_EQ(test, res->start, 0);
>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>> +    KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
>> +    KUNIT_ASSERT_EQ(test, res->placement, place->flags);
>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>> +
>> +    KUNIT_ASSERT_NULL(test, res->bus.addr);
>> +    KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
>> +    KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
>> +    KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
>> +    KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
>> +
>> +    ttm_resource_fini(man, res);
>> +}
>> +
>> +static void ttm_resource_init_pinned(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource *res;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource_manager *man;
>> +
>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>> +
>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>> +
>> +    dma_resv_lock(bo->base.resv, NULL);
>> +    ttm_bo_pin(bo);
>> +    ttm_resource_init(bo, place, res);
>> +    KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
>> +
>> +    ttm_bo_unpin(bo);
>> +    ttm_resource_fini(man, res);
>> +    dma_resv_unlock(bo->base.resv);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>> +}
>> +
>> +static void ttm_resource_fini_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource *res;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource_manager *man;
>> +
>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>> +
>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>> +
>> +    ttm_resource_init(bo, place, res);
>> +    ttm_resource_fini(man, res);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>> +}
>> +
>> +static void ttm_resource_manager_init_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource_manager *man;
>> +    size_t size = SZ_16K;
>> +
>> +    man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, man);
>> +
>> +    ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
>> +
>> +    KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
>> +    KUNIT_ASSERT_EQ(test, man->size, size);
>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>> +    KUNIT_ASSERT_NULL(test, man->move);
>> +    KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
>> +
>> +    for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>> +        KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
>> +}
>> +
>> +static void ttm_resource_manager_usage_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource *res;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource_manager *man;
>> +    uint64_t actual_usage;
>> +
>> +    ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
>> +
>> +    ttm_resource_init(bo, place, res);
>> +    actual_usage = ttm_resource_manager_usage(man);
>> +
>> +    KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
>> +
>> +    ttm_resource_fini(man, res);
>> +}
>> +
>> +static void ttm_resource_manager_set_used_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource_manager *man;
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
>> +    KUNIT_ASSERT_TRUE(test, man->use_type);
>> +
>> +    ttm_resource_manager_set_used(man, false);
>> +    KUNIT_ASSERT_FALSE(test, man->use_type);
>> +}
>> +
>> +static void ttm_sys_man_alloc_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource_manager *man;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource *res;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +    int ret;
>> +
>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>> +    ret = man->func->alloc(man, bo, place, &res);
>> +
>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>> +    KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
>> +    KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
>> +    KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
>> +
>> +    ttm_resource_fini(man, res);
>> +}
>> +
>> +static void ttm_sys_man_free_basic(struct kunit *test)
>> +{
>> +    struct ttm_resource_test_priv *priv = test->priv;
>> +    struct ttm_resource_manager *man;
>> +    struct ttm_buffer_object *bo;
>> +    struct ttm_place *place;
>> +    struct ttm_resource *res;
>> +    uint32_t mem_type = TTM_PL_SYSTEM;
>> +
>> +    ttm_init_test_mocks(test, priv, mem_type, 0);
>> +    bo = priv->bo;
>> +    place = priv->place;
>> +
>> +    res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, res);
>> +
>> +    ttm_resource_alloc(bo, place, &res);
>> +
>> +    man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
>> +    man->func->free(man, res);
>> +
>> +    KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
>> +    KUNIT_ASSERT_EQ(test, man->usage, 0);
>> +}
>> +
>> +static struct kunit_case ttm_resource_test_cases[] = {
>> +    KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
>> +    KUNIT_CASE(ttm_resource_init_pinned),
>> +    KUNIT_CASE(ttm_resource_fini_basic),
>> +    KUNIT_CASE(ttm_resource_manager_init_basic),
>> +    KUNIT_CASE(ttm_resource_manager_usage_basic),
>> +    KUNIT_CASE(ttm_resource_manager_set_used_basic),
>> +    KUNIT_CASE(ttm_sys_man_alloc_basic),
>> +    KUNIT_CASE(ttm_sys_man_free_basic),
>> +    {}
>> +};
>> +
>> +static struct kunit_suite ttm_resource_test_suite = {
>> +    .name = "ttm_resource",
>> +    .init = ttm_resource_test_init,
>> +    .exit = ttm_resource_test_fini,
>> +    .test_cases = ttm_resource_test_cases,
>> +};
>> +
>> +kunit_test_suites(&ttm_resource_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c 
>> b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 46ff9c75bb12..02b96d23fdb9 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -30,6 +30,8 @@
>>   #include <drm/ttm/ttm_placement.h>
>>   #include <drm/ttm/ttm_resource.h>
>> +#include <drm/drm_util.h>
>> +
>>   /**
>>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>>    * @bulk: the structure to init
>> @@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>>       spin_unlock(&bo->bdev->lru_lock);
>>       return 0;
>>   }
>> +EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
>>   void ttm_resource_free(struct ttm_buffer_object *bo, struct 
>> ttm_resource **res)
>>   {
> 
