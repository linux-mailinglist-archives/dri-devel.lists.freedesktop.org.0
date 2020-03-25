Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92360192810
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 13:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4089D7D;
	Wed, 25 Mar 2020 12:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525A66E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 10:38:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s1so2322343wrv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/wgvz2lVpp5+P73ebkZ5cpJlG6NyplWSlH1ZFZco8LM=;
 b=eReNsT3/ql4XtBGPugbUGLIbqp4B391Ps/1xoYiR+OGIUAH8+B72MCrP2HlKPfoWaP
 pqYGsv0O8ZMQL6PQ+IalWVy372tw3azPRtzZgqDbyElePH+Tqh+q33JT2PdJ0HFxNGP5
 qRaT84ztZV1Oows1zWBxj5nUJUo4aoP26PcBpAec19SxZPm2MMk9Uq/svtyyxKJa3orv
 yvka7cvw1E52RdM4qI00bCg31CXx3lSjeUvvg7UbfjpHHVojeBhPr/W/FFRckGeye2FJ
 15R/lKijLyeFma7tkjaxFYbz40cTthdWPkHJoqQNrVmFBJPB1baHaW6/959pOfdz/cVB
 JpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/wgvz2lVpp5+P73ebkZ5cpJlG6NyplWSlH1ZFZco8LM=;
 b=jzjvsgsCd/qSyOqGS/+TNOqerPzQG18Fng4DEElYdhQ5QrcZv+xFAO7rrh68FjeidB
 qkkDAr2y0UN99/u9AHhaLfIbV4EcMonnzxRpTvZWNTjqgCSxRo69+j3ms7Z+08uklECR
 m+9z3vU8Ay31KbWzKSo87F+Hc+XPGDLx/Pj1RcvlHD96ydlifgjln3bIo/LA4q71h2U+
 Un+EHFiCga6s19yH+UQz3z8spvtwRY3/ZCgXGbTU9KBk5m3KBbl3iu4XaL+dQeJ+RZbr
 6wdnsYYrfFFiSA0Oi6nHQrbeqnbyYkQ/SDJuY323eDCsTTD9DishTElEJ74YpnjJ+qbC
 wtNA==
X-Gm-Message-State: ANhLgQ16ljSCRG9wqmfcKYNRrcXvrJgo8KSwjPvcoWDcjxuAxK2NtybS
 T/WCoiqcb3bJJgN8uTmUxCk=
X-Google-Smtp-Source: ADFU+vt2Dw8Gg8y8PXMVIdEPTxwRM9hacRHxiTFN7DEjZdRm/qg5K+XBLFsyyZk6b1ZiLZCI4gwDuw==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr2871409wrw.41.1585132716907; 
 Wed, 25 Mar 2020 03:38:36 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id i21sm9163108wmb.23.2020.03.25.03.38.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 03:38:36 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 2/2] dt-bindings: display: rockchip-vop: add additional
 properties
Date: Wed, 25 Mar 2020 11:38:28 +0100
Message-Id: <20200325103828.5422-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200325103828.5422-1-jbx6244@gmail.com>
References: <20200325103828.5422-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Wed, 25 Mar 2020 12:19:30 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like 'assigned-clocks' and
'assigned-clock-rates' for rk3399 and 'power-domains' for most
Rockchip Socs in 'vop' nodes, so add them to 'rockchip-vop.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index bc58c5132..497a9fb2d 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -75,9 +75,18 @@ properties:
       A port node with endpoint definitions as defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
+  assigned-clocks:
+    maxItems: 2
+
+  assigned-clock-rates:
+    maxItems: 2
+
   iommus:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -95,6 +104,7 @@ examples:
     #include <dt-bindings/clock/rk3288-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3288-power.h>
     vopb: vopb@ff930000 {
       compatible = "rockchip,rk3288-vop";
       reg = <0x0 0xff930000 0x0 0x19c>,
@@ -104,6 +114,7 @@ examples:
                <&cru DCLK_VOP0>,
                <&cru HCLK_VOP0>;
       clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+      power-domains = <&power RK3288_PD_VIO>;
       resets = <&cru SRST_LCDC1_AXI>,
                <&cru SRST_LCDC1_AHB>,
                <&cru SRST_LCDC1_DCLK>;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
