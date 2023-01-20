Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F59675C33
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EC710EABF;
	Fri, 20 Jan 2023 17:55:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221210EABF;
 Fri, 20 Jan 2023 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674237335; x=1705773335;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SjxlZ+NffCbxZBijopCUMquHt+exM81JSjdCBWhBjvI=;
 b=aE2cfAXMahTDajjEdZ0xLIRZ9utYZvaCn77deTX/alZUvsKPlSB4MwMY
 FAL6XxR0GZGsJoFyE/TO/VY23OiAnhHbyLzdFXrQh+pFay76Rd6h3Wlcv
 heWstuTn/7FyYx9EEB7SELcQxtAUWg0pfgFXdt9WjYp7x8hbzO+Go24Ff
 HoXLL69A1oHDl5naKWAQt0l/d6ligjcHFoUeBzMlnwKsQLjE1GA30Q1+K
 kASBd35dIMMa3L8vuAvt+Lzwpe9Vf3qmfU/8Pg1RXx291ObyCYgobTW6B
 fCPN3C5kDWaR7t6GcL9a07fxVj4xo6tftsClTNZS4Ey1lCxMO8+mv5dNO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352898421"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="352898421"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 09:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989466804"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="989466804"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 09:55:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 09:55:30 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 09:55:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 09:55:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 09:55:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nvbo7dQ6e2whFiM1yOS8T6qA+1sW2uEtdDGh2OZa59hiKOm0bv++S3+Kw6nERdtWRJhyT4JdswI61c/aj6vkklGo9ZXGs6Y/kfdA19TI+Ati+ObCN2hqAoGO9VcbxTa7et2VQv0hD/4VkmYpoGzYf195NqFgS00hiWtcFTGf/cWcItgTpGRKi3eILBnEeiqd6qy2UMUFREC5hIrVtC2X4bTxk6MENpXpdrm7aQ/ApmfxWTMKOC3aiMXKlKlHGx3aZrMHT72XXl9l9cf59haJJEwjuL/i5Q6I8x1RkFEdA0Je3mj2jjjM4uyXAROZf57DMKM+4NYJPm+UEcs0dhNGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NZLexHhKk/O6QcRcXb0USEqDogk97Dp/8UbXQ0YCTc=;
 b=Bw9Ud/HDnf0tjIzLyLg1CEivi1E9yMztOJUYkB1oNCVzE/T5Y7Cw6kLsQDje4TC2stYbN9J6b4oM7nTHXNCL2Cjm2UiVy5qxZJn2nIT/V2qqwknWli5U4mYleEuPIho9SBiOE5CcZ3rEShKLsQHoFnr+WU9R3LYmZbhbI02pv5Bj5RrR5DaGcDS/V4Z0bCEyxIJYAk9kKi0VNliETeqNU9lvYzkvRNqT3xR7z3RsNbsMs8IBXR/1jHHEUBjddDutpLAZ+tEmhIX2stIYjCeO7gxDL9jHgs3TPQVc5DFYI8ygBncf5mF6m3LrHWT+Q00sStmtR3aPudRD7IdZ2j1/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Fri, 20 Jan
 2023 17:55:27 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 17:55:27 +0000
Message-ID: <774534f8-07c6-fdbf-1765-98fa39ce5ec6@intel.com>
Date: Fri, 20 Jan 2023 09:55:24 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3 3/6] drm/i915: Allow error capture without
 a request
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-4-John.C.Harrison@Intel.com>
 <8580bd3b-e65f-73e6-dc55-edd99bfaa6f9@intel.com>
 <232c6a45-86a4-fd2a-3246-1ae9fea41987@intel.com>
