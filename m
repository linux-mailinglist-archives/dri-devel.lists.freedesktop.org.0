Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EC81FFC7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 14:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6410E073;
	Fri, 29 Dec 2023 13:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DB710E073
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 13:52:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-555bd21f9fdso607456a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 05:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703857939; x=1704462739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MzUGxEaP1+NpXvTfTtwZMhBYJcrSPGpvA0YzGDUtLvw=;
 b=FN0HT6VN4La6KqTPG1d7NUJ9vg5h9B4pt376RGPinDLQ2bsyxK4ocH3waffEJtiVQf
 j6507mD54W3FTqZSNu7UI+1LMTUG514+PUAfzRxZ18qHk7r/8RcFwgHls/Rn0GUQhUG1
 lcaHqh7ydXSLler/5WcDIejQgJ1Z2luaaxFUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703857939; x=1704462739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzUGxEaP1+NpXvTfTtwZMhBYJcrSPGpvA0YzGDUtLvw=;
 b=HgHio4J5bzxp5B4SfNDpVuN2rWv34tEIGXRPnzXr50z+5q1hHXqGqjIhFSsyyGIsdc
 T9zhpPIzeD3oGs+sLuijXbYRNXpsoryBWhp/0VA100w3wjBggRuuHgecWvao00TYD//B
 1qHFu7+56OZFR7ibCIezo2CFw+GOCTwcSN+9njTnfb+zuFl2fDPHEWFfa4toO5U7Cvkw
 YbOo8/uI2sjMnpPnIfDgSx/7DVHKpk3x/5KqdWgKniT78nmZVytsYcW4lzblrGjrsywM
 mZr7rdogj6xuOeuHPoW/L0xBR6nrebVQRAOCbEi9meJ2055f7fNgE2uIY9dmaN8CqVyp
 li2A==
X-Gm-Message-State: AOJu0Yzo79m1E71oXIJKcvSdfHmM38Xv+K6MGZ8+41KXoynsVhIvpGw+
 czRg5ImZ2TwQec7n9HlGKiTrHqGo+IJOVQ==
X-Google-Smtp-Source: AGHT+IGKAnJQHr73ga51Hv9Dt4zjqRc48HnDDCm3n7scTC1Qqv8aUw24GfpouEj3L2DFYiFoIwwAnw==
X-Received: by 2002:a50:cd97:0:b0:554:5192:5bdf with SMTP id
 p23-20020a50cd97000000b0055451925bdfmr6826417edi.43.1703857939105; 
 Fri, 29 Dec 2023 05:52:19 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-49-57-70.retail.telecomitalia.it. [79.49.57.70])
 by smtp.gmail.com with ESMTPSA id
 i16-20020aa7c710000000b00553b243b1a8sm11019160edq.92.2023.12.29.05.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 05:52:18 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Add display support for stm32f769-disco board
Date: Fri, 29 Dec 2023 14:51:15 +0100
Message-ID: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
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
Cc: Tony Lindgren <tony@atomide.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Sean Nyekjaer <sean@geanix.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds display support for the stm32f769-disco board. It has been
tested on hardware revisions MB1225-B03 and MB1166-A09. This required
modifications to the nt35510 driver. As I do not have the Hydis HVA40WV1
display, it would be better if someone tested the driver in that
configuration.


Dario Binacchi (8):
  dt-bindings: mfd: stm32f7: Add binding definition for DSI
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  dt-bindings: nt35510: add compatible for FRIDA FRD400B25025-A-CTK
  ARM: dts: add stm32f769-disco-mb1225-revb03-mb1166-reva09
  drm/panel: nt35510: refactor panel initialization
  drm/panel: nt35510: support FRIDA FRD400B25025-A-CTK

 .../display/panel/novatek,nt35510.yaml        |  20 +-
 arch/arm/boot/dts/st/Makefile                 |   1 +
 ...f769-disco-mb1225-revb03-mb1166-reva09.dts |  13 +
 arch/arm/boot/dts/st/stm32f769-disco.dts      |  78 +-
 arch/arm/boot/dts/st/stm32f769.dtsi           |  21 +
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 872 +++++-------------
 include/dt-bindings/mfd/stm32f7-rcc.h         |   1 +
 7 files changed, 362 insertions(+), 644 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
 create mode 100644 arch/arm/boot/dts/st/stm32f769.dtsi

-- 
2.43.0

