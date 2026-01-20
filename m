Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135CD3C206
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC110E11F;
	Tue, 20 Jan 2026 08:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RuIOrnQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790410E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:27:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42fb2314eb0so4125529f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768897661; x=1769502461; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jqiv5/fr/TnAEgpOJekrDgiu75OtJHHpJGEugbbiGqQ=;
 b=RuIOrnQepN/MLP/IHvgIghT+5XTZjTGjkklPnd/k33bOZrwWBMdaEyqO6UV+YVX1Wd
 P1/W87eT81h1t55YY5DJwE7LVcrg0D5ghPl/ZroFN0UG08VQ6d/+lC8i4MM2/qQKNW5l
 fyUa8hAvpc7eT86yn6nqtP1C0+kRB9AzF6k3IzqB/Mqnb0nRv4bz3KTdLRK4p/+PAfuO
 yAJPOuL3Zup36s8irUkzM5f8ioxovUflW4epSMCFxlDHOPsBmBFcmGh/37J2SqSoAkLR
 4xTVTct/ZYIkEFijrtLxaajzI+VYbY9Y5hw72tPpKOUYpPh3LtOwoMTX4aA/RQilhy+R
 gNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768897661; x=1769502461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jqiv5/fr/TnAEgpOJekrDgiu75OtJHHpJGEugbbiGqQ=;
 b=cNepJG28+JIHBMXDDigNvXlxhZfroE28gssagkwRizmXhSn5KsAWkIRIOlAN4VWaIr
 g275tUlNPaHHnnnGCFIiiAxF36cT/83nPCt18Gyqi2/7MHQMzMmQhSD0U8IW3xTJmqbk
 XYAWPpn9JdsK5EjGDYIp5X7Nu0suH7GDOIknqd8bWIj3xq5XylMW+71x6jTmkC1DYnSN
 gP/uLJ5T4gFdvcV0LZg3B1OmGKd5F1OdooLPf8AIRa9I/Ubb8Xub5HyRbNHSxDHHbAqM
 HZJyWB7JwOOulI5IQ2yfty1+HU4uUDHoihapaSzIjaJKUSZnqjeeUGDZG3iGw0v94w0e
 kcXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVFgpRP2dB3frpHiTlebjCaRnSXmN//fNUj/cKd29hbAsYIz+GH0po0DZLrdP4B5uUstyxzKh5ISY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzpdDFQG/zYS0n1JJ1C1Ie78xC4CjwtOIINKnVKK7q4Ym7GDPr
 C8CW7ZHggqYwyRFBAh39aqurcD/YROE7fgKt5fiFKIVKdlSrcjAExrop
X-Gm-Gg: AZuq6aKF3Ki9O+Z/yaYePfQLz7EtjWT+S0cZlCFXN7Qc4unNTV6tLjJPN/ZkpbwSUzD
 eXve8KFzhna/CZPM/Wlui+IglbXnpoB9UB37hjv/2WrQoeRooE7Ws/24eHo1FGhqqoP4MkwojJa
 4US5eYAiLngJsirGX4QIagDgU79WNOsY7xp2nVAbGZ7UDZL0oJStyDiQRYfEkBxKOiD1cVcXvej
 fpAqNzs6CFcS4pbXQ55XcjPYuGfOG2/Ky5utnRHn6Cgf52GHiUchAQOecbbRiwKx/eUPJcp0Qr7
 67pC+hVWKrgdGoPX03H4kWbrUZuw6BwYQ9u84a3sSstN4LS0LjzNO1wDB0jdaDzN+19/59bhCVF
 j26OTTncMgVz4fRxco8+0XuPnVjm2TEexrKK5EhTMHIGbguF9jATHlI+D5kWXbVbBkMlKB81fcH
 zaRhQSAExzNDvdgg==
X-Received: by 2002:a05:6000:1884:b0:42b:2dfd:5350 with SMTP id
 ffacd0b85a97d-4358ff6f74dmr1664760f8f.56.1768897660546; 
 Tue, 20 Jan 2026 00:27:40 -0800 (PST)
Received: from karanja ([105.163.156.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm28680381f8f.22.2026.01.20.00.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:27:39 -0800 (PST)
From: Erick Karanja <karanja99erick@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v2] drm/bridge: dw-hdmi: Replace calls to deprecated
 HDMI/audio detection functions
Date: Tue, 20 Jan 2026 11:27:31 +0300
Message-ID: <20260120082731.15798-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Replace calls to the deprecated drm_detect_hdmi_monitor() and
drm_detect_monitor_audio() functions. Calling drm_edid_connector_update()
updates connector->display_info.is_hdmi and connector->display_info.has_audio.
The driver should read these fields from connector->display_info instead of
calling the deprecated functions directly.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
changes in v2:
	- Remove unnecessary call to drm_edid_raw()
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3b77e73ac0ea..ddc4ae40d94e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2472,7 +2472,6 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
@@ -2482,19 +2481,9 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 		dev_dbg(hdmi->dev, "failed to get edid\n");
 		return NULL;
 	}
-
-	/*
-	 * FIXME: This should use connector->display_info.is_hdmi and
-	 * connector->display_info.has_audio from a path that has read the EDID
-	 * and called drm_edid_connector_update().
-	 */
-	edid = drm_edid_raw(drm_edid);
-
-	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
-		edid->width_cm, edid->height_cm);
-
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	hdmi->sink_is_hdmi = connector->display_info.is_hdmi;
+	hdmi->sink_has_audio = connector->display_info.has_audio;
 
 	return drm_edid;
 }
-- 
2.51.0

