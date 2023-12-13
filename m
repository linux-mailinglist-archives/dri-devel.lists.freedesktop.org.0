Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B78811CB8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 19:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A53510E1D9;
	Wed, 13 Dec 2023 18:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BE010E1D9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 18:37:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so185989366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 10:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702492665; x=1703097465;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5uPvnip3JZl3WuLxh7oPl48PoCiV1C8MB4jla1EX1AI=;
 b=IsvH03yVxhcOUTyWnVpHdUZ0KOJwiRX4A/0YhBVohZRj/ls2tyLGqZTGpjLn/ObZp1
 dVCuJA/lbD4CCgMqb6du1V7EWQT1otjBK0g1qVeb8lv9RQpCwkU8TFQ6EtdFrtKBV+KX
 ge6EM5sy8aKkkWUYGIATzxczxoUV/NR8FMIDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702492665; x=1703097465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5uPvnip3JZl3WuLxh7oPl48PoCiV1C8MB4jla1EX1AI=;
 b=XLgTOnyOlGTvGuZEEg8JhOeSw7mQ9pPPfJRhQeLZcGjpO5V2E7EEEYGW6ALlaUudzp
 2JwOXAwC8snlG+K8oqd9LA6hLHWTHnmrwQkEnxnFa49rVuBpvuwysMf7rg/Ffru2IwaG
 nMTrroPiyZs98MYcwZyod9/O2TA9jRztwvmhE7XD6fv9x/YBNf/AGD7NRWd3g/18MPNI
 Q3zjJ2IkOPe1mACKG1lbw+PKK0uBzQWDqcSDbahMd2z1ZiAIcyHf6v1R98LdPyOwSADN
 qeXu+gdJMz1qnhqCVaVyiINHbsijAu9ZjXyIxh6gOdUmIp1oohZrpZu+a4kbgIugpDU4
 gkbQ==
X-Gm-Message-State: AOJu0YxOiC7hJzWVCCPvnpzlwRdSdDKVQSwpcyirHqBKybcmS8VXWmct
 5aIqEfonPdaaix4uuFYHiN3yzA==
X-Google-Smtp-Source: AGHT+IG/hyoLETOAVHjV1Ok+F8yZIUMpufAfkY6VEitAgTFuCSHGyyOipTjBtJEzwoS0SyvpMmOZ1A==
X-Received: by 2002:a17:907:e86:b0:a1d:6cbc:c22 with SMTP id
 ho6-20020a1709070e8600b00a1d6cbc0c22mr10546877ejc.41.1702492665706; 
 Wed, 13 Dec 2023 10:37:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rd12-20020a170907a28c00b00a11b2677acbsm8152775ejc.163.2023.12.13.10.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 10:37:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Add displays support for bsh-smm-s2/pro boards
Date: Wed, 13 Dec 2023 19:37:09 +0100
Message-ID: <20231213183737.4182996-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 michael@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
This required applying some patches to the samsung-dsim driver and the
drm_bridge.c module.

Changes in v7:
- Drop [3/4] dt-bindings: display: panel: Add synaptics r63353 panel controller
  because applied.

Changes in v6:
- Drop patches:
  - [06/10] drm/panel: Add Synaptics R63353 panel driver
  - [07/10] dt-bindings: display: panel: Add Ilitek ili9805 panel controller
  - [08/10] drm/panel: Add Ilitek ILI9805 panel driver
  - [09/10] drm/panel: ilitek-ili9805: add support for Tianma TM041XDHG01 panel
  Because applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  Drop patches:
  - [01/10] drm/bridge: Fix bridge disable logic
  - [02/10] drm/bridge: Fix a use case in the bridge disable logic
  Because they are wrong

Changes in v3:
- Replace "synaptics,r63353" compatible with "syna,r63353", as
  required by vendor-prefixes.yaml.
- Squash patch [09/11] dt-bindings: ili9805: add compatible string for Tianma TM041XDHG01
  into [07/11] dt-bindings: display: panel: Add Ilitek ili9805 panel controller.

Changes in v2:
- Adjust the mipi_dsi node based on the latest patches merged into
  the mainline in the dtsi files it includes.
- Added to the series the following patches:
  - 0001 drm/bridge: Fix bridge disable logic
  - 0002 drm/bridge: Fix a use case in the bridge disable logic
  - 0003 samsung-dsim: enter display mode in the enable() callback
  - 0004 drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Dario Binacchi (2):
  drm: bridge: samsung-dsim: enter display mode in the enable() callback
  drm: bridge: samsung-dsim: complete the CLKLANE_STOP setting

Michael Trimarchi (1):
  arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup

 .../freescale/imx8mn-bsh-smm-s2-common.dtsi   |   1 +
 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 121 ++++++++++++++++++
 drivers/gpu/drm/bridge/samsung-dsim.c         |  14 +-
 3 files changed, 133 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi

-- 
2.43.0

