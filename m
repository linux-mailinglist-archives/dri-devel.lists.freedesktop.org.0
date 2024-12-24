Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FA9FB867
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 02:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093C910E277;
	Tue, 24 Dec 2024 01:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="geXdWK48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788B810E277
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 01:49:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso5186127e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 17:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735004881; x=1735609681; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qU0qnIcIkR7dj/3kD7afUUVjsxQA9ajwBHtPtEwMtwM=;
 b=geXdWK483LbV7fjJcOPIn+ykqx53KXS6gr8yDUGfDGVTzJlEmVpe/C0dTJqi0+pU5h
 +Zs+TjP2Z0HUnQnpUctq0et2jE7nrhUIw9gnPOVSy7LGeCg2diSw5uIXnLScJe4Uw6MU
 GPzvpQOIMEHa5GJcaRTcYMsjwh80lVORd+kH6ufGQRcHiAbStq6gkrOEMdLkV65fgA0E
 XH+uzt1FrwYlwW3fNKkgqgkjbKbBsOtQ8Fyd14JzuNzqdVLqFuuxg3G4qrUgLW+IBI/N
 rqWzRV3TWohSpNp0ASjdtFeKwsxP6x50yQ6Partm/wT//J8TrKEzUQ7vlVga9X+iD94q
 qYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735004881; x=1735609681;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qU0qnIcIkR7dj/3kD7afUUVjsxQA9ajwBHtPtEwMtwM=;
 b=QSvyl7vmmNnkGPzNMVBv4rm/mdS72+otpk4OPh7VZMf4ixOpGVU7HFVKRAM4lRBkJF
 JODc+32s9MtjTvkDSk91ssAwCVpQwYJtBhSFW5mWrFFW3kVN831v4YMa5PPOTQeQHCJN
 vQPyK1XTt2Zy2hF9hK+ho57mo7aYhliLDVmV2GLHVfbXANSkkCmrUXRB5Sp0qS6W5Li1
 mmBRMw5MZ1v/J0oRJjxXgEGqYUQjIBslzFgpue7YndimDp8xwLseYUY5YHuK6gOxkisO
 Bp5RTEGr7HmWoKuh3BGozps6wpfdCN+1mj0mEM6HyUn4MVN+IyJe032AzGpVqAaymd69
 LB3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNpiNre99Gex5n3DfzTQNtOIuR6SbhmLmnadr6LGwxWZxAHvLQPxKHwNaoN3y++py8nYvaki9J5yU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1H+0TJE1+HpyBHxm8TzbyHpCnROVn6DsNIa9NanktRpWjrOHF
 BT3OWK4/h7taehsLv7Au3tQg9HvKd4FzQRwcfO+P1gislfWVAhJ7TpK/t+Hki48=
X-Gm-Gg: ASbGncsvc/maBrm9o6Hd/xF+Qq8+5XGofZiUhalHuCvw2TkmJIe0mXKRn93noyx2DrE
 VbhjXDMLqCANTzxfQTIdYLT8ILIOJ8c4mB9ljSir0hni5qNCFXGS+r1x7NEO04SAVZycOE/Ra2U
 0ZDizAIjWA3NJYCPMrERi6tZxt3PdW2yrnZfYqixL7lxP446duOBb0UCh5NOggjOWhAk7gfcwUy
 VZJ+zb0pjVXSPbsC092eyQ1Rnd9XJc9QU4DqXxF6wXZDSpgVYLq1klVUxWz+fZO
X-Google-Smtp-Source: AGHT+IHuyQh2BUXQhwG9fpuqLgl4F91XKGr1wGSBYyzdxhmmzfsQu5ejyZAvzjxiBq83VzqUskBGGw==
X-Received: by 2002:ac2:4c48:0:b0:540:20b0:da2f with SMTP id
 2adb3069b0e04-5422956c0a8mr4482466e87.55.1735004880777; 
 Mon, 23 Dec 2024 17:48:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 17:47:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v10 00/10] drm: add DRM HDMI Codec framework
