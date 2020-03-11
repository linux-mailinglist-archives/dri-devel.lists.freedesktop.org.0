Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8808D182A87
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B46EA54;
	Thu, 12 Mar 2020 08:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282936E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:33:51 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: TAGGED_RCPT, BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM,
 RCVD_NO_TLS_LAST, ASN, SUSPICIOUS_RECIPS, FREEMAIL_ENVRCPT,
 TO_MATCH_ENVRCPT_SOME, FROM_EQ_ENVFROM, MIME_TRACE,
 RCVD_COUNT_TWO, RCVD_VIA_SMTP_AUTH, TO_DN_SOME,
 R_MISSING_CHARSET, FREEMAIL_TO, ARC_NA, FROM_HAS_DN,
 RCPT_COUNT_TWELVE
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id a7fe1285
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 11 Mar 2020 09:33:50 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 4DD2A4C335;
 Wed, 11 Mar 2020 16:33:44 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Xingbangda
Date: Thu, 12 Mar 2020 00:33:25 +0800
Message-Id: <20200311163329.221840-2-icenowy@aosc.io>
In-Reply-To: <20200311163329.221840-1-icenowy@aosc.io>
References: <20200311163329.221840-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1583944428;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=AfXGWxD0IIuyOwz/1L1dhkzs7UBLknMSUFpWsqJiTqw=;
 b=Kbx6Pv20zwIKbLvVvzanZyPPAMGOwFSiOUEuJwmIiIGEY1xPeDlqFMFfMFg4cf91690Z9q
 bkx44L/lsQ+wznNumkSScXaEfJQWbPXgnCdzk/AHM09TIssxpqW1tgdzM/pt0JgI8gvbN6
 GQm/JRw9ST/jJXBSvMxQUrr1aDrqBzE=
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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

Shenzhen Xingbangda Display Technology Co., Ltd is a company which
produces LCD modules. It supplies the LCD panels of the PinePhone series
(the developers' kit and the final phone).

Add the vendor prefix of it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b8e9ef79cab9..038a2180d34b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1102,6 +1102,8 @@ patternProperties:
     description: Xiaomi Technology Co., Ltd.
   "^xillybus,.*":
     description: Xillybus Ltd.
+  "^xingbangda,.*":
+    description: Shenzhen Xingbangda Display Technology Co., Ltd
   "^xinpeng,.*":
     description: Shenzhen Xinpeng Technology Co., Ltd
   "^xlnx,.*":
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
