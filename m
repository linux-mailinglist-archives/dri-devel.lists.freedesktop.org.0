Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D951EA026
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DD389E39;
	Mon,  1 Jun 2020 08:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF4989E23
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:33:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so5617569ljc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T1ygFxHJVIxEBt6wXXS/imDDNlnn54bixhav2ujTgeQ=;
 b=G0e7CsGjPB7bgfXmsPT+GreUt0bZgbxMN5m4lGkUd6yEVQAi55HORmkcn/abWwOdEI
 0v4q3609ST8WdBQlLr9N1dUp9OkeL+xxc82LwOiA9Z6XI/PFp2OW9tUwlmxnY3ig/b+l
 CIkgRX9mTxEhWVpTKe9iDFG11CJ3Quc5ZJbwtEqhEXOy34yorbdB3UZCqb3+INMo5QE6
 odaU15AEbUisl3tMTVhtK5pHyMVq/nvlssu0yFRG6sZ7xGlgmOj7ySXoxM98v8EK7rnW
 VkJp395C1d0OsxcRiJ2N9IZMSG64JXXaV8PSqhJY7tPhKK/FWblyivhC6jf1fdTBMiqW
 ZKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T1ygFxHJVIxEBt6wXXS/imDDNlnn54bixhav2ujTgeQ=;
 b=mR+i4i1eK9Fuokrt1bADyCJqokcUvAYt+LnrOkHfYRAahhaTt0KNqVKfOOlOU9FBAM
 q490Uu3BAjhwo3EiNyh/OvDHpg6VrHUf/oZt50FoIvHOiAEpoX7OID1powJTDWQmXHqf
 l6VnWfYGN9F/ve7DXOSMkQSwFguRSsDiLnSXh72xOqehuWoJbvCyaav8VbJjWd8Z6Iq8
 jR99SFvceFu12RwwyTYQ3bHjZnh+wV6xJUzgqNujkSY8tDOFF2iJ9TB2GqTSn95STcxE
 x6CuSiiENWLFkj6W5/y2PAsoB4UB4ejCkxjWQAjgeuoHgZDkUEhX9mLPgogADSWiSmaY
 ysVg==
X-Gm-Message-State: AOAM530bIf8N9BaYatA2KDZWyROM5LN0Gm+6qQAkEBbCTrG1MjhYCQKP
 CRdVfOzc8W7ULzhMSgZmsaocmdXasCc=
X-Google-Smtp-Source: ABdhPJzp/TfYcE3kAes7KMoLCdOp5eZmICS8+hAoxDkSoycB5KLiH2g1SAmw5tlYuxcvBHTTyGtGBg==
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr9750506ljp.434.1591000397645; 
 Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: panel: add Hitachi 3,5" QVGA panel
Date: Mon,  1 Jun 2020 10:33:06 +0200
Message-Id: <20200601083309.712606-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is used on evaluation boards for Atmel at91sam9261 and
at91sam6263.

The panel is named: TX09D71VM1CCA

The panel is a dumb panel that matches the panel-simple binding

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 60cc093fbd75..6fe0ac86696d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -133,6 +133,8 @@ properties:
       - hannstar,hsd070pww1
         # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
       - hannstar,hsd100pxn1
+        # Hitachi Ltd. Corporation 3,5" QVGA (240x320) TFT LCD panel
+      - hit,tx09d71vm1cca
         # Hitachi Ltd. Corporation 9" WVGA (800x480) TFT LCD panel
       - hit,tx23d38vm0caa
         # InfoVision Optoelectronics M133NWF4 R0 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
