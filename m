Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166454E7AA9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 21:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA07D10E1AE;
	Fri, 25 Mar 2022 20:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6110E1AE;
 Fri, 25 Mar 2022 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648240454; x=1679776454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ntBaQcGK8XHNkr7KELztZ/UIhPeFociGXX7IPJCRabw=;
 b=E9gHHYJT2/WMjVXSsSj/dGjyJT+97m/eveL/mcbAn4+srS/YRgyS3T8b
 VnEV8roUb2Tsp3jbMi3R+o4yCTY5ZstYYjNXh7aL5uPDdMQbDo7iO6r05
 1m4HNhKnmYjOsGHqwR6zsyMW+EsEO7JHYznOhKq74vdqUoe7V5150cx7G
 a3RjF785LgXry6WJR6/47UeEkhseQsEVTWFbUZjQc9n0Ocfy0OsRZq/mj
 Bw+Cm41tjeO8XvEaW4U9HxtzUFjMw8xkfR+5PVo3JX2URqpQxy+vVb74E
 hPC2gAU59dFD/WLPGBB+Ga/F4aIhsItDKdXXOP/RIPwBxR44zzaGjKLqg w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="283592950"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="283592950"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="650364460"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2022 13:34:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 25 Mar 2022 13:34:04 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 25 Mar 2022 13:34:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 25 Mar 2022 13:34:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 25 Mar 2022 13:34:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIubO9s16B/SANbRvYw5Q+L/pHZJzx5LefGsXtdXiDknbEAmWgn+uQCCjup1ogz1HliE4xi7YPwpKGhpYVjVg1EiPv0ReQXcYhHsP9cYe24LBsCWwD9OAHRhsh7xpF5FSQVQL3CqKYbHilzxy9O/pkAveZ+Y+MSE1bpNDqvr34VUXz9dERIwzQaRuXEBmJnaaU7sHhN9u3Y3W5VaDt36JT/6EgI4VhQ//FY3woINaMJu78XTFoYli8YwJUsqcwwqx16WkBwCkpKEB5BNWNq698tHcGkty1654b6Cv5i3OVBQurZjRHyVYGalkuwZq3bMyTZDaJrwFBMFqVcuV4OqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqge8RC3pRiG0WjpsyiG1P+SLoZ3ELY8NnOPGyCGeEo=;
 b=SnFc15+fAPa/tK8RbtzcVmNnh8PfZLmd4Vzc454OJyXU2wZM1RR8+Hpjr01zZpZq5ZBgef1ZnTOMppJrISUC+9NjGpeN8rO7EJFegd/wD700S2xegSv3oQfIpofVyID9LFs+N5FmtOiWfn315P8jWcJQxKKqIWVsBp2/3f76c9YJ5s3SM/v2Qse0s7pJJ34oDYGLRuAu75xKeCyw7RD1GZPAshik9lGh7lDYm3RFUOF7xeNBc6Ra4np4GYD0ixr8NL7FOmTOjaibSU770f0YsQwcUPsnZZoXqNorgyblIo+2y4G6bb8bxpe5V/7ElUEwb4Jjd3JVLSazeVwYYFwE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BYAPR11MB2773.namprd11.prod.outlook.com (2603:10b6:a02:c6::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.16; Fri, 25 Mar 2022 20:34:02 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::a58a:5426:1c6b:6050]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::a58a:5426:1c6b:6050%5]) with mapi id 15.20.5102.020; Fri, 25 Mar 2022
 20:34:02 +0000
Message-ID: <eeeedf74-4793-8b83-dd81-cb2cc3c22ea1@intel.com>
Date: Fri, 25 Mar 2022 13:33:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix remaining_timeout in
 intel_gt_retire_requests_timeout
