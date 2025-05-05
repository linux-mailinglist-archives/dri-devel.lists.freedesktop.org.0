Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC6AA983B
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 18:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9706C10E2EA;
	Mon,  5 May 2025 16:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V4Pedi0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DB110E409;
 Mon,  5 May 2025 16:03:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7rqlGzx1v/j3zgrH5JsbYik5KAEXx/sWxmXwkyeOZbxkzl3dKrw4YOXtP6Dz3aNlCogchTJ4jgmchgqMRDMzQzaqyPnubwL9/dleIOFFKhDnYhXfkhI9W7NpqhNjdJBX3ne/GvPuAJmlCiG6Pat/L8sxibX7+XBwo2ab3D+vWfi/DKbEFii6VhGecMH5UyEK1VynnmW4z/taP6AP4LMDbSEIP8T1Ou2Yh7dVAmt/oYiBsXGlZe3j0LKdS5By01M8+9xLR3iUpex8NxP5U/VBjUVlligIMUc8HWJhGTyO2YhsH0xXAiNPETIg49Op+XsJOHimX/ZF/zENSQpIvl0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R6YRpteeFPF3hKyvLflRte6xWGFGucvX0g934PaHgU=;
 b=qVbSxs3fkxr+UiZU+a19QfZ5uj08JQI846ng3FJlUkV8bKvoy4TLk1vLhi7EvKUz6+2H/TApREGvVHjfd+PF9y7nuo2Lm5Wf0WzCuyjxGnK7+AYCWWJ7vCVyLEBDcjunSPfmKdcKEkxY/iIlzx8o68W/m1xqKLOJXZxgAqgAUTIMN4w1FER3yBqRcsbvCCghXQ+USB/X1Uo9WGUist84JpEv62ftF6SI3YnvnRWSB8FvN5ux9rEtuLI4QLujP/YUrep40Fu2gjUExFZzlZ4HTjEKHqf9x+N/4R0Ck8laI3z4GQbvd5lvyHtT/tJz5YWaNlUaQxYjzOFPptx8JelF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R6YRpteeFPF3hKyvLflRte6xWGFGucvX0g934PaHgU=;
 b=V4Pedi0gT7VUWUjOv62ZdxcJvOnPwZltSXVWBxkVk2caxAp8Gj9Ou8iNiFAWMoS7qXtceC4mRsuJrIVO2toRMy8lX9nPCXqb+rS5x+ncLxuDHsSEZ1I1r03QNqIQ+MsAirZjuklaD7gzPPdCB1II1AYZfamHEa6qmqJyxGAS3uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 16:03:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.024; Mon, 5 May 2025
 16:03:00 +0000
