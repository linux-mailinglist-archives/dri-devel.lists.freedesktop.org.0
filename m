Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D14425A76
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 20:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592A96F4AC;
	Thu,  7 Oct 2021 18:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AE46F4AC;
 Thu,  7 Oct 2021 18:13:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="289826386"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="289826386"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 11:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="489113540"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga008.jf.intel.com with ESMTP; 07 Oct 2021 11:13:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 11:13:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 11:13:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 11:13:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 11:13:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INIE3xlk9yIMb5UnhIHpcsWCASnmVpQuHaT4XTEVq7y6bGZIiB9p7LNmUgz+Dd5q/IFYTRXbti0SGkFL8OjpKaR9R5F5bcWe6qwMJjkEYuLOL4GB8pl726QwHMD+fC/kfEAcXeOa104ohfKMv+591fPZj+HEP5XtUoBqaH46hy3gFePOO0vJOfgkGkSW/UjdiYcPRaXwW9yupDoPRX560FjH4MSm2jYgTtc1QpVzpauXzfBR8jzP+CmUTFluEaswxmvlOYAbmhCwyjkJgMO5C02bjG/ShL+BkfUVeM5Zs8QIbPB7U7xTn5YBcjbZW37SDx9D50tfMcnlS2JDUUsqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrExyWkokQsrHINc4ULoxHdOKj/2NhR4R3q+fjvEN2o=;
 b=Xi/D72BHuAdLgEmP+v04GVb/Sez3q72s7mwP3OJ6FJW1TwVwH2TkB4PcKgWjsn0FsQlbKk7/c11jEmHYl1AdxaF3QRrg1gt94Gz2owYGFZPA/nPj0CI/6ktBNPLuyY7xOFwBbJnpGKpQS4Uus7aeqhxlFnVS8wJMzQZEdFVwNaDzJBTpLlX0TMqldHW1CAC8cuZNyiCgnFrUVgAbDgeg30oXfA623pxX9l6q9M7g/JYpG4QmqoZOwZQ3SuiYNMGAv2zwG5pDNugLODeWZ/BF5J0vKVaeqBqIdZZYNEooaBWHWkLrFaCzLWWYZ5dTqmM15NvTZgGcHud0KRz3A8yx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrExyWkokQsrHINc4ULoxHdOKj/2NhR4R3q+fjvEN2o=;
 b=zydGe6sRJIjbT02mqgM0p030Lvsqf4CfLL47vXrFe3m6qZMZ8gtRNG2+Cib4jquDY9rarhvqbCjvZNRm075WHfsYWLcYVXvEHxGJCJlwPcEUQKuiqMbomVHXlnOXpjNqT34KOVdva06Rim4/YKT1kY9FdOfwvLRMBGuc6xEIZvI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Thu, 7 Oct
 2021 18:13:17 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 18:13:17 +0000
Subject: Re: [PATCH 01/26] drm/i915/guc: Move GuC guc_id allocation under
 submission state sub-struct
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-2-matthew.brost@intel.com>
 <019f1cca-a971-f9ee-4eec-6450572ae580@intel.com>
 <20211007150543.GA12560@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1dd70b11-90b1-88d0-32bf-53ef77124292@intel.com>
