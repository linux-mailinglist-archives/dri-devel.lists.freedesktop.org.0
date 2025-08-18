Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EEFB295C5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 02:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77FF10E185;
	Mon, 18 Aug 2025 00:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VG8kDLIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569E410E185;
 Mon, 18 Aug 2025 00:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9/n4qcVL4VzzSyTrTx4kMfdLiD+8yhkp36T2vckQIeReLaaqZaK8e94kWXWL+QovfCbHQD0VfUi/hzmYwF6iEFXv3GeObewc08zvzzhLlA7vtVsspYpe9sOSfokufH+3qzmsvJEICdURiwUmTJCr25Opt00U8qed+hXSdUJ4qnQg1n5Cd7jF0tSyo+VyXHGVXymas+N9/Jhwgus49XVl5omIPEtzdBEK8Ewij+4tkCRI15140KqOw5tzKt6HNNYcEw8WD6fCodgXE5G1Wi43x9jKJCPKOWFOju8jZTK05+68GHQB/mS8dxV0sxHwBXeTR4zrs2gpvLlSKmxPfX+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmOcxdka0TMRFzDOeek8t0dfbMuf8LKkUc5OnC9oTM8=;
 b=SBs+a7wO2oxo+gbilmNysMDT8nOdoTj+L8q7u4zRF3K4q33UTJmIQ6fFN+TJ+qpZ06MLstJxL4MTxSwdLxbju8Tj8yRBOZBgXfELX/Kz7uXP6pZEqI8KGis5xkb4mz7ztbjGvJiYRBk0Kih+e1ULU/RZTDKgzDCwpUXreNtn7MpMh8NbxTuWNYoyGnfJrOcnJGsqp9jkOtmWtIsWZeLKGJ2kRJoIQEgq13U6dLY2qT/Nx/poLySaB3l01M26pShjS2g/WyjpcP7elXVsP3mfC0Cz+NqM6iu61ZMsEM2GmYNZilDUa8r5oaYiw88IK3dwNwDc4C+HrqOT/FYt2alBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmOcxdka0TMRFzDOeek8t0dfbMuf8LKkUc5OnC9oTM8=;
 b=VG8kDLIh/BzQ85CzNjsSLYzBABa/2VkR7KziIDc2aF1FfMUGS193nel53TKetrbEAG+phs67UoAq/vOx3GRVDSWt/t4bK06WEtIbTMjcLRSr5RQVT2Ibzfm+Q7ZjT6cgAlS9A8U0HS1TKECCcFtHNUQJq24AOkrpIpYODPJdYCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Mon, 18 Aug
 2025 00:01:32 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.019; Mon, 18 Aug 2025
 00:01:32 +0000
