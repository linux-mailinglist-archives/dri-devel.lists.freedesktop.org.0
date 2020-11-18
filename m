Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053CA2B8D1F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB796E513;
	Thu, 19 Nov 2020 08:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BDE6E3D0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:31 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id t11so2049525edj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O15+S8qQJDT/sctgXYGA2Ljv6MPm4itzezho9fQXrTw=;
 b=E0TgA8FvVhJVuL4QjwryYioG5ukaTZDNGKeVPP3cxNuekjQQhONNdSjVEESHmJaMnN
 FVEhigRNXoJlEDXlkZED6SOZu4whMRqRW0kN12qqnG1hTjYB/YXvJ8tOQmaj2tzD8/Xe
 tG5CucGg2BBmGqVIvY214dt5Dpd2RySOukfaAinlUD1qgjnqLqLVxwjIkzqzIca33e77
 qVhzBxHLQ0J0l8xc1UU1XZe7zySDlJF3C7lK/QV6Qo7WqkHrBoWN/qNKiQltWAV5nLN6
 TlIbrXowVBZwxjV5kuY8jvvFRVYK65IvSQSa3WziRuUpuKBdLZKH1G6Yfe4d83n4VDq4
 MF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O15+S8qQJDT/sctgXYGA2Ljv6MPm4itzezho9fQXrTw=;
 b=qPvWBg5U4I/hQfaepfq/4fCXvdKb+qTyLTJXCPQ5nuchQTA9iAKf1mgaCeinBuc+if
 tQGe2KureDD49EcQkKbLPrVzQziiyeMwIFiBQLVdcUmwIpMpe1tu0AhDbFvydLOU8Fa/
 gdJPKE+D6i4cXzF6dy88IprlDxTXzFiUHQT+6+TWcgYsKPV1RrxkVhcbWkS28pd0IIEJ
 fCQQvsk1mBwvn7Hnqvg+ak3Z1uKyNtlEgHjyg7RtMW+IM/Zz02Gm3wjm8Veh7sK//hEj
 JSdyLPm4sBM/v8m6/2Uq2H6ceNKBBxq5fuIvZJNLnDW2sSoeNDq6XpNDMEjgaaMXhkvz
 K/Hg==
X-Gm-Message-State: AOAM532r1QMQRzj3jDMFntb593dQL43Wpmv+ikil23q/78TfHrD8Jlgu
 S7VX3eZNPKMnITYTbcdTywE=
X-Google-Smtp-Source: ABdhPJyEp8bQ0cA1TBErbYejuIdVGGdRiXYdRohu8yPSprOL85WW3/XUARu8cgP0kyWc2Poc9qXFYA==
X-Received: by 2002:aa7:d703:: with SMTP id t3mr25109179edq.375.1605707910648; 
 Wed, 18 Nov 2020 05:58:30 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:30 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 0/7] Enable rk3066a HDMI sound
Date: Wed, 18 Nov 2020 14:58:15 +0100
Message-Id: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First fix some legacy things in clk-rk3188.c that was never updated,
because probably nobody used rk3066a I2S before in the mainline kernel.
Update the rk3066a HDMI documents with a #sound-dai-cells property.
Include the code for sound in the HDMI driver.
Add a simple-sound-card compatible node to rk3066a.dtsi,
because I2S0 and HDMI TX are connected internally.
And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.

Changed v5:
  removed unused variable
  fill frame structure

Johan Jonker (6):
  clk: rockchip: add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and
    uart clocks
  clk: rockchip: fix i2s gate bits on rk3066 and rk3188
  dt-bindings: display: add #sound-dai-cells property to rockchip rk3066
    hdmi
  ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
  ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
  ARM: dts: rockchip: enable hdmi_sound and i2s0 for rk3066a-mk808

Zheng Yang (1):
  drm: rockchip: add sound support to rk3066 hdmi driver

 .../display/rockchip/rockchip,rk3066-hdmi.yaml     |   4 +
 arch/arm/boot/dts/rk3066a-mk808.dts                |   8 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  17 ++
 drivers/clk/rockchip/clk-rk3188.c                  |  35 +--
 drivers/gpu/drm/rockchip/Kconfig                   |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 275 ++++++++++++++++++++-
 6 files changed, 323 insertions(+), 18 deletions(-)

--
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
