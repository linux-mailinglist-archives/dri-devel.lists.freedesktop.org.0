Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C53C94CC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0816E4E6;
	Thu, 15 Jul 2021 00:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493776E4EA;
 Thu, 15 Jul 2021 00:13:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210434538"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="210434538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 17:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="430616026"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2021 17:13:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 17:13:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 17:13:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 17:13:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 17:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oyqc5BhHIMxkJWRdIfAAV7m1j21BjiQSLB0w9CWpBwk8d86itZ8QiKntLI0AAX8hhE8VJ3FDbCPbsn7ALdsfuqId0cEsqoq+3XBG61jYFIJ1LBBJnMk56OaoWEeOamuu/V6B3go5dfwC4UqmppJkhSLuBp/MGE+uo3rLVxyzEadfoePhJaEtgu7l8bq3lseYAJZmXMlKzqw2W3CzfkmXCArruqx+gfSjz1vWZhBIQuCSXDR/ws250HgzNggfSo/127LAK8TNi7czBtb4DUHqXOgUjq8AmruzTgF25YXGnEODq67NlB799NNESRRYABXMQ6AHMlRf1sVV+2v7C3fQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aecZANqsHZFmjypzqnf1k4x9W9rpeKdo0cDTxgZGE44=;
 b=Dt02y8zR7JMSTaeKnEuQV8UB667z/9ZGtC3Om3eaxx6FNo7XRs3xJmTVfaTdRIMJvkstBYLP2QfPv7+ouSRMU3FZGw7aRElx9zQNhNILXiozgfTrUOm+U1vKS7ClIGJ9gAI4jjrMbBkcxHAUdKFIUjY1NNPvWlc1um797M7BzhTY6Yc8PRMi+sqXsp8GhoVSnKzmWWMdsAw0QopR5QfabQC1ZRHRDfkAdbwFcWSIYZotCu/XNRD1tfO+eIqr96LNkKtdSxfeL3MeNocegHTOe+acYOqE/W+JcDdH+0If4SI3WNxhNbejoHPysJbwOEajW02OdkJRBibCpDyZhI+UJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aecZANqsHZFmjypzqnf1k4x9W9rpeKdo0cDTxgZGE44=;
 b=ohyzOkMX1V17MN6iv21gZy4IkS8RoXoCWmCsFy6YrKKe8MXOu286FgMtW0SJ/2ay1TYAqNaSl4rZocUSTsJnMloMexP9lHz4tJZocyDgOZ+pKq/fo5W5amU9RhiBFxfzit8gFo5k7CYjeHlwyh5UY3oyjzT+mOpJg6mVYKmDIwI=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 00:12:37 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 00:12:37 +0000
Subject: Re: [PATCH 21/47] drm/i915/guc: Ensure G2H response has space in
 buffer
To: Matthew Brost <matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-22-matthew.brost@intel.com>
 <f9ff96b7-45b4-c385-6360-4485e88b6b1a@intel.com>
 <20210715000622.GA17733@DUT031-TGLY.fm.intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <24971783-3ccd-52ba-74d0-d02f7b1e7d01@intel.com>
