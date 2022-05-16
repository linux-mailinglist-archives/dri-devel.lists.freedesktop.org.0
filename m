Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27352B31E
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065C910E270;
	Wed, 18 May 2022 07:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0112810E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 19:38:44 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n23so4752389edy.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LebDF3RuPxmX1Cw/8NAKFfKs/e37d3Ws73/ZUWsOSYY=;
 b=bseiz9mTWBFks9ltjnA8R2a+/W7/FVLzfkmSDHkJfeKfQX1rYGRuIyUViZL8yKA9mF
 MLEAdCbqCH+RPshFcSqj8Y/AkfxtyUTdOtL2F5UnpHv0UXW0mf1LKw3QS/uRg9BEqWq7
 QMATuJ+nvY4vq7d4KZnFOq4VS8QyGepI2Sam7Qz6f6IallvZ+rxo7sHaARhKMtw359gl
 9H/CUYF9h8DrFCKvAY6T1zMs8VFaRAwHSyzzb1/zafJQy5vhl5bQ42vFNfVAh7T7ClI8
 oRRmlyG0j5tAoD3DEzyuDLbHY6upzDkmAnY6zHLJ8BGTThl1mtVURC7BBqr7hvTVZUbw
 kcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LebDF3RuPxmX1Cw/8NAKFfKs/e37d3Ws73/ZUWsOSYY=;
 b=ymjTuFxRU/YOnAyO8+t56qr8u0f6KSzCCfNx3wZ718r9vEuLVYRJW1niPdpJzrZjPF
 2HycCKJXdX0aTbqnh+DRg8j0FhX/G9vxyxu+4dv7U6PJhEPKSH9xPGUg7Ipl7YEX22Kd
 nthrqgvaYqcek2gkxbAg1iArlca73RmBkpBId9fmdGQo1gLOZ46vB9FIj7j4ahsTmSks
 5O4xB4DtlRFB8owkcmuecHmEoV65gJ4I/bNFTK97XQ64jcoiotM/zc0rlVYoIeW3R7z/
 ddRgRtkzLVhe0pLDOhTvDJelSdTITc4Nc+8xFz3RpHLF1nTYXrOOXu4HRsAWz9YGjTeK
 IgJw==
X-Gm-Message-State: AOAM532n5TdyBKgR7I2cZtfUHNtstlr5TpQtiYkfCBbdt12GkGbwV83V
 g9SKoFpEPPWz5nvqNkmbO2c=
X-Google-Smtp-Source: ABdhPJyTP9Rwj4orjplkbScv8cYbfHA3DBy1Z17s4DcQWsXitJXORWnR2TTE2sCfqqK/ke8zXrzj6Q==
X-Received: by 2002:a05:6402:f13:b0:428:a849:d0c1 with SMTP id
 i19-20020a0564020f1300b00428a849d0c1mr15059561eda.346.1652729923428; 
 Mon, 16 May 2022 12:38:43 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170906220700b006f3ef214e45sm94042ejs.171.2022.05.16.12.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 12:38:43 -0700 (PDT)
From: =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To: linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: simple: add support for Samsung
 LTL101AL01
Date: Mon, 16 May 2022 21:37:07 +0200
Message-Id: <20220516193709.10037-1-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 May 2022 07:13:30 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the Samsung LTL101AL01 WXGA LCD panel to the list.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 1eb9dd4f8f58..9501b5a3c011 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -270,6 +270,8 @@ properties:
       - samsung,atna33xc20
         # Samsung 12.2" (2560x1600 pixels) TFT LCD panel
       - samsung,lsn122dl01-c01
+        # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
+      - samsung,ltl101al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Samsung Electronics 14" WXGA (1366x768) TFT LCD panel
-- 
2.25.1

