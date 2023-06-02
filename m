Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A9720E61
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 09:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0589010E64C;
	Sat,  3 Jun 2023 07:02:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7DE10E644
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:21:34 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2af7081c9ebso27027401fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1685701293; x=1688293293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=pjzDmVWrmpv8bNLYLxvaZYL6mxAG3qQGOPJ8xm++RR5BxeesRsXpGhpys5eIzcxcHB
 rxgB6q/xLenJIRNPnwkVkDzsQhtNqR1+AzfiU/SbEYotGzou+QdALXAT5+qDdwLxo+tz
 xcdp4bFWejnRiySMy3kFESCse7L+7H5XqwxHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685701293; x=1688293293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3q0SzVmGHZSYA8dRUVFZwmu0+tSDXCd1K6OkYFYtOd8=;
 b=jeCJE+mfoTwuVSP8ZBEPrsuCgNy3cDj+wKW6Cpje/qfYPrA46EAhzsn0sIHFLBRB6T
 EPu+sDulE/vPqcf3bjA3xc2pyKmyJWWMpNhyH9oE4nABX6ekLCDS6dZiJe8b02QnvbvK
 HaivTgaeTI+ixQrykkGHxVJSuqHihAczPPDHH0ViMABKXsf99mJzCXMQnJ11JSO533sT
 6zM8uA9Rx+nCyviYex1NVuvc2nnX7yck8GDSTZ1llH66NmXvCMc13D8yxGFC4uVx6fz3
 RCtCTnvhy2gPbgorsaSZ1cHVfqbgN3qqNyUmc0xoCcHCcoGGbhopne1uOPt6P7CF3aOG
 llSA==
X-Gm-Message-State: AC+VfDyNc7I5JgqeVMUxctn1U7xwTyXRep14uZ/YVGX9FqR8wowlOnxO
 s8rnef2ps8SsJi6r9ZwxRaBqBw==
X-Google-Smtp-Source: ACHHUZ6co4uO+gVLS2iC+Vv8IBfeCfrH5pWd6DF66wUFf3puiaOUh6G/ryC64nR6uuVEL69eEqSvqw==
X-Received: by 2002:a2e:9944:0:b0:2ad:8623:a97e with SMTP id
 r4-20020a2e9944000000b002ad8623a97emr1104584ljj.50.1685701292883; 
 Fri, 02 Jun 2023 03:21:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-248-31-20.retail.telecomitalia.it. [95.248.31.20])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0051499320435sm528887edq.14.2023.06.02.03.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 03:21:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] Add display support on the stm32f746-disco board
Date: Fri,  2 Jun 2023 12:21:16 +0200
Message-Id: <20230602102123.3345587-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 03 Jun 2023 07:02:50 +0000
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

