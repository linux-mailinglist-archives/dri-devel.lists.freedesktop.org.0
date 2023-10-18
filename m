Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C157CE286
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 18:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0986C10E141;
	Wed, 18 Oct 2023 16:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13AB10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 16:18:55 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3af609c5736so3844961b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697645935; x=1698250735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uiAac1jZIi3qZdHU8sW2jL0PSFVOdaZae73ENz4eTLc=;
 b=BUH2imSU/pIX0TOpJ8/KczYovfRzZAxO+pB4xkq0ye5+U5zH7fpXSq0d+oDM9TiJ+e
 /P2rwRIsnqH/F/iSRqIwCKkw3jRvbsHnbnb0Vzkv1dJMOoVeAiOMTAsojmSNRX06E9zG
 0h2a78DOfkwotB0yPGxKKjS8vDtQyt0s0OpRtBJNRAD1N6wym/sw/ZuTFK+Y2Po08jjD
 KRD8EaJTMBRz2iKMm+EYmQPfOk3RSgagwUReeirRfx/qpX3ZOwCwZVL448KsRr1cAIpZ
 VHtRnsAxWv7xpHZFkimB6AvTdkaQ53qBcQ7D5Fh+CfkGTf5DNo/aVqHoIKi3hV2DgF//
 0x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697645935; x=1698250735;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uiAac1jZIi3qZdHU8sW2jL0PSFVOdaZae73ENz4eTLc=;
 b=l9JuAOw2zsygnyuxws+gWfeXXEEU0AeQ8gUG15gkNmFmIpKbrwsOiKNF2l/oFv0vdj
 RZdzOf7KBsNtk+7RSSlae9vNyKi6jv8rFLkEh8JwmiLcKRud4WaQF2IOQH7HGzb2BRB0
 X8YaYdwgH8M7b9fSolQmKFpYabvGTQCLAK0QrOEa2xaE/fKiinr8opsjfdni1/HK0AiD
 qQrCDziLhWC931gi+yYowTqhcvdOH2zptthP9+/BH0sHGetV8M78/Lw0jfsdbTobogPu
 mFgZadYWFTmsFhfU6b6kHraisvhg1XC11tjivCxjBjZtj5gFXnsjHZFVdbSY9Dqf+arg
 6CJg==
X-Gm-Message-State: AOJu0YxUAkdFJBs4v8xT6e3GV0jFAhzcWEVB4+tIFvPsFUQw+pnQHrIi
 o4KauGP3LuF+wZ+2Kwn+L+8=
X-Google-Smtp-Source: AGHT+IGbqKyxK8GbZ0wAIqZGZTIkMSeTM0jxfnYCf7QtFaDT8lcGzIBN50xecjZC+J4OyJ5S8XoyVw==
X-Received: by 2002:a54:4406:0:b0:3ab:8956:ada4 with SMTP id
 k6-20020a544406000000b003ab8956ada4mr5220353oiw.10.1697645934869; 
 Wed, 18 Oct 2023 09:18:54 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 09:18:54 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 0/5] rockchip: Add Powkiddy RK2023
Date: Wed, 18 Oct 2023 11:18:43 -0500
Message-Id: <20231018161848.346947-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023, which is extremely similar to
existing devices from Anbernic.

Chris Morgan (5):
  dt-bindings: display: panel: Update NewVision NV3051D compatibles
  drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
  clk: rockchip: rk3568: Add PLL rate for 115.2MHz
  dt-bindings: arm: rockchip: Add Powkiddy RK2023
  arm64: dts: rockchip: add Powkiddy RK2023

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../display/panel/newvision,nv3051d.yaml      |   2 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |  56 ++++--
 6 files changed, 214 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

-- 
2.34.1

