Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947E35A945D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C692D10E698;
	Thu,  1 Sep 2022 10:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1BD10E699
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:23:17 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id z29so15145048lfb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=dbnMoUfAf6pS+YKjHJZdmNDN/DndI9NQSGOFgsgyNpj+tbasqmu+9fmWrC0xrY5SMe
 MN8epoqze7+Rtr9CkCOcJSzIV94WyoBrUU8QFlGua/EeJHGqzScRcj0StuHB24wPvBwb
 ri47OtWVDnS3VnzJ6i3oM2tEfelCL60uY1X6TQxJK8dmCN79RJ5TfXICcvhbwHCuMtij
 zupsvE66ZOU2qGzhCqpf5cXijtXJdtjiED5+tATNryFuBwSnG8msjILInjHbH4BoCaXO
 /kR8SOedoCe5jp9HIGWrYs1hn2fDB1NDrs0d+iTkRQvUlVS0WBUl96/dTUdirnelN527
 isXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2rC5Rchk8Av3pvvEimOqZHjNpVOqnGT2anEFSOvGN64=;
 b=eJymsJf5got6URXdz/XEblK6sw9pZ+Yu8fJGszX0lXDQw83zLJ5r16lcVniUNnj592
 uMP8FPOXpQ702yj1K6IVKvTMunG7dcabDjE0LAQOZ6watZ8hhkprwLPXqEbcxySJ2sEC
 bbux5lweBDmIjlx41cO3gU3O6s2r97ok81XaZoWWp1Q0nkTWGGiI+Wvw8RGqrv9nOS+T
 YKjZ9BBGxP9I5WzzvQTnmptY0W8X61zJgrlElXgmiGug9OHvuif35qTgljHvNAghsBlr
 5sAhYJuYVgq/ENRUVAVe0mH0wBpS2Qm0L0WO2XV2gLcgCSVTfWSXNDe5FlS+2Fn9ceJo
 bwbA==
X-Gm-Message-State: ACgBeo3kNKg/y57YY1zIeFGOgqB6mYaLDh+P2xHdbr4i6G0VjiOukba+
 lKEplgfBbGwFMrlKofOaQ2vbnA==
X-Google-Smtp-Source: AA6agR4Ql3QKIlEpaBo91GppyG6nGmn/itxwHwWuZw57PLSwF2vvtLkpDhbImRAshWGP0gTDtSxxIA==
X-Received: by 2002:a05:6512:1054:b0:494:8ce3:24c8 with SMTP id
 c20-20020a056512105400b004948ce324c8mr2043959lfb.360.1662027795865; 
 Thu, 01 Sep 2022 03:23:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a056512371300b004949ea5480fsm123453lfr.97.2022.09.01.03.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:23:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 02/12] dt-bindings: display/msm: add gcc-bus clock to
 dpu-smd845
Date: Thu,  1 Sep 2022 13:23:02 +0300
Message-Id: <20220901102312.2005553-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add gcc-bus clock required for the SDM845 DPU device tree node. This
change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
move bus clock to mdp node for sdm845 target"), but was not reflected in
the schema.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 7d1037373175..3cb2ae336996 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -84,6 +84,7 @@ patternProperties:
 
       clocks:
         items:
+          - description: Display GCC bus clock
           - description: Display ahb clock
           - description: Display axi clock
           - description: Display core clock
@@ -91,6 +92,7 @@ patternProperties:
 
       clock-names:
         items:
+          - const: gcc-bus
           - const: iface
           - const: bus
           - const: core
@@ -183,11 +185,12 @@ examples:
                           <0x0aeb0000 0x2008>;
                     reg-names = "mdp", "vbif";
 
-                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    clocks = <&gcc GCC_DISP_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
                              <&dispcc DISP_CC_MDSS_AXI_CLK>,
                              <&dispcc DISP_CC_MDSS_MDP_CLK>,
                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "iface", "bus", "core", "vsync";
+                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
                     interrupt-parent = <&mdss>;
                     interrupts = <0>;
-- 
2.35.1