Message-ID: <70c3f221-04ca-4ae5-8726-7c5782641822@amd.com>
Date: Sun, 17 Aug 2025 18:01:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Clean up coding style
To: Xichao Zhao <zhao.xichao@vivo.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: siqueira@igalia.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250731075450.626428-1-zhao.xichao@vivo.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250731075450.626428-1-zhao.xichao@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adda42d-5e8c-4d4b-9cd9-08ddddea63a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2p2ZXR0MnFWTThpUVpQL0hjT1ZwRktYWTNwMnRHcmY5UTB5bXJOY1g2WUJU?=
 =?utf-8?B?L1JSQ05ITEJpUzdZL3ZoeDNmWUFkc0xWL2xSRVVnL3NUQURhVWN6MnB2TE55?=
 =?utf-8?B?c3RCcTlTTXNsdEs3TkpsSUlOcGgyallNWFhmb1ZlZFhJMFdxQkk0OFBCcVZH?=
 =?utf-8?B?b0IwT1haYWpQSWhPYVNlNlZOYjNjaTdBTit3eWJ5QUZuZzg3S0huMVREUDVh?=
 =?utf-8?B?cFpzb01TTG5PQ1RvU2pvOTFBNUZDcnJBZEc1aWZpb1ZTMjFyL2s3bzJTY3dw?=
 =?utf-8?B?WUozRGhPRWxzVFhJL1FQa2hKcGhnY1RaQXBrbVVTa2pMTW5qOGRtZDFXQmpz?=
 =?utf-8?B?NlNtcjkzak12Q3NmTm5pa0lYeU1WMGkydFF0VXFPQlhzQ2JmY09GeStTbW5B?=
 =?utf-8?B?UlNBNElBakNqZnFkYTJnZ01yWGpQTExhNDVYQWpraHBKekdnTDdURU91Ymhr?=
 =?utf-8?B?d3oya01QWDdmaVF5YzFoeHU1S0EyWlpLNTNPZUIxcS9XMFlZaG54TlVpYnJi?=
 =?utf-8?B?NHR6TENScjZRZVpqQ2pCRUdsR1FNN09IWGE3Q3NxNTAvTThPNThwVnB5aHQ5?=
 =?utf-8?B?a3N5Z0RLUkVYeWtoVExaMklZYklKZG9EZE5jVUF2dk4wNzRwc05jOGVNcE10?=
 =?utf-8?B?Z1FlNGxQNkJ1ckF1enFqVEZSd2VURGRGTXpPa1M5V25ER3NBdDRDSENaQkNn?=
 =?utf-8?B?SHRteE9PN0ZEdXF5amRUekF2TGYrUE8xeG5GaEYrRHRvczhnK3FXS0ZlY2cw?=
 =?utf-8?B?K2VvSVBYWkpNbTFpeUcraGgvOFczM2c2R0g4Z1BxR0hJbGV6YkN6RmtxYmU3?=
 =?utf-8?B?UkcvSWVaWngrN1E5dkE0RmdBeWlDT2Z0WjloTndVclRGS3lNRmpDSzhMeTU1?=
 =?utf-8?B?STBTSjRJTHJLNlhLckFhQmhYTW1ycW44Q3l2UlBnN0FoOUdwWERtRVhPR25o?=
 =?utf-8?B?ZkEvNUxSN0NkWjBNelNFVWlmY2NnZ0ZnQng3RjVCZVFDRzBESzdyc09VeE52?=
 =?utf-8?B?dEJOMFpSUFZTZDNrSUwwck55WmhyZ1l3VjQweW1TMzZZSGhUTTB6L3FhRjk4?=
 =?utf-8?B?WitzZm8wQ3lqdjY3WmpnMjE5U2xUQ2xkbndUeEQ3UThCcElzMlFTWnBFWWZz?=
 =?utf-8?B?Y2JRTnhFSWhVQ0NSbkE2TkVSWXBKRXFtTVN5SzN5TS90cnR0dG1VYmR4eVU3?=
 =?utf-8?B?NmhjcnUxSGhmQys0cmphOGxHY3Y2SnZCUXlSSVZkS2xKU2RXeldjbVkvbjl4?=
 =?utf-8?B?UG80NVlmQXFCUDRhMFVsYVdKc0F5clNIOVhESFdnOGpOeGRpbWh6Q3ZaU05h?=
 =?utf-8?B?SkpZUVFWTDkzNHl1Yit4Slh5Tyt2NmZsdEZpS0t3Sy9vakd2THZ0dDl0cWtr?=
 =?utf-8?B?Z0s4QlF4S1BvLzNXWkdiRHhQZC9QSnVScGVUOTdXYjFaRzFLVjg3OFVReS9a?=
 =?utf-8?B?YXh4bFhGVktlRmdLSnprdmlkZ203dnRPNUFlamU4UVFBdG5xOEpFdEJKaGls?=
 =?utf-8?B?WFRoZFhSTWl3ZE9maERxTGlqUnJmUGJEQTNNNHdrQ084Tk91OVF5RFlHOG1v?=
 =?utf-8?B?WmVWZmNYTUZkOGJRVHRDL0xvVTh5S2tHYWl0UXRsY0Q2Rkw3T09rUk5XaGRz?=
 =?utf-8?B?U09sOENaZWNLdDl3di9zVGVwdVNPcFNCZmc4aVF6MDhlb0RQRDQ1WVBWa1dM?=
 =?utf-8?B?dDBTeEN4Y1J4cTlRM3VPclFqS3hFWE43cUNvTGN2dlp4REkyME9tRk55K1ph?=
 =?utf-8?B?dksrRVBmK1BCalVmeXliekQ3TkNFZ0ZkcUd1LzJHT1EzYmtUQkx5ZUQ2bUdU?=
 =?utf-8?B?U3RzcjJ3UUVUeGU5cWo5WmFGYW0vZ3VFRnprNlowSGZ5Tk1INkNtQnh5bjVx?=
 =?utf-8?B?WkdWeUNTYkZEYmUxY1NsOVhERHMwamRlTUg1TzJUMmFwMTFoTFlWZWVtWFln?=
 =?utf-8?Q?ZaJZm+1qT9g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktFS2U3WUozL3IvZEEwbm5peTRpRnljMGI2VjZrQTdlL3dWVlBDbFRyc0RR?=
 =?utf-8?B?VzJDRGpLTW8zc1pJbHYyeDQwWEdVV1JWUmVlTG5LMVlLeDl1cENqZ1EwYlg4?=
 =?utf-8?B?d2dCUmc1dG1iY0EvSWNuWUp1S2VDWWllOGJDS3ptZVRDUHhUR2FpUEd6UktN?=
 =?utf-8?B?enJPb0RmYldsY1M4YnFtRXhtKzN3dFFiSGdKdDVRS1hvM3BJY3VxR0ZJWWJv?=
 =?utf-8?B?dlc1M2Yyd0NYUGpvZWxIOU5qd3pwcXZLY3FvVjd1OUg4SW9UWHBaSk5NVXA5?=
 =?utf-8?B?Q3V2RXlDM2lDRzZWNUNNVktvR21NVEZJWnczcTdBZVJtSVc3am4rUHhKMUF2?=
 =?utf-8?B?OFBTRGRLNjFqMUUxTzFFbTFNaE94bWRWTDl0bWozVUdacjNzdks3QVBram9s?=
 =?utf-8?B?UEJMY24wUzcwUzRsTDg3a1hLeFRlOWxUbDQvQWYwUE8wVnBqMzhLc2Vhdm1N?=
 =?utf-8?B?eVJjdDMvQVBDMjJMMGJWU1NNVFBaMGdES3RtWUpkN3p4cUdFRm9GTnhiSEFF?=
 =?utf-8?B?ei83Z2MvM2U5VXpheXlMMmdybHFBVGw4L2pPRDBqdHBjVmpsV0ViZldqK1J4?=
 =?utf-8?B?cVBGS2NWbWVNNnc1c0U3NS9iRTZNTVl4NkppNVd3QVNpTDlyL3dsYXN5bWxY?=
 =?utf-8?B?blhKTy9xM2xpUVVyODIwb2RYd1JPR0FHVnl0QWlhdGc3K2htMkozWnZEd1gz?=
 =?utf-8?B?Q0UwdEppTTVQaWNwaWdNTmxXRXFzeHF5WHlha2ZKNlNuVUxMSkZFNW5yV000?=
 =?utf-8?B?SEVnQTNrTTQzM0VodjBkQ2daWS9ISmRVN0FkVHErdHJxTzYzdy80ejl1REdl?=
 =?utf-8?B?cVQzR1FMUjV3ditJLy9Xdnl6S1dtT3FvczBJQXhoY3JHWEJEM2NuUDhWTC9E?=
 =?utf-8?B?MU1kZzB1TEtLUkovWTR5U1BvUW00S2NMS3lQcmxpRk5WNSsyUGtCc2hsSnJN?=
 =?utf-8?B?OU0zZHRLM1NIOTdOOTRKUWxRc29SNDFJMFdzd2FmeVU5d1p6VHFtMy9iV0wy?=
 =?utf-8?B?N3lMQUhTZkFDWk5uVE0rbnk5K1BMTjZUb1VRTHlGOG9rc0pXUHcvKzhTRHRZ?=
 =?utf-8?B?WWdCMkVleU80UWdRTkJndVhEdU1vVkNIaU5SL0lZejRSYk82UE9CdkIyaUtO?=
 =?utf-8?B?ZEJQdzM5d1dJY0IyQ3FNd0tGcHN5QnB4cERlZGU2c3pUdkJuZjl2ek9heTVF?=
 =?utf-8?B?QnV2WEdSc1BuK3JiY1ZoSVdtK1crREd1NjBUMXdXWml2NWNGVVlYVnNLTmtN?=
 =?utf-8?B?ODJHM1lGbUR1VFBKTWN4ZU96QzQzODA5Snh3R1BiRFBFejNkY0I4ekVzcEJ3?=
 =?utf-8?B?SlY5WW1KTEZWczF5QngydWliVk9lMUVvemE5aWNQbHVkWTMzeEdQWUNUamtw?=
 =?utf-8?B?MkQrWGoxZjRxZ2tDQmpmU20wWWNWMGVZMlRGUTZFRHJkQ2kyMHRJaklTMklr?=
 =?utf-8?B?VUYvNmV5RFFqVE9KYmRKSXZYeVZqMTBpMFp3S3pnczA2bG45b2Jzd0QxdE5o?=
 =?utf-8?B?RVFIZk04WnVtVzZCSUIxTXJyMUx4Tk1CNjJ4SmF6bnhGNkY4ejhQZWZyQ1FJ?=
 =?utf-8?B?VnNlR1FRa0FWQXJQK05WdERCNmo2UWsyVHlpVXloQWhpaERPcEtmbUxKTnI3?=
 =?utf-8?B?Qy9kTHVJNUtnLytlcDNJV0VIYTQwNitQWTI0a1VKYWhjTGFnMzNSd1hlV1h6?=
 =?utf-8?B?T0txTVE0MkFlZjFmenJKNkxFVGVESmxadjV2cUgyL1FhSi8wYWhIeFhNSHp2?=
 =?utf-8?B?cUF0MXFvOGZ4UVFWdStrMHloUll5ajlMZXZYaVBqOUplSXVKYmtjV2xLbW8r?=
 =?utf-8?B?OHJMak9PVEM4b0NwbW9ERlJoeGFNcGpFRmdrUC93SGdsSWxHZWJON1FiQm8w?=
 =?utf-8?B?R2N3eTk4VzhHdmZCcDFSaWd5dVVyeVBrd3lBVTBBVkRwamtxdlkxMmZKbi9z?=
 =?utf-8?B?c1RIdndVL2NSenNxcXdMakwvN283ZFkyeGIxU3o5R3d4cHRsNzV4MDlzV08x?=
 =?utf-8?B?ZEpoa1ByZ0FjTzRrYlZoK3A5RWMvTEVsZjJCQmZZUVZLK0xIUnE5dWNoakhV?=
 =?utf-8?B?NDU2RHp3b1NsMjVhOEx3Q0t6Zk1LUjRpMGt4azBuY0p0NWpTaHdPTmNKbHpl?=
 =?utf-8?Q?1JIgYz/SC3zqyZ+7FGr4lxAYe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adda42d-5e8c-4d4b-9cd9-08ddddea63a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 00:01:32.6877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om2LwOUYTMw35BvmGULa/WvLI4cwHCBXc8lvtK2iLHd0BVI4ZFNiXNEa+sNu+uXeFYMdE4I5Om1GGDmvN+vPnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7289
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

