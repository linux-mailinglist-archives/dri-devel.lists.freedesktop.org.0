Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F4367887E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5510E57A;
	Mon, 23 Jan 2023 20:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938CE10E567;
 Mon, 23 Jan 2023 20:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVVij8BcR8yq68qblATSreRVEfEJdhGBN1iKa+9bPkjFvUi6tKXYDjI8Ljh8FHIooc3GvuKT+MqCoqTlsAH9PQZWZbj/Nt49k6oovINdkH8YWyXKEDrxSCdSeRTzHsBVWNOM6u4G93Te5DcaLXYD7zAhvLkY/0LVIFG8+qHrkJZvrj09IOysQjjOeizRu2G7WT+Xz861UCQI49tXfIASLoEZBpMx661zq+nbRm1Turd4B36CSJ7tea3ecURuPC+cxswInKWTNLaBKCnOlbSC1fOWGpi1TQJLz5SrjUzqfRjlb5iVXhOSqnIZZ/eHselNm1BNqp5L0G4Hu1PisFw2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4jkzSAlpYGlWTpP2i8a7YIzArn+CSMmSOuDKji8dSI=;
 b=AlaBi6PZX/4tm+ciyHrIfEaGuojjsa+ZXhHy4RLLLnJQXq1C3x5wfGxgEOeoyeuz+B7o0R4JnIDPv2YL8YDEBSobLECNOM9RpiRBUxztrub6HYsrSwZAiJm6WpWCpGToOZJcN17EqS2nUv7Y3B7P4ngNp9GwscgayLs/FcPA4GaV1HkqQJAshL8GQtmOAykT7oUtk5JQyByxgJYJiXI/QPf/g2g6A02lO5aDJulRg/OUadjqQ9vV2WPpmer0fj8GyxOCqRsFOjeHvN3UDMSDQRb5URbzOyu2/QDLm3Ed0MOmD/2j8W4Io//zOUcE4y/SlDHpe1PcryEIkaP0Nl2yQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4jkzSAlpYGlWTpP2i8a7YIzArn+CSMmSOuDKji8dSI=;
 b=RYcal2W3Gvie6braoFBZQPXNd3MIsPyC/AyDFfJPYz3Ew3wexJHr3veCygbzC4TWhmfCoss+5G+Y+qxc1WlJ6JWu4vrPYqxoUrVydkubHHOM3pnKlK6+vQdNH0TYWPdlJJU9Z8XomdaPTjf4LXgkniNRpyz970bsS8kwOahFH0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 20:38:18 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 20:38:18 +0000
