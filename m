Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0FA81086
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FAD10E6DD;
	Tue,  8 Apr 2025 15:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HpizRBVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0DB10E6E7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:47:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id A3655581678
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:27:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C49443C7;
 Tue,  8 Apr 2025 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744126025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcXfDagnWGodjrLY8rm4oGEwQluwSkfRo86/Yikyi58=;
 b=HpizRBVA5L/ws3FIlFwztlMaHrGEErygckVcKcBfR+r1cxzp3LKLsc10Fy4iwXovCXsAuN
 C/n4lKCYkrunmwBVukXFSdoHesWk6M8CA1NSQyD94NvnGJ+YQFi1VPPAGZgrZ8RMoVh3VU
 o7P93LgQDnxuHKN9ZiJid7oi28LEzHUAWLQI8J9rSnPTusI0W8/JQ21hgby4ZSmIesIrzc
 JuYQ6oFS9oZlpZO4M1WGi841OeLfSzutlWyWeXiXvQsajsuAI/bX0whGM9rELy+PiZJaSo
 QcEOJVwMSC97lEfStuNjAg6RT3J3nT5yLj4kXodDb4aLkXxWCNG37uN/h0YiXg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Tue, 08 Apr 2025 17:27:02 +0200
Subject: [PATCH 3/4] dt-bindings: ili9881c: Add Saef SFTO340XC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-feature_sfto340xc-v1-3-f303d1b9a996@bootlin.com>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
In-Reply-To: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
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

Document the compatible value for Saef SFTO340XC panels.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index e36550616f6aac86c79832a48132ce8c11ebcf7a..7e47564cf1f18a9ea9e64deded7a7edbff133406 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - saef,sfto340xc
           - startek,kd050hdfia020
           - tdo,tl050hdv35
           - wanchanglong,w552946aba

-- 
2.34.1

