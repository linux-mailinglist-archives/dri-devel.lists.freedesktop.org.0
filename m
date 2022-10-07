Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2945F7BA6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 18:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E3610E35C;
	Fri,  7 Oct 2022 16:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1F210E35C;
 Fri,  7 Oct 2022 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665160791; x=1696696791;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kEO6a8NnqnJ9v+ZOmUHXBl5oOgYnCWrHpixceWoiR+U=;
 b=XxO1h8cAAJMIr33wwqAM8htIzaNZ29vFJCDdOQ2SVcNNXkqSra3gTyTh
 aKL3QSKiRqtveptCdzjZL1WMEqkbMGXlrbtv/4z5hSYxvUz+wMpLsZQj6
 3JG1KaKJ9OsOTocMGyfmLzFdE/It0Or7wxeMe4pK0UAG37njhQyZkSpwA
 WrW/gKIq2ia2dvlSyhxgFOa0kzQnlX8bhgHEXvSXXyfWwuwNQEMZ0uscf
 4qPhxSVGkcqAW84UH11B9p443eRPRHEaiLxue3Ntpp8jX5XP2qs6P+Fbi
 17zvyJwc+8Mjech6pUM2rhxh5CSW2/ygGxEH40MAev+7+4qqq1WeCT1u4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="304782051"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="304782051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 09:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="729682841"
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; d="scan'208";a="729682841"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2022 09:39:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 7 Oct 2022 09:39:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 7 Oct 2022 09:39:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 7 Oct 2022 09:39:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 7 Oct 2022 09:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7LUwrcXtcbWNHeOuisIqXBZLQBOBOj02D1GJmTQbn1gz9SHh3MyKoxtIXRRrmRSjBcZxp+PkiNInnycJkNXFmt3BUw/iQUF392LEBDzTkTOLa5MlqpFKK7UoRBFI7Hge+1nt59fWxPeE2Eb/fW2muFNaxZCpAQkDPPnfTd00x3hlFT6/FXHqxIoD1JB+4Du84jFXu/Bk7VD1en0pGozN65IWUyoMNVX1FYfKCoFAG0D+6zFX6sRcP1ILjhhRnM8RFPAc6gXwbeO+TpKpiH0bzoaYdDraXCk3G7gEV5Xx6VE9/aV73D7GmR5yPQktG7u40uyUSfsSr/604MHOLDhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Xo181YBpUrjPNVgakjxTinDAjlGCBMfZi/lTn3FN9g=;
 b=bnRKRIh5RDVoqz1LnmzLpZLFeSZXx7mELgVYCHzAr1E6/igDjmACIsMfGKqe7YsYBJjquy03zGuFLV0UA3sz+GaTYomhX/WlZZ5jW4DEQtHYiMNsX/JA4NXOQjoFEvfFCMCZGODryvm28slN3lnJZHQnQnSY2iEzY61ECeO7vr62uf3sCkzTVF8gBXgXJInYuVl9VYIFnrI2r27S8MZIm6m0NPwj0yf4JQFvhIkwGgdCAK3+ZbwOmeN0W4BY0hae/9SYH3MD864gBgJmLJHEyJUsiL7neoKCXh+PqIcxcR5xGgyi0Bg7BTfhjdEW0Podqsmx6gVmZoocpILd1460gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by MW4PR11MB6959.namprd11.prod.outlook.com (2603:10b6:303:228::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Fri, 7 Oct
 2022 16:39:42 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::54de:6030:7501:b7ae%8]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 16:39:42 +0000
Message-ID: <81ca92a2-9525-d96c-3739-280f25bd9b7a@intel.com>
Date: Fri, 7 Oct 2022 19:38:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v13 5/9] drm/i915: Check for integer truncation on
 scatterlist creation