Date: Thu, 7 Oct 2021 11:13:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211007150543.GA12560@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BY5PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:180::49) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BY5PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:180::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Thu, 7 Oct 2021 18:13:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5927d30d-8ad0-4774-fd3c-08d989be2309
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5609EEA9931A657BEA1CE456BDB19@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ycg8okO49wUe2np9z8Pfq0J4w02sK+ljvLmUJ2bZppWts5gkc0dohq2Ktm2MKfuxRSWimrYEcRthNa3QnXeg7hNhY8xUVwtJaZBJIjIRQtQmwRsFWNderlaRTgHkjOAFLwI2LV6G2QDeUa0lGCbhBhWbrTFD8C+2FPnelRunvSqgGaeSbu7H8fPh/WEMnHBwtxrsqPv3HF1RGNmizkuECGUAVHxvgmv/GWqNgL/RADBzZOJH00cSwN/+ksvZYjKFFjJ6ZvGchmQhd6//5NQSfQrparNsIe/BAgC/vqYXm4X1r41+ahCbCi0cTAWiKepZ0r7esl2JYkBXdmOS/VcWaYtM8SoRtxGnvIoPNH7WXOzWYHJjRM5Fv0a6CEbq4w5rx8SIF23DOOmkVCa/u0oDQ0bxUsgpmmn9ozDMbEF/D+ZV6afHFew/zvYowBLj8AG2giOhOUuU6R7TjwNlnHSU+i5SeXzPpNZYvecBjisaK37SS11b8ZVZ2qRRu3XM+n6tYSduEteVNJyfKH+pCf8jHyXreMvs50zolJ10u68+lnlSORfQFdlKBEb4mEStRtAX0tKKm4By3lJd01KHeqkJPbpgebCQjH1oSlkxiXavN9H8WyVimanHd+SEv/6yIoWzykQIDo/dapizy+EX/8JGzMilDSn7K0vQF3SI9ct+AtPbfwIA8KhADBphOGXp8ntH/Lgj0QT+CnP00zFF12xTcHiUjJcMfqugp+/WFO3Blw3/s8JeNuMnGrpvcNJobJu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6862004)(186003)(66476007)(66946007)(53546011)(26005)(2906002)(31686004)(450100002)(8936002)(30864003)(4326008)(66556008)(107886003)(31696002)(6486002)(316002)(508600001)(16576012)(5660300002)(8676002)(956004)(86362001)(2616005)(83380400001)(38100700002)(6636002)(36756003)(37006003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dxSjlvem1HSEk2U1BzYWxMVlArWWl4VkdwVGxsc2N4MmxUaWZjekxEL2pr?=
 =?utf-8?B?UXpMamYzNGNrT3dLbVFuS1l2VFJlejNod3B5d2RCUkh0dW1sSWs0WnRsMm4v?=
 =?utf-8?B?U3hIeEl6VWV2VXJ4YTRtcFNwZFEzMjNmRTFnaHBuTGpkcHJ1QnJCVXh2aWU4?=
 =?utf-8?B?eEJPNFZkdGx5STFsa3JyTWVBTURlL2piTFZoRUdzWDZHY3hvS2RyKzgxMHNB?=
 =?utf-8?B?UTM2QlFGTk1YZkE1amlhTHROVmJhYXAwRzhKSnU5c0ZnempReHJQcXdnU25V?=
 =?utf-8?B?SndzWjJsajV0M0xFMmNiV3pPdzlnc2wwdXF5RXhUZGdicEpVZHdhdmNRK29k?=
 =?utf-8?B?eDNDNDlQRTBnTEZ3Kzlsa1dPczl3UFR4Qlk5UlFiK0d1aXNENlNhNlpZVklQ?=
 =?utf-8?B?ME00VWNqbVJwYU9IZUdoZlJKR1BWeTF6SG1ienVjSGJRNTRvc1g3b0ZXeVdH?=
 =?utf-8?B?cHIvdHowWHd4cjF4RHNSWG9RUW9od1lQUldjeWp5N3ZoUEpqbE9xejJNdDNZ?=
 =?utf-8?B?bU8wNktib0FVSXB2M3VnRUhoZUh5RjFXU0xkOFJJSjUzMVFuZGc2NW11UXhp?=
 =?utf-8?B?RVdCemx2RUtTaElwMlpyRy9TSUg3UHBEZ0p5azF3bWh2c2h6ZS9mOVZXcmtr?=
 =?utf-8?B?TDQvejB3ZUJ3b09Ubm1jZkZFVmQwK1hzeklPWDNVUWtNR2c3L1N2OXJhRFhX?=
 =?utf-8?B?S0Q0Q3d1MU12SWQrRS9ZeXZyUGNiYlAwRGpucUxwcGtwKzl5MFVpeE4wb2Q1?=
 =?utf-8?B?Slp3OEVkbmZWWktJNUtLQloxOFlWTnJrcUhyQ2xoN255ZDMzTTlrS2psYWdM?=
 =?utf-8?B?OWd3YlpURXN1NkE5STkyQXF1T3hsN0pOSzBMQzJCSDBoTFQ2WmIvdS85TVY0?=
 =?utf-8?B?S3E4cnhhNmxqWC9MWThJbGZ6bFhTQjFKYkJ3SlJOcmNBdkFoaU5tME9TMGRu?=
 =?utf-8?B?clovdkJlUXk4NktCbDduVDdTMXZHbjcydHAxTHNhRlg1SFJnSVJBODYvWlRX?=
 =?utf-8?B?dzVXV1ZmUFozQm56UjlTK1VFVlAvSXVFZnExcWg3WjNDRElybzQrUWI3VlVT?=
 =?utf-8?B?ZEE3WklxTGgwZXBhNlRWQW9XdGY4VmpZOHNGTW9SWjNmOWd1alA0QlRCSUdK?=
 =?utf-8?B?a0lZZm1WRk4vcHpoSEZ6OFc1QkJDZEUydlVMVXI4K3dWemM1c1FkZC9iYUFU?=
 =?utf-8?B?RHhFZXhPYUp0QmtmZVFuTElleUMyMTJLV3FGMTMvY0MvVTdsRmhheGlrRzBD?=
 =?utf-8?B?ZmJXay9ERHlDRm1YRm9IU3RRcGRZODVjVXR3U0tTM0JMdS9CdVU5L3JhRkk4?=
 =?utf-8?B?MzVza1psQXpGRGF2ajFObXhxckZpaGNvbG1OcSthbHcrSXpWZW5sVDhqdTRx?=
 =?utf-8?B?RzhUaW9XZnpDSDVZRU5kUUdXWXVYUkFPemVtdTJGR3VuaitZUy9zSld5emZr?=
 =?utf-8?B?cExYWjJ1TzVkdGtSU1Y0M2txVlJTQjZtUHBjRVVNV3p0YytXNitXUCsrN2Z2?=
 =?utf-8?B?SmtEK2xKTHNWc3RjODRyT3dVTVhBeU94N1dBdStGbWNueVFVRVNLYzFyMWZM?=
 =?utf-8?B?TFZsQ2FhaVBBRi8xNDY3MHpTUjQrd2w0c1FXSTRXMiszaFErOFRkdzd6R3p2?=
 =?utf-8?B?STdvdWVWMWJScUhCa2ZDbDFOcVhuYmViOEtpMXd4a3lIUUtLS2xRMFhzaU4z?=
 =?utf-8?B?YllYOHVLUTZzM2VydTNXWDNiTTVZUkxzUGJlWHd3OG1Pb241ODlGam90Z1ZL?=
 =?utf-8?Q?zCREW1g8YfzTulAUMxEFT9RxEJM6lpjAGEdpBml?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5927d30d-8ad0-4774-fd3c-08d989be2309
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 18:13:17.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqUGIg/YQ0EFu9R0CPBaqLdjKHbfs9QwJwXxBuBZ6aAV+8Po91DPhjkPBenpVd7x0YSRF+q7XO+mFc8uKIzxaVtK7VVswPo8KGmlc3p9hUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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

