Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8682D771
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C159510E260;
	Mon, 15 Jan 2024 10:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B45C10E260
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:34:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so44400155e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 02:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705314861; x=1705919661;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3SJqDr5KvSGyh2V1znLlQnEJgiCqsoWDRe3D5i0IsMQ=;
 b=dYmSYwjcchDZ0h6ky1ntDXY5RrzX8FkkKn6gn8EdFwdDxL6P3IhQGslLCnzjYbl9xf
 Mda0li8vzxtXLJxVI5nFQOqm9fJ2r4qZx0G/WFNwJsVF9AnE4PsHtkos9D5wfNX9Gko0
 TgLvgM2aS2K321T1fa4iQSKAR3KWTVa6AMgtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705314861; x=1705919661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3SJqDr5KvSGyh2V1znLlQnEJgiCqsoWDRe3D5i0IsMQ=;
 b=s70wFh/cZAko/k6b7NhD+OicNw49/AyaBw9ydIkPML0Qm/BgpoKChLfJyyGHtVBQYW
 nMl58q1VaeIHHIOC5uWboI4f9bOUCEm34EaEkDP4GrZck5/2nfY1NTr69GZ4OxbEyfvv
 C8n7Pti5598CXOrviZIFJul/MIqd7stkwWYR8sWSzIfcVzbq8jTANV7y+YZWzdvqpoZJ
 fJW4K9SGLmohgSHEzE+eAwzHGGrGXMjwmEb8F+BnygxCZ5XZSH7gTnYYKRvdbTIirLJC
 rZ+l/8Ig5xrbrGXwfvDA+Ceb9yqNHgjUk+sKjWkY51KAnJ8YIGBUQAjg83FiCJ49C++f
 UDGw==
X-Gm-Message-State: AOJu0Yw0aEIqiX/MgN18GHF83tlqvcRmS2rYXMcaIlSXrGo/5fQbLgmg
 cYUbsegf5MQPKT6o5+F4fI2kBTQcKtrybQ==
X-Google-Smtp-Source: AGHT+IEPp+cjxMkNUhf7IxEn4EJ35Sc/ijO1hlsPRawgLTBX2AkEeCZqx6+bsD5VZgysYrbeBpq2iQ==
X-Received: by 2002:a05:600c:1c91:b0:40e:4913:58b5 with SMTP id
 k17-20020a05600c1c9100b0040e491358b5mr2981492wms.174.1705314860956; 
 Mon, 15 Jan 2024 02:34:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-63-69.net.vodafone.it. [5.90.63.69])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b0040e50d82af5sm15536120wms.32.2024.01.15.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:34:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 0/2] Add displays support for bsh-smm-s2/pro boards
Date: Mon, 15 Jan 2024 11:33:46 +0100
Message-ID: <20240115103416.978481-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, michael@amarulasolutions.com,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds drivers for the displays used by bsh-smm-s2/pro boards.
The patches for the ili9805 and r63353 LCD panels, which have already
been merged into the mainline, do not work without the patch [1/2] "drm:
bridge: samsung-dsim: enter display mode in the enable() callback".

Changes in v9:
- Updated commit message
- Drop [3/3] arm64: dts: imx8mn-bsh-smm-s2/pro: add display setup
  because applied.

Changes in v8:
- Move the 'status' property to the end of the list of nodes:
  - pwm1
  - lcdif
  - mipi_dsi
- Add a newline between properties and child node (mipi_dsi_out).
- Sort the iomuxc node alphabetically
- Rename pwm1grp to blgrp

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

 drivers/gpu/drm/bridge/samsung-dsim.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0

