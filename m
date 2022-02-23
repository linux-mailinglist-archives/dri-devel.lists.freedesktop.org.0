Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A8A4C0994
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 03:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEEF610E35A;
	Wed, 23 Feb 2022 02:45:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07DA10E35A;
 Wed, 23 Feb 2022 02:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645584318; x=1677120318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cExOpLNBd8nEjdJQw2GhRQp91Co3UVM47TjY5YX9xzE=;
 b=WKVIGDA0Z8veRgA/VNRwzkXmKL05ly16TCB5g7W6bqr4JUHIYUX6Lyr1
 fda7c9r+/SZcVoDUq3cDqr5DqCZU4bI1rg2HWcc3sKnAvRzDcWt4L5beZ
 VxLSglOme+a8RH/5eRVia7IQcFG0kfrCRmuHpa41pq6GKPbS+7X2dxl/z
 ziauCV4qPwuRBe4RBNxOUuMA1IKFrP4NRRWZRVcVPKcGHyy25xkTNBcy8
 0IzYzqybew3Z70KEsHsSwV0Q6FNfX6WUsjF9jZBVOKDgQlY0Mr/uc9hO4
 gUVCuBmNnXL6rLCp3vIAm0EUrDPeTnYc8aiLfPfkyskGtOR6mauIdGztW w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249451453"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="249451453"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 18:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="543167396"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2022 18:45:18 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 18:45:17 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 18:45:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 18:45:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 18:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyCY0mNa0mMnyFKpCc+6syOPKNid6yqk+2r9spTL5eG5R9gJGxwY7Darw8uMUyKOOmROW/WkbnDt0dfzZEqSN7IQMVIIvvruzMoKYPe0ufV2///Yuw67X9JI1kheXd+9XsQmwhszACa2CCyFe4rCwQ2/PHMEEtv1g/e5mDDh2FJ5j3wMaS1OZqWFb35rq5I+Si0PXs+j0meqt8xCyS96F1GeCU3AGFF54IpUlr3r+5G8oKcqRpDUlhjLaev7cIp9IrBxCAuW7lW7silVlCbVyl2bV0S557EIDfwcE8S3NRRI0QkL00479cBBC8twHQtzsIWnTxCQSG+psQ4D1PtSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNieQE/utH6AWQsJYTVHor7E/lmnrZX1d3OCXMH0NQg=;
 b=Lo/6F7jopxQaQVj83UXD2icJuRxNSfCB/ExP9rBOEAf1eGX8DRIZalqphctn6kHuOO1EDq+1S2/Bcpgf//mhKX9bTo++/W+Ca8KqsG9JN2WAOVLOhGP7yk5iYamS9JLxzINsR/LzMciBjS2A+UsMgHL2iPjSjuzxhnEUllefyGQNUVwCVlEuzhRjZkyNILw9tCOtiKYtXqS+L/zZ6Y9s4wOGFA/D1z+qpLI5OS2x/ba4NKAdBn74DcTsD1BHaA0V5Pixeyk46b2sfurFuKQG8a0WTwFpnWGUcvQPYIYIi1doQmxj4KtqPYszDiwtT84hYbWbUnBnNKtmbBK0/3xFWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (10.255.162.93) by
 DM4PR11MB5312.namprd11.prod.outlook.com (13.101.57.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.23; Wed, 23 Feb 2022 02:45:15 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 02:45:15 +0000
Message-ID: <e95e8710-8410-2869-dec1-7f7a9e9a74fb@intel.com>
Date: Tue, 22 Feb 2022 18:45:12 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/gt: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220218213307.1338478-1-John.C.Harrison@Intel.com>
 <20220218213307.1338478-3-John.C.Harrison@Intel.com>
 <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <2a486991-1bfd-9b23-0b43-9173d17b7e13@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR04CA0154.namprd04.prod.outlook.com (2603:10b6:104::32)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a541969-a651-492f-80bc-08d9f6768512
X-MS-TrafficTypeDiagnostic: DM4PR11MB5312:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB5312181743FF2285413E5CD8BD3C9@DM4PR11MB5312.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUfKyF3tQXNrwxTEpbFZY6xQQhyNKxmvgZKLAbZi7Apn200OJqSW3q9m5B+0Raa/VXs9Key11ea487ljtSVYtnYfbFPkT0jMiMFHFavOm9i2fS9zyYFA85XD9jLITJM1KuvTR6JQLi9uQPbcYikLxGcYZKY/bvUILt0yTP75Euw5wwdbm/Tn7V465N1TWHqRg+oFXb2UOf3Nl6uwPWuWpqvIC+sE2Gc4j9WKBrF7jF2rgbL20+3GbKfDABMsA3x9DLGCtjLMBsbSL6yfCP37hO09LlftL3Wky05em3aY1mHijGRqqBGDXHLXUyub6sLIT9YSrgjAcfPwV2Dioz53r7+B7xai6nzduUOKR5xtFBroOCUiq/L11ofJXkjpLUcLjYkHG847v6dpDM3YOfef8BzcXZpCJTplQOR+wVSaQRtw9RZStpXms5eRxdyL25qByH8lHR4wfRPgfGBKqDNXA4MlcCANYg1ps3t4W71DtoNzlCNGwLuKJMDOQVVwgWgp6vKv5dvFKj9ZVH3QME93D/ltwFgZ6yoTXFSJLC4VA7DTaVYjCPeJXmnJtXbEIKh/tYTRXnsMHTjxIKeqkmyR1vdzFy2oe+d9KojXBcXfIOfwP5Y7S75Zb8RyZeCRYfLKxvnL0Hl45/Qa4lFF6klxKun31E+aWZcvZyAPtiAq+GPJDZTPdf8NRBWPhjCtwIwIiBjAFRBtyXoJ3kcaZZiLGuzngnP5VZBMxeu2GKp4xGAIB7K+L+NtecsY+hYmd4Hq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(38100700002)(83380400001)(36756003)(5660300002)(2906002)(8936002)(31686004)(6506007)(2616005)(53546011)(6486002)(186003)(26005)(6512007)(66946007)(66556008)(82960400001)(66476007)(31696002)(6666004)(86362001)(8676002)(508600001)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpQaDFhVTZjWWt2TTFUNThxejFkQStIUzY4RWYvcnQ3VjFSbFZQZ2p3ZXFv?=
 =?utf-8?B?bFBMcVI2SHhkOGNjemcwcENOazdhZGRhaTE2REthTVNHQmFJR0QrclMrcnh3?=
 =?utf-8?B?MUVTYXlzOTFzbURBK2NzRVdHV0lCRmoyL04rVkYzc0tNS3krN01yeHVRbzZG?=
 =?utf-8?B?elNJL3dwQ0lyL0V5ZFl4cURidlhHMkFnUTBJUzVZSlZkWHdSMXRxMXRMY3Vi?=
 =?utf-8?B?QTlSc0tlRXlFVjc5UjdhUm8vUFkyMGIzN2FJTUwwWXkzSVErdmN1VXYwNUQ5?=
 =?utf-8?B?STRCTm9Ca3pmWm1uUkpFbnN4WkR6aS9JNVBTWVZWNzNXc2h2aERBbFNhZzAy?=
 =?utf-8?B?QmxPSWtoWEdMTUdGQVRIbjBmM2JuWHZwYzNWWmRBSUc0Qmx1dHRCVGY5RWoy?=
 =?utf-8?B?VUxnREY5SFZ5bkVENTRwclBxMFRpRmtLYVM3UnU3a2hERVVDN0MrcDY0TVJT?=
 =?utf-8?B?WHFMRW9ldS92TFNvSC9GSzBLT2owa3dibDgwdHZEclE3UWJ2djVuNXBhRjN4?=
 =?utf-8?B?UW9vdEJVa0N6VERsUDZ3eTVkcmc1TzR2bXNjajVSbnFsNkJRT1R4TWZrdkM3?=
 =?utf-8?B?TFVDZitsTGc2U0JZVC8zU3dQUWV0SEdvVFQ1cndMUkpDUVlxZDlyMkMrcFFi?=
 =?utf-8?B?UlduQlB2czhCZkU0UXNXeGNYK2NIeHpMazdYUENCUVhoYndveVFTYS9vbHlM?=
 =?utf-8?B?WHMrRFN6SVhnTUdGN3BEUXdSTTVYWUFHY0JKeHExbWg0V0o5UW5VY1RPZTFr?=
 =?utf-8?B?NFBoaWlONG5CVVl4eXRDTmFzU0lxS2xUcGhOVG40WWdqbCszQWxlUXY5RFp3?=
 =?utf-8?B?alVEMEZtdWRKSms1RVRqOGdxdWw3UXBSazJtYzlHVVd5a0g0d0lRQXpkallW?=
 =?utf-8?B?aUNxNjlUNGZ4QnE5eDZsVUJROW1USnZiZ0MzZTFUa3E3T0VzOGZCSFZoeVpM?=
 =?utf-8?B?Vlp1YlpVazEvelAvZ0plQStpbVNCalkzVU1mbkQzaXJwbUVaSURtQlplcGdh?=
 =?utf-8?B?ajJDdks2UjI4WFBhRTR3VGpESDBIaXc4UkhVbVN6UStFZzFpVTJBa1hqemU2?=
 =?utf-8?B?ekExMWJsWldhTmQrZ1I3bEUwV2ZkWWRVeWpTR01uL1ZVZkgvTGpIUE5pUGVF?=
 =?utf-8?B?WVNtYzVjNnFOeHNWYTY2eWZSTDJyTWdNbC8rNk9DQjMzbUU2QWtGMHlKQm1B?=
 =?utf-8?B?MzRtb0p3R1lqRm9VTlRyS293ZGx5dEpsTk11Qk45cEs5a1JYSjEvV3dHSDZU?=
 =?utf-8?B?enBBeEp0ejZSby9GQm5tS3RXK3VpRjlHWjdFa3ErR2R4R2dsNDNsMXB6U00y?=
 =?utf-8?B?N1BseElyc3Jwek5CL0lweVpzMnhzOGdlV2podjJxenZ3WDh5c01wTGN2ajVo?=
 =?utf-8?B?MVBVdkxPcFFEY2RQWi9FazRQVVhTRG1wakN1YXFUWTRWVCtUbUZScUVRSFZi?=
 =?utf-8?B?Y2VOOU5GK0JDVUlwKzRFeFRiNnZDdDNoWUE5ekNvQ0FSd2RML2s5SjNhY2N6?=
 =?utf-8?B?TU84b3owcENQYXFIUE9QeWVtVjBTcTRjNS85OVg1RjZ2QzJEVHdJcWZQTlZE?=
 =?utf-8?B?MEZZa1BWV3RIOW5LTGg2NmlxOHZBc25IOUMrUWFZWmhIQnFyd3B3TEs5YjFF?=
 =?utf-8?B?R0ZFeWJYRE1vQUNaWVlsUGpuTDdLcXp5M3lvUmNkNG5ibjRueDltaENkSFp2?=
 =?utf-8?B?U0FDclVtdk1BeVhPTEhTYStOalphT09PeGNqekNCRGl3UnlETkFvenRIVjJK?=
 =?utf-8?B?L2sxYm9UcEpXUExYb0Y0cnJJTVBhSW9xNjdIM0hrU1l0YkUvdXNHRzJrTWNP?=
 =?utf-8?B?TzE4aXRUTnc0ZzhZWG1WOEw5UzFtTHNvY0dUZi9zZGRsYVMzeHRuSzRKaE9G?=
 =?utf-8?B?R3NPSnVtem00WTJLVUdKTVBvZDBQSlNoaHR0b0NaQU1JOStnVGdIVEZRS2tQ?=
 =?utf-8?B?aTRnOVg5MFVCQ0J4VjZVQUxuMzlHTEN2aS9xWFdHOXMySEdRM2hzN3ZyRG1U?=
 =?utf-8?B?anFibjcvNWZwd2lXd1ZnWFh3ek1FMjNXL1N3UkpQMnI4eENZdUJJbThEQ2N4?=
 =?utf-8?B?VTRUcmFRdDF1SVFENFVDV1Nvcm9iOS94YStUUkR2cHZPMHpuODNLOWR5NDBi?=
 =?utf-8?B?RVdnbXJBWFhxZC9oSC95N25UL0JNNjJGYlhjTitnNVdMcDBqdTZCMklTQ096?=
 =?utf-8?B?RGlCdDB2TzhodXVTZklXMGUyaXRrVVhJZGdmWFhKZ0lPb2JqbXlZSTJYNFU5?=
 =?utf-8?Q?PawjiRemp46ysil0qNjQf1QsRoMnJnRRnld4xSu/tY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a541969-a651-492f-80bc-08d9f6768512
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 02:45:15.0198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1QQnaujxp8WcKF4RCknfi9yeR6vMJvRGvEfRF8+zh64AY/nMKj3siU8N/8RGVCREo5xWnTCZKalUydRU1BFSD4GJu3bfB6aKz5wx8BAlCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
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

On 2/22/2022 03:19, Tvrtko Ursulin wrote:
> On 18/02/2022 21:33, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Compute workloads are inherantly not pre-emptible for long periods on
>> current hardware. As a workaround for this, the pre-emption timeout
>> for compute capable engines was disabled. This is undesirable with GuC
>> submission as it prevents per engine reset of hung contexts. Hence the
>> next patch will re-enable the timeout but bumped up by an order of
>> magnititude.
>
> (Some typos above.)
I'm spotting 'inherently' but not anything else.

>
>> However, the heartbeat might not respect that. Depending upon current
>> activity, a pre-emption to the heartbeat pulse might not even be
>> attempted until the last heartbeat period. Which means that only one
>
> Might not be attempted, but could be if something is running with 
> lower priority. In which case I think special casing the last 
> heartbeat does not feel right because it can end up resetting the 
> engine before it was intended.
>
> Like if first heartbeat decides to preempt (the decision is backend 
> specific, could be same prio + timeslicing), and preempt timeout has 
> been set to heartbeat interval * 3, then 2nd heartbeat gets queued up, 
> then 3rd, and so reset is triggered even before the first preempt 
> timeout legitimately expires (or just as it is about to react).
>
> Instead, how about preempt timeout is always considered when 
> calculating when to emit the next heartbeat? End result would be 
> similar to your patch, in terms of avoiding the direct problem, 
> although hang detection would be overall longer (but more correct I 
> think).
>
> And it also means in the next patch you don't have to add coupling 
> between preempt timeout and heartbeat to intel_engine_setup. Instead 
> just some long preempt timeout would be needed. Granted, the 
> decoupling argument is not super strong since then the heartbeat code 
> has the coupling instead, but that still feels better to me. (Since we 
> can say heartbeats only make sense on loaded engines, and so things 
> like preempt timeout can legitimately be considered from there.)
>
> Incidentally, that would be similar to a patch which Chris had a year 
> ago 
> (https://patchwork.freedesktop.org/patch/419783/?series=86841&rev=1) 
> to fix some CI issue.
>
I'm not following your arguments.

Chris' patch is about not having two i915 based resets triggered 
concurrently - i915 based engine reset and i915 based GT reset. The 
purpose of this patch is to allow the GuC based engine reset to have a 
chance to occur before the i915 based GT reset kicks in.

It sounds like your argument above is about making the engine reset 
slower so that it doesn't happen before the appropriate heartbeat period 
for that potential reset scenario has expired. I don't see why that is 
at all necessary or useful.

If an early heartbeat period triggers an engine reset then the heartbeat 
pulse will go through. The heartbeat will thus see a happy system and 
not do anything further. If the given period does not trigger an engine 
reset but still does not get the pulse through (because the pulse is of 
too low a priority) then we move on to the next period and bump the 
priority. If the pre-emption has actually already been triggered anyway 
(and we are just waiting a while for it to timeout) then that's fine. 
The priority bump will have no effect because the context is already 
attempting to run. The heartbeat code doesn't care which priority level 
actually triggers the reset. It just cares whether or not the pulse 
finally makes it through. And the GuC doesn't care which heartbeat 
period the i915 is in. All it knows is that it has a request to schedule 
and whether the current context is pre-empting or not. So if period #1 
triggers the pre-emption but the timeout doesn't happen until period #3, 
who cares? The result is the same as if period #3 triggered the 
pre-emption and the timeout was shorter. The result being that the hung 
context is reset, the pulse makes it through and the heartbeat goes to 
sleep again.

The only period that really matters is the final one. At that point the 
pulse request is at highest priority and so must trigger a pre-emption 
request. We then need at least one full pre-emption period (plus some 
wiggle room for random delays in reset time, context switching, 
processing messages, etc.) to allow the GuC based timeout and reset to 
occur. Hence ensuring that the final heartbeat period is at least twice 
the pre-emption timeout (because 1.25 times is just messy when working 
with ints!).

That guarantees that GuC will get at least one complete opportunity to 
detect and recover the hang before i915 nukes the universe.

Whereas, bumping all heartbeat periods to be greater than the 
pre-emption timeout is wasteful and unnecessary. That leads to a total 
heartbeat time of about a minute. Which is a very long time to wait for 
a hang to be detected and recovered. Especially when the official limit 
on a context responding to an 'are you dead' query is only 7.5 seconds.



> On a related topic, if GuC engine resets stop working when preempt 
> timeout is set to zero - I think we need to somehow let the user know 
> if they try to tweak it via sysfs. Perhaps go as far as -EINVAL in GuC 
> mode, if i915.reset has not explicitly disabled engine resets.
Define 'stops working'. The definition of the sysfs interface is that a 
value of zero disables pre-emption. If you don't have pre-emption and 
your hang detection mechanism relies on pre-emption then you don't have 
a hang detection mechanism either. If the user really wants to allow 
their context to run forever and never be pre-empted then that means 
they also don't want it to be reset arbitrarily. Which means they would 
also be disabling the heartbeat timer as well. Indeed, this is what we 
advise compute customers to do. It is then up to the user themselves to 
spot a hang and to manually kill (Ctrl+C, kill ###, etc.) their task. 
Killing the CPU task will automatically clear up any GPU resources 
allocated to that task (excepting context persistence, which is a) 
broken and b) something we also tell compute customers to disable).

John.

>
> Regards,
>
> Tvrtko
>
>> period is granted for the pre-emption to occur. With the aforesaid
>> bump, the pre-emption timeout could be significantly larger than this
>> heartbeat period.
>>
>> So adjust the heartbeat code to take the pre-emption timeout into
>> account. When it reaches the final (high priority) period, it now
>> ensures the delay before hitting reset is bigger than the pre-emption
>> timeout.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> index a3698f611f45..72a82a6085e0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
>> @@ -22,9 +22,25 @@
>>     static bool next_heartbeat(struct intel_engine_cs *engine)
>>   {
>> +    struct i915_request *rq;
>>       long delay;
>>         delay = READ_ONCE(engine->props.heartbeat_interval_ms);
>> +
>> +    rq = engine->heartbeat.systole;
>> +    if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER) {
>> +        long longer;
>> +
>> +        /*
>> +         * The final try is at the highest priority possible. Up 
>> until now
>> +         * a pre-emption might not even have been attempted. So make 
>> sure
>> +         * this last attempt allows enough time for a pre-emption to 
>> occur.
>> +         */
>> +        longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
>> +        if (longer > delay)
>> +            delay = longer;
>> +    }
>> +
>>       if (!delay)
>>           return false;

