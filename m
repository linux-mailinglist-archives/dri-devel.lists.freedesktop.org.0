Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE03363C41
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DF689F3B;
	Mon, 19 Apr 2021 07:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7B89F3B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:12:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so4417587wmq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bnc7rry0yOyWImFy7btWR/TymYu644iNqXg07l+AwQ=;
 b=ySFYuMzYjYVOF6rfkPbiYz7f93FrrVz7nI9LKI2FzGb5kgpcKWc7qMVVkToh6fEKdS
 7yN7z9thId+RvAJpnpFAML3t7WqLCa6qWg1hX1l5C+BIJMUQQqWNDx53NPkq09XPOeK9
 vnCvxOPn1l8VAlwEeT+4luERBdVLnYBsIAYBrkfSLwYhJE1NmvSuxjbUZPOoaIAPyv/d
 I4MsHAf/fx2PIufpnhf6DvL71NDcRXGPJnotJCf/2odAzpYSvy+sAm7sJnbhUb75/BWc
 V41KvmT2q14zv7yk8KcK9iUK9aKMVh9+ZQGlWTABIBQ+47ou3u7ZSx3jOHzcPU/nilkz
 MkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8bnc7rry0yOyWImFy7btWR/TymYu644iNqXg07l+AwQ=;
 b=PS3kuHMeNR514vgzMr4xFl2VGup7h3E4EF/R5M4/qTD9INDcXfBf5i7CQl5LGyFxSx
 /7F/rD9V7xaUtAylGSHihSA/hK2KrT1aWx0Lzy6qLGNPAvvF1mL/Ps7Fr9OFQr8XMHM6
 r25tDNGydv9LMhCTJh64gkmWuN9xLFax2pqQA9YbfRls/UAINKuMVYg8HRIP2ScoeeDJ
 PpsDTAQ1wZBE3/rH4Fy76NH1XsAaJyhLFWVsXtbRo/kpMtiVEcqynNMct4wmd4F14Exq
 wYVojfmwQNGvCAVdb60AeCfT2P+Hvk6hZ7HvXchzScOUW+Gut1UdTRWM4jB3g/WqiCdC
 Gu3A==
X-Gm-Message-State: AOAM531e4eOKVqNQK9JmY6CXbsnT2mhjgdLRnJNLbdS+1II8Tp7asBuP
 lPniAVL8D02sHcWPHR8tgt5+mA==
X-Google-Smtp-Source: ABdhPJwhzCnAjrbkqq5544zQvttf6CrDIWzEg2TPcaRFRFH4LgCn5P6qeUu+4CX85qNzjzxRXwOAYA==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr20107628wmi.50.1618816343239; 
 Mon, 19 Apr 2021 00:12:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 i9sm10447922wmg.2.2021.04.19.00.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:12:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 paul@crapouillou.net, robert.foss@linaro.org
Subject: [PATCH v4 0/3] drm/bridge: Add it66121 driver
Date: Mon, 19 Apr 2021 09:12:20 +0200
Message-Id: <20210419071223.2673533-1-narmstrong@baylibre.com>
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

Changes since v3 at [2]:
- DT
 - removed i2c reg description
 - used 4 spaces indent in example
 - added review tags
- driver
 - added missing includes
 - added missing atomic bridge callbacks
 - dropped connector creation completely, only supports NO_CONNECTOR
 - moved single line helpers to inline
 - some more indentation cleanups
- MAINTAINER
 - fixed order
 - added review tags

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
[2] https://lore.kernel.org/r/20210412154648.3719153-1-narmstrong@baylibre.com

Phong LE (3):
  dt-bindings: display: bridge: add it66121 bindings
  drm: bridge: add it66121 driver
  MAINTAINERS: add it66121 HDMI bridge driver entry

 .../bindings/display/bridge/ite,it66121.yaml  |  124 ++
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |    8 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 1021 +++++++++++++++++
 5 files changed, 1162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
