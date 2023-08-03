Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB276E38D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C2110E5D6;
	Thu,  3 Aug 2023 08:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA210E5D9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:48:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so1221226e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691052485; x=1691657285;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2/hdxh3xj6iR4Yykv7Dt+Q7h/174Nys/IxjYgXNUnVA=;
 b=raY2Go5vuMFc5/QctA0YSLUQfciPAf69VmtKHUgoDQgoDMgllytied97OkQyodbuFH
 WnuF5FtIu+mEvtDjgQOII/EPcaYPFO+DIpEIoOQf+tPB4ELKZK3KRffieZB7STmoID9J
 oaAobXQhjz3bhLHfh940OTRpowIEG1A9uUutgFIG60UoB3AYaijRERQ5si6ATqcz6yWY
 RLfxHfMladH/225xS2vBh/cuwkn00q5AJ5d7Cp64ZG6eZm2Dpdin76rBw22afBUFLqSQ
 myp8Dhf7pQbaRNjh24Se+Z/Kogxgeh0FFHSeEzuWatwJ1ngDyFlFx7JrD9fNO2dV4q29
 yfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691052485; x=1691657285;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/hdxh3xj6iR4Yykv7Dt+Q7h/174Nys/IxjYgXNUnVA=;
 b=jj4y9NbCah/RVisSy4hrmsqUU5BYVL3Bta08WbUy26/KlhB8gLtauo8eLTUUmw7/BX
 8qEz7XZ6N6xOq3x+Oh2Sxc2fDw1hQGC1rkrZQ0BdSAVWDO7E50pzuOxD/6eu33A09P1R
 uwsaCS6GOb9NoxDa7Ug1Svv6j9XlqsDGZZhKnHWLWcsYILd0s73PQ8u7irYhFrU+dL+y
 mAgM3qAwdkUOq/BfEQ4VMHQfwh9WoQVR+iC7hsUfGz7CzARLz3f1yTRBMsAXEP0q8naj
 233mQnrYol2/iyeYhWupeSfkvgn2NUcrFC3BVGd8dFwyvWQMBDKC/PqHR3K430kPX8w+
 3Hdw==
X-Gm-Message-State: ABy/qLaKCRW2pRnbrxLVtIlxZ3raVzWh88gbwEooxvXJqQjY1l9+Kde6
 KzP/zI+BCZSaAng+/XjlJZTCBw==
X-Google-Smtp-Source: APBJJlG1TSXmbhUXV6vd3PGIBBYcghGyWllyDz062a86gUJzBx9qMnh2oD2yAfzL++WwiCd4hkhqKw==
X-Received: by 2002:ac2:518a:0:b0:4fb:9497:b2a5 with SMTP id
 u10-20020ac2518a000000b004fb9497b2a5mr5653512lfi.21.1691052485036; 
 Thu, 03 Aug 2023 01:48:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8656:583:d034:d966?
 ([2a01:e0a:982:cbb0:8656:583:d034:d966])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a5d55d1000000b003143be36d99sm21265332wrw.58.2023.08.03.01.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Aug 2023 01:48:04 -0700 (PDT)
Message-ID: <5aab1846-5d3c-7010-56ca-556db1f74e92@linaro.org>
Date: Thu, 3 Aug 2023 10:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/14] A7xx support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2023 22:35, Konrad Dybcio wrote:
> This series attempts to introduce Adreno 700 support (with A730 and A740
> found on SM8450 and SM8550 respectively), reusing much of the existing
> A6xx code. This submission largely lays the groundwork for expansion and
> more or less gives us feature parity (on the kernel side, that is) with
> existing A6xx parts.
> 
> On top of introducing a very messy set of three (!) separate and
> obfuscated deivce identifiers for each 7xx part, this generation
> introduces very sophisticated hardware multi-threading and (on some SKUs)
> hardware ray-tracing (not supported yet).
> 
> After this series, a long-overdue cleanup of drm/msm/adreno is planned
> in preparation for adding more features and removing some hardcoding.
> 
> The last patch is a hack that may or may not be necessary depending
> on your board's humour.. eh.. :/
> 
> Developed atop (and hence depends on) [1]
> 
> The corresponding devicetree patches are initially available at [2] and
> will be posted after this series gets merged. To test it, you'll also need
> firmware that you need to obtain from your board (there's none with a
> redistributable license, sorry..). Most likely it will be in one of
> these directories on your stock android installation:
> 
> * /vendor/firmware
> * /vendor/firmware_mnt
> * /system
> 
> ..but some vendors make it hard and you have to do some grepping ;)
> 
> Requires [3] to work on the userspace side. You'll almost cerainly want
> to test it alongside Zink with a lot of debug flags (early impl), like:
> 
> TU_DEBUG=sysmem,nolrz,flushall,noubwc MESA_LOADER_DRIVER_OVERRIDE=zink kmscube
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org/
> [2] https://github.com/SoMainline/linux/commits/topic/a7xx_dt
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23217
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (14):
>        dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
>        dt-bindings: display/msm/gmu: Allow passing QMP handle
>        dt-bindings: display/msm/gpu: Allow A7xx SKUs
>        drm/msm/a6xx: Add missing regs for A7XX
>        drm/msm/a6xx: Introduce a6xx_llc_read
>        drm/msm/a6xx: Move LLC accessors to the common header
>        drm/msm/a6xx: Bail out early if setting GPU OOB fails
>        drm/msm/a6xx: Add skeleton A7xx support
>        drm/msm/a6xx: Send ACD state to QMP at GMU resume
>        drm/msm/a6xx: Mostly implement A7xx gpu_state
>        drm/msm/a6xx: Add A730 support
>        drm/msm/a6xx: Add A740 support
>        drm/msm/a6xx: Vastly increase HFI timeout
>        [RFC] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
> 
>   .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
>   .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
>   drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 188 ++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 658 ++++++++++++++++++---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  15 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  90 ++-
>   drivers/gpu/drm/msm/adreno/adreno_device.c         |  26 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  24 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
>   15 files changed, 1070 insertions(+), 124 deletions(-)
> ---
> base-commit: 6f9b660e9cbb30669fcfec83288d527c0844717d
> change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