Content-Language: en-US
To: Jani Nikula <jani.nikula@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220928081300.101516-1-gwan-gyeong.mun@intel.com>
 <20220928081300.101516-6-gwan-gyeong.mun@intel.com>
 <87edvvzxu3.fsf@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <87edvvzxu3.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0093.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::34) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|MW4PR11MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: e73d50da-5bd6-4150-15e1-08daa88288cf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxRJEQmzY0EOdIkmAS8v3HhkinHqYxpSh6zZh88Lhr6qGttHA3Gr8EKCfDbedaQOjzs3HH9qfPWKJxnK0lX0jQk4vuJwICYIa8MjO8soHyQhx0ZJQ+qo1XTVCzXbdmXv9mBU7kbD10oUM1OI9QvQ+KFpVJPmEKKRAAdb+4z+UNPTMcntb36/eIYcvnhQYZw4y+zubI2u1yDpbpQXCWo0qza4ffhZKIxe9l/zL+8QChP6Yx8gPuGlZAd8BoG84RUD5b4lnz/0CeJYbz50U/XtFiWSYg+53aty/UHjd3WqMVi+1y/9iXtkRzeQ//Sa3MEek+QzY1OhQfuJxXW9sOm/guCTMuOcxbz09uA++4q1HDJf3SuoLf7iRzp4SJmo0ZuUs+PQktHsu8eHSG6Odfm3ntOUqJCqoWiKCZ5RfIA0+jn0L7J3UstW5TZdLH3Js8JkAEbOJNfT8GWm/K0g7Kna6hLsNrDqJ3Q46+RU+fdheyEBTC/okP/pBKBCHlow4rGfHm78bJRlzHjQrg5ey3Qmj5L+nMVkgWWpk7C4C6j9aErZF+jlPmGAtLhS5cAK2syh8/de/QMPbFFcJ+LCSwqZqv+UAw8ZypSjaZmGlzOE6Jrf/DVcspuTggrv74bkBH7t/WvtvUTt5XwxnF2QAAg4hpLpWeeYBfvtyRssKOWCEHPQB3rO8XLOnRDE07HaJ5XDdVhWpFhSYuc4+PaSY1P8SMQXDFShwhGTLIdCxNm5k8SmJNH8IMbDZNyZIz10Xah+CU50Gid9YCYfZC1iCFEuPrVFY/KmJSIuJWJBjMQJZz0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(41300700001)(8936002)(6666004)(66946007)(316002)(8676002)(86362001)(36756003)(6506007)(66556008)(186003)(31696002)(2616005)(83380400001)(26005)(4326008)(5660300002)(7416002)(66476007)(6512007)(2906002)(53546011)(82960400001)(31686004)(38100700002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRiM2RtRE43U2Rmd2dndGpNNFNTNHFINlQyZUFnbjFTd0t2dk04djlKaVJB?=
 =?utf-8?B?SmMrQTA0dW1VR25LMUdsVnBTdm9JcHl5cTVJRWNybHdQTTNNZ04yd0haYjlO?=
 =?utf-8?B?VlpsRnNtT1IzblJZZUJWVGlaZ3p6UFBZckdRRGdzVWJ6UWJyQUlNckErenp2?=
 =?utf-8?B?UVp6b1d4TzdGaCtIaUJhOUpwa0daRGtVZk5FVTRpaWduZlVPSXZWSTNDWGp0?=
 =?utf-8?B?SG0wUlkyRkNiSndEclJ1UzIzN0ZyamVUazhTOVZId1lGd2pBTVJXOWlNUHQr?=
 =?utf-8?B?SnZDT1FFY09tR0c1SWc0dU4rNlI4U1JqbjNGOW45ZUZ0eHZ5T0VRcnRNMnRQ?=
 =?utf-8?B?enRLaDB6Z2cwR2NhSWlxdlZkU2p6Y1ZWelVVSkV0dVJaNzRDT3RuYTdLM2xX?=
 =?utf-8?B?SHZ6Z2g1TCtadE9qaklCeXM3TzdOT0hEQWdqekRJWHNuZnFpc1JnNEgvbkJT?=
 =?utf-8?B?RlRZRXB0Wk5zV3o4Y1FWeXVPTmQ2ZU4xdzRXMnpsM3l6Q1hXU2xBeVp0c3lI?=
 =?utf-8?B?STQxbzBuRnFLMUNsUXRTdWROalVBUnV1cDc3SkdNNXVGc2N2eEtHN0tnTHo0?=
 =?utf-8?B?RDNKblAwQVhnQ3NQU20rVlNOY3FibkxZSmg2bGMxWXB4L1lvRCsyS0NrSDhQ?=
 =?utf-8?B?RkNYSXQ5aVBsRFVvenhoZmxvTTh2K215OFVaZ01YbnJuOURLYnllSUIzRU1Y?=
 =?utf-8?B?enh0TzNFa1g5eVRkTDljMXBWVC9VdGdTUVFyUjZJU1pLMTZJWWtvbi9tNFlx?=
 =?utf-8?B?VVpYdWNGU1d5OWtBS0xvcmEzdTRlaVhlTno0ejZpOVRqUW0wY29aMTFuYzNK?=
 =?utf-8?B?WjR0dm9EKzFYNWgyV01vTlZ0b0tQSlhPdjVoMUs2TVczUXJGbHZGOWd4Z1dB?=
 =?utf-8?B?TW1VeVQ3SUx1NVRtdVpFd3hrQ0ZVVjhHUWVZSGhSaGVrQklvSExzLzJ5MUxU?=
 =?utf-8?B?dHg0Z01GV25wZU5RWlN4WU9VamRMU0I4N1d6OUR1MGFqK0dzei80OXFCL0hy?=
 =?utf-8?B?eHhMMkoxMmZwZXlUNFNiZ2Y5T2k1SG41c3VZVjd2NE11UUo4ZmxKQndNOG9V?=
 =?utf-8?B?SHQxTEx0YmhGNUJSVkdhK3dkVUUyeFJTUThiYk5yVlB1NWNoTC9tK1BTdmlU?=
 =?utf-8?B?Yy9xYk9GUGZpTUQ3azc3N3dseHNUMXRTNnc2UjRNV1NwM2Z4elQvMDdCUjQ1?=
 =?utf-8?B?S1YxUUI0a0N2SER4Ui8wTzVrYko0OWxjcnE1OGpRRFZJam5DajFpdlJRbjEv?=
 =?utf-8?B?enZudFpLK3REcXlZKzk4RXZZdlEyaUFWZmZrdzdUdkpIQVdsSGxUVWJRbHZ5?=
 =?utf-8?B?UXdET0tpbm5DUVd4dllMUjF0Snd3bEl1S3QrUkJPYzhNd2FPNWZ3KzJUS3RY?=
 =?utf-8?B?WTFqVmt6UkZ0WmlDNUxvcmtVUytvZklyU1gyL2Y4ZWwrSlNaVldOdHpCL2d1?=
 =?utf-8?B?L05Hc2FpYTUwN2RUcXkxZDcwV2pBaXUycmVEYVF2Szc4QkRJbEZjT2hmWndO?=
 =?utf-8?B?R21kL29VTFI1aURNUnpSZjVzakVId0ZGQTA4cloyaEkwdENKNXJPQlJVUWg3?=
 =?utf-8?B?NmI2cDE4OWhEanlMdnFRQXBqOFBycy9GOForUi9pZXQ0MkNzYlc1ZzE0bndO?=
 =?utf-8?B?M2VMQnM0RmF5M09MbVY2eTVSQTk4VWdxRnVxWGRVUE9RczlSS1pJMjIrZzZx?=
 =?utf-8?B?V1N5NEpFbXgwK2dvV25DYnVXSXpPU1hEQ2ZhQ3ZEM0NuKzUvN0FQNHQ5dDZx?=
 =?utf-8?B?R0t1Y1ZDVGUxZHZoV1o2MmhTbnl1dHpaYkJBZ1lSWmYvSW1JVTQyNGNnM1Fs?=
 =?utf-8?B?Sk0rbllXeWxkdmxFZHU2aitZTGlTblN2ci9QeGgrKzVUZCsxRGh3UmNOVWtM?=
 =?utf-8?B?RFl3ZE5oN0FsT3B0dTlUNTlOMXQ1enUrL2V3STAxZHhld3pkeWE0OTlOejBP?=
 =?utf-8?B?V2MyNHZURDl3VFhCRWhFSlFnUGt0NDByN2wxNjdPYldrUnRMZ3RaMEhEdU5h?=
 =?utf-8?B?ODIxUDNId0hTRGh0UUZsUlpsMFJlSXMrc05rNXV3bGVMWmZmZTFGVFFuT01G?=
 =?utf-8?B?L0NBTXk1L0l4dE1HR29uVkNiVlJPMm1pRDdxaDBZTUtaRTRJYUdTd1lORDBP?=
 =?utf-8?B?RXBmZDFzWjlVazhoaU94UDg4WjB3N2xneUZrcW1vcE85UDc4UnB4TktUYXBo?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e73d50da-5bd6-4150-15e1-08daa88288cf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 16:39:42.6246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37Ze7WNt0IV87+nk8CTq+JbKiIm83t2IJLUfS1mRfNWapbsff9XSsg+AN656Rejvx1VcARctyzOFCfneUjGK9yA2p3FgJyYchixMeHROmEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6959
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
Cc: gustavoars@kernel.org, trix@redhat.com, dlatypov@google.com,
 llvm@lists.linux.dev, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linux-hardening@vger.kernel.org, andrzej.hajda@intel.com,
 linux-sparse@vger.kernel.org, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, airlied@redhat.com,
 thomas.hellstrom@linux.intel.com, keescook@chromium.org, nathan@kernel.org,
 mchehab@kernel.org, mauro.chehab@linux.intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, vitor@massaru.org, luc.vanoostenryck@gmail.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/28/22 11:51 AM, Jani Nikula wrote:
