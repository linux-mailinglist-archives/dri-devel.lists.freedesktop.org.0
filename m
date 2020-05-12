Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D9E1CEDAE
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4BA6E842;
	Tue, 12 May 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6A46E02E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 07:03:44 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id u10so4998496pls.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mipxNW7wlMfxMGzhO28Zqov8GTbtGeGtVOGitUJWy1g=;
 b=jhsgIyTPnDqRWSwbXSvTHyprY40KS9vAbW6rcrOxqvOdnjjSCNpBTwLTElgpNEzgCv
 B/hU4Z8wkqrvGJHq59AS0U9JQ6yXrwGMFmB8kBkBvf7nXAqmNJ0jZaejbMa5GQZuvEBS
 eLoZmX4dAQxHnMwTz0F++g+Q9cMlfwGAGLMmpOWVa6HNkUWlnh6e16A5ZPiiELLtULyY
 z563mUjwWwpWancdRnp0L6fRRlwklxrRA5iRY5cvzd2FlBcT9lSknFeoiEuJJfdTgctn
 X/bMM/ECf64aLI5IcgeQibHurIkmnmOFetTDvjvalW3B8d+rNzxbwXeZHB3ykoTPHH3C
 BXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mipxNW7wlMfxMGzhO28Zqov8GTbtGeGtVOGitUJWy1g=;
 b=TxyCsZDqrIL+Fe/QkWTtvz47pj90lF/R0AoSILUGkU+q4R3x050lTqpYaBEv6E/K3p
 WSyb3B2B6PpA7W5cFzbtSI6UF+03/8WQ6Duv4Hnlyw4kPniBlBRlqQCeANkmNjTeS7NT
 PuTBIft0OabQ5aEZqshwwB7/doVjBkzLVzC7PQOODKgJZ/FjJ0PVWWVoLtsLQUGLE0Q3
 xR0O6S6zn4+W3fTMfxY0g+7tDnCzHKfRl3soIE5orC/HNL1FKZZ0cq+BbCQkeiTTOQTu
 rYs2PrhS5k28BZw7hQagZuZNGS3YRjJWR9HgdvbT7mqRlW11q0U045aQKiul73h7yJOm
 u0KA==
X-Gm-Message-State: AGi0PubQSVm27MY4Fxi7plBI5qr5qZa0n2SxvP2xrrme7d86pt+WxUqG
 mcXVJIEXFKWdh+xuySoy7B4=
X-Google-Smtp-Source: APiQypKGhdYXmj/mC8uQ3bBGAeu+OpMtK+0m3u5lxy4OVl4GniR0xQaSDQxS0oHIcUIBNStrnMsqkg==
X-Received: by 2002:a17:90a:db53:: with SMTP id
 u19mr25689708pjx.41.1589267023718; 
 Tue, 12 May 2020 00:03:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id 62sm11016369pfu.181.2020.05.12.00.03.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 00:03:43 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v3 0/5] Enable ilitek ili9341 on stm32f429-disco board
Date: Tue, 12 May 2020 15:03:32 +0800
Message-Id: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

This patchset has following changes:

V3:
    merge original tiny/ili9341.c driver to panel/panel-ilitek-ili9341.c
    to support serial spi & parallel rgb interface in one driver.
    update ilitek,ili9341.yaml dts binding documentation.
    update stm32f429-disco dts binding

V2: 
    verify ilitek,ili9341.yaml with make O=../linux-stm32 dt_binding_check
    DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/
    ilitek,ili9341.yaml

V1:
    add ili9341 drm panel driver
    add ltdc, spi5 controller for stm32f429-disco
    add ltdc, spi5 pin map for stm32f429-disco
    add docs about ili9341
    fix ltdc driver loading hang in clk set rate bug

dillon min (5):
  ARM: dts: stm32: Add pin map for ltdc, spi5 on stm32f429-disco board
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: enable ltdc binding with ili9341 on stm32429-disco
    board
  clk: stm32: Fix stm32f429 ltdc driver loading hang in clk set rate.
    keep ltdc     clk running after kernel startup
  drm/panel: Add ilitek ili9341 driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |  68 ++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  67 ++
 arch/arm/boot/dts/stm32f429-disco.dts              |  39 ++
 drivers/clk/clk-stm32f4.c                          |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 700 +++++++++++++++++++++
 7 files changed, 890 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
