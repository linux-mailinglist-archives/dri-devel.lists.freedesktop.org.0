Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912316E7030
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07EA10E10C;
	Wed, 19 Apr 2023 00:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4DD10E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:32 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id ff18so9163233qtb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863029; x=1684455029;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rE1EEDO+fEqLoZiLrhfSx85AyW8A+vdoa/Snn4cvZO8=;
 b=ZHXM1vJBIY5/tmjJT0bVpzwkzgcuj3UqE6ZuAM+WopWTizO0zDdpKa7LVRnsmGTn1d
 dNzyQC1wJv2vOr86Nkl6+DausEEP53FrPRiRv4UhVQurNRPpO1CmxFUxHDSvYCh0/r4L
 STAJGBMIzP8mz/nBypYUlSeBjFBmmgYZ34WTb9Sd6ekjELm6Sq0Us2ZOuGOcqa6R7okN
 2jNHKJT6OPVZCX1v4iC9zXkRhVV+lHS8I1FE7A1UBj5sBxKKNp3qwrF86F1KMEggt5SN
 XY0Sxw8Awni/NHCWXYhwkKcyE6nH1rM9D1QcXbrpE5pYEXAY0ipeoblBZlUd07Kvxxbt
 q+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863029; x=1684455029;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rE1EEDO+fEqLoZiLrhfSx85AyW8A+vdoa/Snn4cvZO8=;
 b=YyNvpDlhofnLkBNN7mFbYBD/rICLclnau4vJqln1VUhPWtJUGxmBUvF75k63TS51R8
 UO7MEp4J7Z78JOCx31OqK7wrg8iF7iqLaL4xgLnW5yt87T92tfusUbC1zC7tybgc+4zh
 7J1t5eKWMcjZGzeqzBa0ByjcNAxTFaZMkp+57sP5XZRXBubhf6EKEm80JSG+Aa3oHR3u
 jFe5BUD77CJgPHs/kOM+nAYfUgXk7xf88x4K3XEf0BPQ62A+JgixsMuyyglQhZj0gtL/
 T97czU7LxsyK8gE74kIjGZ4eyRLbryYBWVU1L+pcEkOvOhxlD7fxvY+OP61hlS4E8pjS
 jEwQ==
X-Gm-Message-State: AAQBX9dhdLiJuSAGT9Ytk2Ij4b+7RTFFv5Ts5FvsDA2BgCjvlkw/VVtq
 8hdVCXvkd+S1C8J8CIi003s=
X-Google-Smtp-Source: AKy350aJZdwTEBQKh+v50v7gsPOE+8maA9oyygbdcVRFgplCIK6a3+p7/GpmoeTI1M2smoh5fZHNFg==
X-Received: by 2002:ac8:5e4d:0:b0:3e6:4fab:478e with SMTP id
 i13-20020ac85e4d000000b003e64fab478emr3325666qtx.33.1681863028798; 
 Tue, 18 Apr 2023 17:10:28 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:28 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 0/6] Brcm ASP 2.0 Ethernet controller
Date: Tue, 18 Apr 2023 17:10:12 -0700
Message-Id: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Justin Chen <justin.chen@broadcom.com>

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

 .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  146 ++
 .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    2 +
 MAINTAINERS                                        |    9 +
 drivers/net/ethernet/broadcom/Kconfig              |   11 +
 drivers/net/ethernet/broadcom/Makefile             |    1 +
 drivers/net/ethernet/broadcom/asp2/Makefile        |    2 +
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 1527 ++++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  636 ++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    |  620 ++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   | 1425 ++++++++++++++++++
 .../net/ethernet/broadcom/asp2/bcmasp_intf_defs.h  |  238 +++
 drivers/net/mdio/mdio-bcm-unimac.c                 |    2 +
 drivers/net/phy/bcm7xxx.c                          |    1 +
 include/linux/brcmphy.h                            |    1 +
 14 files changed, 4621 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 create mode 100644 drivers/net/ethernet/broadcom/asp2/Makefile
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.h
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
 create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf_defs.h

-- 
2.7.4

