Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3841A434F58
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FCB6E9EA;
	Wed, 20 Oct 2021 15:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5916E9EE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-Type:Reply-To:
 Content-ID:Content-Description;
 bh=9wQxL1mQCD9KGWokSJt4JLAUUu9p5wZhKYOiCzkRPr8=; b=Sqc32ZaSmRhE4g6JHhpl9FhuZX
 6m1+KBe285RfgiuN0/zH4Sx6THM9mdlS9aGD5WICZIAnSyFEQCTksXV+MUQxQo1xRjRYG4l1tOfB3
 zXGUOxeSGfGDko1T9Ngifrc8LILHmdKu+ZGQmUPwh2MgDrZNTXqJ9t9yHQ4bFE6qRaEZSmeV77oSV
 C4H+eNoktjxvCUB8VcG/yfz2OTRr/Q0taNyA9E/McaJyZiCpG4n8D4a4/aENocqymNFr5Y2Y02qWi
 2CO5hmz1p5jiCXHSBHRzMlzrMmgaLfhNnF6W3f1SycM1dkaQEeDpDoI/PY0d/yLZ6D9XOkCK5jiic
 sx/eBjHw==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mdDc1-00043j-Qh; Wed, 20 Oct 2021 16:34:41 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <john@metanate.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: ili9881c: add rotation property
Date: Wed, 20 Oct 2021 16:34:29 +0100
Message-Id: <20211020153432.383845-3-john@metanate.com>
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

Allow the standard rotation property from panel-common for ILI9881C
based panels.

Signed-off-by: John Keeping <john@metanate.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 032bae7891ad..c5d1df680858 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -25,6 +25,7 @@ properties:
   power-supply: true
   reg: true
   reset-gpios: true
+  rotation: true
 
 required:
   - compatible
-- 
2.33.1

