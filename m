Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A693899D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 09:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258F010E393;
	Mon, 22 Jul 2024 07:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="ZbIE9MZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A47F10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:07:22 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4WSBDV1hVszDqFC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1721632042; bh=xsoO8528D0avOH03gvCuFMU5tujeueLH3Z0pXQqFoiQ=;
 h=From:Date:Subject:To:Cc:From;
 b=ZbIE9MZHYpjb/Wt7BYgyZGdhcP9+gAc25mB5CCJ25ZzJb5Ymz2RpVs/dxOPxMS8u8
 B60hSUPJTonBrnH+o4vv8RD+W7hm+O2jXZ+5kkyaFMLHJiMeULghpRAX00kTOwN44R
 HcyQpeSYS7D2R6J7S9R1csERaUt8NjwmimKNdbMM=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4WSBDT4kdTz9sqv;
 Mon, 22 Jul 2024 07:07:21 +0000 (UTC)
X-Riseup-User-ID: D470CD1E37C4D29186DA6EFD9BA40A74E66F303C20FB3AC69D2064775CBDA922
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBDP4tnDzJrbR;
 Mon, 22 Jul 2024 07:07:17 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:07:15 +0700
Subject: [PATCH] drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-bf060y8m-aj0-prepare-prev-v1-1-0e51c0f59d22@riseup.net>
X-B4-Tracking: v=1; b=H4sIACIFnmYC/x2M3QpAQBBGX0VzbWpMsngVuVh2MMpPuyWSd7dcn
 c6p77shiFcJUCc3eDk06LZGydIE+smuo6C66MDEORlm7AYq6CoXtDPh7mW3Xj4eyK4rjRjnqqq
 AuI9x0PP/btrneQHbyj71awAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dang Huynh <danct12@riseup.net>
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

Enable prepare_prev_first flag for BF060Y8M-AJ0 panel so that the
previous controller should be prepared first before the prepare for
the panel is called.

This makes sure that the previous controller, likely to be a DSI host
controller should be initialized to LP-11 before the panel is powered up.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
This fixes display initialization on some platform/devices such as the
Fxtec Pro1X.
---
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
index e77db8597eb7..7e66db4a88bb 100644
--- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
+++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
@@ -377,6 +377,8 @@ static int boe_bf060y8m_aj0_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&boe->panel, dev, &boe_bf060y8m_aj0_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
+	boe->panel.prepare_prev_first = true;
+
 	boe->panel.backlight = boe_bf060y8m_aj0_create_backlight(dsi);
 	if (IS_ERR(boe->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(boe->panel.backlight),

---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240722-bf060y8m-aj0-prepare-prev-2db87e7dd996

Best regards,
-- 
Dang Huynh <danct12@riseup.net>

