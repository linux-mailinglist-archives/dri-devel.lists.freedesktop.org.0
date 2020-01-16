Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8EC13D5E2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4A56EC30;
	Thu, 16 Jan 2020 08:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACAF6EBBC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 03:37:18 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: ARC_NA, FREEMAIL_ENVRCPT, R_MISSING_CHARSET, RCPT_COUNT_TWELVE,
 TO_MATCH_ENVRCPT_SOME, MIME_TRACE, ASN, RCVD_COUNT_TWO,
 RCVD_VIA_SMTP_AUTH, FROM_HAS_DN, TAGGED_RCPT, FROM_EQ_ENVFROM,
 SUSPICIOUS_RECIPS, TO_DN_SOME, BROKEN_CONTENT_TYPE,
 MID_CONTAINS_FROM, RCVD_NO_TLS_LAST
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 3e18a3b9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 15 Jan 2020 19:37:17 -0800 (PST)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 720E54771C;
 Thu, 16 Jan 2020 03:37:12 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefix: add Shenzhen Feixin
 Photoelectics Co., Ltd
Date: Thu, 16 Jan 2020 11:36:32 +0800
Message-Id: <20200116033636.512461-2-icenowy@aosc.io>
In-Reply-To: <20200116033636.512461-1-icenowy@aosc.io>
References: <20200116033636.512461-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1579145836;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=Cots55u7oBo6HLbJ0veZrEhronIaQRrC5wB8giopCdI=;
 b=QAUu2xvkaL12iJS8vAzQbXn0507Pmq8B1zgmbKFcsN5+qK3hciu2EUylZQwvbQXGrYJ1wS
 LcONX8u3wZFUIPbD6ArJJoJtpvBAihun13iASAlmsRRuQwGkMKdo1d15hxlqA6p3rv7ybu
 /2CJCPtur/az2eMoK3aiEF0FUTLotEw=
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

Shenzhen Feixin Photoelectics Co., Ltd is a company to provide LCD
modules.

Add its vendor prefix.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v2:
- Added ACKs from Sam and Rob.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 97c0a06b35cd..07d52254427b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -337,6 +337,8 @@ patternProperties:
     description: Fastrax Oy
   "^fcs,.*":
     description: Fairchild Semiconductor
+  "^feixin,.*":
+    description: Shenzhen Feixin Photoelectic Co., Ltd
   "^feiyang,.*":
     description: Shenzhen Fly Young Technology Co.,LTD.
   "^firefly,.*":
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
