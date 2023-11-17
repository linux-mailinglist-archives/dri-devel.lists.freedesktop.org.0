Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85907EF8A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 21:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3210E75F;
	Fri, 17 Nov 2023 20:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED14210E029
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 20:25:42 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1ea48ef2cbfso1337898fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 12:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700252742; x=1700857542; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cC5x0F16yoqZZUwJiOcaoVUGZ+6c1n2rTIUkTxQENLo=;
 b=DRFqnelyYXnar5CNWG2DneR1mdAr0FJKWTwNUzTVLhvS4gvJ6y4P453PKyKklEAMb2
 yLqAnK3qbhHwqquHbDiAHYylQYcYOEHru265R1dviwi7BDMCfTWYYYv8nhVA9wvdtzpS
 qgJHMuNyoYhEiLLlbLuX5CtXEPNuNsNe1gr3+7++GIAs3lXPrZk/TpReHfu1d97r/fmC
 1uuCLmi9tGFklTBa7m8kzKXcummDKMSiMVyF/TJ0ZOIKDAirbkOeiCu6OUOYvJjENKVJ
 DZ37e56wlFnTbmM4/t+eg9C6Tz2byhkxX/2mVpAEl8ZPMillbgaZJT6S2F2BaWvNXPJT
 tzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700252742; x=1700857542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cC5x0F16yoqZZUwJiOcaoVUGZ+6c1n2rTIUkTxQENLo=;
 b=OG109XX1dSZIAiLkYkEnNJO0JAJc0hsIp9/070wTSvc7nfqnpTXs7nQlbGu3fq4hYp
 Oqvr3+q1sGo7tqRp1Sh74j43nzo32CCQM8Y1E1wvyNRUfTEk9pCYkdxVCLPbhMYk4lW8
 c8CkMuJGL3goONkxvfnqHV9/Pp5pNni3MWxs2FZhd3+/ncG182MXKXjGihRjq3A2u/Rr
 E+ADFscC3357xWzEw1ilct5AIImn40D2bvRbfjsLs9WbNzyr24eUCx8GxLr9LIM7q0b9
 3/Ut94N7uSJKfVACvTTWUuzpWGChWL4GNNGstxwcN1HzxRg1H0N8AkhFmzFfwf0FpL5t
 c4RA==
X-Gm-Message-State: AOJu0Yyh1I4Gbiebre3dB5XIxLwt8d2154uiVAZFzJyDs2CKNMuwr3qM
 sYsvLkAiiHmajJJLkFKUB0c=
X-Google-Smtp-Source: AGHT+IFQOquKVOXG/4AQKC/d569hIg3KFrQ+5ydclll/CqbXqTN/HkPoQrM1TYkxfdA7MK0TmxIopg==
X-Received: by 2002:a05:6871:5221:b0:1f5:b586:6cd7 with SMTP id
 ht33-20020a056871522100b001f5b5866cd7mr410990oac.16.1700252741055; 
 Fri, 17 Nov 2023 12:25:41 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 zf15-20020a0568716a8f00b001f224cbbde1sm390543oab.41.2023.11.17.12.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 12:25:40 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V4 0/6] rockchip: Add Powkiddy RK2023
Date: Fri, 17 Nov 2023 14:25:30 -0600
Message-Id: <20231117202536.1387815-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023, which is extremely similar to
existing Powkiddy RGB30 device.

Changes since V3:
 - Corrected commit subject lines.

Changes since V2:
 - Split "hold panel in reset" to a separate patch for the NV3051D.
 - Changed replaced common include to a new Powkiddy specific include
   to better reflect the similarity of these two devices (and so as
   to not have to delete so many nodes).

Changes since V1:
 - Necessary clock changes have been accepted to mainline, so removed
   from this series.
   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=f1db0865b4628d5e2e85347350c077a71f0629d2
 - Combined Powkiddy RK3566 devices in devicetree documentation.
   Dropped ack from binding as this change is vastly different than
   the previous update.
 - Updated panel driver to hold panel in reset status after unprepare.

Chris Morgan (6):
  dt-bindings: display: panel: Update NewVision NV3051D compatibles
  drm/panel: nv3051d: Hold panel in reset for unprepare
  nv3051d: Add Powkiddy RK2023 Panel Support
  dt-bindings: arm: rockchip: Add Powkiddy RK2023
  arm64: dts: rockchip: Update powkiddy,rgb30 include to rk2023 DTSI
  arm: dts: rockchip: Add Powkiddy RK2023

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 .../display/panel/newvision,nv3051d.yaml      |   2 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    | 154 +--
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   |  38 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dtsi  | 875 ++++++++++++++++++
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |  57 +-
 7 files changed, 981 insertions(+), 152 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi

-- 
2.34.1

