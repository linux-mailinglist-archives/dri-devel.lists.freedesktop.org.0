Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DB8935C5
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8A910E9EA;
	Sun, 31 Mar 2024 20:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nw2F8wHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F6B10E9EA
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:07 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-515a81928faso4226908e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916946; x=1712521746; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ke8yGtCVv/5QoZ8dU5U7lxdg3fQhjUiZTY8VG7siut0=;
 b=Nw2F8wHPAvwReOwSEqoC6PUZ7eTF6v3qTFtnuOq1QOHF6J6KTjX1sRgB37w6igylg/
 JpMVK51avq8ZnqES7x7bop8ZJj1VF8JAdE240q8nTqnxA9NASjNC1BxVIzLWy+YftjJl
 Y8sZikDPFD7sTxa2thbmlFugeW5M97U9ajTiCvrD9QWZztiNDjoLysIUuxa+D3NH3rCZ
 IN9fcI7PA9Z1PLt4Idpe49Gulh1XBZL1zQURvQuEzZvHY6EGprtFCmgmfyrTjwJcFnkL
 Y8TP0n8Stc/+sUu7Fk6Z3gAaVs97mTmHYlyDpvfiGcWEwcdo51balVZa2U0vXlVr9cBM
 r15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916946; x=1712521746;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ke8yGtCVv/5QoZ8dU5U7lxdg3fQhjUiZTY8VG7siut0=;
 b=tox0oxmqbwX5QCWWzECzR3emptdjhbMh3mQrLfEAdhg76AkfW7uT0HYLRovPBIQbDl
 9HSBYi4r/feO/qHleARaPO8hR4LPRZADvFMIEePgtAOTX7vo/Jk0lglwHdk4GqzTjrZp
 +TkIsBxEo/tsFaYX7HDbvS2eXft2/eHgu0yyiH81oyvLlT6O6D/+vXA9Zd0Z04wSehUP
 SpXx9jYkSLybz3NPEyvK704JE5QJ2vO09bVuOFVxEWPPgWyG3eduMZYCg+J469U2hkkl
 ZpjRQewM2agetuztjUZFUnSf/61GXu8ZZ58Xfb0JKbLcgGSHO5VpvZITWdcrZsgSbDVh
 PwkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmSO2ohdhLvne+Vo5vDIcraqIjkYRJendeUlkeyjUbWAX7TIP2Cyn8i7bm8Lzwmt4/0OEh/Vky+3jabXvy+9Hnaj17bm9Zy/coZYnqjOza
X-Gm-Message-State: AOJu0Yw3J0mJOAnS30pe/6KA4XvTgeSaPXZsZlEFLZzdVsHE0mTdt0OO
 XWBgOw9xUULwNQGbdCUEhoDCQpGiRoThbwzOVdvmMwBdjpep7svFcqCYZEhKA14=
X-Google-Smtp-Source: AGHT+IHLQL1U5tLEA/uaNC1Wpt0XJL27jBfG3hvdugM1uDaF7fxhj5M2+UlDtzseElbw9HxjBQ7osg==
X-Received: by 2002:ac2:5224:0:b0:513:5eea:2942 with SMTP id
 i4-20020ac25224000000b005135eea2942mr4878774lfl.37.1711916945549; 
 Sun, 31 Mar 2024 13:29:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Date: Sun, 31 Mar 2024 23:28:57 +0300
Message-Id: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInHCWYC/2WNQQ6CMBBFr0Jm7ZhOBYmuvIdhUWGASaAlUyUYw
 t2tJK5cvpf891eIrMIRrtkKyrNECT6BPWRQ9853jNIkBmtsbk5ksNERZVywHtj514RkyvzsLo+
 S2gLSalJuZdmL9ypxL/EZ9L0fzPS1vxb9tWZCg0wmb01RO1fQbRDvNByDdlBt2/YBoEvwOq8AA
 AA=
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zVnbAbPF8sxPI5DAV4JMslU2Y9lcTwAMMXk+k4+/EQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceOK2zSH8bT5rAhCDbo6xqbRSw4VoyfN7T5Y
 JX4uWZfri6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjgAKCRCLPIo+Aiko
 1ZDUB/4jbmbPWrHNwE9pT9AGhCIMSIBHR72AqX2B7V9sYkYp0RP+BUdO3z1dYHaCioJXBw5XLkY
 nn8BV/5o2wiXZfxlRwFLe/6f4RLBGYi1Pd+1YIk/cv6BOWQuquu6ivk22dJXdeh5WGrKGkmp0TL
 xOH7pS66fmxI/cLmNzUJNqOyPRLXG2D+9L/gllrrAA3ZL0V6AJISK/pFL1uXe99NgBWlK8utAxK
 Xn6PlF9WZOdeoyl6wvVVb8DnTovfpY4cVo/po7d0JKuMhE4YC2sVWZkrgrqeghJbpDjSjS+wG8w
 CqaBQmEvoIqtcoWzH+QtrbxF5wnL9CHF7SASz9g3cyRulpAM
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

The IPUv3 DRM i.MX driver contains several codepaths for different
usescases: both LDB and paralllel-display drivers handle next-bridge,
panel and the legacy display-timings DT node on their own.

Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
upstream ever used these features), switch to panel-bridge driver,
removing the need to handle drm_panel codepaths separately and finally
switch to drm_bridge_connector, removing requirement for the downstream
bridges to create drm_connector on their own.

This has been tested on the iMX53 with the DPI panel attached to LDB via
LVDS decoder, using all possible usecases (lvds-codec + panel, panel
linked directly to LDB node and the display-timings node).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed drm_bridge_attach flags in imx/parallel-display driver.
- Moved the legacy bridge to drivers/gpu/drm/bridge
- Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
- Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org

---
Dmitry Baryshkov (12):
      dt-bindings: display: fsl-imx-drm: drop edid property support
      dt-bindings: display: imx/ldb: drop ddc-i2c-bus property
      drm/imx: cleanup the imx-drm header
      drm/imx: parallel-display: drop edid override support
      drm/imx: ldb: drop custom EDID support
      drm/imx: ldb: drop custom DDC bus support
      drm/imx: ldb: switch to drm_panel_bridge
      drm/imx: parallel-display: switch to drm_panel_bridge
      drm/imx: add internal bridge handling display-timings DT node
      drm/imx: ldb: switch to imx_legacy_bridge / drm_bridge_connector
      drm/imx: parallel-display: switch to imx_legacy_bridge / drm_bridge_connector
      drm/imx: move imx_drm_connector_destroy to imx-tve

 .../bindings/display/imx/fsl-imx-drm.txt           |   2 -
 .../devicetree/bindings/display/imx/ldb.txt        |   1 -
 drivers/gpu/drm/bridge/imx/Kconfig                 |  10 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c     |  85 +++++++++
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |   5 +
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  14 --
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 202 +++++----------------
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 137 +++-----------
 include/drm/bridge/imx.h                           |  13 ++
 12 files changed, 184 insertions(+), 301 deletions(-)
---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240310-drm-imx-cleanup-10746a9b71f5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

