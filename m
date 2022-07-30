Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6D58597B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706E10FF25;
	Sat, 30 Jul 2022 09:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0610F79B;
 Sat, 30 Jul 2022 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659172696; x=1690708696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R2e9pEbUf+I47x6p9w3u3PcS7jXislGPlZCo8X1ItLY=;
 b=H4ZaSiINDcvvsOfjPQbl2yG2hp21mO3jQVFcQ8T1iv7yAcJqW6ezglw/
 XbzvihsugLGHW7XFxzxCmYsRHEc5RNX1g47mUWm3W0F0cG2pC9bHdLlKV
 DKcymZfyB5/XRuP5BCFqyCzwqDY7nn/E0Fu6HLa1uMM8AU8dvGFF0hYl+ E=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jul 2022 02:18:15 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2022 02:18:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:18:14 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:18:09 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, Rob Clark
 <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "Stephen
 Boyd" <swboyd@chromium.org>
Subject: [PATCH 1/5] dt-bindings: clk: qcom: Support gpu cx gdsc reset
Date: Sat, 30 Jul 2022 14:47:40 +0530
Message-ID: <20220730144713.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add necessary definitions in gpucc bindings to ensure gpu cx gdsc collapse
through 'reset' framework for SC7280.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 include/dt-bindings/clock/qcom,gpucc-sc7280.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7280.h b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
index 669b23b..843a31b 100644
--- a/include/dt-bindings/clock/qcom,gpucc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
@@ -32,4 +32,7 @@
 #define GPU_CC_CX_GDSC				0
 #define GPU_CC_GX_GDSC				1
 
+/* GPU_CC reset IDs */
+#define GPU_CX_COLLAPSE				0
+
 #endif
-- 
2.7.4

