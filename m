Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D0725432
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 08:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3410E42C;
	Wed,  7 Jun 2023 06:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46C10E42B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 06:31:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30ae5f2ac94so6855523f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119503; x=1688711503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=M7Y9qbOgr2mCzPYbaTG2gTTgpe758R7rQlGfASKS5JQv7ihIt9vNrw/L7whQ9Ujgb2
 5OsGaVMznTABhT+h2tEiJSyBIK1GlpO7P/n1vVgeBxLFIDtwRjdHE6vLDhT7+BWdpFMj
 WG7dUZTg9+7/DB9QL5QDyO4hDjtU6LePF3u9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119503; x=1688711503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=iequUQlj5MrRaUUEYHwx3jNzrs1JOkaolnGDTWoEQxdtUr0KxlV7eVWG72thf1YJ2e
 AtTrEzqDiCCC+glzxfK6v6OmmPCvZbw0ToQAZLPFd9I5Yt+J1sOf2ra/vwT+2iRO6DwJ
 FR9PEVGAqqfXTBXEV9KIylWxNVRNpQ3QX/ZcWG/QuDaZ02B9V6IZ3kDA0owLX2T+jxU8
 Q2gcm2PBrrUXrbJ0l/XvSH/YXAaQwdGuUb712Vaihr2MN/l6EkNEVJnsvBkX7atPSHwX
 s2iJCC/1f6LPgMpDPGSMMWHN1OWU1BIJFZ1+Q3Gu6j304AjVij52BGObfC8O+w0C6IIv
 qTDw==
X-Gm-Message-State: AC+VfDzpoFJJIj4DZJD3AsXla6lsCKuWNifW74tnxfqZDOwlkMdPknXl
 MLYitq6a3S/fQ6BiRJEDf6Vlzw==
X-Google-Smtp-Source: ACHHUZ7EBKC8ivl2FMOsG5mX9X/Fuw2ks1BSOq8ZukumLjV6wxbR5wx5KRK++ZkvEZChP06D2V6KKw==
X-Received: by 2002:adf:f0c8:0:b0:30a:dd26:63cd with SMTP id
 x8-20020adff0c8000000b0030add2663cdmr3825382wro.5.1686119503550; 
 Tue, 06 Jun 2023 23:31:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 0/6] Add display support on the stm32f746-disco board
Date: Wed,  7 Jun 2023 08:31:33 +0200
Message-Id: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds support for the display on the stm32f746-disco board,
along with a generic patch that adds the "bpp" parameter to the stm-drm
module. The intention is to allow users to size, within certain limits,
the memory footprint required by the framebuffer.

Changes in v2:
- Add 'Acked-by' tag of Conor Dooley.
- Fix build warning reported by kernel test robot.
- Add 'Reported-by' tag of kernel test robot.

Dario Binacchi (6):
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: support display on stm32f746-disco board
  dt-bindings: display: simple: add Rocktech RK043FN48H
  drm/panel: simple: add support for Rocktech RK043FN48H panel
  drm/stm: add an option to change FB bpp

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 35 +++++++++++++
 arch/arm/boot/dts/stm32f746-disco.dts         | 51 +++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi              | 10 ++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++
 drivers/gpu/drm/stm/drv.c                     |  8 ++-
 6 files changed, 134 insertions(+), 1 deletion(-)

-- 
2.32.0