Content-Language: en-US
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220325175839.2717499-1-daniele.ceraolospurio@intel.com>
 <71bbc214-b3a0-d3ca-c3bc-fe6d0b8d162c@linux.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <71bbc214-b3a0-d3ca-c3bc-fe6d0b8d162c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5af0f9f-650a-486d-9e4f-08da0e9ecc1c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2773:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB2773C7113C51376974E59AB3F41A9@BYAPR11MB2773.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTemqz95+FOiDZYH2H9iR4EfrA+ZJQp1iF67rGjlKpDd/roWhac9mOHMZntHKwJMuNl5X9Eq6GOLB307MECaPsYa32Tw1mRpa5vITWmD1VpsFYXTZhG1KwBxc2P2wHBLL98Jy07qo1dHgCvSrzFZHsmU1czL8Rv42k2mW8qokyM8vup6Y6baiEqdtx45R4u1f219bAw9jZbleUHoKG+sekuPhbsRC4mgEFpFFH1Gw8f48CW+f5/83QD0wrtCIEbe8zYHdspiiYPr7xmNuiYYYxlcrU1WQyolFEZ0rQ9bcWiH5Em5yE5tH3kKDMpw87Dzer73SupMxG7gmS845pkj/zPRjLT66IIrs5HzEJCjx0VelzMFW5E1mlGWLgnLEBXp/53rzSC14ShgQ79aNRLG3qBHi7sticWBistnZr0nXq4mN47WW464h85/OpM9Opy5ezDas4xwh8qcka0AEGkrz0wbhtB7jGcRkF8ihQGrGHXSo6TkoroUNOzDpddRs3CEZ3D4wNU6Sx95XUJ8UxMvjoMXvvIeOItS17A89F8mSbhqH12IoFDxxKqRcKwPfgYiLVK3430eNcun86G5ec/2JQ+RiqOf9s/5RVNwmUgqcmwqFoSG0n24IKSSr/oFrXAEXbIX1v9gXZO/Q4ytyPCLQ2c7elN5BCB4881SAIPfh1Ij6UD84dAaESanWv4YnblqoKmb3DE2mvZi06jF95OHrUXQnA98Sg+dAdJIA3DBzKw0tWQrptdT6UQrgW59G807
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(2906002)(508600001)(83380400001)(316002)(86362001)(2616005)(26005)(8936002)(82960400001)(31686004)(5660300002)(4326008)(31696002)(6486002)(66476007)(66556008)(66946007)(36756003)(53546011)(6512007)(6506007)(6666004)(8676002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWV4WTNkZzFrOTRsMU9UVHdTVXNPRm9aQ011U1ZKYjY0MkNkMkFDN2o2QlRm?=
 =?utf-8?B?S1FEeUVZeUJMMWxEZms3czkwUERGbXU1VGlPcHM1ZVVrdDhJOTBJVWJ5Y1E2?=
 =?utf-8?B?d2xlYjRzTEU1N1NadXllajlLUGljSDZaKy96T0xPUEh2WnJQSlFYRU5VZGF0?=
 =?utf-8?B?U2l6VllhNmM4TlhIZGhMQjlOR0hYOTFIVGpHTjFhYlNqdWQzYU42SkhPSmhS?=
 =?utf-8?B?b3djaXFheFNoQmxtMFlmMEZhdm9VWUhvRHJMZlc3UUtGcFFXRGdZOWFDaDNE?=
 =?utf-8?B?dkNDaUF1QURTV1Rlc1cxT1VFTVV3bG5USWRJcVhyM3dxT0RtNHhwam5ob1Q0?=
 =?utf-8?B?QmJuSGhuR3BmdGphTml1djE3MllNQzZJVzVTY2hQTjlWczRJM1ZyT2U4czVn?=
 =?utf-8?B?aFZXSmt1R3VIbG1HV29vd1FHMUFTL0RWdWlLcEhxWkdMaVZIYVJxNmlvSCtF?=
 =?utf-8?B?RW5CUk0vOUNMVk5KV2pRaTM3RHFzZmx3akVLMlFpaEsvaWsxczg3bzhueERo?=
 =?utf-8?B?ajVndEx1VjNkU09vMVlza2NGcDlYcVRTT0hIY1oyKzIwelpBUm12ckZJaVBM?=
 =?utf-8?B?UjkwdVhmTStmMWs0d3hQWUZXS2xwVkRiamJFeitmc1RDVUFETHNzTzY4MDN3?=
 =?utf-8?B?a0gweHR2Y1ZNbkFFSjBQbEQvdUFxT00rOVBxUVVWOWF1WDVvRWRLc1RVZkdI?=
 =?utf-8?B?dlJmVDEybmZsUm5NZ1JMK1k4UG5GcVQ1eWptbFhWbVNBb2d2ci8wRDNTanJT?=
 =?utf-8?B?MitLOXFWZDM1cFpMNVNlUDdkWFlkM0Yvd2RtVWVuU255aEkzMTI1Q29QeTF3?=
 =?utf-8?B?OFZMSEJIMXFVVmtoMWVZVkVUeHdhNlBqNnFQb01TNTZLamFqMk9KRjdRRUR3?=
 =?utf-8?B?dytoc1F0Q3k4a0N6dlZVUmJnM1lqSFVNa2NacWhmc0NmL2hhSUE5c09CZS9y?=
 =?utf-8?B?dnZDRzBrV1NZRW5VaDRKbjFRdjVtMmFPL3B1TTg3QndNNHgzVlNFV2NmWHJ2?=
 =?utf-8?B?QUF1TGliZFdIMWp6eG1lcVYybnNjdjRzRzVFZGZYWEFOZ25PRmt4SjREdW1w?=
 =?utf-8?B?aElpVGZRS21iN0xPamFieVpxWTMrZVA5VHZTRDVPMWN0RTdONzgzT0pRQVpZ?=
 =?utf-8?B?ZXovbVZrbzA5QlFFVDc2UVJRRG9FT25RRkIzeDFENVFmYm5TNytPazNDQzc0?=
 =?utf-8?B?ZGMrK3l0dnF4bW1RcHhoQ1JoejhOaEZTbm1oTmFXVG1Jb1VpS0wwcFFTQTA1?=
 =?utf-8?B?U3VLdFZVbFp1TTN2US9KT0UwYU0wSWxPK29FQklpUVNwQ3lCZlJWaU9zN2dK?=
 =?utf-8?B?S2F2d1dYOFlOakRhL0xDSXNSWmdHTjVzdnpxOTRsdXBGNFl3SzArbGl4QjJP?=
 =?utf-8?B?djdpTG9mRmpSdGVLMkJZSk92eUZwWS83VzU2RXpDMmRvQldSclJHTUVOWDRS?=
 =?utf-8?B?emk0YnI1VjdNSFVOQThldzRqSW0xZlBxWmFlU0hSQjgyVXpGVTR0RzhhZlZq?=
 =?utf-8?B?YTE4UmhLMzdYb2UxVllqeUJORHZQVXZTK1FrVWJDMEYzWWh0a3NEaXcyVzdl?=
 =?utf-8?B?U0EzRmVScTZGWUkzV09ocjJOamQ3dnRFc3F1OFhuR3habjZMYnhWLzlaZzVV?=
 =?utf-8?B?L3krdGRvZlVSVm5pV2p4bExmRzhDakF6YzNrMWRCd3RIRVhlendrSjB6a3Zl?=
 =?utf-8?B?RGFQMzNoWU5nRWxwWjJ4RHF4N0xjbmlPYjF5T04xSW9NL2ZYMmhsdFBadDdp?=
 =?utf-8?B?QU9ndnhiKzdJdnNab2NXZlRCWDlqWCtwMmxUdVNxMkNWeHNKem4wU3htMkZI?=
 =?utf-8?B?cnJLcXhPV2I4MFovTUUva0N2MUJnN211Y2Q5bEV3cDMzRWRqOVN1TDRUeW40?=
 =?utf-8?B?SnVGY3kzcnNLV3oyVkNoUHJrcFlUa2MrREFBRllqNkh5SUxzM2cvdklRNjVX?=
 =?utf-8?B?NXQ1U3pKMkhMUExxdGhqdGs4NHFIWThicXlCdC84a1VOd3ByWDFKWHd3dWZP?=
 =?utf-8?Q?mCu0QPXCnQcGxjB34P+FH3inCw3dsE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5af0f9f-650a-486d-9e4f-08da0e9ecc1c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 20:34:01.9801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IR92bm0lNK10vSejosz4OQOdtgcB5+RW6558QKaLrDtIPrt7V2nw3yV9ncUbZ3xGOj01f6xz5MFw8tzrxzPUI9g1ylZEgxt33eaK07iRAa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2773
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/25/2022 11:37 AM, Das, Nirmoy wrote:
>
> On 3/25/2022 6:58 PM, Daniele Ceraolo Spurio wrote:
>> In intel_gt_wait_for_idle, we use the remaining timeout returned from
>> intel_gt_retire_requests_timeout to wait on the GuC being idle. However,
>> the returned variable can have a negative value if something goes wrong
>> during the wait, leading to us hitting a GEM_BUG_ON in the GuC wait
>> function.
>> To fix this, make sure to only return the timeout if it is positive.
>>
>> Fixes: b97060a99b01b ("drm/i915/guc: Update intel_gt_wait_for_idle to 
>> work with GuC")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_requests.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_requests.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>> index edb881d756309..ef70c209976d8 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_requests.c
>> @@ -197,7 +197,7 @@ out_active: spin_lock(&timelines->lock);
>>           active_count++;
>>         if (remaining_timeout)
>> -        *remaining_timeout = timeout;
>> +        *remaining_timeout = timeout > 0 ? timeout : 0;
>
>
> Should the last flush_submission() be  "if ( timeout > 0 
> &&flush_submission(gt, timeout))" ?

I considered it, but flush_submission only checks for timeout != 0 so it 
won't accidentally make use of a negative value thinking it's positive. 
I don't know if the flush is purposely done even if timeout is negative 
or if that's a mistake, but that code has been there long before we 
modified the function to return the remaining timeout and never seems to 
have caused issues, so I decided not to change it.

Daniele

>
>
> Nirmoy
>
>>         return active_count ? timeout : 0;
>>   }

