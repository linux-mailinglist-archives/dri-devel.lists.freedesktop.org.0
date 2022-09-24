Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D885E8A51
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 10:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545C910E554;
	Sat, 24 Sep 2022 08:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF3710E54E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 08:51:32 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z25so3644824lfr.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 01:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xNoN7Rur629DmHYO6x8lTOQzMphVPPTOlrlp3Mu/xhg=;
 b=M+VYFsnT7wx332ngBy0fhnt5a9ykY3FoKYjc9sEAsNODehBiFX2kIpCpSbSxje//7M
 Lct5RwwYbJTPCmcHg0osNqEEQvk3VZ5Uo+j6XP2hRjc8aeFpEGijsyUBexntcEMU/Efq
 rhJ76SzVyIbjdOltIeLE5C9SzM0jT3YL8Fe0mRhfPwgxbQhDGEIzIQt7scHIgKAF6qVi
 ibHDxziuFZPcUzt0A5ZwpkvBym0USkKmfenHnwgIPe/OV79BCQjkfJU8PF2E9nj253h3
 D/pSLUdWss/V+7L6nMnglx0lVShUFQTLWDu2he2NKoTxEsl4Gw/z9l8WNwQ+M4qT29dI
 y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xNoN7Rur629DmHYO6x8lTOQzMphVPPTOlrlp3Mu/xhg=;
 b=idIV4iMBcOHhh3YinZZ0Z8PK9srtVMH5BIumS+hKiWEnxtY0sAOav7nC73iYN61KaI
 neBp6GxTPv1p9wld8Z9tzR/rUtWTFvNT7Iki9qNAYfpTtcNUCyLI4rpyHi1vACDlwfPW
 xTDhUACLrALd6p69mmV4sIGmMdEFi0W9YIrepDU1JTb8VaW7Ou4BJAX1DMoPabo0Usv5
 yw5m15jjQlldjYt2O30lVGpG5RAWlpo6Uhtu/269t2fZsQVgqPRQ2C/p+BlBGITlhJOr
 RaQe3cJZYgLcOolHcRmAFGBdehHKHDOzDWnkxuF1pPl3D/l+zi06uDeEpQQxGNZzkwGY
 lupQ==
X-Gm-Message-State: ACrzQf1cgUaxqZ0wPV5hrvZg75vLMmqcs+5GDeOMRcWaslLQY+PvIFPr
 NHVmYp+n+Qcj8Iw4OGQwbNuglg==
X-Google-Smtp-Source: AMsMyM66Uofz3Y3RoWQKzaoPo3wwTKaiclsITBOK1mBebDIaGOUt9+kbh72dpigvd21js3NSrIiS2Q==
X-Received: by 2002:a05:6512:6c7:b0:49f:5491:3330 with SMTP id
 u7-20020a05651206c700b0049f54913330mr4821276lff.197.1664009490916; 
 Sat, 24 Sep 2022 01:51:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 129-20020a2e0987000000b0026acfbbcb7esm1717607ljj.12.2022.09.24.01.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 01:51:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Date: Sat, 24 Sep 2022 11:51:28 +0300
Message-Id: <20220924085129.161086-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Loic Poulain <loic.poulain@linaro.org>

QCM2290 platform uses the 14nm DSI PHY driver.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[DB: changed compat to follow the agreed scheme]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index bc3d0b4063c7..088a03ed5f80 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
       - qcom,dsi-phy-14nm
       - qcom,dsi-phy-14nm-660
       - qcom,dsi-phy-14nm-8953
+      - qcom,qcm2290-dsi-phy-14nm
 
   reg:
     items:
-- 
2.35.1