On 7/31/25 01:54, Xichao Zhao wrote:
> Adjust whitespace around operators to improve code readability
> and comply with kernel coding style guidelines.
> 
> These changes are purely stylistic and introduce no
> functional modifications.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>   .../amd/display/dc/link/protocols/link_dp_capability.c    | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index e0c4416993d9..caddb7dfb133 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -1525,8 +1525,8 @@ bool read_is_mst_supported(struct dc_link *link)
>   		return false;
>   	}
>   
> -	rev.raw  = 0;
> -	cap.raw  = 0;
> +	rev.raw = 0;
> +	cap.raw = 0;
>   
>   	st = core_link_read_dpcd(link, DP_DPCD_REV, &rev.raw,
>   			sizeof(rev));
> @@ -2125,13 +2125,13 @@ void detect_edp_sink_caps(struct dc_link *link)
>   						&backlight_adj_cap, sizeof(backlight_adj_cap));
>   
>   	link->dpcd_caps.dynamic_backlight_capable_edp =
> -				(backlight_adj_cap & DP_EDP_DYNAMIC_BACKLIGHT_CAP) ? true:false;
> +				(backlight_adj_cap & DP_EDP_DYNAMIC_BACKLIGHT_CAP) ? true : false;
>   
>   	core_link_read_dpcd(link, DP_EDP_GENERAL_CAP_1,
>   						&general_edp_cap, sizeof(general_edp_cap));
>   
>   	link->dpcd_caps.set_power_state_capable_edp =
> -				(general_edp_cap & DP_EDP_SET_POWER_CAP) ? true:false;
> +				(general_edp_cap & DP_EDP_SET_POWER_CAP) ? true : false;
>   
>   	set_default_brightness_aux(link);
>   

