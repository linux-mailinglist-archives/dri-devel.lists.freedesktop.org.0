Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AAAA7C26
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD63A10E29F;
	Fri,  2 May 2025 22:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VkMCw2mn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F810E09D;
 Fri,  2 May 2025 22:25:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUJk0V1ggN+yFFkHmMZ/RLq2uXv62fAxMIm0MZEU1KfhX7RpZpHqAiRQN9yKffYfORPGmhZlt5FEBE6tIxJsTFSZs1KXbOOen/+Q+s8Wnwb0VuI5dGXSNkjYCeLyjpqRxE9erLwdY2di9sY9BDmC+ikkXK6b6SwmaZlVC8y/I4/5Xk/W6ZRbeEW43KJVcuedLN2Qj/mGDQmLfwxCAxHe2if7zjvdDpwFhYdR//zB4RGA+QDaEU78TdFsOjGT1FYN4HDBWaDSU7yF6+YEgYreRF+QXd2AYudZWEg0/pRCUQCRNsSpHok9H8RVmEZAQPxtUelcu/sn99BvpUVDPecIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXNvFg2f7kpyvT2KF7WtLPwLxDah19gd6VnZVglMEA0=;
 b=G6rz+Hk94ZLa5jhIQMUHlLjcAUdzD45mIBC41LKrTymRU1PScKbYmU7HJzdtDZsBAA+iwLWz8dsk8fGgnV48v5q9uzLKRjX6i8zrNRMQ/KxmDIgckevq4waADnAUHeB8kXDPcFPBRVcfeZ7ErTeZpbYRtBhtzUI+JFF0ofZRKBvJ0viWuIxrJTOOwIMwLOKADUEkT17gGZtf/CuCAS/GQyLPrra/u70ghJ8i4YSPR6iqxKC2szIBYaCAlT+k9Mcsu+EdnICuJf9VBXkxyI3bX3QYEE+4oucouoBSzzv2vfnKhWv2dqwrRHwXmoYIdA92Ff7PnPEA2aKqegC0x6+OFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXNvFg2f7kpyvT2KF7WtLPwLxDah19gd6VnZVglMEA0=;
 b=VkMCw2mnlEBOYrXfWl9AnusvsVuDX1AhlhDRwZMl25SPXuVgIXKHl8fS+mI707mFXmYagAfM8eirZC+cmbb503HGSto9RBmvvn3treWMvSsWd24ee5HS1/yupPHYBduGTXkxRxCYB48AWTbGBQTASxgNMLhwCwIcdSTYEPfrLps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 22:25:31 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 22:25:31 +0000
