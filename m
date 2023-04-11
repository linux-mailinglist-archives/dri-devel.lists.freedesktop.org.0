Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D256DDE9B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4538110E100;
	Tue, 11 Apr 2023 14:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE70310E100;
 Tue, 11 Apr 2023 14:55:46 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1842e278605so10055665fac.6; 
 Tue, 11 Apr 2023 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681224945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=no4YeRATy1dSo6KDRCv5JRaNT8PQjR0yxxTK9A8aqpo=;
 b=cnMptCJNzAVHhs7c6dgnkkU79Tx7RU78okUh6mTTxugiJ8Einwz3rtnDQSBAtWwtIS
 uykLWxacrixKcmbSnqDvmgnjdlSenDP7GtkWr3F/WxqDlmsWEYDHvVbrOP5ERgUA4pVK
 hrmcZa3m2b4Y4DZpH8LOvosAgaNwyiP0x7tIgyvVFYfvKMNtvu1H7Gj5isDTLAlkZz1o
 PioyDoVRflqJxJdegciqVO3ZpFrY0m7/3i5IckwX8SIeYmD/HoS2y5LY0090zetUyYnH
 bo14e+FB9UuKln8Zvy4VJCOejWdono5glSWWrz+lNV+VWIxhtJyL3swgPNkc54H/TU+F
 vMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=no4YeRATy1dSo6KDRCv5JRaNT8PQjR0yxxTK9A8aqpo=;
 b=6Snj+t1Uvvvv320kulw12xNMcNZWgdSll1M5rMVpXgpgZxa2V5E/+f092ljKcpFEAf
 WfPIs/rzCdw1qI3tqsT69sp3v1hqYOE2HSJ3o0XmDHZhV5xfik61Qq61m1deGCJe+e5v
 41IOn7G0E3wL/6BhmD3omvSmXrUsjzzgpZI9N76oYTyKXVM/CJW48PJx8szdNgEV6ch5
 NyA0pjilEyeIqzXuW16RKbk4qG5DSpCxcTbHSz5mAz4Yib7L78mZm5dVAJthM4f3sC2S
 f/flfZvRtUMONT3T4eQWnKDiA7OJZU+w8bPJYL41TMe4GYMsgAbQI9lGclLBEuqLv4gX
 h/Sg==
X-Gm-Message-State: AAQBX9eKfRDTvTi2PGLj1CpuYXEvVjWW3EQvW7TF0MwxqEEfDBrGC6Wg
 hXvxQ05l4NgJjH7bDrvqNpE0uXHbmiaSX6Iu5Ys=
X-Google-Smtp-Source: AKy350YxJa4AyT4zdJktMYg9lnFbk3djLCXO+ZdDSXsNuMLUGB1t9fbSWkz61f1X7J9mIbp4ZcK7a0Z+u+eeA4WNQ64=
X-Received: by 2002:a05:6870:e24c:b0:184:2097:e64f with SMTP id
 d12-20020a056870e24c00b001842097e64fmr1425289oac.5.1681224945250; Tue, 11 Apr
 2023 07:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
 <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
