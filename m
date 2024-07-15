Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D02D930DFF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 08:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6308410E269;
	Mon, 15 Jul 2024 06:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YDeZBESy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B3910E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:33:15 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eec7e43229so45042111fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 23:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721025194; x=1721629994; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YgUa5kzPxeKRnm4gmgQB+wDns4r7Lup1w0YNsdAWOCs=;
 b=YDeZBESy6YRnzXkH+6Kc6AWCsSPHTjhxc9h5jJsu2rnyL8FBMWNj4pjQhiakSouf3e
 O6BkexMEHDAemLaTcCxumXYHWRiblDajeDXLW0AE6cqhM2sUkbm2pjAglyH2lGxyjN+N
 a7GDDwc90m/sJhzGhY+gnI19dnCVH5T/k7sJJbw8Kc5LZ/3ZLdR3u92LrGR9kML755CL
 z1avAUUUX0hx1HvZl3i9HLNi+Ssu6t4BwQolDnEy2tiv64mbV36xJdvsYiSElHQw9hPz
 rNVcm/FKjEvXBNYKfPXSc4L68DhAYMZ9cUY/O9qHt3DZn6n3zXkC9v4yN8pt32gOXFGb
 QGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721025194; x=1721629994;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YgUa5kzPxeKRnm4gmgQB+wDns4r7Lup1w0YNsdAWOCs=;
 b=UFWr+3KDrCiaZdRt/u36aDw93+wZhx6Ao5+JAHVm/4y2nFiN4j1Hr0RSakDi51Qv5J
 oUb9KTbzVA8k8KOhmGPiQnkcbHdMzqjJ/oLhz7bsYZrUAZKSLXuGcOqtjar5UPKyiFxr
 +BUFroMi1wyw5qS3dykr0PP5lAXeSVrK1n9rx2r6T/NbxAPYlvcxbEAydSLYzQYVaFme
 kb/38HeX6FZIX3iu5psDurhzUaMoUcn7KyKhewYgvIddRmWsV4ewkrj5DT5stNzUGZuu
 YxTHhmU0cQb6ADNo3ucYUgf8iPbCm4cRA//HpdDmEh48LHLrLPY5tqp/XlGeXJpqMR1t
 hXiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYDVv1eD3P8MW5QVE6QPCe/gHZXBpP0O7gdL3GzM4KPyyPCbsH5Jo2KiGm1+l547nR3Uoo/XN1WnWM9JcSGfkFkj1/5czSAXpu4HKYc5JW
X-Gm-Message-State: AOJu0Yz/2yCdIlus8lskpbxV76Oa3KbwDpXr4lxn1pFlIXBWKaCVjM0i
 m6by0KWMPrFPjEBBRZq+UICBfYRxAgakIPtR3zru0N6pfUO3+YQny5pwmNxjRh8=
X-Google-Smtp-Source: AGHT+IF0VjTw1K6MhesN5YsTG+trLH2ksTK9vmpMlTq0f2CRXPdu0k2mF7HtB+KTdSOIvOdGMqJLuQ==
X-Received: by 2002:a05:6512:b86:b0:52e:9ebe:7325 with SMTP id
 2adb3069b0e04-52eb99a3299mr12878900e87.31.1721025194058; 
 Sun, 14 Jul 2024 23:33:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24e188esm743543e87.47.2024.07.14.23.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 23:33:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/5] drm: fix two issues related to HDMI Connector
 implementation