On 10/7/2021 08:05, Matthew Brost wrote:
> On Wed, Oct 06, 2021 at 08:06:41PM -0700, John Harrison wrote:
>> On 10/4/2021 15:06, Matthew Brost wrote:
>>> Move guc_id allocation under submission state sub-struct as a future
>>> patch will reuse the spin lock as a global submission state lock. Moving
>>> this into sub-struct makes ownership of fields / lock clear.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_context_types.h |  6 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 26 +++++----
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 ++++++++++---------
>>>    3 files changed, 47 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> index 12252c411159..e7e3984aab78 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> @@ -197,18 +197,18 @@ struct intel_context {
>>>    	struct {
>>>    		/**
>>>    		 * @id: handle which is used to uniquely identify this context
>>> -		 * with the GuC, protected by guc->contexts_lock
>>> +		 * with the GuC, protected by guc->submission_state.lock
>>>    		 */
>>>    		u16 id;
>>>    		/**
>>>    		 * @ref: the number of references to the guc_id, when
>>>    		 * transitioning in and out of zero protected by
>>> -		 * guc->contexts_lock
>>> +		 * guc->submission_state.lock
>>>    		 */
>>>    		atomic_t ref;
>>>    		/**
>>>    		 * @link: in guc->guc_id_list when the guc_id has no refs but is
>>> -		 * still valid, protected by guc->contexts_lock
>>> +		 * still valid, protected by guc->submission_state.lock
>>>    		 */
>>>    		struct list_head link;
>>>    	} guc_id;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index 5dd174babf7a..65b5e8eeef96 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -70,17 +70,21 @@ struct intel_guc {
>>>    		void (*disable)(struct intel_guc *guc);
>>>    	} interrupts;
>>> -	/**
>>> -	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
>>> -	 * ce->guc_id.ref when transitioning in and out of zero
>>> -	 */
>>> -	spinlock_t contexts_lock;
>>> -	/** @guc_ids: used to allocate unique ce->guc_id.id values */
>>> -	struct ida guc_ids;
>>> -	/**
>>> -	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
>>> -	 */
>>> -	struct list_head guc_id_list;
>>> +	struct {
>>> +		/**
>>> +		 * @lock: protects everything in submission_state
>>> +		 */
>>> +		spinlock_t lock;
>> The old version also mentioned 'ce->guc_id.ref'. Should this not also
>> mention that transition? Or was the old comment inaccurate. I'm not seeing
>> any actual behaviour changes in the patch.
>>
>>
> Can add that back in.
>
>>> +		/**
>>> +		 * @guc_ids: used to allocate new guc_ids
>>> +		 */
>>> +		struct ida guc_ids;
>>> +		/**
>>> +		 * @guc_id_list: list of intel_context with valid guc_ids but no
>>> +		 * refs
>>> +		 */
>>> +		struct list_head guc_id_list;
>>> +	} submission_state;
>>>    	/**
>>>    	 * @submission_supported: tracks whether we support GuC submission on
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index ba0de35f6323..ad5c18119d92 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -68,16 +68,16 @@
>>>     * fence is used to stall all requests associated with this guc_id until the
>>>     * corresponding G2H returns indicating the guc_id has been deregistered.
>>>     *
>>> - * guc_ids:
>>> + * submission_state.guc_ids:
>>>     * Unique number associated with private GuC context data passed in during
>>>     * context registration / submission / deregistration. 64k available. Simple ida
>>>     * is used for allocation.
>>>     *
>>> - * Stealing guc_ids:
>>> - * If no guc_ids are available they can be stolen from another context at
>>> - * request creation time if that context is unpinned. If a guc_id can't be found
>>> - * we punt this problem to the user as we believe this is near impossible to hit
>>> - * during normal use cases.
>>> + * Stealing submission_state.guc_ids:
>>> + * If no submission_state.guc_ids are available they can be stolen from another
>> I would abbreviate this instance as well, submission_state.guc_id is quite
>> the mouthful. Unless this somehow magically links back to the structure
>> entry in the kerneldoc output?
>>
> It might, not really sure but agree the submission_state should be
> dropped. Think changed because of global find replace.
>
> Matt
Okay. With those nits fixed:
Reviewed by: John Harrison <John.C.Harrison@Intel.com>

>> John.
>>
>>> + * context at request creation time if that context is unpinned. If a guc_id
>>> + * can't be found we punt this problem to the user as we believe this is near
>>> + * impossible to hit during normal use cases.
>>>     *
>>>     * Locking:
>>>     * In the GuC submission code we have 3 basic spin locks which protect
>>> @@ -89,7 +89,7 @@
>>>     * sched_engine can be submitting at a time. Currently only one sched_engine is
>>>     * used for all of GuC submission but that could change in the future.
>>>     *
>>> - * guc->contexts_lock
>>> + * guc->submission_state.lock
>>>     * Protects guc_id allocation for the given GuC, i.e. only one context can be
>>>     * doing guc_id allocation operations at a time for each GuC in the system.
>>>     *
>>> @@ -103,7 +103,7 @@
>>>     *
>>>     * Lock ordering rules:
>>>     * sched_engine->lock -> ce->guc_state.lock
>>> - * guc->contexts_lock -> ce->guc_state.lock
>>> + * guc->submission_state.lock -> ce->guc_state.lock
>>>     *
>>>     * Reset races:
>>>     * When a full GT reset is triggered it is assumed that some G2H responses to
>>> @@ -1148,9 +1148,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
>>>    	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>>> -	spin_lock_init(&guc->contexts_lock);
>>> -	INIT_LIST_HEAD(&guc->guc_id_list);
>>> -	ida_init(&guc->guc_ids);
>>> +	spin_lock_init(&guc->submission_state.lock);
>>> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>>> +	ida_init(&guc->submission_state.guc_ids);
>>>    	return 0;
>>>    }
>>> @@ -1215,7 +1215,7 @@ static void guc_submit_request(struct i915_request *rq)
>>>    static int new_guc_id(struct intel_guc *guc)
>>>    {
>>> -	return ida_simple_get(&guc->guc_ids, 0,
>>> +	return ida_simple_get(&guc->submission_state.guc_ids, 0,
>>>    			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
>>>    			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>>    }
>>> @@ -1223,7 +1223,8 @@ static int new_guc_id(struct intel_guc *guc)
>>>    static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>>    	if (!context_guc_id_invalid(ce)) {
>>> -		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
>>> +		ida_simple_remove(&guc->submission_state.guc_ids,
>>> +				  ce->guc_id.id);
>>>    		reset_lrc_desc(guc, ce->guc_id.id);
>>>    		set_context_guc_id_invalid(ce);
>>>    	}
>>> @@ -1235,9 +1236,9 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    {
>>>    	unsigned long flags;
>>> -	spin_lock_irqsave(&guc->contexts_lock, flags);
>>> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>>>    	__release_guc_id(guc, ce);
>>> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>>> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    }
>>>    static int steal_guc_id(struct intel_guc *guc)
>>> @@ -1245,10 +1246,10 @@ static int steal_guc_id(struct intel_guc *guc)
>>>    	struct intel_context *ce;
>>>    	int guc_id;
>>> -	lockdep_assert_held(&guc->contexts_lock);
>>> +	lockdep_assert_held(&guc->submission_state.lock);
>>> -	if (!list_empty(&guc->guc_id_list)) {
>>> -		ce = list_first_entry(&guc->guc_id_list,
>>> +	if (!list_empty(&guc->submission_state.guc_id_list)) {
>>> +		ce = list_first_entry(&guc->submission_state.guc_id_list,
>>>    				      struct intel_context,
>>>    				      guc_id.link);
>>> @@ -1273,7 +1274,7 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out)
>>>    {
>>>    	int ret;
>>> -	lockdep_assert_held(&guc->contexts_lock);
>>> +	lockdep_assert_held(&guc->submission_state.lock);
>>>    	ret = new_guc_id(guc);
>>>    	if (unlikely(ret < 0)) {
>>> @@ -1295,7 +1296,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>>>    try_again:
>>> -	spin_lock_irqsave(&guc->contexts_lock, flags);
>>> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>>>    	might_lock(&ce->guc_state.lock);
>>> @@ -1310,7 +1311,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	atomic_inc(&ce->guc_id.ref);
>>>    out_unlock:
>>> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>>> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    	/*
>>>    	 * -EAGAIN indicates no guc_id are available, let's retire any
>>> @@ -1346,11 +1347,12 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>>>    	if (unlikely(context_guc_id_invalid(ce)))
>>>    		return;
>>> -	spin_lock_irqsave(&guc->contexts_lock, flags);
>>> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>>>    	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
>>>    	    !atomic_read(&ce->guc_id.ref))
>>> -		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
>>> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>>> +		list_add_tail(&ce->guc_id.link,
>>> +			      &guc->submission_state.guc_id_list);
>>> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    }
>>>    static int __guc_action_register_context(struct intel_guc *guc,
>>> @@ -1921,16 +1923,16 @@ static void guc_context_destroy(struct kref *kref)
>>>    	 * returns indicating this context has been deregistered the guc_id is
>>>    	 * returned to the pool of available guc_id.
>>>    	 */
>>> -	spin_lock_irqsave(&guc->contexts_lock, flags);
>>> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>>>    	if (context_guc_id_invalid(ce)) {
>>> -		spin_unlock_irqrestore(&guc->contexts_lock, flags);
>>> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    		__guc_context_destroy(ce);
>>>    		return;
>>>    	}
>>>    	if (!list_empty(&ce->guc_id.link))
>>>    		list_del_init(&ce->guc_id.link);
>>> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
>>> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>>>    	/* Seal race with Reset */
>>>    	spin_lock_irqsave(&ce->guc_state.lock, flags);

