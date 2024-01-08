Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5EB8278FA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 21:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C229F10E05D;
	Mon,  8 Jan 2024 20:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13A910E05D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 20:16:23 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-554fe147ddeso2561883a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704744982; x=1705349782;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=470HE3R0eHCn9Vp1B3I9DAfMXHgYPXc2oiMu7MIw+p8=;
 b=Pcl7qj4T1YIMtnkCwfyja883r7oJc9nSiTrfVCcpqYAy2ZXqXvg2sUw0LGwTiNL49V
 PEZhXliDP5xn36cnpbwmqgWh7F81eQDfazwHOh3AMFDqrj7pXSrg4+Q+7fTB+mQtVEfL
 47EF1YTTShjc1yy5hvBZHKGDJ7H7ZSpQ8byiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704744982; x=1705349782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=470HE3R0eHCn9Vp1B3I9DAfMXHgYPXc2oiMu7MIw+p8=;
 b=h8J2bsNqAAmoWz6+iCrzi32GOD3wkt4QUzxEtq1ZQ+9M4mqNYE1a7s4BBzezp1dEF1
 8U0dMayQKMYYrA/b9K/2xk3+5CWJyqIrVZtM+ZIq/etTcCvPpN+2UUASJ/VmIFWFninJ
 hDdhWCc4guYTFFPG/PXojkvO3rGgYTaJjdLGTTrQY2o81VhIpGCcTvgSNxoGAAU5CO5T
 GrfZlUHM/RJYsQVRhFUU/O9Bd1vO7t1LvXCvb2/A/9d3emYjwcnR0dNIRNS5u8s33if7
 IiknctS6amoDnpdGYVm4Fctz6K86Tt2Qk2Lw8zLjnJxRkcJGdSvO3mVHxjE23NEkMsVu
 CoVQ==
X-Gm-Message-State: AOJu0YxeQjJwNz9Q34vyWOYjT32rII2l3SMZJnZ6JczDPSX5WDkVigBC
 gp93948vPNtSid75jGEubZItys7bapWhtg==
X-Google-Smtp-Source: AGHT+IF2ZasPZ/p6zpGvkUuRiRHfFlzGs6nWLvVv8dVV9W/VrEMy2+3FKeFaVhCTnVVhkhLLqSbRDQ==
X-Received: by 2002:a50:8acb:0:b0:557:8ab7:40 with SMTP id
 k11-20020a508acb000000b005578ab70040mr1035120edk.168.1704744981995; 
 Mon, 08 Jan 2024 12:16:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-2-38-81.retail.telecomitalia.it. [87.2.38.81])
 by smtp.gmail.com with ESMTPSA id
 by26-20020a0564021b1a00b00555fd008741sm173699edb.95.2024.01.08.12.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:16:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/8] Add display support for stm32f769-disco board
Date: Mon,  8 Jan 2024 21:15:45 +0100
Message-ID: <20240108201618.2798649-1-dario.binacchi@amarulasolutions.com>
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Lee Jones <lee@kernel.org>, Sean Nyekjaer <sean@geanix.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, Peter Rosin <peda@axentia.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds display support for the stm32f769-disco board. It has been
tested on hardware revisions MB1225-B03 and MB1166-A09. This required
modifications to the nt35510 driver. As I do not have the Hydis HVA40WV1
display, it would be better if someone tested the driver in that
configuration.

Changes in v5:
- Add Acked-by tag of Krzysztof Kozlowski
- Add Reviewed-by tag of Linus Walleij
- Replace NT35510_ROTATE_180_SETTING with NT35510_ROTATE_0_SETTING
- Add Reviewed-by tag of Linus Walleij
- Tested-by tag of Linus Walleij
- Replace GPIOD_ASIS with GPIOD_OUT_HIGH in the call to devm_gpiod_get_optional().

Changes in v4:
- Put the "enum" list in alphabetical order

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
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 424 +++++++++++++++---
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 485 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

