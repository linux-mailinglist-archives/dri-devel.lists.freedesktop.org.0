Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3345722D87
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 19:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E33710E305;
	Mon,  5 Jun 2023 17:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0F10E308;
 Mon,  5 Jun 2023 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685985723; x=1717521723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gchbJ2TWLvQ0m4ubZQtZ2C6C1oBYEFQfGpwkejfKFx4=;
 b=bNdQMvhhMD2HjGbZezzBNeGMV7yuv7WVIGMexxgRNTe3qxoS/OVYOTic
 IEAY0Fo8bIfSgBDQ2sz0yy1/hNyeb4x2pDjdDQBksmszYsiDLbJhwOFI0
 GL1O6BWokSThpkSjYlYMvn1M4Ls3sPSCO129++B+m+qX0ZAVaXCfyMXeP
 jPHuEL5babS0j2z1/ExoUjN5FY3hK+3Y7sM0vlOFe7dbt5Cw7GEwutJ26
 6kMKxwbCztSYzvmqtMtK4tocStdVm3SHTJyBtCdHokH2WDPAYhi4DJYkT
 5pvMVJgsdJUvSlndohcR16t5MnYEsIDr7P+U+sT11eh7NQi2fhmQ6kf3J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="336047298"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="336047298"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 10:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="883001773"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; d="scan'208";a="883001773"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 05 Jun 2023 10:22:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 10:22:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 10:22:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 10:22:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vi2/fHaJqsqcalQVWAFMZuhq2hNQ6KeBXVZYejBb9MvlZJUiAkPah6USusisn/JojhlFtz5CDz8lpicmVaFnmbSiuQE/DM7U+PQeX+DkD4+YMpYXqAw/qdMkVUZFmdkPH7f7aTQNN8Apv4PBN9AklGlpRLSsszne2MI9OqAgLWWDt8Mp1EiHIVhcD1ea81+/pHNu/jWIHUpXFIBdetSuXH4TZHhP0GKZZ0T3YdCrbnOosgtcV/c2wja1qD/JzXS10yrIZM46sW1HLzQPPCjmhrym5TrrOhPXbKdXo7rPmeYdYQil2thWAViViBglfKuaEg4rV4UU4rLMQJQ5IVwT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mydSL08ALVaWW0vj5uNy3gULHsLn8HMGjfk02J+8hvY=;
 b=XPsP62luPEDls9cBmToKVKMYoGIzq48grccfpbjkO7LcAN6P1J3gUbMUwJH4DkwdwRt4EiYaXA+7VGhSVmOa1HHZ/eCUlocAE58fKg3j+dukH3tffU6hAAe/upSVJqyvo+wVPXkVB1Tc5JS0A5nGHLOGLxw2QN+fj4B0D0rm6R+4uqyI29JsemMI4S06GDDuZX/3NRZRmaR4ek7mvIeUiWK1mRu/4ty7BSw6N08JjZxpRJDDxwcTE+HXPK1WqUKy2WAJrlOsY+O8xR1BoRwkB3VPk7YHvMyVgzNfeEkFQAd9wJL0hFfBNiGC0lLYO/Xi30r0W2sauWAxDLw+ftzbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 17:21:59 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::13aa:6fa9:70a7:4735%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 17:21:59 +0000
