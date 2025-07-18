Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECEB0AB2D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 22:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE23710E04B;
	Fri, 18 Jul 2025 20:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2g5ybH8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B7B10EA42;
 Fri, 18 Jul 2025 20:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4So5yqafe9oRAVMwLim02dppN7WF16sR9xwOcN0L4ekOFzjqACUzoxgjwR6vWT6u5MHH0FM5KU1Jd0Rg3EMKGpw9NvJxjbETCVxE1iLo73CHNAIP1UUe4GBHUaX7uYuM/1lXKpIhgU3/+9qM1YU+ueyM6QIYvk/13+ii/F0ZFLURXE8M8L6p7DhcBR1xJQAFLgN5Jt3RwAhWrdZ8XZQznmr2ItT8e/IJeJaCuhARuKgJjj+sXMDdyOYtGfU/15i8xVdGEwZdyxHBIy0xbuJ6sEExtwvLuduGLE8NuczXADdusnzqk9PZNaI+7+MO8hvYIK5J4XiRONxxBdZFw4syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MrddfwSAbNK65l5C19NX9DWfFjxN7hlGlmuo4copjA=;
 b=JMbw+s3Y2kmoyoDOX0WkR2fTR91zBhpRiPhXqBTmgccQwF5NaDsOZBIchAP7d1TYka/5Pyo2daatStgItAnzTkPC/+qNe+rJlTdxu2P8vNgyHW65PXcPh0xIn7QSgunyyl9esZZ5APq+aIKjjtTiGG01o8v9Mkhq1Xo7Ug/jsQy6oQSRfdkK9WfHy4Ei0kGfWPBCh9DuhEA9z1j519lcKwtRZTUvjwRho5xiD+djrOEe32LVkAqx7PUlsCsCEpZqa1s5RQ0BdBXBHNGgn7C5PUwk/8Eu8MQeCstN8QEiT+JmIpQiGgl1MruFCHgI1xSS6B+V3nCQ1gwdZNJ4ESKYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MrddfwSAbNK65l5C19NX9DWfFjxN7hlGlmuo4copjA=;
 b=2g5ybH8xzyO5G0KdYnS9O1d3uaNjmWBKpwihI7Cgb5J6ZWtwrUplHm7hlVrYgXm27OoH84jcSaRhErhg3y8pyT1UthNdNKxH9ouxl+cVcWv+2G1+NKfkgId/eJJscavtxs3JAbnf1qlyLMqJmPS2PUTzYyHoyc54e3MXhcgLl+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7210.namprd12.prod.outlook.com (2603:10b6:510:205::17)
 by SA1PR12MB6869.namprd12.prod.outlook.com (2603:10b6:806:25d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 20:46:14 +0000
Received: from PH7PR12MB7210.namprd12.prod.outlook.com
 ([fe80::54c:74b2:5935:6041]) by PH7PR12MB7210.namprd12.prod.outlook.com
 ([fe80::54c:74b2:5935:6041%3]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 20:46:13 +0000
Content-Type: multipart/alternative;
 boundary="------------zOUjKZsFSAm1x0LLc532qB6T"
Message-ID: <e596c2ac-e9f0-4197-839e-fe75172c4cea@amd.com>
Date: Fri, 18 Jul 2025 16:46:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: update mmhub 4.1.0 client id mappings
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250718195738.2919761-1-alexander.deucher@amd.com>
 <20250718195738.2919761-3-alexander.deucher@amd.com>
Content-Language: en-US
From: "Wu, David" <davidwu2@amd.com>
In-Reply-To: <20250718195738.2919761-3-alexander.deucher@amd.com>
X-ClientProxiedBy: YT4PR01CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::10) To PH7PR12MB7210.namprd12.prod.outlook.com
 (2603:10b6:510:205::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7210:EE_|SA1PR12MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 75baa59e-3b24-42c2-6e31-08ddc63c226b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFhBMmtvQjdMazJuTkc4SGpwSVVZYXRFdTFTdHcwSmpqa0FaRTJKRjUvNnBu?=
 =?utf-8?B?eUZnZEtMTkRFME9BU0pCZVRzYUlQaU00dVVsWU5OV0J4VmN5ZFNkdXM5eTJF?=
 =?utf-8?B?eW5VdWtoakladnh2NUJ4UlRnbjlYUERXL0tVTFArUjhSWnRRVjI2QjVKb3dN?=
 =?utf-8?B?V3NKWFZRQkEwLzlYYmdLRGVJNmp3SWtJcy9mbkhSS2RBN1NadXJxL1l1VHJx?=
 =?utf-8?B?MFVHZmRvcWhGaUd4ZytqdThHdkFaNGticXlITStEVEYrdGtwV3FnTWVFV0tm?=
 =?utf-8?B?dW5nSVRMYVk5WDB0SVR1b0h5TkJlcEl0b2RnT1R3SnBTS2dYSERtWHlzVmlD?=
 =?utf-8?B?cmNqNy9iRUVpcmRLYWduSjVXN0JzMGZMYWVxd2IxeGlTL04xc0xzK0J6YTVL?=
 =?utf-8?B?c0RLU2RWdWlyTGNCTTllWUc2cGh5ekJadXYxWVllU0FzdDB0TzV3SjdKR1o4?=
 =?utf-8?B?RjZnNitaWDFUWGxJU25ZTVVoVTlaS1RYYkVEdy91WjBranZIT3lHRHYvUUl6?=
 =?utf-8?B?RzFNYUdrdGdheWxYYkFRNkRDZE1KbDRsejI1ZGF1VEIxNi81d05xRkVDZTVY?=
 =?utf-8?B?TGdDcjloZWEyZndTMTIrSytHZm4rcU12ZTMzN2tOSjg1b0lnVWpnNmtkS0Ez?=
 =?utf-8?B?Nld0UlVYVVVoVGpiU1I2ekE1cG5GT2ZOcDlPM0ZKbHJKS0U0U3pZZVhFRTFm?=
 =?utf-8?B?MmVMUGlUOGxILzdRNmRackZueERrbXArcUwwd2JCdndBK3lwNHVVZ2FkYi85?=
 =?utf-8?B?SExaMFAzZ2VuYWZxZXo0V0FlY21uOFNVR3hnR1ZNM3d1UndUM28vRW1IaER1?=
 =?utf-8?B?Tm51WmpkeGhpb0dZQjcvQmZlWFRZT1ltZjJQVTNudlFpT1cycGpzd1NjRGdl?=
 =?utf-8?B?TEMvKzhEZ0lOakdSeXpBeEhCdGExUmNreE9pVmJ5b200bzRLVldLTGhZUE51?=
 =?utf-8?B?ekNFMzVlajZsWExvOCtKRC9hWEgwZnYycG0ydW4vOEhHTjhSRWU3Vk04RXda?=
 =?utf-8?B?SmYxdUt5ZHcyRy9aVkIxb29taGNVNWl4NExDdjRsR3ZvakFtcllwTmlyYzJr?=
 =?utf-8?B?cW1raWdFdExUajZVY3FKOVhRMExReE5ONVNNUFN5VUNqTUVDaTZDQmswdWt2?=
 =?utf-8?B?QnphM1ZURnorcmpHYUFjYXp4azRFZWNQalR0b1JnbHMzR25PUStIZDV5WXZv?=
 =?utf-8?B?UWlMVGRYYnE5SDRIamNVQ3ZMUHAwR2NWV21EZnBBdm5JWWFiUE80bmRJQXE5?=
 =?utf-8?B?bURoQnhYVkZpRFVtNHNOeUhXY2xjRHNvV3cvR3FPQ0h0ZnJSN2FJSTRDemww?=
 =?utf-8?B?U281eHV1dEtsRWVPQk5nSHNDU2lPV1JaaUdWRWVZV1hEeEFkOUV4dWZBU2RD?=
 =?utf-8?B?anUxSDZXMlN6UGNqOFdUYUlYZDBZWVozcVpqc2h0ZEV2dUQ1bEFoT25senJq?=
 =?utf-8?B?Z0pucndzY0ZTeWpUQXJzSmd2UU9tczFXM3F3Mld5T1R4UzBlRHJiTVlrY09k?=
 =?utf-8?B?LzlzZHFEQ09IMXNPMVZLanhTeHptWFZFek5HdlFXRTRCWVJlQW85bGVqNVpC?=
 =?utf-8?B?OThsL1dYVFVja3JVREdwamRWLzczQjZTRTd4azNXOVVjb1ZsRitRdm5WQllx?=
 =?utf-8?B?VnhXZlp4VTF2bXY5M0VnRGJUNi9tMnAyUk4zTHBpbElRUTlBa2VMUCs5S0hL?=
 =?utf-8?B?S0hLMFhCOWFKR1piRGpVbFJnczlTaGdZSGhMWWlPWFNJUGZVd1VpdWJtb1JX?=
 =?utf-8?B?Y3JEQUxlNDAxQUduV05YNnRxaWt1YUtObFh0U25yeWovaHhQb0toRDVnY3d5?=
 =?utf-8?B?VGVxMFVRbHAxcnRVMTNNYU55eTF0V1lxVTZkbXFTUDJHU0tncmlWOFowQ0Uy?=
 =?utf-8?B?cjZiM3FVaTBMeU5KNTlLRFoxcWtKWGNsbGY1akJFWWlrZnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7210.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRlQ29HbFBJdEx0Q1RGcWgrOXIzWFJTL2dWd2duUDJlMWhXS0pWc0dhekgr?=
 =?utf-8?B?bzdjcVJUdVVvMjg4bVpHQy9rTUw1MUJybUx1Y2dUSXQyTUhDVUVVU2U5SWpw?=
 =?utf-8?B?TjM3cTMzZ3RnVE00T1FpVnExWkFtNWVnYStFL3ROZmdtNGFabUpveFc1aUdZ?=
 =?utf-8?B?c1JyNi9uaE5XN2tPL1pyYnZyaU1VV1VNMlY0bVBjZHBaOGNsdW43ZmhWMmIv?=
 =?utf-8?B?SzE4emVCQzNZRUhlZ29NUDFMVzFnY0Fwb3BWUEsxc1FEeUszMVI3U3Vpdk1i?=
 =?utf-8?B?SmFMdEVQR04yZWY1VHN5TEpUTGhQaHpFYjEwSmJFVnNDbXkwVFRjYWszdHFB?=
 =?utf-8?B?MFI4NFh4QUtxM3AwNzlFL1pXaHcwQkh2Yy9iczJLQW00cW1JaFkySGYrNk5S?=
 =?utf-8?B?V2hhQTRzS3gxS3c5Ujk0OXdZSVhvd05nU0ZtMGZHdCtwUFgwSzhNOXJrYTlp?=
 =?utf-8?B?OGVwQzBPU24vUyt0U1BGNllSN1ZFSk96cERUSVFsTTJyRk1hWWoyK1N0ZG53?=
 =?utf-8?B?RG5YV1BzRnJpKzVmVG9SN2JXWWMrY1dEWHl6YnU1RUI3VTVVYUNKajQ1bSsy?=
 =?utf-8?B?TUtNVTFuNWZNNHkyQkpTNzVDL2x0di9rVjJkcDQrdXk5ZVhTUCtxcGRlWDBh?=
 =?utf-8?B?ZE5WSUdKTXNQdVpFR2R0TjlCN2tpUTNqME9aOHhoSkgvdW94ZHBDRmxiNitB?=
 =?utf-8?B?RTBMR1E2ZkF0dmsvZEdzbHc0WngwRkxMYkd5TzJ0Q2FoQ3FXQklVLzNQcTJK?=
 =?utf-8?B?ZUNaMzBuYS9ORlpQNEZyQU5xRlI3YXk4eHdibEoyaFJNamJkM1R4Zis4VmpF?=
 =?utf-8?B?OUZNMTBlbUYvL3d4Z0FTNFJxeVlIeE44TUo1NWZOcnZlUURBV1Q2Um50cFBs?=
 =?utf-8?B?dnJOdW5JR2dKalp4N09BOHNNL3dBbTUzcFFuUUdveU5UYzJiOGRuNml1RFpN?=
 =?utf-8?B?cmFDUEpaczcyYy9nRHNZYmRpa3lyL1ZDSm1GNmtmOTdPOWVqQUhubmFtNGZx?=
 =?utf-8?B?NUtkRXdhSHNPV21LbjM0K0xLVXBmK2E5bTlTMHhmbDFBa3NlVGRpY3BiejNL?=
 =?utf-8?B?ei9oSUE1dzcwaUZOYk5vcFNrajFMUWlZTzBQOFg1NE56OTMyNkFtNjl2Kzk0?=
 =?utf-8?B?RElTWFZKcE9zNXpjY251WFdIQzErREkxTXptZUJuaW4vRXVZZzYvUFFuMDc1?=
 =?utf-8?B?a3JnNndsZEgwM2tpN3hqV1FLR2lyR1FVWnRISEMvQ09WUVY1ZXk1cHlTU1Ax?=
 =?utf-8?B?dTQ0K1FUMXB2ZmFMb08rL1BtYTlrMFptYWU4WWZGQmlNdHM1bXlHQ0d0dVVW?=
 =?utf-8?B?UUxtV1FXYWRvVDR5eGxEbnlKU1VYakRVL3psZHlqT3FRMXlaK2lNTTROWE9J?=
 =?utf-8?B?VWJ3NXRNY1VIajlON2VaUUp6RHFuQlQwOExRUndTUWNQMFVmZ3RUUjRlaytT?=
 =?utf-8?B?a3pIL1NrTGszdStrdzZjVG9HYmFpN0t2RTdXeWY5d3FPbUVnSUJXdWNyMEJ1?=
 =?utf-8?B?L3E3ZkFkSHBMSjJLRUhxbjdIL0todjdSbTg0WitPYkpoS0hrMVVEYisxcGl0?=
 =?utf-8?B?ZTloQ2lGRDdhNDVPTWFOVVlabkpnN1k3Y2duNkcwTWRoSFpWMWZoOGhtSUNk?=
 =?utf-8?B?YWRGL2EvMVFOWlYwbTdiWDJ3RFFOOU02aFRPaEdvanFsUm0ybWVpWUs3V3RB?=
 =?utf-8?B?ZnhBRmxlK2E1T1RBRUFiQVAvdFpvWFBrbjlsbjJQL1lUNnlIcUZkMXBEZkor?=
 =?utf-8?B?OFdFZHdPS1U3d2ZPL2J1dlNsd0dMMmhPenNxVkV2VnVzZUpjSEFHcVZlZ3FF?=
 =?utf-8?B?UzdlODZPam4wa3Urbk0yOXhSRXpneGFUeEQwZHNULzZNRnVkRW5IcjIrRklt?=
 =?utf-8?B?QTdLL0lyL2ExaEhRSmNsbTBEY3p4Njk5eEFaYnVaSmdQRHlVbFN6amI3RnJY?=
 =?utf-8?B?ZytPakVwcDU3SHB2ME8rUlo3TmdGNTRlSG10MDJUVy9wMUNaYkNWVGJZZ0xC?=
 =?utf-8?B?SW8xek5yLzV2SWdURHU0TUhLWlZBa1VHRzVCWUJjZnVGQUJMMnZJZUFYSHNQ?=
 =?utf-8?B?T2ZjVEswRTN4SUdVYm0rYmJzcm5ta3FiZUd6Z3FTbWdvd0hWKzJQVGRsbUJ1?=
 =?utf-8?Q?hdpEDF5c27zEGBOrlxINgvhNX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75baa59e-3b24-42c2-6e31-08ddc63c226b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7210.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 20:46:13.7675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aNDhwBQVBJp3TFrT4C0uRKvCijvBhXwpHBoIhyHZpD5ChKQXc+1AoxmDq5eYAAoXb9f1ZVpBPk+Bht3CqdQfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6869
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

--------------zOUjKZsFSAm1x0LLc532qB6T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

thanks!

Tested-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
Reviewed-by: David (Ming Qiang) Wu <David.Wu3@amd.com>

On 7/18/2025 3:57 PM, Alex Deucher wrote:
> Update the client id mapping so the correct clients
> get printed when there is a mmhub page fault.
>
> Signed-off-by: Alex Deucher<alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c | 34 +++++++++--------------
>   1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
> index f2ab5001b4924..951998454b257 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
> @@ -37,39 +37,31 @@
>   static const char *mmhub_client_ids_v4_1_0[][2] = {
>   	[0][0] = "VMC",
>   	[4][0] = "DCEDMC",
> -	[5][0] = "DCEVGA",
>   	[6][0] = "MP0",
>   	[7][0] = "MP1",
>   	[8][0] = "MPIO",
> -	[16][0] = "HDP",
> -	[17][0] = "LSDMA",
> -	[18][0] = "JPEG",
> -	[19][0] = "VCNU0",
> -	[21][0] = "VSCH",
> -	[22][0] = "VCNU1",
> -	[23][0] = "VCN1",
> -	[32+20][0] = "VCN0",
> -	[2][1] = "DBGUNBIO",
> +	[16][0] = "LSDMA",
> +	[17][0] = "JPEG",
> +	[19][0] = "VCNU",
> +	[22][0] = "VSCH",
> +	[23][0] = "HDP",
> +	[32+23][0] = "VCNRD",
>   	[3][1] = "DCEDWB",
>   	[4][1] = "DCEDMC",
> -	[5][1] = "DCEVGA",
>   	[6][1] = "MP0",
>   	[7][1] = "MP1",
>   	[8][1] = "MPIO",
>   	[10][1] = "DBGU0",
>   	[11][1] = "DBGU1",
> -	[12][1] = "DBGU2",
> -	[13][1] = "DBGU3",
> +	[12][1] = "DBGUNBIO",
>   	[14][1] = "XDP",
>   	[15][1] = "OSSSYS",
> -	[16][1] = "HDP",
> -	[17][1] = "LSDMA",
> -	[18][1] = "JPEG",
> -	[19][1] = "VCNU0",
> -	[20][1] = "VCN0",
> -	[21][1] = "VSCH",
> -	[22][1] = "VCNU1",
> -	[23][1] = "VCN1",
> +	[16][1] = "LSDMA",
> +	[17][1] = "JPEG",
> +	[18][1] = "VCNWR",
> +	[19][1] = "VCNU",
> +	[22][1] = "VSCH",
> +	[23][1] = "HDP",
>   };
>   
>   static uint32_t mmhub_v4_1_0_get_invalidate_req(unsigned int vmid,

--------------zOUjKZsFSAm1x0LLc532qB6T
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <font face="Helvetica, Arial, sans-serif">thanks!<br>
      <br>
      Tested-by: David (Ming Qiang) Wu <a class="moz-txt-link-rfc2396E" href="mailto:David.Wu3@amd.com">&lt;David.Wu3@amd.com&gt;</a><br>
      Reviewed-by: David (Ming Qiang) Wu <a class="moz-txt-link-rfc2396E" href="mailto:David.Wu3@amd.com">&lt;David.Wu3@amd.com&gt;</a><br>
    </font><br>
    <div class="moz-cite-prefix">On 7/18/2025 3:57 PM, Alex Deucher
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250718195738.2919761-3-alexander.deucher@amd.com">
      <pre wrap="" class="moz-quote-pre">Update the client id mapping so the correct clients
get printed when there is a mmhub page fault.

Signed-off-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c | 34 +++++++++--------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
index f2ab5001b4924..951998454b257 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c
@@ -37,39 +37,31 @@
 static const char *mmhub_client_ids_v4_1_0[][2] = {
 	[0][0] = &quot;VMC&quot;,
 	[4][0] = &quot;DCEDMC&quot;,
-	[5][0] = &quot;DCEVGA&quot;,
 	[6][0] = &quot;MP0&quot;,
 	[7][0] = &quot;MP1&quot;,
 	[8][0] = &quot;MPIO&quot;,
-	[16][0] = &quot;HDP&quot;,
-	[17][0] = &quot;LSDMA&quot;,
-	[18][0] = &quot;JPEG&quot;,
-	[19][0] = &quot;VCNU0&quot;,
-	[21][0] = &quot;VSCH&quot;,
-	[22][0] = &quot;VCNU1&quot;,
-	[23][0] = &quot;VCN1&quot;,
-	[32+20][0] = &quot;VCN0&quot;,
-	[2][1] = &quot;DBGUNBIO&quot;,
+	[16][0] = &quot;LSDMA&quot;,
+	[17][0] = &quot;JPEG&quot;,
+	[19][0] = &quot;VCNU&quot;,
+	[22][0] = &quot;VSCH&quot;,
+	[23][0] = &quot;HDP&quot;,
+	[32+23][0] = &quot;VCNRD&quot;,
 	[3][1] = &quot;DCEDWB&quot;,
 	[4][1] = &quot;DCEDMC&quot;,
-	[5][1] = &quot;DCEVGA&quot;,
 	[6][1] = &quot;MP0&quot;,
 	[7][1] = &quot;MP1&quot;,
 	[8][1] = &quot;MPIO&quot;,
 	[10][1] = &quot;DBGU0&quot;,
 	[11][1] = &quot;DBGU1&quot;,
-	[12][1] = &quot;DBGU2&quot;,
-	[13][1] = &quot;DBGU3&quot;,
+	[12][1] = &quot;DBGUNBIO&quot;,
 	[14][1] = &quot;XDP&quot;,
 	[15][1] = &quot;OSSSYS&quot;,
-	[16][1] = &quot;HDP&quot;,
-	[17][1] = &quot;LSDMA&quot;,
-	[18][1] = &quot;JPEG&quot;,
-	[19][1] = &quot;VCNU0&quot;,
-	[20][1] = &quot;VCN0&quot;,
-	[21][1] = &quot;VSCH&quot;,
-	[22][1] = &quot;VCNU1&quot;,
-	[23][1] = &quot;VCN1&quot;,
+	[16][1] = &quot;LSDMA&quot;,
+	[17][1] = &quot;JPEG&quot;,
+	[18][1] = &quot;VCNWR&quot;,
+	[19][1] = &quot;VCNU&quot;,
+	[22][1] = &quot;VSCH&quot;,
+	[23][1] = &quot;HDP&quot;,
 };
 
 static uint32_t mmhub_v4_1_0_get_invalidate_req(unsigned int vmid,
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------zOUjKZsFSAm1x0LLc532qB6T--
