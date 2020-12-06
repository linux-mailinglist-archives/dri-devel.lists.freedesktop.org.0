Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B02D0C56
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0BC6E81D;
	Mon,  7 Dec 2020 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2806E0B7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 13:34:07 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c7so10801142edv.6
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 05:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ClADTS0QuKL62E36tFTJGwg2N6O3ikpA70hf73VQQnA=;
 b=CfD7avGjj9/HgOdFJm+Jgte+0mkMn+vGKFsqCQBDCZ50PATgRCsdgmcytM62CytxJC
 rvoAvmj62E3Fr8aYb3+wz3KU0pQ5tky/PGHGKhwth6triY4yAZRF9ayyBvVmA5HAp09P
 GW63o62egMZJHFzOX8EFlLGGbIj9FbCeI/fC99/r3EUs7hnZDLRqHi3fHe3NaYBUvi/L
 nq+BPdt0JUKhyhaUFbnmjY7niejby0WuKHKarxrQiTeI2BEEl1KFyw9cAXSb3CBRKOx8
 yPXMonW2DgspzsUmWeu0dsKjV4AokqjBVObeHzytEsmZF0vAqySZm5Hz0fyTciWeK2TC
 6Uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ClADTS0QuKL62E36tFTJGwg2N6O3ikpA70hf73VQQnA=;
 b=muK8tmI3DS9Lp4vwYNxGIclAu95i+C26d6ydC/p5VNakzHeZ5zajovW8XqoHHQx4EE
 qc34BHg+IfxTjfKi6woKvAtEWYqaI70CKVRNqYWckmb1VFqTfjVMqNTK4Ra3J7xHp/3K
 HmotCDY4dQMc1pX6/7a0aECKw1ntKIo0MyLmwytuyz4sDsvqZpl+5dqVBPjo2mWY2nCK
 R0dHK+0CtZFWyyZJZePz5BCfuCWE3R/FbWo02sErXypkLjuVQsVVP2TWm1DSfS2XrhQJ
 LZ0mBVIMJ+0aJ7uRtIFrAmRsHLAZ1kbcJwPndjZEpxro3jq+EUo9FvbrcoXdzujaOTTO
 jacg==
X-Gm-Message-State: AOAM533ixFnhg61w0DqWT9r8jsReV4atjlMX3e8xrw+obhfs2NHueLXg
 0S8CQP7c6fYrHmL38fyGe2A=
X-Google-Smtp-Source: ABdhPJwPC3fbAsKPZT91sG3R8CMEf4NtuXxEwAQprJeqKkicBpn3851hCBqQkQzBx3hOuH58dimu0A==
X-Received: by 2002:aa7:db59:: with SMTP id n25mr14352860edt.203.1607261645894; 
 Sun, 06 Dec 2020 05:34:05 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:05 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 0/5] Enable rk3066a HDMI sound
Date: Sun,  6 Dec 2020 14:33:50 +0100
Message-Id: <20201206133355.16007-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the rk3066a HDMI documents with a #sound-dai-cells property.
Include the code for sound in the HDMI driver.
Add a simple-sound-card compatible node to rk3066a.dtsi,
because I2S0 and HDMI TX are connected internally.
And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.

make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- -j4
cp ./arch/arm/boot/zImage ../zImage-dtb
cat ./arch/arm/boot/dts/rk3066a-mk808.dtb >> ../zImage-dtb
../tools/rkcrc -k ../zImage-dtb ../mk808.img
sudo ../tools/rkflashtool w 0x4000 0x8000 < ../mk808.img
sudo ../tools/rkflashtool b

Changed v6:
  remove patches that are applied to linux-next
  add platform_device_unregister()
  restyle

Changed v5:
  removed unused variable
  fill frame structure

Johan Jonker (4):
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
 drivers/gpu/drm/rockchip/Kconfig                   |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 277 ++++++++++++++++++++-
 5 files changed, 307 insertions(+), 1 deletion(-)

-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
