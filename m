Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A0578EE7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AF01139F8;
	Tue, 19 Jul 2022 00:13:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144721139F3;
 Tue, 19 Jul 2022 00:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658189602; x=1689725602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R5qnyYymM/bXbod15v4527gCcJ4bcjulhkTTzhUMPRM=;
 b=fuJQH1bbaQGDMmTtugbYJR14juoI5WKdio3uEiE8CQ3Ppg6n3GFwzlDy
 vSMigtdqh/5RGqXFmWF+Dq7CmY6Gw6E+LSH2+mUCrpYUfkgmWscdwyfYp
 n3+HolkQS6JmSx7YLpL0C0VoW7tb3bgaoXM4wiwnKgeyjNOaaqKMUeWN3
 QDAp2MtWOG2r+QtzKY10yxeDA+1/mXc50zFpmy74FCr/jReCTMKhchmnL
 qBFuH+SmHVUGsrqRInIp7rKySDmcq0I9RiTs1Y/A9zeTPQ9utujCmMmsH
 qlLpmw7pLhLxlmI36WF7lSS8CaG24d18AzaXoOI4e/L6EGCkaDp9JqSjP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285105137"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="285105137"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 17:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="630114308"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 18 Jul 2022 17:13:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 17:13:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 17:13:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 17:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSFUNplsvP+VSEC1elfA1dWba5qQXNSgHBveRcs36NWkKHAwN1sSvnnh6J+w5NzjYu4X0mXGT4sj82U6RcKiVxAaDGjBP40o/rqXTgMD3uy88mXPYTJGml/T/Jp7z6RG0liBjsJBi/RxnJ9QUKnuXbfrj7sBR4LbyTDFOmNOSpo7VyirIzzcRDgx4i8jNZat2hT5j2+DyW3W8rc3h/13FnxkJ7cek2WDKxH/fCCLWE/f67af0hUmro3mDVnbv+Ge9n+dCVtqFBcLGl3KzVvTIlAFibM18ULR6EDGM6I+JOZLaCEwcl+NYKmY0PTBYk1fsiDgcxd88Q35QJ8D/h2fZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPB/YELNduGqPFhBq3fRN7+Ay4fpeN8evQqcJXRTGpE=;
 b=IqlSz3kYpkhnEnExqglEDqd+cWvO6UzZl74JWeX8I+qwIuFCq4+Tkyoso3Gw0wz0Pl45OGaM9U9KSYnldtDH7033AefD2F9P0v6VD5TVtuw/upeLOyfXfAvs1sDm2bcpzA26fg60ieWIQnqG5G2qdDw+kHkYved2zl+vjIToo6weZIzXDNpIZ8pA68CB+QEQU8Q001p8tuwT2UNli4c+iU7PIC7gscfNpWE3KpCONFP+MEJe46Nm0nqFjlLEAfsc5lNAyH7pKGmvgStIZKHNAa7ZVLYj6g3JoFyB1YH3iHnx6EAQ0fCZzzsb0Vnta/8f+hedcdpfAsrjwnEEPfIJSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM6PR11MB3545.namprd11.prod.outlook.com (2603:10b6:5:141::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Tue, 19 Jul
 2022 00:13:18 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 00:13:18 +0000
Message-ID: <e7673834-a795-8364-96d9-7075bd407ee6@intel.com>
Date: Mon, 18 Jul 2022 17:13:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 10/12] drm/i915/guc: Support larger contexts
 on newer hardware
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-11-John.C.Harrison@Intel.com>
 <3c8e8b71-1c74-c50d-7b29-29430a11eb10@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <3c8e8b71-1c74-c50d-7b29-29430a11eb10@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a8f309-e12c-462c-2c5f-08da691b7b8b
