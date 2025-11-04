Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45247C31CFD
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A39E10E622;
	Tue,  4 Nov 2025 15:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yHYWwZK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B97E10E622
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:22:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU5Xp3IlPR3KmTq9gVj7C9/KuOz5qJOwuJ2uXX+92eI7/IQ1k2ESCKuaNXL4LVEpoPUnCSpqzE12e9nOg2GAjLA3Pfy3++Rre21x4xyR8aSHhX2dXaelJMNSVtazEiDCJPKCML2V1uoJ0ZeBDvlw4gfie5j49AywE3Bu7BaPIJeB/bzmNN2SSaEix9bNI+fE3qBK1YdABYkx6jR/4sX51uHlkH+LnudwGFyoD3DFfbqu8CzMA6PlgO4oK7rejTZJcO/b0T2V7SYf+XC+PkyItNkP65hXybLKtVCoK0Rejz1jiJ5Fxnkzah+G5rlVOMFfzcFUEz/eKeHfIPWyfujl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqWBc8t+XKCn1oOj+UY6L07rjDa/d0U6p2atPSM5H6I=;
 b=hjdckmjzyXQRB43bC9wSv0zQ6YP2gFm6bOv8rjHjLf6F/HLV3bqNCShSDd9r3Q6u0s6KCftxCEiHjLfOD8L6OjLa5JsaE+miOVWfFkGjDdYiA+60f6sGo7HE4h3HGUDLwRDO9Oyvxcx5/VgubNJ6Hj6l4/R/A0SivTIaBsUOFMhX2JFzfXHOU0xkTq2xqPvsnqVpPyQHiExLNqQ6EaYmkvsZrYZouNX79Gus+uCNjnwU3ph76xCmIr1Bsr3aTUHpoXLFkY3b3LRXx3jeKyCgFY9EghaEViUhxrGhAJLmtaYMKJZAfe3anSZ51/V+xiNzt4j4NgrIzcHLCXQ5oyVJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqWBc8t+XKCn1oOj+UY6L07rjDa/d0U6p2atPSM5H6I=;
 b=yHYWwZK74nfBF5NbBlDy1HuLY0UinDbo6waWL7GWSeO674AO6G6Y8e9p5vEf8FjoM8hNZ16ssDpyrg5t8K2sB6uaQQVtgRpRx/ss1zc7y8DUXH6hRgDpNdRMHiyHkqtIT+sZUmN83mIVrVTknL+SMdvNVGKZcSKfRJcFjwCT8So=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ5PPF6D27E3EA3.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::998) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 15:22:38 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 15:22:37 +0000