> On Wed, 28 Sep 2022, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
>> index 9ddb3e743a3e..1d1802beb42b 100644
>> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
>> @@ -220,4 +220,15 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
>>   						     u64 region_start,
>>   						     u32 page_alignment);
>>   
>> +/* Wrap scatterlist.h to sanity check for integer truncation */
>> +typedef unsigned int __sg_size_t; /* see linux/scatterlist.h */
>> +#define sg_alloc_table(sgt, nents, gfp) \
>> +	overflows_type(nents, __sg_size_t) ? -E2BIG \
>> +		: ((sg_alloc_table)(sgt, (__sg_size_t)(nents), gfp))
>> +
>> +#define sg_alloc_table_from_pages_segment(sgt, pages, npages, offset, size, max_segment, gfp) \
>> +	overflows_type(npages, __sg_size_t) ? -E2BIG \
>> +		: ((sg_alloc_table_from_pages_segment)(sgt, pages, (__sg_size_t)(npages), offset, \
>> +						       size, max_segment, gfp))
>> +
>>   #endif
> 
> No. I don't think we should shadow sg_alloc_table() and
> sg_alloc_table_from_pages_segment().
> 
> Either get this in scatterlist.h (preferred) or prefix with i915_ or
> whatever to indicate it's our local thing.
> 
> i915_scatterlist.h already has too much scatterlist "namespace" abuse
> that I'd rather see gone than violated more.
> 
> 
Hi Jani,
Thanks for you comments.

I will update this patch by removing the shadowing of 
sg_alloc_table_from_pages_segment() / sg_alloc_table(), so that the 
caller checks when overflow checking is required.

Br,
G.G.

> BR,
> Jani.
> 
> 
> 