X-MS-TrafficTypeDiagnostic: DM6PR11MB3545:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJZgWfp5YhvC8ou8jp7dNfZ5TuSuiY4xc2MFlHMHsz2COqOhdXw2w9Mv1r/o8j+OPmhmqP4mhlqMJ++zPPZa6cwJsbFbCojDDAUyTSa9KQvW+e1ERbhDhE6zv8ozTw3pNQQPX3rrlhy/GNXIlfPSWKM5+rbjG0BgWFnOLpsLMgg6pZBo1aKszbwBL9L9auLgVbaw3JxwRxdiBR0mcBSkj4FZiq0UmRRVA0vT5JN8zebxwsoK6HxpEz1lJ5gHgVA3eZO7OPyOe/tPjWaVY+9/H8ybAQVVzlbH67ScruzYWr4HtbDgiI0WdGXaYgU+b534OgJXeontYecs6qm9ykgI3J6QSHWvmQr0p3K88/M29xCedtX3FX2y4iXxWTlaboicPWDEg5Xvl0jS7wcFFEnxJOUMYuWf/qpTI6hQC3qZT4meQl4qpQGgcQyusRmb5RRB0FSPJIalEXLSk6vF7uDJYligBzRf5P7S1hR6BUbFW60gv2vr7Gvi2qnorz9fx/hCbz0eZ+L0WmkUGDX/SlvbBqWk+7h9C9mBbwOSRcqPJBGta90Gj8aMzimqwC7hKOOrWtJY6KP5idzk5lwCvW86hxRMvI421aNNS4PdgrgN+xAQ9ZqQGLCHVJ15XhMrPxbmtvAbM5HkWdMIJNuqPBYigwWfMXrQTN9RHmTXt8zt2RZLpB01U39nZEgCd7v+1h7wF5+NEoCk+8D35Yx4fMTUyICSjJ4Qbg14yEc+Z3zC7Hx5Tb5HzerzJZgjKnqjnTcU2kWKJKS6dXt3A9eZep6sLVEMS7e4v1ljx9XSDrJZvp/tG1Dr+DnIGGU5Bjha/DHhvVJmCpWhlQE7XW1xWGtrlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(396003)(366004)(39860400002)(346002)(31696002)(86362001)(2616005)(6486002)(186003)(6512007)(478600001)(6506007)(41300700001)(53546011)(26005)(82960400001)(83380400001)(38100700002)(31686004)(2906002)(5660300002)(8936002)(36756003)(4326008)(66476007)(66556008)(316002)(66946007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9XWXl6MGhWc2kyWGlOYlhPWUMrZmtVRUVKSHJKRURCRS9pY2xXSDhLb3px?=
 =?utf-8?B?R0E1RmpxVm1INVc5TytjOUtWYU9VUXl2M2JncnIyQWtCSkNaNTIxQkEzclNO?=
 =?utf-8?B?ZGo1NWl0QVFFMWhqMThNUWYvQU1UZlFkdFN4V2ZRR0U5TDVMYkg1aDBCOFNC?=
 =?utf-8?B?Z2xGSHNlK01hbVVaMlRVRjYwVW1hMDl4ZTA5QjR4S1djWXczbjJkeUh0eUI4?=
 =?utf-8?B?ajBSZ3hKNExPdDZMbzNGR0cwaHVhQzhSZ3ZLMFYzSzB3NzRta2g3N3FPVUZQ?=
 =?utf-8?B?UjJ3QjlERXlRTmw5WXpSNHFOOGNmQnV3ZjQzTWd0Mjh6b0ZmblhyWitEL042?=
 =?utf-8?B?Ni9WMUJDN0sxZVhrTzlKS25xRVovNzQ2eFAxQTZnUURnQTFScXRNeEZsT3M3?=
 =?utf-8?B?dXRWc2k0Z0lycTgwaDh6YWtJa0xEUXY3enVaamZLZVJTUmNET3VrUE01Q1VS?=
 =?utf-8?B?U1U1aXk5V2RrOXlCSjZmVEVwVDZMNlhwOHppMnE1WFhaRnNDaXJvRENHYWVV?=
 =?utf-8?B?YjVzVXZEYzZuRDlJN0Y0ck9jZEN5RGJMTS9zWmtoWllKYitJa1ZYQXc0ZVZK?=
 =?utf-8?B?c2x2czh0cjR2UWF1NWxPb0dFUDdFN1dNcGlyZ2RGUmw1SXhaZVZMZlJKeDNU?=
 =?utf-8?B?eUpXdGp4YnhBVnBhRlp3dDhkaFkveDRUZFpQSVpUM1Q2RUh5TFpUZE8xVEZs?=
 =?utf-8?B?TDZ6Y2xWUmVoVXNPcWJuSlBDdUxaSmFXdTQ0ZmJPTUROMXRBUEVjbWZ6NHBm?=
 =?utf-8?B?TTlBaWliVWtHdm5KSkowcmlaWCtScXVMUFdCUFE4aVdadGR1djdHN3J5OGRM?=
 =?utf-8?B?R0tOTWx4MStqWjBhTXBxbm1MdU9hd3NPbTRLN1Z1d3lwQys4L2RHZ0pqekZn?=
 =?utf-8?B?Sm9lSks1dW1hVjI0MllRVnhMSW5weWd4YjNTSGVXRHZrZS9MajhwczF2NFVC?=
 =?utf-8?B?bFdmaEI3akc2OENWeCtCZFZURWZhbWx2NDNqYUZKL3NVNHVzRWZsKzd1ZEpP?=
 =?utf-8?B?d3NOMGI1M2QwcklKbVk5TnN4SXpLcVUyalZBUVVRY1BpbVJ6aUFNZ0JObjVV?=
 =?utf-8?B?VlArUmE0QmZ1b2pHbW9JYi9ZYmxoRzJTVzhKd0Q5WXErL09qYU9mRFJLck03?=
 =?utf-8?B?WFdWRjFPRWtuamNNcFg1NFdJOEFTTG9pL2xnaDBwcXJXT0J5K3crbFRDK2Rj?=
 =?utf-8?B?N0FPMnBoQURZQ3lhdUkvQTdxMGFkMzdCWVVuWEpUWTRZbzJXU0RUUTNOaTVv?=
 =?utf-8?B?cmJTTEhMdU5MMWJJUU5RRnlzOUdwRDNUS2lDWGNyQWFHMEtidkNtZnVLOFdF?=
 =?utf-8?B?RFBtWWhBZTEvTGxKMHNyZ3hqVk1VK0VqczlNdENXelVvbXpMaE5qN3BKK0hS?=
 =?utf-8?B?aUhvcTZTbEM2RkdYWEU3dXZidVh0NlFIeW5MRW9hU29YSFBXaGxQUTZqaDYz?=
 =?utf-8?B?cWRKY0xnZHl6ZTVuWXF2eXlSdUsxTVc4NVBTTVNlNENSOVFQTXpCK1BoMENw?=
 =?utf-8?B?WGo5WkRMZE95OWFuRXNKVTUzR08zRmFPU2RZT25ZNmVqVzdDRWZEMW9SaXRs?=
 =?utf-8?B?SlpWY3lnSHY4Q0twM1gvMHo3dVdnRWxNaVNScnZqU3hVd0tjR01lVHJRQjJ3?=
 =?utf-8?B?ZlRPckV5YmpDSDkvOXpJc2xLaE90cFNSeFNWbUZuOW1JSnhRZ0l5QXNzZExG?=
 =?utf-8?B?ZDhHSWd3c09NS1lFVU9SemtGUnRBT3lyb0MzdmRzWjBiU1VkV3h5VlZQU3ov?=
 =?utf-8?B?NHhJNXBnNUpnNkNvNzcxY0lHa2VjS3lQdDl3bTgwSTlrY1htTmZEY2RZZGdM?=
 =?utf-8?B?TGkveHp0enFnN3ltRjZzb3BFb2YyZTVGR3lSeFFVSlJlUmw1T0lWSkdHSE9z?=
 =?utf-8?B?VWdvYlZoemxlY3hFOGZJc1Y3Mm5zNDZrU1Fqb0lxVnFFb3lMUllUaXNHWDNx?=
 =?utf-8?B?UWVtWGZVVmJRalEvVDZ1NnVBMEVPU2xvUEtSK2RWN2M2SytUY0J6OTNuU1hL?=
 =?utf-8?B?UjRZMlpBSkhCSTgzR0tyR2Yxd094Z2RqWmJBb01GTGRURERkR0wyR2VDWUo0?=
 =?utf-8?B?WTM3dzZXUWxtVjFLOXlOVUY2d1FldFU0cUh6UDlVam9GWlJoeWkvMW5HUS85?=
 =?utf-8?B?RTNmRVUxTDdPSURNbFdpOExDVU5LOURncG1NUlhWaG1VR3lqeEorcDh5Q1g0?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a8f309-e12c-462c-2c5f-08da691b7b8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 00:13:18.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dy30MdzUxWlG28daF7BQg6q/IYuvwzsOuq2Gjaw3W/6Q+SCrYiwuvhE0vesuHQERk09sVRakZbn24etG3DJFo2vtxS3pUfvUQpskkCXBFX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3545
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

On 7/18/2022 05:35, Tvrtko Ursulin wrote:
>
> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> The GuC needs a copy of a golden context for implementing watchdog
>> resets (aka media resets). This context is larger on newer platforms.
>> So adjust the size being allocated/copied accordingly.
>
> What were the consequences of this being too small? Media watchdog 
> reset broken impacting userspace? Platforms? Do we have an IGT 
> testcase? Do we need a Fixes: tag? Copy stable?
Yes. Not sure if we have an IGT for the media watchdog. I recall writing 
something a long time back but I don't think it ever got merged due to 
push back that I don't recall right now. And no because it only affects 
DG2 onwards which is still forceprobed.

John.


>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> index ba7541f3ca610..74cbe8eaf5318 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>> @@ -464,7 +464,11 @@ static void fill_engine_enable_masks(struct 
>> intel_gt *gt,
>>   }
>>     #define LR_HW_CONTEXT_SIZE (80 * sizeof(u32))
>> -#define LRC_SKIP_SIZE (LRC_PPHWSP_SZ * PAGE_SIZE + LR_HW_CONTEXT_SIZE)
>> +#define XEHP_LR_HW_CONTEXT_SIZE (96 * sizeof(u32))
>> +#define LR_HW_CONTEXT_SZ(i915) (GRAPHICS_VER_FULL(i915) >= 
>> IP_VER(12, 50) ? \
>> +                    XEHP_LR_HW_CONTEXT_SIZE : \
>> +                    LR_HW_CONTEXT_SIZE)
>> +#define LRC_SKIP_SIZE(i915) (LRC_PPHWSP_SZ * PAGE_SIZE + 
>> LR_HW_CONTEXT_SZ(i915))
>>   static int guc_prep_golden_context(struct intel_guc *guc)
>>   {
>>       struct intel_gt *gt = guc_to_gt(guc);
>> @@ -525,7 +529,7 @@ static int guc_prep_golden_context(struct 
>> intel_guc *guc)
>>            * on all engines).
>>            */
>>           ads_blob_write(guc, ads.eng_state_size[guc_class],
>> -                   real_size - LRC_SKIP_SIZE);
>> +                   real_size - LRC_SKIP_SIZE(gt->i915));
>>           ads_blob_write(guc, ads.golden_context_lrca[guc_class],
>>                      addr_ggtt);
>>   @@ -599,7 +603,7 @@ static void guc_init_golden_context(struct 
>> intel_guc *guc)
>>           }
>>             GEM_BUG_ON(ads_blob_read(guc, 
>> ads.eng_state_size[guc_class]) !=
>> -               real_size - LRC_SKIP_SIZE);
>> +               real_size - LRC_SKIP_SIZE(gt->i915));
>>           GEM_BUG_ON(ads_blob_read(guc, 
>> ads.golden_context_lrca[guc_class]) != addr_ggtt);
>>             addr_ggtt += alloc_size;

