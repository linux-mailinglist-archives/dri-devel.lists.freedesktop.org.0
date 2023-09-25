Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 228DF7ADA64
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748E310E26B;
	Mon, 25 Sep 2023 14:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2E110E268
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 14:50:37 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso809236166b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695653436; x=1696258236; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVBQu+EOw1PmbAsM8MVxwLWNiPJx9g9J6r5rPkOJ17w=;
 b=psmLmQXTIb4kCzjcIPYFgGGKQb2ZpiG4ZjxR7PA1QEmlC3VyMW/VYy1EqZB0zkFmhc
 agGnZVT0IRXO/c9kYHSQewsTu0fdqQ77WVuGMT+Tjc9uHe7zvZv1ZeDGrVvgbl3AuHwn
 TbZTsYcVUoAa0R3phj2rWJTDVIZ3PZMuxWfdqAgJpo1K4ribXWMtHST0Rt2Tq0JblD1r
 aIAqkYY/ZJNKFcilqRnlgVu3O6XkEfr0QJkNQMr7Ct9cFxxTAeXqjm+LrM/5Ye2CicUk
 FMvMf5OcZ/MCFt+9KRa2RGWimKv907zwkAWw+MVC5hpcRCLp+ri2GJIYAH9hg1CYBCjA
 9czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695653436; x=1696258236;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVBQu+EOw1PmbAsM8MVxwLWNiPJx9g9J6r5rPkOJ17w=;
 b=rHr7LDEDp2W0SmIX+BosMBepJhtfnbdksVhgDu44ZGql3hqduXO7yr0/4bcAW33v9Q
 X7NVJZ94dmRKCeTVuf6lvr8XTjapIorqZ15nabQqF5anw+FPHsBL1iaSWwidFiHQQiH9
 B5fBYCFSjkD5nJClSTnuHPNEPYaxJH1d69jpabwv5ouCaNRaa7DKXntrAzNCTNV2fqgt
 RG8ebAj92n+nFeOfir2W49RItb6qJhx31LJo5Q2C+iRMx0jwJL9CyUxa1WqjuirhQlHR
 qGXBSLeUJ7be30cTnprg9oY0KZCUg4F4OCUjwknmspyLXnN82BFKHpo+p041i7kABLaE
 gK5w==
X-Gm-Message-State: AOJu0YzFGvT/knDbzFAqv00sZlGQAFB3mXCS+a/UcHySrY9cOYw8vzrk
 +255XyI2IGcuco1tpp1w/bxqBIF5b9K9G1CBwidPXg==
X-Google-Smtp-Source: AGHT+IE9443BXn2REe1XPTgU9v4rMrVtAhnLw6kYit08HxuWn5Ry3cZcTmUSKqXMy48JIHKYLqY/iw==
X-Received: by 2002:a17:906:1da1:b0:9ae:5367:fe90 with SMTP id
 u1-20020a1709061da100b009ae5367fe90mr6087091ejh.32.1695653435992; 
 Mon, 25 Sep 2023 07:50:35 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 07:50:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 00/10] A7xx support
Date: Mon, 25 Sep 2023 16:50:29 +0200
Message-Id: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADWeEWUC/4XNTQrCMBQE4KuUrI3kz8a68h4ikqYvbaBNSqKlI
 r27z+5EsMsZmG9eJEPykMmpeJEEk88+BgyHXUFsZ0IL1DeYiWBCslIc6T2O3lKj5/nWpGHIA+V
 COskaXVqnCe5qk4HWyQTb4TI8+h7LMYHz83p0uWLufL7H9Fx/J/5p/11MnDIsnFJVCcxyce59M
 CnuY2rJh5vkJiGRUACltrY2rmp+CLVJKCSOtQTFhK4Oln8Ry7K8AeNK3oZOAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=4385;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ibIEoOxfWVTx5P1fKNckEAMdts2RQ8B70gd0WPFTIjE=;
 b=UkDpg06Mc4h9t6H20rAAIW427Z8mCjVWLdqsqt/SHTUC5lEhBxFmMAhJvZtSb9eXFR9azByDu
 2VT5laa+lDHADiM5LIrcEpGmzWWbTp58SqUaBZrhamsofV7dwYCMpA+
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
Changes in v5:
- Rebase
- Link to v4: https://lore.kernel.org/all/20230628-topic-a7xx_drmmsm-v4-0-8b3e402795c1@linaro.org/

Changes in v4:
- Add missing bitops.h in patch 5 for arm32 compilation (Dmitry)
- Link to v3: https://lore.kernel.org/r/20230628-topic-a7xx_drmmsm-v3-0-4ee67ccbaf9d@linaro.org

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
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 199 +++++--
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
 14 files changed, 1073 insertions(+), 122 deletions(-)
---
base-commit: 8fff9184d1b5810dca5dd1a02726d4f844af88fc
change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

