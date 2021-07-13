Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC03C6783
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 02:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E34689F53;
	Tue, 13 Jul 2021 00:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B336A89FDE;
 Tue, 13 Jul 2021 00:37:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190455870"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="190455870"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 17:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="649089960"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 12 Jul 2021 17:37:23 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 12 Jul 2021 17:37:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 12 Jul 2021 17:37:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 12 Jul 2021 17:37:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 12 Jul 2021 17:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw2Jn3DJI3c6YwkpHiCtEOl2IeTCnaf/xe8lBzVRv1NaYEaaT71vpg65M2dTexUNnjAR1qq9wEL6i4yxrJFruQ0Kn89S+D+n0kDwK0P8AWr1H8w3poeY3XDjBETAkg8NQyOtDlwpf4TRk5oY0wYyIyzNhUzTFSO71exbDnyuPj0rFGYMFF7d3iOBdiMevuIbG42xmIuZDaJWRnTjvsJsVD0SJ25VmUvzMBY/KvLYknexMCDJqzmdCJPg+0aXmOacBb5OCzyFcilk+Syss8zhFEp1IvyVPNR+O/lqdW3fInCh9nt2RuKhC4t8ruANNZLgh/ZSQRmXRU3R08Qt5+9wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsU9ebjL9RiWx7cHBXxWMx1MPSQRjaYKgwTO5RcYOC4=;
 b=DnlVFihJHkeB1X6CCLb7x/Pw64OMZwRu8PBtTUU0CRkhK9tDw+vfZdr7NtbtJ6RXg3OEAWcHuoQyIIUyx1ygz5oLJa4MBkatk2DqlQSzs0aOf7iHTXTgtARLmm3h/79X/3oKnyJkX7JyRO7mvRTBJlbEA+KG939kyhQyrjxr0u3f1mlaGnNPOoKxnobRDtOGLVgTL5h/TMrU3/G7Y/wXatev6/Utx7Cjy4L9DDE667LwbAflQurJjBZLNL1OUmMsa7ky0pUEaQkuISxieIXD6/nCRCdoBnNpX+pEgh63gHN9Lry3z7B5VbHE9dazuYD7dZQTdWNvy+Cb18JWuavYrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsU9ebjL9RiWx7cHBXxWMx1MPSQRjaYKgwTO5RcYOC4=;
 b=ktQUxse+vPJyQYKNlYyrRhH9DuV73CEeUtra8f0qVZ2usMCJM5VSIcVvdjhrWWzlaaMVUAHIEWmC7dYEiC4qIltSm3IOqrxKGZWT2AusJWKTIevuJvo+05x8NjenBEoXzjAKWqoloC8ihjpBNv2ECiCzsNsLXSBWsh3dhGNYzu0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5635.namprd11.prod.outlook.com (2603:10b6:5:35f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 00:37:13 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 00:37:13 +0000
Subject: Re: [Intel-gfx] [PATCH 04/16] drm/i915/guc/slpc: Lay out slpc
 init/enable/disable/fini
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-5-vinay.belgaumkar@intel.com>
 <dca4c062-68fb-c525-da44-cbfdd51df326@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <d9309fdc-3647-4690-5770-5bbc7dbb76bc@intel.com>
Date: Mon, 12 Jul 2021 17:37:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <dca4c062-68fb-c525-da44-cbfdd51df326@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::10) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BY3PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:39b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.10 via Frontend
 Transport; Tue, 13 Jul 2021 00:37:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7798959-ebb3-4bbd-d929-08d945965ba5