Date: Wed, 14 Jul 2021 17:12:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <20210715000622.GA17733@DUT031-TGLY.fm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 BYAPR03CA0028.namprd03.prod.outlook.com (2603:10b6:a02:a8::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:12:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 946aed53-edb0-44f8-a29e-08d947254094
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5674D08DC595A90C869ABBB5BD129@PH0PR11MB5674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FU8QD8+3ZjOG8Ax58FsUJzqIQExeVSTIRX+eEAiaSgVXA2n/VpgDiwyYx0ZHopkHV7pZR+Y8GgUNW80j2WWfiKb4XhXBzZgFzzKiUxfmHD3ZszSh0QTl1EHO6Jdu9Bl5vSRPXFvyormE4jftpkx1EhzTNjCjodR2NQqIFDAExk2Io+4FBfUcjsYo23tYshcppENRu5tG81LdRXE2No2eVtlzddhjxkX4HVYsI5dzdPoU922QLr6a5BhOsrD2CyXoWWBkSPG78RRtdUXU6bR9ab5zvZnn8/IgBLlo+NxO4Ag48W8GI1xfX8g37mw0vqmBcv7ceiHBAWUZQTGdDVp5XpPMmDxNuGHAov/EezFMVp2zzIIRB3+ga/ADFGMpF6Kn5VU6qjkw109j1mpW/b/o65yXcGMdWJLRXbUHSWciY9Df3zX1JCI49rEWtyKHqiMyuDDQRW3ftWLCv0k9fBeWqt8iwCnaZ0kKiTmmDcPoRb8k++bWAdpdRxSxEIhKFZQPpojJ9iwV+f+HBO8ZeOX5RuG8+adNtPdBscQZKaiE2blfhm5cDU21GTUYX8v9Z/vt6n++MfsyrfNgxBmLIZWg5/CV7sz8adSRoa31thmNskGRmbLnh6f9As33801RPIjuNBp384kfCIApiHA75o6QgXNbzl7hFvg++92wwxnIu1B2aqQKyK3mb6p6150lcf9sZv9VofoS28S1FsOsYOa+dy0QFszVF+3V90RGpHMKo38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(6486002)(6636002)(83380400001)(86362001)(38100700002)(2906002)(31696002)(2616005)(956004)(6862004)(66556008)(36756003)(478600001)(66946007)(53546011)(186003)(26005)(31686004)(66476007)(316002)(4326008)(30864003)(8676002)(450100002)(5660300002)(8936002)(107886003)(16576012)(37006003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZ3K1Z3R3RwdU8yb1RBWkFjNXFGN3RjWjY3eU12TEdQVUhKUXZnM2YrODdI?=
 =?utf-8?B?RnU0MWdBcUM1QVZlcUpySzltMDhaWTU1UUNnRDVjeXFNNlBYcklLMEw3Q0VZ?=
 =?utf-8?B?ZFZvWE5mUzNVQTFpMnk2ZEpLYWJESmNpSEd1NmRlcTlUWDIzWFdSQWtjUmdE?=
 =?utf-8?B?Zm5sN2theU9SbzBpd1Q4MWxyZVFxNmhPWmJVTG5sUy9GZE03UXZxd0psdlBS?=
 =?utf-8?B?VXk2NUVJK1JMc0x4YXcwOG40VStOK2cyUTZKTXpSV2tFZVE0TmdYeE1jYnAv?=
 =?utf-8?B?dk5GVzc5dnE1MGpRYmNPQWZjazlhaDZSM1kzaFRyOXQ0WDlZN3hSVjQwOGVX?=
 =?utf-8?B?Rmo2dXBKWkt3dFdYOHZyZWVXbXY2Mlg5MXVvd1EzWFFFdGNERDgxTkpJMXR2?=
 =?utf-8?B?ZFhKaFNKUC8zTmpTL3pJaFNZMXM5Q3ZsRUZSMEVVT3VWZlNwUlZkUDFzL25u?=
 =?utf-8?B?dkN5S2ZqUEtRaUZMc1VQc3VSSk1qL2phSUpWRHhBTWlrQkFPZXprSCtGTHZu?=
 =?utf-8?B?TlB4dzd6aGk2ek0vbnJMV0VBUFFBS2lQRkFKanZhRFM3Kzl6a2djTi9tMEg4?=
 =?utf-8?B?TmQxSWZiUU14RDhaNXA0U0o1TjE2RmVnRFBwRkxFYzFyS1phaXZqZEc3SzFm?=
 =?utf-8?B?V0tNNUUvaFdGbEdJb0lOMmNZMExjQTd4K1F3SG5CdFJEdkdyV1U1b3l2eGJP?=
 =?utf-8?B?RWx0Y2pqbjM5OVV2SEFKUWxYUzhVdDVEakswTW5ZMlpRSVBLNFVXSmgwdlZM?=
 =?utf-8?B?aEl1WUY2SVZ5YXlVaWpYOTJZbXVHQzhxaXIwc2dIUUd1VmxBVjMvNFdmb0RS?=
 =?utf-8?B?UHArUDhJVXA4SmZ6SFJBdEExdXZLQ2ZmUUxQaTFOL2RUU1JHa3FOYUN3dEJw?=
 =?utf-8?B?Mm1qaTY4ZVVLUkZZMjVLQ043QUE5U3BSOE84VDNFT0VrcWNsQmduRktqbjdU?=
 =?utf-8?B?dlhWNnlvaTJ4WjE4NGlQK0U3ZDYvTVBOTjUzRE1oSHdsWE9DcGhja0UvVit2?=
 =?utf-8?B?YXZQUUxTVVd4TDBqR05JblFXT0piKzA5dm9jNm9nOUdnV084ejVJUzc0TXE5?=
 =?utf-8?B?M1pMYXpZNTl4WUkvUkJUN1kwVTJyZjI4M3hoOWRCQ1JvVHRWSk5VTUMvVTkv?=
 =?utf-8?B?a1UwQkk0QTlnMUFFYms1UXZrQlV0SE50QmtVSC9taDhvMHc3eDJCKzYzSXlh?=
 =?utf-8?B?aWk1QXRtbGxPRVZteVQ0Z0k5ZUpGMjJkV1J0djVBRFRjVzIzRlBRVnE0S281?=
 =?utf-8?B?VmtMRWl0U2tiZE8zd1RUdkc3Z0h6V0RIZWpEWU5zS3ZYRDFobnRadlhrZ1FZ?=
 =?utf-8?B?VzM3S3E4dE5GTXZRSVJtbW9wN3NuVFR5RUVFaHJSSmxmVVVKMzQ2emxzL2p5?=
 =?utf-8?B?Qk54dnZBcVB5dmJ4R3lWRkxMb05NbjhTTkwrZmhHSjlWWmVEQm04U1BFbFk0?=
 =?utf-8?B?Q2lrdm5Rd1FlY0l6T1dzME1QT0FxaTgyQXkwRzNpMGZlTnh6S2V1YndsbU5w?=
 =?utf-8?B?NEN4cmxrdnF4OWM0MG5OeDMwM2YzVWo4T2pLbHNEU01ZdUFvaVhNVFMxaE1F?=
 =?utf-8?B?eXJCZ3RyMEN2ODF2TWlXR2phVjdMQ21rTFoyYjZVOEJNcjJTMEVIVFJaaU9l?=
 =?utf-8?B?Nm4wdnZiMk95eHYxbmZEdEJmQWlMbUNEMW13Q2haRzVEZG5RYkMyWDh4QUIr?=
 =?utf-8?B?d3pJNkxSUmZhZTNsSjR2eVNIR2ZrUHlXdTZZZVZYR29mRGRDRG9tWmZLRmtL?=
 =?utf-8?Q?mGiQ2DKAvqb9uAV+fCDBGBaR3iegoutRYCW/f0k?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 946aed53-edb0-44f8-a29e-08d947254094
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:12:37.3580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dI0VGFunHnJQt2jVfx4L/veuA9HOFN+HxJqTdJwXgY1JkR7uYTrfBkRpLwH44SiQ6e3AApircQQEVNROoUpnEOpx/LG9r321kih4iCpNeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/2021 17:06, Matthew Brost wrote:
> On Tue, Jul 13, 2021 at 11:36:05AM -0700, John Harrison wrote:
>> On 6/24/2021 00:04, Matthew Brost wrote:
>>> Ensure G2H response has space in the buffer before sending H2G CTB as
>>> the GuC can't handle any backpressure on the G2H interface.
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 13 +++-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 76 +++++++++++++++----
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  4 +-
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  4 +
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++--
>>>    5 files changed, 87 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> index b43ec56986b5..24e7a924134e 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>>> @@ -95,11 +95,17 @@ inline int intel_guc_send(struct intel_guc *guc, const u32 *action, u32 len)
>>>    }
>>>    #define INTEL_GUC_SEND_NB		BIT(31)
>>> +#define INTEL_GUC_SEND_G2H_DW_SHIFT	0
>>> +#define INTEL_GUC_SEND_G2H_DW_MASK	(0xff << INTEL_GUC_SEND_G2H_DW_SHIFT)
>>> +#define MAKE_SEND_FLAGS(len) \
>>> +	({GEM_BUG_ON(!FIELD_FIT(INTEL_GUC_SEND_G2H_DW_MASK, len)); \
>>> +	(FIELD_PREP(INTEL_GUC_SEND_G2H_DW_MASK, len) | INTEL_GUC_SEND_NB);})
>>>    static
>>> -inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len)
>>> +inline int intel_guc_send_nb(struct intel_guc *guc, const u32 *action, u32 len,
>>> +			     u32 g2h_len_dw)
>>>    {
>>>    	return intel_guc_ct_send(&guc->ct, action, len, NULL, 0,
>>> -				 INTEL_GUC_SEND_NB);
>>> +				 MAKE_SEND_FLAGS(g2h_len_dw));
>>>    }
>>>    static inline int
>>> @@ -113,6 +119,7 @@ intel_guc_send_and_receive(struct intel_guc *guc, const u32 *action, u32 len,
>>>    static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
>>>    					   const u32 *action,
>>>    					   u32 len,
>>> +					   u32 g2h_len_dw,
>>>    					   bool loop)
>>>    {
>>>    	int err;
>>> @@ -121,7 +128,7 @@ static inline int intel_guc_send_busy_loop(struct intel_guc* guc,
>>>    	might_sleep_if(loop && (!in_atomic() && !irqs_disabled()));
>>>    retry:
>>> -	err = intel_guc_send_nb(guc, action, len);
>>> +	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>>>    	if (unlikely(err == -EBUSY && loop)) {
>>>    		if (likely(!in_atomic() && !irqs_disabled()))
>>>    			cond_resched();
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> index 7491f041859e..a60970e85635 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>> @@ -73,6 +73,7 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
>>>    #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
>>>    #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
>>>    #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>> +#define G2H_ROOM_BUFFER_SIZE	(PAGE_SIZE)
>> Any particular reason why PAGE_SIZE instead of SZ_4K? I'm not seeing
>> anything in the code that is actually related to page sizes. Seems like
>> '(CTB_G2H_BUFFER_SIZE / 4)' would be a more correct way to express it.
>> Unless I'm missing something about how it's used?
>>
> Yes, CTB_G2H_BUFFER_SIZE / 4 is better.
>
> Matt
Okay. With that changed:

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
>> John.
>>
>>
>>>    struct ct_request {
>>>    	struct list_head link;
>>> @@ -129,23 +130,27 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
>>>    static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
>>>    {
>>> +	u32 space;
>>> +
>>>    	ctb->broken = false;
>>>    	ctb->tail = 0;
>>>    	ctb->head = 0;
>>> -	ctb->space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size);
>>> +	space = CIRC_SPACE(ctb->tail, ctb->head, ctb->size) - ctb->resv_space;
>>> +	atomic_set(&ctb->space, space);
>>>    	guc_ct_buffer_desc_init(ctb->desc);
>>>    }
>>>    static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
>>>    			       struct guc_ct_buffer_desc *desc,
>>> -			       u32 *cmds, u32 size_in_bytes)
>>> +			       u32 *cmds, u32 size_in_bytes, u32 resv_space)
>>>    {
>>>    	GEM_BUG_ON(size_in_bytes % 4);
>>>    	ctb->desc = desc;
>>>    	ctb->cmds = cmds;
>>>    	ctb->size = size_in_bytes / 4;
>>> +	ctb->resv_space = resv_space / 4;
>>>    	guc_ct_buffer_reset(ctb);
>>>    }
>>> @@ -226,6 +231,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>>    	struct guc_ct_buffer_desc *desc;
>>>    	u32 blob_size;
>>>    	u32 cmds_size;
>>> +	u32 resv_space;
>>>    	void *blob;
>>>    	u32 *cmds;
>>>    	int err;
>>> @@ -250,19 +256,23 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>>>    	desc = blob;
>>>    	cmds = blob + 2 * CTB_DESC_SIZE;
>>>    	cmds_size = CTB_H2G_BUFFER_SIZE;
>>> -	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "send",
>>> -		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>>> +	resv_space = 0;
>>> +	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "send",
>>> +		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>> +		 resv_space);
>>> -	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
>>> +	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size, resv_space);
>>>    	/* store pointers to desc and cmds for recv ctb */
>>>    	desc = blob + CTB_DESC_SIZE;
>>>    	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
>>>    	cmds_size = CTB_G2H_BUFFER_SIZE;
>>> -	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "recv",
>>> -		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
>>> +	resv_space = G2H_ROOM_BUFFER_SIZE;
>>> +	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u/%u\n", "recv",
>>> +		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size,
>>> +		 resv_space);
>>> -	guc_ct_buffer_init(&ct->ctbs.recv, desc, cmds, cmds_size);
>>> +	guc_ct_buffer_init(&ct->ctbs.recv, desc, cmds, cmds_size, resv_space);
>>>    	return 0;
>>>    }
>>> @@ -458,7 +468,7 @@ static int ct_write(struct intel_guc_ct *ct,
>>>    	/* now update descriptor */
>>>    	ctb->tail = tail;
>>>    	WRITE_ONCE(desc->tail, tail);
>>> -	ctb->space -= len + 1;
>>> +	atomic_sub(len + 1, &ctb->space);
>>>    	return 0;
>>> @@ -521,13 +531,34 @@ static inline bool ct_deadlocked(struct intel_guc_ct *ct)
>>>    	return ret;
>>>    }
>>> +static inline bool g2h_has_room(struct intel_guc_ct *ct, u32 g2h_len_dw)
>>> +{
>>> +	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
>>> +
>>> +	/*
>>> +	 * We leave a certain amount of space in the G2H CTB buffer for
>>> +	 * unexpected G2H CTBs (e.g. logging, engine hang, etc...)
>>> +	 */
>>> +	return !g2h_len_dw || atomic_read(&ctb->space) >= g2h_len_dw;
>>> +}
>>> +
>>> +static inline void g2h_reserve_space(struct intel_guc_ct *ct, u32 g2h_len_dw)
>>> +{
>>> +	lockdep_assert_held(&ct->ctbs.send.lock);
>>> +
>>> +	GEM_BUG_ON(!g2h_has_room(ct, g2h_len_dw));
>>> +
>>> +	if (g2h_len_dw)
>>> +		atomic_sub(g2h_len_dw, &ct->ctbs.recv.space);
>>> +}
>>> +
>>>    static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>>>    {
>>>    	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>    	u32 head;
>>>    	u32 space;
>>> -	if (ctb->space >= len_dw)
>>> +	if (atomic_read(&ctb->space) >= len_dw)
>>>    		return true;
>>>    	head = READ_ONCE(ctb->desc->head);
>>> @@ -540,16 +571,16 @@ static inline bool h2g_has_room(struct intel_guc_ct *ct, u32 len_dw)
>>>    	}
>>>    	space = CIRC_SPACE(ctb->tail, head, ctb->size);
>>> -	ctb->space = space;
>>> +	atomic_set(&ctb->space, space);
>>>    	return space >= len_dw;
>>>    }
>>> -static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
>>> +static int has_room_nb(struct intel_guc_ct *ct, u32 h2g_dw, u32 g2h_dw)
>>>    {
>>>    	lockdep_assert_held(&ct->ctbs.send.lock);
>>> -	if (unlikely(!h2g_has_room(ct, len_dw))) {
>>> +	if (unlikely(!h2g_has_room(ct, h2g_dw) || !g2h_has_room(ct, g2h_dw))) {
>>>    		if (ct->stall_time == KTIME_MAX)
>>>    			ct->stall_time = ktime_get();
>>> @@ -563,6 +594,9 @@ static int has_room_nb(struct intel_guc_ct *ct, u32 len_dw)
>>>    	return 0;
>>>    }
>>> +#define G2H_LEN_DW(f) \
>>> +	FIELD_GET(INTEL_GUC_SEND_G2H_DW_MASK, f) ? \
>>> +	FIELD_GET(INTEL_GUC_SEND_G2H_DW_MASK, f) + GUC_CTB_HXG_MSG_MIN_LEN : 0
>>>    static int ct_send_nb(struct intel_guc_ct *ct,
>>>    		      const u32 *action,
>>>    		      u32 len,
>>> @@ -570,12 +604,13 @@ static int ct_send_nb(struct intel_guc_ct *ct,
>>>    {
>>>    	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
>>>    	unsigned long spin_flags;
>>> +	u32 g2h_len_dw = G2H_LEN_DW(flags);
>>>    	u32 fence;
>>>    	int ret;
>>>    	spin_lock_irqsave(&ctb->lock, spin_flags);
>>> -	ret = has_room_nb(ct, len + 1);
>>> +	ret = has_room_nb(ct, len + 1, g2h_len_dw);
>>>    	if (unlikely(ret))
>>>    		goto out;
>>> @@ -584,6 +619,7 @@ static int ct_send_nb(struct intel_guc_ct *ct,
>>>    	if (unlikely(ret))
>>>    		goto out;
>>> +	g2h_reserve_space(ct, g2h_len_dw);
>>>    	intel_guc_notify(ct_to_guc(ct));
>>>    out:
>>> @@ -965,10 +1001,22 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
>>>    static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)
>>>    {
>>>    	const u32 *hxg = &request->msg[GUC_CTB_MSG_MIN_LEN];
>>> +	u32 action = FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, hxg[0]);
>>>    	unsigned long flags;
>>>    	GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, hxg[0]) != GUC_HXG_TYPE_EVENT);
>>> +	/*
>>> +	 * Adjusting the space must be done in IRQ or deadlock can occur as the
>>> +	 * CTB processing in the below workqueue can send CTBs which creates a
>>> +	 * circular dependency if the space was returned there.
>>> +	 */
>>> +	switch (action) {
>>> +	case INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>>> +	case INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>>> +		atomic_add(request->size, &ct->ctbs.recv.space);
>>> +	}
>>> +
>>>    	spin_lock_irqsave(&ct->requests.lock, flags);
>>>    	list_add_tail(&request->link, &ct->requests.incoming);
>>>    	spin_unlock_irqrestore(&ct->requests.lock, flags);
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> index 9924335e2ee6..660bf37238e2 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
>>> @@ -33,6 +33,7 @@ struct intel_guc;
>>>     * @desc: pointer to the buffer descriptor
>>>     * @cmds: pointer to the commands buffer
>>>     * @size: size of the commands buffer in dwords
>>> + * @resv_space: reserved space in buffer in dwords
>>>     * @head: local shadow copy of head in dwords
>>>     * @tail: local shadow copy of tail in dwords
>>>     * @space: local shadow copy of space in dwords
>>> @@ -43,9 +44,10 @@ struct intel_guc_ct_buffer {
>>>    	struct guc_ct_buffer_desc *desc;
>>>    	u32 *cmds;
>>>    	u32 size;
>>> +	u32 resv_space;
>>>    	u32 tail;
>>>    	u32 head;
>>> -	u32 space;
>>> +	atomic_t space;
>>>    	bool broken;
>>>    };
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> index 4e4edc368b77..94bb1ca6f889 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>>> @@ -17,6 +17,10 @@
>>>    #include "abi/guc_communication_ctb_abi.h"
>>>    #include "abi/guc_messages_abi.h"
>>> +/* Payload length only i.e. don't include G2H header length */
>>> +#define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	2
>>> +#define G2H_LEN_DW_DEREGISTER_CONTEXT		1
>>> +
>>>    #define GUC_CONTEXT_DISABLE		0
>>>    #define GUC_CONTEXT_ENABLE		1
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 010e46dd6b16..ef24758c4266 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -260,6 +260,7 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    	struct intel_context *ce = rq->context;
>>>    	u32 action[3];
>>>    	int len = 0;
>>> +	u32 g2h_len_dw = 0;
>>>    	bool enabled = context_enabled(ce);
>>>    	GEM_BUG_ON(!atomic_read(&ce->guc_id_ref));
>>> @@ -271,13 +272,13 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>>>    		action[len++] = GUC_CONTEXT_ENABLE;
>>>    		set_context_pending_enable(ce);
>>>    		intel_context_get(ce);
>>> +		g2h_len_dw = G2H_LEN_DW_SCHED_CONTEXT_MODE_SET;
>>>    	} else {
>>>    		action[len++] = INTEL_GUC_ACTION_SCHED_CONTEXT;
>>>    		action[len++] = ce->guc_id;
>>>    	}
>>> -	err = intel_guc_send_nb(guc, action, len);
>>> -
>>> +	err = intel_guc_send_nb(guc, action, len, g2h_len_dw);
>>>    	if (!enabled && !err) {
>>>    		set_context_enabled(ce);
>>>    	} else if (!enabled) {
>>> @@ -730,7 +731,7 @@ static int __guc_action_register_context(struct intel_guc *guc,
>>>    		offset,
>>>    	};
>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
>>> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>>>    }
>>>    static int register_context(struct intel_context *ce)
>>> @@ -750,7 +751,8 @@ static int __guc_action_deregister_context(struct intel_guc *guc,
>>>    		guc_id,
>>>    	};
>>> -	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
>>> +	return intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> +					G2H_LEN_DW_DEREGISTER_CONTEXT, true);
>>>    }
>>>    static int deregister_context(struct intel_context *ce, u32 guc_id)
>>> @@ -889,7 +891,8 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>>>    	intel_context_get(ce);
>>> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), true);
>>> +	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action),
>>> +				 G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>>>    }
>>>    static u16 prep_context_pending_disable(struct intel_context *ce)

