Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A9971E24
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 17:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8E610E0CB;
	Mon,  9 Sep 2024 15:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Azi0bPw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F170610E0CB;
 Mon,  9 Sep 2024 15:36:49 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id
 e9e14a558f8ab-3a043390030so17842555ab.1; 
 Mon, 09 Sep 2024 08:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725896209; x=1726501009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o555don3oiC4LbhNZvudRjyy7/nYs5wSbIdE6tIRHn4=;
 b=Azi0bPw1odyItwc71a2V15mYBjE/XfXDXwJ8kCjf+HbRAe/Vn9fQrhFXKPE3ftD2D4
 /eL2C/3E0zma01Ni+KWsLgczWbOwFPYvqQA6Ti3PK5ok1h5FVt+4SL0jupOQgCWoOd5K
 NMfWhZfvHj96M+EJOOOtTjrEM/L4YbxNApMiQBUBlNGwkih+cLhg5iuksB7JUNT0xZqD
 H8QDRrbSyEk1axbScl7AlCCFKGVyoKaP3pvwuh2pCVraScvWEms6+ly7MZ1UAa2kqM7b
 kcI2CV+G9MVdEzrT/ouNzYYgwsyqCnm0MEoya15RfLOUs45NfLeCAsM0AKo7DSjBDKb0
 +yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725896209; x=1726501009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o555don3oiC4LbhNZvudRjyy7/nYs5wSbIdE6tIRHn4=;
 b=VRTKQH6P1UJBq7yaMNN8W/6IW7yDkMVQQQWXz4zCxwcvVrluV+zbjpyLDQHDufiSuj
 W8yeONCWiGa+o/swK1NvYjDwBZTBL2zw7MA40V7g/qjd9Xt+e4rn0R7eTT2vd+JPlMTL
 H2NVNF37F6qA0BLlpGfZZ+ia87Qae2c41EKeePtNpSeVUjLsXbReeTVEId5N4yAgFSOo
 nLnnIP01jxruo5XlqDFN/tBmtSpvjJ8tnpGAaEpXVK2irM5WD3GyLYLq3j5Wh48Y/TM9
 i8mN7AainAyoGnpZqbh1XAD1azKNmc3s6u4e/A9grMBFekJ8Nr78tRhRjRZBUIr07yCR
 sFKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7BtcO2eTA2G0mh1X563uY6w2iZDFe+Qi2bd9ENBhqn1qFjX7vJ520ppv/YLvazR7eGcl1nVS7HSLs@lists.freedesktop.org,
 AJvYcCXfKZJ7mTgSEBOHhGuF4TefwGFc2wA0Lu/osldRF9bqAbwWxL/jBWZNwtmfr8ncc4qrz1BXrE4GU0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDQlRwVm9MoKH9VSySJfqGOFFvD01dWaD1YEpnqpGP1+2iXADy
 t7x8uj6Dw+11jApaiLpW4TIWeT+AcL2B2VraC1o/yDHy+oJNNRC8h+68VXzNAd8P0qHODctydo+
 20YFuJuES5PaIq/tIdrIdHK7QCW8=
X-Google-Smtp-Source: AGHT+IEQ7PpjhL1AvLnf149fn9AnLp54fSBeFsxA3zefzb71fMszaXFL5LDtBaaEqhzCMaDdFSi4xioCPJlDBQzjTA0=
X-Received: by 2002:a05:6e02:17cd:b0:38b:48c9:55d5 with SMTP id
 e9e14a558f8ab-3a04f07e78bmr122325995ab.13.1725896208956; Mon, 09 Sep 2024
 08:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240906195827.at7tgesx55xt6k5o@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Sep 2024 08:36:37 -0700
Message-ID: <CAF6AEGu==X-=HvXfoQycRFtameg8C=u3e+4bUFmnn4s1wJgwVw@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sharat Masetty <smasetty@codeaurora.org>
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

On Fri, Sep 6, 2024 at 12:59=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Sep 05, 2024 at 04:51:18PM +0200, Antonino Maniscalco wrote:
> > This series implements preemption for A7XX targets, which allows the GP=
U to
> > switch to an higher priority ring when work is pushed to it, reducing l=
atency
> > for high priority submissions.
> >
> > This series enables L1 preemption with skip_save_restore which requires
> > the following userspace patches to function:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> >
> > A flag is added to `msm_submitqueue_create` to only allow submissions
> > from compatible userspace to be preempted, therefore maintaining
> > compatibility.
> >
> > Preemption is currently only enabled by default on A750, it can be
> > enabled on other targets through the `enable_preemption` module
> > parameter. This is because more testing is required on other targets.
> >
> > For testing on other HW it is sufficient to set that parameter to a
> > value of 1, then using the branch of mesa linked above, `TU_DEBUG=3Dhip=
rio`
> > allows to run any application as high priority therefore preempting
> > submissions from other applications.
> >
> > The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` traces
> > added in this series can be used to observe preemption's behavior as
> > well as measuring preemption latency.
> >
> > Some commits from this series are based on a previous series to enable
> > preemption on A6XX targets:
> >
> > https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@code=
aurora.org
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>
> Antonino, can you please test this once with per-process pt disabled to
> ensure that is not broken? It is handy sometimes while debugging.
> We just need to remove "adreno-smmu" compatible string from gpu smmu
> node in DT.

fwiw, I'd be ok supporting preemption on devices that have per-process
pgtables.  (And maybe we should be tainting the kernel if per-process
pgtables are disabled on a6xx+)

BR,
-R

> -Akhil.
>
> > ---
> > Changes in v3:
> > - Added documentation about preemption
> > - Use quirks to determine which target supports preemption
> > - Add a module parameter to force disabling or enabling preemption
> > - Clear postamble when profiling
> > - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > - Make preemption records MAP_PRIV
> > - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not needed
> >   anymore
> > - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-t-v2-0=
-86aeead2cd80@gmail.com
> >
> > Changes in v2:
> > - Added preept_record_size for X185 in PATCH 3/7
> > - Added patches to reset perf counters
> > - Dropped unused defines
> > - Dropped unused variable (fixes warning)
> > - Only enable preemption on a750
> > - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> > - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> > - Added Neil's Tested-By tags
> > - Added explanation for UAPI changes in commit message
> > - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-t-v1-0=
-7bda26c34037@gmail.com
> >
> > ---
> > Antonino Maniscalco (10):
> >       drm/msm: Fix bv_fence being used as bv_rptr
> >       drm/msm: Add a `preempt_record_size` field
> >       drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> >       drm/msm/A6xx: Implement preemption for A7XX targets
> >       drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> >       drm/msm/A6xx: Use posamble to reset counters on preemption
> >       drm/msm/A6xx: Add traces for preemption
> >       drm/msm/A6XX: Add a flag to allow preemption to submitqueue_creat=
e
> >       drm/msm/A6xx: Enable preemption for A750
> >       Documentation: document adreno preemption
> >
> >  Documentation/gpu/msm-preemption.rst               |  98 +++++
> >  drivers/gpu/drm/msm/Makefile                       |   1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 331 +++++++++++++=
++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 166 ++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 430 +++++++++++++=
++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> >  drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> >  drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> >  drivers/gpu/drm/msm/msm_ringbuffer.h               |   8 +
> >  drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> >  .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> >  include/uapi/drm/msm_drm.h                         |   5 +-
> >  14 files changed, 1094 insertions(+), 42 deletions(-)
> > ---
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > change-id: 20240815-preemption-a750-t-fcee9a844b39
> >
> > Best regards,
> > --
> > Antonino Maniscalco <antomani103@gmail.com>
> >
