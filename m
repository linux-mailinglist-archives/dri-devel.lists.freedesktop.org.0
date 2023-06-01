Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7B71FAED
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 09:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A97A10E62A;
	Fri,  2 Jun 2023 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9C010E23E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:03:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so5052740a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685639024; x=1688231024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7CktwIDz8iQqFve40BtvAwOOr5PjVMSEqWCcs9KU57A=;
 b=fkg0EKdAjxwuFw+ApM6W/plP+tXu+eZpr9jZfh3mm69cAf7gyFHd7D+i7CTiq3i7Tp
 bnXachRnfNjh91+5nuM9DfYwtLjF5b0JsT4G9Hm9y/Nn+NpOHREBHP7ibsWBTlhrSMkM
 MR1dXNqpdI+hnBE3aN3k3EIhmqMcuDXwykx7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639024; x=1688231024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7CktwIDz8iQqFve40BtvAwOOr5PjVMSEqWCcs9KU57A=;
 b=h2ImaL1Z26F5wp7BHDnJ4rNfGqSSY8TYMMOvlVlaNJEAPuvUXXyInN0g3dGvhQ2LX5
 tZnbQ88jjSdidCbYmnBpybwhERzD910M2heAN38bH/7oXyTWXsAKceikIgxzwIODw+4M
 vggFgkLpK//et8OtAmfG+zCyhImAly+w/+T94cSF4PF2LpNGOE8WIIL8dOdzrkQI8/VR
 JqDO/fUUYSccHatpSaurAIYKw35mtF7AzsKKNZ2Hxug/6N4j14pRVjmMvHBH++XMNPv+
 Hz2N9V7kWtLpUGUrAMnPM+JI7DXtrfQbTD4FCGvJfI9b7prrQZtyQewIibNIZqoM+L9P
 Pv1g==
X-Gm-Message-State: AC+VfDyfkDh0ihZPpiyqbY4omG1/hhHu2a/Z9Ego9+7r4+bX2NnRXDpn
 Arv/4VXSIc2qg35OHwFSj+DMkg==
X-Google-Smtp-Source: ACHHUZ5jWPn15sUETnU3sOiLA3ZEq58hqtWA/qPY8dV5vu8echz75s4Xk6xBQQXlIDs32fWSNQEHHw==
X-Received: by 2002:a17:907:d13:b0:96f:8d00:43be with SMTP id
 gn19-20020a1709070d1300b0096f8d0043bemr2133110ejc.0.1685639024540; 
 Thu, 01 Jun 2023 10:03:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a170906a0d900b0096165b2703asm10658522ejb.110.2023.06.01.10.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:03:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Add display support on the stm32f746-disco board
Date: Thu,  1 Jun 2023 19:03:14 +0200
Message-Id: <20230601170320.2845218-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Jun 2023 07:26:38 +0000
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
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series adds support for the display on the stm32f746-disco board,
along with a generic patch that adds the "bpp" parameter to the stm-drm
module. The intention is to allow users to size, within certain limits,
the memory footprint required by the framebuffer.


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

