Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861AC9DF433
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 01:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF5310E1AA;
	Sun,  1 Dec 2024 00:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UPEfCPum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BD610E1AA
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 00:44:14 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5ced377447bso4891046a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 16:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733013853; x=1733618653; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bLfwy2pke4XTvAUxzsdVG/G0ejwCOogS8lWE9RCMk+E=;
 b=UPEfCPumT2pLnb+5AqjtizED0e0hE7kqdStQo0+B0bo7CUOh2fCTPJArSn/SDU/N1i
 jv9MgWezSScqkDYViuFtg1Ls7thaw9HgFtjSdXpRWrLTIc2iDui/Wcc9j9tCzkeq7AC1
 R5+ftmQFtcDAT0AqK+gommRjjfQzXQFcdDgstth13veTzOxygOKsJgWWDQSd5Z2dkzCC
 rujua6hw3l4le1CZ4BHR1FsoisFv4MwEYFVsKY9QEAPW4bn4ghZL+4OuGFTsh3e4aroR
 /faw695cPdeufIgp4k2WgINENyzQfjaQbuLdp9pgv7mY7SOk2Fsd2lRXCF5gDYm6IKQ/
 wVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733013853; x=1733618653;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bLfwy2pke4XTvAUxzsdVG/G0ejwCOogS8lWE9RCMk+E=;
 b=N+3qo89k1BGyoFp0A1yACAef3JvAGHdg4AJLJHrI2TmKJkGzoqB9/3ltEI8rxFtDBv
 l5Dg/SoRcz5IBW2rrcnpOD1Zr2S/xEzhXk0sM7XoV5qd4BeVifGVu9oWhxx4hRiWZPoh
 53pXkOopGfS/63T7OdhqOxxvVCecwLuYwe2k/18CrC/KDaNFI5+uOAw0x4izRdox6hrP
 qibPTZRDtN5gcuxUuHBpA7feEzSySWXTgDPxXgIwB9jwo47cmTTbXOsUy9VLCILrrur8
 jPeRoQxMkK5VydZzzukuxpMiJvMKAu7G9apH/I3V/3OljrysiEWIo/5fGxXImVEYpt3j
 20iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsv2/4TKj3Et21ELseWjvTIucrOqchbnD60PnOQ7+onvPapQzZ8lT9UCvscxGgB/SeqM88sl3FXxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMfBAdq39/IZlPxMioiLtmUU+PFfebVM6j818PoUo3hkkzUgng
 ZGjElfLhrIux/gdqgSfdBysRpsnCiHtkY/Wi+jPxW1s0zpv/boHqZ4qEIOkdlqc=
X-Gm-Gg: ASbGncsddiU9jhbXLVb6h1SJqoyokGH1V2GLI4ZC4kDVOXrrkGV4zMzhMsVNWQ13ek8
 02610x97inhlPQAeEDDgz7we4Xez5HEcuw0VFdf0Y8DGpEeN9rBN8zsqRhbL8Z5UrFyoY70mgUe
 IzKq1WT6rTIrg3MdT+OuK0a8ZadnYVbDNFAunohz38y9Y6qLsSaeGG6QCTHFD/fNEcW6M9uUYRB
 EIeKfAS/fDyqErrtQ1r1s372bV68S7JB8tDrlRZzdrG42NE7z0iFWTgPg==
X-Google-Smtp-Source: AGHT+IEu4F0TFelNVEBfHWWhzqfA+DLi1GrEozrSsprcpjL43c6TbTWYnoKquDt0hHEzV8IotmoD3w==
X-Received: by 2002:a05:6402:40c6:b0:5d0:bd2a:fc18 with SMTP id
 4fb4d7f45d1cf-5d0bd2afeb5mr9478543a12.30.1733013852756; 
 Sat, 30 Nov 2024 16:44:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8d817sm3400359a12.63.2024.11.30.16.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 16:44:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/9] drm: add DRM HDMI Codec framework
