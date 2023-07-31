Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74A769985
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 16:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2610E14B;
	Mon, 31 Jul 2023 14:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645D010E14B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 14:31:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso4914356f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690813913; x=1691418713; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C2IHwKYnLNDMWdLQxEd/SU6Gdll+SBIjNHACmkW+1QA=;
 b=1Qf5eCcJY8sevNEC/HX5WLYyVc+EFCLz9jXCySaH7tyM+geGe1kMnUSZ+/E4BYlCXh
 W3edA2AXUuC5BKOj8XrvmeNHJ7WP9ifEwtiPu9Tp52dWyoTMnISkGQ2qmyD9p1xONMr5
 4Bk0RYDmiJ15bYd4a/yLPTy3t6ButwFW8Nbvo7Jfz2/DmxwFcxSZws9UYQOZwlg7Vh+2
 Q7hOkVEUUL/dc8XEUfKogGjybD4/mRfnbWugqUafRzXXZPCgu13+WLkgjrSpg6zwrC9k
 DosdBrNSqNpCpIF9hP6S4tkKVcWLAxPo1+Rb9h/BoUFYP5nABGsShjPI9gJuopM3lz8s
 UPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690813913; x=1691418713;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C2IHwKYnLNDMWdLQxEd/SU6Gdll+SBIjNHACmkW+1QA=;
 b=gymc2O3DqhP05vpZ3jdBe+jUBy6hxA3SIUiB9BAs+v9q7SCEYe821MXA2tnUDvti7e
 bQ50uxxcaH/zl6zkfuTlIVKbyzOCAyyE2i/0UZYc4dzk613n14zM7dFjZlucLKGG49rk
 uf62BrZ36MIqG5sDyoy6JbjqxpQQ2cxqN/fSVlDM1EEQa2hzpYIIFUiYF4LX6fe6FoXq
 KUP+DCahJogEZyuZntH3SlSs90mGGsLQdnkvbW2/PSNm6h7vs/5qpabp6onJPnFX4ohG
 HV5oNMh6JiY7QoStDCWh/azFdWVSAXO0Fer2F0e9iLDFD48R+zvwsXqvDQtG5PD/UwEJ
 Es2w==
X-Gm-Message-State: ABy/qLYtPNMLWat0IQWGJInhvOoKMdyJEQjOOrIRxdWZlOGoPvp9W9J9
 qMsv4uLNVqWP0416TIlsRlgj9w==
X-Google-Smtp-Source: APBJJlH00VTTAnNgAW+4jvAVqrnGVXcPWqJGW20E2ovP93Zlr7ToKwpkPaYdKeXrn2KrLbF/uGp/ZQ==
X-Received: by 2002:a5d:53d1:0:b0:317:3b13:94c3 with SMTP id
 a17-20020a5d53d1000000b003173b1394c3mr3768wrw.41.1690813912679; 
 Mon, 31 Jul 2023 07:31:52 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020adfefc8000000b0030ada01ca78sm13301675wrp.10.2023.07.31.07.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 07:31:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 0/3] Add startek-kd070fhfid015 display support
