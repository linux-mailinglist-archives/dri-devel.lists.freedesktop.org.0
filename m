Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0375B832D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 10:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE2910E8B7;
	Wed, 14 Sep 2022 08:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136610E55D;
 Wed, 14 Sep 2022 08:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1YRSnjawtzc51IBSt/ZUkj1OnDdJFOmryH/QiDbqs7ePewE4fuRqe0XlNkBp5KMcnmnZnWUgPORCraNMNpOSe1/+wim0kVL5/Pc3FACR2IERhBAdW63Rc+UdtWau+jXcbL/PU4cZeUgwXErOMxU30HGqIHAgzSLjgk9KHr0dISjcK/aEoI9z09kDT6ooSPKSO2JMQp2fv8Qz8MPfA3B3CwI5C8GL+6GJL3iGyRV3a/W7rsImy89bXvoJxjsaImNVbH0YFSwrDMsnGUhIdfxBdlBr41dtWziGbEbQtBx9MkvhsZV7mMontjp+jV1iOZxPdiXbAykHUGRPQZONF2YJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFWabxtLkvQFsieeyywd5s0r9UNH3AcQETlwOWSpD5I=;
 b=Ik9nnY1tnwqrWPwdtFlI85mjXJ4UMGflbeSHnmXwxDN8AiegUN+YgBWkYK4vUGu7QjsUNtshDe1bXTUHokK1TQS4g+1LHysFodeL/PF1EljRlcgzvePxWCUu/eunGpu3nvJfUOwg+9RBNnvvTLKV28//9ZuEA+Izqvm4eSULOxsXitEUOaqmNA010EYrWD5Y8mWQ2nao0Ua2Q2zo+cXXNarlgj7cFxFsN0VFNGl/u1hXh6V4mxHU3qfzNOyHkPYH3zDIIuCcroyRWH+h4Z38S4rRnlAqCFqTz6ByrUHbqm4V/l7kwt06RydbxkCYMBTwGgc0m5jVEptRCaj06c2C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFWabxtLkvQFsieeyywd5s0r9UNH3AcQETlwOWSpD5I=;
 b=5YXd8mH0QHGNKpVoeETQG5fepia4v6m/RXwlf7r1brzXm+otkbyUfzvyKbUagGQIQOEJDJIP7NTPvuSfwNAmyeJevqBV0JZPnQi6R+w/y9DKPj1bqwV67MXNhjSnrHLnuTBWVXtQWSEeJLTELW7je7sFhsTCGZHM4QZCHIeDUGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1ef::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Wed, 14 Sep
 2022 08:40:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 08:40:41 +0000
Content-Type: multipart/alternative;
 boundary="------------IKOzY5m042kwfaF3cNkR4pXY"
Message-ID: <fcce77b7-3bc8-3284-84b6-829ef1278089@amd.com>
Date: Wed, 14 Sep 2022 10:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmU6IOWbnuWkjTogUmU6IFtQQVRDSF0gZHJtOkZp?=
 =?UTF-8?Q?x_the_blank_screen_problem_of_some_1920x1080_75Hz_monitors_using_?=
 =?UTF-8?Q?R520_graphics_card?=
