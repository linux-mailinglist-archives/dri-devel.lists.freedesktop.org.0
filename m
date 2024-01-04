Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD8823CA3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 08:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385A110E3AD;
	Thu,  4 Jan 2024 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3363510E3AD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 07:24:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-556cd81163fso258872a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704353053; x=1704957853;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUgVC7JEO7GhUBsHaMMn2sIj/0Ni7LYX/30T12HJpq8=;
 b=ec9ZtOJnqiVhMjiXw5MOSRqAIVYRhm5SX5wi1H6HV+wuNu13cS1EiwO/KGIJzxNnf/
 wNKQqVKN/oFShOzwcmDUnoBNBF3losKolGeQ+GTpjaaOaOqIghgXoUrLuN3j39+8n+0a
 tJX5z3qHhuQbrF4Ztg321/6lwJcNQ5mBmDfeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704353053; x=1704957853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUgVC7JEO7GhUBsHaMMn2sIj/0Ni7LYX/30T12HJpq8=;
 b=XLpZJWI2REHMQ179QMyf+lOv0txdi25T7c+3BNdqPFxaiFpzSZoXimlQ4o64LUm+sO
 BDtuIbsdiSKB35TbmuZthCJ53eMjLhW5TWR8DZLxffCKrXp16pM94tK2p/bSBDVB7IR1
 3HnfcD6Sv8T/66ubzXr7v3426+t7oTCwB6FEnMFe+mSkHuuFnXoyfNfpSyAkKeeEwazr
 KSwC19Js8BjmQt3MCZwFaRzT9Imsbiw2YUBQMULjQfHILOB9gyAnFkZ9TFtBqOYy5Lx9
 IfmBgVv9JgY0Faty5Gg3jTdp+k3I4fX5b4TfgP4hDka1hY7cQLmLPnhGNlpaZomJ9psD
 /5YA==
X-Gm-Message-State: AOJu0YyjdU1ZvtUZsNyWRJHrjEsbBji56L5Gk5d0A3cNhSWMmyfDOzuF
 GKUXW5ipZ+HX6Ze9OecHnuRpwTEoXYJezg==
X-Google-Smtp-Source: AGHT+IGmDyP/2rCvEVge4MJPNpo2+Gj+UXFPX8MUKMMpso0SylDp5k3+gnunyyZSiIr2eHvZUnp0ZQ==
X-Received: by 2002:a50:8e49:0:b0:553:ad79:b7d7 with SMTP id
 9-20020a508e49000000b00553ad79b7d7mr54053edx.93.1704353052879; 
 Wed, 03 Jan 2024 23:24:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b00553772c2968sm18530735edu.82.2024.01.03.23.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 23:24:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add display support for stm32f769-disco board
Date: Thu,  4 Jan 2024 08:23:36 +0100
Message-ID: <20240104072407.41290-1-dario.binacchi@amarulasolutions.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Lee Jones <lee@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds display support for the stm32f769-disco board. It has been
tested on hardware revisions MB1225-B03 and MB1166-A09. This required
modifications to the nt35510 driver. As I do not have the Hydis HVA40WV1
display, it would be better if someone tested the driver in that
configuration.

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add Acked-by tag of Conor Dooley
- Add a dash in front of each "items:"
- Change the status of panel_backlight node to "disabled"
- Delete backlight property from panel0 node.
- Re-write the patch [7/8] "drm/panel: nt35510: refactor panel initialization"
  in the same style as the original driver in order to maintain the same
  structure.
- Re-write the patch [8/8] "drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK"
  in the same style as the original driver.

Dario Binacchi (8):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09
  drm/panel: nt35510: move hardwired parameters to configuration
  drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

 .../display/panel/novatek,nt35510.yaml        |   4 +-
 arch/arm/boot/dts/st/Makefile                 |   1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts |  18 +
 arch/arm/boot/dts/st/stm32f769-disco.dts      |  78 +++-
 arch/arm/boot/dts/st/stm32f769.dtsi           |  21 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 422 +++++++++++++++---
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 484 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

