Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AC89A9A56
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 08:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3046410E1C2;
	Tue, 22 Oct 2024 06:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RD60OXo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD8710E00B;
 Tue, 22 Oct 2024 06:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fnl38iX2HS1N/GZueqABmGb5wvP2I1ApNtkVtpc10ma5e7LD4yOpTFA3d6XMvOsGs6cGZGpt6QWAZ6rMJ1tgyCUzkt6+n+br9bRLWJXjT8T+YEoy71ut/EjfBrutEgpzL+kj1HxGMMRtU5Sna6N+bbJVjVgnR0BgPjsakcKS6NI2rrNEuRPzAOB30RuqPPNFe864Vzkk+kxfTLVbUl1EhPBZdSIpbos9E04BWPt2c7ohKyPyYBPObQerhqrIGIf0mupb4yd0uWuOAxNkosF/dfJp+Yr6qMpclG0XYjwgoZnqkJbBX3dsBzDGlROMmQp3H0aMiDURDPu2JbZ/ZwOb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NsHXUddaDh1FuHlj8Didtxi3e/KWxdqZMtZgcXCTyA=;
 b=SSXkUJFe0Nh5dR7cicjXvzgzKCwUBxCsNEM19wthviUNG5pLi21mDqC19A9qCib6j6xZ21b0e9amQHxnb65PYoUHL3Zf9VbQyLoncZIKZUEZ6xk2kxzMpmzpGEy7C5KOfVIXV4pJoWKAiTWXJShPofgIIM/TI/DOoSNng/SoAXsN+uigxfcCbykZYs1/c9xVSJIniLaq04XKvBM7JfFeYJBPuC/hucMVnhrDS3C5oxHLfrjfCCDQKzyI2/TFobDMhZmgGJ1jUb+SojgMvoZRcsjUgjMjOv58KXv9no3DUyKcMpL3jA71Yt04sjg/9uGcyEcNkCF/yDLnN8rGCY18bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NsHXUddaDh1FuHlj8Didtxi3e/KWxdqZMtZgcXCTyA=;
 b=RD60OXo9T8im5sNRjAMgzd02ik4og/76uhn4agXAggXJH4NuDhlxmqGJd6Rydxjt7dBxxjoovJkQ+NxTUTim2RlaSdnPhAfIFHHLqkA2h5MFhE5dQnw8oz+spQx+iFVsoRkhkARVw5awXZBCH8Hdj/c897V3n/XNnowzAYTm4vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5788.namprd12.prod.outlook.com (2603:10b6:208:377::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:58:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:58:26 +0000
Message-ID: <8a39170f-f631-4a5d-aad4-5d6f941f446c@amd.com>
Date: Tue, 22 Oct 2024 08:58:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] drm/amdgpu: remove unused function parameter
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, tvrtko.ursulin@igalia.com
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-2-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241018133308.889-2-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0231.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4701da-1e82-4be1-9f0a-08dcf266ed3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGgySlAyamIyM0tmVkVlNCtpYWlVMHVsZUU3UUxuTDhZc1F0SWtoTXA1dFdh?=
 =?utf-8?B?UENWNFJBdk0vcTlpb2s4cnNxYmJYSU9Wa0JMOXRoVm5EYkJDdHhaNzhIaXM2?=
 =?utf-8?B?ekdxMEZORklua2o2RE9XZXJhbXVUdk1xZ0poellyRXRKTCtoTU1kTGdGU2pS?=
 =?utf-8?B?dkNKNnZJUzYwVXo1c3o0RnZYQ2ovVnFjaXpIRURsRmlZb1NrUVY2OC9FN2E5?=
 =?utf-8?B?VmJHQTduT1hVOGQ4R2FNcFpFVXlyRCtVakxBNzFad1ExUDE0L3g4aWpyRm9m?=
 =?utf-8?B?RnBTWnlZUStnVVlKREJ4UjM2ZWd1QmJLU1N5NmlJM2VRb3VlWC9DSkg1RDdn?=
 =?utf-8?B?U2t1dFZTWnlVNHNnS0dyTXlRRzdRNHMxdnRKZjA4S3pGMmdyWitkWGpHVzJW?=
 =?utf-8?B?S3NtK2RxcCtMdmJKdUtzUngrbkNRbkVyMGs3MFNTVmV5T2Z4eElXNGswdWg0?=
 =?utf-8?B?SzNjY2NkQnl5TmQ4V2VEcVlTbWNxTnJFWHFrRG51eEpJdVhoKzZlemtMcld2?=
 =?utf-8?B?RHV2bHh4eGFkTjI2WEp1RTJDbVpGRzdmNkVyR1VjNXVteWZnc1grRjhybVQ3?=
 =?utf-8?B?UGswN1FxV3hHbDRYT05GdHpHZG9RN2J2ZkkySjhJUkZKYnVreXBDZ2dxUFpH?=
 =?utf-8?B?a2NCbXorVlNPVWFnNVZidFJzK2JHd1dCcitxQ242Vi9IY3g2MXY5dzRXQTZP?=
 =?utf-8?B?Q0ZWODlPaU5heEZrVzU4VjdOemt6eWpzSlRkNXBqT3FvV1ZqNGdkdnZRUURq?=
 =?utf-8?B?MmZHbGRyZ1JmQkFMUVpEWnRmenpERzFjdW1xRk9aVnRHdjd0VTJsakk2M3Z3?=
 =?utf-8?B?R0kxVVdjVGRrbkxFSmF2OVErSU9Ha252cVRRTXplYm1SZ2JHQ0xraitsNngz?=
 =?utf-8?B?T1ZITEhiUWV2UWpLTXZaRUFrUVJzeFE1aEl1SURNQkFPOFpONHdBSGl2aldv?=
 =?utf-8?B?MlpWZkRqblowc0FjQjdVMXFLd1FOVUhLdEZoek5STVhLd2FiZVJLVUF6TGJQ?=
 =?utf-8?B?NVVnTkwrYjczOWtvY2laMXlUM01jSk02SlRiNzhwRkRzSVFFTUF2ZVFEN1RC?=
 =?utf-8?B?cDNaNUF4OFhnWGVVY2xQa0VJcDRua1hDQWh3UGtrRHlDTE9BQmd0UlJuMjd2?=
 =?utf-8?B?UkdTMXc2NmdQbVgxK015dnEyZzVSLzhPUElWL0JFeTJvQjJ1bjRpUDFvU0RE?=
 =?utf-8?B?T0oyNWxSbW5idDB4N25JZkpQRUJkeHVjdmE3T0gxcVhwQU05cHhCRkYrUXNQ?=
 =?utf-8?B?R1UzZmRGRExYRUxyRXZKZ0lKOHRBa1ZTaFhFaFQ0V1lHRHdyR2hkdWFOWDA1?=
 =?utf-8?B?c2VmVTFEUGpyRHJLNlNGZ0Q1VjFwOVhlN3p5cDlCcnVFY21Jb0tVbnNpRFlw?=
 =?utf-8?B?dEFoa2JPdHMxRmRXdzR1eUpzaEpQSDZDQm4xZEl4ekZQL1UvRUdnK2NBc0or?=
 =?utf-8?B?VFpBeUlqMXpKcWFES1dEL0RoUzRkdXdlZk1XbnF6OU1Nc1MxOHMrZmQ3L1Va?=
 =?utf-8?B?SFpHTEpJSktNdjZyMk5MNHhxdkNkdEppVkp6SjFtMjRzTGFwT202R2lGNDhJ?=
 =?utf-8?B?N1I5bGRpNGZveExmRHFjZ1AyTmx1a1AyTm9JTVNoeXdDcjdyUnhjcTkyczUz?=
 =?utf-8?B?ZFR0Sys1UTAyZk5kWkY1WmR3OGVBdTZQRUZZRUZJY0E1OEFvdUM3b2ppUW8x?=
 =?utf-8?B?UXdCYUVTSFl3ZlE5d2lydzRERW1IZm9SZkxLcFhQUzFYbkJTYTlRQmtkbkNY?=
 =?utf-8?Q?uD4ZN1WjVuan2bQaZLmtnDRXdCbcGHoJb2W9+LO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytVTTd1VWdQcXlhQTU5ZFo0UlVqZGU5QUhWa1JReEtMK29RQU11aGs3RnRt?=
 =?utf-8?B?UTlubHN6SkVsVnFEQXBWemxsRnpxQzEvWUYySGtyYzhleW9oL2NSZTZzTkto?=
 =?utf-8?B?K3NBMlRVQmEwYmhzMitEdGRVeG0vaHRydlA3SnJ4RDh4YWlrNlVQWjJiRkdO?=
 =?utf-8?B?cFJXMGNqazZnOUY3c2F6RmZUYXowZ1RKK0NFQjdCYW13SzZpdW9JazhnVm00?=
 =?utf-8?B?ZWVVMVEwelBOdGlmREhWdC9zeCtNV2RhM3BDbWFJblMvejJ4WVJFRDJVWUdO?=
 =?utf-8?B?QUdoYWZFdGpyNnhneEZRbDFTNVIzU2dZeGdDSzUzTGxFZGxyaTd6SlQ5N3pF?=
 =?utf-8?B?bVVBeE9ja3BtbmhMZEpoUGNNSTR3VHM0cGNCVHUzMlhmaVVtWWpPYmwxT2Uw?=
 =?utf-8?B?WU1UcHduQnFnK0tXa1dyUnM2R0QzbDJnMXJWdm9lZjF6TWFmM3dRdWJwM2xW?=
 =?utf-8?B?c0llalZzbjlncHB6cWNTbHBEV05iQ1l5L2p1d2tkQkRLMWMwTGhvOGV4VFlJ?=
 =?utf-8?B?aXBsdDJ1V2xCdFB1bFNTcEt3dmk5RFRTNmU1RmRaMXkyeGo1Q0d1eDl3WmpR?=
 =?utf-8?B?Y3hpeUtFd0FNM3NnNEh3QlU3WXErQUgveVBqbmtzT21OQU12VzZaUFFoMGpX?=
 =?utf-8?B?dk8ycVUrTGRjVWt2SkVHenpZdDI4ekhTMWJlTXVCMnh4RDdnb0NFNTNjMnh4?=
 =?utf-8?B?TTZqUWtjR1daTDJCNUVkR2RWZEJqK3liM2dCOTFrOWZwY1RZZUNNelhhSzln?=
 =?utf-8?B?Rnh6S2xTVUZoYkUvNDRURVpaT2tjclk5bVNrb3hTRStZdzM4dm5TSnhRaFBa?=
 =?utf-8?B?NUZXWDBpVU02T3JFanN4amRabk5TRHQ0VnBVZ0E5SUZrQzIwM1ZOMGltMy9T?=
 =?utf-8?B?UG0vSWRlM1U4TVdsZGRiVEFCR0tVOXVsUmxBMU1OY3luMGpMZzg5SENSRHhR?=
 =?utf-8?B?N0ttL2NlUkk1dXFESzdBNWU3dHM1YnkvWWNsT09HWDlDc0loVUQ0MFkrT3Na?=
 =?utf-8?B?VkNBR2FTYVE3T1c1U1A4Z24xK1VHOEZYV0Y4Z0VoTXpGbUdrdnptdEk4eGIw?=
 =?utf-8?B?dVdIcXJnVFBZMURsdDBBejZCSVJZV0VwSml0L2RwK1BIQS9INEZLcHZTR2cx?=
 =?utf-8?B?cm5lWWlJYXJZY01yWkdVMzgvZkJ5Z1pXWHFXMzdoTlFIMU9MeTRRV0s2dW1Q?=
 =?utf-8?B?QlRFZnkwVXAxUmxBSEhjczVQNWRTb0kxc2E0dXE5NzB5eVErMFd0eGRCcGMy?=
 =?utf-8?B?R2lyZEtoZ3VVRHZSU253TWdvSlZkUWsyU1RVaVhYQ1lEQVE3U0Fkdjh2QW1q?=
 =?utf-8?B?cFdnUzFrUUxYK291TitmaHhkUGRtUzhhYWx4cWhyNmp2ZmpOblo1emdZRHp2?=
 =?utf-8?B?cldHa0E4aVBNejFOZTBKeHN1QUovOU9pUWJPdnN4STdMZ2hCeEY5VVRmTVZy?=
 =?utf-8?B?MHkweGdnNDI5SW9EZGErQTAzRnNJZ2ZVOE9MRVMzV3JydkJyV29DMXhzeGo2?=
 =?utf-8?B?c1kxTlhMS1h4Qk5Tek9EVjRCNUxIWGlmcnF1WnIwUHFsQ2d4VTV3cFdHNk1h?=
 =?utf-8?B?UE1DaXVNcC9Iakwwb3J2emhOWkRENytvTk5hNmxHdDVjdzJiWEx0bmpvSUJC?=
 =?utf-8?B?dE9abXVzeTlaSHBETFR4U3FZSENhcjl4VzdaRFFUVm1kNkpHSHdjVlh0N1Vo?=
 =?utf-8?B?NEUrQ1pDTVd5M0V1K2JkT3p1UlZBTUMyRHRGd3JFVlN4b1pZa2htZWlCMnZJ?=
 =?utf-8?B?RVU4alNSRXhvVHpEeTNZcTM0T0ZtQTN1bkdublJ1b1hFWHhMNXhHNG94Zjlv?=
 =?utf-8?B?ZlRXTUo3RHB4dEJvck9VbkNJN0VpZWFyWXNPNUdheW83TGJSK0U2Q2JBU0hK?=
 =?utf-8?B?VlpUK0pWQ0lYVHF0QnhsRmUyUmJUYnhNejlud2YxZXVmWlRFOWZ6M1dDYVhI?=
 =?utf-8?B?dnBKbHhXNG56di9RUnVRc3c2QlZ3cDc1ckd3Y1IxUk1mS2JySHhTUkxRM2xW?=
 =?utf-8?B?SHR1NGJQWU9BSHRuRlMwYnVuY3daY0ZkUzZ3SFI2Wi84cjdnNmxONHcyREFE?=
 =?utf-8?B?MTJoc1FOUkY4blB0QjdTdkY4RmlTek0rb29FMnhITjhpRDMzeXRwK3JCVW9X?=
 =?utf-8?Q?t/tTg4Jw4kQIoOu+CmHtIgc2/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4701da-1e82-4be1-9f0a-08dcf266ed3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 06:58:26.4175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP4hfk7eRKir4k2XGcK4D8TMBLPFH3oFwfryijiJdyJgy6MKuLrrZ9rWGFbw0y5X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5788
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