Content-Language: en-US
To: =?UTF-8?B?6ZKf5rKb?= <zhongpei@kylinos.cn>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, isabbasso@riseup.net
References: <2lsauak61dz-2lsc48dl37s@nsmail6.0>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2lsauak61dz-2lsc48dl37s@nsmail6.0>
X-ClientProxiedBy: AM6PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be7efb2-d548-4409-d4a6-08da962cce3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wS33Z5ny1Z8/Yvq3xBm7UDFcUyHam8+dxxAwXrsY7Q81MXeKoliV7vFAbwiATHoveXoR/4XX/9Xt0m4uXZGQK55aspMTPbriwLeJLfYd4k9nH83yUSX50VByFMZ9T5ojtt1U0Trij6bBBNUu+Il2ZSyu0tlp9KTkPEpKPljN0deSjXNO/9amNLrHu4kn/Il0CeOcgSQ9gwJehkXmCFQXqVcOC3Im1Fqx1diK/cj9XpEZr5jzSsu9sJ/yN5JzEhwzI5QFQyZ6z4e+ep12QI5pHTGrFaUyXeb2Y4vpqHsQ5jcrR33ka94HBgzKJzkMazZtvx0n7a/+AX3B9E9KPA0W1bKnzJFXWI7z8gSanJO//2sKSHpk4pR7H+hOLVb3jIAB3GOwtoawRuDsSXSOhwsmY6nekck5YpDxNBrhZmMswHLznIVTIoplEOn9eyK/LO6azpV+3vSGk366ohu5ek6VYPsRAJghRqnL62gznbjFWRM+M18/geF42C7D68pl0J4lIvd5++m9bp+vd2GqlnGnPwQ0Vb/XcllYBu+c+dv3ePY67wopajG2ot4HvhH8Nevtvnkji1Q8/zs9gKK8NClNlV20qgREh1eHTYEnLxW2SQn5NrOIGv9KtbrF1lAmsKAqxcf+KneHKhaqKb0ath6NyoPUyYHyJQD1MLIXIus7gO4GKb7HAJc0pBGBzgQt2Tr3/vIF5n2+ycEWdfz9Qg99q+sa6+hv6cEKrH3wQzUbFFv2tlXUrrN2EoVg9ITxJ0KresdCz7zxDTqnHc0iWR9VnNVpvhZ++AWji8xVBENdq8snO6oJWOP8ZEWOvEyb5+9tYDHeMkc6aci7AUg9l4JmCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(186003)(66946007)(6506007)(4326008)(6512007)(2616005)(478600001)(86362001)(66476007)(41300700001)(316002)(66574015)(31686004)(6486002)(5660300002)(83380400001)(6666004)(31696002)(66556008)(36756003)(166002)(38100700002)(8936002)(2906002)(33964004)(224303003)(30864003)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cklWS2daeGxPSU12bk9YUGhRZ1lhZ1piNWltdzdUaFpTTnFjc0M4djE2TXFa?=
 =?utf-8?B?anRHN2FMUmZsMVRWbHBFNnQxTk5JN1lZS2laRHpHTEFDRCtYMm14SlZETzZm?=
 =?utf-8?B?c2lrNWtjSm5Pa2o1SkN6QjZQeDNHbm9jUVJ6ZUd5YWU3RW41YmF3WUJUNDFX?=
 =?utf-8?B?bG5odjJSM29JV2MwQ2JHSW0vNjFLdjBBZUJ0MC83WkFmWitxWjNXay9lMDVE?=
 =?utf-8?B?cTV2Q3c1bTNxUWgrNjV1Ti8xcW9BQ0tSdW11ajZVVzFWRTN4eEpPTkU4OXA4?=
 =?utf-8?B?SkFxUWU5ZVhGVEQxbFQ3N3UxbEtId0dlTWVtVnEyWS9TUkRTUTR3Ym9BOEFq?=
 =?utf-8?B?dW5hQUQ2bDROb1dDZW5qd1haaEpic3B2SkxkM3VwZ01zSkRWYzNGWVhWenBL?=
 =?utf-8?B?Q1dkSFNiTm1keUlKQkk4VVNDTFpMSGN3dUE3RGczaGhSUVhFQnIxYzBKUFNs?=
 =?utf-8?B?STVPcC9rbG9vbnZJMXpFbTdsMzdyM1pRazl4MGZvQWl1YUMxSDZ3YVBVUTRq?=
 =?utf-8?B?bmEva1B6Y25IL0dkOTYwcThkTE9pR0QxVmR0VGFNMkcxN01ydXlwdHFUaVpP?=
 =?utf-8?B?aXFpK3VRSDA4aVUrbGdQcjBZZjY5MXpENzlZeTdsR20wQnRhV3lPTVF2VWMy?=
 =?utf-8?B?QWFKL2hZVVlkQ0Y5L1RaZWx4KzN0M1Y2YUNiSEp2ZGxXaC9YT3M3MVRyZmE2?=
 =?utf-8?B?NWFkS0JqaGZYZHhKL1ExY3R4MjhaMTBzUHoxT2UyZFVlTGZFbS8ybXJ4NWEz?=
 =?utf-8?B?SGUreUVxcUh0QS9iUFJHZUowOVhSaGtTNWh4TFJVR2dPUkJlUzBRZVNkajZ4?=
 =?utf-8?B?VGFQS0o4Ujh0WDRQeUxzclR3cVVVWXJlVVhvVWZPeDFsa2ZITHI0WUVKRDFr?=
 =?utf-8?B?YkdubFhtOUZveXdBZ21wbUZVVjFCRWFBQzhzUk04Mm5jWVQ0bnZJZitFRTlQ?=
 =?utf-8?B?Yk1FZ2NSaXM3Q1JubUxVcnFVcGZHSCtQSi9tWGFPQmliZ2JRQUt1aDlrZnpL?=
 =?utf-8?B?MWJTbzJhQ0RWODRlM0xzOGNSMi9oUFhQczJXOVZ4QTh5SG44ak5GMzNMOXF0?=
 =?utf-8?B?aHBsNHIwdVVOQ0czcGVBdVUxeDlEMWJRY051YnZJOGYyTEFNU2YzTGlWRWYy?=
 =?utf-8?B?MnlINkEyQkpqVHJqTldWdmQ0MWJwWkxNdTgweC9reUsxUnNoN1Q1TzFMQ2lW?=
 =?utf-8?B?TGhSQytZUGpIZE84TlpkR2hqYlJGcTd5RUVLUDRWQkQrWGNjMVBOekpxZ0w1?=
 =?utf-8?B?SXAzY2VVbG14RTJoaGRVaVZBbWRJQ2lNd3dwcDliSWZmR0owZ0MxWXdzbk4x?=
 =?utf-8?B?elgzQ2VTZ2tMNjJtajJBMW9DdlZGZXkreUZGZldhV2FGYmVNZFF3bFBJTmdZ?=
 =?utf-8?B?cTBVMDB2NmZUTFcyRktoTXdqek9adEJRSXZUVU1jNXAxSUhlTTh2VnZESm1K?=
 =?utf-8?B?dGhRT2lrQlRrcHFxTFQ4NDhFb21lS0wwTUw1UU9wd3JReVVZWEpQQld5b3pw?=
 =?utf-8?B?cUJQZFUvTnFKMW5pTzFIbWhBRktPMmlrTS9vbEFSaFhoOHc5VHZBMXlkQU1a?=
 =?utf-8?B?QjZUZHk3UUZkdGtzTEdZZmJZSXExM3I2bU9lMDBEVm9pdTBkSnNPdzNFaUtl?=
 =?utf-8?B?aGFDRGVrc2oxYmFIWlM5OW5EYlVTSFhHUUJEU202YWwvL3p3c25UWGJGSEln?=
 =?utf-8?B?SGxyazdjTmlDTElFc0QxWit1RE9mR2ExaDNYS0pFbUZDdzlDSVZoSElQWUw1?=
 =?utf-8?B?aW5RL2p6QUVLZmNReThyYXVGUmpZd09kWXBwQVZaVUo5YVkwTUJvU2xzWHhM?=
 =?utf-8?B?L1BYSSsvNW44WUpTTzlkQ2pFQXBHYytFeEFEc1RmWUhIRytpanFtTFdPSmwv?=
 =?utf-8?B?ZUFlQkJMeTVTVkhDeVc3NnQreDZSc3RqRWtJa1ozSWpjNHlrUlgyVDlzSkhw?=
 =?utf-8?B?clJsM1pRK1VsaFFtYjNrbnVrTVMzV2JDeE53dWg4LzBwYWhKcGFsWEZmWndI?=
 =?utf-8?B?RmtlR29EWHZlWm03bnMwOGlRbTJZd2xtTDArVSsycDJ6UzFMcXg3d0tIMlpB?=
 =?utf-8?B?ZVZyQWx1YmtrekNraHRTV0oxZnlJRlllT1R2d1lLYm52OWF4bE9hVVFKUUsv?=
 =?utf-8?B?blhKTHo5STRHM2NrUFlDcG1uSjhTRjYwaUFZN3d2bmoxY1grZkh3MFR0d2Vj?=
 =?utf-8?Q?G8d28DSJlAJAEKvAAihxhlwXBPK18Y2wMyth5CtEu7ZT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be7efb2-d548-4409-d4a6-08da962cce3e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 08:40:41.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwrhzruXG5TxAZeFrTj7WZ8LOx/cvo9ydff2qXdeyw4LlnT6vMANRbYfgmCAutxn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------IKOzY5m042kwfaF3cNkR4pXY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> If the *diff* is smaller when the value of *ref_div_max* is 100, set 
> the value of *ref_div_max* to 100. Otherwise, set the value of 
> *ref_div_max* to 128. In this way, the value of *ref_div_max* can be 
> determined according to the value of *diff*, in order to adapt to all 
> monitors. After our verification on different monitors, those monitors 
> that have a blank screen problem when the value of *ref_div_max* is 
> 100 or 128 can work normally under this scheme.

Well sorry to say that, but once more: This approach is just blank nonsense!

The problem with a larger reference/post dividers is that you your 
intermediate frequency becomes to large and the PLL starts to swing 
between two frequencies which are above and below the desired result.

