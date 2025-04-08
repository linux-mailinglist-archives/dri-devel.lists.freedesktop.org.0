Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BB4A81084
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAB710E6E4;
	Tue,  8 Apr 2025 15:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B+vW1Cpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01B10E6E5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:47:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id BE6BB5836CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:27:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B832C443CD;
 Tue,  8 Apr 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744126023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LfAx4lVS0KGN2cWpFco43WjIJVHZrufPU/v15sg8xV4=;
 b=B+vW1Cpxk2j9SQVdgSnkzsXvOJaa6m77+oYmpQJJHMQlkUbGEW+2k/zQzrHttaCtyVDItA
 kzeycUUKa+pgBiIObvDHvnTRtemTdsNobjZ2VQwRHTIApLh6k/qSXXd/UOlCb9StpCW6Ie
 Il8OXZ9H0zk4KyhQ3/zOHKxjo2R32NuCA6haMuHz1oSd5Q6Um3OQrv+HhRslVnmAV8Vqys
 xSHqtdoIsgpQ1Wpq+FPduhQy8nyDzHazCTiIA7Z+YQwonp6h+AWRpNhhV4JhBhpAGXk+Ti
 msT+jUGqEZZWRQhq46wQAfVt4sW5vmJkhvULf7LjVcEfPrO2/DeaZOta7gslBQ==
From: Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH 0/4] Add support for Saef SFTO340XC panel.
Date: Tue, 08 Apr 2025 17:26:59 +0200
Message-Id: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAENA9WcC/x3MTQqAIBBA4avErBNsUvq5SkRojTWbCq0IxLsnL
 b/FexECeaYAfRHB08OBjz2jKguYN7OvJHjJBpSoZYWdcGSu29MU3HXUSr6zWNCiNtrqRrWQu9O
 T4/d/DmNKH7t+hRFjAAAA
X-Change-ID: 20250129-feature_sfto340xc-d2b25a5b5748
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedugefgudfftefhtdeghedtieeiueevleeludeiieetjeekteehleehfeetuefggeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvi
 hgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
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

Add support for Saef Technology Limited SFTO340XC LCD panel.
Add alongside the number of lanes configuration in the ili9881c driver
as the board on my desc use the panel with only two lanes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (4):
      dt-bindings: display: panel: ili9881c: Add dsi-lanes property
      drm/panel: ilitek-ili9881c: Add support for two-lane configuration
      dt-bindings: ili9881c: Add Saef SFTO340XC support
      drm: panel: Add Saef SFTO340XC LCD panel

 .../bindings/display/panel/ilitek,ili9881c.yaml    |   6 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 267 ++++++++++++++++++++-
 2 files changed, 271 insertions(+), 2 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250129-feature_sfto340xc-d2b25a5b5748

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

