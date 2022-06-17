Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4D54F1E5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9461B11A9A8;
	Fri, 17 Jun 2022 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682BD11A9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n20so336833ejz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQq40oMN7gmdQC+AT9QDPaFxl7FPBvbWJRNfnUwXKDM=;
 b=WVyrrkfevDNjf+huonwA9B5s9xSQZYZi2r+aZUELTsXXjF4O6vQnCqY+BUEzJzZNRd
 d0LLVZgipLJfHZccSmmrVjXndNOa1A1T+d6hzxJOJMd/SCGtqukb0dzuV+Jdns53yf/7
 Ol4vmMnc60F3iMCAHFSuDmvoCQ3urv9+N5CM04/o0XSJWSQ1PRXCIUrFblifTIVUsAmp
 dGv/7awkXmswiMdpVa6RwYH0fHwxeitYDETgmlTKVnoAQiG14yu2C2+QJfrSz0PYRTpp
 vjsPAciMrBMiuyaIhvkjJbElQzVbnKgUyiXIfEe2s9c38vYjLN3+J649BKh9yggDUtOx
 WeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQq40oMN7gmdQC+AT9QDPaFxl7FPBvbWJRNfnUwXKDM=;
 b=2HJKOJQvQJ/ELVtejXK+b2MAIEYsk1EXjoF4K2d/uhHvXesKzineQhAT7J8kVn1Ufj
 ksFSeZRt2Gcr2N3LhgNawPBIWU3hot+t/n0bK/90ENAQxWKKsY5aaU7hlFOOkgUMBabW
 vrYbwSmwLXztZyvyetdLmui6nVo8oRhS3+iqiVO5iYKA1voVuJx4zh3tT+I5Qzjtv9tJ
 VRC4rn3TcUYXrKO5fCFLbZn9Jklb0QxD8It10Xv1HC591V6kVR1ysnz+hcCqmC0mho0K
 8hWPgfoMVH3Hn1O4WKG4j+Un5w5w6JGJvnUGeOEzTcYhja0eChQ/KzODDo+fkKwcusXg
 ClXQ==
X-Gm-Message-State: AJIora9A/0+ciAx1ikzSuNyBk5otnFwWEYHUBY3iPXlVisbjnBKr4OJ/
 vrxTQj+ZLOXvIoYpKHOLYOQdIsg3IEmtfw==
X-Google-Smtp-Source: AGRyM1sxFqf+ZA9TwaYMiAGjuKdZcewUkcjEfmKspEGGfwpwBFc9cv9j/GszRPgEU+WXq8tqHYmaJA==
X-Received: by 2002:a17:906:2001:b0:6f3:bd7f:d878 with SMTP id
 1-20020a170906200100b006f3bd7fd878mr8116353ejo.133.1655450851577; 
 Fri, 17 Jun 2022 00:27:31 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v3 0/6] drm/meson: add support for MIPI DSI Display
Date: Fri, 17 Jun 2022 09:27:17 +0200
Message-Id: <20220617072723.1742668-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3794; h=from:subject;
 bh=BYC7E8gt4vas7fssyMJgGADHrk4Bwh9RxYGpTB1C8D8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyovMIHKIMtHpx/OwvFBdD5fVOk6xZj4JYrwLfJ
 ZEfcuKCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqAAKCRB33NvayMhJ0bnKEA
 CmyCVZ3hb6HAVePCseiDUslVAYevwqViz8UY2glZksO26r2p8ClzOMmK+cRExDx3CqFgl07CT2+I6E
 Yl7/h0pgvDSwv3pFlN7cXaWitSgG4wH03VelPzbaqBZpSwktLocHfkwN/sSwQyzO49AQtnUdPaYeLQ
 7rOh2oJwxFYJJWHqgab+wznPy5HdPVsAAVEQWZ0pN8jnZ+qUNqIbr3x+m3SMMAYKVl2Ew1eABDSRdG
 ravmDkaLPC/KM5BYPIEtjiPTqYGXRlNT5Q06pLhtkiROP8+tSSSKEkyANjnqpwWaqYQb/8VQRoSEr6
 dqRtcT0eKTeuEZZyYXP2fmQu8N7qg0iZk+Mkz31Hfn4xvB46QIPw6e3lrU/Fn0LrmaA4g+0gasJ0kd
 ukeaRlae2RvDOGKkgzdk+sxh/zGZmy6gfk1SMmY1LQo54YbB6y9XanJuqaeSgdZRYZSKEvZRtWxkB5
 8relb6eqemFt/c/LEPKX61hMczMd9emGFQcnXIums4pXep0vLtFNHWDjZp3IMOW0iPCgzl0/ujCzYB
 +MJw+jngKVAQs3RAmvtNLu8dw2w9lrjViHBHXsph4GAVZDe6WUUguSiV68xCG3v+NrNItohcx2iO07
 CDDpkQfoyCP7E7DaeweqxD5oTxlp/zTml/KNPUQcf2V4XhDnJwUzRoJLWclQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Changes from v2 at [4]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [3]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  dt-bindings: display: meson-vpu: add third DPI output port
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: vclk: add DSI clock config
  drm/meson: add DSI encoder
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 116 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml   |   5 +
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |   7 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 358 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c     | 160 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h     |  12 +
 drivers/gpu/drm/meson/meson_registers.h       |  25 ++
 drivers/gpu/drm/meson/meson_vclk.c            |  47 +++
 drivers/gpu/drm/meson/meson_vclk.h            |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 211 ++++++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 15 files changed, 1117 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

-- 
2.25.1

