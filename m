Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458A7470FFA
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D05510E69C;
	Sat, 11 Dec 2021 01:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8495E10E69C;
 Sat, 11 Dec 2021 01:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639187112; x=1670723112;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PhjKveHYXgzHegYYKGB+2D+aF9kPvJtVJfycLfIagtA=;
 b=moFPUe36BADjMc2zrqo64TkNWITI6dvwKxlnUyUmq6WOAcypJkH0Hdt5
 9xubUlz7Me7ZgfVNc94kuVJDjtWrscUEiqYIsQTUbbUYdbZtvSAJcrl7I
 6pSyxsCYoXaa+1PQzypDt/ATgmemi/5wbYuoxJVp6RXZ2eAKSOP4n8h9z
 ycRcCu913MqjZBCvuu5bBByqm9KEqdRvi0HWWnjvdM6TlqubB7eYfnsjv
 0rz6rY8YtN3JAABSL4I6MtbrBc/rhuXpk4aMJiVo9xl0m/Pgafq0a7zDh
 6U7qLVvBFC8qTJPqx77KIs0+I3hOMK3zDDx+KYOE1KXkQj80qt0ETIM2V g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="324763258"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="324763258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:45:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463903341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 17:45:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 10 Dec 2021 17:45:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 10 Dec 2021 17:45:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 10 Dec 2021 17:45:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfe6Hoo/eEUtWP8XDS/cI68QiDMNuJvT8m5HLFMnLv0Ve1SN+KoNDaLihzRu9VibhUiiDwhurQ0TwivMV3ppZzUBwARYDsPvoELqm0JI9X0FY/XHTDhk4oCcw2ImFs/DorT796obHAP6GBKzvMHWlBlHOdVCBUZUzLV5DkbzR9YbpVCPpRtcWcFJIhkd2z3lYCNzlIocinR6cc+HXWVVnuqD3T6eAsJk3o03A5EFjNgV9+vgIa0wvdOmqpLKDPLFK591mbqS5BbWzhObb8092HX/mORb4m4V676Y1vMpc0rYHrkIpzfyMDYNmQYLJbLDwfR3trX6fkxDjmAEzKJNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK6RIMVhqfr3A+P86I4IyNZBKe5xHVD4bQcEypdcJy4=;
 b=ZZ1IucW5xPtEVKBdexxisXsbtZgOjV4iT9bm/5L2VYnScIApnFDOatnHGkQHYM6pzPMXdaYAHgq51WOY23YGPKlCfWPNSedW0Sd0G1omsl1uRGGWGGrzjsuChfFFczYsr58giOVYNdm3e4cb+j7yf/ewZcqOr3Jw+5gdYfGOzx/e6HySUaoLaJSc6rkqe+jZ18k5PXr/+dp81mm1fcHue0oJOeECX622lW2I7/y9izwwwT0gTTra4IzX0gjfrQNqhRr/hjPlu/i0d/5nU8+jrYuZnhtrOc2ULRWOVDtzTOuawCmhD3EEaAT/j7OQqAieMnM3Lf3vBpVFPCZMbgR+WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK6RIMVhqfr3A+P86I4IyNZBKe5xHVD4bQcEypdcJy4=;
 b=dasAWekngOBkF9EunOdynmKAmy8bV+xOtbk3VhVwwvrdlRR1HQKtN7NDEw/ClWQqj4Sgcujzo9Yz+JjBg7ypeqIrosoplIm0puW6+Yqn7o6zcH5mAGfWVVnfDRAmvwBNrBURokZvI7M3h905eFLlyMl1pcMCK9GWm/YoOcV1IRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by BN6PR11MB2034.namprd11.prod.outlook.com (2603:10b6:404:43::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Sat, 11 Dec
 2021 01:45:09 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::81a3:50a8:5c1f:f754%5]) with mapi id 15.20.4755.022; Sat, 11 Dec 2021
 01:45:09 +0000