Message-ID: <cdfe8b1b-641b-029b-4dc5-170835cab011@intel.com>
Date: Mon, 5 Jun 2023 22:51:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [Intel-xe] [RFC 2/5] drm/xe/RAS: Register a genl netlink family
Content-Language: en-US
To: Tomer Tayar <ttayar@habana.ai>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <20230526162016.428357-3-aravind.iddamsetty@intel.com>
 <d22fbece-e6f3-cc6a-789b-bdbe99c70ced@habana.ai>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <d22fbece-e6f3-cc6a-789b-bdbe99c70ced@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CY8PR11MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fc5fe5-8356-4f82-9a8c-08db65e95ebb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l5R5E/47OS1pc30ir8+9Ys2ywYSLYiu1iNDZp2jo1RshF2QPncHO5BzXYOFbZfMTgV/YRobGto5x3BqqVLcqKnNo0pSl1/p98arkcZqiKx9IjUIi2LXG7UxGKeL0q92vJVW2lMiv1JYWFPfnLXtE3YIaTihIl3l3/53yy0eMf2P8CoNyCRNYZBJT4d1SGqf7vk4nfZSeXLNIS32s2KvJA5UvKUiBnjTqvs0RKmWKlKsLXY31i8JYQrUi3K1AQ8EtIRcPMf9qWjWG3K6plM649s6Ld+0KTydSqE++QzG33d3cJXcn24KEjAgbWhqDEvY9kDQ/2dosO1yR8ta0aHxr8qrh+dElQ34NTj38ZYOo+tkWGdcJKJ6V2bmtfcoV/19OnGBkCgcwYoBtkz29kQ2f5XihguJSmm+Wpl5AUZoi82sbEu653o48gpFatPxIGabAk++tF0X23yO2q6lMoGlbgg2aYxB88a0S4YSs7ThC8EvteMvWmeWCgBTttn2Xuxwjrlj5KAuy7jZbY+QvZwjHx5bSMpRxCtdJdkrwZjESKpRd1OY/1cs2pXj3w7zJfGHv6esY2oGrXQNpMldiPJV5nUu2iZjD0OCEmpb9sIcU08HXr0P/qIFADl89PZyXk7ntO3L4E+lrRkbO0UF7zSQgFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199021)(186003)(6506007)(26005)(6512007)(53546011)(2616005)(31686004)(83380400001)(36756003)(6666004)(6486002)(2906002)(8676002)(8936002)(82960400001)(110136005)(54906003)(478600001)(38100700002)(5660300002)(31696002)(4326008)(86362001)(316002)(41300700001)(66556008)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WS9iN0JKKzlwWGlOYmNSL2hYWXltMTU3MVNSUjNDR09lZVNHRnlHVGUwcExt?=
 =?utf-8?B?ZGRaemVYaC90NmZ2UFE3enBVRlpqcHpNSUVhQmtiSVJ2Z2w1OW1kUHBiS3ZI?=
 =?utf-8?B?TXRpMVptaVlFVW5hQk1CM08rL2ZHNWVsM3J1RnhqNCtkTHVSVWJEdG0rSG5B?=
 =?utf-8?B?cUR2Zjk3bDN2L3lIbGVHT3JUaENvMmROL0UxNUQwM0JxYzRnei9aQlRIWkpl?=
 =?utf-8?B?YllrdGdTNWNZMUs2ZTh4aDJPQ3I3aVc4emFORVVXRXJIaVNzMm5HK0pYcnVW?=
 =?utf-8?B?YnZVTkZhUWFJQXZodHNEbGtxa3NKR0h6WTVDMTNKWlBxS1gxNVgzRmN3dG5k?=
 =?utf-8?B?eGxoYXRrZDdkR1V6ZU02MTdOLzQ3dWYzTCtCK1hOMXB0TVN0Ykwwc095TE9j?=
 =?utf-8?B?MVNYRWlKSXA2WUR2T1FjTURLQXRnNGhDV2toMEFHR0JtUFo4MVBiL0tBMENp?=
 =?utf-8?B?Qkkzc1FmWVliRWs3SmJ5cjZOWlpHbmxKV3ZCS1JGaURNRmRlbHZPMGNGWGJo?=
 =?utf-8?B?STd3UENNUS9nQmo2MVIxZ3BFZXM3ZXBVTENpOW1CYTVoRzJsRVF2ckdsZ2ZC?=
 =?utf-8?B?SHRVdWo4YWVPY1dHcWgvR3NVZEEwdjVzOEdCbDc3OFR3VFM1eXdNM0o3eGZs?=
 =?utf-8?B?YjZ5QmlyY3NQb1d6Ky9odGtjRWZEdzVtQ1pjWmdRejJ5QTk4YU4wekhpOWNy?=
 =?utf-8?B?K0ljL3hCWDdIaUltbVhBSis5aVRhdW5Jd01zQi9QS2IvbG9kdGdweGlwUGZs?=
 =?utf-8?B?UDQvOE1PMEo1YVdieXMvenEyYzl6L0o4NEhoZUhuSnQzVjFkbFh1RDZHVjYv?=
 =?utf-8?B?cXJKOHZFYk5HdjlKc1JWQTBqc2FnczdPZWhkejBFa1ZiK3JyN1liclZoQ0I4?=
 =?utf-8?B?bTd1Q0kyQzVoOHVhQTRxMVF2eldsMGVKc29BejJCOGxBSVJDbENMYnBIRE9v?=
 =?utf-8?B?enRpbTQ4NXhDcFhuY3UzN0piSVpvTDhTRzJoOEhWWGE1Zzd4bUxVekVjVUtR?=
 =?utf-8?B?TlRhdytyUmF3bStoa1dmbG5VaVdJclEzTjVyL0E0emRzRVB0enNSdVBYcnl2?=
 =?utf-8?B?c0V6b3U1cEEwSnlnQThrd0gwYUw0R2JTcFFWY0R6Y0FuVkFlOTd2bTJ6eEdH?=
 =?utf-8?B?Z1k1Tm90WTZocFFUbCs5OVZxdUJGUmVEUExsV09QZFRqbGxNZUZXT0x3TmlE?=
 =?utf-8?B?T2FvRUk1ME5GK1ZZUm8vWWlaNmRWTHdhRHdTWlVlWmJuSmhiRUYvOGJiZW5q?=
 =?utf-8?B?Vm92Z1ByUTRJL3E4Nk9sNjdxcENiVWlpVzVoQ05ETHRZL1BvL2x6dHdJNEZL?=
 =?utf-8?B?QUVLZUpqNFpOWVFDbHhnRDBXS1JvNG8wVzlCaDlrVlQ0K2YwNEZrekFWUjE5?=
 =?utf-8?B?cWx5UVNlKzJTUDFiRmpOM2NybTFjZmxYNmxzRVZLM1RBdlpSSmxrYVY0UXF1?=
 =?utf-8?B?alN5UWJ2dXhnM2xFdHdBU3pjcGhiMjZQRzFKOUxFNEkzRmZPVDREMmRhakV6?=
 =?utf-8?B?WXlrdzZRck44VGhwNmEzMGdJM0pMWkV5WmdSbXBwVTZWTXVYbHVoaC84alE5?=
 =?utf-8?B?OHJ6MWs5VkNNUk15ZlVHR1Nrekx5WW5KR2JwcHhWeFQwVFMxc1VPcUhmWWFm?=
 =?utf-8?B?c2Q4VzJ1dmVGb09xcTE1QmFMWExWczFNQlN4V2RCQitSUkJBR0NyMHEraXA3?=
 =?utf-8?B?enphdkJNbUxBcWVyU3RXZU9hOHRyMG1IK2N1dlcvOVJzcnY1VFFyQ2ozVjd1?=
 =?utf-8?B?K0k2c0tGQ2Y3ZU5uUXh6bUtXN01WMm5DMzVMdVM5ZCtiQUtRcUVGSjV3Z0kx?=
 =?utf-8?B?OVRpQWJtK1hxSWxJNjdWRFp0cUl2dDNRQ0dMVmsrQ0trbEQxNXJleUtUSXZ2?=
 =?utf-8?B?Q2o4b2ZJWG1LV2JLMmNOdnJ6UzQ2emc3bzZFd0I5d0l3MDV1OG1aVzVFbzdo?=
 =?utf-8?B?ckhLZkt0Qkd5M0o0c3VTTVlrckwwaFZoTEFCYVBsV2dNNTdseTcxZVRlZDVS?=
 =?utf-8?B?MVZVakVsd2wzMm9Oem85M1Foa2FHLzlySHZob25ZaW1iWjZqVEEza2V4ci9n?=
 =?utf-8?B?aEErTklOR1ZVeUFWMFpCWHBhaVVFLzU4c2ZRc1VqTlkzUG5PK3R2TENualJS?=
 =?utf-8?B?YkwvNUxwc0h3Y3hSN2FKamxHQVpTdXR2Ly80ZlNPMUZYcEdyNUNTMWlRRHlt?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fc5fe5-8356-4f82-9a8c-08db65e95ebb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 17:21:59.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+WpybTPkX4FgNPJHT86SId+2QSZ8ATSNrRremmU7gNhDm8+1+KTTxIHiCh91qjOl1254uxSifpxMVwiLlgKZV+jgEdZJBEkQp2Lt0o7x7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04-06-2023 22:39, Tomer Tayar wrote:
