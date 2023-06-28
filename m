Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FE74197D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 22:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D258410E315;
	Wed, 28 Jun 2023 20:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FA110E315
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so82267e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984526; x=1690576526;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+wRQYdXn3x7iIszNaVENCFzwMuf2uBkWw5PZau30MuI=;
 b=RiFTPc7UsojgzUuT8i+bbCX1wYS/u2oYh0TjpifxhtmQxHaCoH58VnyiQ6UyX6ETIE
 ZxJlLgetRmZ2IYsy4/SNeN9nEhRlD5nOnTbppfE2yadro6mJITmJr0ijrF4A0YB/jdTq
 tPWzgSW49ubQ0xMU8Ky1dFwKagKA7D5MGEkZmmcirr+eJL4boES/GmnKzV+qh0GtrRZr
 RbPAVoMdKG65cbFqWKSWgoKNIlM1oLlj1U+cu0c6bPRR60agw64xf6QiyFnmsUFBnEwu
 bfS2WiERtuAQvTH4/HZNble2AdUqn/Vc2/nfJdFPZ/v5BmuKxTA2EDYyTqBfDUzAqzr0
 rhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984526; x=1690576526;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+wRQYdXn3x7iIszNaVENCFzwMuf2uBkWw5PZau30MuI=;
 b=JIalm/Z/pPLnqkAh/B+Az8PJHwVLMQ34kbIZhLsRe5C3U+xc/PJ7tyweR+qV45LSn0
 nrp3fln+BOgE5J5KoPqQTXp1Vmi2tRSrHieETX9S3wmjIOrJZLPAym9mkDl2JDHRxQmg
 9O8ni6tUB4VF/zmc7FUNYL/MyNhLk7j2stJa0IH7pZER4VsdEOf/Mk79RQlY1pIdCqz5
 schFDOID6NVrhtUWcQj0H4JgjwJBLJ9k/GgodTug0ZNLM0YQSyndIaq8Zw4qTUFScmpn
 9pQUtlUUfd5KmjF9pErzBrzeKtK17csv5i91Im8BLn3RgWy8rnsouz2WwfT5FlOWj3x+
 UVVQ==
X-Gm-Message-State: AC+VfDxIpiIozUJNT3trXvLZQzVytyyoWd9XBPwnVHtb6agY6ZW91Ofo
 oEpdw/T+A1rtSqCGR4w+CvDmWg==
X-Google-Smtp-Source: ACHHUZ4S7zlUew/DrF2BCfNDFKw1yLf33etTDm+4V2SeTYD2znuosgGBEs30tSa6rP3t8JMlUMFzcg==
X-Received: by 2002:a05:6512:ea7:b0:4f4:c6ab:f119 with SMTP id
 bi39-20020a0565120ea700b004f4c6abf119mr27288580lfb.64.1687984526179; 
 Wed, 28 Jun 2023 13:35:26 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 00/14] A7xx support
Date: Wed, 28 Jun 2023 22:35:00 +0200
Message-Id: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHSZnGQC/x2N0QrDIAwAf6XkeQGrUMd+ZYxhNa6BakuyDaH03
 yd7vIPjDlASJoXbcIDQl5W32mG8DBCXUF+EnDqDNdaZyV7xve0cMfjWnklK0YKjddmZ5KeYPfR
 uDko4S6hx6WX9rGuXu1Dm9h/dH+f5A4Pr46t4AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=3802;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Z7jlwfWNBT9lUj5uikuMSfyXKZlfykMWYJqb93QRUjU=;
 b=Q9rGg7Lhf4vvAUnJ5JxpZ6ePIoqS150jNswvaYQhFXC6Ahuv7pG7/pAt5+m37hrpvjgkiuh9d
 qc1sm3bLa18AyDZyFvwwgOJPi2swBJyqfTXz6ChV8R0YYgND10NVwq+
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series attempts to introduce Adreno 700 support (with A730 and A740
found on SM8450 and SM8550 respectively), reusing much of the existing
A6xx code. This submission largely lays the groundwork for expansion and
more or less gives us feature parity (on the kernel side, that is) with
existing A6xx parts.

On top of introducing a very messy set of three (!) separate and
obfuscated deivce identifiers for each 7xx part, this generation
introduces very sophisticated hardware multi-threading and (on some SKUs)
hardware ray-tracing (not supported yet).

After this series, a long-overdue cleanup of drm/msm/adreno is planned
in preparation for adding more features and removing some hardcoding.

The last patch is a hack that may or may not be necessary depending
on your board's humour.. eh.. :/

Developed atop (and hence depends on) [1]

The corresponding devicetree patches are initially available at [2] and
will be posted after this series gets merged. To test it, you'll also need
firmware that you need to obtain from your board (there's none with a
redistributable license, sorry..). Most likely it will be in one of
these directories on your stock android installation:

* /vendor/firmware
* /vendor/firmware_mnt
* /system

..but some vendors make it hard and you have to do some grepping ;)

Requires [3] to work on the userspace side. You'll almost cerainly want
to test it alongside Zink with a lot of debug flags (early impl), like:

TU_DEBUG=sysmem,nolrz,flushall,noubwc MESA_LOADER_DRIVER_OVERRIDE=zink kmscube

[1] https://lore.kernel.org/linux-arm-msm/20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org/
[2] https://github.com/SoMainline/linux/commits/topic/a7xx_dt
[3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23217

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (14):
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Introduce a6xx_llc_read
      drm/msm/a6xx: Move LLC accessors to the common header
      drm/msm/a6xx: Bail out early if setting GPU OOB fails
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Vastly increase HFI timeout
      [RFC] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init

 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 188 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 658 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  15 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  90 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  26 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  24 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 15 files changed, 1070 insertions(+), 124 deletions(-)
---
base-commit: 6f9b660e9cbb30669fcfec83288d527c0844717d
change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

