Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493DC18871B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54B889FD1;
	Tue, 17 Mar 2020 14:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dodo.xh.is (dodo.xh.is
 [IPv6:2001:19f0:8001:184d:5400:2ff:fe7b:e8bd])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD446E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 13:36:03 +0000 (UTC)
X-Spam: yes
X-Spam-Score: 6.6 / 99999
X-Spam-Symbols: BROKEN_CONTENT_TYPE, MID_CONTAINS_FROM, MIME_TRACE,
 SUSPICIOUS_RECIPS, ARC_NA, FROM_HAS_DN, R_MISSING_CHARSET,
 FROM_EQ_ENVFROM, RCVD_COUNT_TWO, TAGGED_RCPT,
 RCPT_COUNT_TWELVE, RCVD_NO_TLS_LAST, ASN, FREEMAIL_ENVRCPT,
 TO_MATCH_ENVRCPT_SOME, FREEMAIL_TO, RCVD_VIA_SMTP_AUTH,
 TO_DN_SOME
Received: by dodo.xh.is (OpenSMTPD) with ESMTPSA id 0e527ca8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Mon, 16 Mar 2020 06:36:02 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id 565904C196;
 Mon, 16 Mar 2020 13:35:45 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <megous@megous.com>
Subject: [PATCH v2 1/5] dt-bindings: vendor-prefixes: Add Xingbangda
Date: Mon, 16 Mar 2020 21:34:59 +0800
Message-Id: <20200316133503.144650-2-icenowy@aosc.io>
In-Reply-To: <20200316133503.144650-1-icenowy@aosc.io>
References: <20200316133503.144650-1-icenowy@aosc.io>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=dkim;
 t=1584365761;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references;
 bh=0HfFUPjqEgQwk282TtGVjN57mA1btMaLRbIZ6w6p3rA=;
 b=REDQumeYtu2hFfNE/0noLkFBnWLBO0K+j+7Cl1oibcFre31634hVU28mtpy55VHq7hemb5
 9Y/h3REpWyNd//ndafhD4+trF+cFKYr8mxOkJEW8BtetEuX3kI1XpnvOLWBbguNyciZFV+
 +hPgrwK9gX+BZf947U0jZ34pe2LBgAc=
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 23ca95bee298..0d9e966eff19 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1106,6 +1106,8 @@ patternProperties:
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
