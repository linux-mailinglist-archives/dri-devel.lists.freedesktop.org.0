Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68A971B54
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 15:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBE110E587;
	Mon,  9 Sep 2024 13:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+/SMWcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4719B10E586;
 Mon,  9 Sep 2024 13:43:10 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71797e61d43so436068b3a.2; 
 Mon, 09 Sep 2024 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725889390; x=1726494190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZgDu7K8tlaL91YL3Tof02NsN1tNN3lVywAWATfL7mwQ=;
 b=J+/SMWcFSU+rATiFiAEJoBOpuupLXYzWUyZZ4WTsfecNZLO4msPGFEDy6vAxLt00Fk
 c6s8vwkhWwcguqW5vS4p8lUOBbGyo8rw/qW/c1DQAISXKJs3Yk3+QxMrCaDSNMDOmNYE
 lv3XgKikbXNKxm2+dQKzx2RZlWQ+3BGMsHMJWEZ6ZDSDCp1DQJU4oAe6ropboB9iz4g8
 jJE17RQCSBIwzNRCb5DJAspMBlROtIB80yEJImCdKnEdjJEQ517dhKE5iN57WXEYcI+X
 WJkH7s83CPf2rvoGb3DRzg3BRBmMws1KkpYaqUUZ8fW7tM7kpcmztjo/itmGi2se1/72
 uCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725889390; x=1726494190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZgDu7K8tlaL91YL3Tof02NsN1tNN3lVywAWATfL7mwQ=;
 b=eY2J3lypqvbER+llgcHjFuA4RG6eNEO7ZR84mowxEpLEhrQj5vDlolotnudzaf6HMM
 EOmv3URgMvUQHI/zn6rbA6c3NJD8JsfHz2ZUeqC+A6NhcfrbRSHJt/HX3AuUxYJIlVn6
 LWtZZwm8kInhvYBQxWe61MLrTsa6JMREMw+qFEUGtP3u8a92mCLjzbhCsp39A39BUeN7
 Xn3AoZelgUO+IOv2koPQQPB0P5Yi5v6K0Ks0jNGNIXlAs8yPwxa7AIBvI0PWBna5//Br
 2FcdePQEL18fGpNBfdU/48iJRRuqKJ9jM/W/cuPLvCIOVng92k1QQLHTr4ppkFIWfmOj
 0pWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcp/hlMa+1nE5IyI75aWHUrIOQDOtTZ4OjUCl4eP2CSd6Bx3OTKU/9G3BwPPqB4M3cvI2aLLxRaXk=@lists.freedesktop.org,
 AJvYcCVX3y80cnJVDC0KVx3wF2f6R7qbkjFrSR9SUBf8570gPtcU+SewIHBQkcbiH8cjCowJ+J5PdvlmdV5j@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMv7AxbIG2LaMWu10p3iumhaBPCTwbW4nquf9m9Qjhsdx+UQ/c
 1SAkEoAQ/2a1Dyh5JcMTMC1VKyrM+pKWyBWgNHaW6nTMzydNdOveAxE6DCLD/DpJELzh3asb5dg
 lCFhqkyr3LhqHjQjea/s9Xixijg8=
X-Google-Smtp-Source: AGHT+IEpNKUplvobMAHwQsNd4YEbne1nahgYb4SFmj2oqMNm+eujaQfMJOdRxTAMDlx5AnDhOx/g4PUGM0s/XNhIBfc=
X-Received: by 2002:a17:902:c409:b0:206:b6db:49a2 with SMTP id
 d9443c01a7336-206f0652f64mr54765785ad.8.1725889389597; Mon, 09 Sep 2024
 06:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com>
 <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
In-Reply-To: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 9 Sep 2024 14:42:58 +0100
Message-ID: <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX
 targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Sharat Masetty <smasetty@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 9, 2024 at 2:15=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> > On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> >> This patch implements preemption feature for A6xx targets, this allows