Message-ID: <02e3ab08-8374-42df-9802-2528cff1c79e@amd.com>
Date: Tue, 4 Nov 2025 09:22:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] accel/amdxdna: Add IOCTL parameter for resource data
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251104062546.833771-1-lizhi.hou@amd.com>
 <20251104062546.833771-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251104062546.833771-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:806:d2::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ5PPF6D27E3EA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 92875848-817e-4ba4-1fdf-08de1bb5fcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1JtK1JiaXhTSFV3MXAzRnM2NlExM28vMUhJZUNPdk9PSHAwQVQxSktKU0Np?=
 =?utf-8?B?ODhnQ1RJRzZtbnZVM25iUllQZmRHVGNKSzdMUlpBK0syRXJicDlJNHdZblVo?=
 =?utf-8?B?NnhoOE9pR00yMkh6N3N1VldlM24zeThxMjVXY1dxcDlrVUF1Z3VDMFQwMk5v?=
 =?utf-8?B?YkcxVFJpcXpBSHBwREJJN0tFanlZNHRGNllpVk1JSXFBK215U1Avb2J3SUhN?=
 =?utf-8?B?U3M5UUpHaXpDK1JvazYrOEpiSk5pS0tzK20yd054eDhxQnlFOTZoYUY0NC96?=
 =?utf-8?B?R0hCVDdrTHEwNk5Ydi8zczhIV0tmNGlUNkxUZkhTN2JtcDg1SHlndmtoSmE2?=
 =?utf-8?B?YzlIT3VlcTd1b2J5U0FjM2hsQ0xlYS9ZU2hvSHJOU0gwNEMxL1I5Mk5vVzky?=
 =?utf-8?B?Q3hHWDE2a1Mya2dWTEVHbGo4bHViT1FsRStEaC90Y1hyZzJUQVE4OFp3aXhO?=
 =?utf-8?B?dFZabi9NM1pLWGZDS05IR2hKcnZHZkFnMlAydFhJeERXdXZQT0t6VFNSMVJT?=
 =?utf-8?B?aThCaTl6THlaVzhhcnI3VmJIY1Z2YnFnOUxudGFWTWx3Zi9aNUpnZUhzT1Fq?=
 =?utf-8?B?a0FMRThGUVNJMGV2VnpITWVzY3ltMGZjQ2ZXVzFDUVlpNnQxRzhoSzZ4bnVq?=
 =?utf-8?B?MEl4ZDd6T0hobVpaOG5KZmk0OXQrMktYUUs3aG1iR1RmUmJjUXNEN1ptc2Jp?=
 =?utf-8?B?RTFmMjkzLzJrOWR1bE5aR3dWK2NwdjlyeWw1WU1FT1JyaVp5MkVWY1hpb1U5?=
 =?utf-8?B?OSsxbERBOHlHOGRvTE5QcTMxVkdkSUE1QXlLdzhNdDNKbldRdUF6TGVsL2Jp?=
 =?utf-8?B?YXJ0aEhGZG0rbUtlQkpna1BQbk1TRkpqcmhCcXhNdEhKZmRraDl4ZlVFOWFs?=
 =?utf-8?B?RXJCZ2hsc2ZUcnpRY2h1RytVK0ZJWE14OXBGb1ZtWEx4VGZxZ3RXTlJ5Z1BY?=
 =?utf-8?B?SDVabWFjNE82a3U4aUJyVjlUUXBKZjJkc1pmQ3NaUDBnVzFjMDVENDJkTE81?=
 =?utf-8?B?SklhZUR1WjhkNnFGN0x3Q3ZkWEJkU0R0T1lHV2NLOHM5WEJGZjRPbVVTZHFi?=
 =?utf-8?B?OFJnditwcHNmYzIxbFMra0w2OWFqQUZOellZbnJydFNZR1grdnZGWURGR0pU?=
 =?utf-8?B?U0JJYmFjb1kxNSs1TGI1U2N3MmdIV0laSG05VVE5UnNLVWZZUHE0NGVMR29z?=
 =?utf-8?B?TVI1d0VMZ09VdmRVajRLN0EwbTJNem9DT3oyOUxQRDBUYWdiZzlnWVBXazlz?=
 =?utf-8?B?ZDRIb3BGdE1zam0xSDJINVVaT1hVTnhrcjJ4SUpTZVBXTm84Rm9POEFoUmZP?=
 =?utf-8?B?SzBRVy9XWWg1SWJLMHVqVGcwWTVKS0RCTEk4K2VxYktOQkNZV09VV3ZFNjFq?=
 =?utf-8?B?ZjBCc0RHNlUvL3hpOTV4YjlhRCtxNmxFNlVUU2hFU0hHVDhmakwyUUlwb2lt?=
 =?utf-8?B?NTNyNzRuOE04eXRuY1J4emd2a2JGMHNWQUxySXZ2ZW9VQVJzd3BRRmxaSVM2?=
 =?utf-8?B?SnU4czFkbDRuVTRnNjdyc2NTSENpN3c0b1U0T0RGSFJvOU94dUxSbHBkQ3du?=
 =?utf-8?B?TWhHVDFkZzhaenVrc2ovMnNoRkhPK0hIcFEvczV2dVdoNGo4UEtKdmlNSFU0?=
 =?utf-8?B?ejFRbGl0QndhNzYwc1pMWFZwY1haYU83VDV2VUlscytRU2FVZm9tMC9YUnJB?=
 =?utf-8?B?SFkrOFpaNmJMeDR1L1didHNrOVpYNzliR2FhKzFqM2VtYkNrU09tTWswMHFB?=
 =?utf-8?B?UnJPTm9Ea1E2Qmkyc1FvSnpSVk1Fb3FENElGaUIycEdhb2ZlUStscEkxN3Fl?=
 =?utf-8?B?MzZmZjlocUJhWmxydk81b0NkVXRyYlQ2SkFnbnRJSlgzQ09yaFNKdS9VVmww?=
 =?utf-8?B?TjBWa3ZObWtsa3JYdHkwSE5VRVNKdXhaZG1GUjVsMWl0YmdvdnRqZG5WVkhB?=
 =?utf-8?Q?tXOlKcJxtOcoKqUg2s7ICCRAG5PduOhp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckZFR3NmZGkxWW1vOWJmRUNENlQxUmVyZ3I3bHJBanRhRDR6eEhic25zSnQz?=
 =?utf-8?B?Ty83U041S2Z5bEl0R0M4WGQ2Ry9xZ1RjYzVDTkpaTkpRRXMwZnlwVENMU0ZS?=
 =?utf-8?B?Nlcyamk2SDlDWS9lcjBmUmordmtCS0RJM1FleTlhS1JINWN4U2lqMnhBWm5h?=
 =?utf-8?B?czd1VUc4bFA3QlZleG5Kb3Zsc1FGelEwNnhzTGEzc0FpS2ZueVdpYmlpMS9F?=
 =?utf-8?B?eGFJaXkvZWw3OHlZb040c0FFMmZIU2RIYnRmZngvZk4rMGFGWGNRaDkzN0E5?=
 =?utf-8?B?Tk12YmV5Z1Jvam1KQnFQOVplMnU5VmpMbEJaSlN3RXZIb3J3dTlWZkxaRnJa?=
 =?utf-8?B?RThuT1F4MGg1cmNPZWpBMXpkbE5SeXgvMkFNYVV2RGtyVTQ5T25zV2VpYm9W?=
 =?utf-8?B?U2ZUR1IvWkluQ0VFWEgwZlVZTDZxRlltZWZVN3RpeTg1S09pN0F5UDNyVVZC?=
 =?utf-8?B?WjZQb2Y3VzFjVXprQnV5TmJzdFJxeHJRSXFwN1BTTllNYjVwS2NNOXZ3OVpV?=
 =?utf-8?B?d0lzeW13U3BUYXV5SS9GaHNCUXdpTzhmUlJIM0V4Z3NTVWM0VVltc2pFTC9m?=
 =?utf-8?B?bzRlSDBGK00xWEJsU3RyNzBVaWdNQTk3a3N5SW83SzlVOTBFUU5kVCtWNXB2?=
 =?utf-8?B?d0RVMjdKMmJEYm43N1N2TktqcVpBR0tobm5WUjczd2VBU1BSL2xOamFmbXVv?=
 =?utf-8?B?VTlKS3JzMFVwRmRFTW9TY1pTa2UvU04vVmh3YjcrSUZQOTJWRHZicXU5SS9a?=
 =?utf-8?B?blVQN1VqYTdPM0tsZlVMWEN3RHlPVENmT3ZvOGdVdFNodU1CRDduTldpaDN5?=
 =?utf-8?B?clFFMVQ0SDlmdEdyckhDR2w5dG5DY1h1Zkh6M3dULzBlRWF2eHJpTmFDeW1r?=
 =?utf-8?B?ZFpUNE5YR25tTWZSMUU5MTQxM2U2eFlKU0thOTBPaW1LL2JaeEdzSDlBcGF0?=
 =?utf-8?B?OTRYVkh3aW9oZE1TOWY1a1pqdUs1cVMyS0czYlczS1V6ZUZOQzBKeW1wSHdO?=
 =?utf-8?B?cXQzWUY1VHlOM25wY3pqNmVwdUp0UUZLNi9xSHVuVWFFRThsWjJUTkN5V0lo?=
 =?utf-8?B?czZ4RzdST2RRd3AyTytKajZMZENHTndCVFIvOW9uUUZURmNSLysra1Q5d2FL?=
 =?utf-8?B?RE5VRC9TTVdHTStoQW9TOE1hL0NzY0tIZTAwQ2J1MXUyOXNLa3FJNU11U2lq?=
 =?utf-8?B?Zm9SZW5jYWMzcWJTdFBRNzBsV0lOSkdpQUZiWGxjNWtOK2RnM0dBZ0JVTXk2?=
 =?utf-8?B?V01POVg1VTRESjBkckcxTm9ZQmJHYnpFQWRtZXR3UFo5N3dackUyOWdSL0Vk?=
 =?utf-8?B?ZVIvR0QvbzRoczQyT09GU3hiRTE4K2xDS0U0cFB6Zy9zTlVXUTJhaCs1Smls?=
 =?utf-8?B?TW14UU00Ry9vNXc1QzFFcU9sUlFxQXdXVWM2ZWpUZWN2eE1qZHl0eVRObXNy?=
 =?utf-8?B?OUtQTlBvVDgyNmxLdnkrVzQ2SldYRlRad1IzbVVlY3Q2aG9VczFub0dkNW5w?=
 =?utf-8?B?eC85aVdKa0pYRGlTc0c1dmJCQUMxRGtCZ0grVWlXZ04rUEpPaUUweWlLT2h4?=
 =?utf-8?B?TkxMSktjV2lxZlhNK3hCR1k5UTIxc3dJY0hSbHMzTzF4MkNwS2lzbUJOTnh4?=
 =?utf-8?B?QnI1N0dsTXA1YW13RHJmc1BXYVpQQ0pUUXZrOTZYTXB6ZTZxVmoxWkt0TWt6?=
 =?utf-8?B?MlRMMERBOVJzVU5iSmRRL1dLS05KMENCeU10TUs3clpPR3V4cEVNSi8rRld5?=
 =?utf-8?B?UFlaZWlXaEo4V2VCUHJDMkJwMVd1RjVhOXVxa2pqbVA3QzVGcGcxMjkrMkEw?=
 =?utf-8?B?bG0vdXJoL2JtY0UvS1JYV0hqdDhqRldLbE1HckRIUDFhSnpHRDFxWGltcTZU?=
 =?utf-8?B?UFdlWXVncmhxS3pYQnoybm9uZWdBREs1TXM2T2NTckQvODFua04xYlZiUGhK?=
 =?utf-8?B?OTlwY2kvcDI4L1E1T3UxNEptUnlpMEhGb2gxL0tJaXhaUXpiNlBuSjY1VEhq?=
 =?utf-8?B?d2M5cjFsWlF3YXovMlNmVXNpa2xXVDZxWEVJWFJmRlJNZDRLL0R3ZTdyNTRs?=
 =?utf-8?B?ZnhpdmpOWDhZZ1hnQmZweG95eTRJYzY5TlgvVlR5bW54NFBwMmoyQndGYzJw?=
 =?utf-8?Q?hZwNHxrUtM6W/3lhh5KwtR/k0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92875848-817e-4ba4-1fdf-08de1bb5fcb4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:22:37.7701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/gEXb56FqaxzqwQcIgFYvUShXkt5ODdU9xIxR8auDF4aaS3DrPBkOIxAYcF8FSKNNmFmJ8ZgG170FJbxXXK+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6D27E3EA3
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

