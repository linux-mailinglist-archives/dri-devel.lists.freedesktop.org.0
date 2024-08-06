Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CC949A5F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 23:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2BF10E407;
	Tue,  6 Aug 2024 21:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mlGypOj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971010E40C;
 Tue,  6 Aug 2024 21:45:05 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6bb96ef0e96so6296056d6.2; 
 Tue, 06 Aug 2024 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722980704; x=1723585504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KLSFBItpfPwWFfPLR9boww7jDHN1tVOHaURUpYvMBEE=;
 b=mlGypOj/y9qsJw6AMFxEfAPEjmPnSntF+2mVp0jHzRl4M6hZ56rQofdsEgc0woNqZr
 GiDaa6Gve4RLVakVp9F7lxCnD4ey2euUgIy+33eFQd2o5uoi6fWP/V2hRku3ZbqoWgXG
 POo36E59ZJr8/DtuNl4SMFfll3PBTErGDGTjEjrbn+oPYFvSAVXUlX8xKpO8zEN26Oge
 i9pDFaUR4pu0HVoPCKXkxrL9rBydJHOwk09SoUQY26hFG4bVu+tLyiXn43THW0WFmM0h
 5nRwCd9wm6A+fR6JCKxvoV22NNUdgzdLQZfwA/PAdWoWRNBdIXfDklDdNQwkespTrEWZ
 D2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722980704; x=1723585504;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KLSFBItpfPwWFfPLR9boww7jDHN1tVOHaURUpYvMBEE=;
 b=sdhI1y/TRYnIP/JvyU9JTOF97HevZyuAjH2BXjeele7xT48Y0MHxO7/LOSO2ruilM5
 5H9bLeZipZGS1JR0ZagR+0RwyN0HcOqxFyVlCRRknkYb/eJPsJ8JmA+z6jDVADvgQPRo
 E4RAYGztVjCFv3LjuKBnTwOV3/47qtdKDOfYqEi8+t9lD2c96E5nGEg0GJhcK23ioi05
 9Ilsbc9OdnqJrCshA0VFcm8+Y0TmU+7l/zzee8IibG87ubFuk+lLtddPLYudTXeCXACs
 vqfwc35JP3ZXGmCNighy6cyP7x95l0jISnoUlfTUz4n4moc8UQUD70lUd9vKn/hye5Sc
 4EEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy1xqQwN6SKR9lLibFsemU020/NyJXUkzJjencG0ryUt63fGXvozhvPRvGfR90OA6f7vmSDeQG8QQY3Y5gAo8chkyM2N97VPbWIXVTjn2Z3riwXhrKLWCws8qk2k5/MB//L//Nhm5ow6jmEtNHdRpZ
X-Gm-Message-State: AOJu0YwiMsBaEjf7FBvcDE9E+Uz/Py0zmfJ5j+K/as+c6HzESYHiTQSu
 AGcYJAGnC4h8HErHwhUJfhAiNnI9eUPDVb/e8VMqJZ+xcyEcEmQ4
X-Google-Smtp-Source: AGHT+IFzOssy1QmsgTWYBcHvTJ6UtXaK9mBa3BKvdzHuAXAXu3NvSanPEiUvUwUK8sWEO6PJLngQLQ==
X-Received: by 2002:a05:6214:3387:b0:6b0:7eaf:febb with SMTP id
 6a1803df08f44-6bb9839db29mr175608146d6.31.1722980704128; 
 Tue, 06 Aug 2024 14:45:04 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c79b875sm50530676d6.49.2024.08.06.14.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 14:45:03 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Tue,  6 Aug 2024 17:44:54 -0400
Message-ID: <20240806214452.16406-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for the speed-binned A615 GPU on SDM670.

Changes since v1 (20240730013844.41951-6-mailingradian@gmail.com):
- add Acked-by tag (1/4)
- add OPPs exclusive to some speed bins (3/4)
- enable GMU by default (3/4)

Richard Acayan (4):
  dt-bindings: display/msm/gmu: Add SDM670 compatible
  drm/msm/adreno: add a615 support
  arm64: dts: qcom: sdm670: add gpu
  arm64: dts: qcom: sdm670-google-sargo: enable gpu

 .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
 .../boot/dts/qcom/sdm670-google-sargo.dts     |   9 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 180 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
 4 files changed, 217 insertions(+)

-- 
2.46.0

