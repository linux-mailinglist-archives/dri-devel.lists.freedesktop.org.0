Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AC401890
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 11:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37389870;
	Mon,  6 Sep 2021 09:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BF689870;
 Mon,  6 Sep 2021 09:04:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4209631wms.4; 
 Mon, 06 Sep 2021 02:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rcvAoM3K+nv/BIhLYc8AOy2o5yvDCg6Pjk+Bk9jSVEI=;
 b=BfaHWbTYcUn664I4ylN7KxmfbViqci69BMPWKx9A33j9t5HJQMbCt8lOSCuabz3w/p
 F6HjMbBthc9Y1yiRoUyOnBzUYpFZ66MH7ie5uqJtNvwwCnfsVQ5aw46jwOMG12yot1J8
 bP8llA5ux1njJ/sIFP4p/NmA7eRhZTmcIoGdO1SequybO0LYPJQpvqRgMlq+oqr108uv
 xiiM1mVse76FcKF3QRsq21LmpeEm0VIt7L+EiUXbO1BtSNbCbfl39LbwQ7mGzWaBfP3n
 J0BG1PGaP8bGYq7AudIJSXGxvrPFCJ8PJVnhHiiwIHO6DJfk875LAlk91i0qufpa0PWy
 Hz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rcvAoM3K+nv/BIhLYc8AOy2o5yvDCg6Pjk+Bk9jSVEI=;
 b=svH1zIWEmgVqIWCG6qXyZy0DPWcSR1zlvk+TT5GfgU8aGA72v39Olsbqgmy8a/a1WO
 HK6N3vqZuPMlKpFFpWWxHUciOhjsAyGjB1BQBqiphdWPjdnctfuZLRgfTBcGKsnYQoKJ
 NQDBCqc/EzO6xCJ0DBdHEEkd8lKxmj3ILbuDefj9xZWM/0KWhTOU0hpj1v6VCjcDTn0A
 EtHGyZY/ff5Pje+6AJthyhSoyKJafjG7RHGpelf5mdtZhuIrQQrn1Wt3+Z5llzvxse5g
 tRdHfHv8Ijb3+GNSeJDCdE3Q7M0+qHYvDbFk9METmpSUPmnQ0gFcrZFYeUBJzjiOjkhu
 HuLg==
X-Gm-Message-State: AOAM532s4VXh7mjjUcXrIvsS3cGuwjNGsSnTwjYrn6PIXK2Ts+TwVgTG
 gUezarL3hUajG69F1viXOo/ojWeqycI=
X-Google-Smtp-Source: ABdhPJwTwcgtWd7CxpajIEga3xHEKuOuA9sxbtk2wL4LqzjiTgnH66pTZSJJpfVEr2p/1cnWEtP23A==
X-Received: by 2002:a1c:1cc:: with SMTP id 195mr10409335wmb.188.1630919059929; 
 Mon, 06 Sep 2021 02:04:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e317:935c:f697:77f0?
 ([2a02:908:1252:fb60:e317:935c:f697:77f0])
 by smtp.gmail.com with ESMTPSA id u16sm7546971wmc.41.2021.09.06.02.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:04:19 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Fix a hung during memory pressure test
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 chenli@uniontech.com, dri-devel@lists.freedesktop.org
References: <20210906011210.80327-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6e225a21-aa39-d196-9d11-82705599445b@gmail.com>
Date: Mon, 6 Sep 2021 11:04:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906011210.80327-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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



Am 06.09.21 um 03:12 schrieb xinhui pan:
> A long time ago, someone reports system got hung during memory test.
> In recent days, I am trying to look for or understand the potential
> deadlock in ttm/amdgpu code.
>
> This patchset aims to fix the deadlock during ttm populate.
>
> TTM has a parameter called pages_limit, when allocated GTT memory
> reaches this limit, swapout would be triggered. As ttm_bo_swapout does
> not return the correct retval, populate might get hung.
>
> UVD ib test uses GTT which might be insufficient. So a gpu recovery
> would hung if populate hung.

Ah, now I understand what you are trying to do.

Problem is that won't work either. Allocating VRAM can easily land you 
inside the same deadlock.

We need to avoid the allocation altogether for this for work correctly.

>
> I have made one drm test which alloc two GTT BOs, submit gfx copy
> commands and free these BOs without waiting fence. What's more, these
> gfx copy commands will cause gfx ring hang. So gpu recovery would be
> triggered.

Mhm, that should never be possible. It is perfectly valid for an 
application to terminate without waitting for the GFX submission to be 
completed.

Going to push patch #1 to drm-misc-fixes or drm-misc-next-fixes in a moment.

Thanks,
Christian.