> On 26/05/2023 19:20, Aravind Iddamsetty wrote:
>> Use the generic netlink(genl) subsystem to expose the RAS counters to
>> userspace. We define a family structure and operations and register to
>> genl subsystem and these callbacks will be invoked by genl subsystem when
>> userspace sends a registered command with a family identifier to genl
>> subsystem.
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  1 +
>>   drivers/gpu/drm/xe/xe_device.c       |  3 +
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 +
>>   drivers/gpu/drm/xe/xe_module.c       |  2 +
>>   drivers/gpu/drm/xe/xe_netlink.c      | 89 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_netlink.h      | 14 +++++
>>   6 files changed, 111 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_netlink.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index b84e191ba14f..2b42165bc824 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -67,6 +67,7 @@ xe-y += xe_bb.o \
>>   	xe_mmio.o \
>>   	xe_mocs.o \
>>   	xe_module.o \
>> +	xe_netlink.o \
>>   	xe_pat.o \
>>   	xe_pci.o \
>>   	xe_pcode.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 323356a44e7f..aa12ef12d9dc 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -24,6 +24,7 @@
>>   #include "xe_irq.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> +#include "xe_netlink.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pm.h"
>>   #include "xe_query.h"
>> @@ -317,6 +318,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_display_register(xe);
>>   
>> +	xe_genl_register(xe);
> 
> xe_genl_register() can fail

