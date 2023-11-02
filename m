Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1997DF3B9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C1E10E8A2;
	Thu,  2 Nov 2023 13:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268A910E8A1;
 Thu,  2 Nov 2023 13:27:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso7173465e9.0; 
 Thu, 02 Nov 2023 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698931623; x=1699536423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rlu03lxFls5C1x1lpAAOr0VbKRmgaGXYWhn72Cxcnng=;
 b=CTvK2PH2JR8+4HskDXNLFOvtyt+AMcU9OcGTDOL5qLQ0wWNozSzd+PkTcYLJWTXsZJ
 2fQPKuuFQosQRQZ47IptLNisB0+cb5GDSNvEs5sKgh8RtRfyPbIQR6pi7TrASDJK5ZE1
 hVWAgVH2URGf4ujeCs/dc5EtHBCPgxCfohNc5VZ2PuA6ZQnKU7f/2prmOs7DH+p0eVIZ
 cOJdBxGYgq3LScvOfStMlC1sfF1nOc8SeInRlSmrpQwsA8IFKQQQHEakyczAV+vwidYC
 kexHSnGwLL5aLm8yRE+9EoibgRiCqf0Vv3AzKBsD0YBUilbZIKMM6CkUAePBNax8lV8N
 WyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698931623; x=1699536423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rlu03lxFls5C1x1lpAAOr0VbKRmgaGXYWhn72Cxcnng=;
 b=SOaigaTHFMwPJbzVhCoi8lnv5GPd0FqUJexQNU9nCvyUpEvhOfNHycnWm9TMgej+hV
 +Tb6W5JoVltazRKlv4BZcw/Nij0bEVlbQc4O19McqzspenH6pTawHAsYIEKyHhARWhR0
 DeIHO0HxaUxep5kBaazM+QHOPPhPhom7p6EfBdLLpZF5Qck0P9ESnxXDp8V+x+oxIUks
 bHl4Hw1yrzicoHl4tq3ybr/452mFTqUrWarLNnCzMXDafwnM7irM1zr7R3WNUDMQXHtw
 8vQVJJdlIFakIDXRl72YbsJkvraHGbZ9CZw2j4ODyIxPXyvMyYcPc0gNAl7X5tIw9beZ
 /RnQ==
X-Gm-Message-State: AOJu0YwICLrX3Al9P5FWuK5gSQZ7jIzXGYkptfpxcCSgsPFZe1XL+eKu
 imBLpK//90TT+3iKet3iA2XHB7f+ygg=
X-Google-Smtp-Source: AGHT+IGiQEHIoW0DFxgB5UZNj+iMBCCRTAOcT5EYkOImGyk9x/fqlEG4w+mKsYurGUs4VliE7T+Jaw==
X-Received: by 2002:a05:600c:354d:b0:3f5:fff8:d4f3 with SMTP id
 i13-20020a05600c354d00b003f5fff8d4f3mr16930495wmq.7.1698931623073; 
 Thu, 02 Nov 2023 06:27:03 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0a4300b003fe1fe56202sm2952807wmq.33.2023.11.02.06.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:27:02 -0700 (PDT)
Message-ID: <5b8d2e5e-4e16-4d42-9cde-115f5ed0b550@gmail.com>
Date: Thu, 2 Nov 2023 14:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: don't put MQDs in VRAM on ARM | ARM64
Content-Language: en-US
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20231031175453.1383422-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231031175453.1383422-1-alexander.deucher@amd.com>
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
Cc: alexey.klimov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.10.23 um 18:54 schrieb Alex Deucher:
> Issues were reported with commit 1cfb4d612127
> ("drm/amdgpu: put MQDs in VRAM") on an ADLINK Ampere
> Altra Developer Platform (AVA developer platform).
>
> Various ARM systems seem to have problems related
> to PCIe and MMIO access.  In this case, I'm not sure
> if this is specific to the ADLINK platform or ARM
> in general.  Seems to be some coherency issue with
> VRAM.  For now, just don't put MQDs in VRAM on ARM.
>
> Link: https://lists.freedesktop.org/archives/amd-gfx/2023-October/100453.html
> Fixes: 1cfb4d612127 ("drm/amdgpu: put MQDs in VRAM")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: alexey.klimov@linaro.org

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index c92e0aba69e1..a2a29dcb2422 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -385,9 +385,11 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
>   	struct amdgpu_ring *ring = &kiq->ring;
>   	u32 domain = AMDGPU_GEM_DOMAIN_GTT;
>   
> +#if !defined(CONFIG_ARM) && !defined(CONFIG_ARM64)
>   	/* Only enable on gfx10 and 11 for now to avoid changing behavior on older chips */
>   	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(10, 0, 0))
>   		domain |= AMDGPU_GEM_DOMAIN_VRAM;
> +#endif
>   
>   	/* create MQD for KIQ */
>   	if (!adev->enable_mes_kiq && !ring->mqd_obj) {

