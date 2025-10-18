Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E7ABECFF1
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 15:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB5310E04F;
	Sat, 18 Oct 2025 13:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lZgOdq7q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EsOBp9hT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725FE10E04F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 13:02:12 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cphfp5wVgz9tBD;
 Sat, 18 Oct 2025 15:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760792530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
 b=lZgOdq7qBFl79GAupPAzeVF0yIAF9m0LE4eQ18dGnZRAqJEfOE/7/DVeyXxOCMMqXw+lEn
 88HTHkcqTxXMBQCCw0aylcL8PprCMn85RnGSI7QVIGMR18Oo9KezQIMz+Vh3fXbnmwClvQ
 ljpRVdLjHCeToZ8qrsdOy6wprbJRJENMZsXLb/P7KLE8Z88ToH0l2JWAqiz3mu8T/k7Dqi
 atcefTH3QBSym7h98I3P0VXyvPtt2ZFemOMpdoDGuPUnzu2Y+AcV6l1G7Pc/BEsoplmzqb
 D26D87JuHPM9NorOY0z+MG8jqTaoO+4hGsTsCRojGcrmcMwD7UPVXOWk2m+7WQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EsOBp9hT;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760792528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
 b=EsOBp9hTgy8bP848oTczxHUj64D47YypanF/t/DQJE1O7jqUv8ktAZa+34PRAw8u/rSGlX
 LegfVw8qHrlppeLZ6DMqjKwTlVdwCvGvcdTBGFsdquySTUqS+thoYkEqYvhaFWCerWg593
 lBIlh0PiyVYaHEwvb+Z9l+xgTF3BoOrsVsiSdEoLxao3sjSJYNkIpCjpLLHE6kGiFnpI+u
 fCEHM+dPQjPQA6AgoPQJlpsO/maPwVcNEjkHqW/Tlfolx/8Ol3s3fkbeAvxgSdg1CQtqP7
 ZwxbH3c2Pwq70jrHNftSmklWM8/a5gjhmW3eikanLVEdI4svYyrV0ire/b4Gxw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: img,
 powervr-rogue: Drop useless power domains items
Date: Sat, 18 Oct 2025 15:00:58 +0200
Message-ID: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f3442694eee9bbceb66
X-MBO-RS-META: 6p44y3cu71pc5fzdrqigyaacqqrgqqoc
X-Rspamd-Queue-Id: 4cphfp5wVgz9tBD
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

The power-domains items: list is not very informative, replace it
with plain minItems/maxItems instead.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..bee4ab1a1f805 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -90,8 +90,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
+          maxItems: 1
         power-domain-names:
           maxItems: 1
       required:
@@ -125,9 +124,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
-            - description: Power domain B
+          minItems: 2
         power-domain-names:
           minItems: 2
       required:
-- 
2.51.0

