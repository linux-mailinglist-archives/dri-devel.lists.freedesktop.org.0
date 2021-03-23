Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3940346756
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 19:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E546E90F;
	Tue, 23 Mar 2021 18:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194086E90F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 18:14:31 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e18so21782009wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbZwWLO0faxizLlS0pXkd1V339UXzvG9Fjo6U6vn6Os=;
 b=Sfk5P279OI/pPHXLqgtMXrT6powvmwN6JmE5PSEApOadabisNP5IVlZQcJgBSv+dwI
 TmgCkpJVV75udTNNRZjCOy9dl6wbnw6anXomtpxTFKzLORtpMvZvFoFMn5G5VtWi8IQV
 /t9bI8KPuSC/gw3OjINDpaxlkBKYf4iPld24xMeL6wzqN65y98IEHvFofmqDeOq443eT
 XDWg71n8tQnSlnSLumMWASQzFLCi4XrOcufaushgFYAjsHsaBzv32o8MufCOupoBzAmc
 MnkMfYtHE2V3JlAVPrmnXcSi1oer0NOZxdmS3VkIPDJ1Q3pCwSGmPNGT99VlpTbsQCxR
 3J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbZwWLO0faxizLlS0pXkd1V339UXzvG9Fjo6U6vn6Os=;
 b=sUnJETvo8s+GmkFdf7jcGnZO1y1A16PfodGiv70kvs3yiB5pVpHvaH48wbY2zBFTqT
 l9tle6VNqoAZFCXOgV4+bwfwAkGa92SiwJ0aGluL/8mO3BNcMypG8ZSEi/z+iJTylNoA
 937zjjVu5j67rYMq/jSG+KNB7W9s0LeyxhHJZQg507xngYZKuSpJyd5/nVD7+j0ZMQXy
 MTF9yP0UKYiNAnyduwOQ29uTc9chM0I+ixUpE6EjDgVI17HY/QoYs9J7myeDP0mpeE82
 Yg9v5zGOz9AvsNWNea1lV7M54sE3lls2O3E9rOVGSzyKGgKpSrAILcT7W22ClCD9bxUY
 pUKw==
X-Gm-Message-State: AOAM53002ggZBXREOSn5s8Cql7gP+3Gc3EadTMDENh5g3v6tQq/1WMaW
 GL+YHy+FbXJ20k+9f+ocWTM=
X-Google-Smtp-Source: ABdhPJy8YxTzXv70Rx/RXpuiBZyu4/JukCqPPoa/KiVMfInWD559h7X/+rMUmDf2A1kViF0dxaVpxQ==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr5162914wru.327.1616523269575; 
 Tue, 23 Mar 2021 11:14:29 -0700 (PDT)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700f54ecdc9d152bb4f.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:f54e:cdc9:d152:bb4f])
 by smtp.gmail.com with ESMTPSA id 21sm3484734wme.6.2021.03.23.11.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:14:29 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v8 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Tue, 23 Mar 2021 19:14:21 +0100
Message-Id: <20210323181423.657926-1-adrien.grassein@gmail.com>
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

Update in v7
  - Fix HPD logic (via an HW emulation);
  - HPD from chip is still not working.

Update in v8
  - Remove HPD logic (will be added later when HW bug qill be fixed).

Thanks,

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912B
  drm/bridge: Introduce LT8912B DSI to HDMI bridge

 .../display/bridge/lontium,lt8912b.yaml       | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 765 ++++++++++++++++++
 5 files changed, 888 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
