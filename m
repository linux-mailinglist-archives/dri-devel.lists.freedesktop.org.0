Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED096711DD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA83E10E65D;
	Wed, 18 Jan 2023 03:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8510E659
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:24:38 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u19so80048636ejm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
 b=g3c7+YQ1EJM8IKsNmfUYFSKpFtYbB6qR5Hz1eQVcCd1Mzr92XRCWFcVn5fABo0YWFd
 EOaaXaYDC+2NCV/Vmy45wyOiliod8czwMG4riNyZYBsmk4fkZ9qUaMsNmoBiLzN/MTkD
 edXihRbsu3i6mKV3f/R04TTMgXqsiiT329B06VKrhB44euEmQjGoqv+q48CVt1XOF/UI
 cSKMUKtCut/znSfu24UF85I26jOEmvQ2cTGDzLv+/xNLJ8JOzYXHJAWBQsopR36lJ+Ep
 MuYtUVMLBZGrXC3GV1rZCSRM7uqyvpgczZtSrFNT2rhWwEl5q5w06YJQTDOun7j/29F/
 PH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yOjPuQ6CEkm3Nq/ELehGQzsBDNAjM68X5nkPgdMs5Q=;
 b=E0b6UcPZwFDKiGQ4miceAlTyCVFxLzAYJfmaJGl/7MROIb+ZZgyU9QBqyagKUE+pDb
 PYL/hx83GH8vlvMVbnIU5fRi/mCPweea2iuDzqhdNRzl1XKiAcdKJwtOrLf7+GXeKO9a
 XWQOtH6w1Z6sVn03wGlnRwpCCC6JZk2Cl//SgkWEclS58AGsvrMSpVlS2EFxqfXotEiV
 vBfbW7lOyiYXMNrZdJNO8+zCiIk8M16XoQRhp4KtiSK7Rsr9PsuRYQfQVggdjPAwZPZ5
 MqZuhENoL10uiTA2vE8ZTw1RNNcEbVv2rWDEl11QS9WWRDwEcOjo4LBdy28ZITAq+ycK
 QDDw==
X-Gm-Message-State: AFqh2krTCOxXrnnU9FH1r+4ozdzzTgD7UIjUhvYX6KRvlJr5h8eIC4TV
 v6C8lYDgJtNqCy3i8FAhKr2dvw==
X-Google-Smtp-Source: AMrXdXssA/hakgWZgE4naeoB9z6EdLSKoJlaGcpYJydyzu2fjfgzgYxcL5zYzluE0+bh2eahd/J99g==
X-Received: by 2002:a17:907:8d18:b0:7c0:d6b6:1ee9 with SMTP id
 tc24-20020a1709078d1800b007c0d6b61ee9mr5948982ejc.11.1674012276788; 
 Tue, 17 Jan 2023 19:24:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056402194b00b0048eb0886b00sm4713829edz.42.2023.01.17.19.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 19:24:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/4] dt-bindings: display/msm: dsi-controller-main: account
 for apq8064
Date: Wed, 18 Jan 2023 05:24:30 +0200
Message-Id: <20230118032432.1716616-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

APQ8064 requires listing four clocks in the assigned-clocks /
assigned-clock-parents properties. Account for that.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b07bdddc1570..357036470b1f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -83,12 +83,16 @@ properties:
       2 DSI links.
 
   assigned-clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       Parents of "byte" and "pixel" for the given platform.
+      For DSIv2 platforms this should contain "byte", "esc", "src" and
+      "pixel_src" clocks.
 
   assigned-clock-parents:
-    maxItems: 2
+    minItems: 2
+    maxItems: 4
     description: |
       The Byte clock and Pixel clock PLL outputs provided by a DSI PHY block.
 
-- 
2.39.0

