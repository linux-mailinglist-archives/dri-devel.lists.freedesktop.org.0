Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96157330D13
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 13:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345C6E10F;
	Mon,  8 Mar 2021 12:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33646E10F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 12:05:59 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u187so5892905wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 04:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOFCAy30+hiqnUf4WFGNwRQ7loEwL1IKES//VoWfeRc=;
 b=OS6fdtLFf28FMBuEz7RzKgcVieehzMpNI89ZzTbO8djWN0jHZEt4s08XHp9fO0dBsD
 GumP4t6fsmbOWGwO5t9+UCB0mZN5qV5XMOAANGSKvzCiMx054chr2n86TdyH5QKszSpJ
 Ic4lIrNygkVxme5QCIqxP+/PAotVoWkkRQdhklUWDDYDnZNMARdTki6MFIgbOlblVOjk
 KKjE/c/099j/AzO6z287BgvXMl68YIwytaAIe5Vyyd4jmtR55DvlGukfSy+EexNtAF+H
 5sP40L743KcllyoZgWT4dTHCkRhaSnlDI1YRobSKcqgAbxjgxe+3h85x2pZf4nO2AV+W
 ATjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOFCAy30+hiqnUf4WFGNwRQ7loEwL1IKES//VoWfeRc=;
 b=FdIzT/NDdZhcdVdYz8FdhgzgmccuTCtpLDgZXrljnxSI5Tb1VbNOFGvYuYvMv3aUh1
 icozvFVMo/zqzxGHuKUXztybrQThoIOr8lwBaJ1b3n+mztSE99SPM0iKrxyvU5UT7167
 stFOqJOJP9wopba7y2xtAoImhTk92nDXMhvU2lKNXUfzv4Me/cO/LITCQepzQwomuz3h
 fK9T28Icys+sW1oLOIlNdV3vHZSVpu8YGDPkqYblc7SLIUXo489BUvRt9RjDbWYlfOSW
 sQb2GUE3q29KWg5+rOBte/604fE8eujhthloYjI3v8VO6xe/7QO4ojiqaD/XIP/mUx4x
 olqg==
X-Gm-Message-State: AOAM532HwwwBTR8KlBT/TwyHttet2q+m76bl7TzoxlJLoSc1c3lDRj0U
 b3UNzm9f2uAt9QRHQd0URBg=
X-Google-Smtp-Source: ABdhPJxa1eQWt2HdCMg4PMcsmn5l2Hfzos3rfB4FLAAl9nhOIY6CxiJPmuc4tC8oyR2MENr1SvtORA==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr22285365wmg.85.1615205158733; 
 Mon, 08 Mar 2021 04:05:58 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd270095bc7625808eade0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:95bc:7625:808e:ade0])
 by smtp.gmail.com with ESMTPSA id r7sm19031803wre.25.2021.03.08.04.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 04:05:58 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v7 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Mon,  8 Mar 2021 13:05:53 +0100
Message-Id: <20210308120555.252524-1-adrien.grassein@gmail.com>
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

Thanks,

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912B
  drm/bridge: Introduce LT8912B DSI to HDMI bridge

 .../display/bridge/lontium,lt8912b.yaml       | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 836 ++++++++++++++++++
 5 files changed, 959 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912b.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