So a maximum ref_div of 128 is simply not acceptable for the hardware.

Regards,
Christian.

Am 14.09.22 um 04:17 schrieb 钟沛:
>
> Sorry to trouble you, we ran some tests on this patch and want to 
> communicate with you.
>
>
> *static void amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev, 
> unsigned nom, unsigned den, unsigned post_div,*
>
> *unsigned fb_div_max, unsigned ref_div_max,*
>
> *unsigned *fb_div, unsigned *ref_div)*
>
> *{*
>
>
> *   /* limit reference * post divider to a maximum */*
>
> *if (adev->family == AMDGPU_FAMILY_SI)*
>
> *ref_div_max = min(100 / post_div, ref_div_max);*
>
> *else*
>
> *ref_div_max = min(128 / post_div, ref_div_max);*
>
>
> *   /* get matching reference and feedback divider */*
>
> *    *ref_div = min(max(DIV_ROUND_CLOSEST(den, post_div), 1u), 
> ref_div_max);*
>
> *    *fb_div = DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);*
>
>
> *   /* limit fb divider to its maximum */*
>
> *if (*fb_div > fb_div_max) {*
>
> *        *ref_div = DIV_ROUND_CLOSEST(*ref_div * fb_div_max, *fb_div);*
>
> *        *fb_div = fb_div_max;*
>
> *    }*
>
> *}*
>
>
> For R520, the max value of the ref_div_max in this function used to be 
> 128. In order to fix the black screen problem of some monitors, it was 
> changed to 100. From the commit message at the time, we learned that 
> this was a temporary solution. When the value of ref_div_max is 100, 
> it will also cause problems with some monitors.
>
>
> *void amdgpu_pll_compute(struct amdgpu_device *adev, struct amdgpu_pll 
> *pll, u32 freq, u32 *dot_clock_p,*
>
> *                                            u32 *fb_div_p,*
>
> *                                            u32 *frac_fb_div_p,*
>
> *                                            u32 *ref_div_p,*
>
> *                                            u32 *post_div_p)*
>
> *{*
>
> *    ......
> *
>
> **
>
> */* now search for a post divider */*
>
> *if (pll->flags & AMDGPU_PLL_PREFER_MINM_OVER_MAXP)*
>
> *post_div_best = post_div_min;*
>
> *    else*
>
> *post_div_best = post_div_max;*
>
> *diff_best = ~0;*
>
>
> *for (post_div = post_div_min; post_div <= post_div_max; ++post_div) {*
>
> *unsigned diff;*
>
> *amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div, fb_div_max,*
>
> *ref_div_max, &fb_div, &ref_div**);*
>
> *diff = abs(target_clock - (pll->reference_freq * fb_div) /*
>
> *                (ref_div * post_div));*
>
>
> *if (diff < diff_best || (diff == diff_best &&*
>
> *                !(pll->flags & AMDGPU_PLL_PREFER_MINM_OVER_MAXP))) {*
>
>
> *post_div_best = post_div;*
>
> *diff_best = diff;*
>
> *        }*
>
> *    }*
>
> *post_div = post_div_best;*
>
> *    ......
> *
>
> *}*
>
>
> This piece of code in the above function is to find a post_div, so 
> that the value of *diff = abs(target_clock - (pll->reference_freq * 
> fb_div) /(ref_div * post_div))* is the smallest. The pixel clock 
> closest to the target frequency when the value of the *diff* is the 
> smallest. The values of the reference divider(*ref_div*) and feedback 
> divider(*fb_div*) in the above formula are affected by *ref_div_max*, 
> so when the value of *ref_div_max* is different, the value of *diff* 
> may also be different. The larger value of *diff* may cause the blank 
> screen problem of some monitors.
>
>
> A value of 100 or 128 for *ref_div_max* is not suitable for all 
> monitors. So we set it to 100 and 128 in turn to calculate the 
> corresponding ref_div and fb_div values, and then calculate *diff = 
> abs(target_clock - (pll->reference_freq * fb_div) /(ref_div * 
> post_div))*. If the *diff* is smaller when the value of *ref_div_max* 
> is 100, set the value of *ref_div_max* to 100. Otherwise, set the 
> value of *ref_div_max* to 128. In this way, the value of *ref_div_max* 
> can be determined according to the value of *diff*, in order to adapt 
> to all monitors. After our verification on different monitors, those 
> monitors that have a blank screen problem when the value of 
> *ref_div_max* is 100 or 128 can work normally under this scheme.
>
>
> We believe that temporarily adopting this method to replace the 
> previous method can improve the compatibility of the graphics card.
>
>
> Best Regards.
>
> ----
>
>
>
>
>
>
>
> *主　题：*Re: 回复: Re: [PATCH] drm:Fix the blank screen problem of some 
> 1920x1080 75Hz monitors using R520 graphics card
> *日　期：*2022-09-05 19:12
> *发件人：*Christian König
> *收件人：*钟沛alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net 
>
>
>
> Am 05.09.22 um 10:10 schrieb 钟沛:
>
> Thanks for your reply!
>
>
> We found that in the amdgpu_pll_compute function, when the   
>  target_clock is the value contained in the drm_dmt_modes defined     
>    in drm_edid.c, the diff is 0. When target_clock is some special     
>    value, we cannot find a diff value of 0, so we need to find the     
>    smallest diff value to fit the current target_clock. For the       
>  monitor that has the blank screen problem here, we found that       
>  when the ref_div_max is 128, the diff value is smaller and the       
>  blank screen problem can be solved. We tested some other       
>  monitors and added log printing to the code. We found that this       
>  change did not affect those monitors, and in the analysis of the 
>  logs, we found that the solution with a smaller diff value    always 
> displayed normally.
>
>
> Changing the value of ref_div_max from 128 to 100 can solve the       
>  blank screen problem of some monitors, but it will also cause       
>  some normal monitors to go black, so is it a more reasonable       
>  solution to determine the value of ref_div_max according to the       
>  value of diff?
>
>
>    Nope, exactly that's just utterly nonsense.
>
>    What we could maybe do is to prefer a smaller ref_div over a larger 
>    ref_div, but I don't see how this will help you.
>
>    Regards,
>    Christian.
>
>
>      Thank you for taking the time to read my email.
>
>
> Best Regards.
>
> ----
>
>
>
>
>
>
>
> *主　题：*Re: [PATCH] drm:Fix the          blank screen problem of some 
> 1920x1080 75Hz monitors using          R520 graphics card
> *日　期：*2022-09-05 14:05
> *发件人：*Christian König
> *收件人：*钟沛alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net 
>
>
>
> Am 05.09.22 um 05:23 schrieb zhongpei:
>        > We found that in the scenario of AMD R520 graphics card
>        > and some 1920x1080 monitors,when we switch the refresh rate
>        > of the monitor to 75Hz,the monitor will have a blank screen   
>      problem,
>        > and the restart cannot be restored.After testing, it is       
>  found that
>        > when we limit the maximum value of ref_div_max to 128,
>        > the problem can be solved.In order to keep the previous       
>  modification
>        > to be compatible with other monitors,we added a judgment
>        > when finding the minimum diff value in the loop of the
>        > amdgpu_pll_compute/radeon_compute_pll_avivo function.
>        > If no diff value of 0 is found when the maximum value of     
>    ref_div_max
>        > is limited to 100,continue to search when it is 128,
>        > and take the parameter with the smallest diff value.
>
>        Well that's at least better than what I've seen in previous     
>    tries to fix
>        this.
>
>        But as far as I can see this will certainly break some other   
>      monitors,
>        so that is pretty much a NAK.
>
>        Regards,
>        Christian.
>
>        >
>        > Signed-off-by: zhongpei <zhongpei@kylinos.cn>
>        > ---
>        >   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17  +++++++++++++----
>        >   drivers/gpu/drm/radeon/radeon_display.c | 15  +++++++++++----
>        >   2 files changed, 24 insertions(+), 8 deletions(-)
>        >
>        > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c       
>  b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
>        > index 0bb2466d539a..0c298faa0f94 100644
>        > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
>        > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
>        > @@ -84,12 +84,13 @@ static void 
>  amdgpu_pll_reduce_ratio(unsigned *nom, unsigned *den,
>        >   static void amdgpu_pll_get_fb_ref_div(struct  amdgpu_device 
> *adev, unsigned int nom,
>        >        unsigned int den, unsigned int post_div,
>        >        unsigned int fb_div_max, unsigned int ref_div_max,
>        > -      unsigned int *fb_div, unsigned int *ref_div)
>        > +      unsigned int ref_div_limit, unsigned int *fb_div,
>        > +      unsigned int *ref_div)
>        >   {
>        >
>        >   /* limit reference * post divider to a maximum */
>        >   if (adev->family == AMDGPU_FAMILY_SI)
>        > - ref_div_max = min(100 / post_div, ref_div_max);
>        > + ref_div_max = min(ref_div_limit / post_div, ref_div_max);
>        >   else
>        >   ref_div_max = min(128 / post_div, ref_div_max);
>        >
>        > @@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct     
>  amdgpu_device *adev,
>        >   unsigned ref_div_min, ref_div_max, ref_div;
>        >   unsigned post_div_best, diff_best;
>        >   unsigned nom, den;
>        > + unsigned ref_div_limit, ref_limit_best;
>        >
>        >   /* determine allowed feedback divider range */
>        >   fb_div_min = pll->min_feedback_div;
>        > @@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct       
>  amdgpu_device *adev,
>        >   else
>        >   post_div_best = post_div_max;
>        >   diff_best = ~0;
>        > + ref_div_limit = ref_limit_best = 100;
>        >
>        >   for (post_div = post_div_min; post_div <=  post_div_max; 
> ++post_div) {
>        >   unsigned diff;
>        >   amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div,       
>  fb_div_max,
>        > -  ref_div_max, &fb_div, &ref_div);
>        > +  ref_div_max, ref_div_limit, &fb_div, &ref_div);
>        >   diff = abs(target_clock - (pll->reference_freq *       
>  fb_div) /
>        >   (ref_div * post_div));
>        >
>        > @@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct       
>  amdgpu_device *adev,
>        >
>        >   post_div_best = post_div;
>        >   diff_best = diff;
>        > + ref_limit_best = ref_div_limit;
>        >   }
>        > + if (post_div >= post_div_max && diff_best != 0        && 
> ref_div_limit != 128) {
>        > + ref_div_limit = 128;
>        > + post_div = post_div_min - 1;
>        > + }
>        > +
>        >   }
>        >   post_div = post_div_best;
>        >
>        >   /* get the feedback and reference divider for the optimal   
>      value */
>        >   amdgpu_pll_get_fb_ref_div(adev, nom, den, post_div,       
>  fb_div_max, ref_div_max,
>        > -  &fb_div, &ref_div);
>        > +  ref_limit_best, &fb_div, &ref_div);
>        >
>        >   /* reduce the numbers to a simpler ratio once more */
>        >   /* this also makes sure that the reference divider is       
>  large enough */
>        > diff --git a/drivers/gpu/drm/radeon/radeon_display.c       
>  b/drivers/gpu/drm/radeon/radeon_display.c
>        > index f12675e3d261..0fcbf45a68db 100644
>        > --- a/drivers/gpu/drm/radeon/radeon_display.c
>        > +++ b/drivers/gpu/drm/radeon/radeon_display.c
>        > @@ -925,10 +925,10 @@ static void 
>  avivo_reduce_ratio(unsigned *nom, unsigned *den,
>        >    */
>        >   static void avivo_get_fb_ref_div(unsigned nom, unsigned     
>    den, unsigned post_div,
>        >   unsigned fb_div_max, unsigned ref_div_max,
>        > - unsigned *fb_div, unsigned *ref_div)
>        > + unsigned ref_div_limit, unsigned *fb_div, unsigned       
>  *ref_div)
>        >   {
>        >   /* limit reference * post divider to a maximum */
>        > - ref_div_max = max(min(100 / post_div, ref_div_max), 1u);
>        > + ref_div_max = max(min(ref_div_limit / post_div,     
>  ref_div_max), 1u);
>        >
>        >   /* get matching reference and feedback divider */
>        >   *ref_div = min(max(den/post_div, 1u), ref_div_max);
>        > @@ -971,6 +971,7 @@ void radeon_compute_pll_avivo(struct     
>    radeon_pll *pll,
>        >   unsigned ref_div_min, ref_div_max, ref_div;
>        >   unsigned post_div_best, diff_best;
>        >   unsigned nom, den;
>        > + unsigned ref_div_limit, ref_limit_best;
>        >
>        >   /* determine allowed feedback divider range */
>        >   fb_div_min = pll->min_feedback_div;
>        > @@ -1042,11 +1043,12 @@ void  radeon_compute_pll_avivo(struct 
> radeon_pll *pll,
>        >   else
>        >   post_div_best = post_div_max;
>        >   diff_best = ~0;
>        > + ref_div_limit = ref_limit_best = 100;
>        >
>        >   for (post_div = post_div_min; post_div <=  post_div_max; 
> ++post_div) {
>        >   unsigned diff;
>        >   avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,
>        > -     ref_div_max, &fb_div, &ref_div);
>        > +     ref_div_max, ref_div_limit, &fb_div,  &ref_div);
>        >   diff = abs(target_clock - (pll->reference_freq *       
>  fb_div) /
>        >   (ref_div * post_div));
>        >
>        > @@ -1055,13 +1057,18 @@ void  radeon_compute_pll_avivo(struct 
> radeon_pll *pll,
>        >
>        >   post_div_best = post_div;
>        >   diff_best = diff;
>        > + ref_limit_best = ref_div_limit;
>        > + }
>        > + if (post_div >= post_div_max && diff_best != 0        && 
> ref_div_limit != 128) {
>        > + ref_div_limit = 128;
>        > + post_div = post_div_min - 1;
>        >   }
>        >   }
>        >   post_div = post_div_best;
>        >
>        >   /* get the feedback and reference divider for the optimal   
>      value */
>        >   avivo_get_fb_ref_div(nom, den, post_div, fb_div_max,       
>  ref_div_max,
>        > -     &fb_div, &ref_div);
>        > +     ref_limit_best, &fb_div, &ref_div);
>        >
>        >   /* reduce the numbers to a simpler ratio once more */
>        >   /* this also makes sure that the reference divider is       
>  large enough */
>
>