Am 18.10.24 um 15:33 schrieb Yunxiang Li:
> amdgpu_vm_bo_invalidate doesn't use the adev parameter and not all
> callers have a reference to adev handy, so remove it for cleanliness.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 3 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 4 +---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      | 3 +--
>   6 files changed, 7 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d891ab779ca7f..471f3dc81e8db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1105,7 +1105,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	 * We can't use gang submit on with reserved VMIDs when the VM changes
>   	 * can't be invalidated by more than one engine at the same time.
>   	 */
> -	if (p->gang_size > 1 && !p->adev->vm_manager.concurrent_flush) {
> +	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
>   		for (i = 0; i < p->gang_size; ++i) {
>   			struct drm_sched_entity *entity = p->entities[i];
>   			struct drm_gpu_scheduler *sched = entity->rq->sched;
> @@ -1189,7 +1189,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			if (!bo)
>   				continue;
>   
> -			amdgpu_vm_bo_invalidate(adev, bo, false);
> +			amdgpu_vm_bo_invalidate(bo, false);
>   		}
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 8e81a83d37d84..b144404902255 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -345,7 +345,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>   	/* FIXME: This should be after the "if", but needs a fix to make sure
>   	 * DMABuf imports are initialized in the right VM list.
>   	 */
> -	amdgpu_vm_bo_invalidate(adev, bo, false);
> +	amdgpu_vm_bo_invalidate(bo, false);
>   	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
>   		return;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 1a5df8b946616..bc1ad6cdf0364 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -839,7 +839,6 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *filp)
>   {
> -	struct amdgpu_device *adev = drm_to_adev(dev);
>   	struct drm_amdgpu_gem_op *args = data;
>   	struct drm_gem_object *gobj;
>   	struct amdgpu_vm_bo_base *base;
> @@ -899,7 +898,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
>   			robj->allowed_domains |= AMDGPU_GEM_DOMAIN_GTT;
>   
>   		if (robj->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
> -			amdgpu_vm_bo_invalidate(adev, robj, true);
> +			amdgpu_vm_bo_invalidate(robj, true);
>   
>   		amdgpu_bo_unreserve(robj);
>   		break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 1e6a044e3143b..045222b6bd049 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1148,7 +1148,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   			   bool evict,
>   			   struct ttm_resource *new_mem)
>   {
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_resource *old_mem = bo->resource;
>   	struct amdgpu_bo *abo;
>   
> @@ -1156,7 +1155,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   		return;
>   
>   	abo = ttm_to_amdgpu_bo(bo);
> -	amdgpu_vm_bo_invalidate(adev, abo, evict);
> +	amdgpu_vm_bo_invalidate(abo, evict);
>   
>   	amdgpu_bo_kunmap(abo);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9d6ffe38b48ad..9fab64edd0530 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2139,14 +2139,12 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
>   /**
>    * amdgpu_vm_bo_invalidate - mark the bo as invalid
>    *
> - * @adev: amdgpu_device pointer
>    * @bo: amdgpu buffer object
>    * @evicted: is the BO evicted
>    *
>    * Mark @bo as invalid.
>    */
> -void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
> -			     struct amdgpu_bo *bo, bool evicted)
> +void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
>   {
>   	struct amdgpu_vm_bo_base *bo_base;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index c5b41e3ed14f2..428f7379bd759 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -515,8 +515,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>   			struct amdgpu_bo_va *bo_va,
>   			bool clear);
>   bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
> -void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
> -			     struct amdgpu_bo *bo, bool evicted);
> +void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
>   uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
>   struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
>   				       struct amdgpu_bo *bo);

