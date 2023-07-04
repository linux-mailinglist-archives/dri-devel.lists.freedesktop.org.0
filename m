Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E0D7469BF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 08:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9B910E0FF;
	Tue,  4 Jul 2023 06:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD5C10E0FF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688452559; x=1719988559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S4J97sDFO6r/pSl3nevS2wZQndICRi77BAYzLiECY+Q=;
 b=bCt2ljzQpTjwSrC/btiUHYwgJqCX1hK8errQrWPGwVwBW0pHuULINGCr
 P41WioOk9TkRt9WCIu/1z1U0cD6RPuCiQFzV1DqaTiQ+23dE+cJAvObNQ
 a9mYvh0DIFQQDwpTS7F2uKxmFqBSwDlC+QHaZZ+gg7YHeSplW6UplLXLy
 bXFvcpBRWr4YBGOYdVqq6BS1x2cP38v34uLTHU7bR7ahtmH2tXsMyw+IN
 MOBi2m8zOigqxEfWgA2yhkaGtGCS0N21/I2T/QTS9Paa8jNA5tiGzvyr9
 +lKvGatZvS2BR9ARgf0Dru74ulmXcSq9jplSnaOWUUEi2mPvZikxp7eB6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360528723"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="360528723"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 23:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808812232"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="808812232"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2023 23:35:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 23:35:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 23:35:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 23:35:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjetWxmdQcRpJ+TTMGLm+8+G1GvOE+RuHQBMPlGsi+C8fdx8s3NvSRHihOotLyAxS6mqr1dwi33vZCvJZ0CtsslaRynKQn5aqNVS2m/PmuI/BdSlDP7hyt8P3dy8mz18ZP7ljKQZHMYT+UB8klv0xdiqwu9h3TNPTpPc0pLxnTI9E6n/numZtewQhoywJ8gXd0VJQ4O9ar8il/AgDoOEIXwKSPm+R4nr7BfpAgTNtyFJCELOtk1ukz8fErrm7UJN0mCeAZd621fvlc7+tWdLT+Ll094wgS2kZXgIgQ8/eBYB9lCdzXVyKh+jpDCOqPKU5qznWZZykrpDUkZZRPvgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTbk/11vsQQMZKvH7XRXKO7yTKv6Q51kUKdj4ZU8euc=;
 b=gpCXl/b0MiHW0v3oCOTmYzDzyrspWbuUPVlXZWvdx1rIjpN2pXS5J0ZtEkCmJYb6f/BhxTbDdZhC/1MG+rkjrtW1E0JZHMG37E3VFQ08saJyy91NuGfkZgNupOpdhTkwhrV5exML20ryc9G3HadYS9syEzn1fq/4jrUHR4/sU7BBhh+X2bTWHZn57UpLJqwQFOdixbRARw00nTaGYntVcCby2NljakFG6mBLjhaxmdanmUIKG3M+oRmPkjLvbgipwDycR/xueIisJWccWw/cO+K3uZVC/X5tZYoPP0LXR1YgrPcvBu2blGn5fxi48OL6p8R0Hy9aTw44fXK5QXOJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 06:35:54 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::74d2:5fa6:b6e5:7c63%6]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:35:53 +0000
