Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92C326EC6
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 20:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AE86E108;
	Sat, 27 Feb 2021 19:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8653C6E108
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 19:48:43 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b18so5415901wrn.6
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 11:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pCdXkUGdbXxFWrdiSKZfKK1y/JajvMt7IrRHviPqOz0=;
 b=onzxmnsTlNeB9dC9J7rdV7ptcwlxHTIBpgpxZXjv8/FHudXcYgeeqiaBgZeiXDYntz
 vtRuUCw8Yo8ZOQhAVuYYzkz3umOci/qSK+wIek+5kAvYwOLvtKS0vcC+Z5CQgNvFHo0e
 v2JfZndjJ+mSuEuvtQPfl3k1Ii/rnF3UYEM7ltFUBL9NEoyqRUxm8tNPjffJ1LTNqzf0
 iIq26tFMBbv4DWdCMeRhVlQ95dWSoX8ODnvi0OlY6ZkxMuLbdIDMcmIUU/BCIuITa7YZ
 3ZFSTY4qgET0VGxV5YwXmPLLBs/l643AQrLs56q+/+vBdbvU+FD98Db9W6F8pCulibhi
 CQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pCdXkUGdbXxFWrdiSKZfKK1y/JajvMt7IrRHviPqOz0=;
 b=Tu3uzpO0T7jBBkXfJrCZRKvUnBXx0IqfyxRolQzV/hbQS3wBq8Q6lweVPaiHuxW3ia
 rbWgUOFz7U3IRZmzpFmq0rqc0IshDMvEarnynw6Qjk9RsAtxSbDyim7jNuyOWpLrq4QT
 sIoN+ItfSnTuUDjed6kiGCqDGrk2N+SUlRsUzCR/QswfyM27bju0TwS3Qz5rE01JYjSW
 t28ARsbc+PvbDJWofMEz543eLULGVrF6Q7LLDbC3aFUNnACmZLWC3ekFtyS+eapdPqTR
 e9itYgXe6wfXTVn86ySrCA9L7f9nQwWzAxjOWqa4dubXc8cl7gRPaZwbm34U0eWg3b55
 kN2w==
X-Gm-Message-State: AOAM533/atPOS0YlZvDJOTvlV264n64g2eR0NY+RveA8brUowWGhHej9
 XDifEq99cOfMRnTqzor+xVc=
X-Google-Smtp-Source: ABdhPJyz/QGbhv7EhcO+Hxa4/UEfYcnXP98xYulRVfFLCIJ7Ph1hsXUKcPtLBABP0YsS9pvfFtcwzQ==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr9027206wru.327.1614455322140; 
 Sat, 27 Feb 2021 11:48:42 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700289c166d32b9da85.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:289c:166d:32b9:da85])
 by smtp.gmail.com with ESMTPSA id f9sm12453123wro.77.2021.02.27.11.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 11:48:41 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v6 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Sat, 27 Feb 2021 20:48:34 +0100
Message-Id: <20210227194836.1848753-1-adrien.grassein@gmail.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
this patch set adds the support of the Lontium lt8912 MIPI to HDMI
bridge in the kernel.

It's only support the video part, not the audio part yet
since I don't have the datasheet of this component.
I get the current i2c configuration from Digi and
Boundary drivers.
Developed using the DB_DSIHD board from BoundaryDevices.

Update in v2
  - Use standard data-lanes instead of a custom prop;
  - Use hdmi-connector node.

Update in v3
  - Fix indentation;
  - Implement missing bridge functions;
  - Add some comments.

Update in v4
  - Fix bridge ops;
  - Fix i2c error detection.

Update in v5
  - Fix lt8912 name (lt8912b instead of lt8912);
  - Implement HPD via a workaround. In fact I don't have the datasheet
    of this component yet so I can't say if the configuration of the
registers is correct or if I have an HW issue on my board. So, I choose
to implement a fake version of HPD using a workqueue and polling the
status regularly.

Update in v6
  - Fix a warning found by "kernel test robot"

Thanks,

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912B
  drm/bridge: Introduce LT8912B DSI to HDMI bridge

 .../display/bridge/lontium,lt8912b.yaml       | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 818 ++++++++++++++++++
 5 files changed, 941 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
