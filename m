Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66929866FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 21:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885CF10E852;
	Wed, 25 Sep 2024 19:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z1voXzRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9510E28F;
 Wed, 25 Sep 2024 19:37:40 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-39f51934f61so834015ab.2; 
 Wed, 25 Sep 2024 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727293059; x=1727897859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3inmzC1cBMAU1efYILglakaSQPbCmOcrhd59+dFzCc=;
 b=Z1voXzRoqPKxuOfxaT+ERLKz4GMayEfEiBO7jYSXPAMwpVo8rpwT+Q3VhSko/2IXLG
 TMCvdgveniAOFWZi0jy0dpQ5spBPzgrA6JhyM1iP9DaTefWUOk4ofIymc37LpFd6s8Pi
 zUbBBSd+NhbDSdZPFxDwTp9uhtaJsqTkcgqxxUIeEdDyb49QiKA1ugFZTdwHxpkuzBzv
 Wxxjl+/4965xjfr3IfQFvgAq/kulEqHk4TMa/1fb/V1M+DxEQgFngRgz8X153ZPxNhln
 B1Gwzsf/HBsWy5msLkeAbiF/hV6jWCj7Vc9DJfMlDuBy5F4356TVvdjCQDZ+xCbVSmbP
 a3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727293059; x=1727897859;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3inmzC1cBMAU1efYILglakaSQPbCmOcrhd59+dFzCc=;
 b=EWV3s5+vooPQjG7eo4zfl2M+qaTBCmfddJMC0whTLu8tfDYY5bDdw674M82dKI7044
 AO3n1mKPX6RuQ09eiKuewPq/GLD182daoOLjNHRib4Fbsv/+BxQCy3N7T3DPIaFJfBa4
 D862xg4h40aDop1GU0qU82/P2DW/bpSU2AIK2T19w2QHTtEEXGYXI9MP3gAmxPfTIhQ9
 VABTgKPM3nhJHfP59+n3XMeWwW1zQzLKqM/3nsUHc1CxvPdamvwBmRGRoRG/VTPa7fDQ
 y52kV0cXdbNpWeWD0uen7jAK/UNH51sM9BLj8iV0JzKDkI+dMTMpCTFc7XbWsDUx8TUW
 oO1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvu0t4s7GEi0D/nIUsU/XtQDVdNIVGyjXXvFzfBFlQR9aWihZo/ftNsIZoP/U3NMoiN06Oh0F19a/X@lists.freedesktop.org,
 AJvYcCWhSydEjnFSJq/+RuL4M646cP73ygpfbuJKIUzaPX1o35CHGUJ/FJr55v96ennMTOrLHRQdkP0c8XE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk/P78hYf7fAHlG57YzUEzj8pdYqjMenzUIGrlS2+UeBlvTP3T
 gscO2lJVEd9A5lq8CM0kyPAOjWX6b4p2JKJvMOaMUlaocGq5wJwaRa4ZH36kEqlldoCHy5CEcyR
 3uYpDC9Zk8Q6CILyfoI+NslfEDN8=
X-Google-Smtp-Source: AGHT+IEfjI8EcE0ZkJ+sptdGpXjZzm0A+cql6r0DLvyPqg9dSMW6R4pPBwsF5DXd3Tbf9D8V81a4ia2d7cEEGZjdACM=
X-Received: by 2002:a92:b746:0:b0:3a2:7592:2c5 with SMTP id
 e9e14a558f8ab-3a27592042bmr14057975ab.17.1727293059064; Wed, 25 Sep 2024
 12:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
 <c70392bb-bda1-48c7-824e-23d6f92f54ef@linaro.org>
 <20240920170949.vp3642gghhey3pjb@hu-akhilpo-hyd.qualcomm.com>
 <29fee642-440a-4b68-909b-a7c391d5a842@gmail.com>
 <CAF6AEGsuduEZDAg3nMpEiaA8nMO4fR8cH8j3k+K160+CvzaO6Q@mail.gmail.com>
 <20240924152225.tf6etddoiuiusber@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240924152225.tf6etddoiuiusber@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 25 Sep 2024 12:37:26 -0700