--------------IKOzY5m042kwfaF3cNkR4pXY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <blockquote type="cite">If the <strong>diff</strong> is smaller
      when the value of <strong>ref_div_max</strong> is 100, set the
      value of <strong>ref_div_max</strong> to 100. Otherwise, set the
      value of&nbsp;<strong style="white-space: normal;">ref_div_max</strong>
      to 128. In this way, the value of <strong>ref_div_max</strong>
      can be determined according to the value of <strong>diff</strong>,
      in order to adapt to all monitors. After our verification on
      different monitors, those monitors that have a blank screen
      problem when the value of <strong>ref_div_max</strong> is 100 or
      128 can work normally under this scheme.</blockquote>
    <br>
    Well sorry to say that, but once more: This approach is just blank
    nonsense!<br>
    <br>
    The problem with a larger reference/post dividers is that you your
    intermediate frequency becomes to large and the PLL starts to swing
    between two frequencies which are above and below the desired
    result.<br>
    <br>
    So a maximum ref_div of 128 is simply not acceptable for the
    hardware.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 14.09.22 um 04:17 schrieb 钟沛:<br>
    </div>
    <blockquote type="cite" cite="mid:2lsauak61dz-2lsc48dl37s@nsmail6.0">
      
      <p>Sorry to <span style="font-family: Arial, sans-serif;
          background-color: rgb(255, 255, 255); font-size: 16px; color:
          rgb(0, 0, 0);">trouble</span> you, we ran some tests on this
        patch and <span style="color: rgb(51, 51, 51); font-family:
          Arial, sans-serif; background-color: rgb(255, 255, 255);
          font-size: 16px;">want to communicate with you</span>.</p>
      <p><br>
      </p>
      <p><strong><span style="color: rgb(0, 0, 0);">static void
            amdgpu_pll_get_fb_ref_div(struct amdgpu_device *adev,
            unsigned&nbsp;nom,&nbsp;unsigned&nbsp;den, unsigned&nbsp;post_div,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(86, 156, 214);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0, 0);">unsigned</span></span>&nbsp;fb_div_max,
            unsigned&nbsp;<span style="background-color: rgb(255, 255, 0);
              color: rgb(0, 0, 0);">ref_div_max</span>,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(86, 156, 214);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0, 0);">unsigned</span></span>&nbsp;*fb_div,
            unsigned&nbsp;*ref_div)</span></strong></p>
      <p><strong>{</strong></p>
      <p><br>
      </p>
      <p><strong><span style="color: #6a9955;"> &nbsp; &nbsp;/* limit reference *
            post divider to a maximum */</span></strong></p>
      <p><strong><span style="color: #c586c0;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0);">if (adev-&gt;family ==
            AMDGPU_FAMILY_SI)</span></strong></p>
      <p><strong><span style="color: #9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0);"><span style="background-color:
              rgb(255, 255, 0);">ref_div_max</span> = min(100 /
            post_div, ref_div_max);</span></strong></p>
      <p><strong><span style="color: #c586c0;">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:
              rgb(0, 0, 0);">else</span></span></strong></p>
      <p><strong><span style="color: #9cdcfe;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="background-color: rgb(255, 255, 0); color: rgb(0,
              0, 0);">ref_div_max</span></span> = <span style="color:
            rgb(0, 0, 0);">min(128 / post_div, ref_div_max);</span></strong></p>
      <p><br>
      </p>
      <p><strong><span style="color: #6a9955;"> &nbsp; &nbsp;/* get matching
            reference and feedback divider */</span></strong></p>
      <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;*<span style="color: rgb(0, 0, 0);">ref_div =
            min(max(DIV_ROUND_CLOSEST(den, post_div), 1u), <span style="color: rgb(0, 0, 0); background-color: rgb(255,
              255, 0);">ref_div_max</span>);</span></strong></p>
      <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;*<span style="color: rgb(0, 0, 0);">fb_div =
            DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);</span></strong></p>
      <p><br>
      </p>
      <p><strong><span style="color: #6a9955;"> &nbsp; &nbsp;/* limit fb divider
            to its maximum */</span></strong></p>
      <p><strong><span style="color: #c586c0;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0);">if (*fb_div &gt; fb_div_max) {</span></strong></p>
      <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<span style="color: rgb(0, 0, 0);">ref_div =
            DIV_ROUND_CLOSEST(*ref_div * fb_div_max, *fb_div);</span></strong></p>
      <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<span style="color: rgb(0, 0, 0);">fb_div =
            fb_div_max;</span></strong></p>
      <p><strong>&nbsp;&nbsp;&nbsp;&nbsp;}</strong></p>
      <p><strong>}</strong></p>
      <p><br>
      </p>
      <p>For R520, the max value of the ref_div_max in this function
        used to be 128. In order to fix the black screen problem of some
        monitors, it was changed to 100. From the commit message at the
        time, we learned that this was a temporary solution. When the
        value of ref_div_max is 100, it will also cause problems with
        some monitors. &nbsp; &nbsp;</p>
      <p><br>
      </p>
      <p><strong><span style="color: rgb(0, 0, 0);">void
            amdgpu_pll_compute(struct amdgpu_device *adev,&nbsp;struct
            amdgpu_pll *pll, u32 freq, u32 *dot_clock_p,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32
            *fb_div_p,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32
            *frac_fb_div_p,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32
            *ref_div_p,</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;u32
            *post_div_p)</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">{</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;......<br>
          </span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;</span></strong></p>
      <p><span style="color: rgb(146, 208, 80);"><strong>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(118, 146, 60);">/* now search for a post
              divider */</span></strong></span></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(197, 134, 192);">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">if</span></span> (pll-&gt;flags &amp;
            AMDGPU_PLL_PREFER_MINM_OVER_MAXP)</span></strong></p>
      <p><span style="color: rgb(0, 0, 0);"><strong><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">post_div_best</span></span> = <span style="color:
              rgb(0, 0, 0);">post_div_min</span>;</strong></span></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;else</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">post_div_best</span></span> = post_div_max;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">diff_best</span></span> = ~0;</span></strong></p>
      <p><br>
      </p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(197, 134, 192);">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">for</span></span> (post_div = post_div_min;
            post_div &lt;= post_div_max; ++post_div) {</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(86, 156, 214);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0,
                0, 0);">unsigned</span></span> diff;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(220, 220, 170);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:
                rgb(0, 0, 0);">amdgpu_pll_get_fb_ref_div</span></span>(adev,
            nom, den, post_div, fb_div_max,</span></strong></p>
      <p><span style="color: rgb(0, 0, 0);"><strong><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0, 0);">ref_div_max</span></span>,
            &amp;<span style="color: rgb(0, 0, 0); background-color:
              rgb(255, 255, 0);">fb_div</span>, &amp;<span style="color:
              rgb(0, 0, 0); background-color: rgb(255, 255, 0);">ref_div</span></strong></span><strong><span style="color: rgb(0, 0, 0);"><span style="color: rgb(156,
              220, 254);"></span>);</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: rgb(0, 0, 0); background-color: rgb(255,
              255, 0);"><span style="background-color: rgb(255, 255, 0);
                color: rgb(0, 0, 0);">diff</span> = abs(target_clock -
              (pll-&gt;reference_freq * fb_div) /</span></span></strong></p>
      <p><span style="background-color: rgb(255, 255, 0);"><strong><span style="background-color: rgb(255, 255, 0); color: rgb(0,
              0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ref_div * post_div));</span></strong></span></p>
      <p><br>
      </p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(197, 134, 192);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:
                rgb(0, 0, 0);">if</span></span> (diff &lt; diff_best ||
            (diff == diff_best &amp;&amp;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;!(pll-&gt;flags
            &amp; AMDGPU_PLL_PREFER_MINM_OVER_MAXP))) {</span></strong></p>
      <p><br>
      </p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:
                rgb(0, 0, 0);">post_div_best</span></span> = post_div;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:
                rgb(0, 0, 0);">diff_best</span></span> = diff;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;}</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);"><span style="color:
              rgb(156, 220, 254);">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: rgb(0, 0,
                0);">post_div</span></span> = post_div_best;</span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;......<br>
          </span></strong></p>
      <p><strong><span style="color: rgb(0, 0, 0);">}</span></strong></p>
      <p><br>
      </p>
      <p>This piece of code in the above function is to find a post_div,
        so that the value of <strong><span style="background-color:
            rgb(255, 255, 0);">diff = abs(target_clock -
            (pll-&gt;reference_freq * fb_div) /(ref_div * post_div))</span></strong>
        is the smallest. The pixel clock closest to the target frequency
        when the value of the <strong>diff</strong> is the smallest.
        The values of the reference divider(<strong>ref_div</strong>)
        and feedback divider(<strong>fb_div</strong>) in the above
        formula are affected by <strong>ref_div_max</strong>, so when
        the value of <strong>ref_div_max</strong> is different, the
        value of <strong>diff</strong> may also be different. The
        larger value of <strong>diff</strong> may cause the blank
        screen problem of some monitors.</p>
      <p><br>
      </p>
      <p>A value of 100 or 128 for <strong>ref_div_max</strong> is not
        suitable for all monitors. So we set it to 100 and 128 in turn
        to calculate the corresponding ref_div and fb_div values, and
        then calculate <span style="background-color: rgb(255, 255,
          0);"><strong>diff = abs(target_clock - (pll-&gt;reference_freq
            * fb_div) /(ref_div * post_div))</strong></span>. If the <strong>diff</strong>
        is smaller when the value of <strong>ref_div_max</strong> is
        100, set the value of <strong>ref_div_max</strong> to 100.
        Otherwise, set the value of&nbsp;<strong style="white-space: normal;">ref_div_max</strong>
        to 128. In this way, the value of <strong>ref_div_max</strong>
        can be determined according to the value of <strong>diff</strong>,
        in order to adapt to all monitors. After our verification on
        different monitors, those monitors that have a blank screen
        problem when the value of <strong>ref_div_max</strong> is 100
        or 128 can work normally under this scheme.</p>
      <p><br>
      </p>
      <p>We believe that temporarily adopting this method to replace the
        previous method can improve the compatibility of the graphics
        card.</p>
      <p><br>
      </p>
      <p><span style="color: rgb(18, 18, 18); font-family:
          -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;,
          &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;,
          &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;,
          &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size:
          medium; background-color: rgb(255, 255, 255);">Best Regards.</span><br>
      </p>
      <p>----</p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
      </p>
      <p><br>
        <br>
        <br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: 回复: Re: [PATCH]
          drm:Fix the blank screen problem of some 1920x1080 75Hz
          monitors using R520 graphics card</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>日　期：</strong><span id="date">2022-09-05 19:12</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>发件人：</strong><span id="from">Christian König</span> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        <strong>收件人：</strong><span id="to" style="">钟沛<a class="moz-txt-link-abbreviated" href="mailto:alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net">alexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net</a></span>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Am 05.09.22 um 10:10 schrieb 钟沛:<br>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Thanks for your reply!</p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p>We found that in the amdgpu_pll_compute function, when the &nbsp; &nbsp;
        &nbsp; &nbsp;target_clock is the value contained in the drm_dmt_modes
        defined &nbsp; &nbsp; &nbsp; &nbsp;in drm_edid.c, the diff is 0. When target_clock
        is some special &nbsp; &nbsp; &nbsp; &nbsp;value, we cannot find a diff value of 0,
        so we need to find the &nbsp; &nbsp; &nbsp; &nbsp;smallest diff value to fit the
        current target_clock. For the &nbsp; &nbsp; &nbsp; &nbsp;monitor that has the blank
        screen problem here, we found that &nbsp; &nbsp; &nbsp; &nbsp;when the ref_div_max
        is 128, the diff value is smaller and the &nbsp; &nbsp; &nbsp; &nbsp;blank screen
        problem can be solved. We tested some other &nbsp; &nbsp; &nbsp; &nbsp;monitors and
        added log printing to the code. We found that this &nbsp; &nbsp; &nbsp; &nbsp;change
        did not affect those monitors, and in the analysis of the &nbsp; &nbsp; &nbsp;
        &nbsp;logs, we found that the solution with a smaller diff value &nbsp; &nbsp;
        &nbsp; &nbsp;always displayed normally.</p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p>Changing the value of ref_div_max from 128 to 100 can solve the
        &nbsp; &nbsp; &nbsp; &nbsp;blank screen problem of some monitors, but it will also
        cause &nbsp; &nbsp; &nbsp; &nbsp;some normal monitors to go black, so is it a more
        reasonable &nbsp; &nbsp; &nbsp; &nbsp;solution to determine the value of ref_div_max
        according to the &nbsp; &nbsp; &nbsp; &nbsp;value of diff?</p>
      <p><br>
        &nbsp; &nbsp;Nope, exactly that's just utterly nonsense.<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;What we could maybe do is to prefer a smaller ref_div over a
        larger &nbsp; &nbsp;ref_div, but I don't see how this will help you.<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;Regards,<br>
        &nbsp; &nbsp;Christian.<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp;Thank you&nbsp;for taking the time to&nbsp;read&nbsp;my&nbsp;email.</p>
      <p><span class="qkunPe" style="color: rgb(234, 67, 53);
          font-family: arial, sans-serif; font-size: 14px;
          background-color: rgb(255, 255, 255);"></span></p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p><span style="color: rgb(18, 18, 18); font-family:
          -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;,
          &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;,
          &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;,
          &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size:
          medium; background-color: rgb(255, 255, 255);">Best Regards.</span></p>
      <p>----</p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><strong>主　题：</strong><span id="subject">Re: [PATCH] drm:Fix the
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;blank screen problem of some 1920x1080 75Hz monitors
          using &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;R520 graphics card</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<strong>日　期：</strong><span id="date">2022-09-05 14:05</span>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<strong>发件人：</strong><span id="from">Christian König</span>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<strong>收件人：</strong><span id="to">钟沛<a class="moz-txt-link-abbreviated" href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fmailto%3Aalexander.deucher%2540amd.comXinhui.Pan%2540amd.comairlied%2540linux.iedaniel%2540ffwll.chisabbasso%40riseup.net%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C94ab5e57da8b451176f908da95f7fcf9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637987189601606163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ZkNuIflAQ12Bm3%2BurKxfOQTpITleiUsbsIfF9ZJSM%2FA%3D&amp;reserved=0" originalsrc="http://mailto:alexander.deucher%40amd.comXinhui.Pan%40amd.comairlied%40linux.iedaniel%40ffwll.chisabbasso@riseup.net/" shash="WjYVAu3ZQMyl6tlciH/b2aVICW+vhtdk6stIL1yQYeTv8KBAq4KpAFpV0bD2BqDArspQPVU+BpUFyS7pWlA1qrRsI6OOmrKbJo2z2CpfghTDvgsgoYOSdTy9BSPe3qk4TFknyC6LFc7UY62MP1b/1KRmzGN9ZCImDjAO7B/hdGI=" target="_blank" moz-do-not-send="true">a
 lexander.deucher@amd.comXinhui.Pan@amd.comairlied@linux.iedaniel@ffwll.chisabbasso@riseup.net</a></span>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</p>
      <p>Am 05.09.22 um 05:23 schrieb zhongpei:<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; We found that in the scenario of AMD R520 graphics
        card<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; and some 1920x1080 monitors,when we switch the
        refresh rate<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; of the monitor to 75Hz,the monitor will have a blank
        screen &nbsp; &nbsp; &nbsp; &nbsp;problem,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; and the restart cannot be restored.After testing, it
        is &nbsp; &nbsp; &nbsp; &nbsp;found that<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; when we limit the maximum value of ref_div_max to
        128,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; the problem can be solved.In order to keep the
        previous &nbsp; &nbsp; &nbsp; &nbsp;modification<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; to be compatible with other monitors,we added a
        judgment<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; when finding the minimum diff value in the loop of
        the<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; amdgpu_pll_compute/radeon_compute_pll_avivo
        function.<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; If no diff value of 0 is found when the maximum
        value of &nbsp; &nbsp; &nbsp; &nbsp;ref_div_max<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; is limited to 100,continue to search when it is 128,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; and take the parameter with the smallest diff value.<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;Well that's at least better than what I've seen in
        previous &nbsp; &nbsp; &nbsp; &nbsp;tries to fix <br>
        &nbsp; &nbsp; &nbsp; &nbsp;this.<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;But as far as I can see this will certainly break some
        other &nbsp; &nbsp; &nbsp; &nbsp;monitors, <br>
        &nbsp; &nbsp; &nbsp; &nbsp;so that is pretty much a NAK.<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;Regards,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;Christian.<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; Signed-off-by: zhongpei <a class="moz-txt-link-rfc2396E" href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fmailto%3Azhongpei%40kylinos.cn%2F&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C94ab5e57da8b451176f908da95f7fcf9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637987189601606163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=It0YaVWezxvNcHp02iJntHICSbVgOwComdVFIyhvxrs%3D&amp;reserved=0" originalsrc="http://mailto:zhongpei@kylinos.cn/" shash="STLXCD6nT51SVzv5h9CPQAew54tBBRTqc3cLpwRB01H6+iLfOgI3MAudH7aoQUia3g99TzGf/oQwBb0TKdszJrH3Cr7oKQqNxY5/03qJTVrETeNDIAHd7HTEMKtCuay+9S0TIqhqxFqL04udscBlJ6DZgY8sXdpHee/Ui7Ytmyg=" target="_blank" moz-do-not-send="true">&lt;zhongpei@kylinos.cn&gt;</a><br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; ---<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c | 17 &nbsp; &nbsp; &nbsp;
        &nbsp;+++++++++++++----<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; drivers/gpu/drm/radeon/radeon_display.c | 15 &nbsp; &nbsp; &nbsp;
        &nbsp;+++++++++++----<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; 2 files changed, 24 insertions(+), 8 deletions(-)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c
        &nbsp; &nbsp; &nbsp; &nbsp;b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; index 0bb2466d539a..0c298faa0f94 100644<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -84,12 +84,13 @@ static void &nbsp; &nbsp; &nbsp;
        &nbsp;amdgpu_pll_reduce_ratio(unsigned *nom, unsigned *den,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; static void amdgpu_pll_get_fb_ref_div(struct &nbsp; &nbsp; &nbsp;
        &nbsp;amdgpu_device *adev, unsigned int nom,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int den, unsigned int post_div,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp;unsigned int fb_div_max, unsigned int
        ref_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; &nbsp;unsigned int *fb_div, unsigned int *ref_div)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp;unsigned int ref_div_limit, unsigned int
        *fb_div,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; &nbsp;unsigned int *ref_div)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* limit reference * post divider to a maximum */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; if (adev-&gt;family == AMDGPU_FAMILY_SI)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - ref_div_max = min(100 / post_div, ref_div_max);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_max = min(ref_div_limit / post_div,
        ref_div_max);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; else<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; ref_div_max = min(128 / post_div, ref_div_max);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -136,6 +137,7 @@ void amdgpu_pll_compute(struct &nbsp;
        &nbsp; &nbsp; &nbsp;amdgpu_device *adev,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned ref_div_min, ref_div_max, ref_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned post_div_best, diff_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned nom, den;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + unsigned ref_div_limit, ref_limit_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* determine allowed feedback divider range */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; fb_div_min = pll-&gt;min_feedback_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -204,11 +206,12 @@ void amdgpu_pll_compute(struct
        &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_device *adev,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; else<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div_best = post_div_max;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff_best = ~0;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_limit = ref_limit_best = 100;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; for (post_div = post_div_min; post_div &lt;= &nbsp; &nbsp; &nbsp;
        &nbsp;post_div_max; ++post_div) {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned diff;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; amdgpu_pll_get_fb_ref_div(adev, nom, den,
        post_div, &nbsp; &nbsp; &nbsp; &nbsp;fb_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp;ref_div_max, &amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp;ref_div_max, ref_div_limit, &amp;fb_div,
        &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff = abs(target_clock - (pll-&gt;reference_freq
        * &nbsp; &nbsp; &nbsp; &nbsp;fb_div) /<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; (ref_div * post_div));<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -217,13 +220,19 @@ void amdgpu_pll_compute(struct
        &nbsp; &nbsp; &nbsp; &nbsp;amdgpu_device *adev,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div_best = post_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff_best = diff;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_limit_best = ref_div_limit;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + if (post_div &gt;= post_div_max &amp;&amp;
        diff_best != 0 &nbsp; &nbsp; &nbsp; &nbsp;&amp;&amp; ref_div_limit != 128) {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_limit = 128;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + post_div = post_div_min - 1;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; +<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div = post_div_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* get the feedback and reference divider for the
        optimal &nbsp; &nbsp; &nbsp; &nbsp;value */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; amdgpu_pll_get_fb_ref_div(adev, nom, den,
        post_div, &nbsp; &nbsp; &nbsp; &nbsp;fb_div_max, ref_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp;&amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp;ref_limit_best, &amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* reduce the numbers to a simpler ratio once more
        */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* this also makes sure that the reference divider
        is &nbsp; &nbsp; &nbsp; &nbsp;large enough */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; diff --git a/drivers/gpu/drm/radeon/radeon_display.c
        &nbsp; &nbsp; &nbsp; &nbsp;b/drivers/gpu/drm/radeon/radeon_display.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; index f12675e3d261..0fcbf45a68db 100644<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; --- a/drivers/gpu/drm/radeon/radeon_display.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; +++ b/drivers/gpu/drm/radeon/radeon_display.c<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -925,10 +925,10 @@ static void &nbsp; &nbsp; &nbsp;
        &nbsp;avivo_reduce_ratio(unsigned *nom, unsigned *den,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; &nbsp;*/<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; static void avivo_get_fb_ref_div(unsigned nom,
        unsigned &nbsp; &nbsp; &nbsp; &nbsp;den, unsigned post_div,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned fb_div_max, unsigned ref_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - unsigned *fb_div, unsigned *ref_div)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + unsigned ref_div_limit, unsigned *fb_div, unsigned
        &nbsp; &nbsp; &nbsp; &nbsp;*ref_div)<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* limit reference * post divider to a maximum */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - ref_div_max = max(min(100 / post_div,
        ref_div_max), 1u);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_max = max(min(ref_div_limit / post_div, &nbsp;
        &nbsp; &nbsp; &nbsp;ref_div_max), 1u);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* get matching reference and feedback divider */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; *ref_div = min(max(den/post_div, 1u),
        ref_div_max);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -971,6 +971,7 @@ void
        radeon_compute_pll_avivo(struct &nbsp; &nbsp; &nbsp; &nbsp;radeon_pll *pll,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned ref_div_min, ref_div_max, ref_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned post_div_best, diff_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned nom, den;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + unsigned ref_div_limit, ref_limit_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* determine allowed feedback divider range */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; fb_div_min = pll-&gt;min_feedback_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -1042,11 +1043,12 @@ void &nbsp; &nbsp; &nbsp;
        &nbsp;radeon_compute_pll_avivo(struct radeon_pll *pll,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; else<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div_best = post_div_max;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff_best = ~0;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_limit = ref_limit_best = 100;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; for (post_div = post_div_min; post_div &lt;= &nbsp; &nbsp; &nbsp;
        &nbsp;post_div_max; ++post_div) {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; unsigned diff;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; avivo_get_fb_ref_div(nom, den, post_div,
        fb_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; ref_div_max, &amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; ref_div_max, ref_div_limit, &amp;fb_div, &nbsp; &nbsp; &nbsp;
        &nbsp;&amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff = abs(target_clock - (pll-&gt;reference_freq
        * &nbsp; &nbsp; &nbsp; &nbsp;fb_div) /<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; (ref_div * post_div));<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; @@ -1055,13 +1057,18 @@ void &nbsp; &nbsp; &nbsp;
        &nbsp;radeon_compute_pll_avivo(struct radeon_pll *pll,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div_best = post_div;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; diff_best = diff;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_limit_best = ref_div_limit;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + if (post_div &gt;= post_div_max &amp;&amp;
        diff_best != 0 &nbsp; &nbsp; &nbsp; &nbsp;&amp;&amp; ref_div_limit != 128) {<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + ref_div_limit = 128;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + post_div = post_div_min - 1;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; }<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; post_div = post_div_best;<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* get the feedback and reference divider for the
        optimal &nbsp; &nbsp; &nbsp; &nbsp;value */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; avivo_get_fb_ref_div(nom, den, post_div,
        fb_div_max, &nbsp; &nbsp; &nbsp; &nbsp;ref_div_max,<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; - &nbsp; &nbsp; &amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; + &nbsp; &nbsp; ref_limit_best, &amp;fb_div, &amp;ref_div);<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; <br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* reduce the numbers to a simpler ratio once more
        */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;&gt; &nbsp; /* this also makes sure that the reference divider
        is &nbsp; &nbsp; &nbsp; &nbsp;large enough */<br>
        &nbsp; &nbsp; &nbsp; &nbsp;<br>
        &nbsp; &nbsp; &nbsp;</p>
      <p><br>
        &nbsp;</p>
    </blockquote>
    <br>
  </body>
</html>

--------------IKOzY5m042kwfaF3cNkR4pXY--
