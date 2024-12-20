Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7239F9A26
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B8F10F041;
	Fri, 20 Dec 2024 19:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gYwt+qsB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC5710F039
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:17:28 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54026562221so2176683e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734722246; x=1735327046; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
 b=gYwt+qsBMkbTh6r1M1NuTcpVeoSeCoA/uzRXOx5nna9UbyhOYNQC5B1AD0iS7Ke7AA
 CXWJblCj54BrkdELbX5lTF6vUY+L6K01BWIsEjWE2jbSIKbbUew9aKCyUoe06Bhjrb6b
 Xs8vRg39UAx4GnG8yTX45cw4rFlXnVQVFlRdkgBwMMSrwYUdx5obFguqsj+uh0z8Oyln
 KvXnullHN51cblM8PMcW4HwVYfo+KSZq2fFzFrOFj224I4X+VtZBQ02sHSqmzGD9/T06
 OnT/1ONVBM7PYlTzu9PpFe8wVlaHA7M4atyVx76jkgk+k2uQKe/4ImYHzauL/OHzz3kD
 12Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722246; x=1735327046;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
 b=jNcLPhdK5Gbpk9aCuS958s9TGGhKAzdd4vuhxzRynU7YiJah6bc6d8mNT248ggTtZg
 SQMYClXw6+XC+h/dLcTXf4OHooKktKRR3tt3R0knYBOEV0ho3SKzPlR6J4wyb+z36WMp
 oloLciaINg1exxRTvcH7YT4/Dcm7CSsp9Y8h0oZBeD02ACgBzsNL3Pj4MowRylVgSXfE
 J0RJLq63I+qDdL5Nrm5s0e2wTQNTgtER3v3J9nnXY/4P/SF5fZJnwMdWm4FwCUUsYHB+
 FhxVmfsquursfO2ltEnl2U1LpysS8pYQ/IjW5J0aWZhml7zUwr+ZQBkeAVGUh3VPMNEC
 Hhcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKFa++sUaCOClpX0Sr7K1+TocJvdJDYidPkelqeLnc7JyY/bPkEuM3ySeVD8ZQVajL3/pHEd3VzWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy40BL5v0qChFyHdui/nJdeEap52w290UczQnvsKR+S3n+5hRJY
 GW7adQZlqzbsgbrkvKzWo0GJI6wzY6A9O+DNwNkkbrZ/RlEXLCfdp1UXpwee6GQ=
X-Gm-Gg: ASbGncsSJQanpA04AssMpEpfHivOFnoEMLpYBC+Kb4MPv6t9o5eIU3eKiipDj8sxy20
 6PEuotnAn4o/I06PTDr06Mg/Qm8jyBYbQL0pXKP4zK0Y0LzePPtdU2IOblDxKo+w/IFtEL1DCGX
 itT9T6yUmK4pzUPfllXZPK7/5/rHJyF3xbi4pJOtieVCTY9ef8H9fbWvozWcV85ml5R3kyrKb5d
 AZ6R7Nxl4mv1Xqbz3X2jM1Qz95lZJ2hMZ2tyriXvdrBgTPU0ZIeLKIZR5BVvlbL
X-Google-Smtp-Source: AGHT+IG6IFV0Usn+06DX+/zaMrThIrt7paHBBkdwNJGqDNn/1W/onv1N2MVoOyFetqejTIcJnFPd6A==
X-Received: by 2002:a05:6512:398d:b0:542:23a9:bd44 with SMTP id
 2adb3069b0e04-5422952e712mr1506321e87.17.1734722246359; 
 Fri, 20 Dec 2024 11:17:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:17:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:06 +0200
Subject: [PATCH v8 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-9-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rqofWGWfG2miK9Nk/kt60LsekVXBu+uC1vw6n5PZ3JJ
 /mC567uZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE7E6y/w9W9tSe7sVjbvzR
 8FBbRt5itZZTS70/l66Un94pOkuWwdH5lK71svhJ7IVTW8v/1E+7um8Oq/SHghieD8s8E36nX22
 dYGtvPbPjkG758bt7Azk9c/X7bd+um6nE2PPeUjfWRN2Gr2P7Ce30e0Wr4+6KWfuXijlJxD0qzG
 gT5extinq5dKNmBvuX+iVXf9esOtz1siHufcyqFG19p2yZy68X5z4IvpRutuFxufLa2D/85/sCA
 7/nH2SZf2G25Ulhz2zR7KP7F0Y3i/VcX1Jt2vEozPjs6pcbPiy4kXkuZvpnPaknzj3r2nPNcl0t
 rX6qH1qxql3BNHpX5armvlVFP34LG4pxvVDZeeS+x+2ZAA==
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

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5