Message-ID: <CAF6AEGuJ97O6m-z6UK=c1hh=VxVPidS1Thqeo+OMCr_oGHcGCQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] Preemption support for A7XX
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
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

On Tue, Sep 24, 2024 at 8:22=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Tue, Sep 24, 2024 at 07:47:12AM -0700, Rob Clark wrote:
> > On Tue, Sep 24, 2024 at 4:54=E2=80=AFAM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> > >
> > > On 9/20/24 7:09 PM, Akhil P Oommen wrote:
> > > > On Wed, Sep 18, 2024 at 09:46:33AM +0200, Neil Armstrong wrote:
> > > >> Hi,
> > > >>
> > > >> On 17/09/2024 13:14, Antonino Maniscalco wrote:
> > > >>> This series implements preemption for A7XX targets, which allows =
the GPU to
> > > >>> switch to an higher priority ring when work is pushed to it, redu=
cing latency
> > > >>> for high priority submissions.
> > > >>>
> > > >>> This series enables L1 preemption with skip_save_restore which re=
quires
> > > >>> the following userspace patches to function:
> > > >>>
> > > >>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> > > >>>
> > > >>> A flag is added to `msm_submitqueue_create` to only allow submiss=
ions
> > > >>> from compatible userspace to be preempted, therefore maintaining
> > > >>> compatibility.
> > > >>>
> > > >>> Preemption is currently only enabled by default on A750, it can b=
e
> > > >>> enabled on other targets through the `enable_preemption` module
> > > >>> parameter. This is because more testing is required on other targ=
ets.
> > > >>>
> > > >>> For testing on other HW it is sufficient to set that parameter to=
 a
> > > >>> value of 1, then using the branch of mesa linked above, `TU_DEBUG=
=3Dhiprio`
> > > >>> allows to run any application as high priority therefore preempti=
ng
> > > >>> submissions from other applications.
> > > >>>
> > > >>> The `msm_gpu_preemption_trigger` and `msm_gpu_preemption_irq` tra=
ces
> > > >>> added in this series can be used to observe preemption's behavior=
 as
