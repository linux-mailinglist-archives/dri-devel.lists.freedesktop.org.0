Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D8591245
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5F10E5C8;
	Fri, 12 Aug 2022 14:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0007995D9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:32:54 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id c185so1319914oia.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qnSptJt7AFNWmzxMCkqf7MrpKQxtkc2Z0kVrcaCyyfQ=;
 b=fHUNNf1S5S9u5i9fO6AoDb45aFdyI7LsAef5jdetPzmCLDJQDqxAxoVfC/3HOZ1+fF
 rXvmcusyEHkXlXsD6IUcE8yfI6sTcNMZ8Jt0Qs/s3VMKIwyyrQLlJc2zCziVEyxSopG4
 uHzcI2qvtqh+d2Zv+GYT3xA/rlsx2w73DAHXU2Ii8O/EYYW54l8xhJkmjSrplePShJ8G
 rRU9XPhaBlRLEOKg1iqbtJ/nz5ik/U2i988xeKfWsZDnMaziVQBNdST8lfYWlNBuqhyj
 XCI4hk6UqVGh7k+7D1wbiidrlhynmE2m0hg5cxxn+C7eACMsBSF/p89iIzNC5CJACXqm
 KzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qnSptJt7AFNWmzxMCkqf7MrpKQxtkc2Z0kVrcaCyyfQ=;
 b=sPwntrlrbHmWAmZ/ko30uPdZVxODaBm3yJZf+0AwDrmdxbx5+jR2qjx7LM1F359X93
 WlXidVO0JBVvBQaY6VvvNelWAtF+USzVf+KrymT+xR7W6CCHWlIGQxN67zB+ADvrlVe3
 3Ztxzy0hx3NqDpDlDIVxR2Oc28SqDt10WP3tOlNc5AOcEkrKfDzfqvDg3vb1ICx2M7J4
 bWtIt1WbMUjm3ORVjf7ngBnPjmOkvr48aSAPxfg1DbED9IEUM2h3kOYzvdDsF3HTp40R
 o7Yd6mH/dW2GZVbCQNDFw6hQMeoB2aggGAd0CBvLy1QRHi/7QynlzpO0p1zVrxofDQT/
 X++A==
X-Gm-Message-State: ACgBeo37ul7p+D/H443vAysF1R/OkQ50SWYhlbUSAOfPJEUUKhR8Xh7X
 Z+eT/sxHlGkqzWZt4y0RpD4=
X-Google-Smtp-Source: AA6agR74gN/Xj6CR93wrkDgpBU4uyyTXxxFhv531ShDGFeFjwDWXTSLw+iPpQOL7fuxOLOc8RLh9UQ==
X-Received: by 2002:a05:6808:1c07:b0:342:d3f8:e73c with SMTP id
 ch7-20020a0568081c0700b00342d3f8e73cmr1767595oib.71.1660314773714; 
 Fri, 12 Aug 2022 07:32:53 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n28-20020a0568080a1c00b003436fa2c23bsm282879oij.7.2022.08.12.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:32:53 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [RFC 2/4] dt-bindings: phy: phy-rockchip-inno-dsidphy: add compatible
 for rk3568
Date: Fri, 12 Aug 2022 09:32:45 -0500
Message-Id: <20220812143247.25825-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812143247.25825-1-macroalpha82@gmail.com>
References: <20220812143247.25825-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add a compatible string for the rk3568 dsi-dphy.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
index 8a3032a3bd73..5c35e5ceec0b 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
@@ -18,6 +18,7 @@ properties:
       - rockchip,px30-dsi-dphy
       - rockchip,rk3128-dsi-dphy
       - rockchip,rk3368-dsi-dphy
+      - rockchip,rk3568-dsi-dphy
 
   reg:
     maxItems: 1
-- 
2.25.1

