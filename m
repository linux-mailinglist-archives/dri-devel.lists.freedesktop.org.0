Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A13732332
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 01:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6D310E56A;
	Thu, 15 Jun 2023 23:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEC910E568
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:20 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f762b3227dso256400e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871279; x=1689463279;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=walsiK/aaH58QNvtuSG5yhI6jzn52X5QkkvfpB28yvo=;
 b=nDKlXccBB6EaQheBuo+hY7Pf7vd3oaMxPgowH5dXFb8Oi32wS35kTa30Kzxmbazq8F
 b/9ERtdNoBJv0Nuis2ptKBsUGLqnkOQjk/fd1Sir6J+tvYks0lZQJZlSRCWltYEOGx85
 pyya8mr2vUphWK+faJ3OPQ02aE+MxVYrCzYD9t2mXodQxZB6fzFXTxauJz2dwOclXJS+
 s5F6rUtjHkc/zUBXPqYX3WMisgQgtVr/jYp2D+qbH9hhO/N5KiJkeVxjf5J52w+WZ+Mi
 clQ2tDjAumLeGv72hsA1nGFpl3H89RPuvdBQhyeeKhldsh5d3T8PP3ZcfB+OrMs5X3uB
 KIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871279; x=1689463279;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=walsiK/aaH58QNvtuSG5yhI6jzn52X5QkkvfpB28yvo=;
 b=M8PR8EXNBKAykeM5/T+FMgr5a5MHh8Ez6GhlJwmEk3/n8nMpQ08aFAhRfhp5wDAzM7
 ZZOl5uCrx/41MKXs0/cuZp8cOtr28zOwGYGdhkHWMDtc5A0bMQxLA2ACUheh0LKTk0qR
 F3RC51pyxwzz91AMCJNfOR6VjP4JA6Yp7gfsq1Jf9V4lwAFWm1/DWFplEkn1utFLEjib
 TQqV99Fvd3mlxZHj8OwCZLh4C3FYicU9tPshazm6axE7OwnwzBtq12IdI4Z4UpHFEZMU
 lJgeXfWlPn+YvHlf1hURdWCHJP/pNvhy/saloASeoOYCnmyQcmFY8tKRQH5sMwHg62sG
 zVTg==
X-Gm-Message-State: AC+VfDw+qyQi1IlKXCekF5e7ZP0BaeiF5QtDoyyHiUg29iFZxb9jJxgh
 FZaf1cYg07UMcvR2qISOQ8huMQ==
X-Google-Smtp-Source: ACHHUZ56HEBN3qYdKchyNRNSy73bvwXtBAD5nM5pu/FZS1nsKl9f6oiejHcgu9CuuVIwKdmVUZNlRA==
X-Received: by 2002:a19:6910:0:b0:4f6:43ac:d28d with SMTP id
 e16-20020a196910000000b004f643acd28dmr46619lfc.33.1686871278563; 
 Thu, 15 Jun 2023 16:21:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:18 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v9 00/20] GMU-less A6xx support (A610, A619_holi)
Date: Fri, 16 Jun 2023 01:20:41 +0200
Message-Id: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmci2QC/4XPzWrEIBQF4FcZXNdi/HdWfY/ShZprIqQadCZtG
 fLuNbMrgbo8B+53uA9UoUSo6Hp5oAJbrDGnFszLBfnZpglwHFtGlFBGKGX4ltfo8fR5/yp2XaF
 gx0MIIoxKaYPambMVsCs2+bkdpvuytHItEOL3c+f9o+U51lsuP8/ZjR3tPwsbwwQLB0JYxqQez
 NsSky35NZcJHdrGewJvAhitwCkzEhZOgugJogkuKMWdsYZQexJkT5BNoITxYRDOSeJPguoJ6vj
 Ce2Wt00wIeRJ0T9BNkMZLTYmUxMAfYd/3X7vbVj0QAgAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=11220;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9qs4kDO7xT/MqO2MS+GdYndxLK3cWM9IyZ0FrlA4wIA=;
 b=BGUQDaCDUWbpUDnvAOlv4GBesULVNrlUi0Eoj8QL7JaXNGSPcOZoMZQRJszrw769Y2Ht6h/pk
 uGlMla3GgR9BmlMkL8WJo+aUHwVaFTA+7isGjlcma0VWXlEgJ+2O0kt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v8 -> v9:
- Re-pick-up Krzysztof's lost r-b tag (I messed up, sorry)
- Rebase on constifying-adreno_is_aXYZ and A690 changes
- Fix A610 inactive period
- Move the stray A619 register write from A610 patch to the A619 patch
- Add one more commit, cleaning up A690 addition for git context (for adding
  adreno_is_a680 in "Use adreno_is_aXYZ macros in speedbin matching")
