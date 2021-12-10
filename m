Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6432B46FFA5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 12:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A6910E2B9;
	Fri, 10 Dec 2021 11:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2784B10E2B9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 11:17:23 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g19so8193015pfb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 03:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=041LGo95ekC9SiULpMPWta6fBO2f32KbmNR1inhaPRM=;
 b=M7ooGiEltJoCk3g/j1bMsGM6QF4RZ1wXnBwQjMdZnnZ34W75ank6M+i8F9l+NiS8id
 QB1q2rYXy+YDS75daDHcURou/0CPXfaRAKeB4lBDQcQN6wm3Y3ki3R8P/VaH0YSP7wOS
 SaDpnMbUiNSr1TYcMaMBLJlKvb75vSje6f1Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=041LGo95ekC9SiULpMPWta6fBO2f32KbmNR1inhaPRM=;
 b=zSyP6+dt57D7psvLdk3AFVFWnQBMvjYx9IpCvLaR+np6SvjnU078Qb6fFQqEuDkaFU
 h6TOe+wt64nrzLbq7n6fNExrpPg/Jya9a3fB7w+h239k8Zd6RAR5H8sXxyc240DtVHZz
 vkYJyoQ7BgkfT6n+r0qVEDxrhrJauKef34nyQY4FXguQF1MfRNapecsCKiSjEb5FTQ0K
 OHpBGU+kywq3nSfkvwN3UlP/bTpaAFZxG6HCG09FxbMiU5a2Yr+np9pDumbNFATpH8Yf
 oI95Yanqd0qDZX/ssZIQmBwD5hSyFfZS1uBN2kdf55EIPCKHX+xaC3pgXRtQZxYBww4D
 tNLA==
X-Gm-Message-State: AOAM5322+bR6DPaPFLHNnx0VX2JRzlqEtA3lgubD71FgENf+s/k9nbsI
 KiQpQa2RXsMDs6cAjpKbek1JYg==
X-Google-Smtp-Source: ABdhPJy3v8HoY7k+U+kRYTzeLw2P8ajCsvXjLkXHI+M+GrVmBRIpasf+RjGIlthjQUFF4dQq7KJQmQ==
X-Received: by 2002:a62:8042:0:b0:4a8:15eb:db10 with SMTP id
 j63-20020a628042000000b004a815ebdb10mr17229368pfd.28.1639135042734; 
 Fri, 10 Dec 2021 03:17:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c40f:36d4:b45d:731])
 by smtp.gmail.com with ESMTPSA id
 qe12sm13125607pjb.29.2021.12.10.03.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:17:22 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v6 0/6] drm: sun4i: dsi: Bridge support
Date: Fri, 10 Dec 2021 16:47:05 +0530
Message-Id: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add bridge support for Allwinner DSI controller.

In addition to previous version, this series add bridge support
only not doing any bridge conversion at the moment.

Previous version changes [1].

Patch 1: Drop the DRM bind race while attaching bridges

Patch 2: Move component_add into sun6i_dsi_attach

Patch 3: Add Bridge driver

Patch 4: Add mode_set API

Patch 5: Enable DSI Panel

Patch 6: Enable DSI Bridge

Patch 7: Enable DSI Bridge (I2C)

[1] https://patchwork.kernel.org/project/dri-devel/cover/20211122065223.88059-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (6):
  drm: sun4i: dsi: Drop DRM bind race with bridge attach
  drm: sun4i: dsi: Add component only once DSI device attached
  drm: sun4i: dsi: Add bridge support
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable iS070WV20-CT16 DSI Panel
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable ICN6211 DSI Bridge
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable DLPC3433 Bridge (I2C)

 .../boot/dts/sun8i-r16-bananapi-m2m-i2c.dts   |  69 +++++++
 .../boot/dts/sun8i-r16-bananapi-m2m-panel.dts |  41 ++++
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts  |  64 ++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        | 187 ++++++++----------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h        |  10 +-
 5 files changed, 256 insertions(+), 115 deletions(-)

-- 
2.25.1

