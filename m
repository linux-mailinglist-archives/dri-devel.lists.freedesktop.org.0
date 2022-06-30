Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35024562CBA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F78C10FAA4;
	Fri,  1 Jul 2022 07:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7268112FBA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so1546668wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Y364367ZETPbYUxjT/bYJ3on1jew7iPHooGEySLfcg=;
 b=F2Th9MYS3e7kKEY/PRcP6iGG14Gg3stmsqlhD5Ge+759FtxKhNZrh1YznniTP37FnI
 iwv1WQ+X8RB2mt7SO+JOLBbP4aC/haKWp6wfdrXP1pkz/qQqX06jy1iYzoZJZPCl/tup
 n9slmYihLyneqnI513seDapb8epkBQksUV2yyFKCnVewyiKsFr2UYJD+3aHs2GXhf/u0
 69TMQmj9yzEFT2/p9DKx6LiifFIkrsclsKK2MGMWVvOL06XARM28CpPb08EPAXDwUZiv
 DrIaJIXD/NFwL9TNKUZIg2S99wW+xY9NCxtEh2UXu2HeQnLoPCxIOcKlLg/1s56ISUQm
 ocUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Y364367ZETPbYUxjT/bYJ3on1jew7iPHooGEySLfcg=;
 b=usCAb+KA/jZ1pe/vi9hd5qqLNDQbzbQ9tyiUi61S590XmtyuuOhr/1ikxdl4ZGWt5f
 aQ/3DxfIg/5gNxNu/np81r7xO2mCqPCZ8FDYK7lgv25Ju3cIPvjZ57HU4bokZ2njPYWk
 6WQ8nSt7fgJfLrZAGdBMWvzuz5MpEfK+ABqEcB0IIF/xjslaTx9gSeUEKlUdpEf6cUws
 S3v/FUQBcSCYCYWrZzmvdAFoNbUrw0HmIwwWETMDX0Gzf/RqZhtmf7O7/jtjkk12NsTw
 aJfm4XrpkvfInA1zhEQtwUE29Rhe4xjsmy6O+urRMDqV0Sn5y0LO9aPHF2DaLew+ZnET
 DqaQ==
X-Gm-Message-State: AJIora8KQRCxr04YscM9kk1X54IUm9Dfpc9mn9RR4ABiLkvh7aZh/g9C
 h0rIfN0q+UuZzd4hn20KKwJVug==
X-Google-Smtp-Source: AGRyM1sObV4Rfm6jYF+yKcTsDVbHI1OJZvADjgK9ncMMPWFLgqXPeWQ03hNKyahysgx1uF02bIV4nQ==
X-Received: by 2002:a05:600c:190d:b0:3a0:585a:256 with SMTP id
 j13-20020a05600c190d00b003a0585a0256mr9309229wmq.54.1656590937377; 
 Thu, 30 Jun 2022 05:08:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 7/7] dt-bindings: msm: dsi: Add missing qcom,
 dsi-phy-regulator-ldo-mode
Date: Thu, 30 Jun 2022 13:08:45 +0100
Message-Id: <20220630120845.3356144-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
When converting from .txt to .yaml we missed this one.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 9ecd513d93661..3551e166db966 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -40,6 +40,9 @@ properties:
       - description: dsi phy register set
       - description: dsi phy regulator register set
 
+  qcom,dsi-phy-regulator-ldo-mode:
+    description: Boolean value indicating if the LDO mode PHY regulator is wanted.
+
   reg-names:
     items:
       - const: dsi_pll
-- 
2.36.1

