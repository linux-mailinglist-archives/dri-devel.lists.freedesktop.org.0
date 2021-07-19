Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7B53CCF69
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A6989F3C;
	Mon, 19 Jul 2021 08:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA10089F3C;
 Mon, 19 Jul 2021 08:41:00 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g16so20994559wrw.5;
 Mon, 19 Jul 2021 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BSOq/6LU7myFeRU9sVPe/x6k8J7ibQSkaSa7AKjKFSw=;
 b=DjXoqORFiqtt4rE5ZyXDIb7/ln22JGSkGZaFHNCsrKxgS+jBCtKuODQNkTLOIEACqc
 KLj44NNYb1P7JhBYYk333PjdMs6+/6wjl3wDOUhYRRNvkDKcU1b4BMBDUXkrALp/yR3c
 eik4IoWYEHSBl3n48IG93J5JTgnKZkDE/rAVPc0uXwJsgyiJFeDlv9RAFS/lPFbBHUEx
 xX7EuCM3Id9LBQ/tNf0BohPT15mRhDjLCYQWjOeU2HwZbnLVVOtb1uF+nZJjmK1m7bz0
 kcQFHH6Tbo5xmxnZc+zVzIbZkEnV6N4K5ulew+NE+OpIoEbwR0fAmtMqASjkSZGJMF23
 uVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BSOq/6LU7myFeRU9sVPe/x6k8J7ibQSkaSa7AKjKFSw=;
 b=DhACMQI2+ngl2F7ORVAeeDW19383IChKyDYPZNgk6q0rc5exrPnc8/km6tW9nqpug2
 Y84tlT6rz5Dtmr8RglDXdsp0PZglHD8p7FVyfaArW0uhvsWZIoAD7qz5q98hum28WOnf
 2iyFNDSFxhoTcilItYr4aS5eHTs3ih8ugVjsBDMVmoSM3qJfnVtuXXQlEsCIz8oHfcyI
 Flb1FvZd2M2JiQsSF4qPVIiISwPGvgYwgKTwLUZnzvPm0Jf/IzGXWVg0AzajbTFiiacm
 odebMZnaCG0lu7Sc3F6+nrp6MyCZeDH7i7URMURNdLnuSnv4YhP6xzy+5qV1KmtGNfI3
 MQ1w==
X-Gm-Message-State: AOAM532xkL8JGLs3AdGhfW8b3OKQfPlHBL40P9+89zssF0MDL8YzntKh
 KCRcgHVD+lqdzeffsNuXSfY=
X-Google-Smtp-Source: ABdhPJx78JN8b/ZveBWU79Ei+AvwV8ONa7QAzZR4sp6UFDoSwGfCbcKq6sN7s1mjTYYeyCHxC/dWoQ==
X-Received: by 2002:adf:c102:: with SMTP id r2mr27884871wre.22.1626684059448; 
 Mon, 19 Jul 2021 01:40:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e48d:68a9:5ef4:9e09?
 ([2a02:908:1252:fb60:e48d:68a9:5ef4:9e09])
 by smtp.gmail.com with ESMTPSA id e6sm22661717wrg.18.2021.07.19.01.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 01:40:59 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210717202924.987514-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
Date: Mon, 19 Jul 2021 10:40:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Bernard Zhao <bernard@vivo.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.07.21 um 22:29 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Conversion to gpu_scheduler, and bonus removal of
> drm_gem_object_put_locked()

Oh yes please!

If I'm not completely mistaken that was the last puzzle piece missing to 
unify TTMs and GEMs refcount of objects.

Only problem is that I only see patch 7 and 9 in my inbox. Where is the 
rest?

Thanks,
Christian.

>
> Rob Clark (11):
>    drm/msm: Docs and misc cleanup
>    drm/msm: Small submitqueue creation cleanup
>    drm/msm: drop drm_gem_object_put_locked()
>    drm: Drop drm_gem_object_put_locked()
>    drm/msm/submit: Simplify out-fence-fd handling
>    drm/msm: Consolidate submit bo state
>    drm/msm: Track "seqno" fences by idr
>    drm/msm: Return ERR_PTR() from submit_create()
>    drm/msm: Conversion to drm scheduler
>    drm/msm: Drop struct_mutex in submit path
>    drm/msm: Utilize gpu scheduler priorities
>
>   drivers/gpu/drm/drm_gem.c                   |  22 --
>   drivers/gpu/drm/msm/Kconfig                 |   1 +
>   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>   drivers/gpu/drm/msm/msm_drv.c               |  30 +-
>   drivers/gpu/drm/msm/msm_fence.c             |  39 ---
>   drivers/gpu/drm/msm/msm_fence.h             |   2 -
>   drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
>   drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
>   drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
>   drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
>   drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
>   drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
>   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>   drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
>   include/drm/drm_gem.h                       |   2 -
>   include/uapi/drm/msm_drm.h                  |  10 +-
>   23 files changed, 440 insertions(+), 359 deletions(-)
>

