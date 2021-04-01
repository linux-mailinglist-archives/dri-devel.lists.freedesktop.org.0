Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0897B35236F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 01:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1E6EDBD;
	Thu,  1 Apr 2021 23:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by gabe.freedesktop.org (Postfix) with ESMTP id 679326EDBD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 23:24:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.220])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S6YzlD4W1HTbyS6Z0lYTdO; Fri, 02 Apr 2021 01:17:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1617319042; bh=dGQJyzoOvaZ/oMBlClhRLrTVTrIBTYOzUofqylrfAkk=;
 h=From:To:Subject:Date:MIME-Version;
 b=EdQlCsy6ArI1ONne37C/1gNuBQejOwDdqoxe30xvZhD3vFr3tuSaJ8QpOmBPQwl1i
 6OUyINM/eDbu0mmPkodZ+Yk4U1MXCYQtL1xNCf+FgU30jOnsg6ILsUbSB7tlz61osc
 CJUecG4bQSW+Frk09BeAXFbwtw/46f0bp0t4twL7VAwJLoqPxzfUO9CO0XPw5RmUmu
 dOhQjNDzU8UpzqBaU8ff+RTqmIs7gejZmoXFf+pO+AcWchLRVy8Rf278QIx12SyJXJ
 MnT7AntKX6hWa+vutEahUIiqUu5iYojaNdEsJTQ3BbAB+lKlLagusOJS7B1QohvayO
 stcUd2cqJN6mw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/9] dt-bindings: Add Jenson Display vendor prefix
Date: Fri,  2 Apr 2021 01:17:12 +0200
Message-Id: <20210401231720.2470869-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
References: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
 <20210401231720.2470869-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOL9AQ4RcJL649SgpWxnuzzFzsY6X41cjGOyr1mDgbIcV3RK+zL7bNLpVfgTYd+Fq/MgpwJSKFTMyDYQ5sweB9MbYG7aPEPXB8VgXG8r8XAwEPxv7G07
 hUAQqG6AyHlCdSMDjG+6exQMKlCostH02aJKXCOfgYgXTgA6BMOr4URbrInDiIsA866dkKigfQmfU+MJ+mWSYYp4H1Cv3d1Elcu+aJLKBFt/tKeA7EeRjZ1p
 wvrL0KnlL9yXEVJk0zNv/YvWD/AyLoJa+3CJYd5EhjslJWVckOvY/V0Z5PC4NZmMIDoKL44kKXpaIAyjXBrEb2S3QyvpR++2khiIRwimSnl/K4u/P7qXpX+U
 7onhEn2BFxkBDTdyY8cPE5VwhTHeNgtCQJyhkVRk9+3/zgLmr+FM3UNQZQMjbt7nmPLjzR4R90mxOb8vbx4jt3kDu3fC7aoZr3CUKIi5shKAMMtHXjQAf+a3
 gmcvx/EdfjijInT1
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

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "jenson" as a vendor prefix for "Jenson Display".
Company website: http://www.jensondisplay.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..a1312637d6ff 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -553,6 +553,8 @@ patternProperties:
     description: Japan Display Inc.
   "^jedec,.*":
     description: JEDEC Solid State Technology Association
+  "^jenson,.*":
+    description: Jenson Display
   "^jesurun,.*":
     description: Shenzhen Jesurun Electronics Business Dept.
   "^jianda,.*":
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
