Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990A591244
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3AB12BA43;
	Fri, 12 Aug 2022 14:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8013D12AA46
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:32:53 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h9-20020a9d5549000000b0063727299bb4so665458oti.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ORAgmiG57p/S9ocR1iRk76VvyBsd1+DxcS7O0rlHDs0=;
 b=L19EYLdShAwN3qzEFR6fD2T75Fo5SjgH9YAE1tB7BZwbamNWm69s2TazBuiEWpVdjP
 6q90Et1+osane5GyjPjHIy/N7zHzKxkZtj3iLNBKt1AZZtGDaRrGGXmERhGxR5P8bcYb
 EkHQVxOwW5nmHP/KaWYGKrMA+b1I621PC7b87OhtknlVyKmNHxa3ncfUa9GQxcEZUd+Z
 aLpauA69TRhf1xl6Piz8oQHi1D5vQnzaGxicUSsJpLGz/SpcIdCy3qbrV2WE/KfoNdGr
 frF+a2SAfgDJ0+yRRP8MBG1SGcY+tkHN2VGLKMgOTI3t8v6YRs/AJj5uCYhlT1SMx2Kx
 7rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ORAgmiG57p/S9ocR1iRk76VvyBsd1+DxcS7O0rlHDs0=;
 b=Klywm6F808v1JTXe9FSYa/k7X7fWF5TsD/epd4a5Mqs9jHiUeGESDjOMNfaO+fFQna
 NwGCuQzKw2AUy7ktMPegHHS2lwnQtu+Li0ZHqn/1MCGBChgHwWUtkjJFvLr7akOrokWq
 y3PFN2MEYg/a+hxsXzCwS1MtQFLMnHburdIeeBo0WVFBZClCMzeszIy/v5ZSFKsXiK46
 J9rgqRVSUrlaFBjT+AWxNhSWVQbLOissCmCsiEJkBawc5TzOhbtJxxgKV4QpashldwOj
 HQhT2AaqSNkBoA893Qe0fd7GNl0mlp/KITGYRbYz2pZNuim9aIkki1dcg7xn3ByKvVq8
 NwPw==
X-Gm-Message-State: ACgBeo0xIm4kplCUYUWaQpthv/40oiWa7FOosIFxcA1UJH2SIce7Miq5
 eb8ybEkMyb88VcsGF3YEkf0=
X-Google-Smtp-Source: AA6agR5VxJHnzw9+8xRuZYBQGYnX+/ThoSrZzHgyNEu8fN+Id2bgeKZHZFCAIxPWejdhKq8FHKUUaA==
X-Received: by 2002:a05:6830:16d9:b0:637:2e86:68a8 with SMTP id
 l25-20020a05683016d900b006372e8668a8mr1497242otr.334.1660314772643; 
 Fri, 12 Aug 2022 07:32:52 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n28-20020a0568080a1c00b003436fa2c23bsm282879oij.7.2022.08.12.07.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:32:52 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [RFC 1/4] dt-bindings: display: rockchip-dsi: add rk3568 compatible
Date: Fri, 12 Aug 2022 09:32:44 -0500
Message-Id: <20220812143247.25825-2-macroalpha82@gmail.com>
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

The rk3568 uses the same dw-mipi-dsi controller as previous Rockchip
SOCs, so add a compatible string for it.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/display/rockchip/dw_mipi_dsi_rockchip.txt           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
index 39792f051d2d..9a223df8530c 100644
--- a/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/dw_mipi_dsi_rockchip.txt
@@ -8,6 +8,7 @@ Required properties:
 	"rockchip,px30-mipi-dsi", "snps,dw-mipi-dsi"
 	"rockchip,rk3288-mipi-dsi", "snps,dw-mipi-dsi"
 	"rockchip,rk3399-mipi-dsi", "snps,dw-mipi-dsi"
+	"rockchip,rk3568-mipi-dsi", "snps,dw-mipi-dsi"
 - reg: Represent the physical address range of the controller.
 - interrupts: Represent the controller's interrupt to the CPU(s).
 - clocks, clock-names: Phandles to the controller's pll reference
-- 
2.25.1

