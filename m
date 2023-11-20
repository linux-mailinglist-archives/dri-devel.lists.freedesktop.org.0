Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F207F12E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 13:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FA610E12B;
	Mon, 20 Nov 2023 12:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308E410E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:07 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso10252729a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482385; x=1701087185; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9gzY9FqizGaQnSZZhxsA0vWZnsDs08MMlwZNySIk8xQ=;
 b=lsGDPrXMUstJCs54qbm3xCfy3vgGRfYQDTmq3AYNOxalqcWRltntVsYcWUEn5MO+A8
 Yj0lZJa08hZltoSeOxwfNjALiwNzGLgynDkjeZW5arU5025LveEFdoehVbTM2pdpS9CV
 Si8kMWxnbA+0wRwIBY74AYJwWbVuLiATDmdBp1lZcUdWspKt++3QteKAGi+CZ5CmqYGM
 bk9U8leIGenNvOLAnshXJFfXqIwubM7n7nN+8bWN3gEaFsPV4RPSZLibeYFAN/GmKZ16
 zLwKDL81AsZAXF87np1HwIlINB6fnUnXryV95HxdWGILbv/0GhVLrlKiHfV1fgsZHf1f
 cTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482385; x=1701087185;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9gzY9FqizGaQnSZZhxsA0vWZnsDs08MMlwZNySIk8xQ=;
 b=efOm+WZ703KzsemesttcTlKLxeVrZ54O48vfZgUA229CmsP+qWb8NOay9mJj7BZzYI
 DT1JUfdLKQTab7+kWRNxLRRsM+GUTwZ2CltUWE7ZkEe5DgfHN7EVQ+/mjTaRko1W4Qlq
 84tbDWXYdmmP6xNg59UZnjYMJMQ+YoITBoiDAG4dtNASlKis+MJa30ebEzh2fxS1aYoM
 G4g+zMij/HFYG7O9kNvdW6WHEyCxK7uT8hmK9BWZxp4+VS36sYhta3C3dKC4EmY5/Rsn
 2I9+IpUnTPCicO5mkh8uOApiRM54s39KoZXpbiNMVAlMkNia4579SdcbZeAkW+cTIxoW
 774Q==
X-Gm-Message-State: AOJu0YxzLatoxc7hleN7n9m4UCmTnhzg+WkXYZijXtCF241/ttLlC5gS
 BgK2PT3lzul6Hazu+wU6joDqIg==
X-Google-Smtp-Source: AGHT+IFCcHlK6Uo5Dn5EOrxOYnCuxGsZot4TPy1ZycY8WEFLZMdX58P1HwLevCsuJ00GPYhXVUYKoQ==
X-Received: by 2002:a05:6402:1605:b0:548:786b:b46c with SMTP id
 f5-20020a056402160500b00548786bb46cmr1568764edv.8.1700482385623; 
 Mon, 20 Nov 2023 04:13:05 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:05 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/4] Adreno 643 + fixes
Date: Mon, 20 Nov 2023 13:12:51 +0100
Message-Id: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENNW2UC/22NQQ6CMBBFr0Jm7ZjSGhBX3sOwGOoAk5CWTJFoC
 He3snb5XvL/2yCxCie4FRsor5Ikhgz2VIAfKQyM8swM1lhnGlvhEmfxSNXFIdXsGzJXclRCHnS
 UGDul4Mc8Ca9pynJW7uV9FB5t5lHSEvVzBNfyZ/9+ryUarKmvGleTN+TukwTSeI46QLvv+xeMw
 7jOugAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1189;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lzZGsaV15spB0k9fqGINqbiPXsC0S/Y51YP+msYyDY8=;
 b=3uR6tatKteVbqY6ZWNDllqeKEl9etaE/psCLJlK0nI0YanFKwabwox0uOWwDwCRkXAa0Xp9UG
 M3iGEBQ7KyEDee9gS4dvWGhxAeubkU9droGBpdntQ+uOaU4H6j19A4+
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

as it says on the can

drm/msm patches for Rob
arm64 patches for linux-arm-msm

for use with https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25408

tested on QCM6490 (SC7280-IOT) Fairphone FP5

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Drop drm/msm patches (all applied)
- Make the commit message of "Fix up GPU SIDs" clearer (Abhinav)
- Drop unwanted firmware-name in "Add ZAP shader support" (self)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org

---
Konrad Dybcio (4):
      arm64: dts: qcom: sc7280: Add ZAP shader support
      arm64: dts: qcom: sc7280: Fix up GPU SIDs
      arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
      arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin

 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 25 ++++++++++++++++------
 2 files changed, 20 insertions(+), 7 deletions(-)
---
base-commit: 5a82d69d48c82e89aef44483d2a129f869f3506a
change-id: 20230926-topic-a643-a7ec9a08a3a1

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

