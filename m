Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5619477D9D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 21:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3A210EDDD;
	Thu, 16 Dec 2021 20:31:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3AE10EE78;
 Thu, 16 Dec 2021 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639686701; x=1671222701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SB93UL8ugL0l11Co33YLxGqonzbSLaoy7yTOmHz7KLs=;
 b=bfBV8crGJCQfpp5FB13Yfx2DceIejS25Fq6TNw+kQK7luujvTBttfWAW
 KYciOKSUiYsqDjuV8sDRnLdOFu62Pvb3FsjfZa6tO8THonn5KkYaQZbIY
 3bn1oDmPcvqbQ/My8W8ar2ja3f4btHbGjihy84LbxIju+yRGflM0jshTE
 9iPleL4NkLvdwXQJ+QDed3pZ+9o8HJrNtmGeQiFlzLTnp5TZRU3eKympV
 OCIlrhZSUoY9GU3U+FjA5ZLgO0yGpW3jNPuqq6AhpD0VxqShK3RBnKarD
 +Bqm0c9z97XeJ/i5o72/udixi6MY1nk5x5w+ZkZodKEn+SQhYvwwHMgAA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="226877482"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="226877482"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 12:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="611665479"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2021 12:30:45 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 12:30:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 12:30:45 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 12:30:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXS+c8C9jH754iy5Qfz5rt1e+aj5u3+M+CghSsQ555gGBcNP7P0N4eCShYOdHM3QEzRRz+JGYWGjWV2Fbo2+fYaVRqOuJONFpGmp1QHpqKJ8a7jWF9IxFiqw8emPTCmZe7rWyBwz9dFo2PoArrtf9bRDGhOXP72/xEwCPHqm90LmdISXPSmc1Ur3nY0aTYy/Ynqq9oK/n4ITILZpRvJq/KJYGrJdu5BULBFqyxxKTttiylY0F+k5ELaihESgbmAYKRpkW9hJPhZR7PoBaGuK8vORVfriQWGEoaPW8V4itL2YI0S4oR1EFCWEf2/faeaF84SNfsS73qm5Th9KDGrmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOZRw2p3yMCE3GqsIF2roppG7OduqhaKhTOS+8ejWwQ=;
 b=nndW/Ss3ApdJttJwNMnvmYeorZgsH74ICCSzU7J7LC3mBvzfJaVihHUSlMK6h5f/F5zj0B3TcqWqNOIf1sZzK0Zzpx+Jy3xISyurXnMXnA8jjRXsVSgEQHqF8BWWwzy3lxDJ0NVyfTgqh2vLhgGSVq4mvZdgnViXIC2FprrdHKxrTi30Pe7r3OQsY3k2TZtxYZY8o/4vWm6Lb85G5trnVUG8y8pbznlzPk6x6zEWUco7sgRu002BOXs4TSX7G9GMdhHHtQq7jIFTgkL/Mbsf8XUK8GZiE+tHqkY0b25wFcvNGhFdM0oukPjoaTXNwQgrZ47DuXgVQAv6sEgc/UzaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 20:30:44 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 20:30:44 +0000
Message-ID: <7456242f-654a-1109-c91b-4ecb7a0f3a64@intel.com>
Date: Thu, 16 Dec 2021 12:30:41 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check for wedged before doing
 stuff
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
 <71a04b30-7019-f2df-e18d-f04893860e71@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <71a04b30-7019-f2df-e18d-f04893860e71@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:300:4b::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 900d5ba9-80c0-48f5-a2b7-08d9c0d2ef3c
