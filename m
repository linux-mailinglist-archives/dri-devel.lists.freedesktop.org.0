Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0831B5DC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B582C89E50;
	Mon, 15 Feb 2021 08:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA11F6E141
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 23:29:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o15so4582508wmq.5
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 15:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evlyv8cW4AaH5I2gOc3PmwqIiElKj0kJaTfG3XXnM1U=;
 b=ecDlWsOnQELKqf0jvx4yn2aud0nXYXVZmT3PWOMXEZinickGNSRou3xYFv+YvI/9g4
 AwFipmpoybrdtvzINATFrILSiCrPHXAbnHwQPYpWK7ou39NQPczu00tkqH3+QZ75vHat
 yBwWXqwuqElsDi6nGrdKjKUXdVN/iMg79xtNcNT8RqypWSOZVlZOYzmaTbLMbQFnhnoQ
 D3hYRBqMFrtdEKsskoa+n3x4tJpwyoKWAsixTcNEjynI7Z417krJ17JeGkS6Qc8t+2SZ
 25fFodTOfnAMGzZLkLsT6EQO/f+dgL/ZdkF57+DTWEs+nEC4ysGt5vfbcJTA+Y3qtZZ4
 4oCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evlyv8cW4AaH5I2gOc3PmwqIiElKj0kJaTfG3XXnM1U=;
 b=q701wAlbBObTJtaRKtTcOKS9PcejX7Jt0vH7r0cx+mS7myU0TQKUhEf0rohWIG6DzJ
 vDONTyV5OAe1tXSrPXFD+skK9RAmXDQcvz//pDi0L74BXGOJofBUDGSMQS9rdP2W2HfF
 JGR4q2KlhiU8yvkowi/QVtqUPodT9rEaMZiYrCHnUafonu0ttK/HY1a2hokTPtpUegtT
 yBGBuyw9sXxqnEspBbjNW+uzkEijNmKXGdqlUCjSzhLmviH/psWyjLNY/ljl7yzWqt/m
 vtCI0rcI+rZ5VYIpJ1gXAl6k+aVNaj/HzLSakrbOuhJWQII8+lLUVKx0QzLYGG4WFb/H
 3zVw==
X-Gm-Message-State: AOAM5307K6R8DARTwuUWK8EBADj9MV3eTkM0GBglKAizR6ymAmwoeBgI
 M8D3vqTrIdcC+VJ57ZdfCiM=
X-Google-Smtp-Source: ABdhPJzUE8PaFQc9mUFNlvbSd5ayCBji/He2N37077krd9VhHiU9FPE0Pb3yXOkXJW165LSDI9k/dQ==
X-Received: by 2002:a05:600c:3595:: with SMTP id
 p21mr852143wmq.127.1613345377556; 
 Sun, 14 Feb 2021 15:29:37 -0800 (PST)
Received: from adgra-XPS-15-9570.home
 (2a01cb0008bd2700341b9a8437bdab47.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:341b:9a84:37bd:ab47])
 by smtp.gmail.com with ESMTPSA id l1sm19522478wmq.17.2021.02.14.15.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 15:29:37 -0800 (PST)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v2 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Mon, 15 Feb 2021 00:29:02 +0100
Message-Id: <20210214232904.1142706-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Feb 2021 08:22:01 +0000
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
 narmstrong@baylibre.com, airlied@linux.ie, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

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

Thanks,
Adrien Grassein

Adrien Grassein (2):
  dt-bindings: display: bridge: Add documentation for LT8912
  drm/bridge: Introduce LT8912 DSI to HDMI bridge

 .../display/bridge/lontium,lt8912.yaml        | 102 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/bridge/Kconfig                |  14 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912.c       | 719 ++++++++++++++++++
 5 files changed, 842 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt8912.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt8912.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
