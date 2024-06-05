Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35DA8FD71E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD20710E7E6;
	Wed,  5 Jun 2024 20:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fjN2bmjq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8122C10E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:24 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a690c8e64bdso11299066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618222; x=1718223022; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YGczuZ2lWdVfE1piGkex5C9npOPV1bJTkT4lzcILbpk=;
 b=fjN2bmjqDtf0hfsAGnclsfvqXw4aSKQpKgwNBjrwqtm3yYo3jFrjEZDFIR3sjYellO
 LbLbMUpOv3LMlMcTqM1QP90PbcCvJG90KWp0ZLq2L2NcPAo/IToq5Kk4MbEiJfBGADlG
 1ve04v0L96OU/GzoVZfc5xJDSrxlnue9jwsLUiWhkWF/wN6GiG6LIJKqkxRSIyvrgFXr
 COPl3aI1Mh2KWYh4sb3QOkks5rh/mcOpmb7xew0E7ZCf3Xtar6igHHIfuUpTe+nZ3EBP
 y/WGdAzeZdGvpWdXydZsBZwn+ppVgnTkEm9fd1uzuEjR41n2p890aKp/Z5nVfRagyGEX
 d2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618222; x=1718223022;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YGczuZ2lWdVfE1piGkex5C9npOPV1bJTkT4lzcILbpk=;
 b=LJR/V02fxh09OWIspyYQUHfpcF0k+9U17fucA5BbqqnZkNURBdMy1ub5UUo7nnZ4Da
 8VMFgte+aPLjagmVtiUwGxFErYNBQCPmHMi5jDcE0pXG2fCxQF3DZqMuPisoEMH9FWcr
 FdKBF4tU+tWroLvQukIvgf/nSE7LnrZjKwqhzJsqAl5vgF/l1xoME6qH0JedYR2KwU4P
 m0WhICczKxlLAwXi8Ip+4AAwx1PEOTUBjRmCrBqvOnAkd/JrJCUCnYVvaDXgU6goc4xW
 hgu9r99Q1gsBpRmnJ71CWCotmp0b+Ypo5l/YuAqPx62f1xXCRjkdVgjr/eCCTkQc+YMl
 RZbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgdQFEN4C1BxDfFyUq2jT5isAHmwOCcs8vIgy+9PYB5BoolIFqbu6dYYxCfnK+MsyN41Jh15hYfsnebpIpHEpBVJAvgteAYFUXOy48EZEQ
X-Gm-Message-State: AOJu0YwVjzwmESZ9kQ2Jg4o8qi/LekHkUQ7tjtwsdRkOsYHKfiRGxCmf
 rQmJJjMbWG4iEbuWRd9j9nZeXoxhXPA8/cV2nMjzUVLQnz5aea/eBcK8XTvg4cI=
X-Google-Smtp-Source: AGHT+IFrCBrnkkLsecGW7l6vDIv7uQOZiW1K0q3pJY+cy9j4zxXAM/TcNHR+nEx9T8KHaN1eo6bC6w==
X-Received: by 2002:a50:875b:0:b0:57a:70fa:8875 with SMTP id
 4fb4d7f45d1cf-57a8bcc4aa9mr2438463a12.40.1717618222534; 
 Wed, 05 Jun 2024 13:10:22 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:22 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/7] Add SMEM-based speedbin matching
Date: Wed, 05 Jun 2024 22:10:13 +0200
Message-Id: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACXGYGYC/22NQQqDMBREryJ/3ZQkaJGueo8ixSSjfqiJJBJax
 Ls3Fbors3oD82ajhMhIdK02isicOPgC+lSRnXo/QrArTFrqWpaINSxsRZoxP9ICOMNetA6wTho
 MElSWS8TAr8N67wpPnNYQ38dJVt/252v++rISUlho015q3Sijbk/2fQznEEfq9n3/AOJYqwO3A
 AAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v3:
- Wrap the argument usage in new preprocessor macros in braces (Bjorn)
- Make the SOCINFO_FC_INT_MAX define inclusive, adjust .h and .c (Bjorn)
- Pick up rbs
- Rebase on next-20240605
- Drop the already-applied ("Avoid a nullptr dereference when speedbin
  setting fails")

Changes in v2:
- Separate moving existing and adding new defines
- Fix kerneldoc copypasta
- Remove some wrong comments and defines
- Remove assumed "max" values for PCs and external FCs
- Improve some commit messages
- Return -EOPNOTSUPP instead of -EINVAL when calling p/fcode getters
  on socinfo older than v16
- Drop pcode getters and evaluation (doesn't matter for Adreno on
  non-proto SoCs)
- Rework the speedbin logic to be hopefully saner
- Link to v1: https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org

---
Konrad Dybcio (7):
      soc: qcom: Move some socinfo defines to the header
      soc: qcom: smem: Add a feature code getter
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      drm/msm/adreno: Define A530 speed bins explicitly
      drm/msm/adreno: Redo the speedbin assignment
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

 arch/arm64/boot/dts/qcom/sm8550.dtsi       | 21 +++++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 54 -------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 12 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 84 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 11 ++--
 drivers/soc/qcom/smem.c                    | 33 ++++++++++++
 drivers/soc/qcom/socinfo.c                 |  8 ---
 include/linux/soc/qcom/smem.h              |  1 +
 include/linux/soc/qcom/socinfo.h           | 34 ++++++++++++
 10 files changed, 185 insertions(+), 107 deletions(-)
---
base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

