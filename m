Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698E53CD708
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 16:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A833E6E120;
	Mon, 19 Jul 2021 14:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF96E0EF;
 Mon, 19 Jul 2021 14:45:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a13so22336819wrf.10;
 Mon, 19 Jul 2021 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ykw/8dUHmnvkhINGvE8DPlnGL5xj3qE/zc/xyCib+XM=;
 b=SCi09qBfRsa6nQj+k++1X6MUBUMhFCCmGupgMlA1pY0h500TA//+5zd+4FQTiwtTXs
 yegWW0fbNaq3YrunNd5aWz0mYz2wlru6TK1+Xw1l+AsvXrkPt4xkNPFajNDjiUlEdVH6
 WfX0i4sVcP7BxDlNDf1n4PdljrV9XQsWhmTsWqotyR+pVnfq8poduGgIwOw2F/T5+Xwt
 B4J3aaqm/sIrkFLVksQ/ORJJMq/VdUNbVwAfN6AHJDDv7nyYiL2WbT013CM3T9/QWOqj
 9vPL2u5rPdxnev/vWHdd3I53p1HW8G7BETkiC/mBxUI561XqRXnFtwxTWbw5DasagA6s
 dKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ykw/8dUHmnvkhINGvE8DPlnGL5xj3qE/zc/xyCib+XM=;
 b=TaqOY9GJItqpy3snsALT0n3L3KJRS4WJYRfSO+FN4XOeixvqqtmyhX1k3M0XPC7T9+
 rhzd7zXMbArPW6MhvuVY6sGfSxX6T8EiZ3QaY4OFuooyXbljXRxIdvIDcuQyGQnyZbQk
 xDDYQx9NLNknKjoQbl/q6xdyLJsC/5uKNuSx1f4Uh13PhY4Hs+nxIUW1AV30w1r3IQaQ
 NC6pDQF3XDobjz+6Bly3cuLC5qmaxp0lbAVmAcyHY8Yl7u+Cp04kMreGkAuUBr3hiXnq
 hE6SK2eEB5G1Vx1+yCFnbNa909vxO+ogeuJ8RyAsjA585i4+0/QCpV0KfMKwV3QUSYHf
 ErSw==
X-Gm-Message-State: AOAM532UXEVV2DucyVTK3O7Nk8RziceEhkAyEZFeNYYca508xYM9Hekd
 iV8xWalPOR8PniMgTvbsoQ8=
X-Google-Smtp-Source: ABdhPJw4VG+Asie5OmOLbz/r9ip58LFhR1Ew5dwhf0A4LT62rXD/aYyyFlGCmR2Y8mPS3dfxIwk2mw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr12127271wri.133.1626705919576; 
 Mon, 19 Jul 2021 07:45:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d448:2444:fe38:1227?
 ([2a02:908:1252:fb60:d448:2444:fe38:1227])
 by smtp.gmail.com with ESMTPSA id o14sm19795559wmq.31.2021.07.19.07.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 07:45:19 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To: Rob Clark <robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
 <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6dc4ad02-2f75-7907-59d8-66fd30c490ca@gmail.com>
Date: Mon, 19 Jul 2021 16:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Bernard Zhao <bernard@vivo.com>,
 Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
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

Am 19.07.21 um 16:21 schrieb Rob Clark:
> On Mon, Jul 19, 2021 at 1:40 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 17.07.21 um 22:29 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Conversion to gpu_scheduler, and bonus removal of
>>> drm_gem_object_put_locked()
>> Oh yes please!
>>
>> If I'm not completely mistaken that was the last puzzle piece missing to
>> unify TTMs and GEMs refcount of objects.
>>
>> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
>> rest?
> Hmm, looks like it should have all gotten to dri-devel:
>
>    https://lists.freedesktop.org/archives/dri-devel/2021-July/315573.html

Well I've got two mail accounts (AMD, GMail) and neither of them sees 
the full set. So most likely not a problem on my side.

Anyway the whole set is Acked-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

>
> or if you prefer patchwork:
>
>    https://patchwork.freedesktop.org/series/92680/
>
> BR,
> -R
>
>> Thanks,
>> Christian.
>>
>>> Rob Clark (11):
>>>     drm/msm: Docs and misc cleanup
>>>     drm/msm: Small submitqueue creation cleanup
>>>     drm/msm: drop drm_gem_object_put_locked()
>>>     drm: Drop drm_gem_object_put_locked()
>>>     drm/msm/submit: Simplify out-fence-fd handling
>>>     drm/msm: Consolidate submit bo state
>>>     drm/msm: Track "seqno" fences by idr
>>>     drm/msm: Return ERR_PTR() from submit_create()
>>>     drm/msm: Conversion to drm scheduler
>>>     drm/msm: Drop struct_mutex in submit path
>>>     drm/msm: Utilize gpu scheduler priorities
>>>
>>>    drivers/gpu/drm/drm_gem.c                   |  22 --
>>>    drivers/gpu/drm/msm/Kconfig                 |   1 +
>>>    drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
>>>    drivers/gpu/drm/msm/msm_drv.c               |  30 +-
>>>    drivers/gpu/drm/msm/msm_fence.c             |  39 ---
>>>    drivers/gpu/drm/msm/msm_fence.h             |   2 -
>>>    drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
>>>    drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
>>>    drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++--------
>>>    drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
>>>    drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
>>>    drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
>>>    include/drm/drm_gem.h                       |   2 -
>>>    include/uapi/drm/msm_drm.h                  |  10 +-
>>>    23 files changed, 440 insertions(+), 359 deletions(-)
>>>

