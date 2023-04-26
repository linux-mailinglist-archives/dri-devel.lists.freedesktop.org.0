Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A6C6EFA56
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:54:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DC710E33D;
	Wed, 26 Apr 2023 18:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419E10E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:54:44 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b4dfead1bso6245759b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682535283; x=1685127283;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R07Mi9Mz971NXlM6C0+9m3ePvBeyQwkx2T3l6oVaSvA=;
 b=Qye9OWjFuOEWZhcxm7u9djE3RkEO2zz5jUeRowPRUvM3LdUaM6cwmH2RJmcvMYNHT4
 GrckvKFHj9z01woq1G8sG0XtwNhF2Xf4Emh7RNl2SKucGuxocCGTwCj7MdI3+a69zjsE
 spa0kK5D03b0kby7d98GBeUuM72sxNuibrA8UD9AqVj9XcvZ3RIDf98d0NchVYzIv+HK
 1ilmdFhHAVYNUctSTvtSGPgZIjYAdmU/nxgXQxX4fdcZSmzDBIQqCUi7LsvukS2syA1u
 vGLpG3YHSF/pC919ecvDP8y6vHIqYnkykmLJmHs+UGF5tCBSooRY6z29sMiW6qrIhj94
 kMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535283; x=1685127283;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R07Mi9Mz971NXlM6C0+9m3ePvBeyQwkx2T3l6oVaSvA=;
 b=WQXYLyDxk7SvM53UHSdRcu2caYyF+mf+S8qTfqyfSDSebI8yRQdoJaYMhWbKAIoYsA
 M0xo5tUhgNqCDA/HeSgUXEIqTl5N18GY1weGi8+HbUE7G4o/LVZwFnTHhSRLPFosPIHP
 x9tC4tludDD2eVc4o4bTNgiSAQsjU3RLkxFgZubWRGbF4f70GK03zcwGaUaB1gJKWDuO
 PIQ5/5DnRhhNTTUSm0VYT1sTrwhvapWPJhCdJpBfcq0+DtGPziR0n7ooo6Bh6/gzMnCl
 zF1v0H8TF5fukFW9u3zmIVjA6slVo4r3EF0I4LYt0kRrsr5G7Un5hVdb+3YyObkVWt2q
 yTWA==
X-Gm-Message-State: AAQBX9fY3hG28l7y1aKjU2vaZyrrtdqoBtLQfZtBLESpCUvOvQkmMVo0
 wyoW2p3mn9KsagOeZFZiqdQ=
X-Google-Smtp-Source: AKy350ayADESKqZUED8JafpEZGIjCz4hY19zWIUoZp0bX0AJ4jiUhsSvlxpczQ8Kb+xGm37lSzOy2g==
X-Received: by 2002:a05:6a00:1acd:b0:63d:2aac:7b88 with SMTP id
 f13-20020a056a001acd00b0063d2aac7b88mr31945188pfv.25.1682535283105; 
 Wed, 26 Apr 2023 11:54:43 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm11639254pfb.104.2023.04.26.11.54.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:54:42 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2 net-next 0/6] Brcm ASP 2.0 Ethernet controller
Date: Wed, 26 Apr 2023 11:54:26 -0700
Message-Id: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2
	- Updates to yaml dt documentation
	- Replace a couple functions with helper functions
	- Minor formatting fixes
	- Fix a few WoL issues

Add support for the Broadcom ASP 2.0 Ethernet controller which is first
introduced with 72165.

Add support for 74165 10/100 integrated Ethernet PHY which also uses
the ASP 2.0 Ethernet controller.

Florian Fainelli (2):
  dt-bindings: net: Brcm ASP 2.0 Ethernet controller
  net: phy: bcm7xxx: Add EPHY entry for 74165

Justin Chen (4):
  dt-bindings: net: brcm,unimac-mdio: Add asp-v2.0
  net: bcmasp: Add support for ASP2.0 Ethernet controller
  net: phy: mdio-bcm-unimac: Add asp v2.0 support
  MAINTAINERS: ASP 2.0 Ethernet driver maintainers

 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  145 ++
 .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    2 +
 MAINTAINERS                                        |    9 +
 drivers/net/ethernet/broadcom/Kconfig              |   11 +
 drivers/net/ethernet/broadcom/Makefile             |    1 +
 drivers/net/ethernet/broadcom/asp2/Makefile        |    2 +
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 1476 ++++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  636 +++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    |  585 ++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   | 1435 +++++++++++++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_intf_defs.h  |  238 ++++
 drivers/net/mdio/mdio-bcm-unimac.c                 |    2 +
 drivers/net/phy/bcm7xxx.c                          |    1 +
 include/linux/brcmphy.h                            |    1 +
 14 files changed, 4544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 create mode 100644 drivers/net/ethernet/broadcom/asp2/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.h
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf_defs.h

-- 
2.7.4

