Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E62636F39
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 01:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8510E678;
	Thu, 24 Nov 2022 00:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7FC10E66D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 00:48:13 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so181976wmg.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=HioKk5uWFil0Wena7oP7RdN+LDvb0Fz4Cr8QBLcParrvhSNKE4aP3CD5Cr2E8W5GsP
 /JBhSfjTQLHz93Ti5CeJytS8yS6J9dHiozFEtkZou9sEOm4Nb8tvC8EFEFaClK7nmsRO
 oSJXj2MHtlJDqUWeibWa02dCTVKGEtRco7qxY2loBi9IFWdAy/i8570iGgLtXqUO5aWw
 VRV99cZNi4fRi3zfhv0EMeItbYCeVeTf9gnZel4hsM0xhaM1gMiNT7AGaMEXIdiD7KyI
 FhllxQ5N/+3TZVLiUznkmblAYM5T2nWemUti7w3sP5ryRD7m7t79Y89Ds7/3BZzv7U9h
 gyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY9zIcCRGEu7zo0/qER9MM7m6z693FsbNLfr6+dvuHk=;
 b=F6vckp5KOJ+b2etx2JZxb4aGfafKGgPs2fPip18J3p41eH2cHu2A8ZtPO/UCvx/X89
 OrrcQ8tYj9YgbQYiU8JPPaz2qRzeoZ8SxWtDAQoF+ekxCb2Qnkrh6onJzfA21BnkfSlw
 JZY2Klv/zNdh7tNoXCh2sFRusXJQhva13ZyRuwJiW8sErGI5QLkF2ymH9zhgd5553VHA
 ZsLdYFwVZIDpA48NcVfWN+ARNRJk/m5You7YR6SHNWTKjdqgwMzyJHqdlccP1AVTbx4I
 RCinceTvVrjRmZIqZ+KWqvR04jleYfBD6klIq4vi0O2tgWZOpxcdMTWi/4JPX5zdcFkH
 cNaA==
X-Gm-Message-State: ANoB5plw09kdIGUXw8aXyJ70+NPWVF2LV2yv+yqs71t5VqZPH2zF/ozK
 LCOH8o4beASVdWY7Txx4rnw08Q==
X-Google-Smtp-Source: AA0mqf7g4djkFPxv22hQv3S9vFbRPNPg6xb2eSD1P08WLUS7G5q4KIZhgyvhyz/SXAZRY2dgSh6cRA==
X-Received: by 2002:a7b:c3d5:0:b0:3d0:306c:f7a3 with SMTP id
 t21-20020a7bc3d5000000b003d0306cf7a3mr4849498wmj.128.1669250892155; 
 Wed, 23 Nov 2022 16:48:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 16:48:11 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 06/18] dt-bindings: msm: dsi-controller-main: Fix
 description of core clock
Date: Thu, 24 Nov 2022 00:47:49 +0000
Message-Id: <20221124004801.361232-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a typo in describing the core clock as an 'escape' clock. The
accurate description is 'core'.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 88aac7d33555c..0c09b9230b7f5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -40,7 +40,7 @@ properties:
       - description: Display byte clock
       - description: Display byte interface clock
       - description: Display pixel clock
-      - description: Display escape clock
+      - description: Display core clock
       - description: Display AHB clock
       - description: Display AXI clock
 
-- 
2.38.1

