Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58B3CFBD9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED596E252;
	Tue, 20 Jul 2021 14:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6636E252;
 Tue, 20 Jul 2021 14:17:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l6so12404644wmq.0;
 Tue, 20 Jul 2021 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=TXQS3ybKJ0ZbkZfIX5IltjKkTwBCNLiU4PEiSSGE69s=;
 b=fS6P0HprhHVqt7njX4zsr1cfUaOD9uqzXFlq8GwYoG9u7dhPs7+KZoijw4mRGTc6ZJ
 9ip9OpMe44ev6qbFeTA4X2iwxoBsK1ahqaLTmW5XtR3f2w89LeUA2yNNM9hYGzVVsWsE
 n9wehcRw3zcweCcTIakCZzTvqOOW8O/gBndl78UtpWnQXlLJeSTwOCLcFP2h/iwIWAep
 WFef5gixFYVTOTKLmK5UizdJhaeAMScFw744qAruW2BE1dfQzBZBAAeDt3nCZRQUAUsV
 3p0j3Xd+Tm6B4bcnXNeBnFzuHxo/s2Xw55p9W7VfqKun5MgOef69bIDDp6mM2PoRhrif
 QCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TXQS3ybKJ0ZbkZfIX5IltjKkTwBCNLiU4PEiSSGE69s=;
 b=f0r/QGojqkVtiEzUYxxb5Oi6MZ8jNNW746/tus2VUlAjpe6yrXuMi0RpF7e99qyiYj
 Y5PxunVC23l5lxU7N7uahfvBUvQOBNHPYru3Rscp28mc8JNUWaBswAqFWg/OnGKZlYjO
 a6R3t2HPrMZ+AH70fYS+mPoUXeIch9I3qssnNi0Yl95Ce3sSJ74BOWw7cKG4VRivDA5J
 BICErTG/Rf+592RkYHgG3INC+RgdEcR3k36S2CBraAkBL9V26GJ76Iorb6uHmZ/drlqv
 ul18yhAlUi8eHPYKgfN7ihGIKIR4zRSIN/AjON6gHB5KoqHCybIyFRzq3pSXwV3oZQ8Q
 u0bQ==
X-Gm-Message-State: AOAM532KY/6XPEPl7XaY37VFPh+ohksy+Q8gSLqBfzutUaBHQFf5XjAm
 /AsFozejwn7sIkUBcZLkT7Q=
X-Google-Smtp-Source: ABdhPJzmqPa2i5KSmtCvUDun0KoyEZNVyJrq9l+T7IFFszZLyePe4YqWGv7DHNZLn3Ad+2Hwn2rkKQ==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr37604576wmj.101.1626790618933; 
 Tue, 20 Jul 2021 07:16:58 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0?
 ([2a02:908:1252:fb60:8651:5b5e:8648:2fd0])
 by smtp.gmail.com with ESMTPSA id e6sm27745155wrg.18.2021.07.20.07.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 07:16:58 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek
 <jonathan@marek.ca>, Emma Anholt <emma@anholt.net>,
 Bernard Zhao <bernard@vivo.com>, Sharat Masetty <smasetty@codeaurora.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
 <YPbYnLBin9N4weiC@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bbc4f7fc-9d51-695e-2bb7-62558d7523e2@gmail.com>
Date: Tue, 20 Jul 2021 16:16:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPbYnLBin9N4weiC@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.21 um 16:07 schrieb Daniel Vetter:
> On Mon, Jul 19, 2021 at 10:40:57AM +0200, Christian König wrote:
>> Am 17.07.21 um 22:29 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Conversion to gpu_scheduler, and bonus removal of
>>> drm_gem_object_put_locked()
>> Oh yes please!
>>
>> If I'm not completely mistaken that was the last puzzle piece missing to
>> unify TTMs and GEMs refcount of objects.
> Why does drm/msm, a driver not using ttm at all, block ttm refactorings?
> We can just check whether the TTM using driver is potentially using locked
> final unref and have a special version of
> drm_gem_object_put_guaranteed_unlocked or whatever the bikeshed will look
> like, which doesn't have the migth_lock.

Because we now don't have any unrealistic lock inversion between 
dev->struct_mutex and obj->resv lockdep can complain any more.

Cheers,
Christian.

>
> Anyway, deed is done now :-)
> -Daniel
>
>> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
>> rest?
>>
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