Message-ID: <53d0e162-da9d-4fea-aba3-b96a9da844f2@amd.com>
Date: Mon, 5 May 2025 10:02:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 alvin.lee2@amd.com, zaeem.mohamed@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250503211902.70141-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250503211902.70141-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0167.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: 81be442b-3a2a-4a07-7ec8-08dd8bee4ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWRGckhnRjl1dDQyM2Fqd3o3TEwwOVJDck9BYlVoQzBQRWpQbnc4UjZMVlFB?=
 =?utf-8?B?aVY3UFdlSXNvTVo1Tm43QkFtQmZPWXBNTytZTFB2N2ZISjdOckdQeThpQ2FH?=
 =?utf-8?B?SFh3RzhXWWU1TlREK1NVeEFtYmZEZ3VqbTk4S3VRMjdLNFVUcHhMem9qY21r?=
 =?utf-8?B?NmI5Q0taZ3g2dHM3cnJCK1lqVmVpbER0aUtIcGRsR0c0ZWI3aGJ2bVVKSXNG?=
 =?utf-8?B?NEcwbmh3MHh1QzV1Qy9pMFFnQ1psekl1SzZBd2pReG1DdDR4UTFmMkk4S3Ar?=
 =?utf-8?B?L3l1SkM3Ymk1RUJ0SHBjTCsvS2JCRlJxZWJVVlZKZFdVckdMV2paVjUwZjc0?=
 =?utf-8?B?WTNmSkxtMWhMNld5UUhHcU85UjJQMUgzMnM1UGJScmpKdWlYSU9oYWJpZmR5?=
 =?utf-8?B?cnlZbHBWK1JqS3hGek1OZU8wWktCUGpyVkZEdFJMMlhFbFZ1T05tV3NlSnJr?=
 =?utf-8?B?aEl0UmcrMUJIM1ppS0FZWjJQdVFqbzNpL2xxQk1saWFGalhtYnZUbE5WU1p5?=
 =?utf-8?B?Vjd2TVhkRHhFck0wcE4rV1VnUzVSQ0RKcGs5QUpFK3dacUJwQmhuL3VuTDRG?=
 =?utf-8?B?MjlUdTg1ZGExQkt0dk5ZTkZ5ekZVU2dyNVB1Vmplc2FqZTdwNXU4MzFZQS9n?=
 =?utf-8?B?VVZIN3pnYzA1T3QwVGppU2U3ZzVsMVNIZFNFeVVXU1hSNHZnS1FiRWZQcG1k?=
 =?utf-8?B?dGlzZ2l6eStIQ2FadE0ySi9heG5sQ1h4T2t1dW01K1B5UUd5UkdXaFdLSDV0?=
 =?utf-8?B?d3JPQTA4WHpkUnh3anlMR3R1YzVUZ0NxL3B2YmowU2VUaTZhTGdqTEF3Vmsr?=
 =?utf-8?B?Q29PaGhuQ0x5WUxrKzFhdW5henV6a0NyQVFsSnpldUFETElSeWNHSHl5Qmlh?=
 =?utf-8?B?NXJkamJKVU9pZXNMQ051K1M5emRIQ0FMdHN5NXZ3Z0JpUmRCMHZ0SGtudDU3?=
 =?utf-8?B?cHUwcVdKTnlENisxZW51QXFLQUxuOTU2SFJWQm1oZlA3OWZYUjRGcHJqRUtJ?=
 =?utf-8?B?NG5xNGYxcHlzVUtzeloyZHFIZXVWQ3ZoWVRpdTRqWjJQUUN6MGZZNWJDVkNa?=
 =?utf-8?B?aXlla3orak9mZFJhVkI0aC93b0tLU1FOeFR6ZDJLdTFvUVNtRDVRaUt1cmFD?=
 =?utf-8?B?bFg0R3VOWkVXL2RYY29GMzhHeW1DZVJFRDFaaXZhZ1NFZis2RTQzY2VGaXdn?=
 =?utf-8?B?aDFOUUZkUjlMUHpQeTlDVnF3WFJJY0xrMjVYRU5PWnpOZEx5dExxVVFZcE1H?=
 =?utf-8?B?TkxMa0gyTlphUHl0Mit1TkdwVkhRZnpOZ0FvcmNHdys0OWxkSFhBUUpIRDNF?=
 =?utf-8?B?WitGLzlXVnVKNm43WWVVeHV2QWY3WDFsZnBIOW0zYUErYWhKOEQ5ZGV4U0ly?=
 =?utf-8?B?WldyVC8yU0swRDJwR0g3NlBiMFN3eDRjY3kvV1Q4Z0xtblRjSHIreW5yckIy?=
 =?utf-8?B?Nm9VQ1NZZkxkd2VsazdTOXpWOXJibGczVFVUTVdJMGdyOS9xSXZqZDAwMUcv?=
 =?utf-8?B?U1VTWXd0eDdQUlkwWDlqTkJ5VmZvOHAyOGlnQ1V3UjdTRFpjbGtORGdIcFVV?=
 =?utf-8?B?UjdyUUtveHpacFpxV3ZqNmkvTk5iSzRWR2pBQXVnTURoekJiOHhpcS9IYTRP?=
 =?utf-8?B?bC9NcnJxV0ZMR2lURUR6UFBrRmtvcTJEM1k4ajR2RE9COW56c2I3ZUE2NGFR?=
 =?utf-8?B?dG5xSnVneTc1SGRYNkVtYXptMEsvbjhkaXRYVE9RKy8xUG8vd2hjdmQ5UVk1?=
 =?utf-8?B?K3BUQVFCc2RLRWNBa0RYdnFzMTIvaGt3QTZLR0FZeldQTEJlMkdETnJyaHEw?=
 =?utf-8?B?cE1DclBGSHVCNFlpR2V1WVNweWdFdmFKUUxodERtWFlITWVtZTlXd1loaEJt?=
 =?utf-8?B?eUdhSmdtTTNzaStOODRDQlBEeGNUQTVwMHkzTTFNelBXWkxva3VEWDdzUytT?=
 =?utf-8?B?TlVHdGIvWVE4Uk9LTGhmb2FJTTJOeWUwNlFzSVNKMGg0bzFkRXJkdDNCQ1ky?=
 =?utf-8?B?TGNpT2piN2JBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ym9CeWJRaTYrait4Q1NDT0w2N3JmeWMwU3ZYZFNiVkx6eXMrMitra3VsbUd0?=
 =?utf-8?B?b2wxN1N6S0EyZW1ZRGN4RDJTRmRKakRBeTFiTHlOVmttVmJVNjFPV0ZSTENE?=
 =?utf-8?B?d1FkNG0vRHBZR2ZtN3p4bVdLSTV6cVczNmJkd3d4ZnM1NTNaNkpUSzF0N0lu?=
 =?utf-8?B?cWM0Yml2WlU3RkY2TWZVdmlNaW9ZUHZXLzNXb3U4MENOSXI3WG41R1REaGhG?=
 =?utf-8?B?STRtNlorZTlyOHNMWnh3MlhrK3B4U0JxOXgrTDU3cEROckhxdFFHd09ObE1B?=
 =?utf-8?B?a1lRYzhScEMza2VPSFRhVjNTWFgraFRsWVFDUXZVRTZvVWp1SVVjZUhjamFR?=
 =?utf-8?B?VkV4L1IzNStuOE8rQndpSUdEb3g2dHhNeFE1cE5KS0svak14WFZUWk5VdUQy?=
 =?utf-8?B?Q2pteEVuTG5JMDZpd0Fxc1lhOGFHR29WNVF4aGN4UmU4UjRXNlo1WUt3aVVz?=
 =?utf-8?B?dU5GNUV3dkxZaXdOMksvQUVTSitWTEp4K25McWhSdEZhZGJKbHRoZmNzbThO?=
 =?utf-8?B?UHIwWXFINzUzK3gzQ1pHQlV2OThKSVViNkNVcVYxUzNnMWc5RGlJWmpiTFBm?=
 =?utf-8?B?Z0pwaUV2SFZJWGRpVVc0cmh1N0g0OGkwem00THg1VkMySjgzOStkbitPb2Z5?=
 =?utf-8?B?bG1CamNOV3Z0MjVPcnpiQXZ6aTJ6TXF2OXI3eWRuSkJXUk5wbGxqSmlmQTU0?=
 =?utf-8?B?M1ZVSHhaVTBuQkRkMkFBdi84a0FodU9HeTQ5eTViWHBwS2ZiOWdreHJnQWZv?=
 =?utf-8?B?TG81Y1J3dE13MnFiYVY4UXJ0Y0FIOE5kWDZWbFZKMUo1cUdPdUE5MVJoNW8w?=
 =?utf-8?B?cUNSTFh3bE1BVEZmdlNSZHlaV2FjaTBTYXJvSkdySUgxRTU1OU03Z3dVMitz?=
 =?utf-8?B?cWFOQXFCamNiWm5EWFJHcWdjSkM1V1pJSE13TTV0VW8rSFFQWTZGT29qVTlD?=
 =?utf-8?B?R25sWTZEZVl1K3FuMG5TcGJTUzYrSUFkN0FXeU0rUkxSQzhUaXFPSmQ5NWRQ?=
 =?utf-8?B?bTU0L0Rtbm9jQjNsNkhYditmdTE5Z1hJdit1a1BleEZzcVpQdUJCbnBXVGth?=
 =?utf-8?B?K0N6NW5nNnBzWDVNNldNZ0JuODg3T3doYWF0OWZhd3V5TksxMitxNklwMzR4?=
 =?utf-8?B?YnhBV25FVXhzQlAyODVBZ21YS1FxVVRHNDNhVTM3dUs3QytrcmlrTnBlekZI?=
 =?utf-8?B?QzlZUldOV01Dc0Z1azhsaVMyTmFVTUs2b3k2NlBwQXpXN1A2S3FRMmhwajVU?=
 =?utf-8?B?M3FyMWFFcVVnTW9nKzRCcnQ0SXpKT3RyUk1vSDFkcTI2Uy9LQnNtNkQvVGhT?=
 =?utf-8?B?NjVVbGIyNSt0S1dWUUZyNGxRVFFmcjliZzVLM2x0S3pEazhDVmtmM3pDc1Nv?=
 =?utf-8?B?TFdJamt1RHZhWWVNb1NTT2o4Q09Oajcwc2VOMVl4QzFWcHFJNlRhMDFmMzNt?=
 =?utf-8?B?b0pmdUlaaGRWQnoxUE1DOUQzcXV3THRvclFPdHV5eEFlZTZ5Tm1vSHFZSGhv?=
 =?utf-8?B?T20wdmsxalF5MTJoQmZqdGx4RVpkdjdkODE5TVJmL2toUGN2YVpTeWx2Nk9E?=
 =?utf-8?B?aDNsNUg3RTE3MDZFVUpRYjFHQjJuZTZVK3FaaURiRlZzeXRCTG55dU5YUjJ6?=
 =?utf-8?B?WW1QVHRKNEc4TmM5Y3FWZUM2ZXo1TXVYK3hPQzVzU2l0dEs0YXprZUFLSytG?=
 =?utf-8?B?dnhkZm9vdXlhOGVoamlBV2sxUmkyVS9ROVJxaEpkWUZsLzdGcUYwd2lZREVk?=
 =?utf-8?B?YjBPWnNwUVlGR1RZQlU0RVFZbnJwekdyUlhRVEI1VmExWmtZcnJPRHBvelhl?=
 =?utf-8?B?R1krWjVzOC9MUVN1NzkzRVlXS3MwRy91VW5SNjY1UnluUGJPQnJ6NCt6MmRm?=
 =?utf-8?B?d0hSUzIreUpxaWZhZjR3MUhIaExuK3YzQlVNZHhIZGowYkM4UlBaZjRHVzFC?=
 =?utf-8?B?OFdvWlBRQU53SzFnZ3NpU0xBRzZ3TmVGbzI2dnlBTlVLeU5JSWd3UUkyOWFM?=
 =?utf-8?B?cW93T1kwNmVGMUxMQlhwWUlXQmk1eTcraElHRUZGdjJtTnMreGVyTnY2Rlls?=
 =?utf-8?B?RGVLeTlEZG5mWGFQeFVtb0drMGl1NDZhL0Q2NmFNei9iZSttQWpDRU1BdHFZ?=
 =?utf-8?Q?/ZD4VDPph988R5VSmdqoaALVM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81be442b-3a2a-4a07-7ec8-08dd8bee4ec9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:02:59.9432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJb4RcpvAJ05RkYSnxGU9uk/w2jB1ix+Eo0BW+fXkzM6jl0mfVggH/h8xWZwe7oL/JIh43NMiH4RgD6BTwd75A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/3/25 15:18, James Flowers wrote:
> Adds kernel-doc for externally linked dc_stream_remove_writeback function.
> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
> V1 -> V2: Corrected checkpatch warnings and errors
> 
>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index e6e41678525f..b883fb24fa12 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -569,6 +569,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
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

