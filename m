Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDAC717FAF
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6DA10E4B3;
	Wed, 31 May 2023 12:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CCF10E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:15:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2af24ee004dso59633371fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 05:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685535298; x=1688127298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZI9EijwDgNgG5YKZAyyFoow2CWVs6k+f06gFywwNGvo=;
 b=g/9/fqrs6GmSpWh/XsyQrFm1pySlpWi/3fdu0YMZC6JqX7az2w11dTVxIDuRXyt1n5
 HMmqTqTGXIPzRWkXtKUOWCE3GBwTwcp7EKlydRhMJIFlUpaf7gZpNzWuRjVG/jFRlTof
 yOIgXTdGcVjdYmLPHt5cWAMZmtUZaSG3ckEl5XWTOTYEdsnaw1iEETU/Q88jMQIcfSHz
 hOW5ASLuKJ1ibHnTG5sIGDijRiJhCM2URrAsI7W0VSoCncgB4NDI2vnJPESOXr7KPztn
 xS1B9RwvC5PamqYmzE/H1KxrFiPoQMzFThfFnx5C2I37SIWux04STvthyxoJVNAcbkfS
 1Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685535298; x=1688127298;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZI9EijwDgNgG5YKZAyyFoow2CWVs6k+f06gFywwNGvo=;
 b=NFbTToY1rgPLrHSZjb2NPsh68c2kvMBAE1T/jvXw5lvvQaeP/jpxjC/MVeYB8/+C/S
 EouHiulMxyBT1Wj4W2vYYuzBgfWI1dl1H+hVsZFUdwOseUdjx7Hl3pJ9vixTrmCqjNgt
 Rz3bfTBhrJ/iIO7SUZpQgda3TxdFXp/1pZbKDivOyJvQzo9zEndZ7mO/Jvi/D9KABs6S
 TZGCdwoRR2kz4ON2JTn64UKz1Jg/STZcxX1kYqXQF/W20uIrmc2RWmC8+ABYTDUi/LYd
 WdXSZPHy4WjTciVVKRYVvuRQ1/bofNX6/CCzgjobq4weqsGEiEHbHV3S+BjfSrdDp0KL
 MHFw==
X-Gm-Message-State: AC+VfDypHkKPLljYsXGZfzwcwjinDi3MqYnKOtddOKnO+0Uxdi1x3bs3
 9SouEuZqHw9u5vdv4v9bTRImvg==
X-Google-Smtp-Source: ACHHUZ5jP7oZpzeqaGKjMXsU/57mZttXxhn4DkK0+jpRVETqs65hO54oRo3ZaatfVO6ZzTIKmqEPFA==
X-Received: by 2002:a2e:9b82:0:b0:2b0:2976:172d with SMTP id
 z2-20020a2e9b82000000b002b02976172dmr2797670lji.9.1685535297960; 
 Wed, 31 May 2023 05:14:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a2e9808000000b002ad9f224bfasm3292431ljj.51.2023.05.31.05.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 05:14:57 -0700 (PDT)
Message-ID: <19abbd36-3d68-bca7-465a-7c084b4e6434@linaro.org>
Date: Wed, 31 May 2023 14:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 00/18] GMU-less A6xx support (A610, A619_holi)
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Conor Dooley <conor+dt@kernel.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.05.2023 15:52, Konrad Dybcio wrote:
> v7 -> v8:
> - Fix up resume/suspend (icc now correctly parks to 0, don't abuse
>   OPP & genpd throughout system-wide suspend)
> - Don't handle ebi1_clk separately, the bulk ops handle it just fine
> - Rebase on next-20230525 (no meaningful changes)
Krzysztof pointed out to me in private that he has previously
reviewed the dt-bindings patches, but I managed to drop them by
accident.. I'll fix that in the next revision. I'll wait for more
comments before resending though.

Konrad

