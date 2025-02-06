Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E383A2AE5C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 18:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0BD10E24F;
	Thu,  6 Feb 2025 17:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PwaO+TG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9150C10E8E0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 17:02:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CBB944457;
 Thu,  6 Feb 2025 17:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738861370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KLVc8DsJkG2/KhPhAnvbwhnbrB/mygCyryTZUCypcnc=;
 b=PwaO+TG5J9cyS9QiTdq6WtcuzQGZ+a+nIabj0Mz0mQr9aN9NsfvX1Gkip0n8snIaSEL7KG
 8IiUp8YAPUFlyiEotylqUL2YEL8+LhMZ7x6QgrjyP6X1JQcwk5VTy7INFM1JnShsQA2CU5
 ZstvMTz7z83SZkEC6trTCdi/C9MePOhJchpxeacthltH/NXzmCxjpsMYm/9N+hTkWDYVjI
 Xnaa4GHfraHszsTstowFvWLCbXsMPe0mxCMfAU3K3pKxFzlm0Bd+9BVuf9NnCGk6dobc0U
 r7SWfwtBvU6hpfWkHJvJa5Bw1AoUCezGio8PywZM7ZIpIokEZjvQFJa5JM2IOg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/8] drm/bridge: minor cleanups
Date: Thu, 06 Feb 2025 18:02:32 +0100
Message-Id: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjrpGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMz3ZSiXN3knNTEvNKCYt0kcwtzA+NUA5NUyzQloJaCotS0zAqwcdG
 xtbUAbrxV/V4AAAA=
X-Change-ID: 20250206-drm-cleanups-b78703e04e9f
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkeetvddthfehvdevieevffehfeffjeevgfelkefhleeufeevieevfefhjeetgfevnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemhegrgedtmedvughfieemrgdulegvmedutgejgedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhin
 hhtvghlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggv
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

This series removes some unnecessary #includes and and unused forward
declarations, which I noticed while preparing a way more complex series
(bridge hotplug). I decided to split these trivial patches to a separate
series to limit the noise on the larger series.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (8):
      drm/panel: remove unnecessary forward declaration
      drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      drm/bridge: parade-ps8622: remove unused drm_panel.h include
      drm/bridge: parade-ps8640: remove unused drm_panel.h include
      drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
      drm/bridge: tc358775: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include

 drivers/gpu/drm/bridge/nxp-ptn3460.c   | 1 -
 drivers/gpu/drm/bridge/parade-ps8622.c | 1 -
 drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
 drivers/gpu/drm/bridge/tc358762.c      | 2 +-
 drivers/gpu/drm/bridge/tc358775.c      | 1 -
 drivers/gpu/drm/bridge/ti-sn65dsi83.c  | 1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 1 -
 include/drm/drm_panel.h                | 1 -
 8 files changed, 1 insertion(+), 8 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250206-drm-cleanups-b78703e04e9f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