In-Reply-To: <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 11 Apr 2023 07:55:33 -0700
Message-ID: <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 3:27=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Mon, Apr 10, 2023 at 07:50:50AM -0700, Rob Clark wrote:
> > Hi Dave,
> >
> > This is the main pull for v6.4, see below for description.  A bit big
> > this time because of (1) generated header updates and (2) dpu hw
> > catelog rework which split the increasingly unwieldy
> > big-giant-file-of-tables into per-SoC files.  But those are mainly
> > mechanical churn.
> >
> > The following changes since commit e752ab11dcb48353727ea26eefd740155e02=
8865:
> >
> >   Merge remote-tracking branch 'drm/drm-next' into msm-next
> > (2023-03-20 10:31:25 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-04-=
10
> >
> > for you to fetch changes up to ac7e7c9c65ecfb1fcc99de91cfd6b17a8d4cb9c1=
:
> >
> >   drm/msm/dpu: drop unused macros from hw catalog (2023-04-07 03:54:50 =
+0300)
>
> Pulled, thanks.
>
> Two comments below.
>
> >
> > ----------------------------------------------------------------
> > main pull request for v6.4
> >
> > Core Display:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > * Bugfixes for error handling during probe
> > * rework UBWC decoder programming
> > * prepare_commit cleanup
> > * bindings for SM8550 (MDSS, DPU), SM8450 (DP)
> > * timeout calculation fixup
> > * atomic: use drm_crtc_next_vblank_start() instead of our own
> >   custom thing to calculate the start of next vblank
> >
> > DP:
> > =3D=3D
> > * interrupts cleanup
> >
> > DPU:
> > =3D=3D=3D
> > * DSPP sub-block flush on sc7280
> > * support AR30 in addition to XR30 format
> > * Allow using REC_0 and REC_1 to handle wide (4k) RGB planes
> > * Split the HW catalog into individual per-SoC files
> >
> > DSI:
> > =3D=3D=3D
> > * rework DSI instance ID detection on obscure platforms
> >
> > GPU:
> > =3D=3D=3D
> > * uapi C++ compatibility fix
> > * a6xx: More robust gdsc reset
> > * a3xx and a4xx devfreq support
> > * update generated headers
> > * various cleanups and fixes
> > * GPU and GEM updates to avoid allocations which could trigger
> >   reclaim (shrinker) in fence signaling path
>
> dim complained about a pile of commits without 2nd eyes, and it was mostl=
y
> this. I think especially for these tricky locking/reclaim issues having a
> bus factor > 1 would be really good. I'll try and brush of my anotations,
> hopefully we can have a bit more cross-driver discussions and reviews
> going here, iirc when Boris did the timed_out annotations for panfrost he
> didn't fix all the splats, so that's perfect candidate to help push the
> remaining work.

Fwiw, that was at least all tested with sched fence signaling
annotations, so tested-by: lockdep ;-)

Unfortunately we can't enable the annotations yet because of various
fixes needed in pm and icc.  But I'll resend that series with the
remaining outstanding patches after the merge window.

