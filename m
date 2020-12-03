Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2B2CE9D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042996E16D;
	Fri,  4 Dec 2020 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A49B6E98E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 10:28:44 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x22so2211802wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 02:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HwnFymWMQTV9oikYfEqk9Alj6I5f+hN6S3yVGaHyZC0=;
 b=WZdCZpNNkYwJQy1PMA1V3fogDhD7ZD/zN1Yf9DH7sYbl4u5XR2MtQEjpX5LfBJcr7u
 1nkLLgIMzTayRyionh3rsS9LzZxkzyrmhFcsdwG2JMWBLO9avVUK0hxVRXLKVbaaqUUe
 HJDoj+XXS7ACoW++Mu7+iUgO+bE56KAJnKKOChENS2oe+XqjpEY08DUeN+esbv0bEWn5
 xSb9SG+/dg7AgWq3KPedojWriCdYGgoDh6X8qgfTW4wb5UQ+0MkiMINJoL5Idqn097sq
 xTLNq/hQK7tQc8x99gpXOSe1ymBoTXtqhVqsUZZz4I0qxXL/fQrQG32m/SBVrVqLQ60M
 2nxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HwnFymWMQTV9oikYfEqk9Alj6I5f+hN6S3yVGaHyZC0=;
 b=m+WSzM9bAgwYaCvJ5You+503B1YsWhY3n00NqafRIryhIkB8OcvNqiugCZxQ+BKOn3
 hLp8FKI2fdbeUfQCjB7ivkuLHC3gNjPypaPF2WcmNOFHWq6hE/6xKO9SsG/opDwgHnI5
 y2ZW63Rkxw89h2Ng1Sp3HVvL+fLj/8ZmoSu5VVaFxf42HxkrC0s+Hu1zHUOv0KwPCbHx
 HHvYZ/VQ0Ms1HYbmrxEiORHanGolG4PxMtxgGCNywsseOWakPilMx+wKlTtCQnRxr8kP
 4Dy+Txz+LjduXPMahi4lpAZ/+Ze1KHKyNuY1oEsdSEJ9JwDDN3wdDn551Ek3aSaSyocF
 bSaw==
X-Gm-Message-State: AOAM533w910kfv0JWDgg/KY4KMAQ57C84WpVuknptPdhKa/m11VARmqh
 dSimJoi+Dy07/IGEzTxwwinZxvdy73+gag==
X-Google-Smtp-Source: ABdhPJwpHO4xvvBiQOWKTr03b1Js+htVYuOqDGAa/WLxWwnBsnsKk/EljKQpSEaK085VLYgK9coukQ==
X-Received: by 2002:a1c:67c5:: with SMTP id b188mr2562533wmc.147.1606991323260; 
 Thu, 03 Dec 2020 02:28:43 -0800 (PST)
Received: from rum-mikhail-dt.world.mentorg.com (nat-rum.mentorg.com.
 [139.181.33.34])
 by smtp.gmail.com with ESMTPSA id o13sm847589wmc.44.2020.12.03.02.28.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Dec 2020 02:28:42 -0800 (PST)
From: mdurnev@gmail.com
X-Google-Original-From: mikhail_durnev@mentor.com
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 noralf@tronnes.org
Subject: [PATCH v3 3/3] dt-bindings: panel: Add bindings for MRB2801
Date: Thu,  3 Dec 2020 20:28:13 +1000
Message-Id: <1606991293-29539-4-git-send-email-mikhail_durnev@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606991293-29539-1-git-send-email-mikhail_durnev@mentor.com>
References: <1606991293-29539-1-git-send-email-mikhail_durnev@mentor.com>
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: mikhail_durnev@mentor.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikhail Durnev <mikhail_durnev@mentor.com>

Add binding for Ronbo MRB2801 display module.

This binding is for display panels using an Ilitek ILI9341 controller in
parallel mode.

Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
---
 .../devicetree/bindings/display/ronbo,mrb2801.txt  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ronbo,mrb2801.txt

diff --git a/Documentation/devicetree/bindings/display/ronbo,mrb2801.txt b/Documentation/devicetree/bindings/display/ronbo,mrb2801.txt
new file mode 100644
index 0000000..db1a861e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ronbo,mrb2801.txt
@@ -0,0 +1,42 @@
+MRB2801 display panel
+
+This binding is for display panels using an Ilitek ILI9341 controller in
+parallel mode.
+
+Required properties:
+- compatible:		"ronbo,mrb2801"
+- dc-gpios:		D/C pin
+- wr-gpios:		W/R pin
+- db-gpios:		8 or 16 DB pins
+- reset-gpios:		Reset pin
+- wr-up-down-delays:	Delays in ns for changing W/R from down to up and from up to down
+
+Optional properties:
+- backlight:	phandle of the backlight device attached to the panel
+- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
+
+Example:
+	mrb2801{
+		compatible = "ronbo,mrb2801";
+		db-gpios = <&gpio 17 0>, /* DB0 */
+			   <&gpio 18 0>, /* DB1 */
+			   <&gpio 27 0>, /* DB2 */
+			   <&gpio 22 0>, /* DB3 */
+			   <&gpio 23 0>, /* DB4 */
+			   <&gpio 24 0>, /* DB5 */
+			   <&gpio 25 0>, /* DB6 */
+			   <&gpio  4 0>, /* DB7 */
+			   <&gpio 14 0>, /* DB8 */
+			   <&gpio 15 0>, /* DB9 */
+			   <&gpio  5 0>, /* DB10 */
+			   <&gpio  6 0>, /* DB11 */
+			   <&gpio 13 0>, /* DB12 */
+			   <&gpio 19 0>, /* DB13 */
+			   <&gpio 26 0>, /* DB14 */
+			   <&gpio 12 0>; /* DB15 */
+		dc-gpios = <&gpio 16 0>; /* D/C */
+		wr-gpios = <&gpio 20 0>; /* W/R */
+		wr-up-down-delays = <10 51>;
+		reset-gpios = <&gpio 21 0>; /* RST */
+		backlight = <&backlight>;
+	};
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
