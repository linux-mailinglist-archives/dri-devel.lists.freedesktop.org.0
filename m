Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CA4F66F6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 19:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938C710E0A8;
	Wed,  6 Apr 2022 17:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5510E0FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 17:30:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEA4E61A95;
 Wed,  6 Apr 2022 17:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F5BC385A1;
 Wed,  6 Apr 2022 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649266214;
 bh=TzTlpFZtH0J+36S9N9L4ND/H/yCs90y6P3aB8Lln2MI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDIGt5bbay39GvswOhiiR9x75f4CZ8870l7rpiON7ocOR7Me8MM0zEhEwZm/0UnWZ
 xb0eOyjBo1tE5/yrUkFFzNGfXk0IMQqFaXgvgQmgnx6t7Q/ieFGMllaRCJ0+/hmhAa
 OVI2CLkcS36qkpexDIETUelaifR4eghO4GfP5Ywwe29lEOvaVO1fe6+lhP3kUGCEun
 M9CkpTS01zPwawvH3vfQYBHxYkZOtnXmEJfzGPJaZAf5UF7vkoe77u2dcRQ06Zi/h+
 Lzf7r9aeghgL7ZPdLdOoLFa9eIAk2MUQfK6SeqnSay9Tbwd0nJRipOO2YEoIAW1THs
 3pqmcTIqow9Sg==
Received: by wens.tw (Postfix, from userid 1000)
 id 4A61B5F8E8; Thu,  7 Apr 2022 01:30:11 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for SINO
 WEALTH Eletronics Ltd.
Date: Thu,  7 Apr 2022 01:29:53 +0800
Message-Id: <20220406172956.3953-2-wens@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220406172956.3953-1-wens@kernel.org>
References: <20220406172956.3953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen-Yu Tsai <wens@csie.org>

Add a vendor prefix entry for SINO WEALTH Eletronics Ltd.
(http://www.sinowealth.com).

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 01430973ecec..79b72e370ade 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1130,6 +1130,8 @@ patternProperties:
     description: Sinlinx Electronics Technology Co., LTD
   "^sinovoip,.*":
     description: SinoVoip Co., Ltd
+  "^sinowealth,.*":
+    description: SINO WEALTH Electronic Ltd.
   "^sipeed,.*":
     description: Shenzhen Sipeed Technology Co., Ltd.
   "^sirf,.*":
-- 
2.34.1

