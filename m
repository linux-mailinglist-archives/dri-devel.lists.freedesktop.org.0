Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EBA2B77DB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB72A6E413;
	Wed, 18 Nov 2020 08:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F46E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:45:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t9so23746039edq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 11:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7FuTWq4BSG35jYcVC2y/aAokRjHupx3BOtYk6g9sB7k=;
 b=bEGG7+pWjohHYGCns+rU7864961TKkiTrUm42uvT6LxfEO1YbnvJekuitA/BWkBKCo
 qsN7cTlm7OY2hRiTAQmLfnUp5/8RZkKp3Z1cgY6qHSkU2RUHKqAoAI1oAj92qbp+41pe
 b6MjEliAQcKXdDVxBibvY1dzSUPVoAUuBdgwaCY1IAT2zds2yNeNwWnKqoWmVMTxDpmU
 Akl7TpvzvH5UZnc2SzUfp1e4+K8aIFpDLyllv88lW4vf7WvlidV+fOa2lO/WErCtz9Eb
 wrQ/xv8kRnYDHyi6GvBxmPENKiQuoaJ2MA8DAOb2WxOwi6mr7o/5gY81Y8VYrIQ0wr9s
 1piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7FuTWq4BSG35jYcVC2y/aAokRjHupx3BOtYk6g9sB7k=;
 b=UuRmS6W7RCdZt2qmIMThDaFjafuzHITsiDVPk6Z2R9EbHz5mtHSuuUp4gC9LNoQuYQ
 4dHXyM2m0iVEfsHEh2k359VTbH/iZhicylI6f9thE+rhfP9i2FqGnr7PpP4wqwWhcyRT
 Yq+9sTHTc8Jmjm/7K29XRwkc7YBKy5hRM6L+FDpVmVptYXJBy0i939YKvNmqH1oBcchy
 r3kFmb666Obr4vjwKVfgfc/aK8BhSVCCj3DOAanRoPvg0IX1X7iBxPmTe20AHDlvkPSy
 MQVcdei1jjif+sVWtlM1PhwDHeY144cU0r+07RGOz6InPXZl+FD0GObgow9wK0WaPyMY
 XnwQ==
X-Gm-Message-State: AOAM531Ujk1TjeTs7yr2cm+CP8CS6Bfky6l2PJevwBSWvhqOoGcDHnb7
 mm2ymi+Z84guUNubKzKRghg=
X-Google-Smtp-Source: ABdhPJwioSe6dJaxInh8X3IisG9hWd9obKO0KYfxQKA8qdRvbEI9nQjadusnXlOz4yN8QPtxAn5+Fg==
X-Received: by 2002:aa7:df82:: with SMTP id b2mr21560851edy.251.1605642316279; 
 Tue, 17 Nov 2020 11:45:16 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:15 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 0/7] Enable rk3066a HDMI sound
Date: Tue, 17 Nov 2020 20:45:00 +0100
Message-Id: <20201117194507.14843-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 272 ++++++++++++++++++++-
 6 files changed, 320 insertions(+), 18 deletions(-)

--
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
