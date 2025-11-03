Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB264C2DFEC
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508F310E47C;
	Mon,  3 Nov 2025 20:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="X5Y+8ilo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xI66H01M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DAA10E47C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 20:08:24 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0jMB4JpDz9sxJ;
 Mon,  3 Nov 2025 21:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762200502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
 b=X5Y+8ilodsOL4HoPbZhGRipcGdvgrg5A+4S0GGWdKrlzaSe+/pB790XiCyHIJH/iTol3cj
 yR0r4fGRm9EiaSSs2PtK59Qjdq1IMlxks4i7AsZRRZCJ+3vX6qvpUX1Lbaz5iQkkrL0Nft
 uCgQbew9IhSOaJxs/63ofIVZDa735q6VlAuhgapYiqwM/oGpz04UG1oATZAKD6p6739Ext
 EF2cteoqnWTCkU1eOvqHk+v3ZxBcQDlv9dq5mnArLcjKKbN6OvsUsuR0gkO+j7JribmxBK
 QCP8Ka4C/2eUIi4YuoMEHQoQy4a8e9GL7N5EK4/mfinCEPTWdStbT4thtekNYQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xI66H01M;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762200500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
 b=xI66H01MM1/fv0z0izQzVRJQPMuP3I6bz+TAuuAPKQPlnq7DvVRC0CVYwJxQk2HDLQSyyy
 13Fbr9xPflk3Xh6E55W8oiVfhcTqOzWB40Dl3d3BqKUa5nJW6W7+ZDHdiUPfFj69jdxJ3S
 aBNUP4NZYCbHz3jMMOq6dsRbwrL2Ub/iknkPRiG5/Ujp4cCvxRacPEwmwWJvpI8c0/gENM
 CG/5HD2tI1SEURI/MPo4BtItGb/1fP1g9+1Y/eLADF6+KifszQl1FG8EZD4j3qCeVxIq9Q
 lHM2YsDliF2FIb7zypw5ZGOPNyEAksRlWLIIJHuQuG6qZtONPPXYvsIQJFA30A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: img,
 powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
Date: Mon,  3 Nov 2025 21:07:35 +0100
Message-ID: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: khrd3qq4o39hm5ydwj6crqdebybxex5s
X-MBO-RS-ID: 914238a6db457e3aa3b
X-Rspamd-Queue-Id: 4d0jMB4JpDz9sxJ
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..c03efbedc397 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -19,6 +19,10 @@ properties:
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
           - const: img,img-rogue
+      - items:
+          - const: renesas,r8a77965-gpu
+          - const: img,img-ge7800
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -105,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - thead,th1520-gpu
     then:
@@ -134,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - img,img-bxs-4-64
     then:
-- 
2.51.0

