Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MniCmcqimm6HwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:41:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF8113AFE
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 19:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E810E44A;
	Mon,  9 Feb 2026 18:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eO8xrJyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677B610E44A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 18:41:39 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so45792495e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 10:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770662498; x=1771267298; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oMtozXDIGyj09zGXANkEQgHzJkoyCjXc2a15Zop0B9Q=;
 b=eO8xrJyB5fwWcrFreoiT8vj2MuDFL9PdP2eR0nIWlj6jubYiJkJBey03eqVgARd9S6
 LkrN337rN43iMYRZkFmAQeGERBjkBXtfGYmN8pYxFj0vqk7HGjWwHY3ZJ17+rP/rHKQr
 5kIQBxbVcfhb9Q3jfrqKsKVYQnL5wSdR7CFogO1w05EvMXSEfmUXcIlMGOJ5i5n0uw4H
 Xl5185s6TLakMYgWPj0vAPcdwxWlcLcHTDkuQlWuPfEtfixzDbzqH8H3AvcA5DyRvld6
 n0dRJXVHojkXwrWwZYa6UgCFubXYoi3J9qfquRFkMIWskP7tR+Q35UQNnpNQrO3H5Irf
 mE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770662498; x=1771267298;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMtozXDIGyj09zGXANkEQgHzJkoyCjXc2a15Zop0B9Q=;
 b=f1Kax7Ojdcfres+9ktUWD6njxTllhT89Te71G7VJRBhALUNb4YAVogqdsXEbAvlHvm
 ddoAZHNHSXthW8bUqwyilehRn7T0c2IxyMZ/9MT9zuPOkfI5DIjZDKnNNaigDyDV4xmr
 M66FVj810V3sZ5K0xnXLRfuzlQ2kr10m3LGF/Nf5+jN0zZvZ3K3neSgdSliptsR/znff
 ZzE3ksdPW4ORdQIiMVqpJ8639zsJ5CzI882J0y1EaINk0KMnzvJivK9y5ODv7It5W/F3
 0vi9CuG+mJmpl6Cvx6xs3/sr9XBYBbJMHlCfzV1/0TuCL/8uFaWZGRJYNwmozfRAxK/b
 qs5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNmdcXCmIqpvYpn/gcbT/tPm3OZEEOUHh0zUo8gpmsRHaxIwDxzl5ZmyLNBXz8y1k0pFVW3dIFbg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8UxAZhv3v0JRk+KtOvvm4c4eAX65dg1ZF8s1ZOr9OgSIJ6XUS
 vzdcm/0wzSG7OcxHgwOfiA95g9y5Z3w6IdOfz0ODszZBQN8iTu9MBaBx
X-Gm-Gg: AZuq6aJaG+iUwHNsa4tkTLTcK7mWUHJtPf9yb4AC1YKJ2H3QwxqavwwxSbDS5DZP7E7
 nq7S58C51rRLAGXBgfsBInU+9Qj60ONXQhEKCRIlibH1SeZNXyiDHoZfSU31YpfvWKV4SnG4eAx
 6uEzPWmOxkScyU8a5tnlOPZjhytQv/6SATpjEE1LCpLTiRG8qZ8N3FRUz0r/aWzL7/TckMM3nnj
 Rf9M6jM80Y3nLMvBbua31I+eXZHR//7DLOnueITc2iKHhXLBpa/mDd9YmRKHVwgLx+u5i37+34G
 yLL+Gzd8qfizY4jDHvfO+W89phqsxIkkRytj5gTlFBrfCcV6uxwPMwaJBG+3nzv/ufS6sHQyNOx
 kWo/m9jElMcNs2af82ieUkH/eR8PkLjeJb87ncC9gZBDFCP5iz+bYx+bIp0l4f0qfx9jYlLfUXa
 SzKsD46WVFx4TfZWnzkFWi4kBTzHMZW8a8KCJ7iefsAWQ=
X-Received: by 2002:a05:600c:4fc8:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-483201dc396mr187849515e9.4.1770662497594; 
 Mon, 09 Feb 2026 10:41:37 -0800 (PST)
Received: from osama.. ([102.47.82.62]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436297455eesm28931232f8f.29.2026.02.09.10.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 10:41:37 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
Date: Mon,  9 Feb 2026 19:41:14 +0100
Message-ID: <20260209184115.10937-1-osama.abdelkader@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[bootlin.com,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,denx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:marex@denx.de,m:linux-kernel@vger.kernel.org,m:osama.abdelkader@gmail.com,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,m:osamaabdelkader@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 77CF8113AFE
X-Rspamd-Action: no action

In samsung_dsim_host_attach(), drm_bridge_add() is called to add the
bridge. However, if samsung_dsim_register_te_irq() or
pdata->host_ops->attach() fails afterwards, the function returns
without removing the bridge, causing a memory leak.

Fix this by adding proper error handling with goto labels to ensure
drm_bridge_remove() is called in all error paths. Also ensure that
samsung_dsim_unregister_te_irq() is called if the attach operation
fails after the TE IRQ has been registered.

samsung_dsim_unregister_te_irq() function is moved without changes
to be before samsung_dsim_host_attach() to avoid forward declaration.

Fixes: e7447128ca4a ("drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: 
- Move samsung_dsim_unregister_te_irq() function
- Add Fixes tag
- Add Cc tag
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eabc4c32f6ab..ad8c6aa49d48 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1881,6 +1881,14 @@ static int samsung_dsim_register_te_irq(struct samsung_dsim *dsi, struct device
 	return 0;
 }
 
+static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
+{
+	if (dsi->te_gpio) {
+		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
+		gpiod_put(dsi->te_gpio);
+	}
+}
+
 static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 				    struct mipi_dsi_device *device)
 {
@@ -1955,13 +1963,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
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
@@ -1969,14 +1977,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	return 0;
-}
 
-static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
-{
-	if (dsi->te_gpio) {
-		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
-		gpiod_put(dsi->te_gpio);
-	}
+err_unregister_te_irq:
+	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO))
+		samsung_dsim_unregister_te_irq(dsi);
+err_remove_bridge:
+	drm_bridge_remove(&dsi->bridge);
+	return ret;
 }
 
 static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
-- 
2.43.0

