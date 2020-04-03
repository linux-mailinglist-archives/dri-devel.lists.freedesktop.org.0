Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3F019E4FF
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C06E1F3;
	Sat,  4 Apr 2020 12:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0496EBEA
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 14:22:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p10so8746800wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 07:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eO7X7pq9711SintqFPgETXqv2Z2n0tdDbbm4z7qxhxQ=;
 b=mr+nvzcL9deyVcXVL/g1iirSVwK3iqndoX+uC5K0N8OLS2lWwJzFG9Jw2Us/+fDJpW
 brLw+fuh6Ak35u+NuycplcSpqr82DZbcL0hLTZu/+IUeMfHv70EY85g6KjszihMlq5iA
 lSHDCK302Ag022kI1mIAq4N+ho3T7qHlcGZNzQvXl2zDPWFa/vGS/tAnUZqurLVHM11r
 WiZbq3t67mum6LuNLEe/neZ2QBJEXLMGOK8/86HtQtVT40k8OfRnx0CMngdy3mKuFtbT
 3V4NR93kIMMp7AZIbDs2j6RSLe193oXCWnU1L3yihX4G5Xlj/0HCPorjdSQgpacir6kO
 h8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eO7X7pq9711SintqFPgETXqv2Z2n0tdDbbm4z7qxhxQ=;
 b=pshym3jMpaur9z+h5FPhYALfEAknuK1fBOEdE29VR37BNL0YBsmgCvrdIGzAbZXMyv
 dHUHjrO4qia0Zuf43w/GG7B8e5VjC/qifk2ZXfliw1thbkzZP7y8yNtNx3jeNvw+ioGR
 VJQkxgA9cYdchfO2q5VhKc4ewdnEeD0pj0TDWYHLlREm5E8BPF8gi11gnZtr1xsVUf3L
 FDYXpInGKsnHp2WJaoulTBIOL5BOGm3iMfzRoj2HXmXYQbUKYLoLMbHnVlYlnQJjpF/A
 2W0vv9kf/ama+UX8BOtM0IoPvN7mZx/F6GQW2YT6oI1RPfTFCl7dxQuXH1b0W5yxtxYQ
 sN1Q==
X-Gm-Message-State: AGi0PuZVnaBcpgoZtbiGvSh3uGLrXR2N4nUsk6jR6yXUge+7niK25tpT
 t4AlfRQreqp1ASnw3JLPwVc=
X-Google-Smtp-Source: APiQypKqvGkEBCSrGQT9ZsOFXHyYXGCO7wGvqTuF8jcFlGkZFIKO0QpJ3Mhc4I2GDp3Z3cr8LBDI5Q==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr9559333wrq.345.1585923765447; 
 Fri, 03 Apr 2020 07:22:45 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id u16sm12132223wro.23.2020.04.03.07.22.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 07:22:44 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 2/2] dt-bindings: display: rockchip-vop: add additional
 properties
Date: Fri,  3 Apr 2020 16:22:35 +0200
Message-Id: <20200403142235.8870-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200403142235.8870-1-jbx6244@gmail.com>
References: <20200403142235.8870-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:44 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes v5:
  Add reviewed by
---
 .../devicetree/bindings/display/rockchip/rockchip-vop.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index 42ee2b5c3..1695e3e4b 100644
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
@@ -94,6 +103,7 @@ examples:
   - |
     #include <dt-bindings/clock/rk3288-cru.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
     vopb: vopb@ff930000 {
       compatible = "rockchip,rk3288-vop";
       reg = <0x0 0xff930000 0x0 0x19c>,
@@ -103,6 +113,7 @@ examples:
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