X-MS-TrafficTypeDiagnostic: CO6PR11MB5635:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5635DCFFA89178FB04D9979C85149@CO6PR11MB5635.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEo6d9pz7vn9dOSwuNoZWDTDBVVRBdslH2bvoR+BmwVSa+/ny6BhysWf6gXZ6eas620zZ06u/zsPH0pI+ZOAhj4UYYvqoJFE+pDfShyfyZxgqnQdQA51qshqS1CGdAMKbnEr5YFBrISun/qgdddSF2ktnjLO+PAxOSDRQXY/nkLcsI9ndsYcu4kkBFGbzHUodSqu3PwYlqIt2uNUX0C77ne3fVQEy444el2Sd9wPgxIPXdjrUyILX6/0mxSwYCUlTc16YdSXolN9MszM0U8e6m80M0HlsXq2Hg8r/Wz/lCtxS798nCZPYLholhamueO/YMpWmGlr0S0nHElNp3HrECQujz8GOSJvlCd9nYpQz0L9GtIDKKr1xDpFoOQZs+lskja053CIqRULOGy+NV+Z75TipeVQJIbHX3Gdwswe0482bTQFKXOAiGjM6vQpFQqScpGgwCE+o1wjauevLH++YqF432u75AGigoYL3VdauBuC5HI4VHj+lDafRzFZ/w4IO3qX2Dk8FHWvQZ0U+Dw+t20VY3xSqRxaNukCmj60RzFeRNFquuSJAdXR57fcrJFlIKfn6Lpj1+CBZV+7fqxrUyfzjedg6WCkwC3ZgQgXSYs59eumal+HznLxQmE3/cqyJnA0C2qsopdegH66N7wi68ZsrzoiuTbElZLpYA+W16S3rgzPMRHYRDsZrU87GwGIrEtv0em+koh4ytb4XLJxFruBQTzB4ehhqUYmUlqtGv8LZD5OKzbhak2FzuI5Dhao
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(316002)(956004)(186003)(26005)(2906002)(66556008)(66476007)(36756003)(16576012)(8936002)(66946007)(6486002)(8676002)(53546011)(478600001)(5660300002)(38100700002)(83380400001)(31696002)(31686004)(450100002)(2616005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUVIK1NaR1FRVFVraFVQakJXN0pQUFB6YXNWd3RVOVFmRXpQd2pRUkZTRXo1?=
 =?utf-8?B?dmRXa3lIZkV6M2NrTXQ2NzVpVEoweHdHMFVacVJSOGdOZ00rRXNIcmxJdEcy?=
 =?utf-8?B?c1pYR215OFg2M2lLZ2gzU3FaS3I1Z2RXMy9BVUZWM1lORHpQb1h3MWZUMUNQ?=
 =?utf-8?B?ODMvczhyVUIzWTNISkJ0R0JteGp4RHhsMW5Vd3lRTWRiWEtoV2wyQWdZWTFl?=
 =?utf-8?B?eU9pZGFxVUtKa25kcnN3MHlweWFHVHJGQThaTzRDVzE2WEY3S3Vibml6OEor?=
 =?utf-8?B?MFVQMEJNelpLblg2R211NkZnMVhFNEdOWHRpR1Qvd1dWODBpdHNPbFJ1c2wx?=
 =?utf-8?B?eC9JdURTa2tIUytDbDIzMHlmQVlTWjYvVkczRTlXSnAwMHRibzRCTGgzNmNH?=
 =?utf-8?B?Z09tU0w5YzBvc1BBYWhXc0hQV1dYY0FFd1dYVzAzZUZld2Z6SXQyS3p4MDBD?=
 =?utf-8?B?eWJ6VkRuTlpNZTQ3dExkK2x0OE9UU29wYU1MSkJ4Mms0QWJuQ0ZocEQ2RFA4?=
 =?utf-8?B?aVIySG40T3UzWExDOGlzREc4QmZ6NjJnekRnOUREWVZ5ZnFrd1AzTW9iVjJl?=
 =?utf-8?B?QTM5ZzZ3MmtIcitkanVNd1psNHBFUStNTExxbUNnK0xmUTlrK2FIWlpMNWZq?=
 =?utf-8?B?aU5CTGlUMG8rWGNZV1FYVFdlSm41R0J6RkJDOFRHNTYyU2hINU9GOEw2SllE?=
 =?utf-8?B?RUp5MDY0OGZSZnh6OUtVRXRESS9BSFdaQVhnZU54U2FHUi9EbExZV2NYUita?=
 =?utf-8?B?ZTdkQTZVTzZMKzdtSVNWMEVXRlR2dDF5S2dVZStUdTVHRU9XTXo2TXErckhG?=
 =?utf-8?B?WEhwOHQrcGtHbFBxUDFyVXBTbGZVaXhvNGFGaGppQlhVUkI1V3pXdEpobndJ?=
 =?utf-8?B?RlFOQ05CT3V6NW50N0REMUtSZ0NQRkxZREwwMFB1cEcvdUtCeUdnRUJacHJj?=
 =?utf-8?B?b3BTcnNVSnkzNlZsMVpjSng4R3grc0Z6cWxTdzRFNWRBSURXblRGOEpyTmF5?=
 =?utf-8?B?UnJiWVJ2L2ZmdWZwT05LTEZLREkzQkJRZDJTNzRxWklrS040TURmVlAvTklp?=
 =?utf-8?B?Ym9qbWhEUFgzZXJyUDdNQWtMdzJ5UnpSUjNKVjJVaVdpZUY3bk90UURnNHM1?=
 =?utf-8?B?a2VqM1VaelErZWRjWEZKNFV2WFovQTRoZVdaMFY0emRCcEVrV0NXYlpRSzNy?=
 =?utf-8?B?Ujh1aDlhTkdBY0ljbG5RMmFkaHlXbmpKaTdaNG5EOVVYSUxHcTdLQ3ZRbTZl?=
 =?utf-8?B?VTFIVFQ3Tkwydy9kNnkwR3pvTm5ldlVnRHNQYTlWa25wcXU1cllTeGdTTEJl?=
 =?utf-8?B?WVlpazNieWY2N05HN2pqRkFzaHJJQ3ZocXhqSUFNcmNnRHRQeUczRXpFMWZv?=
 =?utf-8?B?UnVJVmRubklKUExQMzFNdEk1V0NETlIvQUwwVnF1K0lralhYaFhKa2NkU1A1?=
 =?utf-8?B?WU8zbDlpNjRBWTNsUUZkSEE3ckh3MXB0bHRld2tBdHhsTVdwOFZuc1NUNVZT?=
 =?utf-8?B?VllXWHhhS2hXdVZiaXExNkRPRkhjQTNZdVgrVnpiaVk1T3dDekh6YWEwSFhU?=
 =?utf-8?B?bUZab3FzRWVld1oxZVZQL0pUVGR6UTE1OFRKdVJ0VFJxcXBSdDNTUnY4R1kr?=
 =?utf-8?B?cGczaXppY0Vra2xxRGVacWdTTGRsZjdldDRQekFia2JRck5wSTErbHVBS0R5?=
 =?utf-8?B?ZDN0eFpmdjFqWmw0aVhlallSS2YzOW5FQ0ZQN1lUQmVvRjNwVld6ckNtU2Jj?=
 =?utf-8?Q?X3ZtJNrPQwVCWMxsMPT96CQ827qfHro+7LqOOcG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7798959-ebb3-4bbd-d929-08d945965ba5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 00:37:13.5747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhLXCnpn7Qly8eFZMW9vdTMzZR5h0UtcUAMFxXj96G0gOiTghM64BPn3WyU1DngOvGkPis2nYG8Xo/ra/bNVnFZ70VYMVJkATQXULLqKb7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5635
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



On 7/10/2021 7:35 AM, Michal Wajdeczko wrote:
> 
> 
> On 10.07.2021 03:20, Vinay Belgaumkar wrote:
>> Declare header and source files for SLPC, along with init and
>> enable/disable function templates.
> 
> later you claim that "disable" is not needed

Changed.

> 
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile               |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 34 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h | 16 ++++++++++
>>   4 files changed, 53 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index ab7679957623..d8eac4468df9 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_guc_fw.o \
>>   	  gt/uc/intel_guc_log.o \
>>   	  gt/uc/intel_guc_log_debugfs.o \
>> +	  gt/uc/intel_guc_slpc.o \
>>   	  gt/uc/intel_guc_submission.o \
>>   	  gt/uc/intel_huc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index e5a456918b88..0dbbd9cf553f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -15,6 +15,7 @@
>>   #include "intel_guc_ct.h"
>>   #include "intel_guc_log.h"
>>   #include "intel_guc_reg.h"
>> +#include "intel_guc_slpc.h"
>>   #include "intel_uc_fw.h"
>>   #include "i915_utils.h"
>>   #include "i915_vma.h"
>> @@ -30,6 +31,7 @@ struct intel_guc {
>>   	struct intel_uc_fw fw;
>>   	struct intel_guc_log log;
>>   	struct intel_guc_ct ct;
>> +	struct intel_guc_slpc slpc;
>>   
>>   	/* Global engine used to submit requests to GuC */
>>   	struct i915_sched_engine *sched_engine;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> new file mode 100644
>> index 000000000000..c1f569d2300d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -0,0 +1,34 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
> 
> SPDX tag shall be in very first line, for .c:
> 
> // SPDX-License-Identifier: MIT
> 
>> + *
>> + * Copyright © 2020 Intel Corporation
> 
> 2021

done.

> 
>> + */
>> +
>> +#include "intel_guc_slpc.h"
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>> +{
>> +	return 0;
>> +}
>> +
>> +/*
>> + * intel_guc_slpc_enable() - Start SLPC
>> + * @slpc: pointer to intel_guc_slpc.
>> + *
>> + * SLPC is enabled by setting up the shared data structure and
>> + * sending reset event to GuC SLPC. Initial data is setup in
>> + * intel_guc_slpc_init. Here we send the reset event. We do
>> + * not currently need a slpc_disable since this is taken care
>> + * of automatically when a reset/suspend occurs and the guc
> 
> s/guc/GuC
> 
>> + * channels are destroyed.
> 
> you mean CTB ?

yes, fixed.

> 
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>> +{
>> +	return 0;
>> +}
>> +
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>> +{
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> new file mode 100644
>> index 000000000000..74fd86769163
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -0,0 +1,16 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
> 
> SPDX tag shall be in very first line, for .h:
> 
> /* SPDX-License-Identifier: MIT */
> 
>> + *
>> + * Copyright © 2020 Intel Corporation
> 
> 2021
> 
>> + */
>> +#ifndef _INTEL_GUC_SLPC_H_
>> +#define _INTEL_GUC_SLPC_H_
>> +
>> +struct intel_guc_slpc {
>> +};
> 
> move all data definitions to intel_guc_slpc_types.h and include it here
> 
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +
>> +#endif
>>
> 
> and as suggested in comment to 2/14 you should likely move this patch to
> the front of the series

Yes, squashed with the first patch.

Thanks,
Vinay.

> 
> Michal
> 
