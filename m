Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE101B446E4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0E410EAC4;
	Thu,  4 Sep 2025 20:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Zn/srWWC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YtH3LAQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E3810EAC4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:02:57 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHr4c2sLkz9tPv;
 Thu,  4 Sep 2025 22:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ujq7kskoLAqmrZNGfQtBuJEdgNeVnRzYoILv1x6cobg=;
 b=Zn/srWWCkogn/ZDdDybB6qW61n5f1mqGLaQ7wig5GVmbimkVwPOJrCnGS0oyMKDxGt/TRs
 RODdmRhAdJr/xoB1kZcUvGTixNkWCXCG0u7Nj35VsR/66GLO1vTPk53jSbnduOuYdM4PQt
 Is43WDIIG/iNcfGd4hkTNMwG2DGL4+0/8JQmXb3eZKIJl6XWAgNJ6cCIqwXYlyU6WSglMi
 M75IyRD9/A5vBJcQx/63OOhIy1P5sacWbks/6leySd2SDUnsg5VqQmbtdee1Mpsyd3jPAV
 6Gncs6/BaEAFopqlJIXnpe3ldiorDcgxILPvUmJg8atM5Z/Vo0Qds9eLFDwHuw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ujq7kskoLAqmrZNGfQtBuJEdgNeVnRzYoILv1x6cobg=;
 b=YtH3LAQklhaJjs3NSYnMQ4x6a8VH+FuYmYajianI5Yn0cFeEQwjYlEx6u6DbmY3CbnPdes
 FA+7JWju6tWed3oP9nSfpipDSkNe7QX39GR1qyKUe8o8GRVopCjpJcCPYZn8GFDrz/kYR2
 Un064UxPgkvgjgyCMaigQEbZKjWqQIUTXmC4+3gGUZJHINVah6jU1ptKYziG8EZeeh/bvU
 pVvXw1wfDHkh5nyzQaCAPnU4g80cI5+ZnYh2UaWANKqsJhPgt2AIZsWcCtRUHxXl8DxOxo
 cUxPFPUetw70clRItaCF7f70fqOWF+YmfqwUlrvMimuE3d/139HXIiw28Eh5MA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: ilitek-ili9881c: Add configuration for 5"
 Raspberry Pi 720x1280
Date: Thu,  4 Sep 2025 22:01:55 +0200
Message-ID: <20250904200238.168307-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
References: <20250904200238.168307-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: pm5xynbzapbat43ncqcc6r1rmhcaaqrd
X-MBO-RS-ID: 9fbc25e32d43eeaf0ae
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

Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
based on ili9881. This uses 10px longer horizontal sync pulse
and 10px shorter HBP to avoid very short hsync pulse.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 214 ++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 39929c6ebdad9..98c6b28691e42 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1224,6 +1224,194 @@ static const struct ili9881c_instr am8001280g_init[] = {
 	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
 };
 