Message-ID: <13fb6ee2-d157-7e1e-90ae-b1828e5a2745@intel.com>
Date: Tue, 4 Jul 2023 08:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC v3 3/3] drm/ttm/tests: Add tests for ttm_pool
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1688131205.git.karolina.stolarek@intel.com>
 <1726d758b3f7e5ee10b168102d5e207479324442.1688131205.git.karolina.stolarek@intel.com>
 <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7f761d03-6387-afc7-989a-9dc791fe04ed@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::9) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4e8cb0-19bb-4d20-b479-08db7c58e9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZGH26pZuUQnoIgvvM1J81yeMt+jrOIWeAFn83tjssBhVJ0CZ4BgTo1IqoP/xYUAmuqq18M7SDM/PkeRem70z3S1cuI1L7I9m1mfcmFzzDABSSFvAH8he2Fr8bNZ4TFzwESHvC0ycj8kH7dE7UpFazTfNAYHd89pWWMMNtdYIYNJ4dMh/29EyKlr61uXI0wzE3pUo/vzrAfD0D+IwAFAAwC8YqiRzl73IWS6z+Vg3a76nbaeFesvDVyt3lxn6j/cRoOsDkG89D9irZvWoqpJucSSQR9WnxcBfi//XiHN+9GD+PeBASIXRbbGZOhKFeJdu1MST8pzc34yi/qmIfN1xTYuHidrpYiatYw2u2Z04KyyogeJpgcLVQ05xRvDrx6/mbeZBBWT4f0M0VnnxFTYYdR2v8Om2/XSh94qDqrXSv15EJaYIqp4jlpUJaTVeASaaAKRaZD7yLKwt36Rs995CyHuo/9RRPzinCjUNgdE7gtNDGeFP3td6/+RNxwtfQEWM48SWftz+Tr+KcrMU7iz/7QPKAOzjoEYDdIbyfqVBUcQXoQw3sOv9/exdRd3THv6A8NVVA/OwaAsOnXTEkJbQ3rAaxJsmgvnnJQjgeLWP0PA6Zx2efuiaYpVAnVSMa9v+NWf/u4kJkdFcE4nI5ONmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(136003)(396003)(39860400002)(346002)(451199021)(54906003)(6486002)(6666004)(82960400001)(478600001)(8936002)(5660300002)(44832011)(2906002)(8676002)(36756003)(30864003)(31696002)(86362001)(38100700002)(316002)(4326008)(66556008)(66476007)(66946007)(41300700001)(53546011)(26005)(6512007)(6506007)(66574015)(31686004)(83380400001)(186003)(2616005)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEZqaXdDSWw4c0xjYTlqMnk4WnJlYzhweDhIaVl6N1RBc1pJNGhxOVZZNVIy?=
 =?utf-8?B?b3NxdjhyWHRhQ3R1ZkYvc215cmJKWU5aZUZUODNDbGI4bENqdEdwd0wwNEFt?=
 =?utf-8?B?UnRpRU9FU09CaU9EZ25VUUcybjVDU0ZlOWZLM2l5cHBZdmg2eTZ0Myt1Qm5H?=
 =?utf-8?B?U0w2VEQ0NDBmbWNTaHVNTEY3YTNuQURzdFZ5RnNyWVhIZ0tsYVB3VlJzVXVE?=
 =?utf-8?B?QkNJaExCRVN6dm00OWpBMjc3aDdpTVd3K0paeVdqaWJUSzQ1UldvdEMxWTVp?=
 =?utf-8?B?SnBpbDU1UU52RDhZSHRITS8zZ1NIRjFEQktFOXAwQkpzeDM1Um9uSTVvNHNN?=
 =?utf-8?B?b1dyZFRjWGZpRHl2K08ybkwwL3BrOUh0TG0wb0Z0OWppOTFydzFGVnNBeE5Y?=
 =?utf-8?B?ZktncHBzZGNDVlo5Vk9LUVZFbTJBTmxYZVVNSGpwSjJNUnNhQTZsdEllaUVB?=
 =?utf-8?B?V0NWU0RIVXdvd3J4WmFOd0tMWHBqSjh6TCtyMHNJcDYyN0tYYmZoZWhvVEZh?=
 =?utf-8?B?b015MGNNUjJDVXJlZ0JkUXZWSlJrVGJxcnNuR3I5ODBpTHdHTlg3dVN1eHdy?=
 =?utf-8?B?YjdpVTdUd1ptS1RmK1c2RFRVNHZZSUVOUVRnaVN3NHltbGZJcjg5YnEvUUIz?=
 =?utf-8?B?YzEvZ0FyYjY4djNkUGxqcE92YmVtZXhzTzNRNW5nYzBRNTFLdE9zTllWUytt?=
 =?utf-8?B?NitsZktSb094OEVwMGdqMnZaM3AwWDdsNmlSU2MzNmRFRWFvUXRsYWs4a0Mv?=
 =?utf-8?B?MUIvUjB6ZTZLeW9LMllYUGNKZzNaenFSbGM5T0RaZGJFeElhZjkva3JVWlFM?=
 =?utf-8?B?Qm9vNStyanpqa1FOVktWV1pXY2U4K3REU3JDNjVUTm9YMkZCR0lIazZ5c3Jt?=
 =?utf-8?B?LzVVM1lxK3VNdllodENIT00rU3Q5SnRWZzZBSG1oS3FqWWJ5cHU4V3FMcmx2?=
 =?utf-8?B?bEY3a2NSRWN5dDh2UGxZcURJb2lNaE56MVdURGJyc2FLcWRrZUdYMElMQ3VE?=
 =?utf-8?B?OEt3NkVPRFlLdTA3YytiKzZPT3hnTjlIdTRNTVZEMlI3VGNTUUNkMXp5WnU3?=
 =?utf-8?B?UTlmOUFEZXI1TktMdzlGUjFQWXlqSlZuU2crZHVkTGNTN0RUbFZrcXpqdkFQ?=
 =?utf-8?B?Q1BTem9TbWFXMUtra2RNUXF6VGJGS1FRdHVKU2NJMUZDdmlVUDUrTXZERGY2?=
 =?utf-8?B?Z1pZK25TOE9KREZEMGo2VGNrSUJXamtpMVBiLzJ0Y2FCVTdZUnR0a3BLYzBx?=
 =?utf-8?B?b0ppcHhLNmtKelNyRWE5a1lrdmhzTDR0TU54blZseVF0V2xpVzRpTVBYV3RC?=
 =?utf-8?B?azZXdm9PNzIyY0FkOVRvam1uTlNRdUswSXJSaEJmazRUakovS3Nad05aWENT?=
 =?utf-8?B?UVlaOHNTTnJTWiswdEl4NEFnZ3hUZVFiaVozZWluS3A5dGlxeitld1lscE8z?=
 =?utf-8?B?L0VPK1BMLzlNVjVKYXRaTldFd1Z4dDMvZXhlcm5BVE83REtzcm9TU2FBaGh2?=
 =?utf-8?B?bXVLeFRJcE9rU2hHZk1XR2RMYmxjV0VYRjkyV1dIWXVObStrNXRqaVJWSTdE?=
 =?utf-8?B?dUtNemdjU3RJeWZnY25nakNtM0dwZXVmSCtZakhvRXhaQ2pEM3NMeXFUL2RV?=
 =?utf-8?B?TTBCelB3aDNsdFA5OTFtREx6cFhqbUZyTHQvR1R6WEV5L1NqOG43aCt5Y1dO?=
 =?utf-8?B?RUYzTVF0Wjh4bm40YUM3QlMwdGMydHhFS0hmM2hBRytKdVZ0R1U5NWw4aHJh?=
 =?utf-8?B?ZFFKaEw0U3lwbThjZWx1eXFqVDRraTlBOFdaK0VqZjI3cHpRMVVvemlYeGtL?=
 =?utf-8?B?TE5KMmhSSityQ0ZpbjRZSU9TZ1FVZm9TK2lMUVhNNzN5cG5KdUFKQWxWTDg1?=
 =?utf-8?B?VmJDZXpGc1dsem5XWmhLMEJnNnd1eWdXdUV2azRYUkI5dFhSNUFOaVV5TDR4?=
 =?utf-8?B?c0ZkREExOGRKaXB1dmxRVUdqdzFnTTArRmFVb1FyV200ZmZvWDZYOHhhRDB2?=
 =?utf-8?B?WkdaSXhneE5XUVdRYWJUN1FqOFd5NDZrYU9KSUtZZEVpeUFmczRrdVZHT29E?=
 =?utf-8?B?TERodTd0eXI3STJ5U2FZK2pqNjFqdlZTVDU3TGc4QW5JdXVkMXpzeUJQZG9Y?=
 =?utf-8?B?bkI4NDUzZ1hiZldMSWk4RGdROVRSREp1N2x2d3NDUWRqbjVUMGQ2ZytCQ2Z1?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4e8cb0-19bb-4d20-b479-08db7c58e9de
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 06:35:53.2955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /B/HVwLW/Ed+8Sku08oASGTs/EOyKwVKItO5rVgjZoik3KrExWiUFBaRVzw7QNnx7kZf8yMR/ypjSvwk62yNL+qDqPMwoYpm2EgRmA1LRpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