> 
> v7: https://lore.kernel.org/linux-arm-msm/20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org/
> 
> v6 -> v7:
> - Rebase on next-20230519 (A640/650 speedbin merged already)
> 
> - separate out the .get_timestamp cb for gmu wrapper
> 
> - check for gmu presence inside a6xx_llc_slices_(init|destroy) instead
>   of before calling them
> 
> - use REG_A6XX_RBBM_GPR0_CNTL instead of literal 0x18
> 
> - move a6xx_bus_clear_pending_transactions to a6xx_gpu, clean it up
>   and reuse it for gmu wrapper gpus
> 
> - drop clearing RBBM_GBIF (GBIF from GX's POV) as part of draining the
>   buses, it's not necessary
> 
> - introduce a helper for gpu softreset
> 
> - sw-reset the gmu wrapper GPUS *after* draining GBIF and only reset
>   it if it's hung
> 
> - reword the commit message in "Remove both GBIF and RBBM GBIF halt
>   on hw init" and move it before gmu wrapper-specific changes
> 
> - drop set_rate logic from a6xx_pm_suspend as the clock simply gets
>   disabled and we don't have to worry about scaling problems as OPP
>   and devfreq take care of that, validated with debugcc
> 
> - drop a level of indentation in _a6xx_check_idle() to hopefully
>   improve readability
> 
> - check for !a610 instead of gmu_wrapper||a619_holi in sptprac cc
>   toggling in a6xx_set_hwcg()
> 
> - pick up krzk's rb on bindings
> 
> All external dependencies have been merged since the last revision.
> 
> v6: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org
> 
> v5 -> v6:
> - Rebase on 8ead96783163 ("drm/msm/gpu: Move BO allocation out of hw_init")
>   (Add .ucode_load to funcs_gmuwrapper)
> - Drop A6[45]0 speedbin deps, merged into msm-next
> 
> Dependencies:
> - https://lore.kernel.org/linux-arm-msm/20230330231517.2747024-1-konrad.dybcio@linaro.org/ (to work properly)
> 
> v5: https://lore.kernel.org/linux-arm-msm/20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org/
> 
> v4 -> v5:
> - Add a newline before the new allOf:if: [3/15]
> - Enforce 6 clocks on A619_holi/A610 [2/15]
> - Pick up tags
> - Improve error handling in a6xx_pm_resume [6/15]
> - Add patch [1/15] (fix an existing issue) which can be picked
>   separately and account for it in [6/15]
> - Rebase atop Akhil's CX shutdown patches and incorporate analogous logic
> - Fix a regression introduced in v3 that made the fw loader expect
>   GMU fw on GMU wrapper GPUs
> 
> Dependencies:
> - https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/ (to apply)
> - https://lore.kernel.org/linux-arm-msm/20230330231517.2747024-1-konrad.dybcio@linaro.org/ (to work properly)
> 
> v4: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org
> 
> v3 -> v4:
> - Drop the mistakengly-included and wrong A3xx-A5xx bindings changes
> - Improve bindings commit messages to better explain what GMU Wrapper is
> - Drop the A680 highest bank bit value adjustment patch
> - Sort UBWC config variables in a reverse-Christmass-tree fashion [4/14]
> - Don't alter any UBWC config values in [4/14]
>   - Do so for a619_holi in [8/14]
> - Rebase on next-20230314 (shouldn't matter at all)
> 
> v3: https://lore.kernel.org/r/20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org
> 
> v2 -> v3:
> New dependencies:
> - https://lore.kernel.org/linux-arm-msm/20230223-topic-opp-v3-0-5f22163cd1df@linaro.org/T/#t
> - https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/
> 
> Sidenote: A speedbin rework is in progress, the of_machine_is_compatible
> calls in A619_holi are ugly (but well, necessary..) but they'll be
> replaced with socid matching in this or the next kernel cycle.
> 
> Due to the new way of identifying GMU wrapper GPUs, configuring 6350
> to use wrapper would cause the wrong fuse values to be checked, but that
> will be solved by the conversion + the ultimate goal is to use the GMU
> whenever possible with the wrapper left for GMU-less Adrenos and early
> bringup debugging of GMU-equipped ones.
> 
> - Ship dt-bindings in this series as we're referencing the compatible now
> 
> - "De-staticize" -> "remove static keyword" [3/15]
> 
> - Track down all the values in [4/15]
> 
> - Add many comments and explanations in [4/15]
> 
> - Fix possible return-before-mutex-unlock [5/15]
> 
> - Explain the GMU wrapper a bit more in the commit msg [5/15]
> 
> - Separate out pm_resume/suspend for GMU-wrapper GPUs to make things
>   cleaner [5/15]
> 
> - Don't check if `info` exists, it has to at this point [5/15]
> 
> - Assign gpu->info early and clean up following if statements in
>   a6xx_gpu_init [5/15]
> 
> - Determine whether we use GMU wrapper based on the GMU compatible
>   instead of a quirk [5/15]
> 
> - Use a struct field to annotate whether we're using gmu wrapper so
>   that it can be assigned at runtime (turns out a619 holi-ness cannot
>   be determined by patchid + that will make it easier to test out GMU
>   GPUs without actually turning on the GMU if anybody wants to do so)
>   [5/15]
> 
> - Unconditionally hook up gx to the gmu wrapper (otherwise our gpu
>   will not get power) [5/15]
> 
> - Don't check for gx domain presence in gmu_wrapper paths, it's
>   guaranteed [5/15]
> 
> - Use opp set rate in the gmuwrapper suspend path [5/15]
> 
> - Call opp functions on the GPU device and not on the DRM device of
>   mdp4/5/DPU1 half the time (WHOOOOPS!) [5/15]
> 
> - Disable the memory clock in a6xx_pm_suspend instead of enabling it
>   (moderate oops) [5/15]
> 
> - Call the forgotten clk_bulk_disable_unprepare in a6xx_pm_suspend [5/15]
> 
> - Set rate to FMIN (a6xx really doesn't like rate=0 + that's what
>   msm-5.x does anyway) before disabling core clock [5/15]
> 
> - pm_runtime_get_sync -> pm_runtime_resume_and_get [5/15]
> 
> - Don't annotate no cached BO support with a quirk, as A619_holi is
>   merged into the A619 entry in the big const struct - this means
>   that all GPUs operating in gmu wrapper configuration will be
>   implicitly treated as if they didn't have this feature [7/15]
> 
> - Drop OPP rate & icc related patches, they're a part of a separate
>   series now; rebase on it
> 
> - Clean up extra parentheses [8/15]
> 
> - Identify A619_holi by checking the compatible of its GMU instead
>   of patchlevel [8/15]
> 
> - Drop "Fix up A6XX protected registers" - unnecessary, Rob will add
>   a comment explaining why
> 
> - Fix existing UBWC values for A680, new patch [10/15]
> 
> - Use adreno_is_aXYZ macros in speedbin matching [13/15] - new patch
> 
> v2: https://lore.kernel.org/linux-arm-msm/20230214173145.2482651-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> - Fix A630 values in [2/14]
> - Fix [6/14] for GMU-equipped GPUs
> 
> Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/
> 
> This series concludes my couple-weeks-long suffering of figuring out
> the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.
> 
> The GMU functionality is essentially emulated by parting out a
> "GMU wrapper" region, which is essentially just a register space
> within the GPU. It's modeled to be as similar to the actual GMU
> as possible while staying as unnecessary as we can make it - there's
> no IRQs, communicating with a microcontroller, no RPMh communication
> etc. etc. I tried to reuse as much code as possible without making
> a mess where every even line is used for GMU and every odd line is
> used for GMU wrapper..
> 
> This series contains:
> - plumbing for non-GMU operation, if-ing out GMU calls based on
>   GMU presence
> - GMU wrapper support
> - A610 support (w/ speedbin)
> - A619 support (w/ speedbin)
> - couple of minor fixes and improvements
> - VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
>   A6xx)
> - Enablement of opp interconnect properties
> 
> A619_holi works perfectly fine using the already-present A619 support
> in mesa. A610 needs more work on that front, but can already replay
> command traces captures on downstream.
> 
> NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
> two occurences of 0x18 used in place of a register #define, as it's
> supposed to be RBBM_GPR0_CNTL, but that will only be present after
> mesa-side changes are merged and headers are synced from there.
> 
> Speedbin patches depend on:
> https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (18):
>       dt-bindings: display/msm: gpu: Document GMU wrapper-equipped A6xx
>       dt-bindings: display/msm/gmu: Add GMU wrapper
>       drm/msm/a6xx: Remove static keyword from sptprac en/disable functions
>       drm/msm/a6xx: Move force keepalive vote removal to a6xx_gmu_force_off()
>       drm/msm/a6xx: Move a6xx_bus_clear_pending_transactions to a6xx_gpu
>       drm/msm/a6xx: Improve a6xx_bus_clear_pending_transactions()
>       drm/msm/a6xx: Add a helper for software-resetting the GPU
>       drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
>       drm/msm/a6xx: Extend and explain UBWC config
>       drm/msm/a6xx: Introduce GMU wrapper support
>       drm/msm/adreno: Disable has_cached_coherent in GMU wrapper configurations
>       drm/msm/a6xx: Add support for A619_holi
>       drm/msm/a6xx: Add A610 support
>       drm/msm/a6xx: Fix some A619 tunables
>       drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
>       drm/msm/a6xx: Use adreno_is_aXYZ macros in speedbin matching
>       drm/msm/a6xx: Add A619_holi speedbin support
>       drm/msm/a6xx: Add A610 speedbin support
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  50 +-
>  .../devicetree/bindings/display/msm/gpu.yaml       |  61 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 122 +++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 512 ++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   4 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |  17 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   8 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  33 +-
>  10 files changed, 686 insertions(+), 137 deletions(-)
> ---
> base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
> change-id: 20230223-topic-gmuwrapper-b4fff5fd7789
> 
> Best regards,