Date: Mon, 31 Jul 2023 16:31:44 +0200
Message-Id: <20230711-startek_display-v3-0-dc847e6b359b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDFx2QC/4WNXQuCMBhG/4rsuoWbuGlX/Y+I2MdrvrSmbDYS8
 b83vQyiy/PAc85CIgSESE7FQgIkjDj4DNWhIKZX/g4UbWbCS16VkjEaJxUmeNwsxtGpmbZ1Y7m
 oO6GVIvmlVQSqg/Kmzz//ci6PY4AO33vmcs3cY5yGMO/VxLb1dyAxWlImqpZJDbZq6rNWs0Md4
 GiGJ9l0if9R8KxopDZSWzAC2i/Fuq4f9McorwkBAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=i6hwF/bJpJiGLlOquFWKnen03Rk1zyVrmixDTCRPG84=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx8XXu3CXuIBVE4+ylx3SVjuGG6Y/iHPbGE8oiaZd
 ttt09YuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfF1wAKCRArRkmdfjHURUCED/
 0dUeD68t5MIIs++03ZpXnCgWOUMbzXPT9Qjuw7VUV4cixKxnp8cjGoF+e8V3RWOTx8y2WuUqcP6kDm
 PFEWU7yRd6D/vbNIvB07ueoF0Hk2rRRZWHCaGXNAr3KGI2Kb3NIPzQp0m4uk/f32vIUQDX2olHT+hK
 gRxi6aQVqHPSnvz09aqghcOuLC9z8dF0YAUtdfb4INILqTOfgKT9CEdlwXfpttt02fdofnXtf5u9P1
 Je1C5yRBe4MDTZuIJDCu5Z5tSqIzkBlIcjLcFVJO3U5KhoCHkMKF+CGOWnIBL4JVjSzPh7QnZ9vdtp
 Pg6ECNV1fg+ny4AD3JzSQHthyIISd9VTeyMCvY2VHiKMUvEQJqzHsWgME+vK7NOTQ7967dPW1AGha0
 eSxSrzBgmKHdgR7sfeeOboqGNQsNiJ57dgZB9zJiuuNxbmsC0mVICdjJlM4Ht6x5UhahUBgjeztMe+
 Lk92bEnejpMUa2tOyHX0SMwOSnM5RoA3Dhor9S2ZyQI8fzUm8BBfQBTsEkU2d9T+f7WBt/pXFIpXfM
 iYRQ/XeLFDBnTxq3yOqj3nkoseI/VY3aG1xzndpOrdb9u73Uc3y1XLOZ/Ir+GeRC/DAWJ/01ez1xAW
 3syFP+w29gsfhsIBwI384Whi0a4UkpYKGxbOBKLib9NvaYcUkk0rAz7pPL3Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Cc: devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the support of the Startek KD070FHFID015 panel.
It's a 7-inch TFT LCD display with a resolution of 1024 x 600 pixels.

I use this display plugged to my mt8365-evk board.

This serie come from a bigger one [1]. Then I addressed the previous
comments for the related commits here.

[1]: https://lore.kernel.org/all/20230220-display-v1-0-45cbc68e188b@baylibre.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Remove spurious line.
- Remove useless ops (enable and disable).
- Remove brightness value init because it is set right after
  using mipi_dsi_dcs_get_display_brightness(...).
- Link to v2: https://lore.kernel.org/r/20230711-startek_display-v2-0-87bc7bdec6e9@baylibre.com

Changes in v2:
- Replace "dcdc-gpio" by "enable-gpio" because this pin enable the
  Power IC supply. Also, this property come from panel-common.
- Remove height-mm and width-mm since they are useless here.
- Re-order elements in the stk_panel structure for readability.
- Link to v1: https://lore.kernel.org/r/20230711-startek_display-v1-0-163917bed385@baylibre.com

Changes in v1:
- Fix typos in the driver.
- Merge 2 regulators in one bulk variable in the driver.
- Remove backlight enable/disable from the driver because it's already
  managed by the backlight core.
- Move hardcoded values from function to the generic structure in the
  driver.
- Remove unnecessary function (stk_panel_del).
- Replace some functions by macro to increase the readability.
- Link to parent serie: [1]

---
Alexandre Mergnat (2):
      dt-bindings: display: panel: add startek kd070fhfid015 support
      arm64: defconfig: enable STARTEK KD070FHFID015 panel

Guillaume La Roque (1):
      drm/panel: Support for startek-kd070fhfid015 MIPI-DSI panel

 .../display/panel/startek,kd070fhfid015.yaml       |  69 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 412 +++++++++++++++++++++
 5 files changed, 494 insertions(+)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-startek_display-958d265f6baa

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