Date: Tue, 24 Dec 2024 03:47:52 +0200
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgSamcC/33TzU7DMAwA4FeZcqaQnyatd+I9EIf8OFsk2kJaq
 qFp7467CiiqlFvsxJ+VyLmyEXPCkR0PV5ZxTmMaegoEfzgwf7b9CasUKMEklzXXilchd5XLKdD
 OOXSp8kPfo5+GXIHj0TRSQ6OQUf17xpgud/zlleJzGunY173XLJbsqhqhC+osKmqqIfqmNdo6+
 fyWepuHxyGf2MLO8pcSgosSJYlqFGAEG0IE3FFqS0GJUkR5oW0M3uq2rXdUvaGkLFE1Ua4OBoJ
 B5QLsKP1HyfIF9UJpJQy2Mhphd5TZUqZEGaI0D17U2oLnZkc1G0o0JapZ3spBiNIZq4XeUe2Gk
 qURm1uipAIIzqIE4DsKtpQqUUCU8SiM8xhc6/5Rt3V+M3580p+Y1iFmzo5IRNel6XhY6C6N/ul
 nUfV4maj09g3pG0UOVgMAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4LTeSs50C2WJ4ARGkK6H5mYa0q5kVIxYu7UmLLfaBaA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLMxQMTXQRiB17Z7g4FirxL4CVH11OFVc7Jy
 9mXzwy/acOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzAAKCRCLPIo+Aiko
 1XB/B/9f5VZ7CS/KKbdKaH3Z9CJwy80SUzTZZLDgLfAx3SQyYLwt5hmgTUW40F4/UW1aiebwUU3
 bHKlvw8ya64lnYpy71sACEwy4AcIGXhppL94rEK/tQU2YS9+9PPieFpFRar194CQ6V7G4GAyptl
 fPuMPQF8m7dJGPYfr/rb+2yosJxwv48eMY8Br3bJOMcxczbUgjcEDtYHMH8b8OHGhKR+q1nrXdX
 gUUnzjJqAZhNugILCCxJADp5+o943BaU2oaylZk8zNca/yzpYxjG6HDqc2IqZfNvA3tztmeSFDA
 j0yGYepRuU5pwS2WF+mFgSR5HVEArhvLISZhAFLJz/JYcavs
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v10:
- Move HDMI Audio functions to a separate header.
- Link to v9: https://lore.kernel.org/r/20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org

Changes in v9:
- Fix a part of the hdmi_audio rename sneaking into the
  drm_bridge_connector patch.
- Move HDMI Audio implementation into drm_display_helper so that it
  doesn't get compiled for driver which do not require it.
- Link to v8: https://lore.kernel.org/r/20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org

Changes in v8:
- Mass rename hdmi_codec -> hdmi_audio, drop redundant audio_ prefixes
  from several callbacks (Maxime)
- Fix the commit message to stop mentioning
  drm_atomic_helper_connector_hdmi_update_edid() (Maxime)
- Link to v7: https://lore.kernel.org/r/20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org

Changes in v7:
- Renamed drm_connector_hdmi_codec_init() to
  drm_connector_hdmi_audio_init() (Maxime)
- Added extra empty line in struct drm_connector_hdmi_codec_funcs
  (Maxime)
- Dropped if/else from drm_bridge_connector_audio_startup() (Maxime)
- Added optional .read_edid() callback and reworked
  drm_atomic_helper_connector_hdmi_hotplug() to use that callback
  instead of having an internal function which accepts EDID (Maxime)
- Made VC4 and drm_bridge_connector use .force() in addition to
  .detect() and .detect_ctx().
- Moved HDMI codec functions out of struct drm_connector_hdmi_funcs.
  Assign them from drm_connector_hdmi_audio_init().
- Documented struct drm_connector_hdmi_codec and its fields.
- Link to v6: https://lore.kernel.org/r/20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org

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
      drm/connector: implement generic HDMI audio helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement hotplug functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_hotplug()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: stop rereading EDID in get_modes()
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_hotplug()

 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 169 ++++++++----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/Kconfig                    |   8 +
 drivers/gpu/drm/display/Makefile                   |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 138 ++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c    | 190 +++++++++++++++++++++
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  57 +++++++
 drivers/gpu/drm/drm_connector.c                    |   5 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/Kconfig                        |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                     | 104 +++--------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_audio_helper.h        |  22 +++
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  74 ++++++++
 include/drm/drm_connector.h                        | 132 ++++++++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 28 files changed, 743 insertions(+), 208 deletions(-)
---
base-commit: 9d2616754ce7e16a9e73ab6c00efc27fe47cb943
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

