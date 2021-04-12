Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB38435CA52
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099089DE3;
	Mon, 12 Apr 2021 15:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9082989E26
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:46:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id f12so13486241wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNnT1wU3EztqEa0KgoIYGkDLkF+wcg0kGpW7wqA3C04=;
 b=dOg9Zm65CqwzxIJILxx2hj+5zmmKAKeoklIBIC9UeAtaB3gAlNYS5IeyNkOhinnGGr
 sUEwayAB3k8DSJIGArYMWrcymNg2km5k/jzQ+0kYvxBeoLEjRzsCdPgjEPH5jLbDTR7P
 mF3lEVY1ft+wvy4grQsuMxr0A5zveq1Jee9jrIfdjbxWkRi+LbkRT7QPwX8PcMuVtTtX
 oClxp7OuI2y5FsXR1GuTBFyC8nHL/jUrCy9R6w1xQAFuu7lJ83SdR+q3QIRMcUXvv+L2
 R33HryN8PQFhu2G4QGz9eZDDqOHhloXNOkckhuKPCDaFpJlunJREhgmHKh9dEbuWrvt1
 uRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VNnT1wU3EztqEa0KgoIYGkDLkF+wcg0kGpW7wqA3C04=;
 b=X7rtiZE8N3bcsc8EmNZpwStMt2dw/WR+dr/xKkR7oFPf+A58T2k0tERXBP32ZTlLQX
 sok4DDMJHt36GRtrjxnFK/PSm010wblIHwqtdKvm/Vt3JdZSul8+nkqrrH/cew7Zks0P
 LTzbB2WzHFgr5jye9p9P5ELvmHcrnz6VwEBlNtF1nw5aSCK+BqTgIjOC68xVb+qyyttb
 JLcfP9wAOvD8jStuYoLnONqNTV80REI4UFHibBAxPJ1ez+42qXtvjPH+oOxwsFNdldKf
 rNdc0KDZWoQwSRm/EGH2Yj8CRpG+vcL5vm/rgfiPw6sk4Br1wOKdkE5IVRvmrdCa1ElF
 sgmg==
X-Gm-Message-State: AOAM5305e7Pu1D3PjFB+gxSQxWuv1I4vDxGZK4aonJrmMkd96JUQszDq
 337u4pb7VJy15KPg+SlzEL1qIQ==
X-Google-Smtp-Source: ABdhPJwRTm+eLU0pLV+Z9TThpW1iNGpKRcYqQXGh/eW9nkPio0nKcFzCorf0k6MSk4x5owNVKcrEVA==
X-Received: by 2002:a05:6000:1c7:: with SMTP id
 t7mr32440897wrx.313.1618242413207; 
 Mon, 12 Apr 2021 08:46:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 u3sm12647332wmg.48.2021.04.12.08.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:46:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
Subject: [PATCH v3 0/3] drm/bridge: Add it66121 driver
Date: Mon, 12 Apr 2021 17:46:45 +0200
Message-Id: <20210412154648.3719153-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT66121 is a high-performance and low-power single channel HDMI
transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward
compatible to DVI 1.0 specifications.
It supports pixel rates from 25MHz to 165MHz.

This series contains document bindings, add vendor prefix, Kconfig to
enable or not.
For now, the driver handles only RGB without color conversion.
Audio, CEC and HDCP are not implemented yet.

Changes since v2 at [1]:
- fixed DT bindings by:
  - adding bus-width property to input port
  - correctly defining ports
  - other minor fixes
- fixed bridge driver by:
  - general cleanup following Andy's comments
  - implemented support for NO_CONNECTOR
  - makes basic usage of the bus width property
  - add support for bus format negociation
  - other minor fixes
- fixed order of MAINTAINERS entries

[1] https://lore.kernel.org/r/20200311125135.30832-1-ple@baylibre.com

Phong LE (3):
  dt-bindings: display: bridge: add it66121 bindings
  drm: bridge: add it66121 driver
  MAINTAINERS: add it66121 HDMI bridge driver entry

 .../bindings/display/bridge/ite,it66121.yaml  |  123 ++
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |    8 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 1081 +++++++++++++++++
 5 files changed, 1221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