Message-ID: <37e78013-5ed6-e80f-4a1c-1e61bed59735@amd.com>
Date: Mon, 23 Jan 2023 21:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] drm: Create documentation about device resets
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230123202646.356592-1-andrealmeid@igalia.com>
 <20230123202646.356592-2-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230123202646.356592-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: e819c14f-3f70-49ab-8f13-08dafd81c29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dy3mE0fUEVpvhHiJmTzs1XTTRW4HvQcvoUUJtZ5TVgk5xT2vDdGSzrZpQHrIkMwyou2Oqx3VeodIKigC7oV1SnX83H9F7GBGhaAZyMBmOAD6V924BVMtp+1759UMOZPQTApwwXg1wHMHUGiwCwl+cxRK4syuIuOezUFprUra6ysQCQh8szQlfY/k7FSUBTuvEUUnkUhljoWippbVbIoh61JmbC7FugD3jD4eVCcMX0nSEy1qK78eWHumtRnAov1PIXGqNXFGVaHQizYm3rVe1bGfJA1ctMxKxW28yTRnB3i+/kWS1rx6B2IuI7ECrwtIz0WSsy8CZLZva5meAhezb7idxveZm1i944/JwSLt5mLxpJ8lj4FCCsnPtimAemieO+5WH3/6KVIy2C656lZlqFobNd1OBPnO9yVtedvUdJDX8j9i/uHoQaqLxgu0uymx7Ab00l0e8oyPzC0imm+U5MeJV5TY+BNhRofL+Qef2g5QBSMWTAmbdu4TLGt/GMuzaTsNUgBVk5aCA4Pd78HtCd3wZt+B/FJ/y3xf9AefJY+0ytNl3UqHmtPC6mCHa9Qt84ADvtvKzKOOoNM6ufKzlc27XVh2AzC2LawZP1w/iKTUJ8qpw6KNILVr42u69TuRtua5UedevsKpPFaOKmt8w6Ny7/ehBzpea3LOjEtSS9d1C+vmmKy69jmkLn/9lHvm/wRnaBWLKXhG5OW/rtzm2P+6uRi0TvbXYs7lmeq1G0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(316002)(41300700001)(54906003)(66946007)(4326008)(66556008)(66476007)(8676002)(86362001)(36756003)(6666004)(6506007)(478600001)(83380400001)(6512007)(186003)(6486002)(2616005)(31686004)(66899015)(8936002)(7416002)(5660300002)(2906002)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJMeGcrb2pJbmdyR05PWWxyRHFLcVV6SndwVUlFLzNod2d6NlhyN2hybWcr?=
 =?utf-8?B?Mm8wM1ZNVG12WVdsQ2RUZXkrQi92Qm50NllOSnNGWGJaQTY5OEdZNjFiK2Zt?=
 =?utf-8?B?ZzRqWm5zR0c0K3RUc0orbHlWL21SWkVySXNUVFIveWpFN0o5YmQxbXJYR29U?=
 =?utf-8?B?VTJsaW5LTU9qamFYaUVycTIxQyt5Uy9lOEd0MTN2cWJvWmNvWkxGOGtjZ3hP?=
 =?utf-8?B?SVVjRkRLakFBbTJ1aEtHaG4wbml6NlMwaUJpUTNiSE5pZlB6TWtJaE13MXk1?=
 =?utf-8?B?ZmdTdlcwZXZRZVJaUk92TS96Wldyc0U5bmxycjNvZEJOdy85eHZiRWlDK3N5?=
 =?utf-8?B?eWpwWGFtb0Jzd1ZDbjZ6Q09na1lRR25Mb1dhZjFZcU4vcWtRZER5ZDhxZGhM?=
 =?utf-8?B?NU9oakhNdXVlNy9pVk1hMHIxT3NnOGZEc1pYUjRsSXBhRVE2bWN6d2p1S1dM?=
 =?utf-8?B?VlpDTGpId2dIYVhrTEk0U0ZqT243blVveHUwV3VkU0lLUlVhdzBIUWRxWG1y?=
 =?utf-8?B?TUFKbHQxYTRjOFlUUzN6QkR2a3g0SSsxTzhEeFFzQ1cvZFQveFQveFdGRHEx?=
 =?utf-8?B?MlJxSk5XVlZXMnZtVEd2MFRTLzIvZmYrWXFWZEQ0dTJwVFZCcTVDZ1RXYzZ0?=
 =?utf-8?B?dFR1SFlnU2NrL0Jjek9obEdoV1BKcXRWS3JkOE42VkFTMk9JVXE1ZnVIcEx2?=
 =?utf-8?B?eGRPeTJJUzhkNnRURWdEemRrQzZ3QTFvbEtDOXhQYTc5dmplWGZNZFBMU1ds?=
 =?utf-8?B?VlZnaS9KcnYvT2NKaVowMS9KVFVVYjhaRVRmTlllNkFkRmZ2VFJOTnBDSDRh?=
 =?utf-8?B?bTF6VEN5RjBSRDJWY0dhaWl6Y2l1VE5HWFN3MlZ5c2xWS2tzUG1haTUwQ2R2?=
 =?utf-8?B?WEYzcG9QWUx5RWtOSGhINDF6bG9KQzJmNFRoL3RxL3g4emc1WWp3N3kyRmVT?=
 =?utf-8?B?NVoxbE5lcXpMT3ZSSHBsK0t0TWFVYkN3SW16UHp6c3EyeWdnU2dxM0pmNTF3?=
 =?utf-8?B?b2s1MWJMaTBrY0tyOFJGVTh6SXlDVmFGbHZJRkRsRktqS2VwVENwRlBMc3Iy?=
 =?utf-8?B?a2VaTW9jUktuM3hxSUNCbksrSE5MSUNDOEY0VjN5dFRoOHJWWWlmdDR5SHo3?=
 =?utf-8?B?L2VjVlVwaDErdUl5YXlRdFoyaU5iN2hOWmpDeU42dThlQVdOanpHSUxvMTY1?=
 =?utf-8?B?aThuU2JqdGNsV1lwQ3RCNC80Njg2QlJiaktDWHdtdUpMU3BzdVFPdEZsblFN?=
 =?utf-8?B?cWJKUG9YUE9qTXVxcGIzODR4MHFqSDRZUHg3Z0ZCN3JqaE1TWXlKYXpvOC82?=
 =?utf-8?B?c0JLS3NieFBQZW4vQi9qcXlGVlJicDRBTkxJL1VRcExQVG9hczYycjcvWDNt?=
 =?utf-8?B?WlhaL3VqMFliSWRYbU9iRmhMVFM2VmJQNkJBcEJVOHJTMUVZRlE0SktQSXQx?=
 =?utf-8?B?RnRFY1ZJVlEyU3BWVHY0cStZbGx4dkxsN1dQU0VCdjlFSDhzMTVkcWtOajlE?=
 =?utf-8?B?RWUzYzNKemU1ZlZrenlkY045eE9lOXVhTm9zcFlMOG9DbVZNUGQ3T2RhT2Ni?=
 =?utf-8?B?WVhTNUJGaDRwUTNXaVJqMnkrenlKWWIyYlQ1YTBOUmo2TlhPU3F1ZzduVXB1?=
 =?utf-8?B?a3JHRnlTOHF0eGF4R0ltS1JkV244RmN4WUF4TFo0LzVjYW4zWVJPOWE0L0c3?=
 =?utf-8?B?M0x0RW1sU2hZS0prZTJuVWFJdjlsRTNIT24xR0pkRWJVa2xIL1BoSUtPTmhu?=
 =?utf-8?B?YVF6UzRJcDdjM2F2eUxyeFB5Tjh6SDFqNXQyYiswYVRvMlRxRjZZc2xvSGdL?=
 =?utf-8?B?NDFnc1NXbkNJNUlnNi9mRlRzODJ4a1diZVAwZDQ4bWlYdHBteldSWFRQaHJk?=
 =?utf-8?B?R2lXYVJwbjk1eXNhWng0T0xvRFJrV3BSRmFLT3drenZqQzRxOEc4TkI3dWM0?=
 =?utf-8?B?UDRtUWhUUDQrbWRjZ1dLaHdGMDN0eWRIMDhrQ2VYTko5NU1VMGdremdPcTlP?=
 =?utf-8?B?RXB1czVnaENMNE5PL2dYcHBSWVcvZjZ1YndubEtkeGZpUzVEbkhOUFU0T2Jq?=
 =?utf-8?B?TzIxS0RhVlFTZWJJYlFIaFJDVGZYUmpaNjFERncrc1VDRHlheklJRHlLenYz?=
 =?utf-8?B?QWpYQjVKK2RIdkROSW1NL3dvMDNxKzBUbUFxeXl2RmkyRmFrbmhNNWFsMnN0?=
 =?utf-8?Q?v28sSs8gwF4WuvHI/eYSCC94KygRORZuvT4Gg0zOhx9h?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e819c14f-3f70-49ab-8f13-08dafd81c29a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:38:18.6363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc1fScc7hckxR5BEdUdmqvjBnZp/7/waAlDcKeADcEN8blbTSZR5ze+xmiCKQbsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.01.23 um 21:26 schrieb André Almeida:
