Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495703E16AE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF506EA7C;
	Thu,  5 Aug 2021 14:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p04-ob.smtp.rzone.de (mo4-p04-ob.smtp.rzone.de
 [81.169.146.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBDC6E890
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172485;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=haIqt6GlUDch6wOoawc5NT0KlRKMAzO5+gFOCg+ophI=;
 b=CvWwifqBBkVJTVNTD43Q5t6Vfye2VcaxSmuBKVm8w8WuYWfbr17Zy+iQUJkQEEqfuZ
 2PGS8FAgYR+v+SOmSXRVpbSWj2EaFdajoxsVLyx+egXI2HvComGFlU0DQHsRKcTUggd8
 XOewEh3mer8Qp12RsNMgNb4mVYGoDrKamXJRHZ6YziD7/YWK5ODIns0j1ixZQKWcVM8x
 wJfdOIS3l7/r1f1xpHQWgBQP+COgPe2J3FJtNDWTMVHCq1OziAQK9UQ/6u5xDMFdzwki
 7FnFlw1WhiAOqCdNADwus1pVbfphG/1smaZx9bVGa5euKxEwZxWcFdACedqIsuG6EzXi
 N8ZQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75E84788
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 16:08:04 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] MIPS: CI20: defconfig: configure for DRM_DW_HDMI_JZ4780
Date: Thu,  5 Aug 2021 16:07:56 +0200
Message-Id: <a3bf435628f1b72471d5e1305224347b320b21ea.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Enable CONFIG options as modules.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index ab7ebb0668340..9d47163011ab6 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -98,7 +98,14 @@ CONFIG_RC_DEVICES=y
 CONFIG_IR_GPIO_CIR=m
 CONFIG_IR_GPIO_TX=m
 CONFIG_MEDIA_SUPPORT=m
+CONFIG_DRM=m
+CONFIG_DRM_INGENIC=m
+CONFIG_DRM_INGENIC_DW_HDMI=y
 # CONFIG_VGA_CONSOLE is not set
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
 # CONFIG_HID is not set
 CONFIG_USB=y
 CONFIG_USB_STORAGE=y
-- 
2.31.1

