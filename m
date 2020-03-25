Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B816193352
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 23:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5026E841;
	Wed, 25 Mar 2020 22:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A4E6E841
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 22:05:49 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id q128so3981682iof.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 15:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwF7FEOUbNvNk4mSehe5GSFcN0+uDrOJWlHbrUm2jl4=;
 b=loDCAqotvEfb+TpX4MLCR6ACPsGutT5KLBWrcw8tVz83kDPTlf8/lNm4MikvPKOGeF
 ag0hPQm5gSA+P4AfoSgOD9boZmovEXVVKPG0TT3UhuBu4ItN/Y9ztXb5Ndy+six3OEK+
 ADhHTHApbuzq01tMCNmvPJbtSl7811c9IHTabaJ+A7k2F5IQXnP9kgfqrBada1E6JkJf
 u6ho4IuAk9qQbtEljmRyCgEEfLthx1XkMTRINkxlZtosn+5d6yTcsadD+gXiBCr8u1cd
 b/4DRKflzVvvig11BT/z8n59tnjcpQ4CG/J1BA8V98QY1AvX4kJD1TuiFNhojGujTrn+
 5HNQ==
X-Gm-Message-State: ANhLgQ34gJPLAZXm/eLOW7FWykZp3z/z4B8cTpbpgpfTUKesbtjhxaI7
 mZCjef0VL/3gU3OKcAAVDQ==
X-Google-Smtp-Source: ADFU+vsP1GIXWhv3Nn2746MnQvCz0PBygUKBaoaDtLTv4UJllArEZXEuLW2CGMWNrRni/irdN7azAg==
X-Received: by 2002:a5e:8214:: with SMTP id l20mr5055871iom.54.1585173948584; 
 Wed, 25 Mar 2020 15:05:48 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.250])
 by smtp.googlemail.com with ESMTPSA id v8sm102390ioh.40.2020.03.25.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 15:05:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: sram: qcom: Clean-up 'ranges' and child node
 names
Date: Wed, 25 Mar 2020 16:05:39 -0600
Message-Id: <20200325220542.19189-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220542.19189-1-robh@kernel.org>
References: <20200325220542.19189-1-robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The regex for child nodes doesn't match the example. This wasn't flagged
with 'additionalProperties: false' missing. The child node schema was also
incorrect with 'ranges' property as it applies to child nodes and should
be moved up to the parent node.

Fixes: 957fd69d396b ("dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings")
Cc: Brian Masney <masneyb@onstation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sram/qcom,ocmem.yaml         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
index 222990f9923c..469cec133647 100644
--- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -43,6 +43,9 @@ properties:
   '#size-cells':
     const: 1
 
+  ranges:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -51,9 +54,10 @@ required:
   - clock-names
   - '#address-cells'
   - '#size-cells'
+  - ranges
 
 patternProperties:
-  "^.+-sram$":
+  "-sram@[0-9a-f]+$":
     type: object
     description: A region of reserved memory.
 
@@ -61,12 +65,8 @@ patternProperties:
       reg:
         maxItems: 1
 
-      ranges:
-        maxItems: 1
-
     required:
       - reg
-      - ranges
 
 examples:
   - |
@@ -88,9 +88,9 @@ examples:
 
         #address-cells = <1>;
         #size-cells = <1>;
+        ranges = <0 0xfec00000 0x100000>;
 
         gmu-sram@0 {
                 reg = <0x0 0x100000>;
-                ranges = <0 0 0xfec00000 0x100000>;
         };
       };
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
