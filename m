Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F367F63762D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 11:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3BC10E262;
	Thu, 24 Nov 2022 10:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A8210E25F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 10:21:21 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id 4so1132008pli.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 02:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3Zp7oNSpvCJzlmrAgiA+eyc89NALrCy35DmIPjsn8o=;
 b=Lk6A3X3u7rHOEkHOKdmz7Rf/XoRmo/K4/VfJsj8Om775/vkojm7XMlKACeEPdtGuaY
 GWc3uQh8uXQFtaJdIUpElGlC0FwjCX/fGyfhcBNnkoABKE+H+lRGtSCr6xHwihfNhdnD
 YH1yIBafS0Aw0dZHXl5eRfe/hATI+Ef9EbYm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j3Zp7oNSpvCJzlmrAgiA+eyc89NALrCy35DmIPjsn8o=;
 b=PWF8TORTFztJXz8m6g2cgVtnT4WO8/NUAqXSQrCaWrA9IihWDpMfc2X43U9HT83XUE
 HmtYUltWZy0lh048ALbFtuPWh2xh7H6OUELTZRY0ScZ7VWkVtI9lLMHFwlHIY1HPlPwM
 XeqdkuNOkYHMklEL5nAy396LZ9qhWTnYAxFfqGcNCEwgqn7NYcstbgskyFOU64ibMBXB
 8pr3U750cpya5LHs4Ddc1F/AlLmJBnPNpsAOFdkx+0CXy/LqXCq07ZEJI+kzH3y3xxWj
 nQViXdQ7PM5V0rBkrUbRZjm0x/dOGkdajQHyOpiwfJsteRUBBaJejEN8QBhODgwFSnHt
 C03w==
X-Gm-Message-State: ANoB5pkh7kZfpMJqgA3Zdn8U4E1tODjGWCBHWEwoP6URc6IGGmuxzfox
 Dd4QFlKNaGemTCXys85lGaunKg==
X-Google-Smtp-Source: AA0mqf4e/Cym/Pz7zBKvhY1xLXZhdwP/ObGG9vCVjg1dRXcUSRdgzQFvHu0Ftn7dlBCUsdOuexDJjw==
X-Received: by 2002:a17:90a:448a:b0:218:48f3:2e48 with SMTP id
 t10-20020a17090a448a00b0021848f32e48mr34222110pjg.36.1669285280659; 
 Thu, 24 Nov 2022 02:21:20 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d446:708:8556:dfee])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a625f81000000b005747b59fc54sm854584pfb.172.2022.11.24.02.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:21:20 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v6 2/7] platform/chrome: cros_ec_typec: Purge blocking switch
 devlinks
Date: Thu, 24 Nov 2022 18:20:51 +0800
Message-Id: <20221124102056.393220-3-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221124102056.393220-1-treapking@chromium.org>
References: <20221124102056.393220-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Prashant Malani <pmalani@chromium.org>

When using OF graph, the fw_devlink code will create links between the
individual port driver (cros-ec-typec here) and the parent device for
a Type-C switch (like mode-switch). Since the mode-switch will in turn
have the usb-c-connector (i.e the child of the port driver) as a
supplier, fw_devlink will not be able to resolve the cyclic dependency
correctly.

As a result, the mode-switch driver probe() never runs, so mode-switches
are never registered. Because of that, the port driver probe constantly
fails with -EPROBE_DEFER, because the Type-C connector class requires all
switch devices to be registered prior to port registration.

To break this deadlock and allow the mode-switch registration to occur,
purge all the usb-c-connector nodes' absent suppliers. This eliminates
the connector as a supplier for a switch and allows it to be probed.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v6:
- New in v6

 drivers/platform/chrome/cros_ec_typec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..f74e01d18ef3 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -382,6 +382,15 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		return -EINVAL;
 	}
 
+	/*
+	 * OF graph may have set up some device links with switches, since connectors have their
+	 * own compatible. Purge these to avoid a deadlock in switch probe (the switch mistakenly
+	 * assumes the connector is a supplier).
+	 */
+	if (dev->of_node)
+		device_for_each_child_node(dev, fwnode)
+			fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
-- 
2.38.1.584.g0f3c55d4c2-goog