> >> the GPU to switch to a higher priority ringbuffer if one is ready. A6X=
X
> >> hardware as such supports multiple levels of preemption granularities,
> >> ranging from coarse grained(ringbuffer level) to a more fine grained
> >> such as draw-call level or a bin boundary level preemption. This patch
> >> enables the basic preemption level, with more fine grained preemption
> >> support to follow.
> >>
> >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> >> ---
> >>   drivers/gpu/drm/msm/Makefile              |   1 +
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 ++++++++++++++++++++=
+-
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> ...
> >
> > we can use the lighter smp variant here.
> >
> >> +
> >> +            if (a6xx_gpu->cur_ring =3D=3D ring)
> >> +                    gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> >> +            else
> >> +                    ring->skip_inline_wptr =3D true;
> >> +    } else {
> >> +            ring->skip_inline_wptr =3D true;
> >> +    }
> >> +
> >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> >>   }
> >>
> >>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 count=
er,
> >> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *=
a6xx_gpu,
> >
> > set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> > not. This is currently not tracked separately for each ring. Can you
> > please check that?
>
> I totally missed that. Thanks for catching it!
>
> >
> > I wonder why that didn't cause any gpu errors in testing. Not sure if I
> > am missing something.
> >
>
> I think this is because, so long as a single context doesn't submit to
> two different rings with differenr priorities, we will only be incorrect
> in the sense that we emit more page table switches than necessary and
> never less. However untrusted userspace could create a context that
> submits to two different rings and that would lead to execution in the
> wrong context so we must fix this.

FWIW, in Mesa in the future we may want to expose multiple Vulkan
queues per device. Then this would definitely blow up.

Connor

>
> >>
> >>      /*
> >>       * Write the new TTBR0 to the memstore. This is good for debuggin=
g.
> >> +     * Needed for preemption
> >>       */
> >> -    OUT_PKT7(ring, CP_MEM_WRITE, 4);
> >> +    OUT_PKT7(ring, CP_MEM_WRITE, 5);
> >>      OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> >>      OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> >>      OUT_RING(ring, lower_32_bits(ttbr));
> >> -    OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
> >> +    OUT_RING(ring, upper_32_bits(ttbr));
> >> +    OUT_RING(ring, ctx->seqno);
> >>
> >>      /*
> >>       * Sync both threads after switching pagetables and enable BR onl=
y
> >> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >>      a6xx_flush(gpu, ring);
> >>   }
> ...
> >> +    struct a6xx_preempt_record *record_ptr =3D
> >> +            a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SEC=
URE;
> >> +    u64 ttbr0 =3D ring->memptrs->ttbr0;
> >> +    u32 context_idr =3D ring->memptrs->context_idr;
> >> +
> >> +    smmu_info_ptr->ttbr0 =3D ttbr0;
> >> +    smmu_info_ptr->context_idr =3D context_idr;
> >> +    record_ptr->wptr =3D get_wptr(ring);
> >> +
> >> +    /*
> >> +     * The GPU will write the wptr we set above when we preempt. Rese=
t
> >> +     * skip_inline_wptr to make sure that we don't write WPTR to the =
same
> >> +     * thing twice. It's still possible subsequent submissions will u=
pdate
> >> +     * wptr again, in which case they will set the flag to true. This=
 has
> >> +     * to be protected by the lock for setting the flag and updating =
wptr
> >> +     * to be atomic.
> >> +     */
> >> +    ring->skip_inline_wptr =3D false;
> >> +
> >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> >> +
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> >> +            a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_IN=
FO);
> >> +
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> >> +            a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NO=
N_SECURE);
> >> +
> >> +    preempt_offset_priv_secure =3D
> >> +            PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_reco=
rd_size);
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
> >> +            a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_se=
cure);
> >
> > Secure buffers are not supported currently, so we can skip this and the
> > context record allocation. Anyway this has to be a separate buffer
> > mapped in secure pagetable which don't currently have. We can skip the
> > same in pseudo register packet too.
> >
>
> Mmm it would appear that not setting it causes an hang very early. I'll
> see if I can find out more about what is going on.
>
> >> +
> >> +    a6xx_gpu->next_ring =3D ring;
> >> +
> ...
> >>
> >>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int i=
d,
> >>
> >> --
> >> 2.46.0
> >>
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>
