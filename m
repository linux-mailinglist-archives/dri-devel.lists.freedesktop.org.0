Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151E9E6B8A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 11:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFEA10E404;
	Fri,  6 Dec 2024 10:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KrMaSz7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E1F10E404
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 10:16:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53df6322ea7so2196595e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733480205; x=1734085005; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMu0r/m4fzk4vy8ni1/jP/ytexs8H5s1m6UVlxoiIzM=;
 b=KrMaSz7uveccnL1Ii7WsTcOr2xeU8kDp7CDaJj0WfNBkJUPrHEavftak1E59fpaioa
 lJIbjsR5GaT9slNU7yx0ZdiHGaMBlXSrceFk8QhnrVGm8pwGYtaI8t2iWTq2cHlOWmzU
 aZ6qkibQN9hDn0L5C+eKzOIVXxxCPM6OECvYxQxaxUD+OP9vy0cxUmXZFu8paz+c8Z9z
 b3aDz/5Wq13NurFqtXaAOQuZ4RuCVVQx6w//TIjmcEhmDva/BHv+tY4gKCyoBjoctwHG
 RAyaiLlY0nhNvk+Q37GJ0ZcKPYbXTXrHG1eSrgcmhx8AbmhMUl59+UrqRH8LoMbXvFfW
 Joww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480205; x=1734085005;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMu0r/m4fzk4vy8ni1/jP/ytexs8H5s1m6UVlxoiIzM=;
 b=GIB6kNlvLXGh1iTAisbY6VUgSaTAOVlIYCig3kLXSVqI0zh3nKgxuf14WxewETt2Xi
 ILchQ/HAc19AmFiCWEpJdytKBGJvGdXuxTWoot9OvVDdNj2Lm5VbWFFTyfWIKU2XnwH3
 fooeIskqkc/0NQusFHtn4tuVIFueMhp5VUjJnwiPl/7Aw1RcSG9nWF3tI82E8S7fJonh
 YNUsm4+gQFNSVpe69vU/PmVHwqgRNjH2StAcZs0L4b557wkukc4NbGaTVi323gfPkSRv
 sGgQbcAn2bPj5Y7q1RZJ+jzqWvs4gyyu7RGHKjiMKuljsfH85JhE4s7KSFl1QhopRU+B
 wksw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSWJ8dmq67deylmu4cAm2iVDaSl0AYXWb7Mm4cg60aYku2vHI9zJfOzmAK6jJgtgILTFT9lNmi+wE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRVuJfKKIfOMKrF/Zpk/0e9QJe273fBhtty3iGSCjiTANKF+MF
 vC/mqLM0EwDa6YLCeG+gTCX/s+u0TnATxXCyf1HND80/txQMpKSwaJrJT3s1A8s=
X-Gm-Gg: ASbGncv6RnTWitdrHrTmIM4sTFqg6AJF/cWM8lqoU1cmFq32Ruff6bEj3kcXptK37ty
 OkZJk62whSUp3m+MMZysdBD8zf0hAFqZspAiu2Gs2mKAKiq51ycajeXGlh4XkGBoxzZ7bW6JSWT
 iwKDYTXv2Ej/Tq/qJjrkXa+8PKEpzvFSD0aOYQqz4SECmEbwUKcEYr5ZWHrWn88xe/aNsFx32fb
 R9D6mym6AuFTO2Jv5VJ6CD28bMKY6y6Ize2c4iDIfAR/nLL9jLOjp1hOQ==
X-Google-Smtp-Source: AGHT+IFoNdCoX9yAN9f6E4/wn97zmUD4xfv4UmC2Fb6ivX/IzUxT2UJ0tEJKhb3Ba6M0U4YvvS3rmw==
X-Received: by 2002:ac2:5212:0:b0:53e:2ed9:8122 with SMTP id
 2adb3069b0e04-53e2ed98271mr483370e87.22.1733480205200; 
 Fri, 06 Dec 2024 02:16:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 02:16:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 00/10] drm: add DRM HDMI Codec framework
Date: Fri, 06 Dec 2024 12:15:54 +0200
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrOUmcC/33RwW6EIBAA0F8xnEsrICie+h9NDwjDSrJii66x2
 ey/d1zTuhsTL4SBmTeBuZIBUoCB1NmVJJjCEPqIgXrJiG1NPAENDmPCc17kUuTUpY42KTi8aV0
 XqO1jBDv2ieom96rkUpcCCNZ/JfBhvtsfnxi3YcC0n3uriS2nq6qYPFAnRrGp1N6WlZKm4e/nE
 E3qX/t0Igs78X+KsZwdURypUmjw2jjnNewo8UjpI0ogZZk03lkjq6rYUcUDxfkRVSDVFE5pp0A
 0Tu8ouVH8+IFyoaRgCiruFTNP1G2dSYLvC455XAezTbnOnjpsKpwd7S4jzLQyQhshAZeqxn9Hs
 DEDYG7XhbHOlrouDPbtb0MjzCN2vv0C/vUs5GgCAAA=
