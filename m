Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E37D70BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532B10E6AC;
	Wed, 25 Oct 2023 15:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A3610E6A0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:28:12 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-66d134a019cso39963356d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 08:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698247691; x=1698852491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8/OEf6wY4K8LL5fCd9Dam3mad0hP6D3Fcdj2bC0ObXE=;
 b=zGy8YuXpfa2U5ws2HINEEb4jwlAQ1/B/c9swo3JDRPME2PkRTW2mbLQaXKV+fuzNkU
 rzPkGLR1bhiLS9KRxzTEXVArbQAwl7cZSZJ33cE6F6NeVsGF7ulBURsBUf4N7qTe+xRy
 y8UgtgfBEyc9qafcz15HGpDME/dQdv2Oc6yEMf/JkwuhaiPYLsHHZMAK7iFpiGHnhmtd
 1guo4JY+642N/EZKLtZQ8F4lh6WzHPiaIoDNnk/IjwWeLnvFj83gvU+x0FKgVDgn3aso
 wDdq5pbVIv+NYDYC3cvFCCaFUGnzmeD2WV4QcrDU5qhC0xjKK9wbw7RuU46e2zGFu7l7
 Ut0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698247691; x=1698852491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/OEf6wY4K8LL5fCd9Dam3mad0hP6D3Fcdj2bC0ObXE=;
 b=erK59olemUh5p9c6+hAVdwIhNQKLxU6mkHmbGmBRbeAGw3KfX4puMsSdTjB1UxBTak
 v7nmgFou3IsrXSWdLBllQ8AjsGs3njahRwCSVlPUOPrwxH5e1oSrDtY1bz5XTYZuuPrs
 mymYG88glcIh3eEA/7l1hlovVCQHKNGe5jBI8tDhQPLv6At99bboQd47DP9r6eKLZXpI
 gdASoZ4uK1j0RPHjZ0a1vYG6fmge5fc8jeOHYsAdbVtZbxG37a7lgaHKN0R1zodZGttK
 09yfPhE58V5ZIj9w4cdizkAwptDnGVydFz3Xz8HdXOSryfcH7sfZKoLLX57HiojLqJ1x
 fm0w==
X-Gm-Message-State: AOJu0YyhcigD8iQKRDZe1aQzQtqIQp+Q7wL1ntbi/Cb95p+C+UnY/Y/i
 voVLdJ0bHkwqo1aHooDdvJjweA==
X-Google-Smtp-Source: AGHT+IE+oXbdMGDC42eUqY/5d0Rh7NZd8nWQ0r8DPCttIVT1/TMaphayNooiWx9ODfgyZFTKsCHSrg==
X-Received: by 2002:a05:6214:2586:b0:66d:1d22:42d8 with SMTP id
 fq6-20020a056214258600b0066d1d2242d8mr20338672qvb.11.1698247691667; 
 Wed, 25 Oct 2023 08:28:11 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a37e218000000b007671b599cf5sm4280080qki.40.2023.10.25.08.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 08:28:10 -0700 (PDT)
Message-ID: <6f145485-c330-4a89-9e5a-af35d0b72e21@linaro.org>
Date: Wed, 25 Oct 2023 18:28:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Content-Language: en-GB
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Emil Renner Berthing <kernel@esmil.dk>, christian.koenig@amd.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Jack Zhu <jack.zhu@starfivetech.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Shawn Guo <shawnguo@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/10/2023 13:39, Keith Zhao wrote:
> For each modifier, add the corresponding description
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>   include/uapi/drm/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8db7fd3f7..a580a848c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -419,6 +419,7 @@ extern "C" {
>   #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>   #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>   #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
> +#define DRM_FORMAT_MOD_VENDOR_VERISILICON 0x0b
>   
>   /* add more to the end as needed */
>   
> @@ -1562,6 +1563,62 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   #define AMD_FMT_MOD_CLEAR(field) \
>   	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>   
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL					0x00
> +#define DRM_FORMAT_MOD_VERISILICON_TYPE_MASK					((__u64)0x3 << 54)
> +
> +#define fourcc_mod_vs_code(type, val) \
> +	fourcc_mod_code(VERISILICON, ((((__u64)type) << 54) | (val)))

Please use fourcc_mode_code directly.

> +
> +#define DRM_FORMAT_MOD_VERISILICON_NORM_MODE_MASK				0x1F
> +
> +/*
> + * An x-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X8		0x02
> +
> +/*
> + * A y-major 8x8 super tile consists of 64 8x8 sub-tiles in total.
> + * Each 8x8 sub-tile consists of four standard tiles .
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_8X8		0x03
> +
> +/*
> + * An 8x8 tile consists of four standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X8						0x04
> +
> +/*
> + * An 8x4 tile consists of two standard tiles
> + * that are organized in Z-order.
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_TILE_8X4						0x07
> +
> +/*
> + * An x-major 8x4 super tile consists of 128 8x4 sub-tiles in total.
> + * Each 8x4 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_XMAJOR_8X4		0x0B
> +
> +/*
> + * A y-major 4x8 super tile consists of 128 4x8 sub-tiles in total.
> + * Each 4x8 sub-tile consists of two standard tiles.
> + * two standard tiles also same with DRM_FORMAT_MOD_VS_TILE_8X4
> + * standard tiles (see Vivante 4x4 tiling layout)
> + */
> +#define DRM_FORMAT_MOD_VERISILICON_SUPER_TILED_YMAJOR_4X8    0x0C
> +
> +#define fourcc_mod_vs_norm_code(tile) \
> +	fourcc_mod_vs_code(DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL, \
> +				(tile))

1) this is not a part of uAPI
2) please use fourcc_mod_code directly.

> +
>   #if defined(__cplusplus)
>   }
>   #endif

-- 
With best wishes
Dmitry

