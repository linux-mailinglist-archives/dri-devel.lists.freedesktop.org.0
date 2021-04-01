Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9D352371
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C5F6EDBC;
	Thu,  1 Apr 2021 23:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6EADA6EDBE
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z0lYTdb; Fri, 02 Apr 2021 01:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319042; bh=idGeGDMuTsStp4vF8SXGTMgpXvKEHjatMqlT1DTb3kk=;
 h=From:To:Subject:Date:MIME-Version;
 b=CjYv5/fyhqxTq36vuX1e4GHyVjx05uc7K3mSsP9dQ+OuKcPJeAK+yti8yNm4siRB5
 3HTnKF8kd6QUOGqzd4qynzgEE0R3RIGQKGRUqZnpefNuPdrWY6OcdSNDgaI4SaUDEk
 HFvnPLuxXXjqivrdJ/FXqdOE9I3Zy+G0+FglOEkYySQZPxrp//IM+EvJtgkaAL/BE/
 +8yWK2Lcg9G61V5AgmHRXISOmFILd//VJtgjeG4vIAYFeq1v9DtgOaUqneJ0nySS1P
 XJCQmg0NU7E9s2RRR6w/fRkpYNDMJUKbt2aztyjDZcreaZ+jGtHSKAKJDLFun56Ke3
 2JYKWTMBfeGow==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/9] dt-bindings: display/panel: add Jenson JT60245-01
Date: Fri,  2 Apr 2021 01:17:13 +0200
Message-Id: <20210401231720.2470869-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOL9AQ4RcJL649SgpWxnuzzFzsY6X41cjGOyr1mDgbIcV3RK+zL7bNLpVfgTYd+Fq/MgpwJSKFTMyDYQ5sweB9MbYG7aPEPXB8VgXG8r8XAwEPxv7G07
 hUAQqG6AyHlCdSMDjG+6exQMKlCostH02aJfVN/kX7VzHnpikc+t/2/n1kNZKAETrqEDj9MmSWOPg3sr+fJUj+vDJPIqk56m7b0xA9FuuG6qjP5xhfbx/KYr
 bSlWdrS1F2vXwRTZU3PG6NQFG1WTEp+KicDyUt5OKYUfWDCzyBZgJbC7SN9Q7VWvKcjBzkvEQ9DTOHiWyB+AB6jfEJUvG/f4eVKYByQ6U2TkIWMPptWg1K9v
 2ii7tPwAd/ndIFSTGmhKiX8RYRVTmxndOxovzcOIXG6SeG7j5WYHqTGSzRc4snh1MnRMXZbTpqTx1YDkxBkhserR0vXBSbd7+YIVDw3nkhBI4EOQAuU=
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add DT binding for "jenson,jt60245-01".

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62b0d54d87b7..ce41a589a3f4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -168,6 +168,8 @@ properties:
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
+        # Jenson Display JT60245-01 7" (800x480) TFT LCD panel
+      - jenson,jt60245-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
