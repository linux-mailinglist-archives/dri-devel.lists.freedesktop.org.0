Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C2323003
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 18:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0316E995;
	Tue, 23 Feb 2021 17:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827016E995
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 17:56:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c7so6734405wru.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyVloWl8unt/KJdcuJNibhs/5zk/r6+x/gImwnrP5BY=;
 b=phNHgeK7u4URixcCSxPiOM4PlwQEivyaW25MMjIQ/WRO1Kv2FmLXiPJzH+ATy5sDM+
 925T7p2zQfHlXbjqhN9Sn7Ll0AhmckOe/eViW3tXxxoPz6Gkmm5nj60GaovK5P79NBBG
 PWJSp+ePAH2x8sLD8Wg5lZKHjR7mkY7k8hp9mShWcFqwPk8rhHYf+sukraSmCpkV1op6
 9fUh784mU1EPHUhRpyPaBoN6vXq6C9DI/zotWdlhjXkkhN/3+dSblEAaunAgKcbCAnvl
 Ixpn6xv6uf+QLHnGv0HpbhO7ryYpvzQWYckTYLrDcnRPkj1WtIGdh2CWdriVnW7zI9aS
 ZVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IyVloWl8unt/KJdcuJNibhs/5zk/r6+x/gImwnrP5BY=;
 b=WiA//6JuLUH2ZEJee6MZRWTjsf4raGHU7RmzjTR/KrQ+9VbM7ZCZ3EStAWmK+4fYjg
 PZV0CL1PdjsjGbFCs8AINsovvOCVu3rlP+5HcpioqoJ3NbpfSuDXE+lpRtNumvmS4kvY
 OL3/WpRLrkFnB1fLKoENz3C45HcdfR8sS8VdlN1unOCdUy6UklLa62NrX/MrqYzlTAlh
 KdcsU4KsKWf/Vc0oxdK/jVPktSzWzpUAoMWjfAO5x+NDHaeEfI/o9gxNYXHJcIqRcIO5
 nC2X8bAJdRYg56x3ipElLmt/sxfOdFHSeOY1kiJXqPT5iUTG370FnR4kJglLdoiS13V5
 2U0g==
X-Gm-Message-State: AOAM530/H3UUtnp9r8X4y2n881IzJsihIpgFQQBYQI7oCUpbNfp6UANb
 eDbpIiIQbicfAvE6mePg4Ic=
X-Google-Smtp-Source: ABdhPJxlIIBZlxOVilXG9G6Ys2oj/GvN9y7crj7+v46Tpl9b475B5UF5MmwmVp8JCTgW/Iy43toVvA==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr10674015wrn.247.1614102973195; 
 Tue, 23 Feb 2021 09:56:13 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb0008bd270084c09ff22cc10cb2.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:84c0:9ff2:2cc1:cb2])
 by smtp.gmail.com with ESMTPSA id g9sm2779815wrp.14.2021.02.23.09.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 09:56:12 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v4 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Tue, 23 Feb 2021 18:56:05 +0100
Message-Id: <20210223175607.431796-1-adrien.grassein@gmail.com>
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

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912
  drm/bridge: Introduce LT8912 DSI to HDMI bridge

 .../display/bridge/lontium,lt8912.yaml        | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912.c       | 764 ++++++++++++++++++
 5 files changed, 887 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
