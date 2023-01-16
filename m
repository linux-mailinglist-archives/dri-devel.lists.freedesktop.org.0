Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4059166BD34
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFDA10E3DB;
	Mon, 16 Jan 2023 11:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A36810E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:51:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id y25so42341112lfa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
 b=oj/FU/HJqnk/jAgYBwvaJ2+W69VNOMizNLyF/0WaPTch3jGdAdQJxHpz+PLiNNsFE6
 hcMy2Wn1i62w4NG7coXQ6TeQnQXtN8I7PmK81HVjbKDH4ZakqWGUzdYpQJTcVOx5t8+v
 0l5IVByuyubRTEicnaoAt9MXVfcy/8XQnCp+r897cCt2mZnHD1WIa0Yoq5OwJlH3cf/c
 0xfKYVZqHVzNH79YWByHxL+JVuBC3SWCtQw+X01Tr8FY+g3gU1Dfoofk2V4rCiPBnAbX
 7BSuG6PIm+iucEyr2cR/cvc15NJPr1996rMAKakeZ7pxWcp8r6srcH6YcjvwL0hmoT1p
 2VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dz2HYd6nJfBe0hgrGwYYDvZ2nmTydvAGaGelNZK5V+w=;
 b=xq0IenBfJjpG8jucpG+1J7M11EjV1+8yMNgGGwyjP7ACcdlf650Tzmyt8gwCLQ+9lC
 IFuT/67XYxuD6+orC02gnVelSlpPkvGDVPqHDUJHGoCtMK9MljrVx+weUzFF33tft9E1
 sX66V6akAmBD4zok82JUVLah1HvE40YAXys+qw/KdEBq/JfjIFzL6n1uhZyI/OhXLsF9
 nCc2JOi1AKJQbuaEae/LADkpuNgkAueacYpAh7zqTmnwPPZs3aKBx75hFxy2oLXgr+u9
 EOREb04e+3WJOJUHTAZxP9mOjPQY38Zs4hauR4gO+IdRfvFmocGcNDNCZWFMSOUmMnPa
 ofZA==
X-Gm-Message-State: AFqh2kqo4Pahh6E4U+Q70OGNo/ZtTsZU7Sxm3OzwLTsGoO1hCgJ05QIn
 mN/plSSCtMfZpkeM+SElJLL/7A==
X-Google-Smtp-Source: AMrXdXtfD/BYz/Lr+CotvpV3dJ85ETbEToRFRwov7vQEvMathl0BuERxXo3qGpZjVM3TQU9GgwPizg==
X-Received: by 2002:a05:6512:31d0:b0:4cb:430b:c6c with SMTP id
 j16-20020a05651231d000b004cb430b0c6cmr16706339lfe.51.1673869896665; 
 Mon, 16 Jan 2023 03:51:36 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl.
 [83.9.32.53]) by smtp.gmail.com with ESMTPSA id
 m10-20020a056512358a00b004d57d1c6ee7sm162433lfr.248.2023.01.16.03.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:51:36 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Date: Mon, 16 Jan 2023 12:51:32 +0100
Message-Id: <20230116115132.348961-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
which is voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9c9184f94c44..8e9031bbde73 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -48,7 +48,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vdds-supply
 
 unevaluatedProperties: false
 
-- 
2.39.0

