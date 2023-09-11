Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A955579A615
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9916610E198;
	Mon, 11 Sep 2023 08:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAD710E048;
 Mon, 11 Sep 2023 08:38:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4013454fa93so47483615e9.0; 
 Mon, 11 Sep 2023 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694421512; x=1695026312; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IzAAzxJ2/qwV8UAbsiMaPaxKMg9rNmfMbdZJFqC9hfc=;
 b=HQZXA1xB+eyWGqyzljA8//oynsNNfss0FkldbBrTas3HStQRKFG+vBNVRSu++VEvEA
 v4i8162o+m+wIMmwUj6xrwSdKmIu9pTej7mVp//LvnH1Knm0gTuIC/+2Fli3HSdiSFX+
 LWBLtQ6qbpE0CAQfhu6MOgKKeMqX/kUzdkHT0CKUBq5+wCkXD/7iKcOrCig8bEQIlgWQ
 6OFgWU092Z+joA13pyPemU6CCzIvhCv+c6tT7WgsOa+mpq8KCTsvut93viAbV4f4crYJ
 wcHbz7JUntw+/1KGNZ//fnUXn7DaywOQyPThaSD5zigqV34V8BjlnBF0FpNb6jIza6rd
 mR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694421512; x=1695026312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzAAzxJ2/qwV8UAbsiMaPaxKMg9rNmfMbdZJFqC9hfc=;
 b=MaP8WzkRlPPtLyyO3ovtFpvcIhXpqzBuwu8gpxGqCvkI8oz5KyWncKe6vEgXmjxHmZ
 w3hssJytuG8wc713uT4dX4jivM6MAcrI4kDjeZdvKr8dT3mwhq+Zaw4F/jkVrV6vULyy
 5ydfuXFICj7MlNpg6wXIdEqZ14x1IhFyD38U33AGt+erMKqK5lIl9MZbK2EG0kTlRv87
 xEZzUHcfiBr6raVXXP085pMHPDVWWnQXiU3we3XaIS2qunehkZ/Tc9dT240UZQtaf4CX
 8bo683YiP5scLbeJTjnTVvureAIRFIY/4DBdOmk4IQB+KTYWS1LZPG7SWyNq7yaTwijM
 wNFA==
X-Gm-Message-State: AOJu0YyWQb3rw8Z8OAbTnD/RZc2HUmXMibXy9cmg6IAupkyxVZ+wv+od
 Hzc5cCEorTd/oFQFOC5cnEQ=
X-Google-Smtp-Source: AGHT+IHFH7KA+JlC4Lt7zEKfI4KHK/qBztjiFLfdMwJ7X3YiIAf096t+NBCxHj5pLdAgpIpI7wO/gQ==
X-Received: by 2002:a7b:cc95:0:b0:3f8:fc2a:c7eb with SMTP id
 p21-20020a7bcc95000000b003f8fc2ac7ebmr7501080wma.5.1694421512045; 
 Mon, 11 Sep 2023 01:38:32 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 p13-20020adff20d000000b003176eab8868sm9459783wro.82.2023.09.11.01.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 01:38:31 -0700 (PDT)
Message-ID: <2c097494-0854-3769-fb46-0f3fa59e06cb@gmail.com>
Date: Mon, 11 Sep 2023 10:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] drm/amd/display: fix the white screen issue when
 >= 64GB DRAM
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230908145521.39044-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230908145521.39044-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Stylon Wang <stylon.wang@amd.com>, Victor Zhao <Victor.Zhao@amd.com>,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Le Ma <le.ma@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <candice.li@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.09.23 um 16:55 schrieb Hamza Mahfooz:
> From: Yifan Zhang <yifan1.zhang@amd.com>
>
> Dropping bit 31:4 of page table base is wrong, it makes page table
> base points to wrong address if phys addr is beyond 64GB; dropping
> page_table_start/end bit 31:4 is unnecessary since dcn20_vmid_setup
> will do that. Also, while we are at it, cleanup the assignments using
> upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT.
>
> Cc: stable@vger.kernel.org
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2354
> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)")
> Signed-off-by: Yifan Zhang <yifan1.zhang@amd.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for the series 
as well.

> ---
> v2: use upper_32_bits()/lower_32_bits() and AMDGPU_GPU_PAGE_SHIFT
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1bb1a394f55f..5f14cd9391ca 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1283,11 +1283,15 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
>   
>   	pt_base = amdgpu_gmc_pd_addr(adev->gart.bo);
>   
> -	page_table_start.high_part = (u32)(adev->gmc.gart_start >> 44) & 0xF;
> -	page_table_start.low_part = (u32)(adev->gmc.gart_start >> 12);
> -	page_table_end.high_part = (u32)(adev->gmc.gart_end >> 44) & 0xF;
> -	page_table_end.low_part = (u32)(adev->gmc.gart_end >> 12);
> -	page_table_base.high_part = upper_32_bits(pt_base) & 0xF;
> +	page_table_start.high_part = upper_32_bits(adev->gmc.gart_start >>
> +						   AMDGPU_GPU_PAGE_SHIFT);
> +	page_table_start.low_part = lower_32_bits(adev->gmc.gart_start >>
> +						  AMDGPU_GPU_PAGE_SHIFT);
> +	page_table_end.high_part = upper_32_bits(adev->gmc.gart_end >>
> +						 AMDGPU_GPU_PAGE_SHIFT);
> +	page_table_end.low_part = lower_32_bits(adev->gmc.gart_end >>
> +						AMDGPU_GPU_PAGE_SHIFT);
> +	page_table_base.high_part = upper_32_bits(pt_base);
>   	page_table_base.low_part = lower_32_bits(pt_base);
>   
>   	pa_config->system_aperture.start_addr = (uint64_t)logical_addr_low << 18;

