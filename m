Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE4434F54
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F35B6E084;
	Wed, 20 Oct 2021 15:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 935 seconds by postgrey-1.36 at gabe;
 Wed, 20 Oct 2021 15:50:19 UTC
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBCF6E084
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-Type:Reply-To:
 Content-ID:Content-Description;
 bh=cIUI/bXHveWZMR9h3CdEbhAxpYfGQQQHM8NqLPkSilg=; b=NQZEQoYyrcI8/h8BjsnLOmTZkp
 Pl2qfCJah9DM58+XAsUHNx4D+7zA087HBqJatVCUXqm/LwiPA1ChBe/na7VooPqA01dDgRI9TnpsQ
 QhjuyphbNDhYpdk9AY414QOjQlzbDNnnKwM1XEUR+5vdl59Kjc8RukekiaJSoo6GvEua9RuVLRQTa
 yjxlkOO9/iC6EHNHkga5Qba2wpoAucEylHEAcGAtx/bJe7j4BAfOF9EC5n1YUJL2soZwoC6p143mr
 bXYgmOqU+TIrFsZWy0Or2fY8eQL7BgMnZJXfKckkltRw/Gv/a8sC1JF6YrpC1Mipke0jV5klAH606
 /QWTJH4A==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mdDc1-00043j-3n; Wed, 20 Oct 2021 16:34:41 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <john@metanate.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: ili9881c: add missing panel-common
 inheritance
Date: Wed, 20 Oct 2021 16:34:28 +0100
Message-Id: <20211020153432.383845-2-john@metanate.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020153432.383845-1-john@metanate.com>
References: <20211020153432.383845-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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

The properties below refer to items in panel-common.yaml, which means
that needs to be referenced in the schema.

Signed-off-by: John Keeping <john@metanate.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 07789d554889..032bae7891ad 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -9,6 +9,9 @@ title: Ilitek ILI9881c based MIPI-DSI panels
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
   compatible:
     items:
-- 
2.33.1