Message-ID: <f9938176-8f9c-cdd5-93ad-15046bc95703@intel.com>
Date: Fri, 10 Dec 2021 17:45:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/guc: Add extra debug on CT
 deadlock
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211211005612.8575-1-matthew.brost@intel.com>
 <20211211005612.8575-6-matthew.brost@intel.com>
 <57f7200d-1ebc-2a20-513e-3822e5bb5963@intel.com>
In-Reply-To: <57f7200d-1ebc-2a20-513e-3822e5bb5963@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0327.namprd04.prod.outlook.com
 (2603:10b6:303:82::32) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0327.namprd04.prod.outlook.com (2603:10b6:303:82::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 11 Dec 2021 01:45:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73bce1c7-bf6a-47d1-8af9-08d9bc47dd20
X-MS-TrafficTypeDiagnostic: BN6PR11MB2034:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB20346075A4067E61E816DE61BD729@BN6PR11MB2034.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V7aj8A3AxXqt+s1UyS4AQofgguwoDR6n0b/rj7o0Wr/S94o04yhdLItVET9xmBO3WzzrSx8sDVKk6Vonjlrz1jUbQDTMkoNraIw9r61HuWnMVdGF3mT5jCCm+7Cknd6EsMzI0lzAp09TifGWrYSa4aOxO8H00EzNhk1ECNkfuEKbwjlnzrz217gb2u8R4I3nd/vVHcn962Jgx49n7+uwG/fkB84L3vyOIN0Ngf5Pkgzqsf5wdvJI/xdBOlM4vv0uTcvJwETT3JffHNhxmpeDnwvHSoFYsTzQXjM6C168lgmGhZl6IXnhp7wnbnQOSr/EHh7c/ODb5RsGpYyCHgtKiAYBmruPfd658wNjmfO9UW/Rx96UQGJI0cREBIb4hdvhT/RHZGM1mEEfomHu3nxNciAo3qHMYmK12Wy9P9zaV5xwZqWt5QGfQm8uQPmgDyCyhwf/y6OUNxzvwruXSGGIEK19Xl6mQsGXIvlTcRf5vc9K77Z9ubiEd+Gj1kaw6sCBw7pHFsHAz6CBBT+0WjBYc8TqZMzuSdBO3K9YOqbTjEppVY/lWtpjwPEXsMnOQDZnCsI0/0+YNlckxRepD6tTVFscxmnrir2o95bvd52EpwLQWgoWeYn6eUP6mZsI1va8fEhwnFEQesXA1G95zjRxuYLzQD22O/yhokuD3GAmGT+zEx1TwAIOI6pyY21aKq1aWXpClCGR7LHMv/msXQ6kqPSOqggSs05gEL3j9CRwXJ/WaqN7kYmgsYFDovGdoYEb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6486002)(31696002)(66556008)(83380400001)(66476007)(66946007)(508600001)(26005)(2616005)(186003)(956004)(31686004)(8936002)(8676002)(2906002)(316002)(82960400001)(6666004)(38100700002)(36756003)(450100002)(53546011)(5660300002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGJuZndOWUxBNElyeVA4bmhTVm8weVhWZWhVNzl5SDdOcjlqc1VMREM2S3Zq?=
 =?utf-8?B?TENKaFd3cW5jak1wMEw4YnFWN3Q4Y3FZalg1cTdBa204NEl0dXJzZlJUN1Fx?=
 =?utf-8?B?KzdLNDZYZmczdGpROFFwcms2V3paM0hsTlFDTisrVWVDSVpVbVVjVEZQQjJM?=
 =?utf-8?B?cnM1bFhXOXB2MGRmN0JSUHlRaVZOc0plWEgrSTlIQm9NbmhzaE1EaXp1Z1RB?=
 =?utf-8?B?WVJOOXErVHFFY28xZjRKL2QvbmNjQUI0bzBQaS8reDZRVHQ1SGR3eTdoOUtC?=
 =?utf-8?B?dXVHdXY2aUhhejFmUXRxbElJbWFWN2Z0SW5VUnN3SEFmbTlRUnJoWEU4bnpY?=
 =?utf-8?B?MGNtVzZISTlVc0JDQmhiVHg4L3BKQ0k2K1lYcmVyWUhDU3RneS84eVR3ZGdr?=
 =?utf-8?B?UXUrNDhiWnl3eXNMSlUzcjhvS0dsWGRXTXNaUFIzejUzT2E5MVZoWklTa0FI?=
 =?utf-8?B?LzRJYU01b0NJay9LdU9XaHhWN2dseDE4d0FPZ0hlelVJRE8wVlNwbDNaeVFy?=
 =?utf-8?B?Z21reWg4ZWdCSUxMRjdXcG01bk1tOGtJZmx3aXNiNXNRei91b3pRancrdFdE?=
 =?utf-8?B?QUNGbFJyYUt1MTJWc21UTVpIb1piLzNJR0ZQVXp3ZGZ1ektISWhaekh4Wmtl?=
 =?utf-8?B?dVJ5UnBLbnRKWE1VQ0lWMjNuVE8wVVB5UmswMEtaWUs3citYTWZBVWdvQ01t?=
 =?utf-8?B?czkyeGpOVzhIT2ZTWVhhUFlXeDR5WWF1VmxNZjBpMjIzMDdrUTFwQWhiWXZC?=
 =?utf-8?B?QXd6QmZaZkdtRVZpcG5tcVFRdzUvNlRBTzViLytsMElIMnRqd3FoSGhNUmVH?=
 =?utf-8?B?aXJqR1lnRjNtZTZGWmRDU2FseGpWd1hBMk1samw5TUpsQzZ2Sm4yaSsxTTda?=
 =?utf-8?B?OUYyN2xqSHZMaDdLZVJWYjNPMHZkSEJlelRJZW8rcVp2UytlMXpDOFpmaVE1?=
 =?utf-8?B?ejRwcXNBYVNsaklEZFgrN2NzbDc0cDFiOHZBKzd0WEsvQUo2WjN5NFRIV21s?=
 =?utf-8?B?R1FSMFZBcSt0cDNrU3pQQlI1YXBQc1FaT2tFbVV6aGxHb2JieDVzRzE5OGtv?=
 =?utf-8?B?S2hNdkMxV0tkdHVCNTUxRmdKTm8xbDVaQXBuSHROclJiNnlFVEhERXh5OHhm?=
 =?utf-8?B?RnBobGV2UlpRY0g1OFl4dWk5ZlJLZEp2elM0QWMzdk1sU3NhenJwUU0yQ1RK?=
 =?utf-8?B?SFRHY0NPV3M1a0ZVWVFBM0x1K1FuMjRCOTZsRjNJcXBraHVhNWhBMzI2bk1U?=
 =?utf-8?B?TDhHeEI5UG5ydUw2bzF3RmhNVVlqWDZ0L3FwQ3A2UHdQVk9lYmNrY3ZvOTZ6?=
 =?utf-8?B?SGJtSWhDQzNhb3JkWW1OQ3pJczZGc0kwYTdGQkpESHREOEtDQ2lZRGNyeExn?=
 =?utf-8?B?ZDlwS2wwZDJzNzlRdWJFRXJmL0RDUnhNenhmZHZwQjd4eDlQdVBiSnVTWGdz?=
 =?utf-8?B?cW9EN21wcStqV0pMZ3Z6NXBWVE9YNmlJd2FTQm44N0s4aGhBbmhVTEsxbWJa?=
 =?utf-8?B?T1k4SjVPZGdMQm0rUEpqbWxwcEhBdTkrTnRaamtmb2NwQlJWYTdvS3k3bkUy?=
 =?utf-8?B?aDlEbzNUOU0yZEZ5RWExUkZURXBSUm5FLzNTR3UvYjdrYjV5ZDRobHplMUxI?=
 =?utf-8?B?TTNGSVFuM1FGTUxGY0NJa1lkRmh0Z0UvUjBYeUp3aHV6UlprOGhSNHIyNDFn?=
 =?utf-8?B?c0VDaVltVktNNFluT2ZsY3BzRXJZeXVTaXdrbXpMbUdPQUNianV1cm96Smds?=
 =?utf-8?B?bnl6eEEvUzZMWDRVUFF0OTZBYTFUblo0TzJkcGdVeS9Ec043c3llKy9hNmh0?=
 =?utf-8?B?S2NPUUF6SXc4TkNra3cxNm5yZWs0QkdGQkxvK0V1VGdJa0hnWmxZK0RZdXgz?=
 =?utf-8?B?cXpVdlVRQ3lpVmYyNzRpdW9uMi9LTjVWZUxxbHM0ajdHOEJGOFphQXdzK3Zh?=
 =?utf-8?B?cUxPTW9HMFMxSndrZjBLU21zTUk0QTQ4RnE0a0gyR0MrV3hFRHhuV2FLSFhS?=
 =?utf-8?B?QzVMOXg3VGJUY0kyek9VR1V0d2IzbDkrQUpva1FxdDl0TkMxS1l4V2FwdUpM?=
 =?utf-8?B?NzRVbDhpMk40RHpWaXYrRWpTMkNvdEdHUXhqZzB6UzJpVmR4YjlzSkU5NmI2?=
 =?utf-8?B?Rit5c3BNZENZNWFXaC82K2NsQTFsYnBKWEw3L1BOZmVMamJiV1R1bkIvZXhv?=
 =?utf-8?B?SldyOGhDQ1ltc05FdFZoYjJOeUhTUlFQQ1F4SVBKbHRzSjh1eGkxVzIrTnQ1?=
 =?utf-8?Q?V0oH0qKzoVDdSRqKq97/bpB3awx6mtefN1+7ZoNpDs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bce1c7-bf6a-47d1-8af9-08d9bc47dd20
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2021 01:45:09.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QA3ZyNf1z6HWLpjhLRvnexWcPCA5+1eoLVgyjl/23sm1VG5XgavuvI+FzTyBLl/AVJ/8H+fPX+LGute9qItBrq58kkN8/dxe3h34bcSbjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2034
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

On 12/10/2021 17:43, John Harrison wrote:
> On 12/10/2021 16:56, Matthew Brost wrote:
>> Print CT state (H2G + G2H head / tail pointers, credits) on CT
>> deadlock.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index a0cc34be7b56..ee5525c6f79b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -523,6 +523,15 @@ static inline bool ct_deadlocked(struct 
>> intel_guc_ct *ct)
>>           CT_ERROR(ct, "Communication stalled for %lld ms, desc 
>> status=%#x,%#x\n",
>>                ktime_ms_delta(ktime_get(), ct->stall_time),
>>                send->status, recv->status);
>> +        CT_ERROR(ct, "H2G Space: %u\n",
>> +             atomic_read(&ct->ctbs.send.space) * 4);
>> +        CT_ERROR(ct, "Head: %u\n", ct->ctbs.send.desc->head);
>> +        CT_ERROR(ct, "Tail: %u\n", ct->ctbs.send.desc->tail);
Actually, aren't these offsets in dwords? So, scaling the dword space to 
bytes but leaving this as dwords would produce a confusing numbers.

John.

>> +        CT_ERROR(ct, "G2H Space: %u\n",
>> +             atomic_read(&ct->ctbs.recv.space) * 4);
>> +        CT_ERROR(ct, "Head: %u\n", ct->ctbs.recv.desc->head);
>> +        CT_ERROR(ct, "Tail: %u\n", ct->ctbs.recv.desc->tail);
>> +
>>           ct->ctbs.send.broken = true;
>>       }
>

