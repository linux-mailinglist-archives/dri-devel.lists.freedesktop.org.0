Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418229E6B98
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD10D10F0A3;
	Fri,  6 Dec 2024 10:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SzbEAJ+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4935C10F0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:17:09 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e152731d0so2632621e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480227; x=1734085027; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
 b=SzbEAJ+cu+SLrcoKzQgQMUBoB0depn4JyviVc7x6lSH6pVFDXk6Eg+//xk0+dzbPw1
 Nj3YAhQQ0zmJRbqt9nUI+CnOfbCce/ZotxfJI1dDU/VxrIqFhjWiLcgCTOlcSXJOmX+Z
 4EQIJ+Yv/Rfx7A2jifFwuWInZ+rySmqt9OfBFku32RyqQsPBoFUTfO2BtHT4I9p2tjUs
 5Qjto+33dS5/8diB3D7spVSldk2V2jEA51g34/vXTf++XiwwBrP7Pr3QfZj2mrGNPK1v
 JYhaTqDzBlaziJ5l/SlNNEJ9jGV6sr/9VywoAXABw5F1Y1jAz7Fr/yCs8VHOl6+krbrW
 d8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480227; x=1734085027;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
 b=W+eLrOAeg/cDekCL3P7R+GIfISWd5zJr2IkzapdPFqBnJvsrBCF7wIiKOpkIBs4uqW
 v3c3SmK2UwBQ9Z94CGZsRY8JjZgqJ+uXxrIiBCKTVXEVpvC4gSbeUPh0NwJHU06zubQn
 qM3eYDZjhdYO81foUonxCUb72eynUyn0esKHvvZzpD7KOgHi2OKz/bB2yRj1a7+Cnm66
 BLJj+GNLbV157GcgaFeS2QNeWymeSjdGYRbfk1FuvYm1IUB/1bjTjBo4cn5s7vAtTO3m
 qQqDyqyEQq8S4q4WCc69LaTlcqGtegDGPVCF0Bs1uPYJJ5rqgdcQMz9ed0OqNbjRKZx8
 pLOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/5o45YDKlU305ljzz7vHlX1uzgmkLplOIKyDAiQgeF/AcshLZGqTqnhvn3DsByYCA/LFWtqoxQXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNJQ6Bvb4semQQefLaUoy2yg7oCPEbxbnCIDBHwezpyC9pUqDN
 avaFyA7eCc4kCuGaSsIHeg/EiEaL2Dho3Z8DbTAU7zcbVAsqdk8E7aS52khAazM=
X-Gm-Gg: ASbGncvL6IZWx38Ukbk+OxAEpTLpsLk4Mw2kW3nyeW7/7Ya3xEQH2t+Yb/RbiKZp9Sy
 EU46E4GTbFOCcjabbXyyT91Ijf3OxcMzvilC9wwujILlWuETV7qDXhKfS+xMb+JhOjFel9bMWgn
 tO7llNmZd+fGGnJrEhDKhAYULgyuW6Eaa4y8jxmsjP5MpmuiU8eOjDHLM77QDCHazrvYFg3jKD8
 gYNNE8rMqOaiuin6TssM9OTDN36sMd8CKqppC4rxSWSC6KJW/qXwWCfvQ==
X-Google-Smtp-Source: AGHT+IG0QcicheINkpKVEV+N7iY9KUPWDy1N6KSKw3gesi4tsLvAixCI3qsFKZ6xn3HsNze5iUigBQ==
X-Received: by 2002:a05:6512:a92:b0:53e:335e:774c with SMTP id
 2adb3069b0e04-53e335e7ba2mr484774e87.4.1733480227384; 
 Fri, 06 Dec 2024 02:17:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:04 +0200
Subject: [PATCH v6 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-10-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7txoET57jmm2MW5aKrjVDlHM8PA3Hnz9H/pYu/wP770=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K5vHn00gwDj19cHn3nMju2ruWputUg2V4s
 rnN4SzdgMGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1RVxB/9ibECV3IDeNQwRoXBtxBfb5q/3fQOiAqYySeNrd22PjQ76DgDyRwsiItUPMPc5OBiBz7R
 KSQ40mwZyXC2r5WzaKmY4gs1aaAPiwRIy/TMksz2RGvCApkg4Hd8RszaQi+oq6e9ZLtPrCaUdeo
 Jh4fAV9j95blixfhq/8PiFnIopXyYOGqUrL9GnlglKBRAS/27u0MRm3ay1l/GbNb+sg9tEOmo4D
 TZAS0Fi9bgzcOqAy5fbB10xB4BGALGKhX9Se5PnEl1aK+rp+EAbfkeKXHZ+QBunTMGd2ByF85Gl
 W+VlY+DypXhupcZsmPnLbRDQPG9h1x7PPZr+p5kNFuOmenmE
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3364ef90968dad3074800f02926300ffceb75c69..3fe025251f939290bb4430e2f5163b6549479fc0 100644
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

-- 
2.39.5