Date: Mon, 15 Jul 2024 09:33:00 +0300
Message-Id: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJzClGYC/53NTW4CMQwF4KugrDFKnEBnWPUeFYuQGMYSJMgZj
 UBo7o5hU1Vs2i6ff753N42EqZnt4m6EJm5ci4awXJg0xHIk4KzZoMVgN+ghyxn2wlk3qZZCaaw
 CB77CkM8MQo1GsIm6TTzYtY/RqHQR0otXy9dO88BNv26v0sk9p3/zJwcWgqO+60NOmdLniUuUu
 qpyNM+CCf+BoqLdurc5hN5hojfUf6MfFn+HekUd7i15hyHF8AOd5/kBpZf9poEBAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3388;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Kf60wOnocntCYjHw62V/2EfBf+1HRmYhh2TPix7OkEw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmlMKocUnfYLehIHLnhjn/YpzPQGYcZbZYpR1xe
 NasM4c80MmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpTCqAAKCRCLPIo+Aiko
 1dVwCAColXJjF6PCrF5MkX7SZctjCE45P3YoT+ofdNiLLdzra1QLPkG11tWvr7FNxQeMooIwBT+
 kPIgczU7r6aCEZtetqb8KHb9z0qxQkWjU0eAGVpVvL5QXP5J8e0C4/q4LA7eoxyn8I3hXMZMYY1
 1+3RFgC6uMKkxY7ZHe2nRRaE1IOaTUthxnHohXBP9esLDcSucShFO+ZMuSXJxbMJ62O7BNVyHBR
 7tJLeqX9nlI9mm5oHN760QaIXr6dVJHjgzhHvwojU+t8LcFQd55Ft/cqHbwMHYPx/Bb6AZhRken
 J51R8XlcTuMH6ZsPIjlQUcKK6Fo+sdudAprTi/uDXGJ1I8us
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

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
it's better to add drm_bridge_funcs::connector_reset() and call it from
__drm_atomic_helper_connector_reset().

Depends on https://lore.kernel.org/dri-devel/20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Fixed DRM_MODE_PROP_IMMUTABLE to use MUST in the single-value clause (Maxime)
- Rebased on top of DRM_DSC_HELPERS patch
- Removed 'depends on DRM_DISPLAY_HELPER' (Maxime)
- Link to v3: https://lore.kernel.org/r/20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org

Changes in v3:
- Document the DRM_MODE_PROP_IMMUTABLE requirements currently exposed
  only via IGT tests (Maxime).
- Move drm_bridge_connector to drm_display_helper.
- Link to v2: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org

Changes in v2:
- Actually pass the flags to drm_property_create_range().
- Link to v1: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org

---
Dmitry Baryshkov (5):
      drm/display: stop depending on DRM_DISPLAY_HELPER
      drm/drm_property: require DRM_MODE_PROP_IMMUTABLE for single-value props
      drm/connector: automatically set immutable flag for max_bpc property
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/Makefile                           |  1 -
 drivers/gpu/drm/bridge/Kconfig                     |  1 +
 drivers/gpu/drm/display/Kconfig                    | 25 ++++++++++++----------
 drivers/gpu/drm/display/Makefile                   |  2 ++
 .../gpu/drm/{ => display}/drm_bridge_connector.c   | 13 ++++++++++-
 drivers/gpu/drm/drm_connector.c                    |  7 +++++-
 drivers/gpu/drm/imx/dcss/Kconfig                   |  2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                   |  2 ++
 drivers/gpu/drm/ingenic/Kconfig                    |  2 ++
 drivers/gpu/drm/kmb/Kconfig                        |  2 ++
 drivers/gpu/drm/mediatek/Kconfig                   |  2 ++
 drivers/gpu/drm/meson/Kconfig                      |  2 ++
 drivers/gpu/drm/msm/Kconfig                        |  1 +
 drivers/gpu/drm/omapdrm/Kconfig                    |  2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig              |  2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig           |  2 ++
 drivers/gpu/drm/rockchip/Kconfig                   |  4 ++++
 drivers/gpu/drm/tegra/Kconfig                      |  1 +
 drivers/gpu/drm/tidss/Kconfig                      |  2 ++
 drivers/gpu/drm/xlnx/Kconfig                       |  1 +
 include/drm/drm_property.h                         |  3 +++
 23 files changed, 68 insertions(+), 15 deletions(-)
---
base-commit: cfbc154f11aaa32b4b2887323e4372390648046d
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

