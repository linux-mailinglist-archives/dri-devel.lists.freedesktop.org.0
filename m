Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5813D5DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53D76EC29;
	Thu, 16 Jan 2020 08:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FF16EBBA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 03:37:41 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: TAGGED_RCPT, ARC_NA, FREEMAIL_ENVRCPT, MID_CONTAINS_FROM,
 RCPT_COUNT_TWELVE, MIME_TRACE, ASN, FROM_HAS_DN, TO_DN_SOME,
 FROM_EQ_ENVFROM, SUSPICIOUS_RECIPS, RCVD_VIA_SMTP_AUTH,
 R_MISSING_CHARSET, BROKEN_CONTENT_TYPE, TO_MATCH_ENVRCPT_SOME,
 RCVD_NO_TLS_LAST, RCVD_COUNT_TWO
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 3666c5ac
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 15 Jan 2020 19:37:41 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id DA90247720;
 Thu, 16 Jan 2020 03:37:35 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 4/5] dt-bindings: arm: sunxi: add binding for PineTab tablet
Date: Thu, 16 Jan 2020 11:36:35 +0800
Message-Id: <20200116033636.512461-5-icenowy@aosc.io>
In-Reply-To: <20200116033636.512461-1-icenowy@aosc.io>
References: <20200116033636.512461-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1579145860;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=KnPZmUA4jMX9XqFMlF8ay3G6LudBy8KgPlNFXGrlc9w=;
 b=PoIT64PBkL2Z6UNlTLLS1C05GhzhO1FXxM/KQstcC4awHMNLUwSzrIvGU+I7z66KHmVgQw
 fraDLntQAF1dQHsHiQj0PXSGbaPl81pRRAUyGP9FpuiUHf3e3fdU70wK0O+zNwHIU1W0nv
 8ZP7MAiBEiQuexqoQeWQWWP406RsBxg=
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the device tree binding for Pine64's PineTab tablet, which uses
Allwinner A64 SoC.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Added Review tag by Rob.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 327ce6730823..159060b65c5d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -636,6 +636,11 @@ properties:
           - const: pine64,pinebook
           - const: allwinner,sun50i-a64
 
+      - description: Pine64 PineTab
+        items:
+          - const: pine64,pinetab
+          - const: allwinner,sun50i-a64
+
       - description: Pine64 SoPine Baseboard
         items:
           - const: pine64,sopine-baseboard
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
