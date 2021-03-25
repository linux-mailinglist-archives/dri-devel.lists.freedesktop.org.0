Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D9348CBC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62616ECE7;
	Thu, 25 Mar 2021 09:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E330C6EB4B;
 Thu, 25 Mar 2021 09:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHVryk+MYngjx8DgS6hpu3WE1TXusmr17IEPMelbD09mCpGn7lQb6NFyILx4zS6hQpwtwwz8JRMjs7JQp5pHLihQ4X85s3ylnH3ESmOjx2+cnwhju9YOMNbqg+Fu795O9e0gU9P1u06zSRbZuS2xpp5sx8PnyRO0tPZdOAst5iS9h7kLLRPE7aAXHwyevuPSscbjs2IDOEE4e+AlNHPlS6saVMCJH31JJ7xZFRSplsEjl9kdB7zNc2cwFIJHxn1OO7gG+aUREl1SN8GmNh5oPnRsSWVqJLYshqtjQZBZawOY9Rp8g9pV9JOluSMgfYlmwpUBTavn+ynAeYm6sqYqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27sKSXJnn5++at6ztZelSkJJ5QNWl4VqMfUjNZ110us=;
 b=nEBgixywFRRSYGwzQ8FLk01yDKwaCpybi1so9Q+QX0VcLt4k+R2RBiJMgnnuh4U/i6ZgJt61YTfikFsrruEaSb3cJYo8JCIyrgqp9zzgbT7EfqffqkLtGsXsi136N9QLcNHY3Cww4/umUHXJlX2KaKTvHUrc+1qoAoSBO32QmGbcFy7CFTOH+levuOKQ1Asa7kYiUULOPf7G7IIuVzRA+L39J8p7hS+EjgGULFCG1mh1Djf79RVj9hur/y7P51v4A5qo0dHZsK5nTkpfcch964c6npKqu3HwRR8I/DyTbB5vkQfOTHi2QgrSE3rzq0mR48dhwcWLvia9eDrKmMWxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27sKSXJnn5++at6ztZelSkJJ5QNWl4VqMfUjNZ110us=;
 b=ajQ9hTk8LDL04EbqmYikblr8q7yjcwkrFxKHhAv15say1n46mzXS6pwCVLzt/u5erYAHjMjKXL+LD5fvClDqg0QInMMupFPJc8krMK55WoasSD55ew09PJ4KLSXj0QS8NXGetZFkVb5rqJ08C2eafEG6GL+hDJe5cJKEF3I7Tgc=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB2469.namprd12.prod.outlook.com (2603:10b6:903:d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 09:26:03 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 09:26:03 +0000
Subject: Re: [PATCH] drm/amd/amdgpu/gfx_v7_0: Trivial typo fixes
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, nirmoy.das@amd.com, ray.huang@amd.com,
 lee.jones@linaro.org, andrey.grodzovsky@amd.com, luben.tuikov@amd.com,
 marek.olsak@amd.com, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20210325085324.30224-1-unixbhaskar@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <8109ef99-1ea7-a11a-bbe3-1fac9851834d@amd.com>
Date: Thu, 25 Mar 2021 10:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210325085324.30224-1-unixbhaskar@gmail.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0648.namprd03.prod.outlook.com
 (2603:10b6:408:13b::23) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.7.117] (165.204.84.11) by
 BN9PR03CA0648.namprd03.prod.outlook.com (2603:10b6:408:13b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Thu, 25 Mar 2021 09:25:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 894c1bef-00a8-4480-cdf2-08d8ef7002b7
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2469EA206E62ACDF7F103EED8B629@CY4PR1201MB2469.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VQRY1YNxHSUOv1JwmvzM7/Cgs0AWZcnAUgcMdDqyiT/KQfz4apOXJUsHNL1/yIfckPiZUN54pdx5dQtnssbSFaDsDjbqBqeRQUGCbon5OJhYlTUIJ6cwWgHRmhcghXxg0VUYWMddvIPRaWDEH9PRuyuaUQTODfNulcBhdxloC2MgJnPoYWqKik6XpPTg6/gB5DMyBI8APkM+nQrKYNSnSijYjhSxL6fHwX6fiTD6NSP1v6Ro4/smFwIPNhPhiiu4JQGyB1uuxZ39LUYS0H/euMkcn9WhlyaEWZx86z2gsUMiGTTLOD9ZxZMUAxQySxYbb0Ol7ub8R9fhUAy+eCsIKBQRLDXge5OC4iugLtk4IWz1kB1/+somsr/H3P2GPB89Jt05UpkQ8LD3J/IcNiw+qJwh99qMRHLCqXw/B+yGisjBOG+lyLkd/yvdpnougp3NX4kV+9iIZLYZMz0nj6Z8kzBcrrG7hiZrhPNjvR7Cymnnrm48Ge1fFdHvPDl54XNY6O6QlprKcWreZJ/cBdaWmK1b/qhK5qBOaM6bq1LhBvJHgPtV7fbmsWaOjgbnnfkEq4fPTXPwpaDkcVa7E48cN1EIEXqP+7OPqufXGq68fNHFchdfMTagEIAKUd6KesRoRjgimQSVal44lmdH1tmSNh4s9fkVAk/mUjaYuY4finNhU9CtaqT5/5us00cAtq8YQPNfHKl2Yg13nzo6m/LrzAhe6Y1JXU8l3dvD6vn/Xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(8936002)(66556008)(8676002)(66476007)(4326008)(6666004)(66946007)(31696002)(5660300002)(36756003)(956004)(2616005)(316002)(2906002)(16576012)(26005)(7416002)(38100700001)(186003)(921005)(53546011)(83380400001)(6486002)(52116002)(16526019)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUxTejMzVGhCYzlKaFY1L1NhNjFqTXArQXFwWEZPSUE5SVd4Vjl2T2pOVFMz?=
 =?utf-8?B?Y253QURLRksrQkRVejhIS3NhZjJYWi9uNHNTbG1pNVdKYTdPdXMyQm95MnQy?=
 =?utf-8?B?WTBGRjJHeXVBKzFablJuTDFXVGNHWit0MGFYN3I4WVpwdm9hQklFbjNVNlBH?=
 =?utf-8?B?TnpaZjZhSWJMdFhMVmtmOFllb2szUit5OVFEeThlUmN4UmJPZHVOWXhaUzNt?=
 =?utf-8?B?ZW1oVDNNRWtvMTB3QUo1a28yK2FlTGFvTjBHcVFTc1NOZDNyQXRuRDQ3NXVU?=
 =?utf-8?B?bXo5SVVIeVdCZXlrRnl5ZHE0Qkp4M1VYMndTY3hZWEYxMEpkVzArNDlUZFZM?=
 =?utf-8?B?MlZZQjRDc1JGV2Q1YzI4QWphL0VOTDRab1dTMmE3NEJIbTBHdlFSWHgxUTNC?=
 =?utf-8?B?MXNNbEpnRGp2Vlp0anVrakYzWkRoUkNZWjZKOTk2eEV1SEN4YXRJNTQxRlNp?=
 =?utf-8?B?QVZrM01FR1BoZEtoU2pwSzRXdWcrZFRMSW9DeEg1OGd1cCtRcmJYdzVrV2Ez?=
 =?utf-8?B?cGR0S0p0bEl0cGMyWlMrcVBoR200bjVVWlFJdWtMYVNZWVhzTGxDWFAvcVpy?=
 =?utf-8?B?ZFk3b0JSSm5ORkVTdmtqZ2ZqUXhiVFZkMUZDUHhHS1JMdERabEQ5WkNwblRH?=
 =?utf-8?B?VWcxT1M3YVd3Q0NCc05OSTZGNmUzVXlIcmxCZ1J0VkVzQkdhd2dDaVJGT2Nq?=
 =?utf-8?B?VGVOSHBGa1NCWjMyN0Y0MW9lNjlSVVd6dGVNL2UvdC9MUFZZbCtEWGdvdVhG?=
 =?utf-8?B?emtmSEozeTVCdEYzQVpabWtIbWxmTlB6dUludGREbXFqMEtSRlRWOVUzK3k5?=
 =?utf-8?B?ZHVFMEVjRWRUaEptNEFPemFYT1EvZ3FCN20zT1RsNU1QTGtVL2xOenBEeG81?=
 =?utf-8?B?NlJ2UlRUUlRIajVJMTNuNVZPMkpWbjRsUm1xYTlRb3RDNno0ampYVGwvTm9K?=
 =?utf-8?B?WEl2Z0g3U2RKZ0huYVgxNXVka1YwRTNSUUVFRnVjOVFkMDJVQ0dpYUxuYlNz?=
 =?utf-8?B?M3dRd2d1M2hndVRZRkdnNEFKempjSEV6WjFrcHV6Mkk0NXhGdWt2SnB5MWFF?=
 =?utf-8?B?T0lDc09EQlZmWWhYK2paenBKMFlDdGJvNExQSGdubmppa0RGZ0NFSGhaV1pi?=
 =?utf-8?B?YmF6M2RiM216aXV1c3RFNmpxNVJROGFKRnBEUnlUWWhBdWxSUTlkaE5EcDhU?=
 =?utf-8?B?TStxNnRwU0RJbTJ3cWNmaVRubjM2bUFyekdYZTliTm1XOGxucCtlWkZzOHd6?=
 =?utf-8?B?bTJQSUI2MW5Uc3dLK2RHaDk0MThtOWU0OTY1NmpDUVROaERTbjJlZjRzaDJw?=
 =?utf-8?B?WHE0T0ZSREpOOXlsbFNib3FGcHJYaGxDZlRzUnFMVHU0RVB5dnY5eUNkS21y?=
 =?utf-8?B?QjE5cTRQdmM0b2lkTWNkWlh0Y3ZHdEZXT2IwMjZ2a1YwdWRscStYcWFabkNT?=
 =?utf-8?B?R3ZWMHYreFp0QnA3TkVQeFhobit6dXhoY0hUSGlKS0dhL1RZL0tEWlhTd3pl?=
 =?utf-8?B?c3BUSFpBNzFNWHprVFN0cFBVR3J0NE10Q0xXWlY0c2xKUDdQUEZmTTVPUTlj?=
 =?utf-8?B?RHZwcVJQZUtZa2pFcWpOOUtVb29WMDdoTnpjVnFXckpZZ1ZRTll1U0lyZHBn?=
 =?utf-8?B?eldNTmNkbXA4c1RRZnhmZmN3NDMzUGxzNDJaSGFOaURDZXpsUitnQnBnYXlI?=
 =?utf-8?B?OXJ0K3E3SUdIY3VNa1dRQnNHSm0rcmY0TmhsbXM4WHNUZ2M1RWhDUlJ3dDlT?=
 =?utf-8?Q?Pw+L335xXw+mIlNNBAqWErXZM4BWRBTDVbfDsrn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894c1bef-00a8-4480-cdf2-08d8ef7002b7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 09:26:03.6839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRG4G3AdzJsPHAIswOYnr88tVG3pPkCs+Sy2JdPtSU+K/7BnrEBqm+K0gW6BsPUO1Qr4TCNzXaqiOFzY1JzXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2469
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
Cc: rdunlap@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reviewed-by: Nirmoy Das<nirmoy.das@amd.com>

On 3/25/21 9:53 AM, Bhaskar Chowdhury wrote:
> s/acccess/access/
> s/inferface/interface/
> s/sequnce/sequence/  .....two different places.
> s/retrive/retrieve/
> s/sheduling/scheduling/
> s/independant/independent/
> s/wether/whether/ ......two different places.
> s/emmit/emit/
> s/synce/sync/
>
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> index a368724c3dfc..4502b95ddf6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> @@ -1877,7 +1877,7 @@ static void gfx_v7_0_init_compute_vmid(struct amdgpu_device *adev)
>   	mutex_unlock(&adev->srbm_mutex);
>
>   	/* Initialize all compute VMIDs to have no GDS, GWS, or OA
> -	   acccess. These should be enabled by FW for target VMIDs. */
> +	   access. These should be enabled by FW for target VMIDs. */
>   	for (i = adev->vm_manager.first_kfd_vmid; i < AMDGPU_NUM_VMID; i++) {
>   		WREG32(amdgpu_gds_reg_offset[i].mem_base, 0);
>   		WREG32(amdgpu_gds_reg_offset[i].mem_size, 0);
> @@ -2058,7 +2058,7 @@ static void gfx_v7_0_constants_init(struct amdgpu_device *adev)
>    * @adev: amdgpu_device pointer
>    *
>    * Set up the number and offset of the CP scratch registers.
> - * NOTE: use of CP scratch registers is a legacy inferface and
> + * NOTE: use of CP scratch registers is a legacy interface and
>    * is not used by default on newer asics (r6xx+).  On newer asics,
>    * memory buffers are used for fences rather than scratch regs.
>    */
> @@ -2172,7 +2172,7 @@ static void gfx_v7_0_ring_emit_vgt_flush(struct amdgpu_ring *ring)
>    * @seq: sequence number
>    * @flags: fence related flags
>    *
> - * Emits a fence sequnce number on the gfx ring and flushes
> + * Emits a fence sequence number on the gfx ring and flushes
>    * GPU caches.
>    */
>   static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
> @@ -2215,7 +2215,7 @@ static void gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64 addr,
>    * @seq: sequence number
>    * @flags: fence related flags
>    *
> - * Emits a fence sequnce number on the compute ring and flushes
> + * Emits a fence sequence number on the compute ring and flushes
>    * GPU caches.
>    */
>   static void gfx_v7_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
> @@ -2245,14 +2245,14 @@ static void gfx_v7_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
>    * gfx_v7_0_ring_emit_ib - emit an IB (Indirect Buffer) on the ring
>    *
>    * @ring: amdgpu_ring structure holding ring information
> - * @job: job to retrive vmid from
> + * @job: job to retrieve vmid from
>    * @ib: amdgpu indirect buffer object
>    * @flags: options (AMDGPU_HAVE_CTX_SWITCH)
>    *
>    * Emits an DE (drawing engine) or CE (constant engine) IB
>    * on the gfx ring.  IBs are usually generated by userspace
>    * acceleration drivers and submitted to the kernel for
> - * sheduling on the ring.  This function schedules the IB
> + * scheduling on the ring.  This function schedules the IB
>    * on the gfx ring for execution by the GPU.
>    */
>   static void gfx_v7_0_ring_emit_ib_gfx(struct amdgpu_ring *ring,
> @@ -2402,7 +2402,7 @@ static int gfx_v7_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>
>   /*
>    * CP.
> - * On CIK, gfx and compute now have independant command processors.
> + * On CIK, gfx and compute now have independent command processors.
>    *
>    * GFX
>    * Gfx consists of a single ring and can process both gfx jobs and
> @@ -2630,7 +2630,7 @@ static int gfx_v7_0_cp_gfx_resume(struct amdgpu_device *adev)
>   	ring->wptr = 0;
>   	WREG32(mmCP_RB0_WPTR, lower_32_bits(ring->wptr));
>
> -	/* set the wb address wether it's enabled or not */
> +	/* set the wb address whether it's enabled or not */
>   	rptr_addr = adev->wb.gpu_addr + (ring->rptr_offs * 4);
>   	WREG32(mmCP_RB0_RPTR_ADDR, lower_32_bits(rptr_addr));
>   	WREG32(mmCP_RB0_RPTR_ADDR_HI, upper_32_bits(rptr_addr) & 0xFF);
> @@ -2985,7 +2985,7 @@ static void gfx_v7_0_mqd_init(struct amdgpu_device *adev,
>   	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffffc;
>   	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
>
> -	/* set the wb address wether it's enabled or not */
> +	/* set the wb address whether it's enabled or not */
>   	wb_gpu_addr = adev->wb.gpu_addr + (ring->rptr_offs * 4);
>   	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
>   	mqd->cp_hqd_pq_rptr_report_addr_hi =
> @@ -3198,7 +3198,7 @@ static int gfx_v7_0_cp_resume(struct amdgpu_device *adev)
>   /**
>    * gfx_v7_0_ring_emit_vm_flush - cik vm flush using the CP
>    *
> - * @ring: the ring to emmit the commands to
> + * @ring: the ring to emit the commands to
>    *
>    * Sync the command pipeline with the PFP. E.g. wait for everything
>    * to be completed.
> @@ -3220,7 +3220,7 @@ static void gfx_v7_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
>   	amdgpu_ring_write(ring, 4); /* poll interval */
>
>   	if (usepfp) {
> -		/* synce CE with ME to prevent CE fetch CEIB before context switch done */
> +		/* sync CE with ME to prevent CE fetch CEIB before context switch done */
>   		amdgpu_ring_write(ring, PACKET3(PACKET3_SWITCH_BUFFER, 0));
>   		amdgpu_ring_write(ring, 0);
>   		amdgpu_ring_write(ring, PACKET3(PACKET3_SWITCH_BUFFER, 0));
> --
> 2.30.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