> Create a document that specifies how to deal with DRM device resets for
> kernel and userspace drivers.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   Documentation/gpu/drm-reset.rst | 51 +++++++++++++++++++++++++++++++++
>   Documentation/gpu/index.rst     |  1 +
>   2 files changed, 52 insertions(+)
>   create mode 100644 Documentation/gpu/drm-reset.rst
>
> diff --git a/Documentation/gpu/drm-reset.rst b/Documentation/gpu/drm-reset.rst
> new file mode 100644
> index 000000000000..0dd11a469cf9
> --- /dev/null
> +++ b/Documentation/gpu/drm-reset.rst
> @@ -0,0 +1,51 @@
> +================
> +DRM Device Reset
> +================
> +
> +The GPU stack is really complex and is prone to errors, from hardware bugs,
> +faulty applications and everything in the many layers in between. To recover
> +from this kind of state, sometimes is needed to reset the GPU. Unproper handling
> +of GPU resets can lead to an unstable userspace. This page describes what's the
> +expected behaviour from DRM drivers to do in those situations, from usermode
> +drivers and compositors as well.
> +
> +Robustness
> +----------
> +
> +First of all, application robust APIs, when available, should be used. This
> +allows the application to correctly recover and continue to run after a reset.
> +Apps that doesn't use this should be promptly killed when the kernel driver
> +detects that it's in broken state. Specifically guidelines for some APIs:
> +

> +- OpenGL: During a reset, KMD kill processes that haven't ARB Robustness
> +  enabled, assuming they can't recover.

This is a pretty clear NAK from my side to this approach. The KMD should 
never mess with an userspace process directly in such a way.

Instead use something like this "OpenGL: KMD signals the abortion of 
submitted commands and the UMD should then react accordingly and abort 
the application.".

> +- Vulkan: Assumes that every app is able to deal with ``VK_ERROR_DEVICE_LOST``,
> +  so KMD doesn't kill any. If it doesn't do it right, it's considered a broken
> +  application and UMD will deal with it.

Again, pleas remove the "KMD kill" reference.

> +
> +Kernel mode driver
> +------------------
> +
> +The KMD should be able to detect that something is wrong with the application

Please replace *should* with *must* here, this is mandatory or otherwise 
core memory management can run into deadlocks during reclaim.

Regards,
Christian.

> +and that a reset is needed to take place to recover the device (e.g. an endless
> +wait). It needs to properly track the context that is broken and mark it as
> +dead, so any other syscalls to that context should be further rejected. The
> +other contexts should be preserved when possible, avoid crashing the rest of
> +userspace. KMD can ban a file descriptor that keeps causing resets, as it's
> +likely in a broken loop.
> +
> +User mode driver
> +----------------
> +
> +During a reset, UMD should be aware that rejected syscalls indicates that the
> +context is broken and for robust apps the recovery should happen for the
> +context. Non-robust apps would be already terminated by KMD. If no new context
> +is created for some time, it is assumed that the recovery didn't work, so UMD
> +should terminate it.
> +
> +Compositors
> +-----------
> +
> +(In the long term) compositors should be robust as well to properly deal with it
> +errors. Init systems should be aware of the compositor status and reset it if is
> +broken.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b99dede9a5b1..300b2529bd39 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -9,6 +9,7 @@ Linux GPU Driver Developer's Guide
>      drm-mm
>      drm-kms
>      drm-kms-helpers
> +   drm-reset
>      drm-uapi
>      drm-usage-stats
>      driver-uapi

