Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592FCAF404
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9610E49B;
	Tue,  9 Dec 2025 08:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RH3rOYFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA12710E433
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:18:46 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso41752221fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210725; x=1765815525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8FCpGBv7ZwcS4r2vZEvR2WEwNb5v087s7Ex2NscPDpo=;
 b=RH3rOYFzCxh+3ZvPJzvaHHHm6Zv4Yq6ER0gh1As2c4vaDwtiEyTk2nSRLkaoVPRmpR
 727qMYnsiJ+Xcri5JjCNYZbn3faCLw+k2tSYyvoYBUAXZIZZ/7H+iXKCAI/fm+X5KhY+
 bYOQFhcpJGdhqtEKYQjId8kKs0SFgfMtSOVXjDHUijMy+L0WH4wLlg2BXWv/szO+AeIg
 c/o0PB2hpnioNbet+dvIe8CDBEzg9nCSIIupJLDBK9KNrUXRQNEvfouFbQSqKikz3xPQ
 oG+7MgBnsCWXEL/Kcc3QsN3dW1vhMpVIb3vyLUhtTrcWwupYJfkMWh5RhEAXhIKx5Tzp
 aXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210725; x=1765815525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FCpGBv7ZwcS4r2vZEvR2WEwNb5v087s7Ex2NscPDpo=;
 b=BRKovzMTiYPTVL1WH3mD9BSc0ovTw7WgnVQBCNHWn6NxtfhoHyTm3U8JXUYOoaa6n2
 KLnLRxNYiySIoULqLGkekt1PRfe7VpkVJn+3MHAMrPoH0hCFk0IpDVy06f34q2p6g6IY
 dyo3vemZT2vNWsAhaeAi3VH+XMWGJEy45F0hB3yafZJwqxe641gTz08x6Y/VWK4Q20ki
 /GSntM2cb6GTLMjNnzHviobYU/hU4G4/N9qgulSytur8om2yi4kwA8QdItRrsCw423ac
 XeH6L72Ua7jqlWaBYfgOz4sGPH+zy3rDxviE8cZgPs0c6sc14gHZy3eQmis/MW9nfIV+
 47Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8nIzgQvpWeGNE1k6KN1c2YzPoiHv9TzPZqmzW/QkMXTY6SVmd3KTHswZHB0U/NjkZnpnXz1p73YA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJPK4HZbJ6wnXpLmaA5FRc5dwtj1jHjPPriMdE5CLtWynE1gzs
 JFPIJWjWIp4nBbJcwwXmzt3BlINBRgxFLS1I4MlzfXrAeomlECBOxbE8
X-Gm-Gg: ASbGncuXhhVsxZTMvgDC7NObaKGemg+KGyCgeDrflMeGS2RLqFTkoESs7lfdGYhf+4S
 JhtMv+oxshDoHijQ/5c7CWeArq54OsQdTA+BKKx9ydfGZZ98N/ULHL+aDbDVpsdpB4lrJw3mPB+
 W/X6O3w+pHhOl8XMbmdvh20vsc+gZQQk0vtUk7MRzLvE3oa+6OrQG81ndp0OITjsI0ZUQameQJw
 nFpou5IitLi+sdn7LGnuQNMYFkwL2OfjGhgbN+vewj/z27wHwnTQBXBgd81KwlqI0b4q6Jc54l0
 E/8aV8goaGOuqmVQW1Tv+rpSwLMWpWVLs9Tp2uerWhyseD52HjsRkAWu0nE4iXWYS5xw/BKnUbT
 madYGHcbaO+IBdc3S8Qvm24PUUw3CL6qMoYavkv3tb7hgXG3WZLuwr/96ldPY6kQcC9QeSAlFwL
 SzZCj/Ohr3f3xnjaukfHg=
X-Google-Smtp-Source: AGHT+IFdzGWyyU7OQ8VrLp9Mezr4Y3R5Bo9wvR161KXkXq5TXu+cTLhOxWrTMGL3Va6L+/zC6NLzDg==
X-Received: by 2002:a2e:b80d:0:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-37ed83e64d4mr15101501fa.37.1765210725043; 
 Mon, 08 Dec 2025 08:18:45 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 38308e7fff4ca-37e70674a60sm39729111fa.49.2025.12.08.08.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:18:44 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: lontium-lt9611uxc: start wake all thread when
 call detect()
Date: Mon,  8 Dec 2025 19:18:42 +0300
Message-Id: <20251208161842.3764029-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

The chip does not receive an interrupt if the monitor was connected
before powering up.
Therefore, you need to wake up the task if the necessary bits are set
when calling bridge_detect() after DRM is started.

Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4d550cd1a9a1..70672024d643 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -363,17 +363,24 @@ lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connect
 	unsigned int reg_val = 0;
 	int ret;
 	bool connected = true;
+	bool edid_read = true;
 
 	lt9611uxc_lock(lt9611uxc);
 
 	if (lt9611uxc->hpd_supported) {
 		ret = regmap_read(lt9611uxc->regmap, 0xb023, &reg_val);
 
-		if (ret)
+		if (ret) {
 			dev_err(lt9611uxc->dev, "failed to read hpd status: %d\n", ret);
-		else
+		} else {
+			dev_dbg(lt9611uxc->dev, "detect() reg[0xb023]=0x%02X\n", reg_val);
 			connected  = reg_val & BIT(1);
+			edid_read = reg_val & BIT(0);
+			if (edid_read)
+				wake_up_all(&lt9611uxc->wq);
+		}
 	}
+	lt9611uxc->edid_read = edid_read;
 	lt9611uxc->hdmi_connected = connected;
 
 	lt9611uxc_unlock(lt9611uxc);
-- 
2.34.1

