Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F386D304F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 13:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F1B10E1E6;
	Sat,  1 Apr 2023 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663C610E1E6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Apr 2023 11:54:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g19so19113356lfr.9
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Apr 2023 04:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350088;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5QslPU0bn72iS1LMcL81r7OJHaoEq7yFVP8NXGm8ywA=;
 b=S0XMAxNBg2ZKsMOFeqYFGWeuDdC52ExqfS+sp2a03/8aK9vIZo6Fm67EJeghewN1d6
 bBgOa+DAxgcIn4xpNf6vGfAl6MmHLCTvxpDVSKovf1D8452oFWm7PkkoVOvE8i2BTET5
 nBCShoPJndr+qIYdQKY8XCEy01YQFEYZi9u71k3eb006rBjKmcxI08NHsudSycwzvSNo
 MzAk1Szq6qK/U3aO9sQ2u+zWFM4DEPoPkclFsyo6+ssN7vh8WyrOebHB5x9DB75DPQQW
 V2CW5Jgqb3gE2RUivdoOTHMVNAvzaRl5BcXqUIoofGhB8pjw2p9UKGpToIkma6gUFsNA
 Vgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350088;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QslPU0bn72iS1LMcL81r7OJHaoEq7yFVP8NXGm8ywA=;
 b=0HyjQiZVVOs5Zn8vIkq4mRlN96K7aSM4HgsvShEjdDH2JHYeIDqOa3DotkuSy4kSwo
 NHdi0Un7gDBy2IlGfWFBKzalIUoXy0RKcX0gsZ1stp5hA5JVcnsDwQsCUb630DNhMiUQ
 QtyGoAcLWB05cIQi9n0+YTFqbPh2iMGK6UIv1f4H2gJ1i8uQgvrT31gTp3awp5qg4gKp
 ShwaORGfC8qZJSrbnf/RwLeF4INSynqRiSK5iCPqmWmHAjXa83lOv4pAjxsnhli/Oug4
 PT1+HwVRUNBAyFnkzbWSWaNJhBu3zN2cbqfsOOHe065aoFSL008UcxvG6oHy/5xq07OT
 4oXQ==
X-Gm-Message-State: AAQBX9cxGI/oI9wYaA7VDcdN5sZrSl8CIAWsFBF1Q1CV0FdBwSNE0Z3x
 NRkknMRIYOIsngAmfeSVagEyvw==
X-Google-Smtp-Source: AKy350b37xk2JO00SBhOlckd60l8lwU+F/xlnDsBq925Uk1JA/zlB0zr5LL+qQCCaSh9krKfyraWag==
X-Received: by 2002:ac2:4ac2:0:b0:4ea:f5dd:8aa1 with SMTP id
 m2-20020ac24ac2000000b004eaf5dd8aa1mr7660217lfp.18.1680350088198; 
 Sat, 01 Apr 2023 04:54:48 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:54:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 00/15] GMU-less A6xx support (A610, A619_holi)
Date: Sat, 01 Apr 2023 13:54:37 +0200
Message-Id: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0bKGQC/4XNQQ7CIBQE0Ks0rMUglFJceQ/jAtpPS1KBfGrVm
 N5ddGdMdDmTzJsHyYAeMtlXD4Kw+OxjKKHZVKQbTRiA+r5kwhkXjHNB55h8R4fz5YomJUBqa+e
 cdL1SrSZlZk0GatGEbizDcJmmUiYE52/vn+Op5NHnOeL9fbuIV/vjYRGUUWlBSiNE0+70YfLBY
 NxGHMhLW+p/Ql0E0K0Cq3TPhPsS5D9BFsE6pWqrjWbcfAjruj4BPG6lFkoBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=8581;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+hG0oi13LNaN2RrmVir69vepeiToqQZ8Le99hRwIZ/0=;
 b=3Y975/Uo7qMu4CmdCyip67L+tlBihX7EeklGEdeLLkXvHCVKgscW1NGMQS2EC2lVWmvd1uLPZzn9
 dhNOXRm5C6ExgVR4MH7VS8gT55lA2j9sTntM1UrdEN5vFjSleiMU
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
Konrad Dybcio (15):
      drm/msm/adreno: adreno_gpu: Don't set OPP scaling clock w/ GMU
      dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
      dt-bindings: display/msm/gmu: Add GMU wrapper
      drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
      drm/msm/a6xx: Extend and explain UBWC config
      drm/msm/a6xx: Introduce GMU wrapper support
      drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  76 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 508 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  17 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  28 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  33 +-
 10 files changed, 688 insertions(+), 102 deletions(-)
---
base-commit: b5595a717f5b26d99ec94d038cb1cfaae319bd6e
change-id: 20230223-topic-gmuwrapper-b4fff5fd7789

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

