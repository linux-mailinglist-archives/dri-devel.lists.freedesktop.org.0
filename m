Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21F6769A61
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 17:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9987A10E2AE;
	Mon, 31 Jul 2023 15:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185E10E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 15:09:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57ddso42937945e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690816139; x=1691420939; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=esXDvcVLB1Pf5VLrBlTbNKHd0wmacNaCg5M9D8JHIXg=;
 b=Ul1VhubchGAHP/sFOGTfFM5Cs01QEoSc2hxBfocNaQLKeMi6vmpWi5Ls2AQlO5DbPu
 f45KcMj+W35gFZw9hcSrdgp/a2ukiqdIHtkuqOcrYOXAPUTYOokxOFlxYIqNEeLOePtP
 DItiPfYd1u8EFEr+E6QxK2ccKu77j/mykseeIvLY240fPFDyV3ZqJOepmh6Cg8WHilxe
 Wyd05CCGyHZ7gQsgIxWTHB3hz6R+PhfQnC/9J2HslrDungsvwJ4b5aLA+nAdkg95XBih
 IdYplcFAKkO+hiTJVU/IEf6cL6r8dfef22FdLU7nnL5laqSV/zvioIIj4K2G1GIT/K8s
 D6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690816139; x=1691420939;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esXDvcVLB1Pf5VLrBlTbNKHd0wmacNaCg5M9D8JHIXg=;
 b=Zo/g5EOUKIIcxMHH9KaDjAbP5uaDEW9O9BS/JTCQZPb8nttzq0I6kHXf0XlZcaMdEb
 y5vHiscDQNQ+QHEtFtNcOTwpYsuFz+pYugMz1zaKZ40bXOpAcg87CGw0gm3WPYyjtDPB
 AFlxdrpbzOQqN2cJG+PljLu205DSgkPq8Mt0EnYlMRcDvPsgSiTJmEZFtswJV/fpLEM0
 rZPsB0uA1guiplVy3MYG/SJ+W/9XInbtGo4gjqgZh69tpdEVcfnZUUmN9t8/7WQqiuv2
 TiHsQNk1LAvNV7dOtIKnOkWhAxsUvlIB+32Qb0mWUDTAN6WbU/0q5i9j5DRaINhHQT2r
 uKrQ==
X-Gm-Message-State: ABy/qLYTOSLUn4yVyGzyOeUi5mMDiRHzM+xXqcX1k8MXSPXLDzstLuwX
 D+L95qJUVrCWP8GUWrrpU6kKiQ==
X-Google-Smtp-Source: APBJJlFSgsTnborMdQjKDSPPkocyta/EawARi83ByB3+jV2PIn1gHIaYRV8eaB7vwd7qAceiMS8n7Q==
X-Received: by 2002:a1c:e907:0:b0:3fe:2011:a7ce with SMTP id
 q7-20020a1ce907000000b003fe2011a7cemr192373wmc.6.1690816139157; 
 Mon, 31 Jul 2023 08:08:59 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 u22-20020a05600c211600b003fbcdba1a63sm11728791wml.12.2023.07.31.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 08:08:58 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 0/3] Add startek-kd070fhfid015 display support
Date: Mon, 31 Jul 2023 17:08:55 +0200
Message-Id: <20230711-startek_display-v4-0-fb1d53bfdef6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIfOx2QC/4XNQQ6CMBQE0KuQrq2hLbTgynsYY/rbjzQikBaJh
 HB3C0ujYTmTzJuZBPQOAzklM/E4uuC6NobskBBT6/aO1NmYCU+5SBVjNAzaD/i4WRf6Rk+0zAv
 LZV5J0JrEFeiAFLxuTR137atpYtl7rNx7u7lcY65dGDo/ba8jW9v/ByOjKWVSlEwBWlHkZ9BT4
 8Dj0XRPsnIj3yF4JAoFRoFFI7H8QYgdQkTCmiJTKEHkJXwRy7J8AOj4w9lMAQAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2540; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=AQlAVkclcYLnMjIde28GbBAVGLrAvdO2Dy3THAfin5w=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkx86JjgKkcVGhs1Zc1ZPOre5Rcpx3jjZWywQnHhmc
 42Dw3yqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZMfOiQAKCRArRkmdfjHURQqtEA
 CPHfJW5LsP1hJ6i0nqwoZmNDi4vIVW3qtXbyUgcQZ+vGMhIVneUankn76smthBPIgVQCApeodiicXQ
 3oJtb/RUsDd3flJo9hFa0KNS9QCno5UGYdIEKMfo4n37xJpjMn5U/tceKsYrFwx67RLPDHy4XoYNVp
 DIYO+AIa4juT5sLiFgFNAv4sHXvJf1NWNsAn1JYK0rIrUUh5eksirU1K1CO/j9NQxrgqltY9vZ2dgK
 oV5LgHyr3w0gNIT9CU/3pVp6AC0Xz+n1ZVWFN63OorjW+kw4kKbcZFrA91ZLt7nUqw6oPT9uX0kco4
 t9BNZH2NgTh054Wv+3bRq0NRItSyLJoCUo3oTRSn7YYH8Coa7e817M10gz/740JveWZAzUa4Y6fpnW
 n1iJkfIASyUChDbTtTeswUWFVwUU8wQ1e6j9Npzaq6DgkJvHwTRX2b9QdO4X2Qkku/OKqUad3WFrWS
 Nj7MK+GY2XwdWODOIAwPhceHFI1+yTT5ufR2PXUI5Nsb8manwDqaELwEuFKDhpT1ZhDuTz8ddu+vlr
 aXw1YySJ/+WsnsVuJnKcG3GIAy9NSAZinNzN5zMHbmBUQKCfZQp46c5PImR27Z1uFH28QPYYKB/lfA
 hMQY+S9PXcQc765c6ZU1KRkvbJFtEoLxocIPFY8jE07hQ+3p+jtLwxwotfMA==
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
Changes in v4:
- Remove useless function: stk_panel_shutdown.
- Align parenthesis for readability.
- Link to v3: https://lore.kernel.org/r/20230711-startek_display-v3-0-dc847e6b359b@baylibre.com

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
 .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 406 +++++++++++++++++++++
 5 files changed, 488 insertions(+)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230711-startek_display-958d265f6baa

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