X-Change-ID: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7229;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=X9kaSDtRP1MgSeYirvVG+XyehxBCw+87eheLybmqpYo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8IyVydnpBlAcAHh/cXorjU91qWaV7pIsj38
 2HxLjH62cyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCAAKCRCLPIo+Aiko
 1VNVB/98WtyAUjEWVIPrfqZFogwDMChB2E3F91aMuAO5L1y25H5WYJcPWv69B5Xc2pV2tb5JX5W
 VjbizeqJ4/CraKCMUGpGUGJ8O+JaYQ+ZzZQjogS4f/irTluKP5JH0gOKfBg5yTVJ6R9W0XLpUNP
 oUN6rEmaLqKEiNbRo040BvPDi+1wYFwg10PnBdzRXDF/Q91Uxh9wokseT7SouqP36U9jIQwTFpL
 98w14nh5sW5flZ/suxJZkpFUvHHXOp0wpbk6WiVtsdL9RJFXPRrqqpO7bbTfT3idPOtTEIg3PHs
 UCznbLm0RFr43E4gqaM7+j9yZv1QHF6kvjzzpiuc6U6qK1cY
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

While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
framework, I stumbled upon an issue while handling the Audio InfoFrames.
The HDMI codec callbacks weren't receiving the drm_atomic_state, so
there was no simple way to get the drm_connector that stayed at the end
of the bridge chain. At the same point the drm_hdmi_connector functions
expected to get drm_connector instance.

While looking for a way to solve the issue, I stumbled upon several
deficiencies in existing hdmi_codec_ops implementations. Only few of the
implementations were able to handle codec's 'plugged' callback. One
third of the drivers didn't implement the get_eld() callback.

Most of the issues can be solved if drm_connector handles
hdmi-audio-codec on its own, delegating functionality to the actual
implementation, be it a driver that implements drm_connector or
drm_bridge.

Implement such high-level framework, adding proper support for Audio
InfoFrame generation to the LT9611 driver.

Several design decisions to be kept in mind:

- drm_connector_hdmi_codec is kept as simple as possible. It implements
  generic functionality (ELD, hotplug, registration).

- drm_hdmi_connector sets up HDMI codec device if the connector
  is setup correspondingly (either I2S or S/PDIF is marked as
  supported).

- drm_bridge_connector provides a way to link HDMI audio codec
  funcionality in the drm_bridge with the drm_connector_hdmi_codec
  framework.

- It might be worth reverting the no_i2s_capture / no_spdif_capture
  bits. Only TDA889x driver sets them, while it's safe to assume that
  most of HDMI / DP devices do not support ARC / capture. I think the
  drivers should opt-in capture support rather than having to opt-out of
  it.

This series depends on the ELD mutex series [1]

[1] https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Dropped extra checks on the EDID (Jani)
- Reworked drmm_connector_hdmi_init(), splitting the codec init to a
  separate optional function rather than passing arguments through
  drm_connector (Maxime)
- Reworked EDID update functions (Maxime, Jani)
- No longer refresh the EDID in vc4_hdmi_connector_get_modes(), it is
  redundant as vc4_hdmi_connector_detect_cxtx() already does that.
- Link to v5: https://lore.kernel.org/r/20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org

Changes in v5:
- Moved prototypes from drm_internal.h to
  drm_connector_hdmi_codec_internal.h (Jani)
- Rebased on top of ELD mutex series, resolving the long-standing FIXME
- Converted the VC4 driver (compile-tested only)
- Link to v4: https://lore.kernel.org/r/20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org

Changes in v4:
- Added forward declaration of struct drm_edid (LKP)
- Fixed kerneldoc for drm_atomic_helper_connector_hdmi_update_edid().
- Link to v3: https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org

Changes in v3:
- Dropped RFC status
- Fixed drm_connector_hdmi_codec_init() kerneldoc (LKP)
- Dropped double underscore prefix from
  __drm_atomic_helper_connector_hdmi_update_edid() (Jani)
- Moved drm_edid_free() from
  drm_atomic_helper_connector_hdmi_update_edid() to the caller's side
  (Jani)
- Link to v2: https://lore.kernel.org/r/20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org

Changes in v2:
- Use drm_atomic_get_old_connector_for_encoder in atomic_disable() to
  prevent it from crashing
- Reworked HDMI codec init/exit, removing drmm_ calls (Maxime)
- Drafted the helper to be called from .detect_ctx() that performs HDMI
  Connector maintenance duties (Maxime)
- Moved no_capture_mute to struct hdmi_codec_pdata
- Link to v1: https://lore.kernel.org/r/20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org

---
Dmitry Baryshkov (10):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug_edid()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 127 +++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  61 +++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 185 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  98 ++---------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   8 +
 include/drm/drm_bridge.h                           |  38 +++++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 25 files changed, 610 insertions(+), 206 deletions(-)
---
base-commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
prerequisite-change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38:v2
prerequisite-patch-id: 8373a0638371955d1a695a6253a5429c5c79ee05
prerequisite-patch-id: cd898cf6d758d05fda796b0ab685ed53d7ccd72e
prerequisite-patch-id: 92115dfe744bb79f3ef0a10fc1fb3c8ef22f3bda
prerequisite-patch-id: cc8334b2d881be3418f1d4d2fdea8b05776fdb73
prerequisite-patch-id: 8c6c14a1dc11e4b70ea67b25dc3d2f6ef3234160
prerequisite-patch-id: e0dbd26699df8fcde52a46a66e4ab4dc705b2c2d
prerequisite-patch-id: c6ca8b52338034569c09e35061d34b277a876253
prerequisite-patch-id: 32bdfe82c8f8573fc9132395520bf6ed949b8915
prerequisite-patch-id: 865b400514c2207990c07d9f789c05e414d19fd6
prerequisite-patch-id: 0e05e8ce53477acfc686620b9e212763ad3058aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

