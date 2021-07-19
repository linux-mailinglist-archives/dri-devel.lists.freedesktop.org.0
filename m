Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E303CEAF2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 20:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047DD89DA8;
	Mon, 19 Jul 2021 18:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85689DA8;
 Mon, 19 Jul 2021 18:26:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="274935657"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="274935657"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 11:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="468683395"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2021 11:26:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 19 Jul 2021 11:26:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 11:26:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 19 Jul 2021 11:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbG+2xkK8AF4aTamsESSLjigXMrSAJXdaTLqnFfFy+o06dAjUst6EXGKcvbwVLWsG7phBw4m+M3jq7lwiSlxkgTpxiLJbmFK+oaPk2uJxCXfluauAaSJIUBhqF4x1a2po7/uyqqSf23MRP2g07EiuZbyZS4h/6M2Ey8IIKgj+1gUwf8cEBk7V3LLG/IJZgv8jrI+H86Hy3XUWyDYnHds4Z4ecswV8czE68knBfgw2zuW5t1XU6CR7ndT2nHP0n+BPU7esaT8MrFsCqo5nb0lcYloNiLKokDGeq3cESVgu0b4MBW2Z931RrRnTZAsWcl+6SsAoTseCaGFiUQXqZFLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbEFxa07CSjDFq8n1m2C4U69THsoIiLaGg8U9esl1d8=;
 b=OGmmk6fsa6LoitzV4ueqUTX0SaY5CJi4MmNM9KhI1vn+i6Wi0k1yHbC+uq1wqCjyJYw+SEibvTP1qafZGq+lGgH1sEZ4rZIR/IqnswZOZ/gr0Sh4RF/mX6URC0I1JjNDnbC3Xzco8Q9izZh2Hj7Tcuoa0TxzyB5SaJuFCBkTPNnEclFKb3k3koMjn9dSnVlLzUIz12dmJAdTLzX1Wcg1NpsgIy017oAttiBVgymRPQWi2erFFoBw94vq0EAf18ci3xd5xI/K51dVCWv6gZNJx/FDwBAceHWyzvSLDXUlx8xnQ7b0cLfp51NydKakGCJ3YXDG9tHXfIwPK+U/aqHqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbEFxa07CSjDFq8n1m2C4U69THsoIiLaGg8U9esl1d8=;
 b=VFAihuIraagngVch92dyiz3PAywfqLoYLFQV1uO21kw2hB1D+HvZICvCa9miBlFPB7L39VohB+4nHjR4MvfU+n+v6Vpqj7JWB+vyw+oViwLQJOnfUpmbYndEeKzWTFWh9I1m2eJb7TSEupdmsEFdUMdf8t9z2dj1ICfoD0nIRmQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5626.namprd11.prod.outlook.com (2603:10b6:510:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Mon, 19 Jul
 2021 18:25:59 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 18:25:59 +0000
Subject: Re: [Intel-gfx] [PATCH 41/51] drm/i915/guc: Add golden context to GuC
 ADS
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-42-matthew.brost@intel.com>
 <20210719172430.GA15382@sdutt-i7>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <3e049d02-824d-4ac6-6eb8-1ab2deb54670@intel.com>
Date: Mon, 19 Jul 2021 11:25:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210719172430.GA15382@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:300:4b::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR02CA0024.namprd02.prod.outlook.com (2603:10b6:300:4b::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Mon, 19 Jul 2021 18:25:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30e37a04-79a9-4085-4143-08d94ae2a7da
X-MS-TrafficTypeDiagnostic: PH0PR11MB5626:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56269DDFAECAF10C67EFE219BDE19@PH0PR11MB5626.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7cHZNEYS1nI1PU0HLxaEeRL66abl+a3/XZDUSzphgtkFlF6wurzC838N8gPCOZDuJJpsM9yy6mtjnZXHJ5wJ/AddTfDQlO5DbWtxE8pVEVeBusKM5KRhS3/SjetFJ4rvGnOOIGUOdUh97nKKM9f7gtKU3Y1x3U7fgLubsoDN7wl/9kCUveVhFDQNdHVhaHPoejckVJnltIN3ZBiRmCMDBVaP+g0gXKJV/pxb330X8VkgXz4OLJ47wKT1+FPLQfYwsJfExQLPF5RHNede2UTTksU8LkygJ6pEfstAuyViKe/OjxxJQZACbYOwNv7NUAgFcBgxPg2KECJOL7SfC0VLet7q8xucWi1zd1pLJes06RTmBrkccUsox53xpqN9r6K/lWDnqmRBB19OF68Xd+5hmkgt8Z1ip1sHiWjLn3qWnKp/+Ovbqt30OdBrHDtkmGhtBv0cxePTTd6Wth+o9XOdwL9gl8fIuwzAB3/nKWcvr6kstUB7mBUwn/fBmG2XP3tOjxPgjyHQP5B/xpE0FIV+zZoc5QQLyQFUibHnOpaiEFYLr65djpwSVUx7EqGby6mpXhXDOXaqIf54GJHHpjMAysa16IflYCsLRcnqEBRt8cIcF87sWS9Ufs6olHGNawJt1f5C/NnVA7iv5Rrf64btBgyUD8vTdoTam2U7QJ3gv3d7fayozXgGZ/itIFLx6HJYTjqBk4vR3iHqgGCrDAq3JwDN8cu7QmrU7K70rnZQ64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(36756003)(8936002)(186003)(31686004)(5660300002)(8676002)(53546011)(6486002)(316002)(16576012)(2906002)(26005)(30864003)(86362001)(6666004)(966005)(38100700002)(83380400001)(66556008)(2616005)(956004)(478600001)(31696002)(66946007)(450100002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUFiUUVDdDNDMHVkdUpMZmtZQ2p2QVpxY3VNT3JjbHJnMXlYck44eVZPZXBX?=
 =?utf-8?B?SGZvdFk5RDA2Qi9lZ2lXd0tZUEJmTG1xWks1NE9OZjVRcVY3TVJJeGVxQll1?=
 =?utf-8?B?VHB0UFdXVElCeHpOZGxOdkdQNFVMd2t3cWFybUN3elBZTFVkeXdST2YvYXEz?=
 =?utf-8?B?OUFZU0tvc3hVVlcvNGQ2UUk3b0VyK1hnL0Mva2EvVmtuY0NMa1ZYYlpyWXNG?=
 =?utf-8?B?MXgwMmx3bHZ2ZENzSThVZ1NaZXVIcWJvd0Z0eUdodlo0RTJkQ3JjaHp6ZnB0?=
 =?utf-8?B?VmJKM0w0ekN4SWcvV0F3bEtEbmo0UjZIMGNXc05JTkdhUDRoMDR3SnhWVlEr?=
 =?utf-8?B?aUtCVkt4NjVlV25YM2hTTHJ5Z0x3d3Z1anJlMnlqQ0lIM1pSQi9teEtmajJ4?=
 =?utf-8?B?RFdMeTFwNVU4YXpSSmpLV3ErL3pXaXp5bThGZ2x1Wi9JSDF4TTIwUjRIQzR1?=
 =?utf-8?B?aGxEL1RBQ3I2YVl5VTlwSlR1QmxSRHhYcjllU0FIVWJaQTJHYTYyWnJuWE9K?=
 =?utf-8?B?eU0ydVg2UnNuSVRjMHhReCtlaEtZc0JSZGJVUUFOODhtNjVRS1pSbWJJREZV?=
 =?utf-8?B?cmhjbXJFRTBKaVA1dnBCNUgyOVVLWFhMQTZpVTBBdlVydVhpd1lzYUFtWEFY?=
 =?utf-8?B?SE5TWlk1V0dXVnplNjlSa1BrOTZyOTFOSUE0ako2eXNlM0RlRmd1ZU1QL3Ey?=
 =?utf-8?B?WVBBLzJaOFhINjRMNUJieWtqeS9SdEdsdVc2Q1JVYXVLY1k4MkdIVlhFaW9o?=
 =?utf-8?B?ZDVydjZFQlhYRFp4akxwZy9aOGJOSWJRZktmNHBMT0JCSUdrNmttcUlMQ0hS?=
 =?utf-8?B?TWZ3R3liTFgvMFd0QWV5dXRsMnBJZFJPczFGYy9FdlpTOFZvdjg2UXIyT3ds?=
 =?utf-8?B?QmtaN21HSjNoUmRsRU5DTXBGcXNEalVTL3RDZmFWM082MWNBV3VncmNvMWxs?=
 =?utf-8?B?OFc1eWszcWord0NuaThmMFB0UFdUNFVQcXh3TUo4UzV2MSs3aXJZYmMzRGVi?=
 =?utf-8?B?WkhrUjZ5K3VaLzVUMXFtc0xnYzhWQjVHaFEvSkpML2VhUUZLcjloRlZnZjVj?=
 =?utf-8?B?VFYxbllFSCtSNWZ5NmVWRlc5dHh0eTNxM291dC9JRjd6VjJ2ZUZZRkRYdFVN?=
 =?utf-8?B?YWw5aHIyVm9IZW50aEluNGwwREcwVW4yVzcvM2FEeDV1N3VsanpFMlB3YlpQ?=
 =?utf-8?B?eHROZTdYZlhpTGFyVlArUmZnd1pyYk94QUVGc25NZjhEUCs1V01vQ1ZYdlVZ?=
 =?utf-8?B?czZqbEVpMS9zNzVlS0NUSllLVlZxUTlEaWNhTTBFQzdXVHYzRG5Ga1c1aW0z?=
 =?utf-8?B?RVRMVzFtN2crZlVpaURnbnlkZzAwakdiRVZFamg0cDNqVmtjT2VHaEFmM1ZO?=
 =?utf-8?B?Si9nSjFyaDNvRXd0cDljUURTb1JqQW9pWjR1aW5Fc3ZzSUc4L0lLYStuQWNJ?=
 =?utf-8?B?NENZRTNTREJCTUp2ZGtDUkFhOUdGaTV1RXlkaSt0RitnU1ljTm5MbFd3c2ha?=
 =?utf-8?B?eU5IK2NNZHdudEpSTDhFT2RtekgxTEhoRzVaN0xsTmd3QmV3aG1xMTJwRU5B?=
 =?utf-8?B?Y0hKN2UyYTdQVXZuZ3BQVS9XZUpoTU9HN3lxamV1MWJDRjh6a1hoWmUra1FU?=
 =?utf-8?B?bFo4QWZuWHNUaUlpVVhZU2tmR0M2Q21zVlRNeFkvR3VTVmdieXhTK3N3aEVO?=
 =?utf-8?B?WElldzRPMjVnMlFwajB6TG9RdE1Bak5kZjNtVW9HLzBGczVqSlcyZU1KeU1V?=
 =?utf-8?Q?Qj0oqBPTFGjTf1CkXDBBtuJ4bEuSw7E3dfpVoiS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e37a04-79a9-4085-4143-08d94ae2a7da
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:25:59.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHeZo3xTKsft3uZV8fO6A4joc2TwfTblXHrhmWXreBM3ZjinQdSOLM8oea2Pr8un6bfCNi+QL8yBHVjVwQeAuNZ/QaU6/aBIHFTJmdM4iKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5626
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

On 7/19/2021 10:24, Matthew Brost wrote:
> On Fri, Jul 16, 2021 at 01:17:14PM -0700, Matthew Brost wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The media watchdog mechanism involves GuC doing a silent reset and
>> continue of the hung context. This requires the i915 driver provide a
>> golden context to GuC in the ADS.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c         |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c     |   5 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h     |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 213 ++++++++++++++++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h |   1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c      |   5 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h      |   1 +
>>   7 files changed, 199 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index acfdd53b2678..ceeb517ba259 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -654,6 +654,8 @@ int intel_gt_init(struct intel_gt *gt)
>>   	if (err)
>>   		goto err_gt;
>>   
>> +	intel_uc_init_late(&gt->uc);
>> +
>>   	err = i915_inject_probe_error(gt->i915, -EIO);
>>   	if (err)
>>   		goto err_gt;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 68266cbffd1f..979128e28372 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -180,6 +180,11 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	}
>>   }
>>   
>> +void intel_guc_init_late(struct intel_guc *guc)
>> +{
>> +	intel_guc_ads_init_late(guc);
>> +}
>> +
>>   static u32 guc_ctl_debug_flags(struct intel_guc *guc)
>>   {
>>   	u32 level = intel_guc_log_get_level(&guc->log);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index bc71635c70b9..dc18ac510ac8 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -60,6 +60,7 @@ struct intel_guc {
>>   	struct i915_vma *ads_vma;
>>   	struct __guc_ads_blob *ads_blob;
>>   	u32 ads_regset_size;
>> +	u32 ads_golden_ctxt_size;
>>   
>>   	struct i915_vma *lrc_desc_pool;
>>   	void *lrc_desc_pool_vaddr;
>> @@ -176,6 +177,7 @@ static inline u32 intel_guc_ggtt_offset(struct intel_guc *guc,
>>   }
>>   
>>   void intel_guc_init_early(struct intel_guc *guc);
>> +void intel_guc_init_late(struct intel_guc *guc);
>>   void intel_guc_init_send_regs(struct intel_guc *guc);
>>   void intel_guc_write_params(struct intel_guc *guc);
>>   int intel_guc_init(struct intel_guc *guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index 93b0ac35a508..241b3089b658 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -7,6 +7,7 @@
>>   
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_lrc.h"
>> +#include "gt/shmem_utils.h"
>>   #include "intel_guc_ads.h"
>>   #include "intel_guc_fwif.h"
>>   #include "intel_uc.h"
>> @@ -33,6 +34,10 @@
>>    *      +---------------------------------------+ <== dynamic
>>    *      | padding                               |
>>    *      +---------------------------------------+ <== 4K aligned
>> + *      | golden contexts                       |
>> + *      +---------------------------------------+
>> + *      | padding                               |
>> + *      +---------------------------------------+ <== 4K aligned
>>    *      | private data                          |
>>    *      +---------------------------------------+
>>    *      | padding                               |
>> @@ -52,6 +57,11 @@ static u32 guc_ads_regset_size(struct intel_guc *guc)
>>   	return guc->ads_regset_size;
>>   }
>>   
>> +static u32 guc_ads_golden_ctxt_size(struct intel_guc *guc)
>> +{
>> +	return PAGE_ALIGN(guc->ads_golden_ctxt_size);
>> +}
>> +
>>   static u32 guc_ads_private_data_size(struct intel_guc *guc)
>>   {
>>   	return PAGE_ALIGN(guc->fw.private_data_size);
>> @@ -62,12 +72,23 @@ static u32 guc_ads_regset_offset(struct intel_guc *guc)
>>   	return offsetof(struct __guc_ads_blob, regset);
>>   }
>>   
>> -static u32 guc_ads_private_data_offset(struct intel_guc *guc)
>> +static u32 guc_ads_golden_ctxt_offset(struct intel_guc *guc)
>>   {
>>   	u32 offset;
>>   
>>   	offset = guc_ads_regset_offset(guc) +
>>   		 guc_ads_regset_size(guc);
>> +
>> +	return PAGE_ALIGN(offset);
>> +}
>> +
>> +static u32 guc_ads_private_data_offset(struct intel_guc *guc)
>> +{
>> +	u32 offset;
>> +
>> +	offset = guc_ads_golden_ctxt_offset(guc) +
>> +		 guc_ads_golden_ctxt_size(guc);
>> +
>>   	return PAGE_ALIGN(offset);
>>   }
>>   
>> @@ -319,53 +340,163 @@ static void guc_mmio_reg_state_init(struct intel_guc *guc,
>>   	GEM_BUG_ON(temp_set.size);
>>   }
>>   
>> -/*
>> - * The first 80 dwords of the register state context, containing the
>> - * execlists and ppgtt registers.
>> - */
>> -#define LR_HW_CONTEXT_SIZE	(80 * sizeof(u32))
>> +static void fill_engine_enable_masks(struct intel_gt *gt,
>> +				     struct guc_gt_system_info *info)
>> +{
>> +	info->engine_enabled_masks[GUC_RENDER_CLASS] = 1;
>> +	info->engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
>> +	info->engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
>> +	info->engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
>> +}
>>   
>> -static void __guc_ads_init(struct intel_guc *guc)
>> +/* Skip execlist and PPGTT registers */
>> +#define LR_HW_CONTEXT_SIZE      (80 * sizeof(u32))
>> +#define SKIP_SIZE               (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
>> +
>> +static int guc_prep_golden_context(struct intel_guc *guc,
>> +				   struct __guc_ads_blob *blob)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>> -	struct drm_i915_private *i915 = gt->i915;
>> +	u32 addr_ggtt, offset;
>> +	u32 total_size = 0, alloc_size, real_size;
>> +	u8 engine_class, guc_class;
>> +	struct guc_gt_system_info *info, local_info;
>> +
>> +	/*
>> +	 * Reserve the memory for the golden contexts and point GuC at it but
>> +	 * leave it empty for now. The context data will be filled in later
>> +	 * once there is something available to put there.
>> +	 *
>> +	 * Note that the HWSP and ring context are not included.
>> +	 *
>> +	 * Note also that the storage must be pinned in the GGTT, so that the
>> +	 * address won't change after GuC has been told where to find it. The
>> +	 * GuC will also validate that the LRC base + size fall within the
>> +	 * allowed GGTT range.
>> +	 */
>> +	if (blob) {
>> +		offset = guc_ads_golden_ctxt_offset(guc);
>> +		addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
>> +		info = &blob->system_info;
>> +	} else {
>> +		memset(&local_info, 0, sizeof(local_info));
>> +		info = &local_info;
>> +		fill_engine_enable_masks(gt, info);
>> +	}
>> +
>> +	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
>> +		if (engine_class == OTHER_CLASS)
>> +			continue;
>> +
>> +		guc_class = engine_class_to_guc_class(engine_class);
>> +
>> +		if (!info->engine_enabled_masks[guc_class])
>> +			continue;
>> +
>> +		real_size = intel_engine_context_size(gt, engine_class);
>> +		alloc_size = PAGE_ALIGN(real_size);
>> +		total_size += alloc_size;
>> +
>> +		if (!blob)
>> +			continue;
>> +
>> +		blob->ads.eng_state_size[guc_class] = real_size;
>> +		blob->ads.golden_context_lrca[guc_class] = addr_ggtt;
>> +		addr_ggtt += alloc_size;
>> +	}
>> +
>> +	if (!blob)
>> +		return total_size;
>> +
>> +	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
>> +	return total_size;
>> +}
>> +
>> +static struct intel_engine_cs *find_engine_state(struct intel_gt *gt, u8 engine_class)
>> +{
>> +	struct intel_engine_cs *engine;
>> +	enum intel_engine_id id;
>> +
>> +	for_each_engine(engine, gt, id) {
>> +		if (engine->class != engine_class)
>> +			continue;
>> +
>> +		if (!engine->default_state)
>> +			continue;
>> +
>> +		return engine;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void guc_init_golden_context(struct intel_guc *guc)
>> +{
>>   	struct __guc_ads_blob *blob = guc->ads_blob;
>> -	const u32 skipped_size = LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE;
>> -	u32 base;
>> +	struct intel_engine_cs *engine;
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +	u32 addr_ggtt, offset;
>> +	u32 total_size = 0, alloc_size, real_size;
>>   	u8 engine_class, guc_class;
>> +	u8 *ptr;
>>   
>> -	/* GuC scheduling policies */
>> -	guc_policies_init(guc, &blob->policies);
>> +	if (!intel_uc_uses_guc_submission(&gt->uc))
>> +		return;
>> +
>> +	GEM_BUG_ON(!blob);
>>   
>>   	/*
>> -	 * GuC expects a per-engine-class context image and size
>> -	 * (minus hwsp and ring context). The context image will be
>> -	 * used to reinitialize engines after a reset. It must exist
>> -	 * and be pinned in the GGTT, so that the address won't change after
>> -	 * we have told GuC where to find it. The context size will be used
>> -	 * to validate that the LRC base + size fall within allowed GGTT.
>> +	 * Go back and fill in the golden context data now that it is
>> +	 * available.
>>   	 */
>> +	offset = guc_ads_golden_ctxt_offset(guc);
>> +	addr_ggtt = intel_guc_ggtt_offset(guc, guc->ads_vma) + offset;
>> +	ptr = ((u8 *) blob) + offset;
>> +
>>   	for (engine_class = 0; engine_class <= MAX_ENGINE_CLASS; ++engine_class) {
>>   		if (engine_class == OTHER_CLASS)
>>   			continue;
>>   
>>   		guc_class = engine_class_to_guc_class(engine_class);
>>   
>> -		/*
>> -		 * TODO: Set context pointer to default state to allow
>> -		 * GuC to re-init guilty contexts after internal reset.
>> -		 */
>> -		blob->ads.golden_context_lrca[guc_class] = 0;
>> -		blob->ads.eng_state_size[guc_class] =
>> -			intel_engine_context_size(gt, engine_class) -
>> -			skipped_size;
>> +		if (!blob->system_info.engine_enabled_masks[guc_class])
>> +			continue;
>> +
>> +		real_size = intel_engine_context_size(gt, engine_class);
>> +		alloc_size = PAGE_ALIGN(real_size);
>> +		total_size += alloc_size;
>> +
>> +		engine = find_engine_state(gt, engine_class);
>> +		if (!engine) {
>> +			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n", engine_class);
>> +			blob->ads.eng_state_size[guc_class] = 0;
>> +			blob->ads.golden_context_lrca[guc_class] = 0;
>> +			continue;
>> +		}
>> +
>> +		GEM_BUG_ON(blob->ads.eng_state_size[guc_class] != real_size);
>> +		GEM_BUG_ON(blob->ads.golden_context_lrca[guc_class] != addr_ggtt);
>> +		addr_ggtt += alloc_size;
>> +
>> +		shmem_read(engine->default_state, SKIP_SIZE, ptr + SKIP_SIZE, real_size);
> There is a confirmed memory corruption here, should be:
> shmem_read(engine->default_state, SKIP_SIZE, ptr + SKIP_SIZE, real_size - SKIP_SIZE);
>
> Also a bit of nit but I think s/SKIP_SIZE/GOLDEN_CONTEXT_SKIP_SIZE/g
>
> As long you agree John, I'll fix both of these in the next rev.
>
> Matt
Yup. Good catch.

Rather than ballooning the name out, maybe make it and the LR_HW_ define 
local enums within this function? I don't think they are used anywhere else.

John.


>
>> +		ptr += alloc_size;
>>   	}
>>   
>> +	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
>> +}
>> +
>> +static void __guc_ads_init(struct intel_guc *guc)
>> +{
>> +	struct intel_gt *gt = guc_to_gt(guc);
>> +	struct drm_i915_private *i915 = gt->i915;
>> +	struct __guc_ads_blob *blob = guc->ads_blob;
>> +	u32 base;
>> +
>> +	/* GuC scheduling policies */
>> +	guc_policies_init(guc, &blob->policies);
>> +
>>   	/* System info */
>> -	blob->system_info.engine_enabled_masks[GUC_RENDER_CLASS] = 1;
>> -	blob->system_info.engine_enabled_masks[GUC_BLITTER_CLASS] = 1;
>> -	blob->system_info.engine_enabled_masks[GUC_VIDEO_CLASS] = VDBOX_MASK(gt);
>> -	blob->system_info.engine_enabled_masks[GUC_VIDEOENHANCE_CLASS] = VEBOX_MASK(gt);
>> +	fill_engine_enable_masks(gt, &blob->system_info);
>>   
>>   	blob->system_info.generic_gt_sysinfo[GUC_GENERIC_GT_SYSINFO_SLICE_ENABLED] =
>>   		hweight8(gt->info.sseu.slice_mask);
>> @@ -380,6 +511,9 @@ static void __guc_ads_init(struct intel_guc *guc)
>>   			 GEN12_DOORBELLS_PER_SQIDI) + 1;
>>   	}
>>   
>> +	/* Golden contexts for re-initialising after a watchdog reset */
>> +	guc_prep_golden_context(guc, blob);
>> +
>>   	guc_mapping_table_init(guc_to_gt(guc), &blob->system_info);
>>   
>>   	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
>> @@ -417,6 +551,13 @@ int intel_guc_ads_create(struct intel_guc *guc)
>>   		return ret;
>>   	guc->ads_regset_size = ret;
>>   
>> +	/* Likewise the golden contexts: */
>> +	ret = guc_prep_golden_context(guc, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +	guc->ads_golden_ctxt_size = ret;
>> +
>> +	/* Now the total size can be determined: */
>>   	size = guc_ads_blob_size(guc);
>>   
>>   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->ads_vma,
>> @@ -429,6 +570,18 @@ int intel_guc_ads_create(struct intel_guc *guc)
>>   	return 0;
>>   }
>>   
>> +void intel_guc_ads_init_late(struct intel_guc *guc)
>> +{
>> +	/*
>> +	 * The golden context setup requires the saved engine state from
>> +	 * __engines_record_defaults(). However, that requires engines to be
>> +	 * operational which means the ADS must already have been configured.
>> +	 * Fortunately, the golden context state is not needed until a hang
>> +	 * occurs, so it can be filled in during this late init phase.
>> +	 */
>> +	guc_init_golden_context(guc);
>> +}
>> +
>>   void intel_guc_ads_destroy(struct intel_guc *guc)
>>   {
>>   	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
>> index bdcb339a5321..3d85051d57e4 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h
>> @@ -11,6 +11,7 @@ struct drm_printer;
>>   
>>   int intel_guc_ads_create(struct intel_guc *guc);
>>   void intel_guc_ads_destroy(struct intel_guc *guc);
>> +void intel_guc_ads_init_late(struct intel_guc *guc);
>>   void intel_guc_ads_reset(struct intel_guc *guc);
>>   void intel_guc_ads_print_policy_info(struct intel_guc *guc,
>>   				     struct drm_printer *p);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 77c1fe2ed883..7a69c3c027e9 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -120,6 +120,11 @@ void intel_uc_init_early(struct intel_uc *uc)
>>   		uc->ops = &uc_ops_off;
>>   }
>>   
>> +void intel_uc_init_late(struct intel_uc *uc)
>> +{
>> +	intel_guc_init_late(&uc->guc);
>> +}
>> +
>>   void intel_uc_driver_late_release(struct intel_uc *uc)
>>   {
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index 91315e3f1c58..e2da2b6e76e1 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -35,6 +35,7 @@ struct intel_uc {
>>   };
>>   
>>   void intel_uc_init_early(struct intel_uc *uc);
>> +void intel_uc_init_late(struct intel_uc *uc);
>>   void intel_uc_driver_late_release(struct intel_uc *uc);
>>   void intel_uc_driver_remove(struct intel_uc *uc);
>>   void intel_uc_init_mmio(struct intel_uc *uc);
>> -- 
>> 2.28.0
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

