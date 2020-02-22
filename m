Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2B16A202
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1C96E2DD;
	Mon, 24 Feb 2020 09:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7DB6E98B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 22:04:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so5322295wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 14:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WecMb7XC+F71BDVsaL32uLe6ZzntKQ/HmvHZGIxKOJo=;
 b=vaQRLUiXMysRiqAX5vXIJmFxStAF6yVfmi7kTKH6PDgx7XQtA6hIFgpYkLBjVc7dkk
 b246OiYA+c5qNP4lkL0WZFN9Q3/rs5qeIfuyhJnqmAHPTvSb89mC0nK+f0+2yzCdwHEY
 XCRmEOYlLF0u19r0cdKa4w8fShbIQ3J6Gy+/i6lVbPtl/5PMWz16MoSF/AI3cFTRfQBg
 NQ+sWNAucuPhBBexOVEvTIrQ9lbL4O+/5NXAoj0RF3jro7onhpxUgjl/JumoRTDPtKkd
 b+W8cKKUM7/pbC9US5LV/dEoD++R3xcnCGlFxezyIV+P4ZmidMBfqIxtBiSh+6LEP81d
 AOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WecMb7XC+F71BDVsaL32uLe6ZzntKQ/HmvHZGIxKOJo=;
 b=mIu/QldD7y8DUQsK+sldlU7sXTEMY+ouBk3HQMFruxgx1nkjTN8SSAgbsaempPAzhJ
 yFYPgyg04s3xdgQjxQHNqi5Qn5pxLH2gKEU53AdA63NQdjSePpclDl/X+VE2H3RIkAm4
 FzmcOmOM8o9AzrgG8y+Imy0xY37Vv/012Lbs5aNT+FlCYTRduXI+7rYlb8slYl5eI+EL
 Ye3uPwVTySVJz9yK874KDkPz/mz8Kk5dY8MQ2HoownqoC8LOmmEmplyuau70TXTLon+3
 AhclJ+Y0AzS84vQbG3sRumvezDzXVlDHYwtUffhFBRToJ9bmQmLmWTaG7RQ0QE4geylJ
 Ze1g==
X-Gm-Message-State: APjAAAVWmzl8edgWxQcuqTiIU1dcjkS3A4etHpsDgt0fHB5oHkqsX0Ti
 pjoyKEkFY/BGN4FHmrfzuqI=
X-Google-Smtp-Source: APXvYqzs7BVHkeHnT7UYxo1FTYom5hTfpobIJ3SJTo2JpyOe1y1s1pwDWzNEu/vAeDHrx55v44VS4w==
X-Received: by 2002:a1c:7d92:: with SMTP id
 y140mr11567948wmc.145.1582409086211; 
 Sat, 22 Feb 2020 14:04:46 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 q130sm11151738wme.19.2020.02.22.14.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 14:04:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC v3 1/2] dt-bindings: gpu: mali-utgard: Add the
 #cooling-cells property
Date: Sat, 22 Feb 2020 23:04:31 +0100
Message-Id: <20200222220432.448115-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200222220432.448115-1-martin.blumenstingl@googlemail.com>
References: <20200222220432.448115-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index afde81be3c29..33548ca2a759 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -162,6 +165,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
