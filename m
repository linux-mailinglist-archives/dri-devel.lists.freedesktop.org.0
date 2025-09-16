Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A7B58F0F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D17110E6BF;
	Tue, 16 Sep 2025 07:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="UHY+pnKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA33710E606
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:32:50 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1757989969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Hzxy2RMl64sno71Oz0iZau+iz12mHomuQMmhuu/ZxI=;
 b=UHY+pnKNGZ7w/n//LaJI1spaDsWHnh6bAx6fhAAVOiz1mL6cuQScAMJmq/yGA+Wz2GSODJ
 Lbfj0vBxKb4ioKXTkexunIqrP/JtJIw07Kvmli8t6JH9nn1hxh6Sdz5n1qb04pDKyz+qWa
 Iu02CcLEDsBnoBS0TiWHMgrGF6z3PW1nKiUSmu2XJAgoHMrAUVkcUfEq9k3M1XAU/rNJkT
 MDzjEFLhn1EZsoQAE2TVbOasVG+GEoo8903RyFJY+VH4CASnRlYlSaNV4nz2yuQzM7f2wZ
 XWL5GAoM9aCAUW5X9p/7MiKlOYdPnCQuTvr//RODLYBl9C8P05qoZlA4o6shgQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 15 Sep 2025 19:32:14 -0700
Subject: [PATCH v2 3/3] dt-bindings: display: panel: panel-simple: Add
 lg,sw49410 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-judyln-panel-v2-3-01ab2199fea5@postmarketos.org>
References: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
In-Reply-To: <20250915-judyln-panel-v2-0-01ab2199fea5@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757989951; l=1102;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=QD1XD3QJwg8gYDvPbGitDD65uZYS6EXeZGVw1RunVLA=;
 b=wL3tL2/cfg5Ck1aaiCinCBhOdqlZRIl2EziBGq2b2R8O16EAVl7b+SBwXX4IkFj6HuFZ7lWwD
 6VicQihU1ZrA+9WhKTycQwFdb3mOatbB5Lik2zWK9I1R0m66EZrDkYh
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

LG SW49410 is the display panel used by sdm845-lg-judyln (LG G7 ThinQ).

It supports all the same properties as panel-simple.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54a000a6493ed64f03eda59c7efb02..ce6bcb95fb9efe19066e26927e068514a37ba6b9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -192,6 +192,8 @@ properties:
       - lemaker,bl035-rgb-002
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
+        # LG 6.1" (1440x3120) IPS LCD panel
+      - lg,sw49410
         # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
       - logictechno,lt161010-2nhc
         # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module

-- 
2.51.0

