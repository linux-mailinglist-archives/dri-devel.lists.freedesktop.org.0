Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52CA2E7B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 10:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1B210E4C8;
	Mon, 10 Feb 2025 09:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OHATsgBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FF810E4C8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:48 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso27692225e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179967; x=1739784767; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VzZ4qnyDjt3/FJ2e8uCPnYFFvXSGSVm1CHMdsRPG1Pg=;
 b=OHATsgBfoic+2GwKK2U8/MNh3b3EXItjOorx4SlEOL+ATP8/XJ7QcijoCBdiUGsYAM
 FZ5GamN4sfMbyKXvQEgBjmc/1p4c49J6NSv/5nFv336kxlUlJtoZXLd5+G1JF5YVBwTb
 bdYP7IvcEYe0rPGr2VsG2shvgXln0uwUevVUAc4OwauxnqoMJV0dNfQbqlSFv3CG2WaI
 M/Wdy0iYilXYOKIR+MpTuWD4+bFH1et/chIleFgMHojFKPRjM+7HgaewPVrzfi3UFZjV
 FvuGqZZ0W9+bvYdySqU+w+qpH9in8zJFC+puOMnhi02wSJ0PV/6PF6CBL3sr/7LyclfU
 p3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179967; x=1739784767;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VzZ4qnyDjt3/FJ2e8uCPnYFFvXSGSVm1CHMdsRPG1Pg=;
 b=MCRsbVeey7i7EMrl2Zsk96DmfT2L5//MgBPZ5hdaoOCz4WfVpp+LuWUJyn3Ye8N6p+
 +YOjhASulqlQzLpFkuU1KwDfb0IfzDD5fZkvmpu1dLgeoIF76qZunpiodK/OtdrhkSNH
 jWgEUEaSEuCN06IzvSl4bMgR6/0MbnLTa8YYLEndaqx8uMXKBPktASpIa0yIGsAh2l4I
 ihGuJRx/swQMc/j/VbTnfrEulOw9Yie4//u1vwq8aLwgyd6MaXk+7w89HTa2rb/AVkyc
 S95hYjbqs2u+mxlNpk7Dw3adxaUoQmx1P7JJ6jtIEFGFWoBH2AGzCVX3/GJ0t/qbvSWX
 b8Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb9KfoNXLV+uojWG5zJ3YZHMfcRs0/X1RCjGHJ3O45SvvMgGHtxX3z+gttwc+Yy6RtN1QEeH6W9pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLjYvu0jJeyqWaEmWKq6YPVrq/WjBl/eaaOwdf5PKyQ5wP0RfU
 X0rTgH+3ugvVBq6eMfyeuTuxAprM/SuHIb7O3/hc1sCTR2Lv+B/oNfK1Rnm69O4=
X-Gm-Gg: ASbGncuUuV9BW2NzsQ9KhX5xZ9KsnIk+XA130PvIeZey+O7hucucVNWPbj/BNUmhSTL
 gcYJthoniQM9sEeXQKNq0KqHWt2VGMq1GXzvPTWOI62tPfOs1s7nTNBE/qLVtJsfwo8QKWoGhm5
 mn+AAexveMidgIy/4oU7L9K1SEFraQZvVG5FjKx4jX/HcJ8WO2sTODQoXlXI598nsUGDY1pmM4t
 B4d/62XzywWOILc8plu523rjMSFTOeBCQ4CYX9WBOGkZfh/IBorAqLKwiYxeUMR5VvTCtJn39B+
 kvwRozSoEDQETCyxkTGzgrb3cZrPmVXuiyxe
X-Google-Smtp-Source: AGHT+IGNDPBJFJRV2pnpEXOymShd+51OHk+y0ckKkGyIoLDZ3cbt+pXP/FQMMjjsEzIh0bn9twywjQ==
X-Received: by 2002:a05:600c:4f47:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-4392499090cmr104561845e9.14.1739179967075; 
 Mon, 10 Feb 2025 01:32:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/4] dt-bindings: display: qcom,sm8[56]50-mdss: properly
 document the interconnect paths
Date: Mon, 10 Feb 2025 10:32:38 +0100
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALbHqWcC/6WNQQ6CMBBFr0K6dkwZLKAr72FcAJ3CJNKStiEYw
 t0t7Nzq8v3kv7eKQJ4piFu2Ck8zB3Y2QXHKRDc0tidgnVigRCVRVhDdxB2EsV6UhFGHAGwj+c5
 ZS12Elq1m2wcwvIDW10oZxEJLJZJx8pTmo/Z4Jh44ROffR3zO9/W3zpyDhFphm+uyIbqU9xfbx
 ruz873YQzP+IcckN1WOba1Nme5f8m3bPpm/5dFEAQAA
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V0pnai3sG2FUHiUUgHCPEL9XqGih2gi3fiou37xJXjA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce7qdjWC+8P/KsuKPrL8cabCUEntHyRqm8B1enU
 NRMB9pCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHuwAKCRB33NvayMhJ0fGGEA
 C0r9MZn5sVQ28nvrKPf5shEIsxNoLOdCxbfktrO0LwKE2O/uoA9mrOfbpaJCkho3ey4zrlR6XFNepd
 3uQFLaLMDOdbm7UBGJnoar2pIWXhAwPCEwxF5PG4kyZ8la7OVzUQ8aX7OQOQgRfPZieGV3s/ZLrKQU
 RIo4a8UcTjgMrSMShHWmOCHua61d7o/i5Qokg5xMAIrHGMC0VKsVh5lG6tB4n9zxghrjoipVbFfzfz
 LntwRNOdj5u0jodvvpVX2LMnwFnLCIazTJ8wpbr5bMYmAyxcd/hy/63VD6t1LYquYox38LSmql9L2w
 4tt8Cg2A4kdDPXxNR/BDutUHqSD8GWwD5s0TWJACxaJPqlZde3/+rLcoqsBkiNNCLr/wvgnkrtjLTi
 uOXiiknsfJQ5lREtRagYonl//UAGRT7gftmKKtxWuTeNsp6ufUP/6bnwHeaoeZTi2K8xaKc3YCyMRJ
 4QJwynbAlGDAcK4MJSrvmDFCY668ep2bx/z0scGvsHaV7xxbZIcNDeogQnj27SeLQp66dpbHo5u2zN
 tJbCY+tdjU9wsR7l8MpInQHS/mEAPlMKUiNnB8IxG5dGRSK/lfgiN8Eq/pIr/oBfbL7w0o4fHbuc1O
 0Bv4X1yzetydPzeVALJNNzwAxH/9Kud6NbVvzew4Eqwh87+YLox5h9UKiZYQ==
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

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
the mdp0-mem and cpu-cfg interconnect entries.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v2: https://lore.kernel.org/r/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org

Changes in v2:
- fixed example in qcom,sm8550-mdss.yaml
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org

---
Neil Armstrong (4):
      dt-bindings: display: qcom,sm8550-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      dt-bindings: display: qcom,sm8650-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      arm64: dts: qcom: sm8550: add missing cpu-cfg interconnect path in the mdss node
      arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in the mdss node

 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml  | 13 +++++++++++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                       |  5 +++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi                       |  7 +++++--
 4 files changed, 28 insertions(+), 11 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

