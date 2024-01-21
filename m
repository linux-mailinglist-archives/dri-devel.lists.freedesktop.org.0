Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BCB83577F
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 20:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B6F10E2E0;
	Sun, 21 Jan 2024 19:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4D110E2A3;
 Sun, 21 Jan 2024 19:46:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-337d58942c9so2740297f8f.0; 
 Sun, 21 Jan 2024 11:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866312; x=1706471112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1xj7QKpcdq4XanNhyH8PlkFLqxpi5ERSOGj9kIBnKk=;
 b=QuS8j5pT+s7dmHNNAQEbttic2Q7k0d26xpDYxVrrAPlXgaDz/R44o5kDfzuIEulhQ+
 4Yxv2m0DDabpLmxY5pC0zXSYDpPOL80gsvcxNMvY/L6ywJj5D2mt64RQBxwvi4VZjUKw
 iMNXcnAyROCJg82WEU8YHoGKXtLGqEHLx1E8lk16qxTiZZ6bb5LDdBdXbmL4XtQdicWF
 2WTA02Zl2v29uUqgQY5eTb+VJqgm/yGap5no303CJHl5SJL5XleMC6h4xvZ3OVvu3X0a
 cG78SuG2dipiojxk+1c7KaZ3fGMCcyg1GsvSK3KbYYL+YZisbDm28/FxU0A/lObS+ay+
 WIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866312; x=1706471112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1xj7QKpcdq4XanNhyH8PlkFLqxpi5ERSOGj9kIBnKk=;
 b=rfVhhlfWNXTgr1e4whvzDnxP5VdfOtZoWflIgXPUn8u9gywk/GiaVRIOHvC9ogBdjK
 wvLYaX7Tu8nfaFjYX0CJoc3NC9gv++oDg0Uhq+O8KZ3cSuJkUGp/f7wj5TZYD7FFotXz
 MiDNybtnso2nvAZ7VDIEeEf19ycURmkzkLwqx8rgmAXPCDQT1TdrpMQLLgcIIeIbcz+b
 E2ZOC7DfJa91YZVzZrbezetA18gW2Zx4Gis4PA1bKIUBznJ1D0zduRLMGo/FRj6jKwjn
 OIWwYU4qiy4Bp7ZsRC/d2GKS81J597BPBttcvEkBPPiCMBvwnu4uvi9Hx8g1aoGdZPjd
 RZsw==
X-Gm-Message-State: AOJu0YxYT/yIhtAtOhpx0kHX5Yi3zp8Lz4NEoN+SXJoluE1beB+c8MBS
 EHqeL8TXsvtpT2CJ4VvtF8/fI3VcTtTjBvS/oleP+ADf0MSYEWjV
X-Google-Smtp-Source: AGHT+IFXVwttOkq/35bDzPfwT/wM4HP0z056E5OBcpImQRqU9YowudzK8lxKlAYn532chvCaTf3H8g==
X-Received: by 2002:a05:600c:3c9e:b0:40e:a36d:ccd1 with SMTP id
 bg30-20020a05600c3c9e00b0040ea36dccd1mr1487870wmb.207.1705866311866; 
 Sun, 21 Jan 2024 11:45:11 -0800 (PST)
Received: from localhost.localdomain (byv51.neoplus.adsl.tpnet.pl.
 [83.30.41.51]) by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm12547134ejb.193.2024.01.21.11.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:45:11 -0800 (PST)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Subject: [PATCH 3/8] dt-bindings: msm: qcom,
 mdss: Include ommited fam-b compatible
Date: Sun, 21 Jan 2024 20:41:01 +0100
Message-Id: <20240121194221.13513-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During conversion 28nm-hpm-fam-b compat got lost, add it.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index 0999ea07f47b..e4576546bf0d 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -127,6 +127,7 @@ patternProperties:
           - qcom,dsi-phy-20nm
           - qcom,dsi-phy-28nm-8226
           - qcom,dsi-phy-28nm-hpm
+          - qcom,dsi-phy-28nm-hpm-fam-b
           - qcom,dsi-phy-28nm-lp
           - qcom,hdmi-phy-8084
           - qcom,hdmi-phy-8660
-- 
2.43.0

