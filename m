Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500B2728FD6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822BE10E08E;
	Fri,  9 Jun 2023 06:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8655810E08E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 06:21:05 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-516a0546230so2125521a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686291662; x=1688883662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s0KsiO4chph33S79F9ENBTiIdHIAq8Drk63634LLZQs=;
 b=kbV4G7FpeyKX8vqSKQVxCHgnfKl+l276t269BAHAwJ23WxJ7nO/Oasy+9J5YumKyca
 T0uhyyudNLhM+w7pc9FA736CWqmxTkyTSsXqXOdfoQrYeO1IEHkoZSz4uKQsYCPrsTwM
 ULacDwUYyqRuKtDEU6r//KnkwN3AFNWxWIfls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686291662; x=1688883662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0KsiO4chph33S79F9ENBTiIdHIAq8Drk63634LLZQs=;
 b=PpOk8nFGkcSX6sDs32uBgsV5yHYnpClQEQ9w6zTLsL0xSxQJyov0TC5DT4RX9Q7tl+
 jwW6STQl5tWJPebz3JVbSJwgF0J/C86CUJFPKo8yB4lW3xezBnYbnKF6VIdrmE9s7m7x
 Sj9zWuTy/jiYqAVPk3wxioUJ9smzjVUSvoVnCmj+rm6R6uDad3oDf5CZodxOpXt9Lq6v
 DCLPCZrngnBcT+jvM+Tv0pFD0vw53aluSIuLUoVibwB/cS0zKeEi89eoDzKkuBvhWl6/
 A0iMVGCoUf/xOlxfx1i0F4pVqy72TQvd8HM27GuJb9rAUru8Z4qG+yMj3Ywl6NTxnOvH
 Dqig==
X-Gm-Message-State: AC+VfDwNxEYb1yFPh9oopyQ++qT6x+2YPDEiHguvC2wRuod7xC6e4svi
 Sr3lAY/Pez1dKyJYVD8JbX47SQ==
X-Google-Smtp-Source: ACHHUZ6l4dLtGlhnWIwTWUWwtNlYtOyR1yl1ptA5SoQD+GUUgf1U2scpLgKXakdx81uLNojiuXQ7iA==
X-Received: by 2002:aa7:c44a:0:b0:514:bc92:8e1d with SMTP id
 n10-20020aa7c44a000000b00514bc928e1dmr392209edr.14.1686291661889; 
 Thu, 08 Jun 2023 23:21:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 m7-20020aa7d347000000b005149461b1e0sm1380058edr.25.2023.06.08.23.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 23:21:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add display support on the stm32f746-disco board
Date: Fri,  9 Jun 2023 08:20:46 +0200
Message-Id: <20230609062050.2107143-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- rename ltdc-pins-a-0 to ltdc-0.
- drop [4/6] dt-bindings: display: simple: add Rocktech RK043FN48H
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next):
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=c42a37a27c777d63961dd634a30f7c887949491a
- drop [5/6] drm/panel: simple: add support for Rocktech RK043FN48H panel
  Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
  https://cgit.freedesktop.org/drm/drm-misc/commit/?id=13cdd12a9f934158f4ec817cf048fcb4384aa9dc

Dario Binacchi (4):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  drm/stm: add an option to change FB bpp

 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 ++++++++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts  | 51 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi       | 10 +++++
 drivers/gpu/drm/stm/drv.c              |  8 +++-
 4 files changed, 103 insertions(+), 1 deletion(-)

-- 
2.32.0

