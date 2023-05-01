Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DC26F3642
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 20:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749B910E0FD;
	Mon,  1 May 2023 18:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09510E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 18:51:12 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50a14564d17so42180388a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682967071; x=1685559071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XXYNDfuK22xee9U1YJ5+QfMQLLMlc/YWcr8hr/XmrE=;
 b=JTE+nMeiXrEBmK6b6ca7iIUWxu4N1hoW58ICQbltZgwzCnuO+JBl5zCLrj8usm2asB
 PflGb3ymSYxog4V9KTm4LNh3RngboBo59/BE35JekpLKhWeJAoRPkaVKgsRD1nFA0LO5
 PsYl0ceCqi05FBMeJmdgiKIuhkt4y7eeaS8A5qamMQvWMsRgSwsbrtVWrQooI7WQsGXd
 FabVAaELtTkptC9EFQ7cOwWNjlt13VyQeO/dHGe6t2wddhMk0ycFLnFU/jJhivcvnu8P
 V7YPCFZTzufXdcwPpjjf9ATog5ZTr31O+aN7NxoqI4/ZR8hjzrALg/ET7LrNMVXc2psp
 jwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682967071; x=1685559071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XXYNDfuK22xee9U1YJ5+QfMQLLMlc/YWcr8hr/XmrE=;
 b=MNFGMGWn6C1xoRsyGsdfsESt73XHwknZ3q/vF91SNEODfW6UkT4LsZsY8Gt0d3RxCX
 x4tN6ZCAvMdJlstRinIIn1Y3o8/gEtOdX1xoxIwjjeeusv40uQY5toyL/QJiPZvtZLXX
 7TyjEyRU5xvyeSY/lN+rH5HI2P/8Nyl3sF82Q1D9xQy78jyUUZzumKy6lkxnWQpH4via
 PTXF9OWYvnY4kC7hOQ5WzKwC88rpnFFfiuX0y3/MCAmhmINbW94izVx6/tES0ezFO+YT
 EnrjAW2lMgKR9QN+yEn39qbJF/DJ9kD3q+GqFKkpn7H5vRMq8sIImVvB8rw6nW36d2fw
 bbvA==
X-Gm-Message-State: AC+VfDxCnK9ApR9X5sXenbkwO6ozg/WXSvbr7FqSUUR8kMKArbTLImcc
 FdEOv+vilDgTHJ6KqkxyU4g=
X-Google-Smtp-Source: ACHHUZ7ATh/b0KyAWXtQ+IaqPpPkys5spjADfJRhTldvk2ettaxUuN3dPUxInrA/94QBVnJsFMUuuw==
X-Received: by 2002:a17:907:6d19:b0:94f:511a:a183 with SMTP id
 sa25-20020a1709076d1900b0094f511aa183mr13144185ejc.36.1682967070908; 
 Mon, 01 May 2023 11:51:10 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 g10-20020a170906594a00b008cecb8f374asm15028335ejr.0.2023.05.01.11.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 11:51:10 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v4 0/3] Add Samsung S6D7AA0 panel controller driver
Date: Mon,  1 May 2023 20:51:00 +0200
Message-Id: <20230501185103.25939-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds initial support for Samsung S6D7AA0-based panels.
Currently, the following panels are supported:

 - S6D7AA0-LSL080AL02 (Samsung Galaxy Tab 3 8.0)
 - S6D7AA0-LSL080AL03 (Samsung Galaxy Tab A 8.0 2015)
 - S6D7AA0-LTL101AT01 (Samsung Galaxy Tab A 9.7 2015)

Changed in v2:
 - Added commit messages for dt-bindings and MAINTAINERS entry commits
 - dt-bindings: Applied suggestions from Krzysztof Kozlowski
 - driver: Removed unused panel_name property from desc struct

Changed in v3:
 - Correctly applied patch for dt-bindings

Changed in v4:
 - Added support for LSL080AL03 and LTL101AT01 panels
 - Added DSI-controlled backlight support for panels that support it
 - Added vmipi-supply
 - Dropped s6d7aa0_bl_ctl_on function (not universal across all panels)
 - Removed MIPI_DSI_MODE_LPM flag

Artur Weber (3):
  dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
  drm/panel: Add Samsung S6D7AA0 panel controller driver
  MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver

 .../display/panel/samsung,s6d7aa0.yaml        |  68 ++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 585 ++++++++++++++++++
 5 files changed, 667 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c


base-commit: 9102d61886cb887b152f89c2481a6c17d1846fee
-- 
2.40.1

