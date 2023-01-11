Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C2D665C5A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2228C10E743;
	Wed, 11 Jan 2023 13:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F1F10E740;
 Wed, 11 Jan 2023 13:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg/SweGgrf1Oj/8j17Qea6dCPzQMM8H3JVR7njjC2UMWgBbtG0srBcPms97vtonbpmq7Zp/4wHRwa4FAeDHCvEEH5oajThuCwMGvk/QLp8DQXyL7iUHz+tXko47tMUcZ8BNF3x449hXZQfqBsPvqnGb7TjNbOUaI6zDI+6BOuXXtn1x3zqrJr+/coYfXOmYPH/gmXMcXjVk8v3RNhf4ohYfG5yArqiofUwbxdLDun+SxAMzXhFDf7Z5hN2k+9luhbM5slvCBYqwKbui64sRxIheDDLYvQSV5EB3s5nD/mPHxpD8ZhLe+SKCxCYxLYMY8Jf8yf0GoIL44poaScCHhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPkJwrVl8aR/83RGOdvbGBbVcOhNSrY/m5MkGaQPEss=;
 b=HwL1yIq4CYzJdPn3sEbHaFyyqkxpVg31+L+ytIHPA3VLaIHavUm6P6HCy6F0/oM+Gs8GlxYkopSUfFsmE8x3asS8tWtuNNuHcvFnFA1nDTDFltIMzwuFn3ScEh0VGI5tWj4tXNsnShioCLd8M3BnNWl6BbnFDzN4obAsxkiogtpDr/Nqx0w3G23APEoNdIg57uEhRs6AyXhsRLB1Jl5cX3cg22x0ai3B6B9m/1PZ9eK2EfNgnwsF/7TQObSjEuDFzrHgnaoCOwmdYPczVwVMFXM4k9uz9qcU938vbL7i5R9xZ89lFfjDZaXtGz/g0AbzBOdv0Xor+WoFOLZyGNnExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPkJwrVl8aR/83RGOdvbGBbVcOhNSrY/m5MkGaQPEss=;
 b=c5gERRAcvCgh46fX87q3/BrreOQGy3j+0h53rajq2mTE5/DtWOVfFmCe6xoJP34a/B4Enbt6KRZmsNu1ZeUiasnO17Knd/eyylntEue/Jfr0PuF5KpTXOk0kHrqFw3kLvxdyTc0395lZB5URm27RcVZUsZJg/xKRmq66rXcNsnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB7852.namprd12.prod.outlook.com (2603:10b6:8:147::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:21:36 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 13:21:35 +0000
Message-ID: <d92c4dfc-065f-f062-2b0e-0ce9db879d70@amd.com>
Date: Wed, 11 Jan 2023 14:21:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/10] drm/amdgpu: Do not include <drm/drm_fb_helper.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com,
 sam@ravnborg.org, f.fainelli@gmail.com, james.qian.wang@arm.com,
 liviu.dudau@arm.com
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-8-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230111130206.29974-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 20466a5f-55a5-4d00-978a-08daf3d6c390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVV3EjESAXoSfFbfFTOBPFwWP8I5PtlgTccfQ4tHrX9gJ/YTY/yZU1V8igZRCxmND0LlJ/iNtlMQqNLOMARwaV0jTy525qJQBcrKQcqn3eCTCyCFRU7/3BE1XpkZjbxD5bBXb5eSzUFppMwXFlstqil/N+eglwXvFGFHrwTIOZEPAWtEqyAz5yUwq39VFlFoGJtW+UbZVVwuppquv+stmMHOQR0FQTJtg/AdMCNbY4ogZCQ7I2PlmtOz8GU1GGJHZX0tswNp082RCzGRhhklJeWd3PdWXKZaF6DG5JH4mpI485owLpJDQBdEd/SPnQo7og/Hrr8HWhU28MoxF9c8x1IcRaNylhaWOEJZrzgIz8UDsGeiO0jntaCilJ2LDIqWqoWpKaBEWJPv0M8uXs8lM38ziF0B1gRBfkEfxZDm+yfWfwudndkyLPIiqZs4gd0RcKI7brPdL0rLjpW3tgKCmFZrLHEsOzKMwqmMmJAPJnaZbn72Z5++4rmImJiuHhX+cZ/S4pasS9RNDQG0162Bkwm+e5Tjq7H4Jx70GRpEk24HrY+rx0LpyIKU82KVwHyo2iuaEVYuXulCRsoFVZlClBrLuY5BwScwfUBHuqxqy0P5owlakzfeVgv5rdJFOwdwTnYCTD7NYFCJjppszRnQWbMmA5rPKorfKocUSWJb0u7e7BDeilVnMEUew6Jjax2yDlxPFo+XWAoJbdaZG7L1Pef9erivNX7pwmfLwbrS9rMoL0PW1VCDI3PnQg9XS4it
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(2906002)(83380400001)(2616005)(66556008)(7416002)(66476007)(66946007)(921005)(5660300002)(8936002)(6666004)(36756003)(186003)(6506007)(6512007)(31686004)(6486002)(478600001)(38100700002)(41300700001)(8676002)(86362001)(316002)(4326008)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFNLV0ltUDl5YXNmVlAwd29ncTZuSzN1Sjlqc2ZLUDlIVWJ0Q0E3U3RLOGcr?=
 =?utf-8?B?SWRrSTlVRTFmQnUrZ3lBZjNwQ0E5SGFGdCt5T0gyajROclNZTmQxQWFpVTdY?=
 =?utf-8?B?cUJWTE56a01sVlh3SUYvZWNFVUh3bnZmL25YTGh6SCtUSTh5aFJSREdtMmRR?=
 =?utf-8?B?L0xDNlV0T0pJQkh4NDZTVGtQTzBOdjJmL0d2em9DcGpLM2JNNXV2VC9EL1Nh?=
 =?utf-8?B?dEY0U1N1WGg3UzFPOU9seGE4d1M2Rm5FQmUvZUtnbkVxMUVRdHlyT0RYVENx?=
 =?utf-8?B?K21UdWhnV0JQMm0rMFFtNGRXVGRoL3B0TWxVR0gvYVF3TmQveXN2VFNTWW9v?=
 =?utf-8?B?OXhKUXcvaytYMlF6ZzVtUzNSVnlUWlFaZDE4c3BhMlhUMzF4QitJUStmbmFJ?=
 =?utf-8?B?MCtiRlBJa0hxRUNqR0ZsTWFxVDIwWkkxMzRSdmFQQUJHRVAzTkwyMkpyMy9j?=
 =?utf-8?B?SE1NWU5TMGJwdWtRUElxSjhZMkxIUS8ydVovZHFPN1BSSGFjcmdLdC9BNXFB?=
 =?utf-8?B?Y2lJNGpacTBBVFZFbWV0Q0RZSERDZmtIMUV4M1ZmcEZEQU5vRHVleEhWY3E0?=
 =?utf-8?B?OEFGU2ZWUlk3NzNJdXBQWldoendUdjZDTitKazRTNUdpNEwvWDBSSithdjVo?=
 =?utf-8?B?aTI3bit0eUVBV1lBZG5aTHZSOEcxbWFmenZjNGhiRkQydWJuN3FqUnljRm4y?=
 =?utf-8?B?ZWZsMTF1ZGlNZlpQMzE1TlZDOU1mR2FISnh4dXhoMGtuTU44Rk5yTytiUzBL?=
 =?utf-8?B?U3NNWTJpaWRHYUU4ZXlPMUs3WFlMS3hRUm5NRm55N3YrNlpaeFpLSjd6djBy?=
 =?utf-8?B?cUVSdEVLVGZlc3VpUXpFejJqVzl5WkhiclI0aWpaclM2Q2JRcmVLVFJVd0ZO?=
 =?utf-8?B?Zmc3bXBUa3ZXMEUvTjFrRFlHekpqSXJWRG9ZQ1d5STA1ZXNDN01XWk5VTStV?=
 =?utf-8?B?Znp3dFVhM3BnVE1nbFJFNVRBK2tNK2RUbWgvQmFkMGxuTXZQOWxEeUVhRlAy?=
 =?utf-8?B?a01uc2ovTzR2OG9KUFFWT0k5VlhwTm5KMEYxemJkWWxnWUJSNy8rVWdVSmFq?=
 =?utf-8?B?Y1cvaGZITWg1NkFjVEZMQ2daTXA2cmtINlpYbVJ0SWFyUDRqbTFrQkZUbGwz?=
 =?utf-8?B?OCtsb2xhTElldUEwa1luZk42M0ZEdVFPMVJKdldxNHVleWpOOVovYXN0UnI1?=
 =?utf-8?B?MGYxd3Vqc2lmOXIxM2dIVlJwMkVSY2prWFRLMVcyVlBVYzFYM1lrMHVjTkVD?=
 =?utf-8?B?aGNWaEFVUFJnRUdGcXE5SklBSkxMclV5QnlrRmxJZENaQytXV0ZRQXhHTXRk?=
 =?utf-8?B?MTMzNXltb0J2RlZMYk56bGZOQllublBQMWhuT3pneS9UQ1U5NEtwdWpKMzk5?=
 =?utf-8?B?bWpCSXp4eElFZ2lFNWlSK0xCZERpKzY1NjFJTWpJblQwWldWUk5JNm9jMXB2?=
 =?utf-8?B?Z0p2Q3BHdmtGNE5KM0hXUFVHOG5kaTY5U3dPdzl3c04yL1ZqdmN4MkxzUFNF?=
 =?utf-8?B?NkpveGs5T0VUQ2NyR3FKRm0wcTZiZFVLVXFZc0dVdlJJb3pvb0VCT05XdjY3?=
 =?utf-8?B?aE45Vng0eVEyTHZpRGIzT3BQbmFtVzdINHN2eGhRdm9WN29hZCtQNVJxZ3U5?=
 =?utf-8?B?YjlBMTlyKzVGeHdVVDdja0R6V1krKysra3YvY0VMY3AyblFRcUs4ZE5RN2RT?=
 =?utf-8?B?N0pSc2R6ZmpEUG40RVEyZ1c2eXI5VS8xKzk4enFkYS9KVXlCZkZPd2JNNWl2?=
 =?utf-8?B?dW1DdEU2Y0lydVUxdnFlTVYwZHJnUFl4QXBvNkI4ZjZuRlFoc1ptTUZwWDRo?=
 =?utf-8?B?WUpaOVFWczl0dktMcXlMUVhyMzNuNVptZi9SbmpxS1d5VG5pZXRuaUc1M0l1?=
 =?utf-8?B?dE1SZ3BzeVdWdEd5MGg3NFJrTHg5TllQZUMwQUYzVmFDcTJXVVRWRUt6MFdU?=
 =?utf-8?B?cVNUMCtWV1VnMWlrYnNxcnhSeDkrWVhEWXY1KzVkOHp2NGx1L1RkVlJtNUxn?=
 =?utf-8?B?T1hoWnlycW5URUdZYWZxc1NqWnBPd1ZLd2NXMVJNVHNTR2xKdHVhMlBER2xx?=
 =?utf-8?B?L0lFclVOYVNPWWtYQ1YrQWIzcllPdDA1LzZzVUJaNGg1SWY2d0JQVzg2Rmw4?=
 =?utf-8?B?TVFyTXg0SklDMlZVNU4xZXl0YXpLK2ZyWkpOSjNYZVB6MU1TTHA5VUhHbDAz?=
 =?utf-8?Q?nny0Uqv69YFMxnD8FmwArjkU6KCW0Bl4Lnl3QCPPeHCQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20466a5f-55a5-4d00-978a-08daf3d6c390
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:21:35.8586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6hSdHYdYDQvKsn02ejYxP3TtFMHDz5XGydmFI3/dT9CyMHSqk1fC35SHgXJud1R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7852
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
Cc: linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.23 um 14:02 schrieb Thomas Zimmermann:
> Including <drm/drm_fb_helper.h> is not required, so remove the include
> statements. No functional changes.

Reviewed-by: Christian König <christian.koenig@amd.com> for this one and 
the radeon patches #9 and #10 in this set.

Do you want to push them to drm-misc-next because of some 
inter-dependencies or should I pick them up through amd-staging-drm-next?

Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c | 1 -
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c | 1 -
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 1 -
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 1 -
>   4 files changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index 248f1a4e915f..a2452fc304c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -21,7 +21,6 @@
>    *
>    */
>   
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_vblank.h>
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index cd9c19060d89..6ac680c4c6e2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -21,7 +21,6 @@
>    *
>    */
>   
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_vblank.h>
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 76323deecc58..354ae09cc9a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -23,7 +23,6 @@
>   
>   #include <linux/pci.h>
>   
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_vblank.h>
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 01cf3ab111cb..33977b0ba19d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -21,7 +21,6 @@
>    *
>    */
>   
> -#include <drm/drm_fb_helper.h>
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_vblank.h>
>   