In-Reply-To: <232c6a45-86a4-fd2a-3246-1ae9fea41987@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: ea15ed97-1aa0-4302-83a8-08dafb0f833e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MoCo44B2cog+zPN8WVW0b4TPspGb4Lx0A5qEoeXXDpe6IKf6TBuo23/CxIiT3K3t/qWE2MHVylXnRxmjCjjnzTLYpLMvg98C0EiLcDAwnBvgPLhtErjR3c+fxqwpNqgNZKbR/J8/Cxtr2ZO2sVe4zytVAlaz3rnTziMdopMQpQZL/t5ova6eFGR1fLJSzugiuL6wFIokOIUU0fYXS5Yd0V6/tkXRLwl4xJr3TrMJWyPlqJDkiryo7tdjYPJn5whA/LevbokxM8zENjyYiXQUNNMQz0jeuoZgmBHdGX489NUo4Y4nXMgFCv9E3XpBikb9dfb9JPNJpb2O1vT960jeOwWVWcHSCw4S9lO3jwGvlPkcTS30yLYu0SBbvtvVO5pMf7G832b6nhc0GuPm3+f2Gtq/Iv8lUETudbQTdeRZBEY2CevxRsEBMXB+RtGaiMWtKRoL/40IgKTBwJtgFZqM2FAu3QIaMq8VHhgy95lG1FU1FQnLmQQt+Xn5y469bEGxMxM0yXrPd49F8C0YJviNsDVQxhcO15hFQ4O2Hj7Cz59VtJbiFkXZQNActwj8wJIlnSt3OFuojTYk+ubGuyABhknxj7RJrMjvumGj2Mck1fT0fXMaM9Mr5WDxsxYdfwP4I4Su1CipikX7GD1ZEt+WG30a8tWMFfd0Jj2y9XuHGInUz/TTmd+fto3o10uO0oMS5NPJHSlLooTeEzNWm6W48TWAwUhSLpACjCq+qTgnSpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(186003)(2906002)(26005)(6512007)(6506007)(53546011)(2616005)(316002)(6486002)(478600001)(36756003)(31696002)(6666004)(38100700002)(86362001)(83380400001)(41300700001)(82960400001)(4326008)(5660300002)(31686004)(8936002)(450100002)(66476007)(66946007)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3J0bS9QQm5yMmtWOVJMVjJVWm1ZalN2eUIrRTV3NXYwL1E0bGo4TGRPbW11?=
 =?utf-8?B?M1pKSmFheXl6VmpEU01FZG1lamlTY3dWckxpUFlGai93Ri9FSUlsYmFNV2NW?=
 =?utf-8?B?ODFGSFFjVFdZdGEyZ2hZL3JQQTlCSUFOK3YvRW05QXl3VnorMHdlZEx0NlZX?=
 =?utf-8?B?a3JTMFl0cENwL3dya3EvUjlGeUY0UzdMWjYvNG1xOTdzbEFNdVRYWWVyRlpa?=
 =?utf-8?B?dm4zRHNEUDY0YTFwZkJ4a3JQREJNYTJMSHJUSVVsNGE3aUFMV05qdVg0S2hk?=
 =?utf-8?B?RGF2QVFuam15WUdzQXR1OUp6L0dJdmlUM2lqWVVIcHBvUnJkNDl3TW5IWXhw?=
 =?utf-8?B?M1lXeVlzcXVQblFIMlpneDE0U3ZFM3NGYU5kQUhMZDVTcUpBK1dFMkZxc3J6?=
 =?utf-8?B?OGFSTDhrdU1HWmJpSS9KSTdYZS9JWGV1Rlc0WmQvdW43VFZEeHIyMXBKNGhZ?=
 =?utf-8?B?cm8rOTl5MVA5WjA0TUdRVnViVm9MampFalpPbWxiaFhkSVJ2VkxNbWtNMEhY?=
 =?utf-8?B?elFrVG1nZDgwMlJNNVZDM1RyOGxoVlNVUkN1cmF1VFBnWWhPY1ViL3h3N1RP?=
 =?utf-8?B?SlpHeGFremxFL29LdnBXazNNWGFhK243Z2FxbmYvdlBPMjU2OVlYV3gwN2Qr?=
 =?utf-8?B?VVhkTDhpcEFaUVNEV1k3Tms0dTR1WEY2bWhCK3E1TXllUFB0SVk0MG9MbkVY?=
 =?utf-8?B?Q3U3Szl5SUkwbkVVdW9uS0VBeGtSVWJxSzljWWYvWVdBbENMSm5ROHRLMTFi?=
 =?utf-8?B?amNJNDZmNnB4OGNSakpKZDdiS1duTGwyR1JGZ3R4eWJuZ28yNHJrSUkvdmtl?=
 =?utf-8?B?YTRyM2hrcUlKU05jdHpZdUZYOHp3Wkg1aU1zRjN5MmsxQWE3cW5RSkNHQkV0?=
 =?utf-8?B?K1JUWUdmZzhpK0hPa1U5L2lLUUMxWFJ4NDhoc2VFdDZSQzdXUE9tWU5CVlhU?=
 =?utf-8?B?SytSTVV0WFYrQnFtRnppSEtLNlV6QzZJM3NyWnBIQmJ4MzZYS2hacnNtVW03?=
 =?utf-8?B?YnMrOEoyeFYwbVlCd1JuZnVCUzl5eFJtaTRnd250NTBjdkxFZXNIdXFpMkti?=
 =?utf-8?B?aGZVU3I5STA0R2s5RTZlbmFHQ3lLZGNnc2o3K2hoWDlVam1LSHpweXNTZ0xP?=
 =?utf-8?B?cUZFWXFycFhRVmQ2YVRNOGllNm43Y0JtQ0lsUlZWcllXUlV6aTdwSjFZRUJ1?=
 =?utf-8?B?cWRYa2ZTWDBaVkVwRmJILzJkN1U5WUlMRUhMYm9hRE1wb0k5S29DOEViM3ZI?=
 =?utf-8?B?eGtDQStieFhrY043RUtRcmRsQzFNYy9NTzcxWUhnRzE4ZlFKTjY2UldyRkVn?=
 =?utf-8?B?NTNJOXJLRkhvWGF3MysrRFQvZjNNYWV3Qm1mdGU1Y3JjSzk2dFJBWmYyREl2?=
 =?utf-8?B?ZFVBNEpabHEwVXdGL2MrRjQ1NitCb3VPays3MSt5RjdwZGpWbE5GTzlNelBj?=
 =?utf-8?B?eXBOUFdGMitwOHRmWjNLNlRkdExwOUFoZ2xrM3BRQjNWazJnRER5dm1JVzI4?=
 =?utf-8?B?aTFwT09nMER5cmdUU0pxcDJEc29tNThnTU9vdVpIdlBqbTNJc21VL0o5aDBy?=
 =?utf-8?B?WXJINzZ5QUFvM2lZM2M2NFMvQkhXaVpHVXVkSG5BUWE4dFJaZjBaMFMyOXdU?=
 =?utf-8?B?MUtqRm9lbndzSHVkclErSEN2UnU0SmZJaFdOZnJXUld5WGNJdHcwdmdrZk45?=
 =?utf-8?B?cGhROWpkSW5Eb0xSUGl3c0N1c0p5NnZnejVJd3F6N2dQWlVIQk4yWFdQYmtO?=
 =?utf-8?B?ZmdtbXdyR0xqL3cvakxVS3oraUJOekhsa282RzN1NnJ5V0FKMUUvYVJ3TG9B?=
 =?utf-8?B?TGJjbmpTYmlQZG91MndzZVhZK0dsdXpGRTl6bWV3MEZqR2xzS0pITGJTeUs4?=
 =?utf-8?B?OTVOb2wxTUpXZXZ4OWIxV2dkUFhyWk1xWTFEVTcxeDlOWlVWLzFWY1kvdGJH?=
 =?utf-8?B?WGorUGlwUW1VcEQ5SGQvMUwzTG05S3lUQmM2WnozLzVFMGI2WGF1anFZWXJn?=
 =?utf-8?B?V0JaVDRSMlBlazVmQWtiMEVzTGRzeWlnRnZGaWlETjl2bEhuaGJNYVJTOWpH?=
 =?utf-8?B?UGtSQ2huVmNsTzg4RC9QRmpGK245WCs3d1Ura3FYVU1VU3phTjFjTnZhM3R5?=
 =?utf-8?B?MlhIa1Y4eW51SDZ4YU5KRUhoa3BiSElqOWg5eFdYWUdNQm9QNlJxMmZjZXFy?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea15ed97-1aa0-4302-83a8-08dafb0f833e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 17:55:27.3058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuXhaftB4jf6v7zkLbbMQ5XXLoayZLd+QAK/Tqa3e8dbQSJg4pF4m8EtiFqpH0aBw/DTcj5J/gXxBzxGSw+q16FZQmlmZNXGVDbeOcpmwZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/20/2023 09:36, John Harrison wrote:
