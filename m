Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4844774C02
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 23:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBCC10E0F6;
	Tue,  8 Aug 2023 21:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981E610E0F9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 21:02:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9cf2b1309so3263731fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Aug 2023 14:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528568; x=1692133368;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3P34b/1ma59FLttG1cQJqYU6A3Cv7kli+dnFU1B7pgw=;
 b=SvILppwzHI+9Ubi5q64fEItmP2yIkds1QdhCpbBlvFNhQzLstXUavt86288C4GEyBK
 rn5WmEo5R6YtwM8F+i1Q+qOJkxcMxHmVafcb6//Ztb7vExgr6jtrj9/kL3RfFA9SrVI/
 veNjg4F9psz1PXD4JGEY67UBuEwQCkNY7c0OHD+IU4hPOw6NfrInszz4s+ZnDkQnAB7I
 b87442JKlQiyWdH5Zg4q8YgzkUmxUW2gIXX8RGhQ13t5W4llS28E/yvK8X1PGtE7V7Bu
 CNCd32oYEPdNi/2xTTN3z/FLl9+VsByE3RfN5wlklVBSJoLTF1+pScpVZyxhOzXDtip1
 9/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528568; x=1692133368;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3P34b/1ma59FLttG1cQJqYU6A3Cv7kli+dnFU1B7pgw=;
 b=LwV6MZe+xhG1WOJxgP4XPSYUtBwuINmUL8QrMGJlVyHYxpvVUFoxyFvtAlKG8wisDV
 i+hsgRrpxywZ3MVhHQkjsWLJx7hbcDlZ/8DyfWp2xAQxTSPRV1u10iH9bqXGo16K+3vn
 ZhnF5PJEtUO/Wq9vxA9x7vud946VyJf0+y0y3sc2OkLpusw613A1e/Y8AN2WHI13hlff
 uvN6TX7Jx7sFRdz3EVZgtL7Viszy/gomoghkz+V/dlVzYx9PRUE+017k0yecYwirFMi0
 vKR1Osi5vjMWLX8HsDTOxVtgR8AApvq/dRPYLhDJrJpXjT0Vn7nEo7gSqPoYLguTOKTR
 d3Tw==
X-Gm-Message-State: AOJu0Yy67sFhdz3lgOpdlz33oT0BR3CMmYgb4rTS8C3pwmWXE6Qb2evS
 VjL2pYvU+doKSZwWpZDC9iUmoA==
X-Google-Smtp-Source: AGHT+IGHL7VCZl32wqCp2jnfDoOO0FgloZVtld9xzhtXOZv99HywIwA5QJc20hltfUJx2vGx0SoAhA==
X-Received: by 2002:a2e:96d6:0:b0:2b6:cb3f:97e2 with SMTP id
 d22-20020a2e96d6000000b002b6cb3f97e2mr340774ljj.16.1691528568465; 
 Tue, 08 Aug 2023 14:02:48 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:02:47 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 00/14] A7xx support
Date: Tue, 08 Aug 2023 23:02:38 +0200
Message-Id: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6t0mQC/32NQQqDMBAAvyI5NyWJom1P/qNIiXGjC5rIxopF/
 Hu3PqDHGRhmFwkIIYlHtguCFRPGwGAumXCDDT1I7JiFUSZXpbnJJc7opK227dXRNKVJapP7XHV
 V6XwluGttAtmSDW7gMrzHkeVM4HE7R8+GecC0RPqc31X/7L/FqqVi4YviXoJy2tQjBkvxGqkXz
 XEcX/7jt0vIAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=4016;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=28tVoyoZGi5ChYeTjClZPV9YNYzKToRLj0C2cpckT8w=;
 b=RgpQP0zsl9mFXTKGli673/415ZK5uFGxg3V/njRZPs5d6JltKmhZpln3HGk20bN8dwDnBAlzi
 E0GHwdH9KFCC0pEWDcBu8GuAaPMvE/TrGIsCvTwVCALH/HsP/+fbPIf
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
Changes in v2:
- Rebase on chipid changes
- Reuse existing description for qcom,aoss in patch 2
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org

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
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init

 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 204 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 667 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  15 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  90 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  30 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  28 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 15 files changed, 1094 insertions(+), 133 deletions(-)
---
base-commit: b30de2c05cf2166f4e2c68850efc8dcea1c89780
change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