On 3.07.2023 13:21, Christian König wrote:
> 
> 
> Am 03.07.23 um 09:58 schrieb Karolina Stolarek:
>> Add KUnit tests that exercise page allocation using page pools
>> and freeing pages, either by returning them to the pool or
>> freeing them. Add a basic test for ttm_pool cleanup. Introduce
>> helpers to create a dummy ttm_buffer_object.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/Makefile            |   1 +
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  15 +
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 405 ++++++++++++++++++
>>   4 files changed, 425 insertions(+)
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
>> index 428a8a4ac9dc..9384679fccb0 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -26,6 +26,21 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>   }
>>   EXPORT_SYMBOL_GPL(ttm_kunit_helper_init_device);
>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>> *test,
>> +                               size_t size)
>> +{
>> +    struct drm_gem_object gem_obj = { .size = size };
>> +    struct ttm_buffer_object *bo;
>> +
>> +    bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
>> +    KUNIT_ASSERT_NOT_NULL(test, bo);
>> +
>> +    bo->base = gem_obj;
>> +
>> +    return bo;
>> +}
>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
>> +
>>   int ttm_test_devices_init(struct kunit *test)
>>   {
>>       struct ttm_test_devices_priv *priv;
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> index bf0b1000a8ee..41ad38dd34e5 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>> @@ -7,6 +7,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/ttm/ttm_device.h>
>> +#include <drm/ttm/ttm_bo.h>
>>   #include <drm/drm_kunit_helpers.h>
>>   #include <kunit/test.h>
>> @@ -23,6 +24,9 @@ int ttm_kunit_helper_init_device(struct kunit *test,
>>                     bool use_dma_alloc,
>>                     bool use_dma32);
>> +struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit 
>> *test,
>> +                               size_t size);
>> +
>>   int ttm_test_devices_init(struct kunit *test);
>>   void ttm_test_devices_fini(struct kunit *test);
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> new file mode 100644
>> index 000000000000..85806f72df22
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -0,0 +1,405 @@
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
>> +    ttm_bo_put(bo);
> 
> That won't work. A BO must always outlive the TT object allocated for it. >
> Otherwise you can get crashes during TT release.

OK, I can keep it around, probably as an another test->priv member.

I thought that for these mocks it should be fine -- ttm_tt_init_fields() 
only takes the scatter list from BO which is not in use (as for now, at 
least) and in ttm_tt_fini() we don't even touch that field.

All the best,
Karolina

> 
> Regards,
> Christian.
> 
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