> > * dma-fence deadline hint support and wait-boost
> > * a640 speedbin support
> > * a650 speedbin support
> >
> > ----------------------------------------------------------------
> > Abhinav Kumar (3):
> >       MAINTAINERS: Update the URI for MSM DRM bugs
> >       drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pip=
e
> >       drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 functi=
on
> >
> > Adam Skladowski (1):
> >       drm: msm: adreno: Disable preemption on Adreno 510
> >
> > Akhil P Oommen (3):
> >       drm/msm/a6xx: Vote for cx gdsc from gpu driver
> >       drm/msm/a6xx: Remove cx gdsc polling using 'reset'
> >       drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
> >
> > Arnd Bergmann (1):
> >       drm/msm/a6xx: add CONFIG_PM dependency
> >
> > Colin Ian King (2):
> >       drm/msm/mdss: Fix spelling mistake "Unuspported" -> "Unsupported"
> >       drm/msm/dp: Fix spelling mistake "Capabiity" -> "Capability"
> >
> > Danylo Piliaiev (1):
> >       drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
> >
> > Dmitry Baryshkov (67):
> >       drm/msm/adreno: stall translation on fault for all GPU families
> >       drm/msm/adreno: split a6xx fault handler into generic and a6xx pa=
rts
> >       drm/msm/a5xx: add devcoredump support to the fault handler
> >       drm/msm/mdss: convert UBWC setup to use match data
> >       drm/msm/mdss: add data for sc8180xp
> >       drm/msm/mdss: add the sdm845 data for completeness
> >       drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
> >       drm/msm/dpu: move SSPP allocation to the RM
> >       drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
> >       drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
> >       drm/msm/dpu: move pipe_hw to dpu_plane_state
> >       drm/msm/dpu: drop dpu_plane_pipe function
> >       drm/msm/dpu: introduce struct dpu_sw_pipe
> >       drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
> >       drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
> >       drm/msm/dpu: clean up SRC addresses when setting up SSPP for soli=
d fill
> >       drm/msm/dpu: move stride programming to dpu_hw_sspp_setup_sourcea=
ddress
> >       drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
> >       drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
> >       drm/msm/dpu: drop src_split and multirect check from dpu_crtc_ato=
mic_check
> >       drm/msm/dpu: don't use unsupported blend stages
> >       drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_ch=
eck()
> >       drm/msm/dpu: drop redundant plane dst check from dpu_crtc_atomic_=
check()
> >       drm/msm/dpu: rewrite plane's QoS-related functions to take
> > dpu_sw_pipe and dpu_format
> >       drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
> >       drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
> >       drm/msm/dpu: simplify dpu_plane_validate_src()
> >       drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
> >       drm/msm/dpu: rework dpu_plane_atomic_check()
> >       drm/msm/dpu: rework plane CSC setting
> >       drm/msm/dpu: rework static color fill code
> >       drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
> >       drm/msm/dpu: add support for wide planes
> >       drm/msm/dpu: populate SmartDMA features in hw catalog
> >       drm/msm/dpu: drop smart_dma_rev from dpu_caps
> >       Merge branch 'msm-next-lumag-dpu' into msm-next-lumag
> >       Merge branches 'msm-next-lumag-dp', 'msm-next-lumag-dsi',
> > 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag
> >       drm/msm/dpu: constify DSC data structures
> >       drm/msm/dpu: mark remaining pp data as const
> >       drm/msm/dpu: move UBWC/memory configuration to separate struct
> >       drm/msm/dpu: split SM8550 catalog entry to the separate file
> >       drm/msm/dpu: split SC8280XP catalog entry to the separate file
> >       drm/msm/dpu: split SC7280 catalog entry to the separate file
> >       drm/msm/dpu: split SM8350 catalog entry to the separate file
> >       drm/msm/dpu: split SM6115 catalog entry to the separate file
> >       drm/msm/dpu: split QCM2290 catalog entry to the separate file
> >       drm/msm/dpu: split SC7180 catalog entry to the separate file
> >       drm/msm/dpu: split SM8250 catalog entry to the separate file
> >       drm/msm/dpu: split SC8180X catalog entry to the separate file
> >       drm/msm/dpu: split SM8150 catalog entry to the separate file
> >       drm/msm/dpu: split MSM8998 catalog entry to the separate file
> >       drm/msm/dpu: split SDM845 catalog entry to the separate file
> >       drm/msm/dpu: duplicate sdm845 catalog entries
> >       drm/msm/dpu: duplicate sc7180 catalog entries
> >       drm/msm/dpu: duplicate sm8150 catalog entries
> >       drm/msm/dpu: duplicate sm8250 catalog entries
> >       drm/msm/dpu: duplicate sm8350 catalog entries
> >       drm/msm/dpu: expand sc8180x catalog
> >       drm/msm/dpu: expand sc7180 catalog
> >       drm/msm/dpu: expand sm6115 catalog
> >       drm/msm/dpu: expand sm8550 catalog
> >       drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
> >       drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLA=
Y
> >       drm/msm/dpu: drop duplicate vig_sblk instances
> >       drm/msm/dpu: inline IRQ_n_MASK defines
> >       drm/msm/dpu: fetch DPU configuration from match data
> >       drm/msm/dpu: drop unused macros from hw catalog
> >
> > Douglas Anderson (2):
> >       drm/msm/dp: Clean up handling of DP AUX interrupts
> >       drm/msm/dp: Return IRQ_NONE for unhandled interrupts
> >
> > Geert Uytterhoeven (1):
> >       drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
> >
> > Jessica Zhang (4):
> >       drm/msm: Check for NULL before calling prepare_commit()
> >       drm/msm/dpu: Move TE setup to prepare_for_kickoff()
> >       drm/msm/dpu: Remove empty prepare_commit() function
> >       drm/msm/mdp4: Remove empty prepare_commit() function
> >
> > Johan Hovold (12):
> >       drm/msm/adreno: fix runtime PM imbalance at gpu load
> >       drm/msm/adreno: drop bogus pm_runtime_set_active()
> >       drm/msm/adreno: clean up component ops indentation
> >       Revert "drm/msm: Add missing check and destroy for
> > alloc_ordered_workqueue"
> >       Revert "drm/msm: Fix failure paths in msm_drm_init()"
> >       drm/msm: fix NULL-deref on snapshot tear down
> >       drm/msm: fix NULL-deref on irq uninstall
> >       drm/msm: fix drm device leak on bind errors
> >       drm/msm: fix vram leak on bind errors
> >       drm/msm: fix missing wq allocation error handling
> >       drm/msm: fix workqueue leak on bind errors
> >       drm/msm: move include directive
> >
> > Kalyan Thota (4):
> >       drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
> >       drm/msm/dpu: add DSPPs into reservation upon a CTM request
> >       drm/msm/dpu: avoid unnecessary check in DPU reservations
> >       drm/msm/dpu: manage DPU resources if CTM is requested
> >
> > Konrad Dybcio (18):
> >       drm/msm/adreno: Use OPP for every GPU generation
>
> This had a minor conflict with refactoring from drm-misc-next, I went
> what's in your pr. Please double check I didn't screw up, but at least it
> compiles :-)

