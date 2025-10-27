Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E141C0C5A1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F0210E392;
	Mon, 27 Oct 2025 08:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YaXlnRhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC76810E392
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:43:15 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b6271ea3a6fso2946843a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761554595; x=1762159395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
 b=YaXlnRhWFRkMBouS/ZhKj2LVBH0xwoxZ86drbN4tNsDg6J64z0dCXqbAaUOwTbid4Z
 xx5z2qjyu8KBFjd0j9L1FbvFiF6cKAk8DDxsD5gyTVSwC6o+jItKlOucXFKQIIqYkgH2
 kPSF9APizHmBcOlr/Ct0M3J8fHqr6rH/oSPAMxT3+5iHf+Bl0PPLdKX+Rlter3VO/c43
 vScm7+55TS84N2nmQfSQxlkQklT1avnoZla6EQ/Rc0w0oQ+zUAmj3jsOlE+klxPz7jx5
 CNqQPNWY7u++XQYfT7K7yzhelyhdAIcdOKWnOykgcTtorl97zf4uvwKYd5EeXhNnG7vt
 hebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761554595; x=1762159395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UHwoqgImEy7LQLhZWFXUDhaPJoy+ecZ3A4KynxwsxS0=;
 b=mg/O6J4HCkLV2YS71fk2FnJ1eVIP9ElXnpKV7cCgQSWPWtFjy556RBIzdx9hCJyHe/
 ucmrmWdIoRw28FJ6OdHYPh1d3C9SBKFXxSD7VZVL4h0wSerDNILxk5MdI1byOyIZiclW
 WZ7+FTmDPPXKCYhziG0MwrdOd3zLY6DXM+mRQl1SJuXkkmF9P3l8IGhdlo0ekNjTfC07
 /0I4Tm50OXdvIM3JAFseEDL9S+HZhjw/5xRSepGTsUKyHoAv7pmWvaOFyAqSwMzj/NV2
 sF9l6sjJhgEcBACZ4sxKlIYgH3lrCyrP+OhBOB+UFEyHo7hpn4gMwymEyBvsyLWjVunt
 rNAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDbL1yU3zTK/VOxPBUDaZQnZ+6tIU9qUl4kpFUrhZAf3oCIkVDwvC5/8yaJs/oQCBmuuPdflMlVlk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGO3FPLGx2V826m8bepQlZKYIvyemeaKFjG6xgb1DNIeiRjYch
 HqGdje43p7P2p5/qAYQud1h6Io4WBEClq2woF5BAU7pOaCH4PBdy+ma6
X-Gm-Gg: ASbGncvQccn/7ugTXOov5HS0g+mc2G/4xSluLJC8Ffk+tBkMM/C3Wc8cRTR2RXx6oaQ
 h+1GSqeleQlKDWtzlm9bVAXdI6fsPt1gkKkl8iXauB1YZJepZV78KbAj5Dw+DpYY0o4XSVWjdZ3
 M9tHIhxTcX9b1Or0EEiGrG6XnQboFFYZp13Itd4eOkOEm1MS5/C27jcaG5pzLT4dSFBIRApFdG5
 UNTBKcd/Wgv6c0SNeDhoK0IpFM6F4HN9YywK9B0VmjLQzzn/PXLgagp6G+tkk5VWKKsFFWGWKrx
 AGxh0iOgN/Fqhd/X0D57PvkGqRTuxE/gHqDB/qF3dELRMPlduoXa9asJcmZwuAKpGq3h3XFGLAd
 5wi/E6aXBcKmU+54c6Xras74K4P0HaPSJfFel3j3ehXXX4Wv2SyEuXQiC14yG5wBAzVTsghW2GQ
 RPHjUpUmVy6JHMH9Jivh4QF+o7P3IChhfpejT+jJQxcH0=
X-Google-Smtp-Source: AGHT+IHwgVcslq+1mjD8C6Vh5GqRLux2tDGUe1R/TUV71B2G9ynp6h0rzEeVb0xZxIg7lRsdj6RNXQ==
X-Received: by 2002:a17:903:247:b0:294:c189:68dd with SMTP id
 d9443c01a7336-294c1896977mr7969545ad.44.1761554595286; 
 Mon, 27 Oct 2025 01:43:15 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-29498e3d2aasm75349815ad.88.2025.10.27.01.43.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 01:43:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Belin <nbelin@baylibre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/meson: Fix reference count leak in meson_encoder_dsi_probe
Date: Mon, 27 Oct 2025 16:42:58 +0800
Message-Id: <20251027084258.79180-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The of_graph_get_remote_node() function returns a device node with its
reference count incremented. The caller is responsible for calling
of_node_put() to release this reference when done.

Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..01edf46e30d0 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -121,6 +121,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	}
 
 	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_dsi->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
-- 
2.39.5 (Apple Git-154)

