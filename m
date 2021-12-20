Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71647B2E9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 19:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A63113597;
	Mon, 20 Dec 2021 18:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AEB113597;
 Mon, 20 Dec 2021 18:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640025285; x=1671561285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ly+qn1chRLanhsE9TRIDHsoz8PyN6aebXXA2zwzjoCk=;
 b=CUI9EYnu6sRmdklTmqPzHajFIZZRfRR9ZYy9SikoZ8ZsF0h5FwWI4KKB
 ZsbroU+PfwOoajLDoOCrGSxUj3twDOT0hUdFmIHvF+GiyZQe+JiMajUwZ
 SG0z9NYcc9AAWNLewVnQ7zFqVXzaTOYfsLg+v6NvIErvdCV7OiRPtpLQh
 L3yVhh/SR4jiExjzecFnBp+2veCPmENlw0w68/BhfsOavbZ2UL2B/1O3k
 KK9rRsgQUeXFK2CnjKfVdqQHHsNEgp0XQMP5UJhiKH6xBfLksdd5OxR9A
 UQLGcX/0uTl34yUZ6VpfHzwv1qdle/vtmmqgfQgqWXEIWIJ3h/A0kEbJX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="301016546"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="301016546"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2021 10:34:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; d="scan'208";a="547454554"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2021 10:34:44 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 10:34:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 10:34:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 20 Dec 2021 10:34:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 20 Dec 2021 10:34:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqQbDZfidDdBxyzziaaQwnujHkxOrQDBX6RCtOcDa7Fz9WwAJij3aLciwpvj5OC7OgqT1QXX/+Qbt84Q1gnbRvD/APRLSRZGDCgQxHwWI2+Mt7HSURQ6B3brv+X5yRZJ/ygbfuYgUyecwaBAHRfOVDNgPiMvWeTF1x0a81eVOpEZb1llGJq/eKj6FsiGpvkDsV+KqEIEsDMKoRTXcRAqPswEXPmzvvSnoHlJZBrJOyNpM1cGwXVVbQLuSHHoH5lYiol3LLzpYAkLo/Etrj7q/HtexX5xLGGTvCfCLSpz1cw4TJYKU9CM9X/dW2mZZxZmusfSsQF4qrZdTXaYOxWp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd2R0upW2GmvIn0vyKWygYfGF3PXX7seAmS4/QZ2tbY=;
 b=D6hnyqoff/xm0zPD01ZHo1UpBwYoS8kejfgDCW8eg+4fjxigLjnlVR0xAffYbAr7WcuSyZy6bOa1dcUHMy1PVSweSsCoY/s1eQkqiPUU5pOKUAY56UO/S0Q8EhVyh2WnN2Cb++TSZFlcy3gbs7L7gct6HFkMRX50hH9e2NUaJwmDn3VHPvRO4N+La2yFkIWZADgktAiAj/aW/KRMJcklpVXMxl1dUf78a+phoib++4Lll5smJ4vkqliuUS2zSrtu6VOl7ZqGQjkPHUYoS5r2lrNGgmFPd66J9JhUlR3QV4dEweVHgbmLDfn+x2gSK/XIp33qPEkdZBVfL+93f/tAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB2630.namprd11.prod.outlook.com (2603:10b6:a02:c2::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 20 Dec
 2021 18:34:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::8460:d836:4335:641e%6]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 18:34:41 +0000
Message-ID: <1c3b1b53-0e9e-a89c-1a77-90cbc229c637@intel.com>
Date: Mon, 20 Dec 2021 10:34:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Log engine resets
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20211214150704.984034-1-tvrtko.ursulin@linux.intel.com>
 <597d4ad0-fdae-49a6-b471-3a83d4c25b98@linux.intel.com>
 <20211217162254.GA22048@jons-linux-dev-box>
 <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3d32df02-c02e-9c35-5165-79af1cb10100@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97bc2541-69a8-4c5d-61db-08d9c3e762f1
