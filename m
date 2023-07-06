Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606D7495E8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 08:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0848D10E42A;
	Thu,  6 Jul 2023 06:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8D410E42A;
 Thu,  6 Jul 2023 06:48:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-313e742a787so221026f8f.1; 
 Wed, 05 Jul 2023 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688626087; x=1691218087;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iwTp8eJ6Q10EoOBSyGBUxkvLO8nXLMvu/9sN/vgabVY=;
 b=MyIVTLeRfthCc2qYQp67XuAs2Ey9vWYG6Q/OgxenZBFbuDrMIDUe4AX3Ad2E791ylL
 40jScyvAf00cfkzMEtVJKLVDemiACN4fu5zRYcm2/LgnLmXGGyNWEcYm0g4nTXm5gUCj
 84l2hQRK7EPhJnqdwJqJQD7VXLjHut5n3VG6OvoUCJM80VjEvboQDODZkV2yBIUGGBlZ
 QblNnTEtpiICYwgP+9Ve/BY/LFjm5bk8gYNC12MQ2vc0MrgYQSETDqQfQ5F0x4fQ53DY
 JyJ0T7SkoY8TumnEq26tB+1x8LQB8w5J4GKIL9fH5Vzrn3F2AA5+YRTYHivdXyc0mbtG
 SXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688626087; x=1691218087;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iwTp8eJ6Q10EoOBSyGBUxkvLO8nXLMvu/9sN/vgabVY=;
 b=L0S3oACz6jbi1O6PX+rHkhIGKLZljAKFYceDJOQDbc6FRZhxzdbqWsYqJijOHu8CmL
 dwmnMjVtUINhjjLbaTEr3T2637Sy86nNiceuNkDUJf+ALvTpHv2Iw15553xOdQsA7kFb
 ibeDGqR/0F/SPfIKe9lCeuzcQuqAOc3ua4UZzZbgJSKH3+z4d0SSfRfE172Sfu20uBco
 Z6gEthvPnJMxImNKkG4fIYApbsCrSlffWlzi/2ZQieIPhvMYwpmf3O0dzmYpehbtE/nR
 sVq40c98Yj/Guyc3Ir9lVPN/M2usKkJaoJS3ZuFErRL7KGKLJbXZoK71RT/AyXSbfZ3Q
 yvhQ==
X-Gm-Message-State: ABy/qLawoU48rplxHqSWsXoUZmWHeRRxoMVLRzdIHse2tNbYY6hhRAHJ
 5WJ011NzpK7Xdc5K0KLC/MY=
X-Google-Smtp-Source: APBJJlGJrmTJGtSiwJiROjMI4nelEVFkh5NRgXHb0SdmRxHvl67t7NA7mWj2Pk+05nwehu3MQ/mY5g==
X-Received: by 2002:a5d:6947:0:b0:314:2736:ba3e with SMTP id
 r7-20020a5d6947000000b003142736ba3emr4033127wrw.3.1688626086744; 
 Wed, 05 Jul 2023 23:48:06 -0700 (PDT)
Received: from ?IPV6:2a00:e180:14cc:2700:ac8a:158b:7961:93a7?
 ([2a00:e180:14cc:2700:ac8a:158b:7961:93a7])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a5d6acf000000b003143b7449ffsm997292wrw.25.2023.07.05.23.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 23:48:06 -0700 (PDT)
Message-ID: <099bbbcb-c745-c3f0-38cb-4de00199b386@gmail.com>
Date: Thu, 6 Jul 2023 08:48:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/ttm: Use init_on_free to early release TTM BOs
Content-Language: en-US
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230705195701.30141-1-rajneesh.bhardwaj@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230705195701.30141-1-rajneesh.bhardwaj@amd.com>
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
Cc: felix.kuehling@amd.com, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.07.23 um 21:57 schrieb Rajneesh Bhardwaj:
> Early release TTM BOs when the kernel default setting is init_on_free to
> wipe out and reinitialize system memory chunks.

"Delay release the TTM BO when the kernels init_on_free setting is used."

>   This could potentially
> optimize performance when an application does a lot of malloc/free style
> allocations with unified system memory.

"This offloads the overhead of clearing the system memory to the work 
item and potentially a different CPU. And is very beneficial when the 
application does a lot of malloc/free style allocations of system memory."

With those changes to the commit message the patch is Reviewed-by: 
Christian König <christian.koenig@amd.com>.

I'm going to push that to drm-misc-next when you send it out once more.

Thanks,
Christian.

>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 326a3d13a829..bd2e7e4f497a 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -347,6 +347,7 @@ static void ttm_bo_release(struct kref *kref)
>   
>   		if (!dma_resv_test_signaled(bo->base.resv,
>   					    DMA_RESV_USAGE_BOOKKEEP) ||
> +		    (want_init_on_free() && (bo->ttm != NULL)) ||
>   		    !dma_resv_trylock(bo->base.resv)) {
>   			/* The BO is not idle, resurrect it for delayed destroy */
>   			ttm_bo_flush_all_fences(bo);

