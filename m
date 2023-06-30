Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09B743FB4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBFB10E182;
	Fri, 30 Jun 2023 16:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757D210E182
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so22901565e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142559; x=1690734559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kx9jwINsXynT9xYRg2h3H3ifzA5sFvWLT1WN3/8C4lc=;
 b=j5qb6MNlO7QpZUWIfZPtZTarvlKiW0T3tJg1j4USkqToGimjZIFgs8/Y8xd6WkbcjF
 s8RuYSlI+4dpa0WzZMmGdy6DkoVSJIHiwX8EIKh7gZrZJOwh4ohZqXxnpKk/C+5NPXbU
 +Z4skyWDZD6YioymPTa6jsgU/02dLHhF61LjnHtRK8koMUGZrptr40i4Iw5xlVgubCRe
 Vj3XGvC6rDKIM4wdCinKo7uwPIVAUmNdXrwD3vGB+Sm4r5irOFYsPvCg3a04aFjY+F9z
 aL1h79/ocUs/UuAB6n4JGAAxj4NglyesHf1cGeZp2/PoaalkSnQfPw2o7dfSe5ZsEvpp
 FvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142559; x=1690734559;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kx9jwINsXynT9xYRg2h3H3ifzA5sFvWLT1WN3/8C4lc=;
 b=KGqvikxWu37Y6KDG+zdWq7fF+O4djtnOiOIIO8OEIvGYI/vANhTmwHSajqeEXg9y5R
 OylYzcOgwgRgFJSeIpw6F9OJAynAVhjIFgTgC7IfuahMYEAPn0NFaDPzUYhWndIxelYc
 j90oagrqYDJS0gtJSm/DMKvtw9FlBNBhTPYXiBD8MyQswDHtXvMTfG8QZqxHgPn1JJot
 IsfhrgkNT23NB3mKHCGgjSidq3G1mpeMf7Sg47U+E/j2yj3AFgelpIIC4nwCnVm0ySj3
 Lpafp8avdAX0TOwr0VoHECZkXD2M6TwraaCM8PXWYwgBl5WPE1WXdjWiHfUjLjE4puL2
 wH4A==
X-Gm-Message-State: AC+VfDwOSWP1rBR10NoO8xH6W3IiJItX47V5ffE+AvqyzIExXZl4gFwz
 rqmkEo/q88JV0vhBmyWycmu1xA==
X-Google-Smtp-Source: ACHHUZ5RuRc3hXLqWe4gbrbDsWZogKmRY9nZUJg0bSPHqjXea8yKM12vmyiLfNgxlF/HtV9lIxVwzg==
X-Received: by 2002:a7b:c38f:0:b0:3fb:a46c:7eac with SMTP id
 s15-20020a7bc38f000000b003fba46c7eacmr2392722wmj.7.1688142559167; 
 Fri, 30 Jun 2023 09:29:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/9] drm/meson: add support for MIPI DSI Display
Date: Fri, 30 Jun 2023 18:29:07 +0200
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMCn2QC/5XPPQ6DMAwF4KtUmesKQkJ/pt6j6mCCAUuQoASiV
 oi7N7B1ZHxv+J69iECeKYjHaRGeIgd2NoXyfBKmQ9sScJ2ykJksMp1LwKF3LRuIJSiYxzB5wgH
 qwGBMA5GHAqobaZlfKW8UigRVGAgqj9Z0ibJz36dy9NTwZ19+vVPuOEzOf/dDotraQ5tRQQZS3
 6WRd0JZFs+eLXp3cb4Vmx/1cVMnU5dUXVHVOn31Z67r+gMUcLX4PgEAAA==
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5161;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KfaJiJcLkkgQCw9HdRYTgcdAd/F8lTdn4g+NwaXkFxU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLZyBY0mgaxL7PeOcmDOMaYMgLFO68JTmPi+N8g
 RPOmrPSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2QAKCRB33NvayMhJ0QGID/
 9P6um3EqQ+k72K5UqyMiHK6j21kWBVguqjDVTj/c0DeTJQJvxMMGbNgkZ5ZpTks5d9FH6N21kwp3WM
 emuBApDfHYWCAHZgX6fL+9u2sI8TzzI+3wJZLeFWA9I+t6SYxUf9V5hka2twlKlh0rvZlWSlgGPpQM
 bmJpt0UgKkuYLXK60DCI4co/OfPivOcAZHOeiq4rEX6AwsRCBuP2VTyFrwcoQBs0+6+VL8raX/zM8c
 z6dt1X46a0KmeVKQn6ZApWAPGp4bOXc60bYxDrtGCSs/wD7k7YIj9o0q89aBK1P3J0KuCMGfz6+G+R
 rxeObm4iOJd3tGdM56pinMvvZWtaC/o1QMV7uElq3aTAPz9+rJKcelrySd4UmN6O4AW8SmjiRnhUO4
 EolVjb5bJZfSifsSCCGgA23eFav+NwjisIw/ANOd+1HeEpILg7r1lhkP181urJtqyw2eOdoB/LJ+r7
 AS1xPAz9/MGUwJpVXqZn98Pll4+A8WTjurO0dh1+BEB44FYNcoz2SpLaSLQkhhH2MdeWza0DVSRLEE
 qsDIZeFRH5LGokG0Plotm8TfxmkBFtDqpNbERD5Qlb/HoKWLT5wlUDlB+DwOiiWKKpneLIByL3tloP
 x8FSe+ZjRXI3NLe3hoL1wORK9ufRVmgl3jsuCUi8p1GxOZjnJQdeH5vhrNlw==
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
 "Lukas F. Hartmann" <lukas@mntre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Depends on clkid public migration at [4].

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
[4] https://lore.kernel.org/all/20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org/

---
Neil Armstrong (9):
      dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
      clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      drm/meson: gate px_clk when setting rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      DONOTMERGE: arm64: meson: khadas-vim3l: add DSI panel
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 388 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |   2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  76 ++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |   2 +-
 drivers/clk/meson/Kconfig                          |   5 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           |  81 ++++-
 drivers/clk/meson/vclk.c                           | 146 ++++++++
 drivers/clk/meson/vclk.h                           |  68 ++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
 include/dt-bindings/clock/g12a-clkc.h              |   2 +
 14 files changed, 832 insertions(+), 18 deletions(-)
---
base-commit: c6eb67de8578186066a9a3e947edf95e6fc56ed7
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

