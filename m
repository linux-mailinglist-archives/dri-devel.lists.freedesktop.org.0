Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A37FC835774
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:45:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490FF10E085;
	Sun, 21 Jan 2024 19:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE3B10E03F;
 Sun, 21 Jan 2024 19:45:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-559cef15db5so6375587a12.0; 
 Sun, 21 Jan 2024 11:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866278; x=1706471078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b7qx5rqlh0FWuE9XG787u8jZCcutzKDjwwsd5hGee8k=;
 b=Ch/wPHin/8DT+qJBomZtbSuJPRLNQABgifFehcOGKeXfYT3t3kKQimTd6N2TIWQbSg
 lAY9azwcXyQdjGcmFRdR8L8kqDObVAaiTtQ/pz0ivkTBY1WyaN77TvBnulcXp09miefF
 Aj3W6UXdA1B17LR1K+ksaG0s6AmzOu45V4WxDTTdKChC02JSiqaY7ZKACscnfNwp5z3k
 7dPKgFZaUSip980O0cn2Bs033vPJHivFmvXBupHhZ6dUM7J70TYuU/xuzojw4SRFSt8h
 AB0tQ35VNuDZ9xJ4zIjlh1L2n78YH7boV5bDB8Dg604wuXst71UBD+ZoVsD5YOpb0nkj
 pb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866278; x=1706471078;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b7qx5rqlh0FWuE9XG787u8jZCcutzKDjwwsd5hGee8k=;
 b=Uzj16X0H2qz1y+UfAG2KV+gxokb9OPSd3Hp2QTGSdIbc1cOVcpzL4F4e/JQxGoNaJ8
 lq2KwwwPBJBQH8gFpj/oMh1dhdFAbu3+tkGBy1OM/QXtd9xxxYsXBGcwDvtKzIWfhPtI
 MrVxaLetRoyi1/Ag0K+gzeOgXbLFoFL3ZYSDJ8s6SKO4anwc22yTGkCESAXGkidwDHQV
 52t2Hbn8AeyALrQ6kv/RwftpLMb8EvG1Uj2eL70FQpcJIgq1+g13GExvqFjQ6hagOgzS
 mj0fPTDw8mVTdIbG+npKBSFjCGyg+Wk3Ln+lCaUFVQY4xiS/t+Dwnva/9gP7+uFVicgA
 IzLg==
X-Gm-Message-State: AOJu0Yzrh0dlJnOIn7B/6RQ/n3aDkq43OvaL2xme/WGSvGakaIr0AOuf
 IAm95YFAp3TOTe/AbW9lMkKt8aPgwvRuGKq2no6es6/q89P9G0iC
X-Google-Smtp-Source: AGHT+IEUIwjgDLvSlIepivXTVds4fmOThAhEeE2VQdGUMP1Ux128ZnPqqT0eEiqb7+oRPEbs1BTjsg==
X-Received: by 2002:a17:906:70d6:b0:a2d:468c:3845 with SMTP id
 g22-20020a17090670d600b00a2d468c3845mr3183703ejk.35.1705866278086; 
 Sun, 21 Jan 2024 11:44:38 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:44:37 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Sun, 21 Jan 2024 20:40:58 +0100
Message-Id: <20240121194221.13513-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series provide support for display subsystem, gpu
and also adds wireless connectivity subsystem support.

Adam Skladowski (8):
  arm64: dts: qcom: msm8976: Add IOMMU nodes
  dt-bindings: dsi-controller-main: Document missing msm8976 compatible
  dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
  arm64: dts: qcom: msm8976: Add MDSS nodes
  dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
  arm64: dts: qcom: msm8976: Add Adreno GPU
  arm64: dts: qcom: msm8976: Declare and wire SDC pins
  arm64: dts: qcom: msm8976: Add WCNSS node

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../devicetree/bindings/display/msm/gpu.yaml  |   6 +-
 .../bindings/display/msm/qcom,mdss.yaml       |   1 +
 arch/arm64/boot/dts/qcom/msm8976.dtsi         | 610 +++++++++++++++++-
 4 files changed, 613 insertions(+), 6 deletions(-)

-- 
2.43.0

