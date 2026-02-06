Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCi9Cz8ohmmLKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A9101441
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D6810E86C;
	Fri,  6 Feb 2026 17:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="INJD40EA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EBD310E12B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 12:38:14 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so21850005e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 04:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770381493; x=1770986293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ns+MXhJukhn3KEMfjhaf0vuBQwUYwZFyGUUZrRy+AsE=;
 b=INJD40EAslMy0Bf1e6yq5LFpTTegUzgBYus78G4STM8ZudJm3d8oox09irRle7r7Ez
 6o9spPRDPQvoCa37KgJqK0+O8aqHWwUYuDQVCTEz28JKEXZGme25tza2JGIqzzxNcqOJ
 as9QlzHZwAazD4V6QicGN3qCt0dZzV43DG9jwHpjK+9nj25lK+yXu4uvD2/p7VWZW+j2
 3krYm6JzT36U+v5nKbw0PFh6W7tsENMjwklyfs6qocKzmlNJ8OetQqjViswQnb+TqKo1
 mU4vt0jf5j+X/0hPtJIfZv/MkO2Ru2rTh3dzaMsUaliCZ1ea6JTN56/MP3NyPJXoSNfF
 q2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770381493; x=1770986293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ns+MXhJukhn3KEMfjhaf0vuBQwUYwZFyGUUZrRy+AsE=;
 b=skFnS6qzR45oekgRx77VcKapwiZNYYd79o7JGSqZY3uHQ6JtjThdP2O/EapsYcM17U
 0U9vpvnMofJwlyIME2m5Mi7CuhtGdIZqjovoLr9Jzo42vHANKQHfaObttuFZ/r96aML1
 q0Tlsr5OdWefRjxCQnhpjZCOy4CMdMCt2gzRqM85GFHaUcfS8BEyB+igDJO/MH7M4Bk+
 kZEU9gwwp7y4pL22oy3aYlVcYPoLfxQfuvPSeLK2GzmExRsNOAB4tFQChDoy0mGHe23H
 GkcB8TOaji+NJ1togAGwERImUyc0MRck9SrYv2+120bcmnH5lSlZFNdse2+sU21tYk7S
 m8Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6GIPR/KOqyJ2rG+MR9OjT88kEkfO0xyUu97FN/WNHeQPcZy/ubfwAU07vZ70tjw5o2nDtrxA2zNo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys5ezRXO2b6NrOlyW+PTcRYbSStKHGdFOSAOltSSiqfDo+qUgX
 U06TVhWqcW5czZH6DrHMp0w1VINyZzg1vKCs+QQjkJ6JaG7DttlCsDGl
X-Gm-Gg: AZuq6aJvNsA4bNn6VGXTZ9khmuNgoblU6BYqoCZdh11uDJXhrrH8gg2/M3NUkv6Pkcb
 FxQWggSaR1tw1bmH+k+db4axJUPirRQUCcv8GzPHZtN5E6/PWhq0F+mrgUrzjkofJgk0xkX/GIh
 eL8bPoD1TLBpm81B/4fZREhmy5UgAXW6vCMBaDxP4yUqYZ+avi5P4GXKuUrynqQkp919hE+TbIm
 RcffvDDcNapXIn3XrnreasTYhMicQ6zA10mQww/fnZLCnQASXfh4EYeBfTVkxQWxOrHQ55WcPf8
 0Qn6R2IchvIU6x93IIHI8EROmllGCEj5iKnWVDNpUQEirQBmgKLhJ/dme1ktq3PRphIc6w2YePm
 +DbdOimDkPtQd7TjxFfYLabUs5KRzM6Ey05aAuhkgn8q2Tp5NJxQfdor+Gx9mgKhzxa1MqZO1HG
 R9Zs0pPtQ9Mx6/5gCZuUvkVSKAhEEikzrLRML7LQGlMivwZdm0oV5os7LQBHSAMegvy8ocVt5NO
 6+wG06wQ4omem10oQPXciAEBbEVEhLr3LJjleyM4BLee4V2vR+bJbTgstNLZ1U2zpKmfnlj43UM
 MQLiqQlx
X-Received: by 2002:a05:600c:8b6f:b0:477:7975:30ea with SMTP id
 5b1f17b1804b1-48320236963mr35535055e9.29.1770381492800; 
 Fri, 06 Feb 2026 04:38:12 -0800 (PST)
Received: from franzs-nb.corp.toradex.com
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832040a3cesm32168955e9.3.2026.02.06.04.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 04:38:12 -0800 (PST)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>, stable@vger.kernel.org
Subject: [PATCH v1] drm/bridge: ti-sn65dsi86: Enable HPD polling if IRQ is not
 used
Date: Fri,  6 Feb 2026 13:37:36 +0100
Message-ID: <20260206123758.374555-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:franz.schnyder@toradex.com,m:linux-kernel@vger.kernel.org,m:francesco@dolcini.it,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[chromium.org,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[fraschnyder@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fraschnyder@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,toradex.com:email]
X-Rspamd-Queue-Id: AB7A9101441
X-Rspamd-Action: no action

From: Franz Schnyder <franz.schnyder@toradex.com>

Fallback to polling to detect hotplug events on systems without
interrupts.

On systems where the interrupt line of the bridge is not connected,
the bridge cannot notify hotplug events. Only add the
DRM_BRIDGE_OP_HPD flag if an interrupt has been registered
otherwise remain in polling mode.

Fixes: 9133bc3f0564 ("drm/bridge: ti-sn65dsi86: Add support for DisplayPort mode with HPD")
Fixes: 55e8ff842051 ("drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 276d05d25ad8..98d64ad791d0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1415,6 +1415,7 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
 	struct device_node *np = pdata->dev->of_node;
+	const struct i2c_client *client = to_i2c_client(pdata->dev);
 	int ret;
 
 	pdata->next_bridge = devm_drm_of_get_bridge(&adev->dev, np, 1, 0);
@@ -1433,8 +1434,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
-				    DRM_BRIDGE_OP_HPD;
+		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+		if (client->irq)
+			pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
 		/*
 		 * If comms were already enabled they would have been enabled
 		 * with the wrong value of HPD_DISABLE. Update it now. Comms
-- 
2.43.0

