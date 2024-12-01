Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2479DF441
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 01:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EC610E5F0;
	Sun,  1 Dec 2024 00:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="O1gQaRem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BA010E5F0
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 00:44:43 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5d0cfb9fecaso1017590a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733013882; x=1733618682; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
 b=O1gQaRemvUPPC+81K8jHl0ep/3ZJ+Ay+JmQ9I+XGMquwlIf66Mgyjbzezi8JYLW/WU
 FUrwGwWArZqpwPC5/BzjWrNBgxYilxwLkAf7y5L5+vve4Oa8zsoSxXi6MdvT9yvL4i+O
 z9Qvb6y8QJBorpf5xR4BSBdJCl6klTjtqcQD+9hn2ZtCZj/gFuQ8LRS5wqObUmztVUa/
 9GAXX3wVWfAObGPsK+06R7hv0SKZjHDJP4FK9wYrKRQMIl7sYO5XZZj2Ic9VZ7NaykXm
 yy/LpVNCaW367zV6+3VwlCC9CRzQOL8iDR3KrrREFoHYd79od4uSGBkOrI3r4fZqeJGB
 Ez7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733013882; x=1733618682;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YDP6TwU0/tWdPmghJyb5pX8fLQAMwFaK6bFPGzZBnzs=;
 b=hgmKx4gbvZd6gExxdz8yKC+vWiR2VxAbo6xc3IfRFlPeHU6VhN+p6xF8WEqmf0SAtn
 Jq3yJQl5hEPT2d8nR3AeJY6oUIPXpjYqRvF4GDw7z9f5079jcVEHjnTpSN0jVBtcgtkz
 Qp7W8RjQ7VPTuKaoHDn6QLs7WWAiGAjHrrIXi9FO2U5qszQhHuTPbmNa6SI9W596oCa0
 BRTyM7qohOUAxE2Cbk7fdgr93oVhGIycVzqX5EOGEB+2lat/YhJ4laNaXWH7b/aZZx3l
 xvsBZx+Ax88AdTSLBsiEktOBDMdnF2DVWNuj8TUWI/aZGOqGiUyIwas78qTDuUwkXEFR
 1J3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9WRLvVrVXCJKYwDG+L+h/fIHB4ZXndO5rQZIeU2TI/+x+tbSQQ32IlJj0Hdqk3XJbBLK0DMkt5Q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylHldwbmUhTm72IF5TmLTi+qWHfI7qG5vZGO+O8LoNgKlQpB+t
 FJFm8XmaaTvWMUFHp8x3u+oSAx/P2mag5U/43TOpfQypDTVsSkGAnC0pKFbxyNo=
X-Gm-Gg: ASbGnct0y0tnLuiFyxmJte6t/UFY2cfUNsCIWYzz+oqeBufrND1sIzCnv1W/uQWthqo
 FYjLp4ttUwLUf46Vg/UZeHV+Azzq4cyaCK1apwiV3GEwU+7R4a9lS/7kQGyHt82sLaGHUvxaDPD
 A6Zft30FUaygdShrMXIdMQiLbYMkNGz/BUuz9ywMkcfrBzv2LhzYNcZrFieFczCu5epLY47SlIm
 nu2Y17jUVj5UOs8t3t1T5qGIcf+NM6nRg76CPlc3oAW7AAIxKhnNEpVyA==
X-Google-Smtp-Source: AGHT+IE5Iodta2UQP6qjtd0G2oZywxiR+z/FGF+U8cJWDKR8GZEI1K1wlfh9Q8JImD1VouVwulpc4Q==
X-Received: by 2002:a05:6402:26cf:b0:5d0:8f25:24ff with SMTP id
 4fb4d7f45d1cf-5d08f252625mr12479352a12.14.1733013882366; 
 Sat, 30 Nov 2024 16:44:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 16:44:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 02:44:13 +0200
Subject: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1798;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m9cAK5FN1NFJb6UQkn9k+gemX+2/diBeTweGL7F7R7w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS7FZMmMFV20DgQUuh8v5FF4nWRo8BcSipooZa
 EIAyUUoJziJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0uxWQAKCRCLPIo+Aiko
 1dDwB/wJfW4xZABPDcU/eL/SukBx0cSr5TyqsC+NOU/8rIY3SPpHoNzt2tfD+tYhv2vKAqVGaT+
 Y0Pd3xmibwzv12VUOjFt+1ZbNthzF8qyG6keOs747UGZJQ69PhRds6t4Rw0KD2DFD1qgLnoX/w3
 NmWud73M/PrrwTQ2hUm3HuLVNhUfXRhEp/60uu1faJkCzG0RKUK8ibOREThgoBWt/fKvWDG+Ohf
 Vsyc20q84GR6TrucJQRzobBfpKYBr77Vpb3pn0XZ9hGN3YwhCtLPDipCwnoXnmPkM17bSL8dJW4
 kP1LucL4uQp1AahjZxJZFLIhzCNDNlresD4ccZFTjoNzadBW
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c37a00777f11da8301bc1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 	 */
 
 	if (status == connector_status_disconnected) {
+		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
 		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
 		return;
 	}
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
 
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
@@ -487,7 +490,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 	 */
 
 	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
+	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
+	// CEC support
+	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 	if (!drm_edid)

-- 
2.39.5

