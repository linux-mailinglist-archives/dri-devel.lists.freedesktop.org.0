Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007EB3DFC92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 10:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8B6EA04;
	Wed,  4 Aug 2021 08:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253F66EA04
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 08:14:20 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id z3so2165977plg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 01:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=YcaPLG4WLGmXTbU5bINUPvrcLWHtacPlPy/ZsqA/CZQ=;
 b=Re6jcSy8ozocfE/5M3aFbL3ix/ASrjIgvldH4BZA1HbTGfj0fHOcgwkGgNq5nLJeZI
 Gqyrni7qdL6uShKLGYHmtP3tDzE8b8SY1xoxtkwJu0enfbSEAZs2aWlA6d/wvSbt0ibB
 vKKmXOqIl7nqBIKe73eQ0608+P1wjOVVVgYRQGJnRgUBwBW2O6u4L52NHWrDtdS+T+Wv
 zpSghApqKpva8hTQpjH48Lk8NtfQv7RQIKGd+koOLMoN25A7gJ/zGvvxG1Bi+lW1dGNh
 vRP4oDVxNEl6pUDkYLPbVhudtv51hNNBwK5Xf/Vw/+rEar9oDtzDtHuCnIhQYqHz6sWz
 JyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YcaPLG4WLGmXTbU5bINUPvrcLWHtacPlPy/ZsqA/CZQ=;
 b=URvdEtUTDsY2/wdpK3FkxGHVP5lNJzGdzmekyBwKtCogdw1mkRkCL/4YAY8lsFVN5+
 gkTo+cDl/qqCCHpB0QGPHX7WAWqN0C+8d62RXdfmDSZwOE44KnHe3BSFJxnMjzmcw5Sm
 fuvTdwKK6Qgi/aC757V4YWFum8+QY3BUXaKdU4ePEKHPuMUBsl915+fUMFdMe+yKxHbb
 Lg5FmnFecyuYZrbvo2NvG9z3rlObLLmPEYo6VGynzVcDFZu497bA51j6/Vn8Yx6Jbw9T
 AuQ49M0qwIhMdqIa/evJe8k5hattB2dqNTtiGPqFF9YOHmWjR/cg6R5I71AeT8hx9lSj
 d/7A==
X-Gm-Message-State: AOAM531PzEHuSIG4r8IApP8jTgi39jby58mol0TO/PPc7LT578ySbMgl
 SSZcDZqpEOUk2k8zO9RPhIRLXg==
X-Google-Smtp-Source: ABdhPJxsRMhLMnsBa9LXfThwHNvzsjugIf+bl+o98l2qRf5Y7XTiINNqhAyUPsEBQZoNrEdMHJT0zw==
X-Received: by 2002:a17:902:c9c3:b029:12c:8f2d:4235 with SMTP id
 q3-20020a170902c9c3b029012c8f2d4235mr22209648pld.9.1628064859635; 
 Wed, 04 Aug 2021 01:14:19 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id g26sm2067445pgb.45.2021.08.04.01.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:14:19 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] Add Truly NT35521 panel driver support
Date: Wed,  4 Aug 2021 16:13:50 +0800
Message-Id: <20210804081352.30595-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
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

It adds a drm driver for Truly NT35521 5.24" 1280x720 DSI panel, which
can be found on Sony Xperia M4 Aqua phone.

Shawn Guo (2):
  dt-bindings: display: panel: Add Truly NT35521 panel support
  drm/panel: Add Truly NT35521 panel driver

 .../bindings/display/panel/truly,nt35521.yaml |  62 +++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-truly-nt35521.c   | 491 ++++++++++++++++++
 4 files changed, 563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-truly-nt35521.c

-- 
2.17.1