Date: Sun, 01 Dec 2024 02:44:04 +0200
Message-Id: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFWxS2cC/33RzW7DIAwA4FeJOI8tQEhCTnuPaQd+TIvUkA3SK
 FPVd5+TbGunSrkgDOazsC8kQwqQSVdcSIIp5DBEDORTQexRxwPQ4DAmvORVKUVJXeqpScHhzdH
 1gdohRrDjkKgypa8bLlUjgOD7jwQ+zKv99o7xMWRM+1pLTWw53dSayR11YhSLSuVt09ZSG/56C
 lGn4XlIB7KwE/+jGCvZHsWRaoQCr7RzXsEDJe4ptUcJpCyT2jurZdtWD1R1R3G+R1VImcrVytU
 gjFP/qOvWyASfZ5zNuHXzNpquWCvwn3/fVDg52p9HmGmrhdJCAi5th31H0OgMmNv3YeyK5V0fs
 n353dAI84iVr9+Exr26HQIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6725;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AHJLfILBivXbGoQWKwnlp0Iq/I7bTNKthvskgsr631s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7r3xnDPkINWrxU+/z7Efjyrum37FQmeXcm9OZ+qrKz6T
 M27j07vZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEbj9g/8NttE3p74VSm/qW
 hf3rVbLrPxTO8vRyCn/J9My0ON0hem1Sfcr9pZ49RpcUlz5a0Mr179M2LffoKXdffDATXVQcLZ9
 0PcnvlfSzw54f69OfnvXbKZd/8Gkbs0q/0frqefsLmUVldnvZpf0xq6mu2qIV8Vh/gthqg/auat
 FW4bTDqrMPKt3f1ZZ7vStSMU7KYq6Q3jexU02FLYlHb8orHI8SeCLZb83ypNa6/kievry2xl+Dq
 elaJh9D+8TPLQmLlyuPuaHJ+JT55G4mjTjGszUtWz/k3Yo18E5M3iR66MzZyJ2yjqZqlx5eucpw
 r17W6eHDnaUplYEvsjUOSLhOlX18ZwFTH+v2IrOIw3sA
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
Dmitry Baryshkov (9):
      ASoC: hdmi-codec: pass data to get_dai_id too
      ASoC: hdmi-codec: move no_capture_mute to struct hdmi_codec_pdata
      drm/connector: implement generic HDMI codec helpers
      drm/bridge: connector: add support for HDMI codec framework
      drm/bridge: lt9611: switch to using the DRM HDMI codec framework
      drm/display/hdmi: implement connector update functions
      drm/bridge_connector: hook drm_atomic_helper_connector_hdmi_update_edid()
      drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure
      drm/vc4: hdmi: use drm_atomic_helper_connector_hdmi_update_edid()

 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c     |   3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   3 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            | 170 ++++++++-----------
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c         |   3 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   5 +-
 .../gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c    |   3 +-
 drivers/gpu/drm/display/drm_bridge_connector.c     | 162 ++++++++++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |  59 +++++++
 drivers/gpu/drm/drm_connector.c                    |  11 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c         | 187 +++++++++++++++++++++
 .../gpu/drm/drm_connector_hdmi_codec_internal.h    |  35 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                     |   2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  77 +++------
 drivers/gpu/drm/vc4/vc4_hdmi.h                     |   2 -
 include/drm/display/drm_hdmi_state_helper.h        |   5 +
 include/drm/drm_bridge.h                           |  23 +++
 include/drm/drm_connector.h                        |  80 +++++++++
 include/sound/hdmi-codec.h                         |   7 +-
 sound/soc/codecs/hdmi-codec.c                      |   4 +-
 26 files changed, 661 insertions(+), 193 deletions(-)
---
base-commit: 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
change-id: 20240530-drm-bridge-hdmi-connector-9b0f6725973e
prerequisite-change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38:v1
prerequisite-patch-id: 045caaffcff29ba5ecc8afa9cef22f40b67c1959
prerequisite-patch-id: cd898cf6d758d05fda796b0ab685ed53d7ccd72e
prerequisite-patch-id: 92115dfe744bb79f3ef0a10fc1fb3c8ef22f3bda
prerequisite-patch-id: cc8334b2d881be3418f1d4d2fdea8b05776fdb73
prerequisite-patch-id: 8c6c14a1dc11e4b70ea67b25dc3d2f6ef3234160
prerequisite-patch-id: e0dbd26699df8fcde52a46a66e4ab4dc705b2c2d
prerequisite-patch-id: 93abf443341cf9a5f907cadc3db33215055e12c0
prerequisite-patch-id: f9878d1469a094b6d2bd02e449509d77e5fa95da
prerequisite-patch-id: 865b400514c2207990c07d9f789c05e414d19fd6
prerequisite-patch-id: 0e05e8ce53477acfc686620b9e212763ad3058aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

