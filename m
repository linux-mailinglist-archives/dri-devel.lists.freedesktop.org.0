Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAD1B0E50B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 22:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCF910E156;
	Tue, 22 Jul 2025 20:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T1Zer/GH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4397C10E156
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 20:41:19 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ab3a21c1a1so4512641cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753216878; x=1753821678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vXq9JEdSpTNYsbXVDMrXQnV1WYKVqKwb2I/usPEuLyw=;
 b=T1Zer/GHxpyP4lp69IgtrrTCC3oNGDlSIPD5BTHreCvztZcaSpu6wYMMtyn06Mvujd
 Vk7mkXScHhOGEjC4LkhkZ8aDmN0RcXEF6/7E99fL9GahGBaaMHna9aFCSKprqL3Vzl1d
 gx0wouwa8fbPRzhw4c8sr1d7otj1XPBbjlTPSC1CRcgcJ2T3Q6oFXBNVZiAE2MACzRJ7
 y+wgEMbT0D78uuAXj6pLeVNNDRVzTGFXirX7AhoIlCqfzGz/eRxi2jvmowgvOplpyv7p
 ab9xxShbZX7JPuKNZu8DQw963gxQnzCs9h+6kZCUPDgzjPYolzrOx9MFw68rso3DpMfJ
 sF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753216878; x=1753821678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXq9JEdSpTNYsbXVDMrXQnV1WYKVqKwb2I/usPEuLyw=;
 b=WShiai2CB0G7CST+KDUoaklW6K4aidN4FuBOIZGM9eI3GLdlEWaFki0jkSGtmZ9rmo
 sT2j375Y9wm7TXT8hYy/zwRLcp9jlU4MDNs79Tn+gQWCcW2NEW+sYBnHHSfcJj1G/LHS
 2l49UxXfEIPh+Y7po0quW0pfQjR4WdsnFkXbznWRfBgveaaCQ9DBCnqfjvO5ApdWcpCu
 J+red50ca+TKuXL65B/7CXch/RqMFV4rx9vSMjGSP/8VU2j+k2dmH35qWMhNOh3IPpKc
 U94XjGXt3uPrpvG11CxKdQ0qwcY+J5fIuE1JoQ9O1CCrs0h7XAsyK9mzrP3OT1VCUwcC
 w7Cw==
X-Gm-Message-State: AOJu0YzNcB3M+CtcKcolu3mwTWkf8k/xak+Jfh1CSmFAB2+l+GLwpoBY
 CgymlAa0ydteF9ES2C015z3P4wVdzOcxQ2VVP7yCu9yq+3haw/0r9cM=
X-Gm-Gg: ASbGncvW3Fdq+oQALDFZl49e6qz4noIcLeDmiFUMSffEhyssWMSrdWVIsoZ1lzAzRId
 wfjVCwS7Pk64uUpYMSFTlzSWuVAbHiPBNv4sMk9gKN2jMd84gszkmIUffxX+VJbGDM7NnNzer3F
 BuHLLjSvnYgzaMkVRwmrNOyLa72u8Byaprradb3Hr4T6MvQi0yjdoGUage8hF/yQNvdcDx3xfRw
 MURtSGGVN/zWsocdtji3JB8QNZcNDVcrPdwrgpu0PpOvcTO6Enz3eheQNfMQ6RLwZq7h3uikcWK
 TfyLsdipekz/7evpkSV2jrI0t1KKGMEU4RNRGxoX0wgoaGdzcXhKmFbEhlEuNeFtgRFACLxDpkN
 EP0P8R2LIQdxE6KP9PZQ=
X-Google-Smtp-Source: AGHT+IHtZaKvEyIurde8xJ3eQSeb2I48u/E6ukWHBWmaIivtcdRbkJOIi/7FYe5C8jeqXQD86GncJg==
X-Received: by 2002:a05:620a:d82:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7e62a175e06mr43641185a.13.1753216878034; 
 Tue, 22 Jul 2025 13:41:18 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e6236d24dcsm101072285a.30.2025.07.22.13.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 13:41:17 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, biju.das.jz@bp.renesas.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
Date: Tue, 22 Jul 2025 15:41:14 -0500
Message-Id: <20250722204114.3340516-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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

drm_atomic_get_new_connector_for_encoder and
drm_atomic_get_new_connector_state could return Null.
Thus, add the null pointer check for them with a similar format with
it6505_bridge_atomic_enable in ITE IT6505.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
---
 drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index a3a63a977b0a..3a20b2088bf9 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector *connector;
 	bool is_stable = false;
 	struct drm_crtc *crtc;
+	struct drm_connector_state *conn_state;
 	unsigned int val;
 	bool pclk_high;
 	int i, ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
-	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	if (WARN_ON(!connector))
+		return;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc = conn_state->crtc;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
 	mode = &crtc_state->adjusted_mode;
+	if (WARN_ON(!mode))
+		return;
 
 	regmap_write(regmap, HDMI_REG_HDMI_MODE, TX_HDMI_MODE);
 
-- 
2.34.1

