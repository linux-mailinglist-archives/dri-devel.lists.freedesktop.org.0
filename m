Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCXcJ26Gh2lRZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:37:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A97106DF9
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FA110E12C;
	Sat,  7 Feb 2026 18:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="STazjiv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5980410E12C
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 18:37:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so19807905e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770489448; x=1771094248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1fc9JdHma9XDLTdFb3kvtPOeUV2ZhOtWSv7/jTyQxs8=;
 b=STazjiv50ohhrxH+BVYwGOHaiv20dITR4xC/eM65N70rqANNdzeXLn071rIXZpIQJD
 rsZ2X8gCs4L8TuIs4M5geX3GbZ2+Twj9ksbDvFUnyWTDq+nyzwELfa2afidMZfDZuq/1
 L7eftKimChtBN9c+wJFkKOiTZFmCGdbI5QO1lyMfJxulHbrq5SWcxPNA31g0LXZ1sBmw
 gzplZoSNnoVYjW/Gbn65RVDGPi9dz3a+Y0s7UUe3e1urt64Hz+dF+jmKv6oQHdRva8z1
 +j6wBbVjzbPQd68TapGbiTzCQPsWEzdBY8Yr5WomNVKaj5nXwl8lTdZESoP6Ws036Mve
 lyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770489448; x=1771094248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1fc9JdHma9XDLTdFb3kvtPOeUV2ZhOtWSv7/jTyQxs8=;
 b=C2FmJqxR1KSsQmLvfJjxcJ6FXFRKDp6LvO+qZJ3aP1Eda9eTfg5+HfKMTaVQu8d558
 KCIEz69KXhxRggfXFj0Uu9Yf7OUKz/DmwPYyfbKMFPPiledqGvYX3v+5j0YJTi2b8W3c
 qC2d713Va62n4Hvlhho5WR36+Qml4XagG91acFSOWP5ka0w5jxSWNS57cpeIxvsWQYya
 ryea79aP6XWdEQ9xtt0g8xtmfDIv8klpZ+O3I+C55rZsvHmw524rO7jtz8uPj4ZFn8Vf
 0BXGT7Au1vQoSqWtBW1y3taIM2EdNdikc08ZXeCHfV7hvAB5iW933Cd6rz11pkqwJLNa
 +kJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFrbMo7bXBgv6zEJU5+/12/lhFXdgCxGBwpGiqAZ/NxaeOlSjLoOgWV8V8YYiOw8rq/Gz2ezp/Js8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFpiAhg8eKR1M5rkKqjDUin72t3lUAnQlUN3xbW97Vei+hhysE
 hCc7PS5XmraS2QMQzDhIv0e/NzJC1eWNNZmRjqFU/kkN3UfDBE9WE/DB
X-Gm-Gg: AZuq6aIRtxg/5K1v09ok0ljh1wFukQj/CFo054gNQjXvnEM644t1WkVDQNfCc6S4Wro
 OnMt5J4+mijozTFTiQymbvrz8hVxyVWAMdIzEkWYNJZn5h5OM5Q0ZWvEV3a/jkvZFGdVjfAzzVy
 VQ4pryUDrs5xFfJHdVIiePEqNK8VB+kZB/OHFQ8uHkNND4cfpbvhSfWOLGToqbUbmGLZt4gyfAb
 I01tiIRvjL+9zb/wX8E1M8fFrCwob4Vl3fnoUMm4U6G1+++w/YVVFnWlkmqUPolrUwtzyLxYj2F
 9jK2CbL+pveoqTu7n3Hc3Z5Kgr/GpVGsWN5NE9IgVfGBBWIhUEE6JcoifjlfagYMbnH2c9T18l8
 ju1rg6ROBzJtTjuH+bapsNpi5HVWcnztxp3mlNf5WYxzRgST59KAo5p2lcITGL0KM7nxTKEa/wL
 Ez7GkbdyliPy388QARvU+MtSO3AKy+mCSiHce6sZEZ5mVt
X-Received: by 2002:a05:600c:34d1:b0:482:ef72:5787 with SMTP id
 5b1f17b1804b1-483201da065mr81990065e9.1.1770489447388; 
 Sat, 07 Feb 2026 10:37:27 -0800 (PST)
Received: from osama.. ([197.46.155.47]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832a38425asm72529845e9.7.2026.02.07.10.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 10:37:26 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
Date: Sat,  7 Feb 2026 19:37:20 +0100
Message-ID: <20260207183721.43087-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:osama.abdelkader@gmail.com,m:jernejskrabec@gmail.com,m:osamaabdelkader@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C8A97106DF9
X-Rspamd-Action: no action

In samsung_dsim_host_attach(), drm_bridge_add() is called to add the
bridge. However, if samsung_dsim_register_te_irq() or
pdata->host_ops->attach() fails afterwards, the function returns
without removing the bridge, causing a memory leak.

Fix this by adding proper error handling with goto labels to ensure
drm_bridge_remove() is called in all error paths. Also ensure that
samsung_dsim_unregister_te_irq() is called if the attach operation
fails after the TE IRQ has been registered.

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..4712637749f8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1881,6 +1881,8 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 	return 0;
 }
 
+static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi);
+
 static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 				    struct mipi_dsi_device *device)
 {
@@ -1955,13 +1957,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
 		if (ret)
-			return ret;
+			goto err_remove_bridge;
 	}
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(dsi, device);
 		if (ret)
-			return ret;
+			goto err_unregister_te_irq;
 	}
 
 	dsi->lanes = device->lanes;
@@ -1969,6 +1971,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	return 0;
+
+err_unregister_te_irq:
+	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
+		samsung_dsim_unregister_te_irq(dsi);
+err_remove_bridge:
+	drm_bridge_remove(&dsi->bridge);
+	return ret;
 }
 
 static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
-- 
2.43.0

