Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA9A2C0EC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7464B10EAC2;
	Fri,  7 Feb 2025 10:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bWQK+xtv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7888C10EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 10:50:43 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38daf09d37fso1330349f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738925442; x=1739530242; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
 b=bWQK+xtvCNCKFMt3W3QzIJs7hq1crMqxWH9el0gln5oKrlbwR9GveBoLktIuXWJggp
 Svg/bXXkMg3OqO1cRzLPFEjmGJV47rYAcKpYXbF6gbpxtPj+zDrEXE/+rF/geNrtE+EO
 eK+22dV+9ypCRMe0eAE8p0oskeqwF5rnwIxlwCoM6LaBDgjBKuRA7nRrkfnRS3A58Y43
 f6qAQ9G+uByXjrBlZF9EttGFL3D3aiyTmi1CKbr4TdfRzMvIUSnoMXsbGT5S/SPrWaj2
 12sg+nofDlEvVTg7UlDAYN1h+wv1a/55TiUdggzR8MlOWXpP/4ZCZkQixXkpzAGbcSK7
 52XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738925442; x=1739530242;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/IumZi2mO95I/VuFFDFwokd0aVkiJwKGF91Pl5x5axc=;
 b=mD1cJQgiuX2HgILOe4o2/aJiROur/fOEjzMm7fhHGgkAEneoEh8d+jkmA7prQcjq9c
 rp2Yio8DTfWiWI1r2UdF0pXE14/ti8EgKuRv5shcnjgxpjbk8mTxw0+hoU2aHKCm3U9h
 PoizhG70yloDIj1EX8iOKQFNiorZrlIisunWBnbod3KtK3w209+39GK74IQcTa3gbOEL
 fIQKQnQTUh4S4Zg2aYOz/npk+jgqmpTge0+6MHUMNEZFE+2U0Jq6Ztl2v5WIr2iX1QbR
 GhTdXQahWvp4PVy4XLCz1ScoxYwrO1DOJ6H1GcxZhcbIN5wNihiE1l+lEORaFTXKxRvf
 c7Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj9i0X2JNGZgwPIxbfYaZermvqAMnsbJ75rhHdaReCDWk7xf650bWZy0CD2SsJKNJ4lZENNwLad7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdWEH4XfO2CIufXmsHie2Q0DZmfmqhPCtkD7YwgSL95UesYtBD
 eAzS6V2l1AijknPWK4yX0if3V4MysTWI6ePWuGhbNx1VcU43iP98R8EeFyn+0hM=
X-Gm-Gg: ASbGncvHY0IxxO2Bz4uEllQvav9IkQfWvcP9Nak1cXZxhrfpEA6KORSiO03+Kh3Ot8O
 6xZKWnZVnorvQK49kZ7vbc9rc8ralAAwre0SPU2tJy/S8ewn96fjlFsKvOBcv1aMm277n067YQ6
 UPn+NKCKXlY1RxXGpOggt+kOmOWfqHZFiKzMm0pdRptL0OzasufyKdp2VBcnwoTd4UUhv/wACtk
 id5fZuta2HHmyvCdD7LOruHI9DT26moEC/ILl0UBBsO+Hyl0syhf362cK7o/FolsrIWdLQSou9y
 TaXjMd5AhtyxtGHLS53HBXo+kK8ERDxJGkuN
X-Google-Smtp-Source: AGHT+IGzmf7u8lOV91tQ2bUO6AOqOzShvP6P0N0+WwarOOa/wfspqpwZ4Rf3iZg3JHMLcnGdfnkCsQ==
X-Received: by 2002:a05:6000:1a8a:b0:38d:b2a1:244e with SMTP id
 ffacd0b85a97d-38dc935f87bmr1688184f8f.41.1738925441775; 
 Fri, 07 Feb 2025 02:50:41 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:50:41 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: display: qcom,sm8[56]50-mdss: only
 document the mdp0-mem interconnect path
Date: Fri, 07 Feb 2025 11:50:36 +0100
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzlpWcC/x2NQQrCQAwAv1JyNhAjS9WviAfdpDWHZstmkULp3
 108zhxmdgitpgH3YYeqXwsr3uF8GiB/Xj4rmnQGJk7ENGIrq2WM5bolwkUi0LxpzcVdc8O3uZj
 PgZNtKHIb08R8EUrQi2vVrv+3x/M4fto8a9V9AAAA
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1173;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dSRoyjk/LLc0wZ5pRJ9GYPfexVGSK5yA1Y3qknTE2Ls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeV/K8vJ2pQ56PUAoz+0XinHG2mP2E+oDhZ8jXi0
 f85TrEGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlfwAKCRB33NvayMhJ0QiyD/
 9iUH3Rp2L1QCaj45OJfAnmUngLFmc0VQHV59TFpjfXaPfqfOMTWtHJ/4ZP8wFQJCsxl7yaAzDm6UO4
 zlFHFM9MoND+vjxn1msUPfMmIkYL08fg8GmtAgRwVGTgyQaW8Y/cTxi8Wc7mmQWo8tmZM/GxCbOT72
 yRqCu59o14WNCgkx5ASS/VtMlXALTzIiciepqqKKHRaIT+MSnzgAjKhLjH5PX/9/SqvBXScWAJlpXU
 AmIcI2S82HdjSf1xRZRmTZGZkp1KC14BVM7I/jkA03nzrDEezN284/oo0+Al5ddVMrGc52p4n9uZZ6
 GOTlUdiIwt8wzAwlbzgM+vE1wFAKpOK/wC04wgk74CNTrF8VP/lhsFAeL5HX1iJyNptRe5CE31/okI
 VeUnjknXAFfnNURGiEikQSEpC9EI8JdCRCwVkcbK2mgzR6AnYVGz0KnFaWPOYBN5CNGuU4F6Yyu2bX
 u6rD+sxyXTRD3FkOFPmrpuhSt4RRUjjLgKJe0837rtReagRU8hTueZfih8sf0Y0Gdst+PQPRd81ojD
 fzeJP1Spg3tCntBFFLFK2UhQ9vXwWoeq4/g/+KPaCGAuCSaMLYn67TJhu0VKBtXrUTEEOnr5Wem1n0
 yvkD6ast+usxuP7baNqyx2YBbDnjuPvDxdsDgqGXrk9Vu7ulA2eIXLS8P9wA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: only document the mdp0-mem interconnect path
      dt-bindings: display: qcom,sm8650-mdss: only document the mdp0-mem interconnect path

 Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

