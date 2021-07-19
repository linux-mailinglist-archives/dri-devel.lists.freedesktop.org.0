Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60193CD669
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 16:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDE06E15A;
	Mon, 19 Jul 2021 14:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB566E15A;
 Mon, 19 Jul 2021 14:17:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso12962177wmh.4; 
 Mon, 19 Jul 2021 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
 b=OBWA7ulibxt21SOpQyH/zVYF2pcgZthfkZb9IplbXvKgG0VcXJh8EeSyOlzKNTeJGQ
 B5JmneMtLahn0ECNMrmmGF72WH4uf9uQ5XEtytSURVxOgaT7KUm96gRWL8h4fs3V2zpL
 qTzb2BEnzqQbgfReCpE6F1T3kOLPAdfc619qlzBY6JOmUhCO2yivQOTD982zNvZVxFOU
 dolpjs/JEAuAJpflASUHTYRn58qSTCeCMTDnkCccqx14a9knnUZoh6+LsrSq0GqY0X9o
 Eo8KLruVrE0J7S+dXxr1lrFTdpaHIXTQXWJxmguCZ9Off5ZlPx/zBC11zRi/eZG36F4e
 fUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YxOE06iQfRI1CKUDbw3hGIS+VF1Rl+wYqbGsSCljupo=;
 b=peegCYZwuxsdNeOFsGWHYukny1qvXBHoPHR4ILTacI/ARVOs6SxBQ5Vwtc7XM0pjX0
 063jP/8k/JzFHXv9OFLPMx2sy4dHuE7MEfYU6CvHG9iaxmmb8TW9PmBcMPAj+F/sXvIj
 WgQy/JIpsebf9exYkHLqEt3LyL1Xy366MDgSW1JFq9CFbZu7q7P5jyN2VQnhMokvOghi
 q/3dQDlHQf0s2rj/mqa1SpeEUgaYsbPZz4Rqj/ren662iMXjFPRt17ULTX357FJl2jZs
 zYwSxgHdKJQ4uOqci2eO3poG/nb7yr0QfXGCdkRwBHnhnDcmo6SOGc4zlCysqUWny95N
 IsQQ==
X-Gm-Message-State: AOAM530Vijy7tBxtuFpZYqd2wYfX2wqWLULX9l4GrQSfq+4/Fw8Q++Ga
 A4SgLMSzDz3E8TXgs+97JXM7QEOJGiTskxz23Lc=
X-Google-Smtp-Source: ABdhPJxrSDp2zTG19VBXBLjwH7pcVPq3rHmT2XxCL0Xq8iJo5bPZiCVWZLD5AWEcNySNNzptwxQwRJ96/qe0jx7mjhA=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr32878432wmc.123.1626704234434; 
 Mon, 19 Jul 2021 07:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210717202924.987514-1-robdclark@gmail.com>
 <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
In-Reply-To: <582b8869-f370-3803-60a8-df31088f8088@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Jul 2021 07:21:22 -0700
Message-ID: <CAF6AEGuaxh5FRb6h3aVkUYG7cFCpT6Lb+uuk2R8bmu3hxHs4Aw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 00/11] drm/msm: drm scheduler conversion
 and cleanups
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 19, 2021 at 1:40 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 17.07.21 um 22:29 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Conversion to gpu_scheduler, and bonus removal of
> > drm_gem_object_put_locked()
>
> Oh yes please!
>
> If I'm not completely mistaken that was the last puzzle piece missing to
> unify TTMs and GEMs refcount of objects.
>
> Only problem is that I only see patch 7 and 9 in my inbox. Where is the
> rest?

Hmm, looks like it should have all gotten to dri-devel:

  https://lists.freedesktop.org/archives/dri-devel/2021-July/315573.html

or if you prefer patchwork:

  https://patchwork.freedesktop.org/series/92680/

BR,
-R

> Thanks,
> Christian.
>
> >
> > Rob Clark (11):
> >    drm/msm: Docs and misc cleanup
> >    drm/msm: Small submitqueue creation cleanup
> >    drm/msm: drop drm_gem_object_put_locked()
> >    drm: Drop drm_gem_object_put_locked()
> >    drm/msm/submit: Simplify out-fence-fd handling
> >    drm/msm: Consolidate submit bo state
> >    drm/msm: Track "seqno" fences by idr
> >    drm/msm: Return ERR_PTR() from submit_create()
> >    drm/msm: Conversion to drm scheduler
> >    drm/msm: Drop struct_mutex in submit path
> >    drm/msm: Utilize gpu scheduler priorities
> >
> >   drivers/gpu/drm/drm_gem.c                   |  22 --
> >   drivers/gpu/drm/msm/Kconfig                 |   1 +
> >   drivers/gpu/drm/msm/adreno/a5xx_debugfs.c   |   4 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   6 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_power.c     |   2 +-
> >   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |   7 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  12 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |   2 +-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |   4 +-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   6 +-
> >   drivers/gpu/drm/msm/msm_drv.c               |  30 +-
> >   drivers/gpu/drm/msm/msm_fence.c             |  39 ---
> >   drivers/gpu/drm/msm/msm_fence.h             |   2 -
> >   drivers/gpu/drm/msm/msm_gem.c               |  91 +-----
> >   drivers/gpu/drm/msm/msm_gem.h               |  37 ++-
> >   drivers/gpu/drm/msm/msm_gem_submit.c        | 300 ++++++++++++-------=
-
> >   drivers/gpu/drm/msm/msm_gpu.c               |  50 +---
> >   drivers/gpu/drm/msm/msm_gpu.h               |  41 ++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.c        |  70 ++++-
> >   drivers/gpu/drm/msm/msm_ringbuffer.h        |  12 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c       |  49 +++-
> >   include/drm/drm_gem.h                       |   2 -
> >   include/uapi/drm/msm_drm.h                  |  10 +-
> >   23 files changed, 440 insertions(+), 359 deletions(-)
> >
>
