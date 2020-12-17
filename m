Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BCA2DDFC3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E931C89BA1;
	Fri, 18 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65E06E40B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:01:06 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2so19199010pfq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 07:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Uq92YfzmtWSjZTbKFkuyonM+askUzHgnNcGZZh6OIBk=;
 b=BZ/pEkAG2NSByMExePG8ilUyRCSSNLjLpFGVBDJgunvDWIBCGRvq9Eg3RdCFLiV4AX
 b9OsRc+j4Oh+dgQlS6IKu7e+hkC9FNpm0NekwiTIqgg8oQKXSi1LGNtn9eAknivM0fwQ
 H+LcSKm3w63za0QJB3miz243UCoNHnJKgd7I5ITL+eT7Xa0aoMJJAc0SqRNYG7xib5jw
 tjQP16Gr93TIuiLfpOkTJS4K5Ui/U76P5LQhpjRnLiUhic6Xpf5ixRBcMF0yzmc1D1XH
 yz3zrKARqerJNAFIVLmabyAijU/WHSftexQ9DCzpkaayL/slFQDlYRtH1oBsNDuLCBys
 nfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Uq92YfzmtWSjZTbKFkuyonM+askUzHgnNcGZZh6OIBk=;
 b=fW0bkIjLUOUiKu/FKS5R1owtJa0pEgvhnnnmqzJBQfXnnmo/M3hMR0xbljQXumRxbQ
 SXSht1D6zVTcLOJnhvkNTQIcbNMYfIvKD+RlrdqTl/SBQagYmkCcZfuvxfJ+OE+8YndY
 12KyGsUz/+X1xUhZpqnvziKpU3m2TdCKYbCyQWAUDB6GrniGbvzAWb9lshWS4hbX+gNd
 Q2++L8HkRZ3bsOi/Rqk/sNzmzkYDT29DzX7/bv32ETqnE3hUSllCal2QQQ0eF6kxe1dC
 Cp3EBSiaauMzFDpJ5quu4lRRaZwMVk2tqQpKqN516cRAjXRQn8zFlWSka0ZgMjhRjLpu
 v+Uw==
X-Gm-Message-State: AOAM5328BJlwKz3ELoiTwk4SGgEhdkx2APgWXEDqRgQsIKHOnU63xAwf
 or4rmUO0zMzQOTPr2k2d0ww=
X-Google-Smtp-Source: ABdhPJyMsnxzPBCQ1rN+mgfhydGddI2u2yYvHW7qgN9qbI6bCHKjO9xDQd7uK9+yjYyoCKSxJUWz3g==
X-Received: by 2002:a63:924f:: with SMTP id s15mr7726183pgn.360.1608217266388; 
 Thu, 17 Dec 2020 07:01:06 -0800 (PST)
Received: from localhost.localdomain (1-171-2-187.dynamic-ip.hinet.net.
 [1.171.2.187])
 by smtp.gmail.com with ESMTPSA id o140sm6189074pfd.26.2020.12.17.07.01.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 07:01:05 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Subject: [PATCH v5 3/6] regulator: rt4831: Adds DT binding document for
 Richtek RT4831 DSV regulator
Date: Thu, 17 Dec 2020 23:00:41 +0800
Message-Id: <1608217244-314-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608217244-314-1-git-send-email-u0084500@gmail.com>
References: <1608217244-314-1-git-send-email-u0084500@gmail.com>
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: ChiYuan Huang <cy_huang@richtek.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Adds DT binding document for Richtek RT4831 DSV regulator.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
since v5
- Revert it back from v3 patch.
- Drop the example in dt-binding, Already full example in mfd dt-binding.
---
 .../regulator/richtek,rt4831-regulator.yaml        | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml
new file mode 100644
index 00000000..d9c2333
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/richtek,rt4831-regulator.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/richtek,rt4831-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT4831 Display Bias Voltage Regulator
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  RT4831 is a multifunctional device that can provide power to the LCD display
+  and LCD backlight.
+
+  For Display Bias Voltage DSVP and DSVN, the output range is about 4V to 6.5V.
+  It is sufficient to meet the current LCD power requirement.
+
+  DSVLCM is a boost regulator in IC internal as DSVP and DSVN input power.
+  Its voltage should be configured above 0.15V to 0.2V gap larger than the
+  voltage needed for DSVP and DSVN. Too much voltage gap could improve the
+  voltage drop from the heavy loading scenario. But it also make the power
+  efficiency worse. It's a trade-off.
+
+  Datasheet is available at
+  https://www.richtek.com/assets/product_file/RT4831A/DS4831A-05.pdf
+
+patternProperties:
+  "^DSV(LCM|P|N)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single Display Bias Voltage regulator.
+
+additionalProperties: false
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
