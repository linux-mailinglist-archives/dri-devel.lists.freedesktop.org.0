Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01B3AB6FC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 17:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BD76E8DE;
	Thu, 17 Jun 2021 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11916E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 15:09:48 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 5so3451090qkc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mv9m1rL1gQr7Cq6u236MxatHLn2/MqViMk2h6WZTmRo=;
 b=RhAoT19vBPzCi+padM6Q7iUPclE2KxhFlLSP1W5hes8qWZnAztDI26Z4FvXDDMqucP
 W5JQJ+LluUo4CVKtD8Ou8W9THwUmW9uFmpyN3w2O2DiGqJ9c9w5qOv4G7lMqAWbtPSZp
 +nyS2rvds2wuW0Ui9tRUgXAuNyit+DxYJ1V15wv1mGoktZaDq1vY71NXD3TfnghhBhbv
 h+DJXG0YSEZWCrAXmeVKZICdwmo7FfJUXXYVxAW6TJiqNh2N/cumtG8td2dd8ZUuVSEn
 aUJCPlFNmXTtK6SA3cqG/jqEwAX6jgcpYxIn8IIscqfbcKtHCLut+1uODkwneV6eaqwx
 DkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mv9m1rL1gQr7Cq6u236MxatHLn2/MqViMk2h6WZTmRo=;
 b=bEHIp/0IKNu5iAKC52wCCGoqNb/vgJj+OBhHabhUGfGZZ20bVYxSXytO/sFLWfWUmr
 oHM538WbldUkozYjyT2hWZRuKJeqPN7dU/y7vIhyD8cIllESAyxDCaZTY6MSyyXuer5P
 xTkKxuMTcYFt+X99OZleqW+h7ewSzcAPSv/C9ZpJCs3QU9mRgsW9mXYtATTlNZ8nscLB
 DkjwvCC/Od1RUEdExyQbPR+/L/mecY2S1E6hX4eLxtq/VMC7xkbr3QdP+cQQy+3UpebU
 yzw6v+By/hIhInKCW1hcKNqTp7quUmFkFVBNM0ks128FGc0+0DiDjq9p/y5NzvaWVdaa
 3n/g==
X-Gm-Message-State: AOAM5337NO0l9UhWjHtf/8V3yY16myCsnlN7DU12Z+em8vDTiA5ITP0M
 Gc3hERe3KaOopXPKd+xOL0TLKw==
X-Google-Smtp-Source: ABdhPJzglu2BOkfTCvKDZ/8MRUxwg51FjvnIad48oEPHqJArDCQJiVaaZHhuk7PmsZdUyA3nUjVIJw==
X-Received: by 2002:a05:620a:13c5:: with SMTP id
 g5mr4349545qkl.464.1623942587689; 
 Thu, 17 Jun 2021 08:09:47 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:09:47 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date: Thu, 17 Jun 2021 10:43:32 -0400
Message-Id: <20210617144349.28448-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 Bernard Zhao <bernard@vivo.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Konrad Dybcio <konradybcio@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the required changes to support 7nm pll/phy in CPHY mode.

This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
the CPHY mode.

v2:
 - rebased on DSI PHY reworks
 - reworked getting cphy_mode in dsi_host.c
 - documentation change in separate patch

v3:
 - yaml bindings
 - changed binding to "phy-type = <PHY_TYPE_DSI_CPHY>;"

v4:
 - PHY_TYPE_{DPHY,CPHY} instead of PHY_TYPE_DSI_{DPHY,CPHY}
 - use enum/default for phy-type property
 - remove a stray semicolon in dts example

Jonathan Marek (3):
  dt-bindings: msm: dsi: add missing 7nm bindings
  dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
  drm/msm/dsi: support CPHY mode for 7nm pll/phy

 .../bindings/display/msm/dsi-phy-7nm.yaml     |  71 +++++++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  49 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 145 ++++++++++++------
 include/dt-bindings/phy/phy.h                 |   2 +
 7 files changed, 259 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.26.1

