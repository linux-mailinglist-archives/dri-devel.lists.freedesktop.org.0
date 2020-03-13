Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39B184E5A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 19:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D4B6E059;
	Fri, 13 Mar 2020 18:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4557E6E059
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 18:07:30 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a22so10325404oid.13
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 11:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XfdUP3YGPmXKGkwHkk+uuVO8kCTOJvEs+/FfsSsBG+o=;
 b=g5bK9nRbGcxOREEbL0V/mw0/5zxiQkWvJnhXoWsIcy3rkqL5hYaXEv7qKJ7bKP9djr
 IX5VObFmF3iYDIg2kPGJiFboegNSpvgyfdnc0HELnXJVfQ6/P29TM3GafDoFbSPF/n4f
 pmFjo06F8etrUM2nky9wmt6p7/ztLnTcTMulXzZ8dzBhRyLeWcKOUa8cBA0cRre0cfIV
 BGHtwXhHu42HdBssR4XrAs5XXNLnQdY2/y/wQReS5gMZ9y8QEiuygaUyyfzxLZ9GGXqm
 8rUyca1dVOcRAoFYymv0xD/LwVAGT3LOJdkpvscGf+nASAK1ruE1tQFskmW+n7tHRO8I
 DTgg==
X-Gm-Message-State: ANhLgQ3gomkM498n1BsXemF4cf4oBWENnG4Uu3i+hfgbDyNkFeqj5D+1
 FmXmo4ElxOjDcu15wl/bUGpuUmM=
X-Google-Smtp-Source: ADFU+vvVX5P8LfcDS2EEYM59OmWbE1ipOo1GIc6HBscLEHtBCb9LizJUYnklHCLbjBQQR2+W7LYBFg==
X-Received: by 2002:a05:6808:9bb:: with SMTP id
 e27mr2718525oig.36.1584122849148; 
 Fri, 13 Mar 2020 11:07:29 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id w18sm13886991otl.60.2020.03.13.11.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2020 11:07:28 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] dt-bindings: display: ti: Fix dtc unit-address warnings in
 examples
Date: Fri, 13 Mar 2020 13:07:27 -0500
Message-Id: <20200313180727.23044-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extra dtc warnings (roughly what W=1 enables) are now enabled by default
when building the binding examples. These were fixed treewide in
5.6-rc5, but some new display bindings have been added with new
warnings:

Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:21.27-49.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
Documentation/devicetree/bindings/display/ti/ti,j721e-dss.example.dts:21.27-72.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dts:20.27-42.11: Warning (unit_address_format): /example-0/dss@02540000: unit name should not have leading 0s

Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Drop panel fixes as there's another patch fixing the 3 panels plus
   others.
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 2 +-
 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index cac61a998203..aa5543a64526 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -121,7 +121,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
-    dss: dss@04a00000 {
+    dss: dss@4a00000 {
             compatible = "ti,am65x-dss";
             reg =   <0x0 0x04a00000 0x0 0x1000>, /* common */
                     <0x0 0x04a02000 0x0 0x1000>, /* vidl1 */
diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
index ade9b2f513f5..6d47cd7206c2 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
@@ -154,7 +154,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/soc/ti,sci_pm_domain.h>
 
-    dss: dss@04a00000 {
+    dss: dss@4a00000 {
             compatible = "ti,j721e-dss";
             reg =   <0x00 0x04a00000 0x00 0x10000>, /* common_m */
                     <0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
index 385bd060ccf9..7cb37053e95b 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
@@ -81,7 +81,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
-    dss: dss@02540000 {
+    dss: dss@2540000 {
             compatible = "ti,k2g-dss";
             reg =   <0x02540000 0x400>,
                     <0x02550000 0x1000>,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
