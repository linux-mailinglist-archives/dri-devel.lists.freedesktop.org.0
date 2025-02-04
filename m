Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B8A26DBB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0210E5C6;
	Tue,  4 Feb 2025 08:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IG+DsLH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479DE10E5C6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 08:52:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6CC2442B8;
 Tue,  4 Feb 2025 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738659129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OkTbcjoIffMaSQaVJKCMVU7fDL9DGYAiY6/3g5tiNHI=;
 b=IG+DsLH1+RIjKXlAFMQ78qXBwSg/WId94sDWh1ThupraQMnPE/IsLBR0WrKw9/IrJB21Me
 p6TdC0rNUGFd6eFPIGwlOGV9cEy0FE1kr12T6ZTpfHLbzX4Ns80TcDqnKi9aizk9sLPKb5
 R00jLP40vLhtx7apA9lK/WtEX5GsQU1qEzKqJIyAAKIOIAP3LgwS6nZF9J4sNS0TQsZLye
 z0ranEaRbH9OO4N+V8/ukCc2V9d9wGh1XmxOKibKIBKmhsYjeO9OBf1Q8LWLEj1gcMVUa2
 7ZXavh2Iod7EyFSNzOjISrmFM7qLWll/bgf8vugJqjxyOGWIBbjy06yT2w4fiw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 0/2] DRM: small improvements
Date: Tue, 04 Feb 2025 09:51:57 +0100
Message-Id: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3VoWcC/4XNwQ6CMAyA4VchOzuzDhzgyfcwHsboZAljZCOLh
 vDuDi5qIvH4N+3XmQT0BgM5ZzPxGE0wbkhRHDKiOjnckZo2NeGMF8Cgoq23NFjZ99TY0buIFoc
 pUGiBFUoB4xUj6Xj0qM1jg6+31J0Jk/PP7U+EdfqXjEAZVSoHgSDrStWXxrmpN8NROUtWNPI3B
 EzsQjxBWiCXqCtRwg8o/4AAdqE8QbLWp1KkraaAb2hZlhfCopNHUAEAAA==
X-Change-ID: 20241018-drm-small-improvements-1d104cc10280
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiteekkefgtdduveeuffeuffevkeehieduhfefvdfhueekuefhhfdttddvkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumedvfhdtsgemledusggsmegufheiugemtggufedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumedvfhdtsgemledusggsmegufheiugemtggufedupdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This series brings small improvements to the DRM documentation and logging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v4:
- Removed pathches 3 and 4 because the added warning has false positives
  when cleaning up a connector in the init error path
- Updated acked-by tags
- Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com

Changes in v3:
- patch 3: various fixes suggested by Jani Nikula and kernel test robot
- Updated reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com

Changes in v2:
- Added patches 3 and 4
- Updated reviewed-by tags
- Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com

---
Luca Ceresoli (2):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message

 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 include/drm/drm_mode_object.h       | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241018-drm-small-improvements-1d104cc10280

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