> > > >>> well as measuring preemption latency.
> > > >>>
> > > >>> Some commits from this series are based on a previous series to e=
nable
> > > >>> preemption on A6XX targets:
> > > >>>
> > > >>> https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasett=
y@codeaurora.org
> > > >>>
> > > >>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > >>> ---
> > > >>> Changes in v4:
> > > >>> - Added missing register in pwrup list
> > > >>> - Removed and rearrange barriers
> > > >>> - Renamed `skip_inline_wptr` to `restore_wptr`
> > > >>> - Track ctx seqno per ring
> > > >>> - Removed secure preempt context
> > > >>> - NOP out postamble to disable it instantly
> > > >>> - Only emit pwrup reglist once
> > > >>> - Document bv_rptr_addr
> > > >>> - Removed unused A6XX_PREEMPT_USER_RECORD_SIZE
> > > >>> - Set name on preempt record buffer
> > > >>> - Link to v3: https://lore.kernel.org/r/20240905-preemption-a750-=
t-v3-0-fd947699f7bc@gmail.com
> > > >>>
> > > >>> Changes in v3:
> > > >>> - Added documentation about preemption
> > > >>> - Use quirks to determine which target supports preemption
> > > >>> - Add a module parameter to force disabling or enabling preemptio=
n
> > > >>> - Clear postamble when profiling
> > > >>> - Define A6XX_CP_CONTEXT_SWITCH_CNTL_LEVEL fields in a6xx.xml
> > > >>> - Make preemption records MAP_PRIV
> > > >>> - Removed user ctx record (NON_PRIV) and patch 2/9 as it's not ne=
eded
> > > >>>     anymore
> > > >>> - Link to v2: https://lore.kernel.org/r/20240830-preemption-a750-=
t-v2-0-86aeead2cd80@gmail.com
> > > >>>
> > > >>> Changes in v2:
> > > >>> - Added preept_record_size for X185 in PATCH 3/7
> > > >>> - Added patches to reset perf counters
> > > >>> - Dropped unused defines
> > > >>> - Dropped unused variable (fixes warning)
> > > >>> - Only enable preemption on a750
> > > >>> - Reject MSM_SUBMITQUEUE_ALLOW_PREEMPT for unsupported targets
> > > >>> - Added Akhil's Reviewed-By tags to patches 1/9,2/9,3/9
> > > >>> - Added Neil's Tested-By tags
> > > >>> - Added explanation for UAPI changes in commit message
> > > >>> - Link to v1: https://lore.kernel.org/r/20240815-preemption-a750-=
t-v1-0-7bda26c34037@gmail.com
> > > >>>
> > > >>> ---
> > > >>> Antonino Maniscalco (11):
> > > >>>         drm/msm: Fix bv_fence being used as bv_rptr
> > > >>>         drm/msm/A6XX: Track current_ctx_seqno per ring
> > > >>>         drm/msm: Add a `preempt_record_size` field
> > > >>>         drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
> > > >>>         drm/msm/A6xx: Implement preemption for A7XX targets
> > > >>>         drm/msm/A6xx: Sync relevant adreno_pm4.xml changes
> > > >>>         drm/msm/A6xx: Use posamble to reset counters on preemptio=
n
> > > >>>         drm/msm/A6xx: Add traces for preemption
> > > >>>         drm/msm/A6XX: Add a flag to allow preemption to submitque=
ue_create
> > > >>>         drm/msm/A6xx: Enable preemption for A750
> > > >>>         Documentation: document adreno preemption
> > > >>>
> > > >>>    Documentation/gpu/msm-preemption.rst               |  98 +++++
> > > >>>    drivers/gpu/drm/msm/Makefile                       |   1 +
> > > >>>    drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   2 +-
> > > >>>    drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
> > > >>>    drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
> > > >>>    drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   6 +-
> > > >>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   7 +-
> > > >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 325 +++++=
+++++++++-
> > > >>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.h              | 174 +++++=
+++
> > > >>>    drivers/gpu/drm/msm/adreno/a6xx_preempt.c          | 440 +++++=
++++++++++++++++
> > > >>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
> > > >>>    drivers/gpu/drm/msm/msm_drv.c                      |   4 +
> > > >>>    drivers/gpu/drm/msm/msm_gpu.c                      |   2 +-
> > > >>>    drivers/gpu/drm/msm/msm_gpu.h                      |  11 -
> > > >>>    drivers/gpu/drm/msm/msm_gpu_trace.h                |  28 ++
> > > >>>    drivers/gpu/drm/msm/msm_ringbuffer.h               |  18 +
> > > >>>    drivers/gpu/drm/msm/msm_submitqueue.c              |   3 +
> > > >>>    drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   7 +-
> > > >>>    .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |  39 +-
> > > >>>    include/uapi/drm/msm_drm.h                         |   5 +-
> > > >>>    20 files changed, 1117 insertions(+), 66 deletions(-)
> > > >>> ---
> > > >>> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > > >>> change-id: 20240815-preemption-a750-t-fcee9a844b39
> > > >>>
> > > >>> Best regards,
> > > >>
> > > >> I've been running vulkan-cts (1.3.7.3-0-gd71a36db16d98313c43182943=
2a136dbda692a08 from Yocto)
> > > >> on SM8650-QRD, SM8550-QRD & SM8450-HDK boards with enable_preempti=
on in default value
> > > >> and forced to 1, and I've seen no regression so far
> > > >>
> > > >> On SM8550, I've seen a few:
> > > >> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *E=
RROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 2743 timed out waiting for res=
ponse
> > > >> platform 3d6a000.gmu: [drm:a6xx_hfi_send_msg.constprop.0 [msm]] *E=
RROR* Unexpected message id 2743 on the response queue
> > > >> but it's unrelated to preempt
> > > >>
> > > >> and on SM8450:
> > > >> platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout=
 waiting for GMU OOB set GPU_SET: 0x0
> > > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] =
*ERROR* 7.3.0.1: hangcheck detected gpu lockup rb 0!
> > > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] =
*ERROR* 7.3.0.1:     completed fence: 331235
> > > >> msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] =
*ERROR* 7.3.0.1:     submitted fence: 331236
> > > >> adreno 3d00000.gpu: [drm:a6xx_irq [msm]] *ERROR* gpu fault ring 0 =
fence 50de4 status 00800005 rb 0000/0699 ib1 0000000000000000/0000 ib2 0000=
000000000000/0000
> > > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ER=
ROR* 7.3.0.1: hangcheck recover!
> > > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ER=
ROR* 7.3.0.1: offending task: deqp-vk (/usr/lib/vulkan-cts/deqp-vk)
> > > >> msm_dpu ae01000.display-controller: [drm:recover_worker [msm]] *ER=
ROR* 7.3.0.1: hangcheck recover!
> > > >> leading to a VK_ERROR_DEVICE_LOST, but again unrelated to preempt =
support.
> > > >>
> > > >> So you can also add:
> > > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-=
QRD
> > > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-=
HDK
> > > >>
> > > >
> > > > Niel,
> > > >
> > > > On my x1e device, all submissions were somehow going into only a si=
ngle
> > > > ring, even the compositor's. Not sure why. So effectively preemptio=
n was
> > > > not really exercised. I had to force one of the two benchmark I ran
> > > > using the "highprio" mesa debug flag force submittions to ring 0.
> > >
> > > I think that is because GL applications (so most compositors) run
> > > through zink which does not forward GL preemption to vulkan so yeah, =
for
> > > GL applications the only way of getting preemption is the debug flag.
> >
> > I guess if it is mesa 24.2.x or newer it would be using the gallium
> > driver.  Which I guess would need xAMBLE stuff wired up.  Outside of
> > fd6_emit_restore() and fd6_gmem.cc there isn't really any state emit
> > in IB1, so I guess it probably wouldn't be too hard to get preemption
> > support wired up.
> >
> > BR,
> > -R
> >
> > > Unfortunately this is not easy to fix in Zink because it creates one
> > > VkDevice at screen creation and uses it for all GL contexts. Since GL
> > > priority is provided per context and at context creation time Zink ha=
s
> > > no way of handling this.
> > >
> > > Once TU will support more than one queue it will be possible for Zink=
 to
> > > create one queue per priority then pick one at context creation time.
> > > Doing so would require a new vulkan extension for per queue global
> > > priority. I had started working on this some time ago
> > > https://gitlab.freedesktop.org/antonino/mesa/-/tree/priority_ext?ref_=
type=3Dheads
> > > but this solution will only be viable once TU can expose more than on=
e
> > > queue.
> > >
>
> Thanks, both of you for the clarification. Glad about the
> improvements planned for both freedreno and zink.

Only lightly tested so far, but
https://gitlab.freedesktop.org/robclark/mesa/-/tree/fd/a7xx-preemption?ref_=
type=3Dheads
appears to work for getting preemption going on gl.  Needs some
cleanup/etc, but if you want something with gl compositor supporting
preemption, you can give it a try

BR,
-R

> -Akhil.
>
> > > >
> > > > If possible it is a good idea to check the new preemption traces to
> > > > ensure preemption kicks in.
> > > >
> > > > -Akhil
> > > >
> > > >> Thanks,
> > > >> Neil
> > >
> > >
> > > Best regards,
> > > --
> > > Antonino Maniscalco <antomani103@gmail.com>
