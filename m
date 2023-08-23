Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CDE785840
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 14:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0E510E426;
	Wed, 23 Aug 2023 12:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2FE10E423
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 12:56:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so33049901fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 05:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692795361; x=1693400161;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oqJeHpeX/4m5NxynYAumdAwjnVZQoGDC/Sl39nPHglI=;
 b=ZCMHLOIX2pQY8hVPp//5SGcXKK7dF2GxOtqphy8JJbl9yjsoZzNYw+NPKtVgLILYes
 T5ALtgTL70OH0DekGKVkfoN0A/pWI9sgdgjD+E5cpVjK0+aqsrI4wCZoz8PUm0MyfQqf
 7j29v1GHHiKjkDJtsDx0XSDwxvbEqI8hAwMH5EZG9XyOZTg434ZtBNlW23iKZmOL+K4a
 Ispr/DeN18IMerhn2kuJpeOIEJmhG3RmO0TqqYqUF/d9WVmaQ1zRoBTJkaZ1lqGxSDJM
 qKHoZ82wxU7uk6yujcWMUI3Xy9UtA2by4oSbXUUO36Qo6U7wz9vglJrdYVktNo1iyyDR
 3CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692795361; x=1693400161;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oqJeHpeX/4m5NxynYAumdAwjnVZQoGDC/Sl39nPHglI=;
 b=kyb1KpGbl96FJAmcehdx0474RhDx4+qYNd82i/HBCPY4PQIFhbl4k7hJaNEB3YQ+HE
 VVX7wbgPrp+XcI+wN9n4hQJ2OB/LpnkCJYv5V2mia9aOltzArdOjhUMvk3ZYQdHSvcM2
 MvYk2bdl4XTXTnN5DFVquht7bMwyIYnKWZNmHQDGS8KvG8RWd2QtfgQyo4QOJI6G+Dce
 EL3ypO027pFMOE2fhSKtZiCYwf9vhaYmfS1F2j7xSVfmefzJ4CIwFBJl/Uok+YxYdSTr
 kRzGZTG9n2n5FmJYJ49hPyd+QX11l9agBsGwDc7Yawot/2GDLQO2Mrgn9nCWoJEo9Paz
 x2ig==
X-Gm-Message-State: AOJu0Yy/vfnk1o6rlht51+rM5jWvWEOE9M8tqGXNxBVaFsftWOO9bl0H
 zXcNZ9UPdA0mH1FR0nM1xVgw4A==
X-Google-Smtp-Source: AGHT+IHwNrUI3VbaCReiY6q33DuTK2TQeY+Uz2VFt8Z8kRQ5HOimymlhi+B/px2Ye6SkjwnqEXHmvQ==
X-Received: by 2002:a2e:3503:0:b0:2bc:b75e:b88 with SMTP id
 z3-20020a2e3503000000b002bcb75e0b88mr8075729ljz.18.1692795360226; 
 Wed, 23 Aug 2023 05:56:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj76.neoplus.adsl.tpnet.pl. [83.9.29.76])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c011200b002b6db0ed72fsm3220256ljb.48.2023.08.23.05.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 05:55:59 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 00/10] A7xx support
Date: Wed, 23 Aug 2023 14:55:53 +0200
Message-Id: <20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANkB5mQC/32NWwqDMBAAr1Ly3ZQ8RNt+9R5FSowbXdBENlYs4
 t279QD9nIFhNpGBELK4nzZBsGDGFBns+SR872IHEltmYZSxqjRXOacJvXTVur5aGsc8Sm1ssKq
 tSh8qwV3jMsiGXPQ9l/E9DCwngoDrMXrWzD3mOdHn+C76Z/8tFi0Vi1AUtxKU1+YxYHSULok6U
 e/7/gWjU6wRyAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692795358; l=4076;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1C4mbkYEO8JAVDJ8cizgufp3TfvEPNQ4yZ8RIY8Lh1o=;
 b=M16HvvoVRE7y0ktf2CwMlRTO8Y99aYa9zyrtbWT0qgSvGyCUlsrGe+fP7cnfmh0r5Lq/gB1Bb
 bS0Y1JJ08IfD4HSxbd7N/sZ3Y1CmEtFgC8jzK34qS9atf5cUc2CFNyK
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Changes in v3:
- Pick up tags
- Drop "increase HFI timeout", will revisit another day
- Use family identifiers in "add skeleton a7xx support"
- Drop patches that Rob already picked up
- Retest on A730, didn't explode
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org/#t

Changes in v2:
- Rebase on chipid changes
- Reuse existing description for qcom,aoss in patch 2
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org

---
Konrad Dybcio (10):
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init

 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 204 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 653 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  88 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  30 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  32 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 14 files changed, 1078 insertions(+), 122 deletions(-)
---
base-commit: c26a0f88bc21bf52303b5a5fbf8edb0cc7723037
change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

