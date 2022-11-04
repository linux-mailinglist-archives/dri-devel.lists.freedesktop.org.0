Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5156197B1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B7210E796;
	Fri,  4 Nov 2022 13:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7143610E799
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:23:19 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b3so7416241lfv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GFPRMQrPpUte237J6aCjznuQ9mnU+Eo0yi+srZmgqHY=;
 b=A7fuxhHuzCtWSVl2IK6kcDQurpzpuO8OBwGAMDYDXea0/R8QZAboNBqWoyQ6bGl8wl
 8RdIVVlkbl36q4I5Har+3fRMKU17oWX1njqYpoip7vq+PpZPqLeMvgT4hFf9osPtU5Wi
 P+yXUC7yT5i4scH3iEAcAkZTIgqnmWT7WHoaMRmAvTDOITTWwqhPl8Wj6yd4zJCkmOlT
 pL9e9seENnu7JYK1KOoW0XRKUlCvcRTbqYpBbSTsQ3VC3/usbo1lUPRB+odZywDmgC5X
 rQxqjHzNRloHR3+g3tYyeo8Viy8s33wX797GmI0WjPbFsg3XVmktoj0oW+M0f8TQZcDZ
 of+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFPRMQrPpUte237J6aCjznuQ9mnU+Eo0yi+srZmgqHY=;
 b=nG/y8pbOvLTr1lnSS84WeOXqjveiHe8Ub9RGwCJHqAaAewILOgOMHX4cRFTd6bLsH0
 7QJ/EcpMaj7Dg1pNkn0akDXtRVwERZ6fITh8U2fMbnPqisIxy3Qp/UR1CdbkIhg/nsmU
 T2mmH0PlpAhOPvDQ0J6j7puNhUmt/lmbgynvfpE2vynmwHYBKtZ4vxftm7v3xtdhFrEq
 rmjaJwkYe/gg+0pNCAkg5lcypFepfnb2X4VRp7O1yVkdshdRPcIPFIiXn93Y6oCJ9fRs
 OIFHOo1qQh2QJmBRRFdwhxmQg/H+ntQCU49XTWSw032vw0A+EAM3gt0jJQm8urDTcE/y
 AW5g==
X-Gm-Message-State: ACrzQf3xX20Mykh5QwGSSmAlJSW5IqHXhag3AZaoICCU0ELu1LlJ88bU
 LfLgt4IFYHzGzqrdQh9lUPBO9w==
X-Google-Smtp-Source: AMsMyM705LK4MchUkNOU6hSRxD3UWDywaZKy0DbUuwM6BjHiHbB82FGOEodinOzlXBYu5/teATWkZg==
X-Received: by 2002:a05:6512:ad3:b0:4ac:df10:6af6 with SMTP id
 n19-20020a0565120ad300b004acdf106af6mr15000229lfu.214.1667568197813; 
 Fri, 04 Nov 2022 06:23:17 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b004a478c2f4desm456468lfr.163.2022.11.04.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:23:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] dt-bindings: qcom: add another exception to the device naming
 rule
Date: Fri,  4 Nov 2022 16:23:16 +0300
Message-Id: <20221104132316.1028137-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'qcom,dsi-ctrl-6g-qcm2290' compatibility string was added in the
commit ee1f09678f14 ("drm/msm/dsi: Add support for qcm2290 dsi
controller") in February 2022, but was not properly documented in the
bindings. Adding this compatibility string to
display/msm/dsi-controller-main.yaml caused a warning from
qcom-soc.yaml. Fix the warning by adding an exception to the mentioned
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 889fbfacf226..e333ec4a9c5f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -43,6 +43,7 @@ properties:
       - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
       - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
       - enum:
+          - qcom,dsi-ctrl-6g-qcm2290
           - qcom,gpucc-sdm630
           - qcom,gpucc-sdm660
           - qcom,lcc-apq8064
-- 
2.35.1