That is right but I didn't want to fail the driver load as it would not
impact any device functionality but doesn't provide observability. hence
a warning would be printed "xe genl family registration failed".
> 
>> +
>>   	xe_debugfs_register(xe);
>>   
>>   	err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 682ebdd1c09e..c9612a54c48f 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -10,6 +10,7 @@
>>   
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_netlink.h>
>>   #include <drm/ttm/ttm_device.h>
>>   
>>   #include "xe_gt_types.h"
>> @@ -347,6 +348,7 @@ struct xe_device {
>>   		u32 lvds_channel_mode;
>>   	} params;
>>   #endif
>> +	struct genl_family xe_genl_family;
> 
> Should it be added above, before the "private" section?
> Maybe add a kernel-doc comment for it?

thanks for pointing out will move it there.

> 
>>   };
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 6860586ce7f8..1eb73eb9a9a5 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>>   #include "xe_drv.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_module.h"
>> +#include "xe_netlink.h"
>>   #include "xe_pci.h"
>>   #include "xe_sched_job.h"
>>   
>> @@ -67,6 +68,7 @@ static void __exit xe_exit(void)
>>   {
>>   	int i;
>>   
>> +	xe_genl_cleanup();
>>   	xe_unregister_pci_driver();
>>   
>>   	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
>> diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
>> new file mode 100644
>> index 000000000000..63ef238ebc27
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_netlink.c
>> @@ -0,0 +1,89 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +
>> +DEFINE_XARRAY(xe_xarray);
> 
> xe_array sounds too generic. Maybe it should be more specific like 
> xe_genl_xarray?
> In addition, it should be probably static.

Ok.

Thanks,
Aravind.
> 
> Thanks,
> Tomer
> 
>> +
>> +static int xe_genl_list_errors(struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int xe_genl_read_error(struct sk_buff *msg, struct genl_info *info)
>> +{
>> +	return 0;
>> +}
>> +
>> +/* operations definition */
>> +static const struct genl_ops xe_genl_ops[] = {
>> +	{
>> +		.cmd = DRM_CMD_QUERY,
>> +		.doit = xe_genl_list_errors,
>> +		.policy = drm_attr_policy_query,
>> +	},
>> +	{
>> +		.cmd = DRM_CMD_READ_ONE,
>> +		.doit = xe_genl_read_error,
>> +		.policy = drm_attr_policy_read_one,
>> +	},
>> +	{
>> +		.cmd = DRM_CMD_READ_ALL,
>> +		.doit = xe_genl_list_errors,
>> +		.policy = drm_attr_policy_query,
>> +	},
>> +};
>> +
>> +static void xe_genl_deregister(struct drm_device *dev,  void *arg)
>> +{
>> +	struct xe_device *xe = arg;
>> +
>> +	xa_erase(&xe_xarray, xe->xe_genl_family.id);
>> +
>> +	drm_dbg_driver(&xe->drm, "unregistering genl family %s\n", xe->xe_genl_family.name);
>> +
>> +	genl_unregister_family(&xe->xe_genl_family);
>> +}
>> +
>> +static void xe_genl_family_init(struct xe_device *xe)
>> +{
>> +	/* Use drm primary node name eg: card0 to name the genl family */
>> +	snprintf(xe->xe_genl_family.name, sizeof(xe->xe_genl_family.name), "%s", xe->drm.primary->kdev->kobj.name);
>> +	xe->xe_genl_family.version = DRM_GENL_VERSION;
>> +	xe->xe_genl_family.parallel_ops = true;
>> +	xe->xe_genl_family.ops = xe_genl_ops;
>> +	xe->xe_genl_family.n_ops = ARRAY_SIZE(xe_genl_ops);
>> +	xe->xe_genl_family.maxattr = DRM_ATTR_MAX;
>> +	xe->xe_genl_family.module = THIS_MODULE;
>> +}
>> +
>> +int xe_genl_register(struct xe_device *xe)
>> +{
>> +	int ret;
>> +
>> +	xe_genl_family_init(xe);
>> +
>> +	ret = genl_register_family(&xe->xe_genl_family);
>> +	if (ret < 0) {
>> +		drm_warn(&xe->drm, "xe genl family registration failed\n");
>> +		return ret;
>> +	}
>> +
>> +	drm_dbg_driver(&xe->drm, "genl family id %d and name %s\n", xe->xe_genl_family.id, xe->xe_genl_family.name);
>> +
>> +	xa_store(&xe_xarray, xe->xe_genl_family.id, xe, GFP_KERNEL);
>> +
>> +	ret = drmm_add_action_or_reset(&xe->drm, xe_genl_deregister, xe);
>> +
>> +	return ret;
>> +}
>> +
>> +void xe_genl_cleanup(void)
>> +{
>> +	/* destroy xarray */
>> +	xa_destroy(&xe_xarray);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_netlink.h b/drivers/gpu/drm/xe/xe_netlink.h
>> new file mode 100644
>> index 000000000000..3bbddb620539
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_netlink.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GENL_H_
>> +#define _XE_GENL_H_
>> +
>> +#include "xe_device.h"
>> +
>> +int xe_genl_register(struct xe_device *xe);
>> +void xe_genl_cleanup(void);
>> +
>> +#endif
> 
> 
