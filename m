Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBD34310B5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 08:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BB26E088;
	Mon, 18 Oct 2021 06:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8DC6E088
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 06:40:18 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r18so66762667edv.12
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 23:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20210112.gappssmtp.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/7hBCmpfW9MTjUXgrKdtGWjkgtU8/we8OWRfC8+kMU=;
 b=jGCiFWIozFtWDE1T+9nxnGqjF2A1pX0+KZyJP2RLpI1vI6tRTql9ktYE+xvnk/+nVT
 i54qqTOQ8UiOV/6Djx6Ye/m4JtiqqiamvXTRLztf9jzVUnpfGpV1Ws/rwnWQb7B4yxKB
 o4sjyaGPbV8qTNWy0JTp9g9vY4Tfg0cPTepWFBmMcluYYGabrGcUAkxIRSGLfWis0DfA
 mtNNqgM6xE+fU9Q1IuONkj74QTkmrfagz4ASHP086615rpO9S1SwknxKofRDQieBsKgh
 H6Uq1xO14mKNaLR1Zshuql0Tyh8a1C3QmyYImRYCZkn02zfFbSKqndXljCavVNIqwSIj
 mP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5/7hBCmpfW9MTjUXgrKdtGWjkgtU8/we8OWRfC8+kMU=;
 b=I02lSfTPHM+jt8OZnDyKErI0DwN9Ky1rX+vKJqoEq5pBYOaN4zmNrfPslnaxs+HAHr
 sbosPYBACmMd1XHeDIj23ErQLI17u3a3nLzHJaK+kHG0bnsNkQOqVwDIYmIgjk/px/+B
 ecS+ecZJBeZ0USNnMzrMZNy6jhkiPEH/R6TYLf2pse8nhLQlKaHpYRRqocxCsO9VRblo
 xJR/mKAC1kJuBp6W5ggjHEhjBVTuaKBCYPOM6isOMSlaV5dyA/vh4vHberzzLdo+at/9
 PJkyJNtl5sAlme5PfcgbqP9iTmObJljUUJw/cp825fJjyoLpzNm3Ar/KyyxTf3ION3rY
 8Ghw==
X-Gm-Message-State: AOAM532O3v86XF190KJNOGKwdW32yLsgw07dbdPS+7zbxqiGirjB2oAq
 s7nKqHJRldoLe3urydGSlx/yXw==
X-Google-Smtp-Source: ABdhPJwpfA0BoEQhv6pd4Op8P97mbX7msngKe6mKU3AEA7gl3+/5yuT20iGp771CluTA50hpKXe3qw==
X-Received: by 2002:a17:906:6bce:: with SMTP id
 t14mr27276140ejs.546.1634539216960; 
 Sun, 17 Oct 2021 23:40:16 -0700 (PDT)
Received: from localhost ([2a02:768:2307:40d6:f666:9af6:3fed:e53b])
 by smtp.gmail.com with ESMTPSA id j22sm8253013ejt.11.2021.10.17.23.40.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 Oct 2021 23:40:16 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: display: xilinx: Fix example with psgtr
Date: Mon, 18 Oct 2021 08:40:12 +0200
Message-Id: <a291be294dea6e580ad9acd436742a48b7cd00a2.1634539210.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.33.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit cea0f76a483d ("dt-bindings: phy: Add DT bindings for Xilinx ZynqMP
PSGTR PHY") clearly defines #phy-cells as 4. In past 5 cells were used by
it never went to upstream. That's why fix example by using only 4 cells
instead of 5.

Fixes: e7c7970a678d ("dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings")
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index d88bd93f4b80..10ec78ca1c65 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -160,8 +160,8 @@ examples:
                <&xlnx_dpdma 2>,
                <&xlnx_dpdma 3>;
 
-        phys = <&psgtr 1 PHY_TYPE_DP 0 3 27000000>,
-               <&psgtr 0 PHY_TYPE_DP 1 3 27000000>;
+        phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
+               <&psgtr 0 PHY_TYPE_DP 1 3>;
 
         phy-names = "dp-phy0", "dp-phy1";
     };
-- 
2.33.1