On 11/4/25 12:25 AM, Lizhi Hou wrote:
> Extend DRM_IOCTL_AMDXDNA_GET_INFO to include additional parameters
> that allow collection of resource data.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_ctx.c        |  6 ------
>   drivers/accel/amdxdna/aie2_message.c    |  2 ++
>   drivers/accel/amdxdna/aie2_pci.c        | 27 +++++++++++++++++++++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
>   include/uapi/drm/amdxdna_accel.h        | 17 ++++++++++++++++
>   5 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 289a2aaf4cae..b78c47ed0d34 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -556,7 +556,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	struct drm_gpu_scheduler *sched;
>   	struct amdxdna_hwctx_priv *priv;
>   	struct amdxdna_gem_obj *heap;
> -	struct amdxdna_dev_hdl *ndev;
>   	int i, ret;
>   
>   	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
> @@ -654,8 +653,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   	amdxdna_pm_suspend_put(xdna);
>   
>   	hwctx->status = HWCTX_STAT_INIT;
> -	ndev = xdna->dev_handle;
> -	ndev->hwctx_num++;
>   	init_waitqueue_head(&priv->job_free_wq);
>   
>   	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
> @@ -688,13 +685,10 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>   
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   {
> -	struct amdxdna_dev_hdl *ndev;
>   	struct amdxdna_dev *xdna;
>   	int idx;
>   
>   	xdna = hwctx->client->xdna;
> -	ndev = xdna->dev_handle;
> -	ndev->hwctx_num--;
>   
>   	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
>   	drm_sched_entity_destroy(&hwctx->priv->entity);
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 339dec998247..39214253d804 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -235,6 +235,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   		ret = -EINVAL;
>   		goto out_destroy_context;
>   	}
> +	ndev->hwctx_num++;
>   
>   	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
>   		 hwctx->name, ret, resp.msix_id);
> @@ -269,6 +270,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
>   		 hwctx->fw_ctx_id);
>   	hwctx->priv->mbox_chann = NULL;
>   	hwctx->fw_ctx_id = -1;
> +	ndev->hwctx_num--;
>   
>   	return ret;
>   }
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index ce57b915004e..396dc6e06007 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -838,6 +838,30 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
>   	return 0;
>   }
>   
> +static int aie2_query_resource_info(struct amdxdna_client *client,
> +				    struct amdxdna_drm_get_info *args)
> +{
> +	struct amdxdna_drm_get_resource_info res_info;
> +	const struct amdxdna_dev_priv *priv;
> +	struct amdxdna_dev_hdl *ndev;
> +	struct amdxdna_dev *xdna;
> +
> +	xdna = client->xdna;
> +	ndev = xdna->dev_handle;
> +	priv = ndev->priv;
> +
> +	res_info.npu_clk_max = priv->dpm_clk_tbl[ndev->max_dpm_level].hclk;
> +	res_info.npu_tops_max = ndev->max_tops;
> +	res_info.npu_task_max = priv->hwctx_limit;
> +	res_info.npu_tops_curr = ndev->curr_tops;
> +	res_info.npu_task_curr = ndev->hwctx_num;
> +
> +	if (copy_to_user(u64_to_user_ptr(args->buffer), &res_info, sizeof(res_info)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_info *args)
>   {
>   	struct amdxdna_dev *xdna = client->xdna;
> @@ -872,6 +896,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
>   	case DRM_AMDXDNA_GET_POWER_MODE:
>   		ret = aie2_get_power_mode(client, args);
>   		break;
> +	case DRM_AMDXDNA_QUERY_RESOURCE_INFO:
> +		ret = aie2_query_resource_info(client, args);
> +		break;
>   	default:
>   		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
>   		ret = -EOPNOTSUPP;
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 3599e713bfcb..af943a603ad1 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -29,9 +29,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
>    * 0.2: Support getting last error hardware error
>    * 0.3: Support firmware debug buffer
> + * 0.4: Support getting resource information
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		3
> +#define AMDXDNA_DRIVER_MINOR		4
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index c7eec9ceb2ae..8b679c38d308 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -442,6 +442,23 @@ enum amdxdna_drm_get_param {
>   	DRM_AMDXDNA_QUERY_HW_CONTEXTS,
>   	DRM_AMDXDNA_QUERY_FIRMWARE_VERSION = 8,
>   	DRM_AMDXDNA_GET_POWER_MODE,
> +	DRM_AMDXDNA_QUERY_RESOURCE_INFO = 12,
> +};
> +
> +/**
> + * struct amdxdna_drm_get_resource_info - Get resource information
> + */
> +struct amdxdna_drm_get_resource_info {
> +	/** @npu_clk_max: max H-Clocks */
> +	__u64 npu_clk_max;
> +	/** @npu_tops_max: max TOPs */
> +	__u64 npu_tops_max;
> +	/** @npu_task_max: max number of tasks */
> +	__u64 npu_task_max;
> +	/** @npu_tops_curr: current TOPs */
> +	__u64 npu_tops_curr;
> +	/** @npu_task_curr: current number of tasks */
> +	__u64 npu_task_curr;
>   };
>   
>   /**