Hmm, am I looking at the wrong thing.. the conflict I'm seeing is with
drm_gem_lru (and looks to be correctly resolved)

BR,
-R

>
> >       drm/msm/a3xx: Implement .gpu_busy
> >       drm/msm/a4xx: Implement .gpu_busy
> >       drm/msm/adreno: Enable optional icc voting from OPP tables
> >       drm/msm/a6xx: Add support for A640 speed binning
> >       drm/msm/a6xx: Add support for A650 speed binning
> >       drm/msm/adreno: adreno_gpu: Don't set OPP scaling clock w/ GMU
> >       drm/msm/adreno: adreno_gpu: Use suspend() instead of idle() on lo=
ad error
> >       dt-bindings: display/msm: dsi-controller-main: Fix deprecated
> > QCM2290 compatible
> >       drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
> >       drm/msm/dsi: Fix DSI index detection when version clash occurs
> >       drm/msm/dsi: dsi_cfg: Deduplicate identical structs
> >       drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
> >       drm/msm/dsi: Switch the QCM2290-specific compatible to index auto=
detection
> >       drm/msm/dsi: Remove custom DSI config handling
> >       dt-bindings: display/msm: dsi-controller-main: Add SM6115
> >       drm/msm/dpu: Allow variable SSPP_BLK size
> >       drm/msm/dpu: Allow variable INTF_BLK size
> >
> > Leonard Lausen (1):
> >       drm/msm/dpu: Add support for AR30 format
> >
> > Ma=C3=ADra Canal (1):
> >       drm/msm: Use drm_sched_job_add_syncobj_dependency()
> >
> > Neil Armstrong (4):
> >       dt-bindings: display/msm: document MDSS on SM8550
> >       dt-bindings: display: msm: sm8450-mdss: Fix DSI compatible
> >       dt-bindings: display/msm: document DPU on SM8550
> >       dt-bindings: display: msm: dp-controller: document SM8450 compati=
ble
> >
> > Rob Clark (29):
> >       drm/msm/a6xx: Some reg64 conversion
> >       drm/msm: Update generated headers
> >       dma-buf/dma-fence: Add deadline awareness
> >       dma-buf/fence-array: Add fence deadline support
> >       drm/msm: Pre-allocate hw_fence
> >       drm/msm: Move submit bo flags update from obj lock
> >       drm/msm/gem: Tidy up VMA API
> >       drm/msm: Decouple vma tracking from obj lock
> >       drm/msm/gem: Simplify vmap vs LRU tracking
> >       drm/gem: Export drm_gem_lru_move_tail_locked()
> >       drm/msm/gem: Move update_lru()
> >       drm/msm/gem: Protect pin_count/madv by LRU lock
> >       drm/msm/gem: Avoid obj lock in job_run()
> >       drm/msm: Switch idr_lock to spinlock
> >       drm/msm: Use idr_preload()
> >       drm/msm/gpu: Move fw loading out of hw_init() path
> >       drm/msm/gpu: Move BO allocation out of hw_init
> >       drm/msm/a6xx: Move ioremap out of hw_init path
> >       dma-buf/fence-chain: Add fence deadline support
> >       dma-buf/dma-resv: Add a way to set fence deadline
> >       dma-buf/sync_file: Surface sync-file uABI
> >       drm/scheduler: Add fence deadline support
> >       drm/vblank: Add helper to get next vblank time
> >       drm/atomic-helper: Set fence deadline for vblank
> >       Merge tag 'dma-fence-deadline' into HEAD
> >       drm/msm: Add deadline based boost support
> >       drm/msm: Add wait-boost support
> >       drm/msm/atomic: Switch to vblank_start helper
> >       drm/msm: Avoid rounding down to zero jiffies
> >
> > Thomas Zimmermann (8):
> >       drm/msm: Include <linux/io.h>
> >       drm/msm: Clear aperture ownership outside of fbdev code
> >       drm/msm: Remove fb from struct msm_fbdev
> >       drm/msm: Remove struct msm_fbdev
> >       drm/msm: Remove fbdev from struct msm_drm_private
> >       drm/msm: Move module parameter 'fbdev' to fbdev code
> >       drm/msm: Initialize fbdev DRM client
> >       drm/msm: Implement fbdev emulation as in-kernel client
> >
> > Tom Rix (1):
> >       drm/msm/mdp5: set varaiable msm8x76_config
> > storage-class-specifier to static
> >
> > Vinod Polimera (2):
> >       drm/msm/dpu: set dirty_fb flag while in self refresh mode
> >       msm/disp/dpu: allow atomic_check in PSR usecase
> >
> >  .../bindings/display/msm/dp-controller.yaml        |   25 +-
> >  .../bindings/display/msm/dsi-controller-main.yaml  |    9 +-
> >  .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   10 +-
> >  .../bindings/display/msm/qcom,sm8450-mdss.yaml     |    6 +-
> >  .../bindings/display/msm/qcom,sm8550-dpu.yaml      |  133 ++
> >  .../bindings/display/msm/qcom,sm8550-mdss.yaml     |  333 +++
> >  Documentation/driver-api/dma-buf.rst               |   16 +-
> >  MAINTAINERS                                        |    1 +
> >  drivers/dma-buf/dma-fence-array.c                  |   11 +
> >  drivers/dma-buf/dma-fence-chain.c                  |   12 +
> >  drivers/dma-buf/dma-fence.c                        |   59 +
> >  drivers/dma-buf/dma-resv.c                         |   22 +
> >  drivers/gpu/drm/drm_atomic_helper.c                |   37 +
> >  drivers/gpu/drm/drm_gem.c                          |   11 +-
> >  drivers/gpu/drm/drm_vblank.c                       |   53 +-
> >  drivers/gpu/drm/msm/Kconfig                        |    2 +
> >  drivers/gpu/drm/msm/adreno/a2xx.xml.h              |   54 +-
> >  drivers/gpu/drm/msm/adreno/a3xx.xml.h              |   30 +-
> >  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   11 +
> >  drivers/gpu/drm/msm/adreno/a4xx.xml.h              |   38 +-
> >  drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   11 +
> >  drivers/gpu/drm/msm/adreno/a5xx.xml.h              |   44 +-
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   69 +-
> >  drivers/gpu/drm/msm/adreno/a6xx.xml.h              |  795 ++++++--
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   64 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    7 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   30 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  183 +-
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
> >  drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |   52 +-
> >  drivers/gpu/drm/msm/adreno/adreno_device.c         |   33 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  174 +-
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    4 +
> >  drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  115 +-
> >  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  210 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  210 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  237 +++
> >  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  217 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  244 +++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  156 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  129 ++
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  119 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  226 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  158 ++
> >  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  222 ++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  234 +++
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  239 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  297 +--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   57 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |    7 -
> >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    8 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   21 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 2152 +-----------=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   94 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   49 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |    5 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |    4 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  187 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  115 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   96 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    1 -
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  867 ++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   40 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   22 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   12 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   19 +-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |   40 +-
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    5 -
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |   40 +-
> >  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |    2 +-
> >  drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   40 +-
> >  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       |    3 -
> >  drivers/gpu/drm/msm/dp/dp_aux.c                    |   90 +-
> >  drivers/gpu/drm/msm/dp/dp_aux.h                    |    2 +-
> >  drivers/gpu/drm/msm/dp/dp_catalog.c                |    2 +-
> >  drivers/gpu/drm/msm/dp/dp_catalog.h                |    2 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    2 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c                |    8 +-
> >  drivers/gpu/drm/msm/dp/dp_link.c                   |    2 +-
> >  drivers/gpu/drm/msm/dsi/dsi.c                      |    7 +-
> >  drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   41 +-
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  161 +-
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    9 +-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                 |   14 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h         |   40 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h         |   40 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h         |   40 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h         |   40 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h    |   40 +-
> >  drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h          |   36 +-
> >  drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   40 +-
> >  drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   38 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |   62 +-
> >  drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   40 +-
> >  drivers/gpu/drm/msm/msm_atomic.c                   |   29 +-
> >  drivers/gpu/drm/msm/msm_debugfs.c                  |    6 +-
> >  drivers/gpu/drm/msm/msm_drv.c                      |  109 +-
> >  drivers/gpu/drm/msm/msm_drv.h                      |   15 +-
> >  drivers/gpu/drm/msm/msm_fbdev.c                    |  173 +-
> >  drivers/gpu/drm/msm/msm_fence.c                    |   86 +-
> >  drivers/gpu/drm/msm/msm_fence.h                    |   23 +-
> >  drivers/gpu/drm/msm/msm_gem.c                      |  150 +-
> >  drivers/gpu/drm/msm/msm_gem.h                      |   29 +-
> >  drivers/gpu/drm/msm/msm_gem_submit.c               |   37 +-
> >  drivers/gpu/drm/msm/msm_gem_vma.c                  |   91 +-
> >  drivers/gpu/drm/msm/msm_gpu.c                      |    8 +-
> >  drivers/gpu/drm/msm/msm_gpu.h                      |   12 +-
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c              |    2 +-
> >  drivers/gpu/drm/msm/msm_io_utils.c                 |    1 +
> >  drivers/gpu/drm/msm/msm_iommu.c                    |   38 +-
> >  drivers/gpu/drm/msm/msm_kms.h                      |    8 -
> >  drivers/gpu/drm/msm/msm_mdss.c                     |  198 +-
> >  drivers/gpu/drm/msm/msm_mmu.h                      |    1 +
> >  drivers/gpu/drm/msm/msm_ringbuffer.c               |    8 +-
> >  drivers/gpu/drm/msm/msm_submitqueue.c              |    2 +-
> >  drivers/gpu/drm/scheduler/sched_fence.c            |   46 +
> >  drivers/gpu/drm/scheduler/sched_main.c             |    2 +-
> >  include/drm/drm_gem.h                              |    1 +
> >  include/drm/drm_vblank.h                           |    1 +
> >  include/drm/gpu_scheduler.h                        |   17 +
> >  include/linux/dma-fence.h                          |   22 +
> >  include/linux/dma-resv.h                           |    2 +
> >  include/uapi/drm/msm_drm.h                         |   18 +-
> >  include/uapi/linux/sync_file.h                     |   37 +-
> >  125 files changed, 6659 insertions(+), 4519 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.yaml
> >  create mode 100644
> > Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm89=
98.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm84=
5.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm815=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc818=
0x.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm825=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc718=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm611=
5.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm22=
90.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm835=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc728=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc828=
0xp.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm845=
0.h
> >  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm855=
0.h
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