+static const struct ili9881c_instr rpi_5inch_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x73),
+	ILI9881C_COMMAND_INSTR(0x04, 0x73),
+	ILI9881C_COMMAND_INSTR(0x05, 0x00),
+	ILI9881C_COMMAND_INSTR(0x06, 0x06),
+	ILI9881C_COMMAND_INSTR(0x07, 0x02),
+	ILI9881C_COMMAND_INSTR(0x08, 0x00),
+	ILI9881C_COMMAND_INSTR(0x09, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x01),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x01),
+	ILI9881C_COMMAND_INSTR(0x10, 0x01),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x01),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x04),
+	ILI9881C_COMMAND_INSTR(0x21, 0x03),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x03),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x03),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x00),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+	ILI9881C_COMMAND_INSTR(0x50, 0x01),
+	ILI9881C_COMMAND_INSTR(0x51, 0x23),
+	ILI9881C_COMMAND_INSTR(0x52, 0x45),
+	ILI9881C_COMMAND_INSTR(0x53, 0x67),
+	ILI9881C_COMMAND_INSTR(0x54, 0x89),
+	ILI9881C_COMMAND_INSTR(0x55, 0xab),
+	ILI9881C_COMMAND_INSTR(0x56, 0x01),
+	ILI9881C_COMMAND_INSTR(0x57, 0x23),
+	ILI9881C_COMMAND_INSTR(0x58, 0x45),
+	ILI9881C_COMMAND_INSTR(0x59, 0x67),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
+	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
+	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
+	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
+	ILI9881C_COMMAND_INSTR(0x5e, 0x10),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x09),
+	ILI9881C_COMMAND_INSTR(0x60, 0x08),
+	ILI9881C_COMMAND_INSTR(0x61, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x63, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x64, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x65, 0x02),
+	ILI9881C_COMMAND_INSTR(0x66, 0x02),
+	ILI9881C_COMMAND_INSTR(0x67, 0x02),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x06),
+	ILI9881C_COMMAND_INSTR(0x72, 0x07),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x06),
+	ILI9881C_COMMAND_INSTR(0x76, 0x07),
+	ILI9881C_COMMAND_INSTR(0x77, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x78, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x79, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x80, 0x02),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x02),
+	ILI9881C_COMMAND_INSTR(0x83, 0x02),
+	ILI9881C_COMMAND_INSTR(0x84, 0x02),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x09),
+	ILI9881C_COMMAND_INSTR(0x88, 0x08),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x2a),
+	ILI9881C_COMMAND_INSTR(0x6F, 0x57),
+	ILI9881C_COMMAND_INSTR(0x3A, 0xa4),
+	ILI9881C_COMMAND_INSTR(0x8D, 0x1a),
+	ILI9881C_COMMAND_INSTR(0x87, 0xba),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xd1),
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x53, 0x35),
+	ILI9881C_COMMAND_INSTR(0x55, 0x50),
+	ILI9881C_COMMAND_INSTR(0x50, 0xaf),
+	ILI9881C_COMMAND_INSTR(0x51, 0xaf),
+	ILI9881C_COMMAND_INSTR(0x60, 0x14),
+	ILI9881C_COMMAND_INSTR(0xA0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xA1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xA2, 0x2c),
+	ILI9881C_COMMAND_INSTR(0xA3, 0x14),
+	ILI9881C_COMMAND_INSTR(0xA4, 0x19),
+	ILI9881C_COMMAND_INSTR(0xA5, 0x2e),
+	ILI9881C_COMMAND_INSTR(0xA6, 0x22),
+	ILI9881C_COMMAND_INSTR(0xA7, 0x23),
+	ILI9881C_COMMAND_INSTR(0xA8, 0x97),
+	ILI9881C_COMMAND_INSTR(0xA9, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xAA, 0x29),
+	ILI9881C_COMMAND_INSTR(0xAB, 0x7b),
+	ILI9881C_COMMAND_INSTR(0xAC, 0x18),
+	ILI9881C_COMMAND_INSTR(0xAD, 0x17),
+	ILI9881C_COMMAND_INSTR(0xAE, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xAF, 0x1f),
+	ILI9881C_COMMAND_INSTR(0xB0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xB1, 0x52),
+	ILI9881C_COMMAND_INSTR(0xB2, 0x63),
+	ILI9881C_COMMAND_INSTR(0xB3, 0x39),
+	ILI9881C_COMMAND_INSTR(0xC0, 0x08),
+	ILI9881C_COMMAND_INSTR(0xC1, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xC2, 0x2c),
+	ILI9881C_COMMAND_INSTR(0xC3, 0x14),
+	ILI9881C_COMMAND_INSTR(0xC4, 0x19),
+	ILI9881C_COMMAND_INSTR(0xC5, 0x2e),
+	ILI9881C_COMMAND_INSTR(0xC6, 0x22),
+	ILI9881C_COMMAND_INSTR(0xC7, 0x23),
+	ILI9881C_COMMAND_INSTR(0xC8, 0x97),
+	ILI9881C_COMMAND_INSTR(0xC9, 0x1e),
+	ILI9881C_COMMAND_INSTR(0xCA, 0x29),
+	ILI9881C_COMMAND_INSTR(0xCB, 0x7b),
+	ILI9881C_COMMAND_INSTR(0xCC, 0x18),
+	ILI9881C_COMMAND_INSTR(0xCD, 0x17),
+	ILI9881C_COMMAND_INSTR(0xCE, 0x4b),
+	ILI9881C_COMMAND_INSTR(0xCF, 0x1f),
+	ILI9881C_COMMAND_INSTR(0xD0, 0x27),
+	ILI9881C_COMMAND_INSTR(0xD1, 0x52),
+	ILI9881C_COMMAND_INSTR(0xD2, 0x63),
+	ILI9881C_COMMAND_INSTR(0xD3, 0x39),
+};
+
 static const struct ili9881c_instr rpi_7inch_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(3),
 	ILI9881C_COMMAND_INSTR(0x01, 0x00),
@@ -1806,6 +1994,23 @@ static const struct drm_display_mode am8001280g_default_mode = {
 	.height_mm	= 151,
 };
 
+static const struct drm_display_mode rpi_5inch_default_mode = {
+	.clock		= 83333,
+
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 110,
+	.hsync_end	= 720 + 110 + 12,
+	.htotal		= 720 + 110 + 12 + 95,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 100,
+	.vsync_end	= 1280 + 100 + 2,
+	.vtotal		= 1280 + 100 + 2 + 100,
+
+	.width_mm	= 62,
+	.height_mm	= 110,
+};
+
 static const struct drm_display_mode rpi_7inch_default_mode = {
 	.clock          = 83330,
 
@@ -2000,6 +2205,14 @@ static const struct ili9881c_desc am8001280g_desc = {
 		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
 };
 
+static const struct ili9881c_desc rpi_5inch_desc = {
+	.init = rpi_5inch_init,
+	.init_length = ARRAY_SIZE(rpi_5inch_init),
+	.mode = &rpi_5inch_default_mode,
+	.mode_flags =  MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM,
+	.lanes = 2,
+};
+
 static const struct ili9881c_desc rpi_7inch_desc = {
 	.init = rpi_7inch_init,
 	.init_length = ARRAY_SIZE(rpi_7inch_init),
@@ -2025,6 +2238,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
+	{ .compatible = "raspberrypi,dsi-5inch", &rpi_5inch_desc },
 	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },
 	{ }
 };
-- 
2.50.1

