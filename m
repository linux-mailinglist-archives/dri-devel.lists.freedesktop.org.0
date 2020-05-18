Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D31D9090
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 09:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284826E523;
	Tue, 19 May 2020 07:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3784C89EB8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:09:33 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id q9so4874298pjm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3zI5HGtvH1cCa06adBLKkRdZTB7qi9iI++h4rVGXoVQ=;
 b=HJY3neypi3+TIsjpyuiDC8hy4/upfiEWcq40/l0Lp9xQGeWVb0iYXXUoiV32a0UfOx
 lu5BLDGjNCw2X/o1YuMG4LS/EfeA2LOjChMyzJnIU0Hfrc4LNCibrT8JnOzEw43O+rVW
 StEU40F1Uk5X9eHlZec6AFvK4eBTxzH7PzPqPJEHpvrLOkKazHs49FgrO8SxREjbBEOp
 YqXWF7Ys0rR4twTJqIsEddUR3FiPqAxHk1P+Kxigo2oMm7v7/0OtHxaRUTpN3GFz2HzB
 lIwoNbmDFav/7RevcdwGKQ2mbFRtM8pn6AARVoPJAXb3pud0ltZ2LVv1mShqbzv8IwFo
 DaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3zI5HGtvH1cCa06adBLKkRdZTB7qi9iI++h4rVGXoVQ=;
 b=J1Qtj84RspBvMw0fi5QlD2M3X1PfS6pmB4by/vjd4JYkd2rIPgJUJ2Tlvmx6e0kvr+
 U9/mXhc9iQrdyifWXL6yWpPNPpoIybPLFN0OCtPAb70rtqTHnyyYuljOfvsN4domMjjw
 ICeQ+dHcOIuOZ7R9Fg+shzPrYAW29p/PtvouxOqX1Nry8ApA1W8Bm/BqQiJLfABmR6XQ
 0uP3SiGqwJaf5nwuPSVrBtsD/bM7e+IIjT4Diu4QE5P7EJHHSbPYY1D8vR63yk3jHpmp
 GCef8CUQuot32nCD6UPOge1Renmmb/gaBmbhPfizxek8dGhJR8BLkIWeql84mD8+sSOe
 D9jQ==
X-Gm-Message-State: AOAM532OSiqKxnp0ucv2esPZX43qx6a2S5f6NjzSgHo6RG7wBQVC5R/c
 +l4ljeKNeyk5KbJ9PhvNVBI=
X-Google-Smtp-Source: ABdhPJwsakR+sWqcKZA6S7nkXZrnKWW5pNyRPRmYvzj0mHY2ZT391adIsBf9mDJWpeyUO1sOeAJMOw==
X-Received: by 2002:a17:902:cb09:: with SMTP id
 c9mr4315966ply.95.1589800172767; 
 Mon, 18 May 2020 04:09:32 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id a15sm8290630pju.3.2020.05.18.04.09.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 May 2020 04:09:32 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v4 0/8] Enable ili9341 and l3gd20 on stm32f429-disco
Date: Mon, 18 May 2020 19:09:17 +0800
Message-Id: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 19 May 2020 07:00:27 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

According to alexandre torgue's suggestion, combine ili9341 and
l3gd20's modification on stm32f429-disco board to one patchset.

Changes:

ili9341:

V4:
1 update ili9341 panel driver according to Linus's suggestion
2 drop V1's No.5 patch, sumbit new changes for clk-stm32f4
3 merge l3gd20's change to this patchset

V3:
1 merge original tiny/ili9341.c driver to panel/panel-ilitek-ili9341.c
  to support serial spi & parallel rgb interface in one driver.
2 update ilitek,ili9341.yaml dts binding documentation.
3 update stm32f429-disco dts binding

V2:
1 verify ilitek,ili9341.yaml with make O=../linux-stm32
   dt_binding_check
   DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/
   ilitek,ili9341.yaml

V1:
1 add ili9341 drm panel driver
2 add ltdc, spi5 controller for stm32f429-disco
3 add ltdc, spi5 pin map for stm32f429-disco
4 add docs about ili9341
5 fix ltdc driver loading hang in clk set rate bug


L3gd20:

V3:
1, merge stm32f429-disco dtbs binding with ili9341 part

V2:
1, insert blank line at stm32f420-disco.dts line 143
2, add more description for l3gd20 in commit message

V1:
1, enable spi5 controller on stm32f429-disco (dts)
2, add spi5 pinmap for stm32f429-disco  (dts)
3, add SPI_SIMPLEX_RX, SPI_3WIRE_RX support for stm32f4

dillon min (8):
  ARM: dts: stm32: Add dma config for spi5
  ARM: dts: stm32: enable l3gd20 on stm32429-disco board
  spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX' support for stm32f4
  ARM: dts: stm32: Add pin map for ltdc on stm32f429-disco board
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: enable ltdc binding with ili9341 on stm32429-disco
    board
  clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate.
  drm/panel: Add ilitek ili9341 panel driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |   69 ++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |   67 +
 arch/arm/boot/dts/stm32f429-disco.dts              |   48 +
 arch/arm/boot/dts/stm32f429.dtsi                   |    3 +
 drivers/clk/clk-stm32f4.c                          |    7 +-
 drivers/gpu/drm/panel/Kconfig                      |   12 +
 drivers/gpu/drm/panel/Makefile                     |    1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 1301 ++++++++++++++++++++
 drivers/spi/spi-stm32.c                            |   30 +-
 9 files changed, 1530 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
