Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33B73DDAD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 13:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9110E1E5;
	Mon, 26 Jun 2023 11:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BFA10E1E5;
 Mon, 26 Jun 2023 11:33:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-313f3cd6bb4so531909f8f.3; 
 Mon, 26 Jun 2023 04:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687779227; x=1690371227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uWJ2m6hM9/UPQKvpX2tpk6Qe1joTg2sFo9t5IZ8C27Y=;
 b=Ql+QylvB8BF3n6GaTFakt0E4R1symVCHCxKDdOET0ikCKPKIj1sM99/pElSs9o4Xac
 7fmS52uahIUk3AhQqELcArmqkluj4ZdAkE4PSfTbkrdRBehN3NVNog3rRzjkwlSIxuty
 XZSmuMaQq7YWHm5C9w2KjDDkgaG2fFgQsjsRtSxqgqs11IkOu5oaUEQFxAwtO6/gLNL3
 7QdUXieZM76VQOVRDLSDhDVazpPogTKowWfw+++vKkL8vUkHIXja4x3PWNkVwvD+R/Xh
 g3cdNLtmJ/jlZmHpg2asTkQ/cHe+nzlvNAMtYsyhX6V146lfsXrT1rYfeI3YlJcVGzxf
 VzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687779227; x=1690371227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWJ2m6hM9/UPQKvpX2tpk6Qe1joTg2sFo9t5IZ8C27Y=;
 b=DOJBEef/gwgutzG+iHfcVMlR2YeBz70178cIvnT5IkVpQ9+g44RiML1PwsrgRxR9LT
 L8M1pT+DyDXkySgtTBlSulISzw/c3c4zZ5Cbn9rodx8S1MVQKfOrx91RJZnRJKjjii/8
 Xbwl+B10YoZU2rViz444faFBmkc+A/BFNgQFbIsd4zCRufYYtilNCEaYqT8dlsFFioK0
 ProSkDmm6iAp2IDHyczM7jsxahAG8rsqk/RAURiI/ftdgRQyLYR+zlt2GT2JW48wQX4/
 aHLz29I0caxxB+SqDyKgfwwJc3PKceVc48x4eE6p4/gar/JOIE3Hv/S3s3ts9vLXtt3Z
 ogyg==
X-Gm-Message-State: AC+VfDzN36POKb703gQCY281dQkcsZeAxcslaSAsNkhznX7A7KgFPepA
 qQc16Wu4pAKBORFDrNZKa9NlzG71+uI=
X-Google-Smtp-Source: ACHHUZ6ZixlK0wtfB4OMzQSPYlAyxGBq5ZXjbhz31HoIbkWwoYL7eASSfRQ1bj4aUvmvOn9f6/NLog==
X-Received: by 2002:a5d:4242:0:b0:311:de0:8975 with SMTP id
 s2-20020a5d4242000000b003110de08975mr19166661wrr.55.1687779226846; 
 Mon, 26 Jun 2023 04:33:46 -0700 (PDT)
Received: from ?IPV6:2a00:e180:158d:7600:d62f:c4fb:6eee:7b87?
 ([2a00:e180:158d:7600:d62f:c4fb:6eee:7b87])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d6ad2000000b00313e90d1d0dsm5186467wrw.112.2023.06.26.04.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 04:33:46 -0700 (PDT)
Message-ID: <f63137cd-2032-1598-a1d7-484248ef1d02@gmail.com>
Date: Mon, 26 Jun 2023 13:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/4] drm/ttm: Don't leak a resource on swapout move
 error
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
 <20230626091450.14757-5-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230626091450.14757-5-thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.06.23 um 11:14 schrieb Thomas Hellström:
> If moving the bo to system for swapout failed, we were leaking
> a resource. Fix.
>
> Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.14+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c0e3bbd21d3d..d9a8f227f310 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1166,6 +1166,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>   		if (unlikely(ret != 0)) {
>   			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
> +			ttm_resource_free(bo, &evict_mem);
>   			goto out;
>   		}
>   	}