> On 1/19/2023 17:54, Ceraolo Spurio, Daniele wrote:
>> On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> There was a report of error captures occurring without any hung
>>> context being indicated despite the capture being initiated by a 'hung
>>> context notification' from GuC. The problem was not reproducible.
>>> However, it is possible to happen if the context in question has no
>>> active requests. For example, if the hang was in the context switch
>>> itself then the breadcrumb write would have occurred and the KMD would
>>> see an idle context.
>>>
>>> In the interests of attempting to provide as much information as
>>> possible about a hang, it seems wise to include the engine info
>>> regardless of whether a request was found or not. As opposed to just
>>> prentending there was no hang at all.
>>>
>>> So update the error capture code to always record engine information
>>> if a context is given. Which means updating record_context() to take a
>>> context instead of a request (which it only ever used to find the
>>> context anyway). And split the request agnostic parts of
>>> intel_engine_coredump_add_request() out into a seaprate function.
>>>
>>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
>>> pointer.
>>> v3: Tidy up request locking code flow (Tvrtko)
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/i915_gpu_error.c | 70 
>>> ++++++++++++++++++---------
>>>   1 file changed, 48 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> index 78cf95e4dd230..743614fff5472 100644
>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct 
>>> intel_engine_coredump *ee)
>>>   }
>>>     static bool record_context(struct i915_gem_context_coredump *e,
>>> -               const struct i915_request *rq)
>>> +               struct intel_context *ce)
>>>   {
>>>       struct i915_gem_context *ctx;
>>>       struct task_struct *task;
>>>       bool simulated;
>>>         rcu_read_lock();
>>> -    ctx = rcu_dereference(rq->context->gem_context);
>>> +    ctx = rcu_dereference(ce->gem_context);
>>>       if (ctx && !kref_get_unless_zero(&ctx->ref))
>>>           ctx = NULL;
>>>       rcu_read_unlock();
>>> @@ -1396,8 +1396,8 @@ static bool record_context(struct 
>>> i915_gem_context_coredump *e,
>>>       e->guilty = atomic_read(&ctx->guilty_count);
>>>       e->active = atomic_read(&ctx->active_count);
>>>   -    e->total_runtime = 
>>> intel_context_get_total_runtime_ns(rq->context);
>>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>>         simulated = i915_gem_context_no_error_capture(ctx);
>>>   @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct 
>>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>>       return ee;
>>>   }
>>>   +static struct intel_engine_capture_vma *
>>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>>> +                struct intel_context *ce,
>>> +                gfp_t gfp)
>>> +{
>>> +    struct intel_engine_capture_vma *vma = NULL;
>>> +
>>> +    ee->simulated |= record_context(&ee->context, ce);
>>> +    if (ee->simulated)
>>> +        return NULL;
>>> +
>>> +    /*
>>> +     * We need to copy these to an anonymous buffer
>>> +     * as the simplest method to avoid being overwritten
>>> +     * by userspace.
>>> +     */
>>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>>> +
>>> +    return vma;
>>> +}
>>> +
>>>   struct intel_engine_capture_vma *
>>>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>>                     struct i915_request *rq,
>>>                     gfp_t gfp)
>>>   {
>>> -    struct intel_engine_capture_vma *vma = NULL;
>>> +    struct intel_engine_capture_vma *vma;
>>>   -    ee->simulated |= record_context(&ee->context, rq);
>>> -    if (ee->simulated)
>>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>>> +    if (!vma)
>>>           return NULL;
>>>         /*
>>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct 
>>> intel_engine_coredump *ee,
>>>        */
>>>       vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>>       vma = capture_user(vma, rq, gfp);
>>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>>> -    vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>>         ee->rq_head = rq->head;
>>>       ee->rq_post = rq->postfix;
>>> @@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
>>>           return NULL;
>>>         intel_get_hung_entity(engine, &ce, &rq);
>>> -    if (!rq || !i915_request_started(rq))
>>> -        goto no_request_capture;
>>> +    if (rq && !i915_request_started(rq)) {
>>> +        drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>>> with no active request!\n",
>>> +             engine->name);
>>
>> Shouldn't this print be inside the "else if" case below? otherwise if 
>> we don't have a rq at all we won't see it.
> The intention was that the message is specifically for the case where 
> a request exists but is being ignored. It is obvious when looking at 
> the capture if no request was found - there just isn't one in there. 
> But there is no way to distinguish that case from the situation where 
> a request was found but just was not considered 'active'. Hence 
> wanting to add a dmesg log instead.
>
> Could pull the better message in from the next patch to this one to 
> make it more clear - "Got hung context on %s with active request 
> %lld:%lld [0x%04X] not yet started".
>
>>
>>> +        i915_request_put(rq);
>>> +        rq = NULL;
>>> +    }
>>> +
>>> +    if (rq) {
>>> +        capture = intel_engine_coredump_add_request(ee, rq, 
>>> ATOMIC_MAYFAIL);
>>> +        i915_request_put(rq);
>>> +    } else if (ce) {
>>> +        capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>>> +    }
>>>   -    capture = intel_engine_coredump_add_request(ee, rq, 
>>> ATOMIC_MAYFAIL);
>>> -    if (!capture)
>>> -        goto no_request_capture;
>>>       if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>>           intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>>
>> Are you keeping this outside the "if (capture)" below to make sure we 
>> consume the GuC engine capture even if we fail to produce the error 
>> state? if so, a comment might be useful.
> Yeah, hadn't really noticed that the original version was effectively 
> leaking the GuC capture in the case of a failure. The buffer would 
> overflow and discard the oldest entries eventually. But it seems 
> better to deliberately free the buffer if the related capture is done 
> whether the capture worked or not.
>
> Can add a comment to the patch description about it.
Hmm. Actually, this will now be genuine leaking the capture state if the 
vma stuff fails. I think. It looks like the state object ownership gets 
transferred to the ee but then the ee gets freed below without freeing 
up any owned resources. So need to either not pull out the register 
state if !capture or explicitly free it on failure.

John.


>
> John.
>
>>
>> Daniele
>>
>>>   -    intel_engine_coredump_add_vma(ee, capture, compress);
>>> -    i915_request_put(rq);
>>> +    if (capture) {
>>> +        intel_engine_coredump_add_vma(ee, capture, compress);
>>> +    } else {
>>> +        kfree(ee);
>>> +        ee = NULL;
>>> +    }
>>>         return ee;
>>> -
>>> -no_request_capture:
>>> -    if (rq)
>>> -        i915_request_put(rq);
>>> -    kfree(ee);
>>> -    return NULL;
>>>   }
>>>     static void
>>
>

