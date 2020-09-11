Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B3326856A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262B46E201;
	Mon, 14 Sep 2020 07:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161E46EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 15:11:22 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id q5so10203148qkc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euZWKDvSLszOg3hns89zvMgi1tbxQv2avHZee3eJ2yI=;
 b=qBfjVizj8aDJByTIWD3AlHF0vazq0JRzEVHnlyJo5/NIS5vzxEDvesvDkS72qQWYZn
 NcHjjsrCA9ZrOnv4cdzT1ApxtC9g+Wa0KpngbWvHSEWfCNfWKbE2HwmmNsGCn11In6Dk
 WFzaFFM0REfbH2QJmlGpa5PHlR93uvWgHAZOV7zqPKT5y0RI5twXPrkHBTGKhxLMp+BN
 0tn6myKDKpvS+YDQVHVxIoB8JzgE3bACjYysEB+rfFCdsGbBVjc5L+HVhvYjLFN5RQUt
 hgGyx5kOHUpNaKrCUigwruBDOHKNfvPXy4H8FMUXjNrUmHht2a2Hak+TZCmavDVaS8WR
 DoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=euZWKDvSLszOg3hns89zvMgi1tbxQv2avHZee3eJ2yI=;
 b=Rypy0lld1wWRGjv+Ig4O/7cgLn90+qeEci/0JRdOI/xOJB+s3Ezb36EpK9Kr+CVfXP
 OC/hS4Z9LtuNSo1e+beEvyBM6pSZbO3lj67ZR51WDplh+Tn0K7QkT89mfcn45If8ZbuA
 jSX0EeZsA5kRFb/imixnVRUW+r61XnVkY0qjnzV3ARoYMctAsZOF9RmWgYb6BMKIN/Cj
 mGmRQQ3Qu2Wh3XvHCBfRTfswbw2xrfO+oS5Rv6hOB44yBELQ+gFiTRejn7fzuxxSc77w
 P+iUYQ3tgIzDOMl/fby02LOCjTH4nhjf6xzYyfbDgLQvU+pArAJlLhSQ4ew0DZcX6ach
 0M/A==
X-Gm-Message-State: AOAM533kYIPZ7RNI/6wGykC49F2zixM3iXC6V4jjKOMAhri33P2y0wVV
 7omfiQUUI2RT/CRG5eDVMMRVgw==
X-Google-Smtp-Source: ABdhPJxfmWCOR7Q2dKc0X3lEWR4RYf+Baz8OuO11f6wPmq3V0V15Oe2aKlOQbU9BaEuSm32pNlc/VQ==
X-Received: by 2002:a37:bf43:: with SMTP id p64mr1862870qkf.24.1599837081212; 
 Fri, 11 Sep 2020 08:11:21 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 201sm3216429qkf.103.2020.09.11.08.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 08:11:20 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] Add support for SM8150 and SM8250 DSI.
Date: Fri, 11 Sep 2020 11:09:36 -0400
Message-Id: <20200911151001.13156-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Wilczynski <kw@linux.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

v2:
 - added workaround for 5GHz max_rate overflowing in 32-bit builds
   (based on robclark's suggestion)
 - Updated Kconfig option to mention SM8250 and not just SM8150

Jonathan Marek (3):
  drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
  drm/msm/dsi: add DSI config for sm8150 and sm8250
  drm/msm/dsi: add support for 7nm DSI PHY/PLL

 .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
 drivers/gpu/drm/msm/Kconfig                   |   8 +
 drivers/gpu/drm/msm/Makefile                  |   2 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   5 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 904 ++++++++++++++++++
 13 files changed, 1724 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
 create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
