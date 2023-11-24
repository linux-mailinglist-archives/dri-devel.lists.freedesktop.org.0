Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D7F7F6E75
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FFE10E7AB;
	Fri, 24 Nov 2023 08:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5B10E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b2c9ee8ecso11256185e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815284; x=1701420084; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=axwYlr1bCa93hK6yfJSQRUDafBt7qvRd8i2tcyYFqRQ=;
 b=Rb3n/DOuu1+8aBpM/3nkIxdG+ix0jXxAeTjvW3tAzKtgcxbYpAUKNHTVxMxS9auU41
 XFZiBnMhsgnVMX5yB3frYOdHBP80qt4j4lZCOthlvMouHzjjomfZFRCP6Gdfai+ZbxEH
 Le02IXN7j54TcRNflWRTczE4tNoukDUyuCY8oga4zQK0W/X0RXpdqBAwnaG9WZUHoZkd
 bWCHj4Qzmjs8tnloLxexcNswJbDoviho/A/yffNj3UTzv9WJASMKrRiLcw/RK0mdi8oP
 g1GtzEecmx9JwdjRcUHNCORKrw6X6W7IW5DL/FW4OiN4ujDitpg3WR3U2SJYYVwOZb4v
 RkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815284; x=1701420084;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=axwYlr1bCa93hK6yfJSQRUDafBt7qvRd8i2tcyYFqRQ=;
 b=CXjWhLEQ+hod/dqX+QkTjvWdzXEm2E7qYpyhoizZ9/37Yg8TpY0BWCopezXMM9AXWV
 n2hkoVrIahV0iMqrJHeU/gFVFuy/EL9RPYi+YryZIKWR07Nn7t1nOuVo4V15lie07Fze
 VbQnbTErQAbMohToHJY53eB4PTywDa2qCFVemP95Ul022321w3FQoz6o79jK5HFQXLs0
 jD1lUq4Kj9tIrXYFQSDsWItUaxfbp7VmULHENDhlugfWZeEMBuoc3G3r1ETT7vwodzHu
 OZwxy/RJ0EZqsIGYV8rggxCnp1yXkNrzE4L34H747ZWrFOmyuhmnJ0JhTBIh2WOGn0I6
 /jcw==
X-Gm-Message-State: AOJu0YxeeJhKtKHuchQKDpVQBHnJccfPbZrLaoERb9Bs7oR99WCkvIpj
 iYD1n/cKK0PPfN+OAtdGtYef0w==
X-Google-Smtp-Source: AGHT+IEbECRcfFn8Tv9w0aix64bVk4Z7Vzv1zyGsggCrjsdyTitl8vEspNSq8vim5E4B3zb75pngEw==
X-Received: by 2002:adf:e40a:0:b0:332:cfd2:7639 with SMTP id
 g10-20020adfe40a000000b00332cfd27639mr1603211wrm.4.1700815284368; 
 Fri, 24 Nov 2023 00:41:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v9 00/12] drm/meson: add support for MIPI DSI Display
