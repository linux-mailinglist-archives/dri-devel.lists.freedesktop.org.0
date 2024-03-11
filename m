Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30125877ED2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667111260C;
	Mon, 11 Mar 2024 11:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yxZsFYEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCF911260C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:20:39 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so57543211fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710156038; x=1710760838; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FfwYDRgWRQCKC9tq+bJEC9b6/f6fAu33v/gxpRKZsjU=;
 b=yxZsFYEu5WnV41YrTNvcMRUUA+dl483yqpCF2q9v17X3CaQfmmsv6rPhHEaWGh3zcD
 N8W7H6bujzVtVVjD4YsIS9GfgcU5l0S4rpkTjvaciv+VcVp2LOvLeuVPEq5XuTQc7tXc
 WsqnsqrnL87/qe32BLZWPRwrvVjV2gd6ZrwFVfAoioNXO7rkOLHA5NxyEQ6HZMxsbJyd
 +LSg9HmXduhKHeYNiPqp4l+Uk0+gmDkBVZocVlXSEmh26W6GfinCbVnSo3pIZedXjOfR
 eJK1psy/H4OY3b0wnI7Wdj/j8FSIpDbfyWWbNHO4LlcV220mR8K9Za5LkSLlwlr+emNP
 1lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710156038; x=1710760838;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FfwYDRgWRQCKC9tq+bJEC9b6/f6fAu33v/gxpRKZsjU=;
 b=j26Sq4btzcmSbZQWmVAUHq8qBPqRDLOKlYaDQB8647OIn8dCfbjnts3XRJlxS9oYqg
 eup50JvyTsUfOpGr0DEF8C6PycAqxuHU5aJ0MZ7jmjI+C2oHe5gRnXgReGzo6eEu9Xwd
 GwOJB4Gcl72JAVTOs2Csiqq8FnuVDs5Nu6slBRXEuo0dDFWcp6yExx+oACMeUSleuVlk
 8r2cit2yVKhQoHGrg+oLcEwKFy8uP8UyGE/+Na/2nTbiRXrRwiUjVJ/lh8a4qc5+jM9l
 /+oMBt5iybrkBqc7iKT60zLQ8+sDO3xc/OUYtSKy1MI9yMNBMoRZSX3qoKzeZssvh0Cf
 V/cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmiEM7pTegSTJCKGl87rnJKRsIWEg9lcW5xbNKDjJcV624TD/sbI8o0zzBOai7+9weAu23ZlJQ5vKQWufBjCsmx60zPXskQj63gQA9lSg4
X-Gm-Message-State: AOJu0Yx7hRAIexPdj+xTa1b62ZdpELpXUyinYOLzQDgtfK1MOvnzGI8p
 Dv1MMlBHn0qAyOk//ljzcOeu6OoD0/OBb8QSVljrBFKvcBulH9WjA982Xi+/cyo=
X-Google-Smtp-Source: AGHT+IE0sz+dkhtvBYuoYNh/0wTQoTbPhTPeVyMtJ5WatKWJgn54X66Z6d9IlfqQEg+MXbPnlCuzFA==
X-Received: by 2002:a05:651c:141e:b0:2d3:3e83:8309 with SMTP id
 u30-20020a05651c141e00b002d33e838309mr3452454lje.19.1710156037994; 
 Mon, 11 Mar 2024 04:20:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 by10-20020a05651c1a0a00b002d2aa0b0d01sm1075200ljb.82.2024.03.11.04.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 04:20:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Date: Mon, 11 Mar 2024 13:20:08 +0200
Message-Id: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOno7mUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0MD3ZSiXN3M3Ard5JzUxLzSAl1DA3MTs0TLJHPDNFMloK6CotS0zAq
 widGxtbUAf3w1x2EAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2450;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=n56X+wpwlkTkcmdlEomphHkA7aK1W8E6wSSQhWpP62Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7ukDVZSYHTCgMsmS4v4TYL68h/sP9ZvVQx2+K
 WAeQfwMw8WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe7pAwAKCRCLPIo+Aiko
 1eQBB/4yvL/fFt6doOLRiXjbqwqNX7AfOuaa/363KNFHGQ5n/BSZNc2diRkK58WrhBoVvSNjmKb
 nLi9AeiIX7UnbA+9eNf+5iKqUx9xCF9GH/bg8hJOImmTFWFCf51l9pgWA/RY+SZtYASOh0KHgC+
 6mAV7IF5VwaWzxvTQD2VlpgmjifM9ej+HihY7fEC/pN75hjo1atDvPsDo0QchEy9gDrhvRUa03B
 41hKMCw5y/E+/L3V5LQlWbZZcsyxkFq1jm58+6gPjKDd1ZTbU0uyNzu+Q9xWXpcTsERInzAboRd
 PiW0SIxAo2E5/DJIUWfJNdqOM9TX9/8U+sohAdQv1Y/pJkds
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
 drivers/gpu/drm/imx/ipuv3/Kconfig                  |  15 ++
 drivers/gpu/drm/imx/ipuv3/Makefile                 |   2 +
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   7 -
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |  19 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c                | 201 ++++-----------------
 drivers/gpu/drm/imx/ipuv3/imx-legacy-bridge.c      |  85 +++++++++
 drivers/gpu/drm/imx/ipuv3/imx-tve.c                |   8 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       | 133 ++------------
 10 files changed, 174 insertions(+), 299 deletions(-)
---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240310-drm-imx-cleanup-10746a9b71f5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