- Use a readback+delay combo instead of a memory barrier in sw reset
- Separate out GMU CX power counter moving
- Pick up tags from v8
v8: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org

v7 -> v8:
- Fix up resume/suspend (icc now correctly parks to 0, don't abuse
  OPP & genpd throughout system-wide suspend)
- Don't handle ebi1_clk separately, the bulk ops handle it just fine
- Rebase on next-20230525 (no meaningful changes)

v7: https://lore.kernel.org/linux-arm-msm/20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org/

v6 -> v7:
- Rebase on next-20230519 (A640/650 speedbin merged already)

- separate out the .get_timestamp cb for gmu wrapper

- check for gmu presence inside a6xx_llc_slices_(init|destroy) instead
  of before calling them

- use REG_A6XX_RBBM_GPR0_CNTL instead of literal 0x18

- move a6xx_bus_clear_pending_transactions to a6xx_gpu, clean it up
  and reuse it for gmu wrapper gpus

- drop clearing RBBM_GBIF (GBIF from GX's POV) as part of draining the
  buses, it's not necessary

- introduce a helper for gpu softreset

- sw-reset the gmu wrapper GPUS *after* draining GBIF and only reset
  it if it's hung

- reword the commit message in "Remove both GBIF and RBBM GBIF halt
  on hw init" and move it before gmu wrapper-specific changes

- drop set_rate logic from a6xx_pm_suspend as the clock simply gets
  disabled and we don't have to worry about scaling problems as OPP
  and devfreq take care of that, validated with debugcc

- drop a level of indentation in _a6xx_check_idle() to hopefully
  improve readability

- check for !a610 instead of gmu_wrapper||a619_holi in sptprac cc
  toggling in a6xx_set_hwcg()

- pick up krzk's rb on bindings

All external dependencies have been merged since the last revision.

v6: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org

v5 -> v6:
- Rebase on 8ead96783163 ("drm/msm/gpu: Move BO allocation out of hw_init")
  (Add .ucode_load to funcs_gmuwrapper)
- Drop A6[45]0 speedbin deps, merged into msm-next

Dependencies:
- https://lore.kernel.org/linux-arm-msm/20230330231517.2747024-1-konrad.dybcio@linaro.org/ (to work properly)

v5: https://lore.kernel.org/linux-arm-msm/20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org/

v4 -> v5:
- Add a newline before the new allOf:if: [3/15]
- Enforce 6 clocks on A619_holi/A610 [2/15]
- Pick up tags
- Improve error handling in a6xx_pm_resume [6/15]
- Add patch [1/15] (fix an existing issue) which can be picked
  separately and account for it in [6/15]
- Rebase atop Akhil's CX shutdown patches and incorporate analogous logic
- Fix a regression introduced in v3 that made the fw loader expect
  GMU fw on GMU wrapper GPUs

Dependencies:
- https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/ (to apply)
- https://lore.kernel.org/linux-arm-msm/20230330231517.2747024-1-konrad.dybcio@linaro.org/ (to work properly)

v4: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org

v3 -> v4:
- Drop the mistakengly-included and wrong A3xx-A5xx bindings changes
- Improve bindings commit messages to better explain what GMU Wrapper is
- Drop the A680 highest bank bit value adjustment patch
- Sort UBWC config variables in a reverse-Christmass-tree fashion [4/14]
- Don't alter any UBWC config values in [4/14]
  - Do so for a619_holi in [8/14]
- Rebase on next-20230314 (shouldn't matter at all)

v3: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org

v2 -> v3:
New dependencies:
- https://lore.kernel.org/linux-arm-msm/20230223-topic-opp-v3-0-5f22163cd1df@linaro.org/T/#t
- https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/

Sidenote: A speedbin rework is in progress, the of_machine_is_compatible
calls in A619_holi are ugly (but well, necessary..) but they'll be
replaced with socid matching in this or the next kernel cycle.

Due to the new way of identifying GMU wrapper GPUs, configuring 6350
to use wrapper would cause the wrong fuse values to be checked, but that
will be solved by the conversion + the ultimate goal is to use the GMU
whenever possible with the wrapper left for GMU-less Adrenos and early
bringup debugging of GMU-equipped ones.

- Ship dt-bindings in this series as we're referencing the compatible now

- "De-staticize" -> "remove static keyword" [3/15]

- Track down all the values in [4/15]

- Add many comments and explanations in [4/15]

- Fix possible return-before-mutex-unlock [5/15]

- Explain the GMU wrapper a bit more in the commit msg [5/15]

- Separate out pm_resume/suspend for GMU-wrapper GPUs to make things
  cleaner [5/15]

- Don't check if `info` exists, it has to at this point [5/15]

- Assign gpu->info early and clean up following if statements in
  a6xx_gpu_init [5/15]

- Determine whether we use GMU wrapper based on the GMU compatible
  instead of a quirk [5/15]

- Use a struct field to annotate whether we're using gmu wrapper so
  that it can be assigned at runtime (turns out a619 holi-ness cannot
  be determined by patchid + that will make it easier to test out GMU
  GPUs without actually turning on the GMU if anybody wants to do so)
  [5/15]

- Unconditionally hook up gx to the gmu wrapper (otherwise our gpu
  will not get power) [5/15]

- Don't check for gx domain presence in gmu_wrapper paths, it's
  guaranteed [5/15]

- Use opp set rate in the gmuwrapper suspend path [5/15]

- Call opp functions on the GPU device and not on the DRM device of
  mdp4/5/DPU1 half the time (WHOOOOPS!) [5/15]

- Disable the memory clock in a6xx_pm_suspend instead of enabling it
  (moderate oops) [5/15]

- Call the forgotten clk_bulk_disable_unprepare in a6xx_pm_suspend [5/15]

- Set rate to FMIN (a6xx really doesn't like rate=0 + that's what
  msm-5.x does anyway) before disabling core clock [5/15]

- pm_runtime_get_sync -> pm_runtime_resume_and_get [5/15]

- Don't annotate no cached BO support with a quirk, as A619_holi is
  merged into the A619 entry in the big const struct - this means
  that all GPUs operating in gmu wrapper configuration will be
  implicitly treated as if they didn't have this feature [7/15]

- Drop OPP rate & icc related patches, they're a part of a separate
  series now; rebase on it

- Clean up extra parentheses [8/15]

- Identify A619_holi by checking the compatible of its GMU instead
  of patchlevel [8/15]

- Drop "Fix up A6XX protected registers" - unnecessary, Rob will add
  a comment explaining why

- Fix existing UBWC values for A680, new patch [10/15]

- Use adreno_is_aXYZ macros in speedbin matching [13/15] - new patch

v2: https://lore.kernel.org/linux-arm-msm/20230214173145.2482651-1-konrad.dybcio@linaro.org/

v1 -> v2:
- Fix A630 values in [2/14]
- Fix [6/14] for GMU-equipped GPUs

Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/

This series concludes my couple-weeks-long suffering of figuring out
the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.

The GMU functionality is essentially emulated by parting out a
"GMU wrapper" region, which is essentially just a register space
within the GPU. It's modeled to be as similar to the actual GMU
as possible while staying as unnecessary as we can make it - there's
no IRQs, communicating with a microcontroller, no RPMh communication
etc. etc. I tried to reuse as much code as possible without making
a mess where every even line is used for GMU and every odd line is
used for GMU wrapper..

This series contains:
- plumbing for non-GMU operation, if-ing out GMU calls based on
  GMU presence
- GMU wrapper support
- A610 support (w/ speedbin)
- A619 support (w/ speedbin)
- couple of minor fixes and improvements
- VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
  A6xx)
- Enablement of opp interconnect properties

A619_holi works perfectly fine using the already-present A619 support
in mesa. A610 needs more work on that front, but can already replay
command traces captures on downstream.

NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
two occurences of 0x18 used in place of a register #define, as it's
supposed to be RBBM_GPR0_CNTL, but that will only be present after
mesa-side changes are merged and headers are synced from there.

Speedbin patches depend on:
https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (20):
      dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
      dt-bindings: display/msm/gmu: Add GMU wrapper
      drm/msm/adreno: Use adreno_is_revn for A690
      drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
      drm/msm/a6xx: Move force keepalive vote removal to a6xx_gmu_force_off()
      drm/msm/a6xx: Move a6xx_bus_clear_pending_transactions to a6xx_gpu
      drm/msm/a6xx: Improve a6xx_bus_clear_pending_transactions()
      drm/msm/a6xx: Add a helper for software-resetting the GPU
      drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
      drm/msm/a6xx: Extend and explain UBWC config
      drm/msm/a6xx: Move CX GMU power counter enablement to hw_init
      drm/msm/a6xx: Introduce GMU wrapper support
      drm/msm/adreno: Disable has_cached_coherent in GMU wrapper configurations
      drm/msm/a6xx: Add support for A619_holi
      drm/msm/a6xx: Add A610 support
      drm/msm/a6xx: Fix some A619 tunables
      drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
      drm/msm/a6xx: Use adreno_is_aXYZ macros in speedbin matching
      drm/msm/a6xx: Add A619_holi speedbin support
      drm/msm/a6xx: Add A610 speedbin support

 .../devicetree/bindings/display/msm/gmu.yaml       |  50 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |  61 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 128 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 512 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  36 +-
 10 files changed, 685 insertions(+), 147 deletions(-)
---
base-commit: 925294c9aa184801cc0a451b69a18dd0fe7d847d
change-id: 20230223-topic-gmuwrapper-b4fff5fd7789

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