X-MS-TrafficTypeDiagnostic: BY5PR11MB4152:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB415228B231F2FD006BAE31E3BD779@BY5PR11MB4152.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXapyAwCR7eOdJscGgdwIgWByhz+LH/P2A07bm95+etsg0tMzV2Ak3FmtnUS+vZHEuzXWVv/Cab9MxE2HJZr33HBCByulqAwifKt47OLY4V5tXPe6MQOm1pRMmnMAKn8EvZfKcaYQj5qaWcZMaFM1kxnlPU6XkuzMQ1oeRVNqhFyX+vQ4Wy1xfOfvBFsxZydqHBF3PlsfnrfIKvdRVhypN2MGVQlyN90eQJbHy3nxsS5KQrGnX+Yqs8Lu2t7O7vRywGm7jEvIlUeBxSXVatrEf+R5zpCDaAfJT0qwQS9NO5xgbg4lQQ4ObHOoi9l0amzmBLWHwfwHIuWNVmpk9DrEF19Z95ItgMgjZUcYaXN0FkIg6GX/DEKUK1P6bFLbCyRnsncoKrxgbox24nJ0+WCtZyBmFEnwduKKk/i9cdBI0V80tC3V8oqGKT+x+Qiy7M5JOFPdUrTOTv3gItp6jKnxxm6UnG2w+RAPfgule2kbRUtMTg2Xm1Npz3Bc4MNFxS0p9dERRfvSAJJFhux8rtnINBnM6MfpPO3Kj1sC8rR3FG1szmPyVU0QWNzUpvWCim8FQ8GBjyuKlcapavSe8dQMDwr45Owajaz/oLBgrJuloH/HntoNdp7ypkAxidUB7jZzDRiEgRSvrMYf0TvspM3D3UHsVXidanHme2AJIUu9AxVPTPJDQTW2KNPeytlBdh+0q1UeuHaqZDbRw4cdXhYHTuBxptxaBKNXCtS4iTUDfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(82960400001)(8936002)(8676002)(2616005)(6506007)(508600001)(66946007)(66476007)(31696002)(66556008)(6486002)(31686004)(6666004)(5660300002)(53546011)(36756003)(6512007)(316002)(186003)(38100700002)(83380400001)(26005)(4326008)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDEvMFdtQ1Z1YTVhUW80dXlaZ0JxbTZxS2pFdEJxVFdTdmlWY0IxbU5maUdY?=
 =?utf-8?B?MnF3YnN4RHZ0ZHgrRjE3azRLbEIzc0RvRllXSlBDQ2VTWUJQSk1Ed0FtWWhv?=
 =?utf-8?B?S2VOMHhoZ2pTOW5kVUp5ZEI5VkxSQ0hyU295QVdvWDZqNzZsVEtGc1oyVk5r?=
 =?utf-8?B?QkhrZFI5MG1TOXZyVElDdlZnT2VLYVh6TXZwNTZLaTRIeUdURkQvN05paGl3?=
 =?utf-8?B?QXpOdlh4MkZTbFd1MWI5aVQ0QnJjOHQ2aWNLSkhRMzA5bklLNTVlVnp4V2VE?=
 =?utf-8?B?U29jTHZ4VXlFcW82ZGhBTG5FYzRiMTYrOHcrTkNCRmxkb3BMVkNuRFVFbDhJ?=
 =?utf-8?B?bXllY0tIYTNtYko2eWlaMUNEcHprWmxtOTFIN0FtNDNqRFdraGJEdUQxdW9F?=
 =?utf-8?B?TmdtV2srZTJyMUg3QWxRM2tFMG1uTUZPb2hnVlRjelYrMllRdHU1OE1hQVJs?=
 =?utf-8?B?aUtyRnQyaGtaRktyZ3RnU1o5SllmU216N3ZjYjFCRVRJclJMcW8xSTVCc0xu?=
 =?utf-8?B?bnlkM0Q1RnZmNjNqZVJXcXZVT3gzU2FGUzhYN1pvcU8yVGlGTjJLVWFiMVp3?=
 =?utf-8?B?VHowQjhtVGVpU0d3dzFVc1BaTnlzZmN2UC92RlYyczVZMy92VExyS1dqV0Nh?=
 =?utf-8?B?bVlKbGJhMVluYTQxcC9TRTc2Q2JQYjM3WWZ1Q2RVeEp0eDFwUHJ0Zyt4VFNN?=
 =?utf-8?B?M0JaTmxlZnFONzQvMEg4STFoVXhGWWVvRDhKeHk0UEZMTlVNOTd6bjk5Vlk4?=
 =?utf-8?B?Q2gvV05WU0RYYlhEZURhUVlmZVlCTDNaVE1qOWk1ME4wYmhzcVpDeDFEdGdV?=
 =?utf-8?B?L09jQytsd2ZqamtBNnBUZEJyNmRTYnFGaGhNZFBlMitUUGVyQ21UYjdPWk5s?=
 =?utf-8?B?VDI0MWVQQkwyamRyMnhPbFhtZ3NINnR0OTNmQTB1R0xyOFBwU2dOTXJUZW44?=
 =?utf-8?B?anlTektCZUhiK0I5bWRuWWNNV1dXT0w0U3NRQmJ2dnp2T2xsdnBaQjJaWVUx?=
 =?utf-8?B?WmsyS25LUitkUEllUy9MQnJhRVc5SHlISW5GVzdoUlRTdytRdURuQXlzbnNq?=
 =?utf-8?B?QWx1b0pGRGNMQjQzWTNmbGRNNllhdjZmRDZqNzNqVXBrV2dyNkVCU3IyemNK?=
 =?utf-8?B?ZjJpY0FCaEZOTVFYeDhSNzBsZHFjQVI1b3FMaFJDWDhJL00rZitGa2FwOENl?=
 =?utf-8?B?TjNPelVTRFFMK2lWOFpPbSs5NkRZWi96VGhqK2hiOHNveWRyWXJLMnViNmRz?=
 =?utf-8?B?Z0VlSmVJQ3Fyb3RyQlFvS2xpSElzWTdGTnFoVHc4R3hWYkpGNm9XdGhuK2pr?=
 =?utf-8?B?azA2bmlET3hpWnFpa2Z5SHVqbHVrSFBZQkdJMW1CN29zTHNJQW9OeTF0cGpl?=
 =?utf-8?B?bUk1QjcrNDdYOU9oY05RbENtSDdBSWUwZ1RhNVNEd3pnWTlCZHgyM3hNUmo4?=
 =?utf-8?B?VjZrU05Mb0YvWGRTdFU5RzhJTWN1UUI2S1hwWjJpT0UvRk5hOWdFRzJpYUJi?=
 =?utf-8?B?S3RWQ0I3SU92TkhFSFJ2OWZqWTN4SnZIVm5JWlFUZWRzL3pQSVp6ZHhOdTdm?=
 =?utf-8?B?WHpPdlRwS2QvalNWWmRRTzZTbHp5N01maklwQ29YQ2k2QVpKT25JUU1YK3Zk?=
 =?utf-8?B?MVpzOHNXYUF3My9yTzVjZFlOWWpwdGdjN05kMGtzQUZneTNoTXU0NE5GUVJi?=
 =?utf-8?B?UzNYeXRUUWZSWlV6Vm9rTUlmR1Mza1pIZWp5Kzhwdk9UZHZUcHRzbE5vU2hS?=
 =?utf-8?B?ZVkybGNFRGgwVzZlTzVXQjlZdGE5MHpFSVh4dDRtYm1zaHBYaU9wZktFSktt?=
 =?utf-8?B?U21ISUNMYTEwb1J6aUE1YzJqWmJQZkVRZlNsL2I3TlpDMU9CQ0VrUFVBcEFW?=
 =?utf-8?B?M3M4eWdQWjVTS1U2NzBpRlgvYWtDd2ttTXBZNngwT1JwNmlwYm1yRzRHVno0?=
 =?utf-8?B?RWhobEo2V2ZOcHc5cXVMTzhKQzR2WXoxdnNkRktFUnpTSlEvT3psbUI0VDV2?=
 =?utf-8?B?eUk5c3kvMWt1ZWhVekJoQURrWkpueEtSSFExS3pROUR4R0lQZTR4bVA5MC9h?=
 =?utf-8?B?Y0gxR2sxMXZzNFJDL3o4YUVSR21Jb3YrdUlBbTdSMTVocFhqbHoxMjNHdjBM?=
 =?utf-8?B?ZW5nQWZVN1pzcWtnOG0rMTBUNzNHVW1qaWgyeFNCbGd2NFkyUXRub1JXN2c3?=
 =?utf-8?B?YXBOZUpFTGI3WjJRRXIvNEZSVUtzWXJXcnQ5OHFxV3F1QnRBUlcvNEZNODJO?=
 =?utf-8?B?emFTNURrM1I1Y25JV1c1MzJRbUR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 900d5ba9-80c0-48f5-a2b7-08d9c0d2ef3c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 20:30:44.0435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ghWg8flGSdcT23n7Qi93kK8Axyignm4zv59efQarcj1l2bekwXvoNE7n0tRWxFy5t8X0bc0xftJngvxe9XtlnP2wS7nfikQygcXrw1c/RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4152
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

On 12/16/2021 00:47, Tvrtko Ursulin wrote:
> On 15/12/2021 22:45, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> A fault injection probe test hit a BUG_ON in a GuC error path. It
>> showed that the GuC code could potentially attempt to do many things
>> when the device is actually wedged. So, add a check in to prevent that.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> index 97311119da6f..88f002c4d41b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>> @@ -1350,7 +1350,8 @@ submission_disabled(struct intel_guc *guc)
>>       struct i915_sched_engine * const sched_engine = guc->sched_engine;
>>         return unlikely(!sched_engine ||
>> - !__tasklet_is_enabled(&sched_engine->tasklet));
>> + !__tasklet_is_enabled(&sched_engine->tasklet) ||
>> +            test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags));
>
> Or intel_gt_is_wedged ?
Hmm. I just copied the test from somewhere else. Is there any particular 
reason why other bits of code would be doing the explicit test_bit 
rather than calling the helper? I see the helper has a BUG_ON. Can that 
fire if called at the wrong time in the reset path?

John.

>
> Regards,
>
> Tvrtko
>
>>   }
>>     static void disable_submission(struct intel_guc *guc)
>>