Message-ID: <83eae1ce-ead2-47c9-a636-755a5207a6be@amd.com>
Date: Fri, 2 May 2025 16:25:27 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250501055701.2667-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250501055701.2667-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::14) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 40660d7f-6069-442a-7393-08dd89c83fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEFObDhXNzZEYUF4WkkyWmdNSVlRMDhHUHAxNHIyQStQckZ2YVlxNGZHSzRU?=
 =?utf-8?B?VkhjcXlXejdUK05nbnE1RU01YjEwb0R3RTEyQzJIeEJsdXIrYWVWRnI5Nmt4?=
 =?utf-8?B?VGVYeloxZUl4K09DUXRrTWF0bW02OWN6bjRlL2MveUZqWFdyWkpoaDFXS0dU?=
 =?utf-8?B?TlV3aDFHek80RWhHakhERkFvZ2MwZ1RyNW5uNzIzUnozUldZTzJOZ3dnbVd2?=
 =?utf-8?B?aHlta1RXdWVkNS9jNW1aYkU5UWxpS1ZpQlAxR1FPN0xSNUVNVXBVWG54S2J5?=
 =?utf-8?B?YStVbS8ycVVpT3FIem8wUkNzRGxVYzh1Q0wwaFlza2MwYlJmZGVrbjdaQmh3?=
 =?utf-8?B?RSt1SU1OWFFySmRKMVVidUY1eXFpMmg5d1pROW9ETS8wdExQVmVsYUlHNVRF?=
 =?utf-8?B?RzIzclU0SjR6d2VUTlZXbWZ0RG8vWERwdkI5YlltOUp4QW9EUWo0ZDFvcDBD?=
 =?utf-8?B?UjBSZjh5Zld2anhjak5Ga0YxdjJVdDVRaUxHVG9SQ2ViN3BCQThJdTUwa3Bq?=
 =?utf-8?B?d01mK3hWOXd0N1V1TkJ1WlBYaHczUk1NanlIejY5WDkzRWJjc01kaWUwbW55?=
 =?utf-8?B?NE9nWVhOQUxBd3hvV0VDRjZCQ0ZrS0dwYlE5dDQvSFNyaFFBZ3JxaG5yU2FE?=
 =?utf-8?B?blVNZ0xncnRoa2Q0RE52Vk9KaUZERjFrSEdBR3pKMWZXN1gxNW50Mk5COER6?=
 =?utf-8?B?YS9OYlZnWEdueEZnK3htc3hUZjZrOFAwcElhME9BVUc1RFZJWUUxakpCSWtI?=
 =?utf-8?B?K2xDaDhwMjliSUpCZ3Yybll2SXJ4dTVjYjhBaG16RnUrejhvM3ZKWVFjQmpN?=
 =?utf-8?B?L1VxN2loMDFVNE4yWHorTWVNeHNMa05iRmZtby9scEE2N3drV0RYNFo4bkIr?=
 =?utf-8?B?MmxjSTdoUDczVllkcGlzY2xneUNiWCtlMkdnRHlmcHkxTUVMS0FRUFJtY2RP?=
 =?utf-8?B?MEZDaVViczV3Qlg0aVVhTnF6R0NxMFFDMkdXM2lpYXgrUkRwRjhBb3RCenAz?=
 =?utf-8?B?amdIZUkwS3lIVGZiN0pSOElDQ09lVWVGY2FXTUxmY3MxanVzRG1rVUt3OW5M?=
 =?utf-8?B?V0FTQ1lZaXh6eitTdWJaTnNpMDErS1R2ME4xVGRWeU0ybjdyQXB5TjU5YjBw?=
 =?utf-8?B?aDlyb3VSblhKa0Q2OHBiR0Jhb2dnUXB6TlN5NjlnSlVBY2hNa3EyNkw2WmYy?=
 =?utf-8?B?bmJKUGNKQVR2Y0pkdHJHeDlNWkFHNm9wcXl3MnBTSkRIYWllNHNBVFVJWlZ1?=
 =?utf-8?B?S2ZITGlrM1UyMGpoSjhDbkViaHpkUi9yRUxIcnNySldaWlo2Tm04bWJ1Mm5l?=
 =?utf-8?B?M1NEeTJtUjBHOUZwZkdtZnV1MVVjR2VvZy91bkcvQmdQajlMUG1XR29qczNO?=
 =?utf-8?B?ZHpJeHhycGJrSmR1aDBqdWt6dFdLRXk4Z0xpMFVlTjFEODVlRDdialE0dFhW?=
 =?utf-8?B?b1VDWHpBYWY0dU9rUk44K1hieVJJUmtidkNwSkkyaWVpUDV3dmw5NzJSSmZr?=
 =?utf-8?B?Q0RuZmJMUmNOUWRPcnJSaUdRaVdIV3lJOTQ1ZjBxVlV0Qk5BdlMrMXhad3pj?=
 =?utf-8?B?cW5tM2RUd1hYMjlpaHA3NTNzNDlndlgzRjdIdjNHaTdxU2RpMlN2R2lhdWtZ?=
 =?utf-8?B?R05NeDl3MGo5dVlwcjlnRjlsTzZMWWx6VzRMMCtkNWNTM2JRWXlIT2xJTHJo?=
 =?utf-8?B?VHBSRnBpTTR3MnNONlF5bnJFclEwMmJmbUVpRmpuNmlQL0hNQTh2cTl6Qmxv?=
 =?utf-8?B?NnFrcFc3UHU5bENiWTdIMkc1YzVhNUNFMGtKZVBhcVdrRkl1aFZtOG5TeFBM?=
 =?utf-8?B?Q1dxN1d2SU9jWFkvdmUzZE1BMGVZQldoNDNCYldGZC93a2VIL0RoUEpaN1Ux?=
 =?utf-8?B?bitiOUtMTE56cnUwSFd0WFJVajRXQ1ZseU5XazIzRWtqSDUyUG56MlJock93?=
 =?utf-8?Q?F9/Ij1TO7NY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0EvOU4wMm4vRnpDRjhvQ05oZktURVJydUdkMVFqQ3N6Um5rZFR5cGRZWStU?=
 =?utf-8?B?Wk40dmQ5K1VXbWNJWDArOC9SNkRiamUzUlV3NHpoaForVis4UE1majRtWnFF?=
 =?utf-8?B?TGF3QTNwUXlvQmp1UENuRnJRSWZoNW5ZcjBTd242aVdZT3VNUlJralByUHJo?=
 =?utf-8?B?OVI3VUtORHpuRHJqdENCTmFPT1pzcVF4UHdjWHZybTRBb1RseldjSVU0SFZ5?=
 =?utf-8?B?cGNzdDN6dFVFUUNZOEZDN2w1cEdJbmNKQld5U2dFdTVQcTdDZE8ySmZxYTR3?=
 =?utf-8?B?SXR1c2xDNFFacUpLM2RkcDdSdzZFcnhTb0hZL3hsdklybTVmUUlBVFZpVnQv?=
 =?utf-8?B?YnhrTnpSblhORXFkeE5FdkovaWc2UFg1SHVXb01sQmlpYWVUMlAzUFJ0QytQ?=
 =?utf-8?B?ejh0ZVRid0hxb1hDVjR6R2hQOGRmemU5SkFIRzFBeHVEM1ora2hpVklvaDhY?=
 =?utf-8?B?U0w2RmhBVDhnU2wvTzRzVnI5Zy81Y25QMC9ldlBkcUh1eE9jTWUrZ3hCbmN5?=
 =?utf-8?B?Zzk5bk56QUFHT2FDT1lBRllTM3F2MVgyd1V1Z0xkUW9Ud20rd2gvbWMwWTZs?=
 =?utf-8?B?TWRvbWRsQnVVaXhKV1grdEtzTjlLd1BZZ2YrYkNHVkJZWHFqTFdvNk44ZWk0?=
 =?utf-8?B?MmFqOEplblNaY3VLOXhaVTZCcHIvOURTUjBLVjJ3STdaMFRLS0ZycU1LTVpI?=
 =?utf-8?B?TW96SDB5aFNXc0RRT2FhL1lJVUhiUlBIaWxLQzFLbmoydXdnUk5ZRlU4L2Ew?=
 =?utf-8?B?SFBrbHZaSGZpS2pRQXluOTI4c29jcy9aVWpQeHpDUVJiTkxJUG1xZUZNWjM4?=
 =?utf-8?B?MXdZS1JJSHVYOThIQzF5cUpZWXRvV3lkSUVkZmxVS0E4cmdXY2h2NVFBdU90?=
 =?utf-8?B?eUpNeFVFN3FYNVRWT1FCaHhibkE1WWZNMFpvRFA4VGMrSm5WNHhnY3pzMmlY?=
 =?utf-8?B?dmlWaUlBb2d1Smx2MnF1SzhzZkRld25IWnFMb1FsZVp4ZXM3NVY3RXNNMGts?=
 =?utf-8?B?dmE5d3QxRG14WTlmSXhPRkduUDlBZVRDZXhiclgyMEk0RzdpQ2c3YU1VRENT?=
 =?utf-8?B?eGJnekVRSkVZcFJCSUhzblBTRDJSZTlSYzNUNExhUTUxYmY0eHBBZnpNUFE1?=
 =?utf-8?B?MjV1TU9wWVlHOUc2emh2WFdTS0JZZGJrQkE1UlovQmNWT0kyenhZa3FnbTEx?=
 =?utf-8?B?ZkRZTkZqS3oxRDdGdHdzZWtDdmdFOTQwNmFzMUxyaWJOMS9nTnVLNWtTbnZk?=
 =?utf-8?B?Tk1uL2xEY0JPNm1MS25aeHlXcnFsdTBIaW1ZY2J6SS9Hc2J2b0tjNTA3c2w0?=
 =?utf-8?B?c2NYSy9vbGxhTUlYdXNQMTFuN2gwZkZrLzFvKzFRbXJUNjdPT004ZVdmSVBu?=
 =?utf-8?B?KzF3TWRWaCtRL1lhemluckhLeTh5YlIxcjI2ODYrV25NVm43Y1cwanlxUVl5?=
 =?utf-8?B?U2ViZlJLRFZYdjNuTTJJYjROMmdqbzYwT29NL2tmL2NmWWNMWVhMbm5iSFB6?=
 =?utf-8?B?bTBldjNTeTE4bVdVWkpzSmpjRk9kdG5SZHUzRzhGTWhES1BXeXNreFlmRFdB?=
 =?utf-8?B?dGJCRE8yU1Z0TUVieWplZStSZElydVhhK0xuY21tUUhRTHRDSUdCVTNmNUJ0?=
 =?utf-8?B?NDJQUS91RnR0OFA5a2hNOXVkMHlmMkY2ZHpBdXp6SHFTOUhvSjJKK1lSVVZ6?=
 =?utf-8?B?N1RtR1VQdEw0Z3FiWldXNzVuU1VDZ2ZTRWdSZmRmQU1yVDVVNVlYSzZrSDha?=
 =?utf-8?B?MC9ZbmlrNWxhdlgwYy9waU9UMEZOYWc2bFR6UThneTJ2bjdUcFpwUEx3Z2Uz?=
 =?utf-8?B?VjJRSmNMZ2w5WEh6Zk9XK1Q4L1h0RVJhOVMzbS9DdnFDeHVhd0xTNVpSTkJP?=
 =?utf-8?B?STlHR1ZZdUpOdnNDcm05Y0o5WjBhUEJjN1FqbkJTMlZRb0NMYmZ5WUViaTlW?=
 =?utf-8?B?bEQ0OGwzRHlrSjRYOTVGTDZDakxqV1Y3ckxXUHhNTUtaUVFDaE55N2Y1Zkl1?=
 =?utf-8?B?dGNodC9RZ1p5aENmbXp1MU0vQ1Jac2JrYjNjdE1kS2VXZFl4MWJ0UDZmV1FJ?=
 =?utf-8?B?RmxOTUFWa0ZnWkIwdkNZa2lVZnM0TThMN3Q3dGtWeUFWeUEybjRTUTdHWEhX?=
 =?utf-8?Q?o+W5fUZKML3B8vqGWpCMsFi2e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40660d7f-6069-442a-7393-08dd89c83fb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 22:25:31.4508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tUoaZfHOI1GEPqur8gqT7aztvrd7GsEeuviI6xg+VA0Fmxruhh+a+zow+j/yYN7NT57eb1Z3FYW3ZGnaDMrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
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

Hi James,

checkpatch reports the following warning and error

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit 
description?)
#18:
Adds a kernel-doc for externally linked dc_stream_remove_writeback() 
function.

ERROR: trailing whitespace
#39: FILE: drivers/gpu/drm/amd/display/dc/core/dc_stream.c:561:
+ * Return: returns true on success, false otherwise. $

total: 1 errors, 1 warnings, 14 lines checked


On 4/30/25 23:56, James Flowers wrote:
> Adds a kernel-doc for externally linked dc_stream_remove_writeback() function.
> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index 0478dd856d8c..060ee6c3fc2e 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -552,6 +552,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
>   	return true;
>   }
>   
> +/**
> + * dc_stream_remove_writeback() - Disables writeback and removes writeback info.
> + * @dc: Display core control structure.
> + * @stream: Display core stream state.
> + * @dwb_pipe_inst: Display writeback pipe.
> + *
> + * Return: returns true on success, false otherwise.
> + */
>   bool dc_stream_remove_writeback(struct dc *dc,
>   		struct dc_stream_state *stream,
>   		uint32_t dwb_pipe_inst)

