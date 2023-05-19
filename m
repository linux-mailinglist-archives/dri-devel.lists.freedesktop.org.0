Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C29709D22
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58D10E591;
	Fri, 19 May 2023 17:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6F510E591
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 17:04:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510db954476so4310268a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684515842; x=1687107842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yI0mSQ2DqrJBtVhWBqNt4YE0D9y7Ke3r1TEApfK+Y8s=;
 b=pc+bPFnBQMB5DdWWjfCASoCdssIXgIseNm/bme4RxwHXpQ4TaWDUvSVpTf3RPBeboV
 qNcfs5L9zfpuxwRLfzN7qNreUCKxHt481E2PyzeUB7zqpKhg0Ie8LELEO8K/QKfCijk7
 8A+0NXv/5f6zcp2Q7RPXVke2pK1H7WeEDXHpCZIMincmuYMZEPSWWHuIMT6TEkZy1Y3Z
 YXXYTQavMUGtAm08XKJnY95ENuOuBPVKeQEzhpuhG+IlFW+hOFKwtrS2QWKTAVQZ/7q1
 dGgtjuzA88F6tprCjOGqOoMkQJys6wIRyXT2IvzHFip2XnW9VgQM8UZox5gUGQq8pbGw
 2gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684515842; x=1687107842;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yI0mSQ2DqrJBtVhWBqNt4YE0D9y7Ke3r1TEApfK+Y8s=;
 b=GprgApQNzPbFz5eNoGVn7Ca/B+g6QLe12QQwWEOXlp+3OZ/1DYRbIvhezWN8OqNkIy
 QT3XKNtJ6aMgAERKaJQBNsxkmBOeLlKgJEsxgxZwWGLLlsCaZIzv0yyYf5xnUa6pgrT6
 RdfqP0J4VF+2xcTjBf65uJn1wwsSQpnWwcS43PmSlNZRHWzOIN8J7qzX2NleMdUciF6b
 QBEBGhLC7x+6ITYAASwhg0XCAlH+2YtZKSKBGKX7IHVSf5t02JHHPCVkTDTzjaS+pyF0
 H67bPskczbzsFY8EDrYwWMtwdr5I8Dun6BSKFnJ7/vGSJcwEOrOBYFKPvgs0/aa5PlZc
 ct3A==
X-Gm-Message-State: AC+VfDxPKrXe+yJJu5teEMVUJwzLnz+UVQoBBP+drr0Cbd7zJpVTxh56
 TTC2gjUclEaZiNrDzZkQWUs=
X-Google-Smtp-Source: ACHHUZ6ITQoFmFv4vzlQeUk4c4DPVUrLLreopFxWyIzHGlMWscdmlLm+iMcBUWcK7gbNYfSx6rkm1w==
X-Received: by 2002:a17:907:1b24:b0:96f:2b3f:61 with SMTP id
 mp36-20020a1709071b2400b0096f2b3f0061mr2536267ejc.7.1684515841784; 
 Fri, 19 May 2023 10:04:01 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 mf13-20020a170906cb8d00b00965ffb8407asm2489988ejb.87.2023.05.19.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 10:04:01 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v5 0/3] Add Samsung S6D7AA0 panel controller driver
Date: Fri, 19 May 2023 19:03:51 +0200
Message-Id: <20230519170354.29610-1-aweber.kernel@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>, Artur Weber <aweber.kernel@gmail.com>
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

Changed in v5:
 - Changed compatible to avoid concatenating compatibles
 - Removed '|' from multiline descriptions in DT schema
 - Fixed DT bindings license

Tested-by: Nikita Travkin <nikita@trvn.ru> #ltl101at01
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Artur Weber (3):
  dt-bindings: display: panel: Add Samsung S6D7AA0 LCD panel controller
  drm/panel: Add Samsung S6D7AA0 panel controller driver
  MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver

 .../display/panel/samsung,s6d7aa0.yaml        |  71 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 585 ++++++++++++++++++
 5 files changed, 670 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c


base-commit: ab87f558dcfb2562c3497e89600dec798a446665
-- 
2.40.1