Date: Fri, 24 Nov 2023 09:41:11 +0100
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdhYGUC/5XQu27DMAwF0F8JNJeFRevZqf9RdKBl2hbgRyAlR
 ovA/14lQ4vCSzxeDueSvInMKXIWb6ebSLzGHJe5BP9yEmGguWeIbckCK6wrLRFoGpc+BlgNKLi
 e8yUxTdDmCCF0sMaphsaxRmlZdopEgRrKDE2iOQyFmq/jWIbnxF38ejR/fJY8xHxZ0vdjkVXdp
 4c6VwUVoPYY0DOhqd/HOFNaXpfUi7u/6uOmLqY23FhSrS5X7Uxz3DTF7Fqk4J3SyuLOtH+mq+q
 nTFtMaxCl74Ju0O1M92tKWfmnTFdMJ1kRc0vS///ntm0/41yx6DoCAAA=
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6282;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZnjfOI3WSO0rOco0IigvGUbmHbM2NTBxMdUeyUtjcWg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGtniBD2x6vzCki/lGoDJzrGQoY5iWAZYc+cogm
 PLzBnqqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrQAKCRB33NvayMhJ0WCuEA
 CJifvnOZoVYf7kd/1H2LKGSmsTEHrfzFdLUeFTm7StRyRJK6pNyOuij2PONS4DL4Z+8fQ/Gb/sjzUX
 1DPBUBcaiy5m85A4HWKhetikRqbQBteXYUgSHBrjZmleoG3yS8ubi0OQQlTLo3dH9Hur862BGeH2wv
 N2WJ9MrMDrEbbtuCjS7r2kLky6SDzEZ/rTa62pCTw3rtvCSyIiZH4HJGVzrylovObus4sBgxQoVQBF
 KuSSuvbGG4ZocPCThx3txD/P/ya64vMeBDKdryNqqb3eQkl3OJTo+vJXguubjDxPM71WKafiFVX93a
 UxAu6TgM4IEYyAsevvcrBrq28LLN0f/y+dm7ztDz3Kr/0beEUJiorWWrT122QjOWXDNA3z/AtwjQTS
 2OiLwroiWicYe0fXBXMKMrK7RbZP50yKoiCJ5OwDJvBKvbhhvwp8RTi71xVzWQRHS24ArMadpDl2M5
 ebqQRK3go0rq8OwkoIwyctIMar82NiZnbmY+FbmjJIprnc9bjMhfMGeIBDxy5hvKIznZnFTxbSjNal
 g9WseVhW+s8EQpziJchF8IawbOD20ZoXIvhFoeVCp5EMY9eqKl+SAnsXvjuFhxBL0xx7Wrb3LofLRE
 VP4QzuYSHCuu5Ghw1tROBVzFkNBwGaNJHpc0dWaWq7uU/zQL+LuWboUbS0HQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
remains for a full DSI support on G12A & SM1 platforms.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

The clock setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

The change from v5 is that now we use a "VCLK" driver instea dof notifier and rely
on CLK_SET_RATE_GATE to ensure the VCLK gate operation are called.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v9:
- Colledte reviewed-bys
- Fixed patches 2 & 4, commit messages and bindings format
- Link to v8: https://lore.kernel.org/r/20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org

Changes in v8:
- Switch vclk clk driver to parm as requested by Jerome
- Added bindings fixes to amlogic,meson-axg-mipi-pcie-analog & amlogic,g12a-mipi-dphy-analog
- Fixed DT errors in vim3 example and MNT Reform DT
- Rebased on next-20231107, successfully tested on VIM3L
- Link to v7: https://lore.kernel.org/r/20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org

Changes in v7:
- Added review tags
- Fixed patch 5 thanks to George
- Link to v6: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org

Changes in v6:
- dropped applied DRM patches
- dropped clk private prefix patches
- rebased on top of 20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org
- re-ordered/cleaned ENCL patches to match clkid public migration
- Added new "vclk" driver
- uses vclk driver instead of notifier
- cleaned VCLK2 clk flags
- add px_clk gating from DSI driver
- Link to v5: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org

Changes in v5:
- Aded PRIV all the G12 internal clk IDS to simplify public exposing
- Fixed the DSI bindings
- Fixed the DSI HSYNC/VSYNC polarity handling
- Fixed the DSI clock setup
- Fixed the DSI phy timings
- Dropped components for DSI, only keeping it for HDMI
- Added MNT Reform 2 CM4 DT
- Dropped already applied PHY fix
- Link to v4: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org

Changes from v3 at [3]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [2]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [1]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (12):
      dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
      dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: add example covering meson-axg-hhi-sysctrl
      dt-bindings: phy: amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop example
      dt-bindings: phy: amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      drm/meson: gate px_clk when setting rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../phy/amlogic,g12a-mipi-dphy-analog.yaml         |  12 -
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml    |  17 -
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  |  33 ++
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  74 ++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/Kconfig                          |   5 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           | 106 ++++--
 drivers/clk/meson/vclk.c                           | 141 ++++++++
 drivers/clk/meson/vclk.h                           |  51 +++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
 include/dt-bindings/clock/g12a-clkc.h              |   2 +
 17 files changed, 858 insertions(+), 51 deletions(-)
---
base-commit: b0b93834348aaf1a6e14693b4f1d17d3ec024257
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

