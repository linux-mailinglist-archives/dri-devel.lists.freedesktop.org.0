Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C06B2DD0
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 20:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C50910E1E9;
	Thu,  9 Mar 2023 19:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A382210E1E4;
 Thu,  9 Mar 2023 19:38:46 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-17638494edbso3419572fac.10; 
 Thu, 09 Mar 2023 11:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678390726;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=35e+ez6J1ndlzgGo8s0j8a58g+qz+wqLh5xcvyEk7GM=;
 b=c4LSxV/jfNwX0Rgw5FQZ1unMUox2fCXdbtkjyAJoGLsDqxi6O81+SaXiPYziYeSKws
 pfEUWwo45eOxDPpPYKdl/lpvb27EZFUJ81uLUL2Xk/9nxJ8Wsxl/drg/EnBeP78It4dW
 fss6aDhqKTpGq6vkK3oYg/Ay3ghHdr43Lvcu0ZSr6LHGy43foV2+CCltSYr/KFxAL0rR
 C6bCkSG8s8hDZubNQI6S2vztx5FVlfZsLk4FzMSSmyjHeFqP2jOA97sj8/41IQMt7vbH
 ZINtvFzdkVqV4gk1OUwQaaLvAQkVuyKgVh0Hq2WXMb3GzV8MSXGP2TRwiZPJke8hWjPz
 +MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678390726;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35e+ez6J1ndlzgGo8s0j8a58g+qz+wqLh5xcvyEk7GM=;
 b=Pg+CXSv7fc9I1DU24hGOyglHskj3MxTb+cSTAxg9Dplg/QvHM524KXtzUHOtwgGkoE
 b+dn3PXXlY4dJrIXs0J9C6CMoNpeArOnZL11NadmlwoCb4FrdZG5/Fx/JfAVGickO1MV
 +zhMghMjLkbCYpjOYgCgCga+PabCGvkXooQeG75R2qPhqSEa4iWKopfVqdJHYXALAMb0
 GC5AVibeYKaRAU7+STf6JrOlCVdG77aOnMiEszX7GAfGQhU5No57vIdpdn6FQyZ99V6M
 TNA6HlwMGIhScxMk+zhgT5kq89PMas2YylziVTqHxqLO/LcAvcZw4w/7cYypJtF/OMgu
 aCVQ==
X-Gm-Message-State: AO0yUKWqbaveXElzXuozhqqt/MrExAMvE1D49l+O62yHIoPr1YBqc5o5
 smaeoznb29DU+fVf5PANuwXIr9LdfSWO/ZqbnBQ=
X-Google-Smtp-Source: AK7set9oOGC0uqF+qr6zzD5BhK66EhmkoKForyZFCYYKviMYeXITPPHI1OL84vcAt6GHlPpR699YSTpE7lp4E5ilZz0=
X-Received: by 2002:a05:6870:954b:b0:176:207d:59c with SMTP id
 v11-20020a056870954b00b00176207d059cmr8037200oal.5.1678390725806; Thu, 09 Mar
 2023 11:38:45 -0800 (PST)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 9 Mar 2023 11:38:34 -0800
Message-ID: <CAF6AEGvH+VH_Wx3mFMG51CMnoiU06CM-+-WMhM73M42Qx7Bp4A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-03-09 for v6.3-rc2
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

A few fixes for v6.3.  Summary below.  There is a back-merge of
last-cycles -fixes to avoid a merge conflict in commit 6153c44392b0
("drm/msm/adreno: fix runtime PM imbalance at unbind")

The following changes since commit 92dd0575729a423aa5524d89055e34295152a2dd:

  Merge tag 'drm-msm-fixes-2023-01-16' into msm-fixes (2023-02-22
11:20:41 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-03-09

for you to fetch changes up to a722511b18268bd1f7084eee243af416b85f288f:

  drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed (2023-03-08
11:55:30 -0800)

----------------------------------------------------------------
msm-fixes for v6.3-rc2

- Fix for possible invalid ptr free in submit ioctl syncobj cleanup path.
- Synchronize GMU removal in driver teardown path
- a5xx preemption fixes
- Fix runpm imbalance at unbind
- DPU hw catalog fixes:
 - set DPU_MDP_PERIPH_0_REMOVED for sc8280xp as this is another chipset
   where the PERIPH_0 block of registers is not there
 - fix the DPU features supported in QCM2290 by comparing it with the
   downstream device tree
 - fix the length of registers in the sc7180_ctl from 0xe4 to 0x1dc
 - fix the max mixer line width for sm6115 and qcm2290 chipsets in the
   DPU catalog
 - fix the scaler version on sm8550, sc8280xp, sm8450, sm8250, sm8350
   and sm6115. This was incorrectly populated on the SW version of the
   scaler library and  not the scaler HW version
 - Drop dim layer support for msm8998 as its not indicated to be
   supported in the downstream DTSI
 - fix the DPU_CLK_CTRL bits for msm 8998 sspp blocks
 - Use DPU_CLK_CTRL_DMA* prefix instead of DPU_CLK_CTRL_CURSOR*
   for all chipsets for the DMA sspp blocks
 - fix the ping-pong block base address for sc7280 in the DPU HW catalog
- Fix stack corruption issue in the dpu_hw_ctl_setup_blendstage() function
  as it was causing a negative left shift by protecting against an invalid
  index
- Clear the DSPP reservations in dpu_rm_release(). This was missed out and
  as as result the DSPP was not released from the resource manager global
  state.

----------------------------------------------------------------
Dmitry Baryshkov (18):
      drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
      drm/msm/a5xx: fix highest bank bit for a530
      drm/msm/a5xx: fix the emptyness check in the preempt code
      drm/msm/a5xx: fix context faults during ring switch
      drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
      drm/msm/dpu: disable features unsupported by QCM2290
      drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
      drm/msm/dpu: fix len of sc7180 ctl blocks
      drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
      drm/msm/dpu: correct sm8550 scaler
      drm/msm/dpu: correct sc8280xp scaler
      drm/msm/dpu: correct sm8450 scaler
      drm/msm/dpu: correct sm8250 and sm8350 scaler
      drm/msm/dpu: correct sm6115 scaler
      drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
      drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
      drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
      drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage

Douglas Anderson (1):
      drm/msm/a6xx: Make GPU destroy a bit safer

Johan Hovold (1):
      drm/msm/adreno: fix runtime PM imbalance at unbind

Kalyan Thota (1):
      drm/msm/dpu: clear DSPP reservations in rm release

Kuogee Hsieh (1):
      drm/msm/disp/dpu: fix sc7280_pp base offset

Randy Dunlap (1):
      drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer needed

Rob Clark (1):
      drm/msm: Fix potential invalid ptr free

Thomas Zimmermann (1):
      drm/msm: Fix possible uninitialized access in fbdev

 drivers/gpu/drm/msm/Kconfig                    |   1 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c          |   6 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c      |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c          |   2 +
 drivers/gpu/drm/msm/adreno/adreno_device.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 166 ++++++++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |   2 +
 drivers/gpu/drm/msm/msm_fbdev.c                |   4 +-
 drivers/gpu/drm/msm/msm_gem_submit.c           |   5 +-
 12 files changed, 103 insertions(+), 98 deletions(-)
