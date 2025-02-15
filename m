Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF84A36A33
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 01:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E2E10E0EF;
	Sat, 15 Feb 2025 00:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QWYreGa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099B310E119
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739580953;
 bh=nIXcpxIUSKHDj4yKjrFu8Z6Y37bAcj6b8+fVzwIrLgY=;
 h=From:Subject:Date:To:Cc:From;
 b=QWYreGa/6yH2TXVLCawRPa35+LxXk1hZym5F2VlQ/OyTS+GV8svkU/rjrS39UK8Mk
 4Sq7DqMdekxG1Cthb89kmnzRgRt3PJ6CHaVPKm3sQ1+gI/0/svXob35j6BFjADRuEx
 1B5+KfOda3u2ens8t/F5O7sxoeq/ZPrmGk7cCLon8fhAOjx9jHqgse+d9EWZWs6kuw
 GYymbHStNxvxdHakffxSE3+dSlIkI4iyEaks1mH6x7GBI7BcFopC/Qx4oRXZuCtDKa
 Hbj8/d+5Q2XxFvx7kMX9sRLCN9B+9J46DlleRinvN1d7u5/DEUUXi+KcqGhkmnSUWk
 PlqX7CTWZxZ/g==
Received: from localhost (144.232.221.87.dynamic.jazztel.es [87.221.232.144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 613E817E0239;
 Sat, 15 Feb 2025 01:55:53 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Improve Rockchip VOP2 display modes handling on RK3588
 HDMI1
Date: Sat, 15 Feb 2025 02:55:36 +0200
Message-Id: <20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjmr2cC/x3MMQqAMAxA0atIZgM2KBSvIg7VRM2gLQ2IIL27x
 fEN/79gklUMxuaFLLeaxqvCtQ2sR7h2QeVqoI6GjtyAd0yEB5/qkNUSnpHFUILn0JNfVi9Q25R
 l0+f/TnMpH1L0CLVnAAAA
X-Change-ID: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As a followup to getting basic HDMI1 output support [1] merged upstream,
make use of the HDMI1 PHY PLL to provide better VOP2 display modes
handling for the second HDMI output port on RK3588 SoC, similarly to
what has been achieved recently for HDMI0 [2].

Additionally, enable HDMI1 output on Rockchip RK3588 EVB1.

[1] https://lore.kernel.org/lkml/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
[2] https://lore.kernel.org/lkml/20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (4):
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 42 ++++++++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi   | 22 +++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c     | 26 ++++++++++++++-
 3 files changed, 87 insertions(+), 3 deletions(-)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e

