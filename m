Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1427666A26
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 05:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9601A10E83A;
	Thu, 12 Jan 2023 04:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1E810E863
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 04:21:26 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id h7so8736468pfq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 20:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H1TkdCYd6ACDb822V5ymCJqJsoUWZt84bjeNRJjxiCU=;
 b=jdJO71CDHt8Fc8jxM5omcbFXpLk35O/tD3XpCg8d1m2smMqB62v74cke8eZw48ZwPG
 22NL7DuFBjv0SkgEL2IMFOkU+iJ4QR+phjPOZKqJDGP8XkkfHFuZhL7jJgm8yFsgXAW5
 animO4QOKlwWfmaPFXh/tkYURQg5TaxD8tqas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H1TkdCYd6ACDb822V5ymCJqJsoUWZt84bjeNRJjxiCU=;
 b=wiZLD7I7YbMyctCyz8AilDo4kAL9HRg21VAyCfrHLGF/nb/q4K5xmR276OOyQJj1jB
 3pR6W09uth/OiNl6HgwE79vpSzi3wThGPAtIu2Z5hh/AxG8g3rZl9KsA1GctPsvomXHJ
 2wgMHQ81CxhlmOMEKglbqvyZLC3ACO6NhrJtcedVwSqozDlkTNFkotK9b2ZFR5GwHKCq
 1C9/nK6hVbMtjH7Qd1pm/MaQgsW2qpu9JRVlC++v//tUgakIK9l6XA/+yaRjb6TgI0hS
 Z7Htxurn1vLNwft+W2OzEnv9ZDYkNvPJibdnIYUyEsqje/1OTV28ZY9e1PAeWS7OSAqC
 93XQ==
X-Gm-Message-State: AFqh2kruV4tdGbWPzzVDfkoGOZGdNClxCJ4Tdqbxz+WcA+VSQaslvqxq
 E9VOwABDit9JlEX+ZlhhUdbwPA==
X-Google-Smtp-Source: AMrXdXunxxrhYRRDUDJHVwSXPtNUX4tq0z7jXhkdsSwjCxWMlm3FbrS/yJLgygcIslXcr8QNMuZ1Pw==
X-Received: by 2002:a05:6a00:2997:b0:582:1f25:5b8 with SMTP id
 cj23-20020a056a00299700b005821f2505b8mr44070232pfb.19.1673497286002; 
 Wed, 11 Jan 2023 20:21:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:594f:5484:7591:d074])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa78bc8000000b00582579cb0e0sm5519478pfd.129.2023.01.11.20.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 20:21:25 -0800 (PST)
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
Subject: [PATCH v10 2/9] platform/chrome: cros_ec_typec: Purge blocking switch
 devlinks
Date: Thu, 12 Jan 2023 12:20:57 +0800
Message-Id: <20230112042104.4107253-3-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112042104.4107253-1-treapking@chromium.org>
References: <20230112042104.4107253-1-treapking@chromium.org>
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
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Allen Chen <allen.chen@ite.com.tw>,
 Xin Ji <xji@analogixsemi.com>, Chen-Yu Tsai <wenst@chromium.org>,
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v10:
- Collected Reviewed-by and Tested-by tags

Changes in v7:
- Fix the long comment lines

Changes in v6:
- New in v6

 drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..302474a647cc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -382,6 +382,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		return -EINVAL;
 	}
 
+	/*
+	 * OF graph may have set up some device links with switches,
+	 * since connectors have their own compatible. Purge these
+	 * to avoid a deadlock in switch probe (the switch mistakenly
+	 * assumes the connector is a supplier).
+	 */
+	if (dev_of_node(dev))
+		device_for_each_child_node(dev, fwnode)
+			fw_devlink_purge_absent_suppliers(fwnode);
+
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
-- 
2.39.0.314.g84b9a713c41-goog

