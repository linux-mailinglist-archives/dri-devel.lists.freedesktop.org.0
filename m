Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B5E899822
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27AA113A84;
	Fri,  5 Apr 2024 08:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KfeNaLeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A820410ECEA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 08:41:34 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so24392211fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712306493; x=1712911293; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UyVwl4wcBTL0fm1jyJbjKCwTiFZAq4OiQvDMf4uImBs=;
 b=KfeNaLeIFRzMFp7eKfypewZ6jodzETHpYjemXNArvPjHpwoBYKUuudEGjmMaLZs413
 6tm+p66axXFHsJzRW1PliPrZVPa7Mmd3oigBslHwomQ+TppIytlh4G+mK9H5S+Q25jzr
 EawLcqUj/By+pahZYzQKhW48JnWikwOyh0+FLbbIbzO4Kk3R+EAywHIg7/naLLfDaH1j
 MMOcthg26FnhdGm9N/qRvkdm7dM1o/YF1wY7x8ch+ooq8Y0g3t3pOXSSs8H3oEl3HWnW
 YX6G7U3K3iC4dzq2CtID3Vyveel7QXM+sGc9QllIUeurfJkXawVvE2sSj90M69jLwdW4
 V+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712306493; x=1712911293;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UyVwl4wcBTL0fm1jyJbjKCwTiFZAq4OiQvDMf4uImBs=;
 b=L+O5Aim37Roo53bl/PFwIXhtdz4Td5GcBJQxNkxDRcfdeFw3RsSj0K05fQuxOlAsjM
 yBI0dyuC3gjUBoax2AziDJYyXIbv1PnHnDWzhVrwICe11bQj17Iazx1OG04s3UAiKfoL
 e1/q6xEhOrYpsgvU50Fvvixnr5ph/jCndOuZvvu4ZWRB1BhwQzXAXIgmlIMyWvZrQ7z5
 cnYJwT3Y0A3T9MUObehHH2IcJl3Rf7D1N0ZWX3Il2BSMKiN5hZmtiWppz80EFWrYkWm6
 v99gtKSY5gxs3Zk9d86G5SjfBbfGy87pWIRlv9CyZ4ZPGdAgo6juQldLuddqqWJPny3k
 0kSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEeEs6/zGfWAl9W9JspUiIXdMQKoM9mq9ichTzcraGcOfqUuuHr1TPrltcqDXBvrLPhEeEHDQZYQJOno9i3MKEJkWIi+lXoiuk3qeloU/Q
X-Gm-Message-State: AOJu0Yz/h6iiFqBHBJn9FushyiryNEaC/ooA1qpqZZ9rxqkqpKPgtMIS
 n3q/F++qYQ8zpwytkRErOtAip4g8E+I5xu2gnr28FwKJCcUrmV24PZ7uHoHbxeY=
X-Google-Smtp-Source: AGHT+IHbl292QZthRyXDMWyPZYQmvgV/RRjdvK90fr35qQFnpwTw2Zvfac/WgKPYnzwcXhB1+Xu2Aw==
X-Received: by 2002:a2e:2ac3:0:b0:2d3:f3fe:48ac with SMTP id
 q186-20020a2e2ac3000000b002d3f3fe48acmr623172ljq.27.1712306492814; 
 Fri, 05 Apr 2024 01:41:32 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl.
 [87.246.222.101]) by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 01:41:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/6] Add SMEM-based speedbin matching
Date: Fri, 05 Apr 2024 10:41:28 +0200
Message-Id: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADi5D2YC/x2MOwqAMBAFryJbG4jBQryKiGjy1C3yISsiBO9uk
 KmmmCkkyAyhsSmUcbNwDFW6tiF7ruGAYledjDa9rqgrJrZKPPwiCXAbBzU4wDq9YdegWqaMnZ/
 /Os3v+wGXQs2aZQAAAA==
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
X-Mailer: b4 0.13-dev-0438c
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
Konrad Dybcio (5):
      soc: qcom: Move some socinfo defines to the header, expand them
      soc: qcom: smem: Add pcode/fcode getters
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

Neil Armstrong (1):
      drm/msm/adreno: Allow specifying default speedbin value

 arch/arm64/boot/dts/qcom/sm8550.dtsi       | 21 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 10 +++--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 16 ++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 39 ++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 13 ++++--
 drivers/soc/qcom/smem.c                    | 66 ++++++++++++++++++++++++++++++
 drivers/soc/qcom/socinfo.c                 |  8 ----
 include/linux/soc/qcom/smem.h              |  2 +
 include/linux/soc/qcom/socinfo.h           | 36 ++++++++++++++++
 9 files changed, 191 insertions(+), 20 deletions(-)
---
base-commit: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

