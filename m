Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2445953C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0578E899D5;
	Mon, 22 Nov 2021 19:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FE899D5;
 Mon, 22 Nov 2021 19:01:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so53403wme.0; 
 Mon, 22 Nov 2021 11:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IoRtXXthSklcVXI9fBm7YAHdxOz0TPFB0nL0PYHU/oQ=;
 b=Pp9jI8FqDXe6OWbwQnVRlvOkmcG3XeTAGPZ5JNhBedALyHUYNamAHHfPF7nRtPuChi
 jJRrQL6SAERIbyPTFTbExR7De+uYr1gz270RLnnkmluLvxpwTy0QOWfuzY+uqYZK5QLi
 3VnXiKsoDja3r4NPVdjz3ZrfHkdz4zdEbuzJjMfjL6bT0f45x6WNBvDpqKpcMIM7Sxrn
 ENbb3ahJ/FvuVCfr9KtM9vTABRlmcfd8Oa99i9iR7PerksKf4JYag5Hsui2A+d2xvvgO
 ttrFuRG+TMDVuEAQvBEU8wYki0uIkGjVuUI7syAJCSdhzfnJ20qaE7Nl2K/QcwO3b16X
 RnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IoRtXXthSklcVXI9fBm7YAHdxOz0TPFB0nL0PYHU/oQ=;
 b=dFTWDYvs8y8G4nBf282YQam/N2aTvCw6dBW6rcPxFkFJHcLCsoagqd5TxQ9YePvMk/
 Sux5xAJRkFeoFLt639aKEtXidBPNvXIpBNbevlv0n7qNE+F7Uo5bv7Cuc5npr90LM2OL
 ArP8wD8FnypmcefZoKN635pnYny3V6fxPaG581Et3vrz1gVejaQ2ysixi1aNcpnk62tZ
 OFUPrY2uBRjoDesqYIaDoCPPhkO7B84IYzGxfxvh908a0UZFS57bmks2o22aVStts1br
 KTMCv97TRbiXv8Kyz+mJKQUaWNHlzT1vm3LPF3zBDJKcgsPqX1DWuhbSqKVMjBNUt0mN
 moyQ==
X-Gm-Message-State: AOAM530owQVW4P/XxlZMTj2Vm9oHQknWtB0BALwMASfoPPJ0Yzu6Mkts
 /kHOAfheDAQm9mjUaX3z1syoE6n2E7vu/lwkcU8=
X-Google-Smtp-Source: ABdhPJxw1JV/Xb6skR3aM3gdL1NyPyv857jhIHmzpulWw+0mSFHFQbwjqWkkvzrDPTdQJvG05JV6d+PQcun5ei+A5G8=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr33633059wme.101.1637607670865; 
 Mon, 22 Nov 2021 11:01:10 -0800 (PST)
MIME-Version: 1.0
References: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211118154903.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
 <CAF6AEGvxgVHXuz=W0_r=4EakV8XKVjdMeofZbuBYuz0Vep2BfA@mail.gmail.com>
In-Reply-To: <CAF6AEGvxgVHXuz=W0_r=4EakV8XKVjdMeofZbuBYuz0Vep2BfA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 22 Nov 2021 11:06:15 -0800
Message-ID: <CAF6AEGvn2fGOUoKAQg57pYNcHJZTKUzgS6O9BTgat17VD52M6w@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Capture gmu log in devcoredump
To: Akhil P Oommen <akhilpo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 10:26 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Nov 18, 2021 at 2:21 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >
> > Capture gmu log in coredump to enhance debugging.
> >
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > ---
> >
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
> >  3 files changed, 44 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > index 7501849..9fa3fa6 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -42,6 +42,8 @@ struct a6xx_gpu_state {
> >         struct a6xx_gpu_state_obj *cx_debugbus;
> >         int nr_cx_debugbus;
> >
> > +       struct msm_gpu_state_bo *gmu_log;
> > +
> >         struct list_head objs;
> >  };
> >
> > @@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
> >                 &a6xx_state->gmu_registers[2], false);
> >  }
> >
> > +static void a6xx_get_gmu_log(struct msm_gpu *gpu,
> > +               struct a6xx_gpu_state *a6xx_state)
> > +{
> > +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> > +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> > +       struct msm_gpu_state_bo *gmu_log;
> > +
> > +       gmu_log = state_kcalloc(a6xx_state,
> > +               1, sizeof(*a6xx_state->gmu_log));
> > +       if (!gmu_log)
> > +               return;
> > +
> > +       gmu_log->iova = gmu->log.iova;
> > +       gmu_log->size = gmu->log.size;
> > +       gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
> > +       if (!gmu_log->data)
> > +               return;
> > +
> > +       memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
> > +
> > +       a6xx_state->gmu_log = gmu_log;
> > +}
> > +
> >  #define A6XX_GBIF_REGLIST_SIZE   1
> >  static void a6xx_get_registers(struct msm_gpu *gpu,
> >                 struct a6xx_gpu_state *a6xx_state,
> > @@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
> >
> >         a6xx_get_gmu_registers(gpu, a6xx_state);
> >
> > +       a6xx_get_gmu_log(gpu, a6xx_state);
> > +
> >         /* If GX isn't on the rest of the data isn't going to be accessible */
> >         if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> >                 return &a6xx_state->base;
> > @@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
> >         struct a6xx_gpu_state *a6xx_state = container_of(state,
> >                         struct a6xx_gpu_state, base);
> >
> > +       if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
> > +               kvfree(a6xx_state->gmu_log->data);
> > +
> >         list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
> >                 kfree(obj);
> >
> > @@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> >
> >         adreno_show(gpu, state, p);
> >
> > +       drm_puts(p, "gmu-log:\n");
> > +       if (a6xx_state->gmu_log) {
> > +               struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> > +
> > +               drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
> > +               drm_printf(p, "    size: %d\n", gmu_log->size);
>
> fwiw, that wants to be:
>
>  +               drm_printf(p, "    size: %zu\n", gmu_log->size);
>
> with that fixed, r-b

Hmm, actually, I seem to be getting an empty log.. is special gmu fw,
or non-fused device needed for this to work?

BR,
-R

> BR,
> -R
>
> > +               adreno_show_object(p, &gmu_log->data, gmu_log->size,
> > +                               &gmu_log->encoded);
> > +       }
> > +
> >         drm_puts(p, "registers:\n");
> >         for (i = 0; i < a6xx_state->nr_registers; i++) {
> >                 struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 7486652..7d1ff20 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -630,7 +630,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
> >  }
> >
> >  /* len is expected to be in bytes */
> > -static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> > +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> >                 bool *encoded)
> >  {
> >         if (!*ptr || !len)
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > index 225c277..6762308 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
> >
> >  int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
> >  int adreno_gpu_state_put(struct msm_gpu_state *state);
> > +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> > +               bool *encoded);
> >
> >  /*
> >   * Common helper function to initialize the default address space for arm-smmu
> > --
> > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > of Code Aurora Forum, hosted by The Linux Foundation.
> >