X-MS-TrafficTypeDiagnostic: BYAPR11MB2630:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB263004F3E1C430960C6213D6BD7B9@BYAPR11MB2630.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCSdO7PVSWrI9jQvDxRFCAdVZEYAEZwE+ypagTWgAQQbczVZgxl20TO/t28PAMCSDFF5g3Eu0K5ZuOXIwtH4QhcbPHJ59ZVwm/zlEPPQXoHDUL8uXHqI0pv4DJHgPUzbqVJMJvoWfG3srqZzS8YmdFor9XaYwj/ubmz/VBnrH1S8os8N4kNMDzJqZQUyTGJdzmg8A0EbDiLrvbRJ7DIxI5X8e+LIoQDDVqfOk3mOoO9nDrmSC8UplROyjThegjnAL+I+5KqZgDNIFtM1rJr993xHm7Iyzc8qTbdrwHgJ4dHjB/Sutkg4liZm4El0M13XtWfmc+2g0eVsQ4z017E+GCHzELVP+K2h7dhdDKCUqopIPwWiFmD13NTcbotbVhGPWZTCbpXse5GyNUf7NJ8CEnkUYF6H2m+qm8YplXKhW9GGzyKax/JqhMBArAytmZp+tq4E6UV1qAsLBOh/1LaUXgsKSY0G1AmPqNRe40UpjSKLKo24LMOcmIcoa+pQqpOtr2SDb80VtEvhX7Kn899/67TCrks+AzUaY2hzid4NH8ycteH9jI4olzoOLrGhBwusXIw7ChlRimmedCACHHYOqdqr/G49Qcmkgw34Nn+P8hu8ey0hHk68zHrj4WZzCDmgqQc5dwTwUOqfwJOOBlxg6gkt1PW8xHKDTcogNNOIMkHeF2rHHyWD06ZFLJiiV7tGDd/0VSfSStXaCveHCCrmwkizYIPFip/oelchkPe2v8yImXKRofGFzXtY+xnPlO2p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(2906002)(86362001)(36756003)(31686004)(2616005)(83380400001)(38100700002)(66476007)(66556008)(31696002)(53546011)(4326008)(6506007)(5660300002)(82960400001)(26005)(6486002)(6512007)(6636002)(110136005)(8936002)(186003)(8676002)(316002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWRNc3MyZ091RStoVFF5UjlRWjJTeEMzTTJlOS9qSE1YcGF2a2NqSkoycHMy?=
 =?utf-8?B?QjF2Z2hwQjdLdUhkSVdnTFZyRHl0eUNoTGNXdkNtWU5Pc1UxUnRwR1hJL3Ev?=
 =?utf-8?B?MGkyR2VqUE9kOEhROEtUNDRzcHhlOHlndjF1azlqOHMyU0o3V3B2a1NBQng0?=
 =?utf-8?B?bFoxbnRSamQ5SHJ5TEpjTWRxTlBKWGZGQXJ3RkpzSTdPK0ZSV0xWYy9nOUpa?=
 =?utf-8?B?SVh3eks3M2dJTlAwQW56MkgzOVdwNm1IbC9Ca1VtYUtRNmN4Z0pkWm54OVdT?=
 =?utf-8?B?N2dDL3pSdGNjOVBlWXRtR2lKc2RUQUt0R1g5dDI3T1hqUU1JMlppY21naEVy?=
 =?utf-8?B?RjV0MTdobjRkWW9uU0QyZVlDUTM1RzJpWlNqcDUrc1VCZHJ6NVFUOHd2OEZp?=
 =?utf-8?B?MEFrcnJEb2owaW5SbXlFZFQ1TnJLdENCdDhwZjczRE1qSjBHMkdLa25hSFVF?=
 =?utf-8?B?dUpmcllmL3FKaG5TeTc5cGpnQWh4Ym9ZTFBBWUw0WlVhMXlxWGFaR1haWThL?=
 =?utf-8?B?YVVWYkc0T0pOQ1VnNVJZN25oSmZwK0Z2TGJWcUgrQkJkTUtsZ2lIVjhmdjhU?=
 =?utf-8?B?Q0lPTkQrZEhjbEhuenJMYklWY2w0cmliSCtjd3FSVDZnVmtHSkJWdHd0VnZV?=
 =?utf-8?B?QnFzOGE5NDYwdk1SZzB5OUl5Y09jQ3pCVUFNNllJRVg4U2YxbGpRZTZJVXBC?=
 =?utf-8?B?MEFjUVNReHlmTGsxdnhuMURlOWpmMGdWbWllUXJsdDVWNlViRkpVSVpNbjl1?=
 =?utf-8?B?SWJRMnA2SnV2dWJBOGsvYkNnOFVINE9XaHZIeVBhb25QMExhTmlpQ2F2M3Qz?=
 =?utf-8?B?SUIxRTE5YnZ5RjI3Z1hYS3RrTXFvQ1Azdk1wMzVrTGRLaHV3M3cvS1VIQXJi?=
 =?utf-8?B?RjhqZGFQMHJ6d3FNbnNaV0dDeVFYSGdOa0tIblcwWm5wNkh2T2FSOGJBemRH?=
 =?utf-8?B?TkdRWkR3OG9YOUFIOGNlbWtOejE5bDNSUUtYSjh6Y1VqT1lXSGg4djFSQjc2?=
 =?utf-8?B?bEJ1dGNqTmVYNzZubTJUMzFYamdLSE81SHBTRWUwYkRHVUZPV1pHMXV2S05E?=
 =?utf-8?B?NWFjQ0poRHVUTHVYcjNwdWNCWnVWa0hZZXVvSTA5TjY4S1V2RmkyZ0RnN3Qx?=
 =?utf-8?B?TmUvOXFCNGpNb3dXUnhtdS9oUlgxQmhiOXBFeUZneVFjNXFaaWI4eXUvL05X?=
 =?utf-8?B?N3BiZXRBWTFmMmUrRmxEcmpmL2NwQVVrN3ZQNURHd2ErblU1Ri92dG1zZmRU?=
 =?utf-8?B?ZFJKc1luR09MZ09aMUZmRjF5UkJTUlVYQnpGdWN0TE1BVHJ6SlhvVHJUaFhW?=
 =?utf-8?B?RkZrT0FBcEhmNjBuSUZWMzZxR2RHZWYwU01UbnJ6VlIxK0x2ZnNpdEdIcXRC?=
 =?utf-8?B?Nm5McGN0OHZsT3U5dDBPNEQxUUt2NHFsa3JBeU1tck04bFpMekZCZEwrZ25l?=
 =?utf-8?B?aGtVVm5WcHJyMlVsNjFPTDF3UGtBcVJ1MC9GQWM0SXlNbW5UbEkyZVhwZ1Ar?=
 =?utf-8?B?bTNWMXpSZkhadlRKK3ZKYnVyWWYxK3EzM01aYm5xa3lhQlVpZG80VXZzWEw1?=
 =?utf-8?B?MHU2OVcwelRJcDhBcGJieWthN2E1ejV3WWduYlpPMXhReXg4QjJ2QVhsSzdo?=
 =?utf-8?B?Z3VEbjdTR01BS0pIUFNvakI4QTRWdlFxZ3k4QWpydE9XY0ovNFV6cGpBM2ln?=
 =?utf-8?B?RnBKQTl6QnNzYnJxUUtPc2VkNVRHL1o1ZW1uU1VZdWJXSUhSbFV0dmNDN0Ey?=
 =?utf-8?B?QTUyOSszd2o0aUR0eXhYeXRyeE1HM2RSdWJJbFNmbUNrMXFTVlJ4aStUV2s0?=
 =?utf-8?B?enR6ZU03RWUyeGFxVThSdktrOUptczdmY0I1VzROSWRLd2NRQVVoaWpML1pV?=
 =?utf-8?B?LzloeXhqTUplQjNjWTV5TlJ1SGxYbG1vUWlPdXZ4am9ITHNHaTZQdXhDQTJL?=
 =?utf-8?B?VE85eW1ZTmVyclVxYWFadkZCTEIxelpZVEVlcUVOZG0xL2EyMWJ4QXFNcUkx?=
 =?utf-8?B?WGhvNktzNkN5R0wyR05rd1FkSVgwS2d0QXpjNnEzVlh1V05HWG5VUmR6c1pW?=
 =?utf-8?B?UXFpVm85MXQyNDBWcDk0aE1qckJmODkyTUR0UGZTVkFvTk05TEdIZjRkVVZn?=
 =?utf-8?B?VlhkOWp6SGU0bG5yZWV6TnN0bWljT2tvRkg4UHFmSzJoTTArV1FIOGxTQThv?=
 =?utf-8?B?RG5hc3l1WXNIMXA1UkwwVE53Qlp1QkJlVUtZbTF1TUREVkZPR1l0bVJQVnVW?=
 =?utf-8?Q?NhUcRUzuAPpdqwcZbkzlsTDgbwViQ5raRB9qXvbLYM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bc2541-69a8-4c5d-61db-08d9c3e762f1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 18:34:41.6202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tqq+1MHvxcBxBAxGrt1wU+j/kw8win68X+AJlIG54vn5ncfXiRVcMqWvOVeQGJsvuVjN1HTfLWWaXSmz+Wq2impxv934TmXBalFOH4eBi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2630
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/20/2021 07:00, Tvrtko Ursulin wrote:
> On 17/12/2021 16:22, Matthew Brost wrote:
>> On Fri, Dec 17, 2021 at 12:15:53PM +0000, Tvrtko Ursulin wrote:
>>>
>>> On 14/12/2021 15:07, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Log engine resets done by the GuC firmware in the similar way it is 
>>>> done
>>>> by the execlists backend.
>>>>
>>>> This way we have notion of where the hangs are before the GuC gains
>>>> support for proper error capture.
>>>
>>> Ping - any interest to log this info?
>>>
>>> All there currently is a non-descriptive "[drm] GPU HANG: ecode
>>> 12:0:00000000".
>>>
>>
>> Yea, this could be helpful. One suggestion below.
>>
>>> Also, will GuC be reporting the reason for the engine reset at any 
>>> point?
>>>
>>
>> We are working on the error state capture, presumably the registers will
>> give a clue what caused the hang.
>>
>> As for the GuC providing a reason, that isn't defined in the interface
>> but that is decent idea to provide a hint in G2H what the issue was. Let
>> me run that by the i915 GuC developers / GuC firmware team and see what
>> they think.
>>
The GuC does not do any hang analysis. So as far as GuC is concerned, 
the reason is pretty much always going to be pre-emption timeout. There 
are a few ways the pre-emption itself could be triggered but basically, 
if GuC resets an active context then it is because it did not pre-empt 
quickly enough when requested.


>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 12 +++++++++++-
>>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
>>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> index 97311119da6f..51512123dc1a 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>> @@ -11,6 +11,7 @@
>>>>    #include "gt/intel_context.h"
>>>>    #include "gt/intel_engine_pm.h"
>>>>    #include "gt/intel_engine_heartbeat.h"
>>>> +#include "gt/intel_engine_user.h"
>>>>    #include "gt/intel_gpu_commands.h"
>>>>    #include "gt/intel_gt.h"
>>>>    #include "gt/intel_gt_clock_utils.h"
>>>> @@ -3934,9 +3935,18 @@ static void capture_error_state(struct 
>>>> intel_guc *guc,
>>>>    {
>>>>        struct intel_gt *gt = guc_to_gt(guc);
>>>>        struct drm_i915_private *i915 = gt->i915;
>>>> -    struct intel_engine_cs *engine = 
>>>> __context_to_physical_engine(ce);
>>>> +    struct intel_engine_cs *engine = ce->engine;
>>>>        intel_wakeref_t wakeref;
>>>> +    if (intel_engine_is_virtual(engine)) {
>>>> +        drm_notice(&i915->drm, "%s class, engines 0x%x; GuC engine 
>>>> reset\n",
>>>> +               intel_engine_class_repr(engine->class),
>>>> +               engine->mask);
>>>> +        engine = guc_virtual_get_sibling(engine, 0);
>>>> +    } else {
>>>> +        drm_notice(&i915->drm, "%s GuC engine reset\n", 
>>>> engine->name);
>>
>> Probably include the guc_id of the context too then?
>
> Is the guc id stable and useful on its own - who would be the user?
The GuC id is the only thing that matters when trying to correlate KMD 
activity with a GuC log. So while it might not be of any use or interest 
to an end user, it is extremely important and useful to a kernel 
developer attempting to debug an issue. And that includes bug reports 
from end users that are hard to repro given that the standard error 
capture will include the GuC log.

Also, note that GuC really resets contexts rather than engines. What it 
reports back to i915 on a reset is simply the GuC id of the context. It 
is up to i915 to work back from that to determine engine 
instances/classes if required. And in the case of a virtual context, it 
is impossible to extract the actual instance number. So your above print 
about resetting all instances within the virtual engine mask is 
incorrect/misleading. The reset would have been applied to one and only 
one of those engines. If you really need to know exactly which engine 
was poked, you need to look inside the GuC log.

However, the follow up point is to ask why you need to report the exact 
class/instance? The end user doesn't care about which specific engine 
got reset. They only care that their context was reset. Even a KMD 
developer doesn't really care unless the concern is about a hardware bug 
rather than a software bug.

My view is that the current message is indeed woefully uninformative. 
However, it is more important to be reporting context identification 
than engine instances. So sure, add the engine instance description but 
also add something specific to the ce as well. Ideally (for me) the GuC 
id and maybe something else that uniquely identifies the context in KMD 
land for when not using GuC?

John


>
> Regards,
>
> Tvrtko

