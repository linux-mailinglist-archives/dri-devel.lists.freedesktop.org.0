Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FFC5AF309
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF1210E24D;
	Tue,  6 Sep 2022 17:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CDD10E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:30 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 n11-20020a4aa7cb000000b0044b3583d373so2055083oom.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ORAgmiG57p/S9ocR1iRk76VvyBsd1+DxcS7O0rlHDs0=;
 b=U5Y4i5jx+40Cx/xgDGq5I8pG9GGoT/wBANnOxRC1QYjQtco82MIEp0iLpmvWiEueFf
 nPthrGMsA/B5nPavWnddRw33xlMDuUwM5QayNrilaND8+mDCU6gasVa0o7X4mAKo8ksy
 rfDrZXD6+EnNdMyZWmv6OcIj5zu0ZKEhMBw/FPiLWw2G6ERAfZg33d+jNrr2nyi/Cajp
 K+4tLN1xPP8VQEPv1yQKSPYWAODfml+LplHFIYMPEyGterhytbVd0p7OWvoGqhZtblzy
 wQWRBVbLhLIejlcJVHgF+DeikMwWZN81V5RGuFJATEl1BmOpqX+EIV0qGoXCvS4pospT
 u5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ORAgmiG57p/S9ocR1iRk76VvyBsd1+DxcS7O0rlHDs0=;
 b=oIC04d8u2l3Ywj8hKEfIH+hSVyVS8fAiUfk/kzV/ZQ9DHZDcKOZziiibmJibtf3Gx3
 fHweYJy1P2NtklRxcAuRLirTWO5FacYgidMGbmmXdIydy333/zs1hzdwGwHI83uLgcAU
 OENgjn0Qdh99WZ3WHZq0e+JUQWsNoq0EaK0FVCIF61YHWhtxftxMBvEKMHW7Zn/z8R5n
 0hd4Cjp6clZ0rUrGMbY4rPWVRN2C9NouIMDpk4hXbt3kLjTFxtukag4cc5IJ+MdofTHO
 G2amN55xcajkB+UOR+A2YWigW0AJJs0YpB8x3FJE5TdDxCFiXLeH2dItX1wNQg0iyuvs
 QRSg==
X-Gm-Message-State: ACgBeo3FmYEmFdC1VDvRwg16EGntPDtWPkNtqmrf2+AQde/Ta9kPSQLV
 FUT6DIVAed8Sf3+Vh8/vnZ8=
X-Google-Smtp-Source: AA6agR4hbHRGQOp1BJL6pGJS5Rw997lx2vRqKeDCTqregl6X9KNodLb0ILtqgU8K5/N7p21z2icjwA==
X-Received: by 2002:a05:6820:541:b0:44a:907d:c641 with SMTP id
 n1-20020a056820054100b0044a907dc641mr18987260ooj.65.1662486509383; 
 Tue, 06 Sep 2022 10:48:29 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: display: rockchip-dsi: add rk3568
 compatible
Date: Tue,  6 Sep 2022 12:48:19 -0500
Message-Id: <20220906174823.28561-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906174823.28561-1-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
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

