Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5E34A700
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A7F6E1CD;
	Fri, 26 Mar 2021 12:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3E16E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:20:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o16so5500739wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kg1U2pASZJh61Qap78Y/WB4kOKba5GuYu7Xequ9TovM=;
 b=ApDLceLYrjN3KcZ8KGrUq7h5LqtlXdms3kCHUwf5LKOWChju9s8UbzZdFT00sHBWji
 fxDtaruRNz7u5jRqT0p9wT15uDg9gQRDTa640vTdCrogo15MYfUNjXfIgkwMys9VuTTc
 qBJvSQ2PB3HNIZ085nzvowSGsCTH8Lsg6+0CNfYVsaggIuJHUXWdwr6/2DMuS4vFZuHB
 k9KV7vx31lQD89yiMQFDLRw32tMhe/uiDA1ZU8hnm/+BKv3D8CzX3hW0bRGfl/g9q6Df
 Exw0MELumNmpzMIfwIuiwO9rArhA54V6WDXNkHdcL5bwP9LN4rAePu7MoTGenANMX7dQ
 N0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kg1U2pASZJh61Qap78Y/WB4kOKba5GuYu7Xequ9TovM=;
 b=o2QsQEI6gGp6pcp8YOx8n+9kFJSjmWlKDHZ3t+nchUEX6BcB2ebpmWgJ3bWtoN4+7A
 8b1bPC3mFfMiTWRYvaHPKkj816XanjN9JhLX+c+odvaKE8twivpoO3VJbaaXpPmGgYBW
 1+2kRo+bzvbIQf5FTRWmEK10ulWi9SjVCLKP26TNvZE+yY4EeBtLjk4mnMMXQL7GWEm0
 PUU9gegshUAgvMXWyt/Eb5nPsardVravKzvuP2anMVN9fDwytU0MomCH59/SsUsYOmq7
 XmubW82bx2QUnF2FXmnvYOB552KtwhrD/IAF9DFglMosFVTInmxhSxALOD64q/H4fnNU
 sGPA==
X-Gm-Message-State: AOAM531Br+oRTBK7cO9ru1g6kWEiLQGehvG2bdIMKD9oPVOBtM22cjF9
 aWv/mwqslPxnvvEskpPXaE4=
X-Google-Smtp-Source: ABdhPJyVXeITO6E5oyD1KdyzgwwiHT1pwD6OdpuDL3xMdY9Gk8FkQbcfYiCdNpBHrQP2N4FX8ZhDvQ==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr14247608wru.214.1616761200589; 
 Fri, 26 Mar 2021 05:20:00 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd2700f1419764c24345e5.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:f141:9764:c243:45e5])
 by smtp.gmail.com with ESMTPSA id l6sm11150102wrt.56.2021.03.26.05.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 05:20:00 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v9 0/2] Add support of Lontium lt8912 MIPI to HDMI bridge
Date: Fri, 26 Mar 2021 13:19:53 +0100
Message-Id: <20210326121955.1266230-1-adrien.grassein@gmail.com>
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

Update in v9
  - Fix errors found in scripts/checkpatch.pl --strict

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
