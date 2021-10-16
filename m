Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BEF4301F0
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 12:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17006E429;
	Sat, 16 Oct 2021 10:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E256E429
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:22:36 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a25so48336144edx.8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPwi9bv3AwLXQNt+5z8klYHbS6PLiM3Ne2X045V+1Mo=;
 b=eujFLhEc8Z2MlCySf5/p04gtBbRyIbpBNBoczlmQ4zPvDnwLUAjNuFH7G5o5e6C0q5
 70Q9vPenbyrUOejoUCF+ZllglN19cEZTwEMdxz6ubscCWbPSqJ/SFT3uwvIO+OYkv2Nr
 uHAdqa8IYB2UX0fSNWeTf0XrquN27i1/gnniM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PPwi9bv3AwLXQNt+5z8klYHbS6PLiM3Ne2X045V+1Mo=;
 b=Zlcn/MaRlHvqYxssGxG3/oKwlCnN4vWN0HSWWESh//ojLABt0+oRjf6IwI7TDnOWYr
 zp1iFfLJ66P4jwrIckG9Pp1tpTFOtZxjGqlOePn3Plpl1Ft2Ojskd4foaPMQLVYN/0un
 TXPc8IaSUEPtO/n1FPwBwFXjsMLg1wMXrZ9P9RMpo1BVlqnmVaCfkt8z3PNTVF4R6lpz
 GpmmU2zv9iT0xGrBYg/tqm/Q2JDZzCZJWc7atRCiGKB6KPE5IdAhi3ZHp3Kobz1Yg4RI
 8poBY6Km6gQPR25LPh5jo1n/7qRncJLfbp+KJuAGFYR21SJjwCRhoAcOHd4PaOXMGJmc
 1qTQ==
X-Gm-Message-State: AOAM533wStIwD0pCV5b6LxhQ/qSGh7Hc1nP6OaZhdtiaRqDoTle8RRSk
 egTzFMPDSep/iH9ip2FaS2XkNE8rIp1IZM7d
X-Google-Smtp-Source: ABdhPJzE3izz+NFWNjpYJ6wjjvut2arrelK7aHCUq303rPRV7bZXYq++e0FMe+EqdwFTd7rYPQb7gg==
X-Received: by 2002:a17:907:7803:: with SMTP id
 la3mr14082680ejc.235.1634379754545; 
 Sat, 16 Oct 2021 03:22:34 -0700 (PDT)
Received: from panicking.lan (93-46-124-24.ip107.fastwebnet.it. [93.46.124.24])
 by smtp.gmail.com with ESMTPSA id la1sm6117361ejc.48.2021.10.16.03.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:22:33 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add support for Wanchanglong panel used in px30-evb v11
Date: Sat, 16 Oct 2021 10:22:27 +0000
Message-Id: <20211016102232.202119-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for W552946ABA panel. This panel is used
in px30-evb v11. All the patches can be applied on top of drm-fixes
branch. The last patch is suppose to fix a race when the panel is built
in. Tested on px30 evb

Michael Trimarchi (5):
  dt-bindings: vendor-prefix: add Wanchanglong Electronics Technology
  drm/panel: ilitek-ili9881d: add support for Wanchanglong W552946ABA
    panel
  dt-bindings: ili9881c: add compatible string for Wanchanglong
    w552946aba
  drm/panel: ilitek-ili9881c: Make gpio-reset optional
  drm/bridge: dw-mipi-dsi: Fix dsi registration during drm probing

 .../display/panel/ilitek,ili9881c.yaml        |   2 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |   8 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 240 +++++++++++++++++-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  12 +-
 include/drm/bridge/dw_mipi_dsi.h              |   2 +-
 6 files changed, 257 insertions(+), 9 deletions(-)

-- 
2.25.1

