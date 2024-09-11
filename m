Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BDA974ABF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 08:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3AA10E9FA;
	Wed, 11 Sep 2024 06:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UDJYmu/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91510E9FA;
 Wed, 11 Sep 2024 06:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIrwG8cy7o8FVy24rYJvgjTNlZalm11UVJkR1SRumO9RomXGj8rTnshtLaR5wlHqsbEDTUIWbvz556x84fy+NEKKtGf258IAEgOUduylZQhk95sNT8CF2Fofu5O1rTckdqcOwj2CO8W6beqlIXizFgvOjzy2ESpyZ0Jb9RehwPYornKIU32G5BPtHysZV5hSQzcFaQzdHdCweOO1NZjbUFJYGp2aM8Bq+PhrghWxy/EAixpGZhenWuM5ghKeGop/4A5M3O9asB+ynGU4jaWFk3vlwlrFj/k0dFqV29yJodbiIgFs1L2lwgXc0ad4jgBz3fgKKUxQ6fD/Bu5UZd3fhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw0DxzREURHe8sEFACXmSH6zWS95P3yDJ1EdnmaZ/d0=;
 b=XUGrwembANiCKQ7JOLgDVZTfJBd47d1wqbEOhNx4NGbk/l2OPTivOCavzzHd4WfYCpPK8gvUPmcEg/s8KfQhG+4z84jePumTbfjxJwekmexRSBHYYmq54JpUbNJvCd9sJGLwj7bagfs60oqMnEuV/GCNfzwpZ/+Gvyk+u0gVOB9xDV9U0EwgK5DAzF5GFq1Hm/iXjlo3Q4lku7DeM1iCJMaY9OG+UOT/0CBlhaA/waclXsiBQuTR3mb+jXJ9WCtcdWbq8DfvNWqH15sTnEnwVNpiFSD5uZhehalhSJanpTshPEDLyH2ydUYXp1TGFXPb6grt3Q5RVsdS9uwj9dWh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gw0DxzREURHe8sEFACXmSH6zWS95P3yDJ1EdnmaZ/d0=;
 b=UDJYmu/bINXr2H3uJ+mnwhpg2QaVh/55GURM7bFvF/zT++tmGkrQrDR58vISDLpDfM+pi9lxBHEAh2hH62DCn3NW4dhzcz0ytM1QB9Fa/IDrYKbT3gWaeK+MfnYAZuLNIglrovRmNnQndpvjwW7SfvxMbImqXGNPB28tExm0+SM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6485.namprd12.prod.outlook.com (2603:10b6:8:c6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.32; Wed, 11 Sep 2024 06:58:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 06:58:01 +0000
Message-ID: <024a5eb1-0255-483f-9674-dba431c01593@amd.com>
Date: Wed, 11 Sep 2024 08:57:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: fix typo in the comment
To: Yan Zhen <yanzhen@vivo.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240911042738.3886250-1-yanzhen@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240911042738.3886250-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6485:EE_
X-MS-Office365-Filtering-Correlation-Id: 519fde2e-7c7c-4481-f725-08dcd22f138c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9Cay9FNmFHdHZPSTJvazdKMkFJcFRPN0ZncVl0ZjFSTHJucU5aY09JZjN2?=
 =?utf-8?B?ZUR3azk3OXIvM3IzbHlzQ2V1Ujk1bWhZZXM4UksyM3dVUXFrZmZiQmhoQ3N2?=
 =?utf-8?B?Vk4wL1hCL054MmNYSGNzZnFzZWpNVmhvN24xeXNsS3hSRm9rRTRtTVFTQkJS?=
 =?utf-8?B?UzF3VjBJT3JzeFNsSG00aG9UZEVEY3I1bjcyTmJCVFVlcnBnS0I4ejZLbG1R?=
 =?utf-8?B?NTBpYTVKV1MwTHNUcEU0QmttSXBub2tBamxyblREQWZCNXpkSFFxQzRPMkR5?=
 =?utf-8?B?VGhUMkVSbkdza1BVcnBoNHhIZm94Z1ZWMnFyc3Q3akVKb0Q1K0lBTFBkYWd6?=
 =?utf-8?B?ZThuVDNoYkhGbUZkVW9XS2RpRExCQ3BTQUp0MWJTUXBKQWVnMlBpSUNyZUps?=
 =?utf-8?B?bTBTUzdPRE1mTVhwWE1YeGxZQVRBNmRMNzhUaE5YVHlFRTY5dEdCYnZFbTVI?=
 =?utf-8?B?N1ZodzVFR0syMHV4cTR3dXFCai9ma3VrYUNpVmRuVHYyRmphakZvWC9aOGRW?=
 =?utf-8?B?SVY4d1A5ZXh1RTNLTUhjajFRVkFOWHVJMlZlcEp4QUVlcG05N1FNSTZ4Y0cx?=
 =?utf-8?B?N2Z3SVQzSllHalBDMnM2dllQSzluT29YeTBJWDFTbzNzL2NQSllPcUhKUzk4?=
 =?utf-8?B?elFsVlFPc2RCZWRXL3djcUZLOHQxR0hlRENCbXlxN2l0MDR5ZmwyRlVYWEF2?=
 =?utf-8?B?d21Ra05VbFRlSEQ4TUxRRmovaDJIMkhQZXJKa0RFYUJqTHFsbDlOSEZqWWlx?=
 =?utf-8?B?c0kwSE5oU0dpNk1rakxNZXkyVVE4VXdVZE9aVzBudW5MelE5dmFpQmU1RjBm?=
 =?utf-8?B?Qzl4T3JJUW5mNkVLemlpeTU1S0RIckN3S1R1Z2pPbmJja2xwa3JVdk1DQS9I?=
 =?utf-8?B?L2g0RVVyNDArc3VWUEJtRmxrNmQ2Ujd0ZERIZUpDSkQ1UTB3bi96cEFPRkpl?=
 =?utf-8?B?WFc1SElTbDhISndLWllyTTk5aTJ5RW5xYVpGRjJKNzhHUjVWekxWUENOOG1B?=
 =?utf-8?B?RncyT2N4WU9nMTI5YlBtaGoyeGhDd1lBeFBCUDJ5NXFhT1NpdDJ3aTFTSk54?=
 =?utf-8?B?RlVLc3N4NGI0bFZRQXdGMTZSb2ltL0xSWjVkMGhEZnorU09vNkduVzRtWWxv?=
 =?utf-8?B?SGJJbWgrSGQ2ckx0T1lIcld2L2w5N0tmdVNuN3R2S053L2JSN3hGVGJvZzNo?=
 =?utf-8?B?RUxaaEF4UkNBLzdBMnA5RTZFWTZrZHQyanpKWm10c2R2dnN1L1Bsb1pzc05s?=
 =?utf-8?B?dnpvcDNqTkgwMXlub2w1RExPcjFIYytWM3A2VHBQQ0UyWnhFSzNpVDdRTTJU?=
 =?utf-8?B?MjYxTzJmcCtYa0NjVzluK0liUnFDcVU3Wlg0SjdreXBqL0FzNUJ4dW5Ndk43?=
 =?utf-8?B?OEp1SDRrb05Yc1h4R1Bla1ZUWFh1NE1nR0JNRTB3SjJuOEFiSVZzUzFTK0ZY?=
 =?utf-8?B?WU82Mk5IQkZJT1BCNDZNUFB4c0tiSHBZcG1GZ1BZSWJ5VFEyVUl3VFcrcExT?=
 =?utf-8?B?Q3RPNW9qcHNSWXltclRnanM4d1NQdE5MWW9ROW81NVZWNFM2V2VTaTB0Z1Iy?=
 =?utf-8?B?dDJhQ0RpSHBoUXNRNjQ4QUF0SEdTNmt5S24veVMvcjVVbTlmNWxtOFBVOHds?=
 =?utf-8?B?S2d6Z2czRGszcVNlQm43cnZ1Sy82ZVBYbTJLYVcwTjhjV09ZZG1taWRIdlVx?=
 =?utf-8?B?WVU1WFJnZTJpVGdsdVUwc0d3V0FtaXgzakEraE44cmRCeDdHTS8rMW55NCto?=
 =?utf-8?B?R1RNeXM2OW9BZHQrbVhaNUd2SFVRQVBtdWtOdi9FVEF3UktrTGV1bFBIeGxE?=
 =?utf-8?B?NUtIb0R5MEIwMEZhTzlvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0Q0dktUZjJCRGdQOW82UlNEWlJpWUNrRlVydmRWZUt5Tml0N2FwNHFUSkNo?=
 =?utf-8?B?Wk9rTUpWeTNWRTVCM2pKTkVJWnFraXJ3R2hNUjUwNlV3VFk4emxsTmhWS3Nr?=
 =?utf-8?B?L0VZb1lGRDRuMHdPNjhCclM4UDgvWldDNm9pYU9Na2IrazVFM1gyVW9GWFZD?=
 =?utf-8?B?SmxGT1NQaExROVlCcEpiWGZ6MW5jMnJON3Zhem8zOGlBOUlFbGtGOGxDWVJz?=
 =?utf-8?B?b05Oc2lyWXZDcHRGOUVKSTF0ZU9CYS9UUWM0QnJ0UnBwZWcwZXBJaVFhQlVm?=
 =?utf-8?B?dTVTcUU4OXJaQ0QrVW1wMmd2SlpaZ1F2bERJd0o5RlU5Sk9zS3Z4Q1Q1TE9k?=
 =?utf-8?B?VHJxaHg1cHdOZ1I3cjRlRXJUdlpVaVlZNkduMGV5RStxVDhXTzJ3RCtWRUIv?=
 =?utf-8?B?N3gzUDdySEYrUnl0Tk41SURZR2JXU2xiMDZvSy9DUVRHa2NNV3lHRDV4clcy?=
 =?utf-8?B?ZFh6RDd4K1E2RGpGTG1UalcyeE9HM1VsY3hVOTZjNG9RYitBRTRGeEV2TWJy?=
 =?utf-8?B?cERUcTlPdTF5TjBFWURIcUMvbEhiTXRnemQwMDlBT2Q1MmRTKzdodzkxWHNW?=
 =?utf-8?B?M0JEcVZsbmk0dFU2RmJOdEY0SFZUMHlLcXdDeTRNNEJUdDREcDdMdlZ4clBM?=
 =?utf-8?B?V2huMXlEeHFmMU4zTml1a3IxRWRmUjZRdDhoSnVhU2JaQm5ZVVZ5ZUhRMG00?=
 =?utf-8?B?c3Z3MEZhbE1hTDF1Sjh3eUpZcS9OS2VRK2RaY2VxOVgzZlJYcXQwZWZNc1d2?=
 =?utf-8?B?eTR3M0VhQzlUUm1VUTFtQlUrRW1MQ1FrdEdlK0lGc1NLd050REJjd25DcHJQ?=
 =?utf-8?B?SVRWazNLSzF3dlIyMTl6aXQwNllxTjNqU2RLRktSOHBrNHJMU2lFNS9xWWM5?=
 =?utf-8?B?bjM0NHhOQXl4a09HRjZFWm1IVlRUcmNtazVzL3JaRzkvL01Sd3pMaTh2RHdV?=
 =?utf-8?B?NjFpWkpSL21vRVIyaXBZU1RBdGM4dGNzOHVGVG9DTFlXQWc5VVZuakZjSnEr?=
 =?utf-8?B?WVRsdVdEcDNrYUxtbnZ0bVhmWE1HNTd6TklydDIzUVpMOUh3eXg3c3VxRzdW?=
 =?utf-8?B?amp0aDlYZVdueUR4L0I3Y2hVSzBCZEJkOGUwQkhQenMzN3JuSE5Yb1p3UzlK?=
 =?utf-8?B?dWFqZmxoSk9mN3RtNG00Kzd4czZTOUtOcWxJRVdMaHY2RFd0dHo3M1lFVWYz?=
 =?utf-8?B?SGdzSnkyQkEyVUthVGVnam5ocjJGY0JjWWh6R3JKSTZtVG5vdytiUnlNUUpC?=
 =?utf-8?B?NzNpdXdhRUhuWFBMYWJMa0hGTi80d2czN0NRMzZ6SXc4UXBWeDZoeEthcFNI?=
 =?utf-8?B?cFVGM2huWlo2SW9uMFcxd0RvODJEUXRUb3RoM09HMUcyd211ZlpIUkdobEhB?=
 =?utf-8?B?SDhjRkRmQ0dmRjBXTjBESUNqd1RNc24wR3QzWjBzemZiN2s0L2F3ZkduNkRI?=
 =?utf-8?B?cEp0SGpJdExpa0NxeUJKM0tKL1RhUVAwcStZMzJBRzAvTTl3REF1cndQUE1l?=
 =?utf-8?B?ZXMwdVhpekZBdW5Vb0xBYzdxTzRNN0l2a2h1Vk9LbHlZQzgvSzJqRG90K2Vu?=
 =?utf-8?B?amZLdWxGc2xianp0bjk4YVIyM3FLS2wrVFpiWllqaEwrWE1hbitzRnhkRlpL?=
 =?utf-8?B?YitaSWZ3blo2R0Z1cmhlZVlWdWhrQndNbnNlZjUwVXRLQjdmWjBmdk13eGtw?=
 =?utf-8?B?bnJEYWNyWlBzSmdNZG9mWVpHdUF5T3NwL2g1dS9MVUM5T1FEUU9PM1p0ZkFZ?=
 =?utf-8?B?anB1VC83TDlSZkNWVjg0eGJHdzZCZTZUM2pVbjVna3Y0VDV2WEhNSDVaNVFm?=
 =?utf-8?B?U3ltR2xPZ0JJSHdWRjR4UW9KRGk4dEJuRDRYdCtjWmxFZWN0UkZsYXd5cXBx?=
 =?utf-8?B?bXBnekZVN1dXMER2SGtYVGpza25BNzAyMm4xN2QzVy9vU2w3VGU2dlV5Y2kr?=
 =?utf-8?B?ckFnSXpzTDZ5VWh4ZjdRWVQwajNkS2YzY3NjWURIRlk4UVRoVVdqMU8xRnRD?=
 =?utf-8?B?cTdYNWZrMFV4N2lTcHc4K0s1MzBTQ3VXeVVFbnhYZjFtcmVveUFJQ2t4V2RK?=
 =?utf-8?B?MHIxTnZRRG5lWCtQUnRQUVJLcmNPdk9mWVAyejlUQ2xoY0FMUU80TWlJQWpD?=
 =?utf-8?Q?diu5o1dNdkJjehIDT3EgT58v6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519fde2e-7c7c-4481-f725-08dcd22f138c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:58:01.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mbpjOJ5EgutV1vRdaFEamNcMBNqQ+cq2Jx4zUq95y2zVvkRuqw7w4E5Btwu6I3X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6485
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

Am 11.09.24 um 06:27 schrieb Yan Zhen:
> Correctly spelled comments make it easier for the reader to understand
> the code.
>
> Replace 'udpate' with 'update' in the comment &
> replace 'recieved' with 'received' in the comment &
> replace 'dsiable' with 'disable' in the comment &
> replace 'Initiailize' with 'Initialize' in the comment &
> replace 'disble' with 'disable' in the comment &
> replace 'Disbale' with 'Disable' in the comment &
> replace 'enogh' with 'enough' in the comment &
> replace 'availabe' with 'available' in the comment.
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/imu_v11_0.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c | 2 +-
>   8 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
> index 57bda66e8..2ca127173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
> @@ -511,7 +511,7 @@ static int __aca_get_error_data(struct amdgpu_device *adev, struct aca_handle *h
>   		return -EINVAL;
>   	}
>   
> -	/* udpate aca bank to aca source error_cache first */
> +	/* update aca bank to aca source error_cache first */
>   	ret = aca_banks_update(adev, smu_type, handler_aca_log_bank_error, qctx, NULL);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index 189574d53..e9e599ff3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -2853,7 +2853,7 @@ static int psp_load_non_psp_fw(struct psp_context *psp)
>   		if (ret)
>   			return ret;
>   
> -		/* Start rlc autoload after psp recieved all the gfx firmware */
> +		/* Start rlc autoload after psp received all the gfx firmware */
>   		if (psp->autoload_supported && ucode->ucode_id == (amdgpu_sriov_vf(adev) ?
>   		    adev->virt.autoload_ucode_id : AMDGPU_UCODE_ID_RLC_G)) {
>   			ret = psp_rlc_autoload_start(psp);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 61a2f386d..71069b198 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -882,7 +882,7 @@ int amdgpu_ras_feature_enable_on_boot(struct amdgpu_device *adev,
>   			if (ret)
>   				return ret;
>   
> -			/* gfx block ras dsiable cmd must send to ras-ta */
> +			/* gfx block ras disable cmd must send to ras-ta */
>   			if (head->block == AMDGPU_RAS_BLOCK__GFX)
>   				con->features |= BIT(head->block);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index b8bc7fa8c..74adb983a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1970,7 +1970,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>   	DRM_INFO("amdgpu: %uM of GTT memory ready.\n",
>   		 (unsigned int)(gtt_size / (1024 * 1024)));
>   
> -	/* Initiailize doorbell pool on PCI BAR */
> +	/* Initialize doorbell pool on PCI BAR */
>   	r = amdgpu_ttm_init_on_chip(adev, AMDGPU_PL_DOORBELL, adev->doorbell.size / PAGE_SIZE);
>   	if (r) {
>   		DRM_ERROR("Failed initializing doorbell heap.\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> index 6c1891889..d4f72e47a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
> @@ -153,7 +153,7 @@ static void imu_v11_0_setup(struct amdgpu_device *adev)
>   		WREG32_SOC15(GC, 0, regGFX_IMU_C2PMSG_16, imu_reg_val);
>   	}
>   
> -	//disble imu Rtavfs, SmsRepair, DfllBTC, and ClkB
> +	//disable imu Rtavfs, SmsRepair, DfllBTC, and ClkB
>   	imu_reg_val = RREG32_SOC15(GC, 0, regGFX_IMU_SCRATCH_10);
>   	imu_reg_val |= 0x10007;
>   	WREG32_SOC15(GC, 0, regGFX_IMU_SCRATCH_10, imu_reg_val);
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> index fa479dfa1..739fce4fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> @@ -365,7 +365,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
>   
>   		data &= ~PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
>   	} else {
> -		/* Disbale ASPM L1 */
> +		/* Disable ASPM L1 */
>   		data &= ~PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK;
>   		/* Disable ASPM TxL0s */
>   		data &= ~PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK;
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index aa637541d..e65194fe9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -710,7 +710,7 @@ static int sdma_v3_0_gfx_resume(struct amdgpu_device *adev)
>   		       upper_32_bits(wptr_gpu_addr));
>   		wptr_poll_cntl = RREG32(mmSDMA0_GFX_RB_WPTR_POLL_CNTL + sdma_offsets[i]);
>   		if (ring->use_pollmem) {
> -			/*wptr polling is not enogh fast, directly clean the wptr register */
> +			/*wptr polling is not enough fast, directly clean the wptr register */
>   			WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], 0);
>   			wptr_poll_cntl = REG_SET_FIELD(wptr_poll_cntl,
>   						       SDMA0_GFX_RB_WPTR_POLL_CNTL,
> diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c b/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
> index e4e30b9d4..c04fdd2d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/smuio_v9_0.c
> @@ -60,7 +60,7 @@ static void smuio_v9_0_get_clock_gating_state(struct amdgpu_device *adev, u64 *f
>   {
>   	u32 data;
>   
> -	/* CGTT_ROM_CLK_CTRL0 is not availabe for APUs */
> +	/* CGTT_ROM_CLK_CTRL0 is not available for APUs */
>   	if (adev->flags & AMD_IS_APU)
>   		return;
>   

