Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD166BD08
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E31410E3D6;
	Mon, 16 Jan 2023 11:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7310910E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:41:05 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id e16so2834694ljn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bAzr3WbepHH/Xzw3XY7+Qyd2EYJHyzok2hFrIPSgsi8=;
 b=W3zFXG1CifPHncC3axUe9wXlorA4Z55HvPebPUfGeJXpgJbQG8XOEJ2h45A4eVBHip
 0x3+QEX/JBeZ+DrmbqnDk/x3ml+kmr6FtH3LaOmTW33IWrqGzAiglQPnb+Yie7+nKhoN
 6fEiQyWktJLR+nOFWggMUDK7agb2Xl71a62ZqaR1iCrgB2bS/3FLRHYFzDTIhwNE7z3z
 YTcO/GJihhOH8sFe7/4I1opzLrgzykmByosB9J5fGr2Zv4JWr88NVN+OulPziFYGFNMj
 izYkzknOqcKf2bSeEJx7EH5rewbX6ildpqYws+7JXUsPvCVobu0WGNJo6mAOawsWE4nN
 ArnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bAzr3WbepHH/Xzw3XY7+Qyd2EYJHyzok2hFrIPSgsi8=;
 b=H+ZRBKW4GV1LyA7i/D484HeYFMO12wXiwO1JOzsK6lLIXjeCkwRAQAODRqR5odPVsl
 bQD2Fv4GnOrprBrkXbgorB7D2MSyNcrApMvqGICYiQ0KFRPVlba3pO5bTuHUAQ1tf0Ix
 g1vdQ/ix1uBEOID/r8pWI3n/6uRm+gK1sQoaQ3/kT/SI1pOdvQnlVu7fjlU53UzEdRQD
 fdyOB6SNFCFANPOyGGnYq1RIZkkpkpdMAy7HVhSHKKAlzsUbTzpWqK9DOqwchT601D7e
 XDBz1bSrdK3sz9LE0wc7x9CZFw/qWYPISXzuw0GK2geFVOuCEQtUzMs2FDPjIfIc440g
 f05w==
X-Gm-Message-State: AFqh2kq7q7gry/4ZgAMJIevOlXRIcgWWgy6uB4VS1D5t2n6nwVMd7yFw
 w/wJjAK+O1GvnVXVwfxGmuBtIg==
X-Google-Smtp-Source: AMrXdXuyo8z+lpPJjrE3F6tFchQ8Fr0hXF7Q1C6orut7naGETw7CiURB4lbO1OBvqDWT2nI+dH35AA==
X-Received: by 2002:a05:651c:1992:b0:27f:b2cf:85a0 with SMTP id
 bx18-20020a05651c199200b0027fb2cf85a0mr28139431ljb.43.1673869263688; 
 Mon, 16 Jan 2023 03:41:03 -0800 (PST)
Received: from localhost.localdomain (abym53.neoplus.adsl.tpnet.pl.
 [83.9.32.53]) by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c10aa00b0027fb9e64bd0sm918946ljn.86.2023.01.16.03.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:41:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 1/2] dt-bindings: display/msm: Add SM6375 DSI PHY
Date: Mon, 16 Jan 2023 12:40:58 +0100
Message-Id: <20230116114059.346327-1-konrad.dybcio@linaro.org>
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

SM6375 has a single 7nm DSI PHY. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 78ab8c410ccd..9c9184f94c44 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
+      - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
-- 
2.39.0

