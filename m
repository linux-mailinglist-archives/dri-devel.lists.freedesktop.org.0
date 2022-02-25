Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE954C4CAC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB7410E25B;
	Fri, 25 Feb 2022 17:39:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CBD10E25B;
 Fri, 25 Feb 2022 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645810794; x=1677346794;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=klY+FJ2cOtE3MWUoCD2vGsSOcaA/+Dtv1cb/FhZHVi0=;
 b=TfE6Leo65mW3ZcSfRuagFlYnFSPIhKqe+yzqo6D7JPRRPfnJFzRT11sA
 pYU7Hz5soK8PHuvw5oxrS2ce4H8D6gbW/UAuYKQI+sHwN/vHneXWmRDoD
 me8P3Y7y+26pUUIV3jAUlTEqfPtqslIwUeSAz9RAgkaPhh0yIyAsvDIEz
 dH+IdBBsQjA9VvcCLXEMzby9SKhsvzlhGltoYwGwVUSXTc+C9PuLsRucB
 b4BCWVPH7i8+nbRWxmmrqg/VYav87sHvOCX+famXajJkwvdKvQQnPaSKL
 sKum75k3Vmcq2s5hV9TX/+Ts1q2GD/6fx42KaRId5xFowlW8/t1BeE38p w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315759197"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="315759197"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 09:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="492041832"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 25 Feb 2022 09:39:53 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 09:39:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 09:39:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 09:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brXYjAOtkJc7tL2iVGQfkvPkMQ35yx1KZfQWMpG3GPy84hP+Ymh192ZrFiMM/nRKFSSObBLempsNGtQP7RSMgFcTXO5Xaz7S3yyAU9ATStCeRYONmaHbqYVG0cmXDM1WgJV4VENX415Sn7/OHSKNLKBTWVssraJcs2gMmaKQONEkpLcGmgneBwSTo7pVtbuV4gFl9cxOnizEfPw4gq2NRYIsmrxqD8jVbFOEqGrbXpyCUYH18YVZfbz+eiPkqtX8efYalfzXf2/QuIT+JMdmCTUIP1JNe6YxJqT3rnsNZwXKJQ3JO+uOn8GpIkYVI4kPZDPkPoooZ/mHOAl1VMiI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxie2mxX+AYo6GCyIojnlgnnYBpF5W9LBdNTLbcw+zY=;
 b=NoEBUSZRTcFIdKkje7839xlTi5MQZLyV0SwmKpTRrLccso++wc4Pt4bWfrvcaHsiP2949gvg/mWkL+NZjxKSe7/Bj4/8yDdACiwUETlPe0+AYfm1V55/QEc5U6KFxDRmWi7SD8pCCF/Nz+fTg07GbLVUDQwPBKGQvW1HPZ8Ob6kP0ipfoeKeedcRPD12Kx4WjYM451kewAsb8d62OM20kRM3xfJDPJcBcvDSahUBPtKyU0lpJx28+7z/9418xpvZe3Z5AWq4lZjKY8V6Of+bUGR7KCk1p/BRaOrc4DGntEr8u5uXiITvBLjOtpXCZrdYAkWaTZ5Y12l+l26sQU0Kcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH0PR11MB5724.namprd11.prod.outlook.com (2603:10b6:610:101::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 17:39:50 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 17:39:50 +0000
Message-ID: <986dae97-6c68-34cc-d972-22edaddf7261@intel.com>
Date: Fri, 25 Feb 2022 09:39:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/i915/guc: Limit scheduling properties
 to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-2-John.C.Harrison@Intel.com>
 <0d0c5a79-1285-0830-3794-e9f0644811a5@linux.intel.com>
 <94c3184e-c1e2-668f-5824-00fd55797736@intel.com>
 <17e69f0c-8084-10dc-b20f-7d5108260180@linux.intel.com>
 <85105590-a8be-f4e1-69bc-cd34cad108e2@intel.com>
 <16a2687b-4996-8d40-456e-019a112f0fb6@linux.intel.com>
 <c1472196-260a-d2c8-c508-10fe58d4cd47@intel.com>
 <74d30fd4-cb72-113e-fc09-12602b3cf06d@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <74d30fd4-cb72-113e-fc09-12602b3cf06d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0171.namprd04.prod.outlook.com
 (2603:10b6:104:4::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21774933-a11c-4c4e-9865-08d9f885d2ae
X-MS-TrafficTypeDiagnostic: CH0PR11MB5724:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5724F0A6FC35E5D889435DD4BD3E9@CH0PR11MB5724.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1p0RtO+IUMCS48g6J8xPxpiWxu2N5sS7HzgmdfgMIC9amgMyFOppBTKGgebVAVGHDHK1iJg5QoK9HJM2ACcb13fJszxk2kGh7uZnaLD1Tc95Q7AeFLWXdZwcdy4A/X4xE0xGWmUVp+lS4ghoXJj6PWylM1VCZc7s7T+HHOnXseEGvXjfOBaM5m6mEqmctMZQPiBltdh3reA71sG4h16Oyxi/uNSeO5959Spe/enAOgwq+nmT8uh0m1JXUBhTvF3owSNgEMm0Kk8nutFi3/AAukCJ7RCGMKb9ya5NygtBL0Ndy+87PlPIWVhODMlOxvLdOMv8Idx2qeVdItgYc5BM/S0B06BqIlVPyiFT6C9fHDHcQ3Pfd3uDTisB6FDRcfAjnG4wx4KPlKQ9D3iWAfEmVgYqPlbQhCt0cXx+hpDFzJ+7sctk/hJg08fIrIEYe6ON2W2QOuwgxCYUAN9PCC3TBafMRxydOc5yiXOUdnXSzf81jv7ZimxZVn5NS5ypkOylgAIIrnPvwn9IcGBTaiGBMU/QUCeII2RNIBvg8sOvln+CkV+PyIXbZKzqXJ99tamO8SzDDKZDklToeMS4r78VXQA1a9KEXgwFjAYGOi2V765YNbKqfVudCPj0oFMOVUW7KL/vA3WJOsdYXo0vWPqnvlydjJ2Ffl8VpYk/5R6S27tnyAohci1a5rip23Mhnv9XDsPSt4weZnWN7kpyq7X1/WzGsmfCFLeirv0TE1Dm2wiPxJJq5Fr4s34+i+6R/Nh7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(31686004)(6486002)(6666004)(36756003)(508600001)(53546011)(82960400001)(316002)(26005)(186003)(38100700002)(83380400001)(4326008)(66946007)(66556008)(2616005)(66476007)(2906002)(6512007)(5660300002)(31696002)(30864003)(86362001)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnZDbkdIb0RCQXJZV3dKbWZSbWxHWDJmSk5tZVR6TnhQZlVyTGpxMHJNWTlC?=
 =?utf-8?B?MUMzWVMyUkhuMFMzRWRLZmcwd3h5QUwzeC9Pa2xlT1RlR2EzVmRpRHN2UGp0?=
 =?utf-8?B?ekJIVFp2NG5LcjBIdGFLRHVlTlZkSkt0WW0yQzVJazYrcENDdWxZZEF6N0Uy?=
 =?utf-8?B?OE01eUJYZ0x0WS8zK1FFbVc4NHFDbCszb3ZCUXN5QWdzTTAyRXpDQ2YyU2NT?=
 =?utf-8?B?UldaSXFkVk80eG5XM2hEU1hBdXI1TVhXTkFQV0lpVDdOR2Nlb0RkdVZqbU1j?=
 =?utf-8?B?QjlOcTE0bTAxZjgrQVAzMXVycGFoZlBrdmNkQm9TLy92RXZ4VllCN3ErWWVm?=
 =?utf-8?B?K3E1SDhkbXRrQjJsTUJ3VkFjcmUvZmgzL2prdXZ1eDUwY1lLaDliQUdCaEVN?=
 =?utf-8?B?aXJwbnROS1BFN2tyUTZtN2s0aC9kbXFmN1ExZVJZeWNKZitMdHBHRWZ2bUFC?=
 =?utf-8?B?aTNEL2ZsR2xScnNIQ21hSVBwYnFFWFF6NXJFeG1ObWJ1RFlmZzhzQ1B4VnQz?=
 =?utf-8?B?Q0o5Y203ampEMklhRE1HbGhlK0RycUxSblNFMEtieWxjbWJXNkFHNllmYnR5?=
 =?utf-8?B?SUhObzJtSEluR1VwdmZlUjJiWDNIMEJSbzFwU08ydHJSNnVWN2Q3eHFGaWxX?=
 =?utf-8?B?VVNscXBrRGJyTzQ2VE12S2h4WWpyQ0t6MDJ3Tmc2THhwNit0TG1vYlY2MW5U?=
 =?utf-8?B?SnBGU2VYY0dVZDUzNEZ6dG1CdnhIeTVkYXF6a04zNFgzck1DWENWZnhocDRp?=
 =?utf-8?B?QUtxcnJ2N1dta0M3cU5MTHpiQVFGYkwrN3pNTld4UmJmVEhGMlQ4cU1mQjVr?=
 =?utf-8?B?bVQ4MzFMMlJ0OVllL3haUm9RWlhOSkYvY0FqK2xIeEg2a0RZeVRGVS90ajJQ?=
 =?utf-8?B?RVlDUFE4RTBDV1prTXgzZmE5WVZnMDJmeEJlL1dkaWMvek9tM3lWcDZXZDVp?=
 =?utf-8?B?SjFpWHQxbkFwVGFUY0tVTXB3enhrMjkvcjhlRHkzeDhYYVdmVzkwbzJVTTF6?=
 =?utf-8?B?MUFVdWh3eXNEK2tkZkRhYWRiMnk1SURSS2FHdzhRTFlDMGYrUldmaFpQQ1Ix?=
 =?utf-8?B?SFJDZXUrZERjODZUeDlHMTQ4WTkvQ05EYnVWNUtkV21Wc1haVkZTbkd6MzFk?=
 =?utf-8?B?SHVhd282eENtc0ZFcE5peDg1dmRLNmM1a2hBVXJEcEpNQTc1Sk5Yc2ZjVXo1?=
 =?utf-8?B?c3BiWExQbWVibGlkU2dLL3dqakhDc1ZNWjFzQnE4b1JXendiaTVGNS9BbWFn?=
 =?utf-8?B?K0lldFVHT0dzVW14RUtQWk9YZktXVWZKNXB0SlV4bnBZM2dhUnM2cWk3eFZh?=
 =?utf-8?B?ZTBMZ3hpTUtLcDJldSs0anpJTVZyY1pBVmFsd0JWY1lXYVNBY1FTT21ZcUVm?=
 =?utf-8?B?TU9zRlI4V0tvRDdVMWk1ZThrUFpoaFFTNlFDbWRTSUtFU3cxUEhEamRjMmlN?=
 =?utf-8?B?WVNpQVlUM2JnRFQ1eW0rYm9QM3JsbGVzVVZkWEhHUFVvaVJVMVc5TUtmMkE4?=
 =?utf-8?B?VWJFY2thcWVtc2hVQTRTQW8zcEREUWpBYnhUQ2prVUJsQ0VPQlRpTjlBWVp3?=
 =?utf-8?B?ZW95T2s0djFsS3cvK2RoM0c5RDNYcVFCS093bzQvcXFVYk9xZHRYa0k1Ujd6?=
 =?utf-8?B?QUF3KzBGS2hROFJGejRPdC9VK0Ewb0pBc0xZbm92WlVGR1QrZjVMYlBtcW9y?=
 =?utf-8?B?TjRjdmZKc3JQWjROa2tlTXVaMUFUSVVkSy8xUzQ2YXg2aGhMOFVRMUZBWHZT?=
 =?utf-8?B?MDFsZTdDMU1JbXJ3NGk2K0hjUjNQWG1HOU94emp3TDg1cHl0RlVYdGVMVlFu?=
 =?utf-8?B?QUNZOGkybHRBN093MWRLMHBPaWdqOVFIQ2k2a2x4UWRzVndQOC9nZ3lzakQ4?=
 =?utf-8?B?R1A5QmtVdEc0OVVtZzhkeFdQM0dqWXpHSUJUU1haU0gwdnRNcW00U1JKZWdU?=
 =?utf-8?B?aFZybm1BQXpIQXdMbzF0SG01QmxsdnVTNDBFSUtVUk0yVkZvaWhEbk4weFNZ?=
 =?utf-8?B?dllBaVh0YnZ2Vys0ZWpGL3BiR2hJbzF1bWhTeHZKRkZxbmlWMWV5ZUNIVnFW?=
 =?utf-8?B?Ym9XYnJxbHVxMUlFQlM3aEVXRVRwT0lpcWNvZlB3TnNNRkxYWWtBeTlMMG52?=
 =?utf-8?B?eTVubDBHd3NINXhyTGhUdkg4L3BNRmNjc2dweXVUaDlBeC9RTnAzWER4dmJM?=
 =?utf-8?B?RGJ2TFRJMURmM0FiSXltS1hDb0Nxd0thTkpBUC9KdFl0elJmSTVzWXJjRC8r?=
 =?utf-8?Q?yTxbtd8ybGVxzEwy400t1QPy+uwS/B0AIDHcpjjOBk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21774933-a11c-4c4e-9865-08d9f885d2ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 17:39:50.0038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNo9DUaDjEvQX2uPdEnL8zbQO96EqrzV0XDeN9341IEC0VFj9TUbibn2naE9AzvZw6fEvgWskq+nX/sm40W3b+M2necPehX/Tum6JrmBsog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5724
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

On 2/25/2022 09:06, Tvrtko Ursulin wrote:
>
> On 24/02/2022 19:19, John Harrison wrote:
>
> [snip]
>
>>>>>>> ./gt/uc/intel_guc_fwif.h: u32 execution_quantum;
>>>>>>>
>>>>>>> ./gt/uc/intel_guc_submission.c: desc->execution_quantum = 
>>>>>>> engine->props.timeslice_duration_ms * 1000;
>>>>>>>
>>>>>>> ./gt/intel_engine_types.h:              unsigned long 
>>>>>>> timeslice_duration_ms;
>>>>>>>
>>>>>>> timeslice_store/preempt_timeout_store:
>>>>>>> err = kstrtoull(buf, 0, &duration);
>>>>>>>
>>>>>>> So both kconfig and sysfs can already overflow GuC, not only 
>>>>>>> because of tick conversion internally but because at backend 
>>>>>>> level nothing was done for assigning 64-bit into 32-bit. Or I 
>>>>>>> failed to find where it is handled.
>>>>>> That's why I'm adding this range check to make sure we don't 
>>>>>> allow overflows.
>>>>>
>>>>> Yes and no, this fixes it, but the first bug was not only due GuC 
>>>>> internal tick conversion. It was present ever since the u64 from 
>>>>> i915 was shoved into u32 sent to GuC. So even if GuC used the 
>>>>> value without additional multiplication, bug was be there. My 
>>>>> point being when GuC backend was added timeout_ms values should 
>>>>> have been limited/clamped to U32_MAX. The tick discovery is 
>>>>> additional limit on top.
>>>> I'm not disagreeing. I'm just saying that the truncation wasn't 
>>>> noticed until I actually tried using very long timeouts to debug a 
>>>> particular problem. Now that it is noticed, we need some method of 
>>>> range checking and this simple clamp solves all the truncation 
>>>> problems.
>>>
>>> Agreed in principle, just please mention in the commit message all 
>>> aspects of the problem.
>>>
>>> I think we can get away without a Fixes: tag since it requires user 
>>> fiddling to break things in unexpected ways.
>>>
>>> I would though put in a code a clamping which expresses both, 
>>> something like min(u32, ..GUC LIMIT..). So the full story is 
>>> documented forever. Or "if > u32 || > ..GUC LIMIT..) return 
>>> -EINVAL". Just in case GuC limit one day changes but u32 stays. 
>>> Perhaps internal ticks go away or anything and we are left with 
>>> plain 1:1 millisecond relationship.
>> Can certainly add a comment along the lines of "GuC API only takes a 
>> 32bit field but that is further reduced to GUC_LIMIT due to internal 
>> calculations which would otherwise overflow".
>>
>> But if the GuC limit is > u32 then, by definition, that means the GuC 
>> API has changed to take a u64 instead of a u32. So there will no u32 
>> truncation any more. So I'm not seeing a need to explicitly test the 
>> integer size when the value check covers that.
>
> Hmm I was thinking if the internal conversion in the GuC fw changes so 
> that GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS goes above u32, then to be 
> extra safe by documenting in code there is the additional limit of the 
> data structure field. Say the field was changed to take some unit 
> larger than a millisecond. Then the check against the GuC MAX limit 
> define would not be enough, unless that would account both for 
> internal implementation and u32 in the protocol. Maybe that is 
> overdefensive but I don't see that it harms. 50-50, but it's do it 
> once and forget so I'd do it.
Huh?

How can the limit be greater than a u32 if the interface only takes a 
u32? By definition the limit would be clamped to u32 size.

If you mean that the GuC policy is in different units and those units 
might not overflow but ms units do, then actually that is already the 
case. The GuC works in us not ms. That's part of why the wrap around is 
so low, we have to multiply by 1000 before sending to GuC. However, that 
is actually irrelevant because the comparison is being done on the i915 
side in i915's units. We have to scale the GuC limit to match what i915 
is using. And the i915 side is u64 so if the scaling to i915 numbers 
overflows a u32 then who cares because that comparison can be done at 64 
bits wide.

If the units change then that is a backwards breaking API change that 
will require a manual driver code update. You can't just recompile with 
a new header and magically get an ms to us or ms to s conversion in your 
a = b assignment. The code will need to be changed to do the new unit 
conversion (note we already convert from ms to us, the GuC API is all 
expressed in us). And that code change will mean having to revisit any 
and all scaling, type conversions, etc. I.e. any pre-existing checks 
will not necessarily be valid and will need to be re-visted anyway. But 
as above, any scaling to GuC units has to be incorporated into the limit 
already because otherwise the limit would not fit in the GuC's own API.

John.

>
>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 15 +++++++++++++++
>>>>>>>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 14 ++++++++++++++
>>>>>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++++++++
>>>>>>>>   3 files changed, 38 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>>>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>> index e53008b4dd05..2a1e9f36e6f5 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>>>>>>> @@ -389,6 +389,21 @@ static int intel_engine_setup(struct 
>>>>>>>> intel_gt *gt, enum intel_engine_id id,
>>>>>>>>       if (GRAPHICS_VER(i915) == 12 && engine->class == 
>>>>>>>> RENDER_CLASS)
>>>>>>>>           engine->props.preempt_timeout_ms = 0;
>>>>>>>>   +    /* Cap timeouts to prevent overflow inside GuC */
>>>>>>>> +    if (intel_guc_submission_is_wanted(&gt->uc.guc)) {
>>>>>>>> +        if (engine->props.timeslice_duration_ms > 
>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS) {
>>>>>>>
>>>>>>> Hm "wanted".. There's been too much back and forth on the GuC 
>>>>>>> load options over the years to keep track.. 
>>>>>>> intel_engine_uses_guc work sounds like would work and read nicer.
>>>>>> I'm not adding a new feature check here. I'm just using the 
>>>>>> existing one. If we want to rename it yet again then that would 
>>>>>> be a different patch set.
>>>>>
>>>>> $ grep intel_engine_uses_guc . -rl
>>>>> ./i915_perf.c
>>>>> ./i915_request.c
>>>>> ./selftests/intel_scheduler_helpers.c
>>>>> ./gem/i915_gem_context.c
>>>>> ./gt/intel_context.c
>>>>> ./gt/intel_engine.h
>>>>> ./gt/intel_engine_cs.c
>>>>> ./gt/intel_engine_heartbeat.c
>>>>> ./gt/intel_engine_pm.c
>>>>> ./gt/intel_reset.c
>>>>> ./gt/intel_lrc.c
>>>>> ./gt/selftest_context.c
>>>>> ./gt/selftest_engine_pm.c
>>>>> ./gt/selftest_hangcheck.c
>>>>> ./gt/selftest_mocs.c
>>>>> ./gt/selftest_workarounds.c
>>>>>
>>>>> Sounds better to me than intel_guc_submission_is_wanted. What does 
>>>>> the reader know whether "is wanted" translates to "is actually 
>>>>> used". Shrug on "is wanted".
>>>> Yes, but isn't '_uses' the one that hits a BUG_ON if you call it 
>>>> too early in the boot up sequence? I never understood why that was 
>>>> necessary or why we need so many different ways to ask the same 
>>>> question. But this version already exists and definitely works 
>>>> without hitting any explosions.
>>>
>>> No idea if it causes a bug on, doesn't in the helper itself so maybe 
>>> you are saying it is called too early? Might be.. I think over time 
>>> the nice idea we had that "setup" and "init" phases of engine setup 
>>> clearly separated got destroyed a bit. There would always be an 
>>> option to move this clamping in a later phase, once the submission 
>>> method is known. One could argue that if the submission method is 
>>> not yet known at this point, it is even wrong to clamp based on 
>>> something which will only be decided later. Because:
>>>
>>> int intel_engines_init(struct intel_gt *gt)
>>> {
>>>     int (*setup)(struct intel_engine_cs *engine);
>>>     struct intel_engine_cs *engine;
>>>     enum intel_engine_id id;
>>>     int err;
>>>
>>>     if (intel_uc_uses_guc_submission(&gt->uc)) {
>>>         gt->submission_method = INTEL_SUBMISSION_GUC;
>>>
>>> So this uses "uses", not "wanted". Presumably the point for having 
>>> "wanted" and "uses" is that they can disagree, in which case if you 
>>> clamp early based on "wanted" that suggests it could be wrong.
>>
>> Okay, looks like I was getting confused with intel_guc_is_used(). 
>> That one blows up if called too early.
>>
>> I'll change it to _uses_ and repost, then.
>
> Check that it isn't called too early, before gt->submission_setup is set.
Obviously it is because it blew up. But I am not re-writing the driver 
start up sequence just to use the word 'use' instead of 'want'.

>
>>
>>>
>>>>>>> And limit to class instead of applying to all engines looks like 
>>>>>>> a miss.
>>>>>> As per follow up email, the class limit is not applied here.
>>>>>>
>>>>>>>
>>>>>>>> + drm_info(&engine->i915->drm, "Warning, clamping timeslice 
>>>>>>>> duration to %d to prevent possibly overflow\n",
>>>>>>>> +                 GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>>>>>>>> +            engine->props.timeslice_duration_ms = 
>>>>>>>> GUC_POLICY_MAX_EXEC_QUANTUM_MS;
>>>>>>>
>>>>>>> I am not sure logging such message during driver load is useful. 
>>>>>>> Sounds more like a confused driver which starts with one value 
>>>>>>> and then overrides itself. I'd just silently set the value 
>>>>>>> appropriate for the active backend. Preemption timeout kconfig 
>>>>>>> text already documents the fact timeouts can get overriden at 
>>>>>>> runtime depending on platform+engine. So maybe just add same 
>>>>>>> text to timeslice kconfig.
>>>>>> The point is to make people aware if they compile with 
>>>>>> unsupported config options. As far as I know, there is no way to 
>>>>>> apply range checking or other limits to config defines. Which 
>>>>>> means that a user would silently get unwanted behaviour. That 
>>>>>> seems like a bad thing to me. If the driver is confused because 
>>>>>> the user built it in a confused manner then we should let them know.
>>>>>
>>>>> Okay, but I think make it notice low level.
>>>>>
>>>>> Also consider in patch 3/3 when you triple it, and then clamp back 
>>>>> down here. That's even more confused state since tripling gets 
>>>>> nerfed. I think that's also an argument to always account preempt 
>>>>> timeout in heartbeat interval calculation. Haven't got to your 
>>>>> reply on 2/3 yet though..
>>>> That sounds like even more reason to make sure the warning gets 
>>>> seen. The more complex the system and the more chances there are to 
>>>> get it wrong, the more important it is to have a nice easy to see 
>>>> and understand notification that it did go wrong.
>>>
>>> I did not disagree, just said make it notice, one level higher than 
>>> info! :)
>> But then it won't appear unless you have explicitly said an elevated 
>> debug level. Whereas info appears in dmesg by default (but is still 
>> not classed as an error by CI and such).
>
> Notice is higher than info! :) If info appears by default so does 
> notice, warning, err, etc...
Doh! I could have sworn those were the other way around.

Okay. Will update to use notice :).

>
> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken 
> immediately */
> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant 
> condition */
> #define KERN_INFO       KERN_SOH "6"    /* informational */
> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
>
>>> But also think how, if we agree to go with tripling, that you'd have 
>>> to consider that in the sysfs store when hearbeat timeout is 
>>> written, to consider whether or not to triple and error out if 
>>> preemption timeout is over limit.
>> I see this as just setting the default values. If an end user is 
>> explicitly overriding the defaults then we should obey what they have 
>> requested. If they are changing the heartbeat interval then they can 
>> also change the pre-emption timeout appropriately.
>
> Question is can they unknowingly and without any feedback configure a 
> much worse state than they expect? Like when they set heartbeats up to 
> some value, everything is configured as you intended - but if you go 
> over a certain hidden limit the overall scheme degrades in some way. 
> What is the failure mode here if you silently let them do that?
You can always configure things to be worse than expected. If you don't 
understand what you are doing then any control can make things worse 
instead of better. The assumption is that if a user is savvy enough to 
be writing to sysfs overrides of kernel parameters then they know what 
those parameters are and what their implications are. If they want to 
set a very short heartbeat with a very long pre-emption timeout then its 
their problem if they hit frequent TDRs. Conversely, if they want to set 
a very long heartbeat with a very short pre-emption timeout then its 
still their problem if they hit frequent TDRs.

But if the user explicitly requests a heartbeat period of 3s and a 
pre-emption timeout of 2s and the i915 arbitrarily splats their 2s and 
makes it 9s then that is wrong.

We should give the driver defaults that work for the majority of users 
and then let the minority specify exactly what they need.

And there is no silent or hidden limit. If the user specifies a value 
too large then they will get -EINVAL. Nothing hidden or silent about 
that. Any other values are legal and the behaviour will be whatever has 
been requested.

John.


>
> Regards,
>
> Tvrtko

