Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B641C9F3EF0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 01:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0315110E800;
	Tue, 17 Dec 2024 00:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nASsG7a7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483B410E7FE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 00:40:55 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso295491e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734396053; x=1735000853; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
 b=nASsG7a7jAnlDEEHDLqNTfhZ1qI8RCPeoFS1YXL3w9Pavgsj72n8GO79JbX8hZ2PUI
 HFuRM4/pZJ+Rx4V769rT16op3rJeyfPqdnj9COJ4yYj7WlgTkuLSCBEdTHZRGXdxvPTT
 qLhlHBZMyWSp6CGHSMv4rWO3RwNui7PCT9MnebCzjJ2XYduAQnyuesdCtL93hc819UIm
 sxli7W9yKwaAt2FZx9/M8LClknJvAo0rijeeMnYTe56tXhTVNcpMx+GfHDHejQeJCzzg
 6q3uirri+C2UbHy9LSzOLFLoLcyy0dUtjlhiAxESKhaB0LC3KO6qyNzYRA/rCHUDDSqs
 flEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734396053; x=1735000853;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
 b=lABfrlZQf8T+kNK9Eai3z+N12TNW0wTKGJCTnuPfv//G+G2CLb7Piejw19+p1/79sC
 rnqRrR5plU8V82BUg1h8hyISc0gDdAhHXh0KEyurtuCoDBYIPnSpSBI9A+f4+WC1l3h1
 8FqPk8yszuBEI+LJhOiKGFVKjLAh/NjECaWrEGr90RiU1tgQNB7A3jyBjNFFBX3rP1Aq
 Cbf8FmEXiSTsGhyD4M98YldxMxicM6nGSmr5ovH9jpFtHe5gZFohVNijoJYSEjh2C6YB
 WzG0EUr8ssR/uCDXnuzK8POMlXxq8v4Q0pnpqPzOAj/GTCnnFQXtlpXSO9CcymtbCDAd
 3xXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnGk5liwZkyGyD6vTS0N3SFvpNXy8qIvtF5xnS3NH+zLR8TWExQmjH6zUHBunj+TO9jZpUjaGssfw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4y2EMP8k5KHImltjL9d4OFkHxKrZMZM95RSvjuQAaxkzLMR04
 O44BRR1es0e6miomj+Fp8/0z/Co6OhegtScrdqnxW1sF4YoIk9pz0VuQTLlAdkk=
X-Gm-Gg: ASbGnctcQqPR9J/MWr8XNNSTXhCLt77sbFsNZJkUjdBWfb2QMtx+dcsabvFv7ndDvo/
 pTObWNZar21B1IDBgpnMHkWyp8JlU3EKXlJWZIXAePpKaO5orgsrY6G2rlXa4Qlva5PEYnrDnWf
 OIyvCA4j4SSJgbwSho4QLgsdOIjlslZjfnmM0yGp8NBvKytIryFBVWC3vHJyNnobncLXbmfGhgJ
 eevKWmHgxV1GE93o8Ug24jH68GM7Vs80MnXAm29XacR3uykt4UI7Keu46jmBIW2
X-Google-Smtp-Source: AGHT+IGe0QdLZY73JsApHksPxAww/oxjVlJdjygOnTwbgrdsohY4NxxLR2cwt2MC32di//BAmFafkQ==
X-Received: by 2002:a05:6512:b06:b0:540:17ac:b371 with SMTP id
 2adb3069b0e04-54099b6ecdcmr4290758e87.56.1734396053589; 
 Mon, 16 Dec 2024 16:40:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 16:40:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:32 +0200
Subject: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh66KurD/so/4BhoqlDVPuK2xAohhbIWN/EG
 x67827EyE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIegAKCRCLPIo+Aiko
 1ZsiCACZHuxK0m8L9MH1NhE2yPwWUTbzhXV2jMuyyQcJBcJKvwYMEAdKnau9ASgbjUyjrS0EqxK
 PG9HYh7v6OQuoktgWtwxcZgo8DyLPYPsH3ep2lhRl3cz3v19tta06Uegl+D5MxWNoOployl5pF4
 LYT81VevjzV55DOYBg/jYXMGpIZF+9d3Umz+KLMKQZ5DXC85lct2mD6XBUBijzLjKir8Yn92L2b
 o6p48mzqad3L+E2Mxe5QGYoLg5IvVV+ouFScCpgfmP28rZL9PzfgkdmP0ahbxw/xtzK1kfWSxSI
 2DH1/dpfUzApuoHsTjp/y0HbjKkiH/BbrYduZ4L2RBFNDDAi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb5e8738845c74d975c1e0e1262ced46e4ef8fde..328a845ce0c4168b5463d344b3ad1f77a5437cff 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

