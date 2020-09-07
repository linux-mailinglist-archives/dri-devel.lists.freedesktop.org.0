Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8038B25F4D1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9594C6E2D5;
	Mon,  7 Sep 2020 08:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6436E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 08:18:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y15so663116wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVkpcj81glnSnuras7YrChzwHxX/+ElP6dnTPDpVflM=;
 b=eq8pdz4bEvw8Drm9IiyKHHS/9tFdgbwA08m44Eo5/3AjXDsoVvgB9xtCqI9yTDhZHe
 JWhhbtGcwt6X672OqK0uhjV9ZpDs1Wdnkrdm8HSe0aMBznreCxHk7OroTON3aUfddLm1
 NC7fuE0Ak5aP4nwxtYkewvg/z0Jq9O03FCVjJetdv4XeVtDXiq+/CAXBQIDTxuM4AraI
 A0oDMSoo3d7XD6D3VHC5oDtBsyl3T/aSCS37kU3emyahVkV4GBseZ06BTPRVOUCjQQHw
 UdA8A5B3ZNrRfqyEoUmZH8v1Ac+suW/fzeN/twc47tAJbxfPkd7NYADS+cFIg3nobAEI
 5k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVkpcj81glnSnuras7YrChzwHxX/+ElP6dnTPDpVflM=;
 b=kOs4/7CPlcL8AodOZK66N80S0yyiLvp2TlYDXyE7P7V+WQmUgy3nqn+FTbnd2TXzCd
 OzXp1/v2n3T2yCE9RAIAoHwYX56GM1EzzMDd84uq8Fbv+xs8YOYK787bSIHzxU00JF7K
 P+Eze7CUujyIwCIjSoqDVUKbAwHbUjL+CItFLoVQhD8ybQHhQe6mIY8FjkwuuvSnMW0+
 WmxEG6rLBjmiKr0BPerQOCFpJDnzWfSsDvLBvfULkk2fTOlR4+2xIXPHM2Ys8Lc/Olph
 8MIXs5RlXSFfWE3ptXpJTq1EhcDHl09bdZc65SPPfCkFRYmqxswzHJrRTZcgSTzLoLG5
 iLZw==
X-Gm-Message-State: AOAM530sykSe9ZSaYfYCaw245R697zyuahIqoR8e96zq8z7leXYQ6Wdx
 jnWRz0qKjdKkGY3Ce/50iZSE4w==
X-Google-Smtp-Source: ABdhPJwn6ZvGBo3Zj+uG7oJh3C4n8ndDDZO8Lx+buWNryuDkwiOI7oTl6RG79ry/EWhvW7HUBLE4WA==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr19191231wme.8.1599466710211; 
 Mon, 07 Sep 2020 01:18:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 0/6] drm/meson: add support for AXG & MIPI-DSI
Date: Mon,  7 Sep 2020 10:18:19 +0200
Message-Id: <20200907081825.1654-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic AXG SoC family has a downgraded VPU with the following
changes :
- Only a single OSD plane, no overlay video plane
- The primary plane doesn't support HW scaling
- The pixels are read directly from DDR without any Canvas module
- Doesn't support HDMI or CVBS
- Ouputs only with ENCL encoder to a DPI-to-DSI Synopsys DW-MIPI-DSI transceiver

The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
Amlogic SoCs.

This adds support for the Glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
is derived and feeds the ENCL encoder and the VIU pixel reader.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

Neil Armstrong (6):
  dt-bindings: display: amlogic,meson-vpu: add bindings for VPU found in
    AXG SoCs
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  drm/meson: add support for VPU found in AXG SoCs
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: remove useless recursive components matching
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++
 .../bindings/display/amlogic,meson-vpu.yaml   |  36 +-
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   1 +
 drivers/gpu/drm/meson/meson_crtc.c            |   8 +-
 drivers/gpu/drm/meson/meson_drv.c             | 163 ++---
 drivers/gpu/drm/meson/meson_drv.h             |  10 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 562 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_plane.c           |  74 ++-
 drivers/gpu/drm/meson/meson_registers.h       |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 230 ++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_viu.c             |  50 +-
 drivers/gpu/drm/meson/meson_vpp.c             |   6 +-
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 15 files changed, 1176 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