>
> Now here is one possible deadlock case.
> gpu_recovery
>   -> stop drm scheduler
>   -> asic reset
>     -> ib test
>        -> tt populate (uvd ib test)
> 	->  ttm_bo_swapout (BO A) // this always fails as the fence of
> 	BO A would not be signaled by schedluer or HW. Hit deadlock.
>
> I paste the drm test patch below.
> #modprobe ttm pages_limit=65536
> #amdgpu_test -s 1 -t 4
> ---
>   tests/amdgpu/basic_tests.c | 32 ++++++++++++++------------------
>   1 file changed, 14 insertions(+), 18 deletions(-)
>
> diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
> index dbf02fee..f85ed340 100644
> --- a/tests/amdgpu/basic_tests.c
> +++ b/tests/amdgpu/basic_tests.c
> @@ -65,13 +65,16 @@ static void amdgpu_direct_gma_test(void);
>   static void amdgpu_command_submission_write_linear_helper(unsigned ip_type);
>   static void amdgpu_command_submission_const_fill_helper(unsigned ip_type);
>   static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type);
> -static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
> +static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>   				       unsigned ip_type,
>   				       int instance, int pm4_dw, uint32_t *pm4_src,
>   				       int res_cnt, amdgpu_bo_handle *resources,
>   				       struct amdgpu_cs_ib_info *ib_info,
> -				       struct amdgpu_cs_request *ibs_request);
> +				       struct amdgpu_cs_request *ibs_request, int sync, int repeat);
>    
> +#define amdgpu_test_exec_cs_helper(...) \
> +	_amdgpu_test_exec_cs_helper(__VA_ARGS__, 1, 1)
> +
>   CU_TestInfo basic_tests[] = {
>   	{ "Query Info Test",  amdgpu_query_info_test },
>   	{ "Userptr Test",  amdgpu_userptr_test },
> @@ -1341,12 +1344,12 @@ static void amdgpu_command_submission_compute(void)
>    * pm4_src, resources, ib_info, and ibs_request
>    * submit command stream described in ibs_request and wait for this IB accomplished
>    */
> -static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
> +static void _amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>   				       unsigned ip_type,
>   				       int instance, int pm4_dw, uint32_t *pm4_src,
>   				       int res_cnt, amdgpu_bo_handle *resources,
>   				       struct amdgpu_cs_ib_info *ib_info,
> -				       struct amdgpu_cs_request *ibs_request)
> +				       struct amdgpu_cs_request *ibs_request, int sync, int repeat)
>   {
>   	int r;
>   	uint32_t expired;
> @@ -1395,12 +1398,15 @@ static void amdgpu_test_exec_cs_helper(amdgpu_context_handle context_handle,
>   	CU_ASSERT_NOT_EQUAL(ibs_request, NULL);
>   
>   	/* submit CS */
> -	r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
> +	while (repeat--)
> +		r = amdgpu_cs_submit(context_handle, 0, ibs_request, 1);
>   	CU_ASSERT_EQUAL(r, 0);
>   
>   	r = amdgpu_bo_list_destroy(ibs_request->resources);
>   	CU_ASSERT_EQUAL(r, 0);
>   
> +	if (!sync)
> +		return;
>   	fence_status.ip_type = ip_type;
>   	fence_status.ip_instance = 0;
>   	fence_status.ring = ibs_request->ring;
> @@ -1667,7 +1673,7 @@ static void amdgpu_command_submission_sdma_const_fill(void)
>   
>   static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>   {
> -	const int sdma_write_length = 1024;
> +	const int sdma_write_length = (255) << 20;
>   	const int pm4_dw = 256;
>   	amdgpu_context_handle context_handle;
>   	amdgpu_bo_handle bo1, bo2;
> @@ -1715,8 +1721,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>   							    &bo1_va_handle);
>   				CU_ASSERT_EQUAL(r, 0);
>   
> -				/* set bo1 */
> -				memset((void*)bo1_cpu, 0xaa, sdma_write_length);
>   
>   				/* allocate UC bo2 for sDMA use */
>   				r = amdgpu_bo_alloc_and_map(device_handle,
> @@ -1727,8 +1731,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>   							    &bo2_va_handle);
>   				CU_ASSERT_EQUAL(r, 0);
>   
> -				/* clear bo2 */
> -				memset((void*)bo2_cpu, 0, sdma_write_length);
>   
>   				resources[0] = bo1;
>   				resources[1] = bo2;
> @@ -1785,17 +1787,11 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type)
>   					}
>   				}
>   
> -				amdgpu_test_exec_cs_helper(context_handle,
> +				_amdgpu_test_exec_cs_helper(context_handle,
>   							   ip_type, ring_id,
>   							   i, pm4,
>   							   2, resources,
> -							   ib_info, ibs_request);
> -
> -				/* verify if SDMA test result meets with expected */
> -				i = 0;
> -				while(i < sdma_write_length) {
> -					CU_ASSERT_EQUAL(bo2_cpu[i++], 0xaa);
> -				}
> +							   ib_info, ibs_request, 0, 100);
>   				r = amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
>   							     sdma_write_length);
>   				CU_ASSERT_EQUAL(r, 0);

