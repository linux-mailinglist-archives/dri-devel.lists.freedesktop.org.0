Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D8192257
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B1A89A92;
	Wed, 25 Mar 2020 08:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6226 seconds by postgrey-1.36 at gabe;
 Tue, 24 Mar 2020 09:46:14 UTC
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1B689078
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 09:46:09 +0000 (UTC)
X-QQ-mid: bizesmtp17t1585043161txrzbg3g
Received: from localhost.localdomain (unknown [210.242.163.205])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 24 Mar 2020 17:45:58 +0800 (CST)
X-QQ-SSF: 01400000002000I0R720000A0000000
X-QQ-FEAT: QzH0LXO1kxblCOA3FX5oB6XbkyGsnhwJmuMZvC7UyqecKsDN6omVQuaXllHwO
 13OEo9gQdSgoPQlMHybM3xob8LwXKmmvQ7LwD/nqE37KmEeEo5y2Ludcknjvo5FkPEps8c3
 Bhh0Akm8oJE/1I6q0sGxV/bUZlGo/Xxuiz2+9qlxE4rYwT14Pnt1ha79+zfALp0YOKVnThi
 myqkMatG/lFLx6eqN/yBZwr6jHCT25YMIOgZVplJwK58a9wGqzDsiE470YRp5AwwUzcNbk5
 SKBVPYE+3zIKv3WCR1w0sh9PC7TVSVaV6tDrlpUWWE3bqlJ+Cg4ORiqFoH0a1+XPaEVMyFE
 DfMvqJqW2k2PXKqHUtF3x1SrNK+Ywhm3jUOXR1q
X-QQ-GoodBg: 2
From: David Lu <david.lu@bitland.com.cn>
To: david.lu@bitland.com.cn
Subject: [PATCH] dt-bindings: boe,
 tv101wum-n16: Add compatible for boe tv105wum-nw0.
Date: Tue, 24 Mar 2020 17:45:25 +0800
Message-Id: <20200324094525.4758-1-david.lu@bitland.com.cn>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, jungle.chiang@bitland.com.cn,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings documentation for BOE TV105WUM-NW0 10.5" WUXGA TFT LCD
panel.

Signed-off-by: David Lu <david.lu@bitland.com.cn>
Change-Id: I450c0e52aae080728d4794bdffc50bb0d2f39f40
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 740213459134..7f5df5851017 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -24,6 +24,8 @@ properties:
       - boe,tv101wum-n53
         # AUO B101UAN08.3 10.1" WUXGA TFT LCD panel
       - auo,b101uan08.3
+        # BOE TV105WUM-NW0 10.5" WUXGA TFT LCD panel
+      - boe,tv105wum-nw0
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.24.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
