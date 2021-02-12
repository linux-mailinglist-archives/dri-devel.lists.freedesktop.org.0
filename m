Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4ED31A50D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 20:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4A86E201;
	Fri, 12 Feb 2021 19:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9CE6E201
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 19:11:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id a24so337955plm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 11:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUQPqGrqOjvv+mPHTG6J4xufRDhb/jwG8dfmae0QgUA=;
 b=toh7dDdb0nclYftk7bpns5Fsk1Xg81Vo3sQTpUVnKXXdrY1jgRgMj9LYsN7+ssU+Wj
 1MEf6A1x0Of/nqpi6xcBgNBxZMLfKtkFoZsyE1VsNveM6/2YjmqBUKtChvxdgw+s9UPH
 tY9wPpmE2y/xYtV7xO+AK1uDuBV7UXbT7MTGRNwn7cI+S76+Jn8L4AwlnLmLc0x9YzSB
 9Sf3F5HTmC0/+BCTsGH8+9Arkb3BO8jugZ58e/5yRg0bi9olri7c7IJNVWIahCpbmJWi
 Mw/pSg4Sz3o8EdQg/cjmkn6BTBbu3x4+yqVVEjizE4/PwbPtaIfpu7cNeaxQUYotfxh0
 znnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUQPqGrqOjvv+mPHTG6J4xufRDhb/jwG8dfmae0QgUA=;
 b=H7bcFd+rifFwHtYeWGvAscw+ll9rKMeNmv+TIPB+LI/3k2/Q5g4Mr+kPWSfStjCHY0
 2Ami8lEv1/MfjHWjqOoqgxP5Q4uPbNC0OiBozjh0E+/1JI1ab3e4aA+9qy9QCISRgXli
 j5jAudxoQ1YDzBJWtvFFHf6yqhHwGhRM3GlYR8FxaksPdUGRGq0t7Fe03ANKC+4HUk9X
 ymBan2eEr/4xAjzrZr7Cdh9yw4KPe/GzoMc1I4Xt2l5K2Q6LdlpMI62v6jeWNtC+ykYQ
 qqNzISCqeuVywRUgas/twxu61AaKA+9/sW1Ff+IUc/0XoRXlWvILtl1pP8Olw8FXFMWm
 UY/w==
X-Gm-Message-State: AOAM533UnObieebOkfLbBN+VNZVxk92Ox2Yq96K1EfRYUg8d+fLHwXq0
 X79IruPhs1yhHE8zWLN5HZA=
X-Google-Smtp-Source: ABdhPJzFJrubDP2iMk1Rg4vVAO4Pk2i8PW6t8ita0jcI9KziOc69D9GASt3DCwIgqERu6wx/KarI4A==
X-Received: by 2002:a17:90a:657:: with SMTP id
 q23mr4082954pje.192.1613157068162; 
 Fri, 12 Feb 2021 11:11:08 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 21sm9453862pfh.56.2021.02.12.11.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 11:11:07 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt controller"
Date: Fri, 12 Feb 2021 11:11:04 -0800
Message-Id: <20210212191104.2365912-1-f.fainelli@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 maxime@cerno.tech, dave.stevenson@raspberrypi.com, maz@kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, tzimmermann@suse.de,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, nsaenzjulienne@suse.de,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As Dave reported:

This seems to have unintended side effects.  GIC interrupt 117 is shared
between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
handling the HDMI I2C interrupts.

There is not a great way to share an interrupt between an interrupt
controller using the chained IRQ handler which is an interrupt flow and
another driver like i2c-bcm2835 which uses an interrupt handler
(although it specifies IRQF_SHARED).

Simply revert this change for now which will mean that HDMI I2C will be
polled, like it was before.

Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 462b1dfb0385..720beec54d61 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -308,14 +308,6 @@ dvp: clock@7ef00000 {
 			#reset-cells = <1>;
 		};
 
-		bsc_intr: interrupt-controller@7ef00040 {
-			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
-			reg = <0x7ef00040 0x30>;
-			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-controller;
-			#interrupt-cells = <1>;
-		};
-
 		aon_intr: interrupt-controller@7ef00100 {
 			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
 			reg = <0x7ef00100 0x30>;
@@ -362,8 +354,6 @@ ddc0: i2c@7ef04500 {
 			reg = <0x7ef04500 0x100>, <0x7ef00b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
-			interrupt-parent = <&bsc_intr>;
-			interrupts = <0>;
 			status = "disabled";
 		};
 
@@ -405,8 +395,6 @@ ddc1: i2c@7ef09500 {
 			reg = <0x7ef09500 0x100>, <0x7ef05b00 0x300>;
 			reg-names = "bsc", "auto-i2c";
 			clock-frequency = <97500>;
-			interrupt-parent = <&bsc_intr>;
-			interrupts = <1>;
 			status = "disabled";
 		};
 	};
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
