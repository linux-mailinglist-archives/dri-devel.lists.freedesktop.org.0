Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4003D5059
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 00:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0C46E4C9;
	Sun, 25 Jul 2021 22:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB836E4C7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 22:16:00 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h2so12042703lfu.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1DZBEYdDyLJJT2wpyRDVzHNpwXpqcxfHLQtIRbcQfo=;
 b=Su364SznOABhDumPHYeKmjtErtDtj2OYrfWpTcUaC18fYoXko/tQ9oVn+KSH29axG4
 UG6MTx9cfx+ZorqYZuOAL/WSZyBqRRq35FeyoQbN0+fubFjmTCRb25VdKJgF1QQzSGRh
 nc0ydnpgkb3Rw59+xgHSOzqa3upHqim8IPIV68pWhCBXRz4+r/fSPD35EaciWL74LDkw
 hukkyjIYzXXSe2OdUAQysWUW8Rjj4zuYsc7EG1SS4VqPcvLMYjwDi71JefIaLeku4MtB
 +9wCNrXr4lAFGQEQ2xnGXTwJh1abCIq8xMMu+INlEeA7zt5Vy+HXEATCWyabSgBzULHt
 HioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1DZBEYdDyLJJT2wpyRDVzHNpwXpqcxfHLQtIRbcQfo=;
 b=jH0jvFyh20NrCJMMWeZ0ZGmyhxuOa2Kxk3ic6B8JJik5tKtKA76K/Xt68+au7l+PZd
 foo3fxn19W415VAk827oCKdCcHNXEQOzKPYEj4A10KjUGDRTKKqcB2iu1QEBPureatEq
 mijPRwl1Q0HnpwJAeD1WxeeX234j4/rOaMPl5ibw8mxFicK8czojFiQEHnEkz758rtfH
 0shZ+m/qnTwdKXQZg8WmoJwTSMzw4n2rJGIwuDwcESmggUlks9tuQxbAFy0Vksth88+0
 fgQtxysh/plTCNB92Uh+hNgrPMcZRV8zHVKR05LoZOY0ViuknHhXwiLHCQmWRe08aYl6
 P9ZQ==
X-Gm-Message-State: AOAM530ftIixnCuZ7VVCIPpsg45nK7p4XIaGgsd+pgPtS4qaO8EqdGgs
 fcoHs/HHH3vtRUHIH7/1aPI=
X-Google-Smtp-Source: ABdhPJyF3rNNIkEIYpfHzOuD1bUaOrmlsL12pe6fvHDbnhI3pa955ihaSZPstxz/w8mE9uRwiSUj3Q==
X-Received: by 2002:a05:6512:2388:: with SMTP id
 c8mr10274737lfv.201.1627251359503; 
 Sun, 25 Jul 2021 15:15:59 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id z12sm2862647lfu.53.2021.07.25.15.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:15:58 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v3 0/3] add Gopher 2b LCD panel
Date: Mon, 26 Jul 2021 01:15:24 +0300
Message-Id: <20210725221527.1771892-1-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Gopher 2b LCD panel is used in Gopher 2b handhelds.
It's simple panel with NewVision NV3047 driver,
but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG
NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Changelog:
v2: remove .num_modes
v3: sort QiShenglong vendor prefix,
	sort qishenglong_gopher2b_lcd_panel_modes struct

Artjom Vejsel (3):
  dt-bindings: Add QiShenglong vendor prefix
  dt-bindings: Add DT bindings for QiShenglong Gopher 2b panel
  drm/panel-simple: add Gopher 2b LCD panel

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-simple.c          | 43 +++++++++++++++++++
 3 files changed, 47 insertions(+)

--
2.32.0
