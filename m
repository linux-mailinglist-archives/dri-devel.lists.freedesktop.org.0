Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692C56B59C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE16E113389;
	Fri,  8 Jul 2022 09:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34B9113238;
 Fri,  8 Jul 2022 09:34:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXwRPme4ufwbA6HaQtHJg8YjdgCB3lotsR3ZkQOO5AeioTIcIVbzA/nQECR1NZGVom16Kxlmc94vFQx9nRIiizrh/49wChHJ5uSqzF9KpvjJ7SQduoDKZUG/gEYfIwjSR5Zn8hQe8QatQCzLZGUuuMgEzaIGFl2Lnn+Pbce/EyLdI7Gs0VPVIQ3T+wCs25v0QOnbc2I9bFJWNfpoeAPe//c8TXLe9vJAZgYSN9EJ59QgOATRlaajbG4ju4q0UooJr5evfhGSbU4pswNni0E2/5jmi+ICwlQslTolkXJw0G+3y24xB75Q/OglYnRT4vvTmlYKJrQAn27JxKf4IpgjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW9WAhEy24C8HwNn3QNb/1G2RVkxQ3PGTrQ/qHo988c=;
 b=myI8AMwTDQYObrZi5Rj3gXBS+wo1mtuK+KFVrKz/iFa0bXXcLAkP1DUQXiwyMcSWZ9DWRBUijwZAmJ0SvBfXw3zqnhOsGmxy6/domSJPIbesz4wVSufIq+zfBKZREFBmCrnOyWQmSGG9tpSE4GhTuBtEU7tejBRQo5ktl0kP18LM/tIbjLnaSGX0FEbivI6FqTxZciOvxXeBsChyi9CZnXrVmjPU+yJbwLFLdTcnas6Y1dNSad3HeK8hBxE4fCdWbxRF3hMhbKBTuYhAwsbSE4oeSq6cptIUfUKPbGs7ZtXyaBTGnXV23bs0NO1SEoHmGyYYF1rCX+uej5YBC/aiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW9WAhEy24C8HwNn3QNb/1G2RVkxQ3PGTrQ/qHo988c=;
 b=VOfJPQkOyJXM31AL4LxY8FHTD0K7hu6IrH/GfFljvNAPsOL2yYXVm/NVDUv5MfUDQIS94/VVH6n0c1AA8+XpLpNxTG4mwqq1VyJjHxWqfKPtzp+Qqg64ldfDLuejVcoBx36J9s6qxQpVq4lcXUMXC0+iWs629iqJwf5eIvxT7cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3377.namprd12.prod.outlook.com (2603:10b6:408:46::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 09:33:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 09:33:59 +0000
Message-ID: <6a164c3e-0241-6e7a-e6c4-878602c77541@amd.com>
Date: Fri, 8 Jul 2022 11:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0034.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3726b57b-f411-401d-96ec-08da60c4fc5c
X-MS-TrafficTypeDiagnostic: BN8PR12MB3377:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWSvNZA8hWFvxTGjaQ0CkY2hVGmmCfyZL/JjBOov3+5CqDwQE94PyJJuJ/OchGcrn1GuKpTPiyy0tvP+JCwFHJCY7jv9FaNBfOhiC62pAkLeHYCnAVsfA/zOZNHwx8XJqjbJ15IaEWapqDUGlqKvNVQmyBAxsPNceewxBL+CwbdsR2WxvJU65IXc1Qwv4AYQzfN68iVQ+2z/EewS3QLlqjk0fpSSod+60Y4+yUk8DUIDu+Nrode7bBgEENt+p2yIv77rWPdH6Z5qsILFC84k4758zTNnPR8O4ZoNlUi+qi8tc1UeCT6qwrK3QFPHxN5bZ35TxvB78U81uxL2+gDm6qjrPMO+xWQab0sM/dRBrrdmx0BRc5yZSJ67odXzpOSJ7xlJvmOaIwfcFucMPYoZULzynBTw4bymX06n7ZlCMy7vXSfHI0L8OO0wRtTJpPAY/l15NTP2s05lKZ6/gDk43dvwBlZtFJMOzxTlMNyYHkgIZa1ti2mbE0YORudzC4IKsyEqYBL0StTF0Sd5KilBd5oXi+7vQ3cb81hHAsjWE0cIOojBCFf+1QH0cJJFk4/gHTLLD+m08F2Wd38yEuT7alfd+R9ytDw6d5saHQPAoNvzeRUtYoiqS2dnIWYQAKqiUv4wn8ggw732081Ja2RDs6nYp2MpxD0Jyf3edv/hDaqIrLaz8LzkmxlMSLRNUyIyg6gjP28LKSIloQxIOGKRRQAhm5rxcyWQj/SPZoamJRMjRtCBFCJ6V3ajIi9awZR33iwOkwV9pA7pWuFo6r5XbWRwfnZrEXkl1VXOzerddFzOdytMx0IeXjyKRil06ZK9uelaq3bLrXYP3y/wtpWWK2p1R9N5Ha95X3QFGcdlJAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(83380400001)(36756003)(186003)(31686004)(2906002)(2616005)(38100700002)(8936002)(450100002)(66946007)(66476007)(6486002)(66556008)(4326008)(8676002)(6512007)(5660300002)(6506007)(478600001)(316002)(31696002)(6666004)(41300700001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpzcm5iYzFad1lEWnZxS1dIU3NHcjhWN1RMYmhwVVp1NHVpM0dKUTE1R1RM?=
 =?utf-8?B?QzIxWVhzblR1SDBNcGduMEllTTBnK0dTRXMxUUJhaUxLQXlIRlBrU2RYRnZD?=
 =?utf-8?B?c1dzWVQvcGl1cmRaRkg2dEE0ZFQvQkFYZU92Y1JVMWU1d3BMUlhJTTI2RHN0?=
 =?utf-8?B?K0xiZm5TTXFybXFPN2dlOVFORkNmRG1NNlNkSi9EUnc3K2VUNVQ5djZrYUNr?=
 =?utf-8?B?R010TDREa1FqVFM3TWV2UjZrdXJJK0VOdlNWaUh3MXR3d1JtMUZjNVVRSjFI?=
 =?utf-8?B?cmx3anU5STkzbHhvOVRlSDdVT3hIZWI2VGlhNmE3MlU5d0x5UlhiN1VRa2Yr?=
 =?utf-8?B?ZXh4eUNDbUxmNHlWT3VQMi9VeGI5UThMcUt3QnNoQjhDaFRlUmRoUitHVDJx?=
 =?utf-8?B?dFYvaW1NNHNLd1ViUzhnQm11RFRjZWRWaUowTXJad3dsay83My9IMjNxY2w2?=
 =?utf-8?B?MUtrcUpsT2VnSUFKeG52U0dHQjNKSVBkQlRoK0V0dG5BSUR0Sld3aURzOEcy?=
 =?utf-8?B?MlNGdjQvVkpHWGxoTTEwYlNRZ3BXTUE4L0w1UTY3b0szTzdGTlJTRjJWYkdO?=
 =?utf-8?B?aVhpM2luNmtDQTZ5QnlCSW9waEZCMkpCNU52MFR4dWpjWjdySzNpR2hNY1Zy?=
 =?utf-8?B?Mk1va1duejU1UFc4dFZNUmgxamRYSEFnblptSjFoTEl6dWltT2FPQmNhM1dm?=
 =?utf-8?B?eXFYZGorUUdveGJjcUlkbzdIUEVSbDlWQXRwVHRudUVteWV3dmxxVGlwMnlG?=
 =?utf-8?B?YzBad1k1NHNLRHVPTlVHSTUwRWZZZFBUV20rSUkzdmN1VTdoZXluNGNXa2xm?=
 =?utf-8?B?aUZlWU5rcGRCcHAyWUQraWxFQmJ1VmUvaE1VdWhoS3VXRm1Od1lpajJEdGVB?=
 =?utf-8?B?Y2licEh5eDFsS2ZleGY0eFJRR1liZDZQL2kvanh6ai90RC81RWI4ZllxQTdn?=
 =?utf-8?B?OXRybWpKUlVOaGxIQWd6L2JkMm1HQmxPSzBDcWlwcEhNNjNMdk0vRjRETkZ6?=
 =?utf-8?B?WmVsWm9VNmxERU04SVp1S2hJZ0xscVBwMU1SQ00rYXBVK2k0ZzJnMHROVTZX?=
 =?utf-8?B?QVc0OW5WSTM1Y0l4bVFyMldqb0xlbkJYK1YyYkxxZGxkRWRjV25rRUduQVNQ?=
 =?utf-8?B?UFVUdTE5M0IrRHpXSDA1d0FOU3EyNHJBSzZPcTc1NjZxUjB6Yi9yRXFDeitz?=
 =?utf-8?B?SUZQUGxVSTJDSVBKN3ltamF2bnRURmU4K0dMcjRjdmxnUXY1MzlDdGM3WGo0?=
 =?utf-8?B?ZmxPTk92V3pleHNzMy92d3A4Zzk2MnBtMXJIamlQTjcrd3FyVk12WXZkT0FV?=
 =?utf-8?B?YUVDNVlDN0dZL1VxNFBxZFdtSFYwR0EvWHVkMjVvWkhhKzdTN255WU1HSjVN?=
 =?utf-8?B?WkEyYVluVlhzeFZNR3NDb0hwR2FVM0ptdUpFaDh1eHdaM3ZVMTRuYTVMbFR5?=
 =?utf-8?B?WWtTSWtuTmVVb3I3RU1LdS9vWXRWUVRzUkZrNzdRTm1TVC9iem15b2dSd1Yy?=
 =?utf-8?B?a2EwNXFtT1dtd3c4TzNOWmtiSzlWZE1mcDNQOGt6djlwZ0ZVQmRUcVUzNVll?=
 =?utf-8?B?TDJBTGNyOWRGeUlLU29lcVo1MWFlMFZid0ZoalFuSEw3YW85elVxVGRZNzJ5?=
 =?utf-8?B?RHA0M21VZ25MYWlyeFJLNjhTeDRvaW5aUDE0SzUrcFZyK0FmU25XMTdSamNU?=
 =?utf-8?B?cUtxUHlHU09pckZjajlSREsrbGNVQ0FSUnBaeUdrR1kyMVFJTkxocjBJdGNs?=
 =?utf-8?B?SElOOEtGcVoxazdnZlZrNHJtSWJxRkY3cVpOTnNqeHRUSU83NVlUWjhZT1BG?=
 =?utf-8?B?VUdOdC92b1RsNWpUM1NJS2RNUWQ1N2lqZmFlTWwwdHZvdFl6SDQzd21wUG5U?=
 =?utf-8?B?bWx0MmE0WHcwR2hUMXV4dUFMR3hjQUlVRFI3M0hpR2F1Y0VuYkFiZW1hc1dI?=
 =?utf-8?B?dlZJOGdGV25IclpyaTdqVXBpU3VDeHIxcWRyWExVbWVSVk5Jb3dvNExabHFx?=
 =?utf-8?B?Y2NXbHdIN1lScndUbEdlZTNPSm1PWHo0aUFHTFQycUloK2NtWGsvSnZTNmx6?=
 =?utf-8?B?R3kxT3FIUXF5VVZvSFNvbmFCVEJxVnZIaVpzbDdWR1JYZ2pCNnlvcXRSTHpV?=
 =?utf-8?B?bFdYcGIxNERkbnZQeUVWY3Y4UVdKckR1UEtOTjFmM0l6cVFXM1ZkNW14UkZP?=
 =?utf-8?Q?zKh6Y5pJBzHnniuj4IjSt8qANoc/K8YR1scyUVizYDjz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3726b57b-f411-401d-96ec-08da60c4fc5c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 09:33:59.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NBkn0MPVMklwCr9GWSnlklB2zn2BCF6NZMg6OoCgHqYbeeWyd9qh3He7oFWdstl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3377
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.22 um 11:30 schrieb Arunpravin Paneer Selvam:
> This reverts commit 708d19d9f362766147cab79eccae60912c6d3068.
>
> This is part of a revert of the following commits:
> commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
> commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
> commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")
>
> [WHY]
> Few users reported garbaged graphics as soon as x starts,
> reverting until this can be resolved.

Please squash all three patches into a single one. Apart from that looks 
good to me.

Christian.

>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 --------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 27 ++++++++++++++++++
>   2 files changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7a5e8a7b4a1b..51d9d3a4456c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -50,35 +50,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>   	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
>   }
>   
> -static inline struct drm_buddy_block *
> -amdgpu_vram_mgr_first_block(struct list_head *list)
> -{
> -	return list_first_entry_or_null(list, struct drm_buddy_block, link);
> -}
> -
> -static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
> -{
> -	struct drm_buddy_block *block;
> -	u64 start, size;
> -
> -	block = amdgpu_vram_mgr_first_block(head);
> -	if (!block)
> -		return false;
> -
> -	while (head != block->link.next) {
> -		start = amdgpu_vram_mgr_block_start(block);
> -		size = amdgpu_vram_mgr_block_size(block);
> -
> -		block = list_entry(block->link.next, struct drm_buddy_block, link);
> -		if (start + size != amdgpu_vram_mgr_block_start(block))
> -			return false;
> -	}
> -
> -	return true;
> -}
> -
> -
> -
>   /**
>    * DOC: mem_info_vram_total
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 4b267bf1c5db..9a2db87186c7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -53,6 +53,33 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
>   	return PAGE_SIZE << drm_buddy_block_order(block);
>   }
>   
> +static inline struct drm_buddy_block *
> +amdgpu_vram_mgr_first_block(struct list_head *list)
> +{
> +	return list_first_entry_or_null(list, struct drm_buddy_block, link);
> +}
> +
> +static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
> +{
> +	struct drm_buddy_block *block;
> +	u64 start, size;
> +
> +	block = amdgpu_vram_mgr_first_block(head);
> +	if (!block)
> +		return false;
> +
> +	while (head != block->link.next) {
> +		start = amdgpu_vram_mgr_block_start(block);
> +		size = amdgpu_vram_mgr_block_size(block);
> +
> +		block = list_entry(block->link.next, struct drm_buddy_block, link);
> +		if (start + size != amdgpu_vram_mgr_block_start(block))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static inline struct amdgpu_vram_mgr_resource *
>   to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
>   {

