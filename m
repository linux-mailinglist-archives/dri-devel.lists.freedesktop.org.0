Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D6C635FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCAD10E311;
	Mon, 17 Nov 2025 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wY/UDCRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013039.outbound.protection.outlook.com
 [40.93.196.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C270E10E1B8;
 Mon, 17 Nov 2025 09:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opMvjPuJhWcmQp0biFOJxfD+ZeQFJTh0R78GtTzP1npXM6NxUysjxVLLtGJRPImRcHxCyIimDzQiZRvNvj5OC5mEP1oBqqp6n94F5o4Jv5oz/kSEzNbe18vRrjLa0qLxQRXrOJmmG877dvUhSM/D6IKQTHFRn+Aza0xjH2Hu+X5YOy43hW0D43vhuMq8CQkgzn7fFdv935ZKSTMNwC2ZYSBRMx3dOkPxKYwyoi3kYCDDj9yssHcQDwb5+fSmqchrgOxOp0LbPIeZEhozh7CerRWuRohHJ2aN/VGlDXhoCLADwyxF4lkFAsUn9VQS8FLmRtjor1CXMf5okIjZhXlsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg9KeI0QS6YpRayEK/9OeU5uNFhUzOwEHT2JKCl/klQ=;
 b=TbbmRBt9qyLZE+MA/zPst+MZcRQPahhVLnbS+xDxbmIxIUxUaFvdS9rKmsjyeRBwUI0oTBl00y9ADIwoU4M06sdHHuBWvohXM2LaLY35rz32xU9etgClX2xGJFb5oXHoANpXUJYI84aWlFDjWNF/ZRNhxurS1rFvFVhUlOyDx/6CGo2abng0qF+ruAVZ8tuYd3CmZsLkFLy1bDG4qZpuTjaUJcIgkH9bvjFxVkeSGXHJOx2pm7QmCPn4My3/WVS6HN4+6+PToHV5gg9LWrZ+EUNANEBNfiUSczuv31FJCC614ebioXVXWfbnmJ9eNgeg/JEATMXp60wL0nhx3wF/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg9KeI0QS6YpRayEK/9OeU5uNFhUzOwEHT2JKCl/klQ=;
 b=wY/UDCRXv0uqyHDX5Sbs8ljbemuXWuQH/Bri0ECNao38CgktsO644kT/JPTkbW3kmM+3rk5IjxcNvANIksHyi7GlJpZPsxqQepYNpm1J0mf/zRf5ISa0c60JhTKDHViIZZ12GZwZ63Gd+Jm4F5UGDWwMQnQjaeRlREuTEtPZefU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8711.namprd12.prod.outlook.com (2603:10b6:610:176::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 09:56:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:56:47 +0000
Message-ID: <8558c1cf-6a05-429f-80cf-e196ab9ddec1@amd.com>
Date: Mon, 17 Nov 2025 10:56:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] drm/amdgpu: rename amdgpu_fill_buffer as
 amdgpu_ttm_clear_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-19-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-19-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0567.namprd03.prod.outlook.com
 (2603:10b6:408:138::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a4a523-961b-4cbb-9b9a-08de25bf9f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm5jSWtTUkRoVGhJaXliM2lRUDRPODB3OVYzU3Q0NWVjU2NWd3l6OERNZHhw?=
 =?utf-8?B?QkdxSXRtczZCL29VVGkyTVIvSkJmeFZKbkJqbERNWjQxRUNSMm9sRUtuajE2?=
 =?utf-8?B?U3FqaHVGblVCa0xyMStUdFlJUEZxemFkcjBLbks1d0ZUakZ4VVZxSEFmUnNC?=
 =?utf-8?B?TTFMQVlTYTVSWjVkK0wxUHprQnpMNUZhZE1mU2NPRGtOVjFYWk1EYzloN0Qz?=
 =?utf-8?B?cUtBRjVnWFNQdzVrVDNpU2J4SnViMmh4dHliQktaUzkyZ0F4YnZDaTNsai9F?=
 =?utf-8?B?YTl6ai9VRk1YYmxZZ2pFTC9zM0JCN01ST2ZCM1ZYSHJ4cXcrUUQ1TmZzMzlv?=
 =?utf-8?B?aXZDVU1aZTdPTW1YeU01WVlhZ3hoVlIzd0YwaDlMTDF6VktxS2MrR3hpdlgw?=
 =?utf-8?B?d0oyZFRFeEFrdjRBTXF4Q01lamRVZHA2TE9ySjkrT2NoaVpzdHlyL1V0ZmVm?=
 =?utf-8?B?aEVQY3VHTi83QVQzejltOGQ5eXhpUGxQTXJsayt5dzJsdUtXejVyM1hXdGFB?=
 =?utf-8?B?NTJReDdNRVFyNksxNHVrT0xhYVY3TThaQU5BTHgxVFJlZ1RmVGNoL3RKbU50?=
 =?utf-8?B?am12dnJab3JoUHVpNGlGS2t6MzhocWVZSGhHTGI2N2ZYV2VaY3RaOVFUQ1d4?=
 =?utf-8?B?S2FDdlhLWDlQSGd6OVBYVldZM1JNRm16OTdWeVA5UUhDY0J2NmZvUFp0bTdG?=
 =?utf-8?B?RTlWeUVJaU54QUxZWHZaOUQwYksvYXhEcSs3TEdLeGRDQkdKWVQra3NESkpi?=
 =?utf-8?B?OUhhbE9heEp1WXBwaFQ4R1k2b2gxSDJCRVZlTUp2VXBnZ0VsaVF2V0VsR3Bi?=
 =?utf-8?B?WWEreW5DbHZEc0x5aGdVZDZpUU1CYlgzVkh2SHFkRW9PdnZWWVRHM0h5VXNK?=
 =?utf-8?B?ckJxZk9EQ2cwdzdZRHhyUzdyRGJJdjdrOG4yeldzRlVTZzJ1QTdXUUswbzdS?=
 =?utf-8?B?S0tmNFBvQkVwVUgrNTRXRXBaN0JSRmMzUjlJa1BQZTJsQUpybm5iOENPQ0kr?=
 =?utf-8?B?Zjk3YjZ1MnZ0bVZKZThvRERTU0NnaG1jUDl5ejZDKzA2bnZtY29xTmd2RHBR?=
 =?utf-8?B?ZXJCYTdjN290OS9manA1b1pST3ZqMjh3ejZSQ3pyWFR0T3BSL1FaRnVVdE1D?=
 =?utf-8?B?NnZkS3BqY1JoRktSWjhCblFJelNpQ2o1aVdwM2RKWktOeW8xbmtXdS9qd3Z0?=
 =?utf-8?B?akR4K1pxUTJLdFBSZlB6K0tIblljVWZ5QTV5UVdSNXRKYkFxem5xcVpYd0p5?=
 =?utf-8?B?VTYvUk1SWk4xRXk0UGJUVmZnMERxZDZPL1lkSitxd09teVkwVm0yTUx0d2N1?=
 =?utf-8?B?TXdpKzJ2UmsxcXBsSFkzK1NxYXM1S24rYVVEQ3hKNTJYazdQeHhWeTdvMDAz?=
 =?utf-8?B?cTlUUHlpSDhyZE9FZjducGRqdDRHdjBsaTNwbVJsYWZyaW5vVzhPQ05NZnc5?=
 =?utf-8?B?QWtaVW1ETnM1em9yRW1hVWFqZUdUSVVEOWdPSkhrMnBSc3Q2ZC91VjJOdFpk?=
 =?utf-8?B?QTIrSFhjN2ozRTJHOEkvUlBTRWNaa1dwYkV6dTBlUThGajdMVkovOHZ6R0VO?=
 =?utf-8?B?UjRQWHprcFVGWVVCdW9paEZHelUwLzE2Vm45YnFpbHhQVDUyc0F6Z3dId0Rm?=
 =?utf-8?B?NGJiMXp5UnlydEdOMlpvTnFXWFdGekVZaTY0TmtaOHUvais1V3RGZThRRWhV?=
 =?utf-8?B?dktMQVdaT2RqQW5VbmR2UTRJMkJlcFFHUU9YZjh1czcyWDVWWE1rV2NZMUFk?=
 =?utf-8?B?cXU5ME9GUGwyQ2dpT3prdTFPWE1jTlNJTWpOTGJqeE1ybFpVVDU0eEdaL0FM?=
 =?utf-8?B?WDRldldscGFxd3N4ZUZZWWdRTk4xZ3RlTmZjck1RKzV5b2JxdzNsbkZKamtp?=
 =?utf-8?B?djFJd0NPTjUvZElHaC83QTZLZVBwTDFNeGkyYU9TOHNYejdZYVl4OWhISWVt?=
 =?utf-8?Q?5J+SGTS/yQMZtLabYz3tUlLsbNW3gSeA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THdmdEZrY2wwSjVQVERpa0h3RkMzQXFnUGJyQjl1Y0NqbFpGWngyTDlEUGFk?=
 =?utf-8?B?dTh5VmNNbVVVWWpRc3lheGM3UHcxYm9hd2JoSnJkREtCVks0K01hUVlNeHNI?=
 =?utf-8?B?RzRhcEtTbVRnaVpMenBzb0lPMW1uZUZIUkljaGE1bWFTMHo3dlV1L0ZpVWVH?=
 =?utf-8?B?RUFnNnZ6YkFLM3pxWlFDRnNWZkRQVTIyUkZsL3NCN1l2L2VJL3dHRytBY3Ny?=
 =?utf-8?B?QlE5aHQwa0Z3U1JRbHpBWTYwMXArTE1OUi9NYnhyWHlLbVMzTjl4K0RpWGFX?=
 =?utf-8?B?ZW5VNTVpSURveU9OcS9rS1kxODhwSjhWOFZtaWtEdEpMb2pNWnVGcXAwd1l4?=
 =?utf-8?B?SnBJVlluMzBwQk0yRVBTenFzSnBKQnNCeC8wcFhXb3ZBb3pkSUxtZCtIcWZI?=
 =?utf-8?B?QnlTQXdtdHYrZmg1dUo5cU9WRisxbk9raGF1cHA1N2lrOHlVQnVGTEVqcWZt?=
 =?utf-8?B?RDNyYk1mUzU1WGxPYS9iNmNINkJENy90bXhBMEwxS0hnTjhUNi9CUU9lWVpB?=
 =?utf-8?B?Unh2c1VManU3N3ZNS0pnSVNFSHJhZ0hxSXRCeFdiV2JPM0s1QXJybU01WkxC?=
 =?utf-8?B?aGFzVWtkaHJEYnpBNFplT09TNmhUYkx6UjBQcmlLWjNMekdVekFoa0FIc3hr?=
 =?utf-8?B?ZjczTWQvenpVMjdWYnZEMy9hREg5a01neE5WVVA0enVhYVYvRDZTM3pqZXhy?=
 =?utf-8?B?ZU85MFRxQW9hL1BFUEI4czJSTnZyT3dEMm5tdWlYb1VhK2JybEdjRkV3UXRu?=
 =?utf-8?B?dUlxbElXeGt6Rm5yOC9INURKK3NLUmtYUkN0YTcwZ0p1TVkzQXpiN0NVYXRy?=
 =?utf-8?B?UnJCZEVZZmc1MER2YmtRRmIvYndtVmxOWksvODhmeXFWcHA1eHQvSlMrUXZI?=
 =?utf-8?B?a3orZDdpem0zcVlNUERrSWdpVVFObHNuelA4LzV4d0dEUFhKdnhYZVlFYjFC?=
 =?utf-8?B?RUZhVTYxSml6emVUYjlzWG4rakhFSmNGUVVTU0JaMnRnRnYzdmRsNytrMURI?=
 =?utf-8?B?VDZWS0JtMnU5WGp4a3N4cDczQVA2U0YvdXFyMElka0ZGNktiUDlmK1JEZ0JC?=
 =?utf-8?B?ZU5FNDI2SmVuMXdYOG04SjNxai92RGp6eUQvRkdGKzBkeWMxOFhpMktQa2Jj?=
 =?utf-8?B?ejd3bHVsZ0RqVFM2d3pOT0lCYy90YVZTTmlJbjN6TkJaSmtkYjZZRjZiVlov?=
 =?utf-8?B?a1hRdFlzSG4zSFV0a0dIRlA5WEhZR3FVRkR0SE9YMGdlS01kVDhoVkpVM3Ny?=
 =?utf-8?B?eUFWbGJNNktyVGhOSWZxOFUwb1NZZC90eEJwdm9uSG1YRnRUaElYYUhUbE93?=
 =?utf-8?B?RzFQcjFzRkQrM2VZZjZ4NGZZcEhhYVR3eWtCZVE1Um5WWUlZaEJXZDc3ekVB?=
 =?utf-8?B?L3dGZkdmUGVZZ2NWamh1OExpYXQ4NmllOFo2eVZNazFVUXdoeHlCVWI3S3Nr?=
 =?utf-8?B?M1BxS1dHaVVwdDNsMkdxVEJaWTFDb0dCcjdxUHZ0UWplOVFGaGVFUFJqVHND?=
 =?utf-8?B?Wmx1Vm9OcC9LQjMyb2F1eEpYbkEydUR5TmJPQ1h5MWNMWTVMZDlVNjVNRlYr?=
 =?utf-8?B?bGRYb0xNM3EwWFl2VmRrbFJVYURtQjNmc1lEZ3NNM3RmajZTVW40MythNW1R?=
 =?utf-8?B?amRIY3hIY05DVXdZV0EyeVN4cjh4V2k3aXp5Q2hRZXBpUFl5RDZYZGUyUTky?=
 =?utf-8?B?RkZ5ajlXMHRTNGRmSVFEaFlxTzZ5bzJSSTkzSk5pNHJnaW04dG9pdHl4MHcr?=
 =?utf-8?B?RVRhY2JkakpxTURjeFZBL2VJbk4zYkhBSUR3UFNvMDJ4Rm5RMEtqVE5ZUWVN?=
 =?utf-8?B?ZnFIdjhhdVFRTFdNZ05pQ09zZkZrSmQ0MTlHUEl2TzVQL2d6aHdCSTFGL3ZY?=
 =?utf-8?B?OTNqU1B6YjhkaFVvZDVzRzljSlpJdXZzVWZWOTZCMUpjRHhocnMxMm9BaFMv?=
 =?utf-8?B?TUdGMFlneUt4NmZMODFYZ1hTc1NLZDhzR1k3K0Ntbnp6bE1jelIwU2hFYk9x?=
 =?utf-8?B?UERJcWRWMldVbDUvekJKTkV1RUFoczFyWmRuQVhpRE0wY2gvR20wRHZmVWNB?=
 =?utf-8?B?QkxNd0xkQ1VPbGFVTkZVdXZ5dXJxZE53RDB1UjFiYmJlMmx6VFNNa29tZzBu?=
 =?utf-8?Q?At1coK9Yn1Sno6jvt/zBOaH1H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a4a523-961b-4cbb-9b9a-08de25bf9f57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:56:47.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKzQojdqLGrv5UxS9DoNIXf8eAP3bKGr2lsP2q4ny0xnby9G4Fs70PhBYNVMTDAG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8711
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> This is the only use case for this function.
> 
> ---
> v2: amdgpu_ttm_clear_buffer instead of amdgpu_clear_buffer
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 26 ++++++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    | 15 ++++++-------
>  3 files changed, 23 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 4490b19752b8..4b9518097899 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -725,8 +725,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>  	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>  		struct dma_fence *fence;
>  
> -		r = amdgpu_fill_buffer(NULL, bo, 0, NULL, &fence, NULL,
> -				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
> +		r = amdgpu_ttm_clear_buffer(NULL, bo, NULL, &fence, NULL,
> +					    true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>  		if (unlikely(r))
>  			goto fail_unreserve;
>  
> @@ -1324,8 +1324,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>  	if (r)
>  		goto out;
>  
> -	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv, &fence, NULL,
> -			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +	r = amdgpu_ttm_clear_buffer(NULL, abo, &bo->base._resv, &fence, NULL,
> +				    false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>  	if (WARN_ON(r))
>  		goto out;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index df05768c3817..0a55bc4ea91f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -433,9 +433,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
>  
> -		r = amdgpu_fill_buffer(entity,
> -				       abo, 0, NULL, &wipe_fence, fence,
> -				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +		r = amdgpu_ttm_clear_buffer(entity,
> +					    abo, NULL, &wipe_fence, fence,
> +					    false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
>  			goto error;
>  		} else if (wipe_fence) {
> @@ -2418,11 +2418,10 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
>  }
>  
>  /**
> - * amdgpu_fill_buffer - fill a buffer with a given value
> + * amdgpu_ttm_clear_buffer - fill a buffer with 0
>   * @entity: optional entity to use. If NULL, the clearing entities will be
>   *          used to load-balance the partial clears
>   * @bo: the bo to fill
> - * @src_data: the value to set
>   * @resv: fences contained in this reservation will be used as dependencies.
>   * @out_fence: the fence from the last clear will be stored here. It might be
>   *             NULL if no job was run.
> @@ -2432,14 +2431,13 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
>   * @k_job_id: trace id
>   *
>   */
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> -		       struct amdgpu_bo *bo,
> -		       uint32_t src_data,
> -		       struct dma_resv *resv,
> -		       struct dma_fence **out_fence,
> -		       struct dma_fence *dependency,
> -		       bool consider_clear_status,
> -		       u64 k_job_id)
> +int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +			    struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **out_fence,
> +			    struct dma_fence *dependency,
> +			    bool consider_clear_status,
> +			    u64 k_job_id)
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>  	struct dma_fence *fence = NULL;
> @@ -2486,7 +2484,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>  			goto error;
>  
>  		r = amdgpu_ttm_fill_mem(ring, &entity->base,
> -					src_data, to, cur_size, resv,
> +					0, to, cur_size, resv,
>  					&next, true, k_job_id);
>  		if (r)
>  			goto error;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index e01c2173d79f..585aee9a173b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -181,14 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
> -int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
> -		       struct amdgpu_bo *bo,
> -		       uint32_t src_data,
> -		       struct dma_resv *resv,
> -		       struct dma_fence **out_fence,
> -		       struct dma_fence *dependency,
> -		       bool consider_clear_status,
> -		       u64 k_job_id);
> +int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
> +			    struct amdgpu_bo *bo,
> +			    struct dma_resv *resv,
> +			    struct dma_fence **out_fence,
> +			    struct dma_fence *dependency,
> +			    bool consider_clear_status,
> +			    u64 k_job_id);
>  
>  int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>  void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);

