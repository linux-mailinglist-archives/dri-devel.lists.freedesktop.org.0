Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD42E20EF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 20:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FD389E1B;
	Wed, 23 Dec 2020 19:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Wed, 23 Dec 2020 19:34:30 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B71389E1B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 19:34:30 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.194]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N2E9e-1jvH1B3Emk-013als; Wed, 23 Dec 2020 20:25:15 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] dt-bindings: bcm2835-vec: Add power-domains property
Date: Wed, 23 Dec 2020 20:24:33 +0100
Message-Id: <1608751473-12343-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:6Pmy9jml9JWIJIXLRT/11dG+IeBR3Nbtq0oVYyeyxGBhkZHolyh
 xpHtKH6aKnL5dkVKCUNyq71MKY3NkURmOR/hcQZSTSb4fShDLr6Ep26K74Jz3p7yMjTDWlZ
 ZfBVO+TGzj6ksr4WLNsloiqE9QcBkRMC2xtbPkkRJRhLgTJiEO+CDqZe44ox0Okf+G6Hw3F
 Ep48ZLfPDh/lrEjLP520w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3xMaFBOZ2cA=:GHEG+nLQspkqmosD9ffW/w
 CS+pwfrQL+wD9VmiJaUmdsLXxtTEKwZZ0IDGCj7lewkT/6m4Ks4EJ4jyQNLp/c6IU7tebZUQ3
 x1Ud+KZaiXI+CE94xuxH8sQMQVjSy5TxavUpyuTzc8Yl/VhcvxcTO1IF9OMIVSnw+sr3G3fMR
 iaDUFX1stZ2q4XxYri9CEDnRPnbZ3tOZyc6oqXGJppUAJ6eJ4jguPHkxnDeOdsi3hiXPFj0d7
 u813nDAgZ3q+qazZTHO1+WmX7H0T7blPf/0XYbJaiUf2kRr96H+oVZYe3y+nm7O7k4esC96aU
 Hf0KTxMrTwTTFcwX+zX1su+oDXGO1v+Q8ptcWllQJeirbDPnXrfa7SXVth0iSzQjxHVU/xDtJ
 ywGUrdmnY4yhiJpa9YMB9NigoEA6oap2IXZmXcdGqQ4JRASKLFwvCXYG1xIEq5BzfzhJ4ehPp
 0yGQeIth1w==
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding the missing property power-domains to the bcm2835-vec schema to fix
the following dtbs_check issue:

vec@7e806000: 'power-domains' does not match any of the regexes: ...

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
index d900cc5..071a43d 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
@@ -22,6 +22,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
