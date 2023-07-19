Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEB75ABDD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D610E598;
	Thu, 20 Jul 2023 10:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2210E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:27:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fba74870abso11071393e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689762452; x=1692354452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n6s5SrkIW3zsO2FEvrxZq3cuVjdTqq4OShcwOMwX6KA=;
 b=S+QkuDPSFBv4z9MlEhu2i3AKz0dysahmqjHPIX/c5AYzo8wToHKKZ4SOdmclNmfJaK
 hsM3h3+0xkq2VVcW04rcwMlBWpOqRj6wz8CIV3UaNm1Cx9/no2RwN9tkU9PNzAJQHquw
 fQN/OS+btoEt7z2R/tBbj+KpPLIFyaWK5DbzDBvF9dKz9Ja6v20/IN0ZjU46TFhp2qIf
 cEOayoGNRkCDvXFTcOACdLZ76BzuX/uXeGBn4QV5ugBbYFGsQXLMJRn8JAfkTPjuAe2U
 GGHVR+6Beq/gBCruX9oPbR7UVIeG24x02AMHvnmrwyp3KqRm34wMjH2tQDD8tD6XzpZe
 PZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762452; x=1692354452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6s5SrkIW3zsO2FEvrxZq3cuVjdTqq4OShcwOMwX6KA=;
 b=X3fwm5rPIMmH6Ye2HStHDjA4eZQmfDkSUsLtqCYovrrQz1DqZVhtTFQeIWRgSVwwEd
 9Tptgnwg/Dp8YlAZ+6964sHHwuG2JWOqt5MV2UjyqmtQCyLYWN2Fgif1dFxfGNKgW2hF
 z+syL1HxMqGM19RmBeJqVaQ/G0rSDrS0ErQrMTNWM3Ks1OJ17d/1JACyscNrsD9YJ2xW
 5Td7f2yGiNe99GHGXorx4ETNPsyoOyCDvx/UwCnpBf9MUApvthn/J/1ihsh5lbH2QQ/j
 fr1PyToDXSfYO3X6OlHfTMuL9ArkGNiPFCKaHbJTtjEyyZwXuD36CB50HJu/GtS0uciz
 mdEw==
X-Gm-Message-State: ABy/qLYj7rNBgHv7iRXqsOa0wJZmTn7DINtlSDLAdpetD1SIxfNz1NGz
 lde64+8m7M3E2hIFPJF0qJ0=
X-Google-Smtp-Source: APBJJlHgdTKUFmqUc7TCXDuOECrlQyOEt3lkttQoW93OSH4c8h7aiql2N24BI5SlqdUz8kiTvsZjuw==
X-Received: by 2002:a05:6512:e84:b0:4f8:7055:6f7e with SMTP id
 bi4-20020a0565120e8400b004f870556f7emr2035616lfb.44.1689762452265; 
 Wed, 19 Jul 2023 03:27:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05640202d100b005217412e18dsm2520457edx.48.2023.07.19.03.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 03:27:31 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] drm/panel: ilitek-ili9881c: Add TDO TL050HDV35-H1311A LCD
 panel
Date: Wed, 19 Jul 2023 12:26:13 +0200
Message-Id: <20230719102616.2259-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: Matus Gajdos <matuszpd@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch updates the DT documentation and the second is the
update of the ilitek ili9881c driver.

Matus Gajdos (2):
  dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
  drm/panel: ilitek-ili9881c: Add TDO TL050HDV35 LCD panel

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)

-- 
2.25.1

