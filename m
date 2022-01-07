Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE197487946
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 15:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF5D10E89E;
	Fri,  7 Jan 2022 14:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9AB10EED5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 14:55:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so761181wmi.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 06:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OB1egdVUErhbIEcGNr9v6weyeR2HVWTfX0w5sfnPT8=;
 b=23kNyt/oSxQ3KeKDbsaqaKBfUsp7ntvPK7l7R5DcvRrrqteLCLDOIUE2EXy9y3cwUT
 U+8Sy4kng1/ON5Oe9tj4doiMQgEOEbnXm5z8qMDlQRI0uzJ49jI5+rbHkHkxYklybntN
 y08Kq6lTo/wN18Ypin7P+UVZcwhXtTr/W6M7qdtpfrIO0LqdYl4nWyNREV91skSSDnOd
 +KYL4/0GpLtBY/IMfMgZixsZ7Wq05QS+bClHOp5ZCB8xQCgWTecCB2mptOyqS03LxWr/
 L1M0GJZhxlRdVvUxzeQQpNY79cEk8PzkxAj6KNB7okRa66QcERl76iFqKRG+xxh2U5ws
 xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OB1egdVUErhbIEcGNr9v6weyeR2HVWTfX0w5sfnPT8=;
 b=Iymih7HhxllAdO67gn/4qUUwoPSo9wdBonItXbM8RAZFcOfwMFZz6g+4dZsE0DYxP5
 5P9rOArFGfg3Be+QuTnWOtsOWUi6OXGgiTMhZLNizW9lzx4QxF6dYJMx8AZL05Lvlxpd
 O2ZIotAY/IJB04desTgf0GkbN516YeGkdSNLt5aW7MWu0SuSbPc/1JZ3v83g/WMLR+j/
 2qqruTG0u3UYoMP2ta+4tZODNJhsk4/MLHBBx3RflQShQaNeIIFejwvJnudvsWTcF9rG
 HseC4FXd7sT+I18AG5j4veZNEBtgXxjD/Yr4Lx9400WRzcLd11i8lDEQPMjZB+UkQ0CN
 7S8w==
X-Gm-Message-State: AOAM532ZQ/uE9ciB6V5fJ6BXqUTsOY4RkAwgstO1Lkx49Uu3ZbiuNi/J
 8LAiHObRqhJ2kvkN3jnEJkcWzTr1LQBk8A==
X-Google-Smtp-Source: ABdhPJw/hF0g74U9jqW1SRjLFDdY6ypEE7h2nALHUm54k6OflJfKc5qsDc8wlGXt8MIhuedZT5cEJA==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr837414wml.50.1641567324545; 
 Fri, 07 Jan 2022 06:55:24 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:24 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/meson: add support for MIPI DSI Display
Date: Fri,  7 Jan 2022 15:55:09 +0100
Message-Id: <20220107145515.613009-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- the AXG has a single clock source for both transceiver + pixel, which makes it an
  exception instead of a rule, it's simpler to add support for G12A then add AXG on it
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  dt-bindings: display: meson-vpu: add third DPI output port
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: vclk: add DSI clock config
  drm/meson: add DSI encoder
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 118 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml   |   5 +
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |   7 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 383 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h     | 115 ++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c     | 159 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h     |  12 +
 drivers/gpu/drm/meson/meson_vclk.c            |  47 +++
 drivers/gpu/drm/meson/meson_vclk.h            |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 230 ++++++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 14 files changed, 1092 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

-- 
2.25.1

