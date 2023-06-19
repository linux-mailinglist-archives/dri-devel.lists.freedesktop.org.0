Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AA735C76
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 18:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934E10E221;
	Mon, 19 Jun 2023 16:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B894810E221
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 16:55:35 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-76241c98586so282318085a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 09:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193734; x=1689785734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7c41/bHT5/tFLz1vS2dSA0XEpnWz70oHsIq3qIfRkDg=;
 b=S9h89TIICRrr9urRyxkGPxg0pQMos+Ew4eyrnlhGAsTdrj9u8CsXILBMHfxlU7CPRA
 MlvBX16u/Pe5p+tRlks2G3BeNtr8MSkOlCdEduf+udO69nQpBqWdvZm7vfzyiJKtXCKm
 +m/FKU5TZTwkArCuraEa9SXh2BfvfGOdigDtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193734; x=1689785734;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7c41/bHT5/tFLz1vS2dSA0XEpnWz70oHsIq3qIfRkDg=;
 b=PGwdZoadxUd2SBRJGy+nhAUoW2Y+pgr2MtFNBW/FEevqLCoqw/QWsKiDnRIjQPk/rm
 25F8bYIlQ1agBJR5rQo2zZ9Pgb8GgDH6cYe9RmyczC2iAs4m1t1wCWZ1svPohiKU0NWk
 MVducP0+/xoaEnp2DPWuaItv3eY1MEL/2Gn6HkeYQubi6K02SfnvBcqgBqGW9J8uqFj+
 Bbn1b9Qb/kuE1csfyNvhp5s9gzvv0vfdSA84lkJwc9sLUua9VX3U6bo4/stvcGZ+Ki+9
 A7CvHyF8Ia9MfLLNNIQ3xZsu/AdQ1UUi8ZbUi5BLm2CFm0nBGFcL3cEtn2WHHzLs/wuh
 wBLQ==
X-Gm-Message-State: AC+VfDxSrXh0dOTVdua7krZjZQmVXxh4veEeog5lCZBWpw7gOHdTtKQk
 a2gmaCpEEU7QW3cU+BsCGhiCTA==
X-Google-Smtp-Source: ACHHUZ4sTAr3fMXBOvSLg9lwFYSVkTHAYf5eM0y/vpSON2lPB1hmZtTUmjdP6o3pvxtzCVlRsK/uFA==
X-Received: by 2002:a05:620a:8e04:b0:762:55f7:7105 with SMTP id
 re4-20020a05620a8e0400b0076255f77105mr4382806qkn.28.1687193734044; 
 Mon, 19 Jun 2023 09:55:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add display support on the stm32f746-disco board
Date: Mon, 19 Jun 2023 18:55:19 +0200
Message-Id: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds support for the display on the stm32f746-disco board,
along with a generic patch that adds the "bpp" parameter to the stm-drm
module. The intention is to allow users to size, within certain limits,
the memory footprint required by the framebuffer.

Changes in v4:
- Use DTS property instead of module parameter to set the framebuffer bit depth.

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

Dario Binacchi (6):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  dt-bindings: display: stm32-ltdc: add optional st,fb-bpp property
  ARM: dts: stm32: set framebuffer bit depth on stm32f746-disco
  drm/stm: set framebuffer bit depth through DTS property

 .../bindings/display/st,stm32-ltdc.yaml       |  6 +++
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 35 +++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts         | 52 +++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi              | 10 ++++
 drivers/gpu/drm/stm/drv.c                     |  6 ++-
 5 files changed, 108 insertions(+), 1 deletion(-)

-- 
2.32.0

