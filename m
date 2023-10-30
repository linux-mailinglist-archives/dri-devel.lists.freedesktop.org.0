Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC647DB4CB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5E210E22D;
	Mon, 30 Oct 2023 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DD610E212
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 07:24:38 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1698650674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/ff6X+NOYVbrocTBpgld9JVVmEwtIn+hGTJSAUql5A=;
 b=rZ8D0uh0IV53WbKCCnQnBoBtXVYNz+6fI1mPvXErAQh0wDixiRvkOb68O4sbL804cgtFs0
 Z1+0caU1cRnsowurxNEA5aWv0sF/orTPfTiggRZZQyTp5NjLysv1tXLDyD8xgVDNyfyWVl
 B2hPZ4C/CrfinNbmwHXAXBDrZJ0gCUsLEnAVhXFFCGSiE8qqxoJlZeZX5ttmXV36nWH8Jy
 QmA66UFTCAe0XpiVeCpJSO1r9h3ZMjczvUTUEyjiIEGUu+fN7Ad1Ir2UGv9zLEBaKqnnnR
 P6IWH7cV9D2ZHQqxxIGGF79QJDDJv/TTHg2kAm30CXcDEepB4z/UwuWdL36OBA==
From: John Watts <contact@jookia.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v4 2/7] drm/panel: nv3052c: Add SPI device IDs
Date: Mon, 30 Oct 2023 18:23:33 +1100
Message-ID: <20231030072337.2341539-4-contact@jookia.org>
In-Reply-To: <20231030072337.2341539-2-contact@jookia.org>
References: <20231030072337.2341539-2-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 30 Oct 2023 08:06:21 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, John Watts <contact@jookia.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SPI drivers needs their own list of compatible device IDs in order
for automatic module loading to work. Add those for this driver.

Signed-off-by: John Watts <contact@jookia.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 589431523ce7..90dea21f9856 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -465,6 +465,12 @@ static const struct nv3052c_panel_info ltk035c5444t_panel_info = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
 };
 
+static const struct spi_device_id nv3052c_ids[] = {
+	{ "ltk035c5444t", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, nv3052c_ids);
+
 static const struct of_device_id nv3052c_of_match[] = {
 	{ .compatible = "leadtek,ltk035c5444t", .data = &ltk035c5444t_panel_info },
 	{ /* sentinel */ }
@@ -476,6 +482,7 @@ static struct spi_driver nv3052c_driver = {
 		.name = "nv3052c",
 		.of_match_table = nv3052c_of_match,
 	},
+	.id_table = nv3052c_ids,
 	.probe = nv3052c_probe,
 	.remove = nv3052c_remove,
 };
-- 
2.42.0

