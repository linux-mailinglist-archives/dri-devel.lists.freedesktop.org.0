Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D0C38CF5
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 03:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AF410E7E6;
	Thu,  6 Nov 2025 02:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="LQ55vCVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD3C10E7E6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1762394953;
 bh=dlreJtu1yTZc+3gYynIBMms0O05/ZWzTxS4Cx5D33aA=;
 h=From:To:Subject:Date:Message-Id;
 b=LQ55vCVH9CHuFzuObZIuvGTAhxqugugH5K9FaFA40zNX3Cm7OmrMci4edyHRgwIbd
 ujwS1cKFHaZYRrieCVZBXDYgwE3RBtAIiFW9iXZehxeqvJXeheBdbaridRng8yxJcH
 C5CwCpdPb060PKiHVaY+78cMAB6D+DJup4JFQBe4=
X-QQ-mid: esmtpgz15t1762394822t3dff838e
X-QQ-Originating-IP: otWT7nKKGfQI+mkYDiDkRHYGEnaihLiw+FDQpRrNMKw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Nov 2025 10:07:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8019224694940531236
From: Chaoyi Chen <kernel@airkyi.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 5/9] drm/panel: ilitek-ili9881d: Add support for Wanchanglong
 W552946AAA panel
Date: Thu,  6 Nov 2025 10:06:28 +0800
Message-Id: <20251106020632.92-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NE0zvlF9r1i0GpodTDUCTPs/ZCdm834dy5+/DdMBFRRPZielb2zZ79aC
 PYF/zVC11l+CLmkmIdMV6jZshv0duMiFgmgjEgBfZ4hpaHr5weXc0Csawk+pQiGvReSW5dK
 hj4YDopFqSBiXo8J7L5bX4VEHLm+VQSLlhqxpWTtDnJmPHX6oV0KCWEBYqV0b/ztyeIc8Ot
 t6Eiau8yQal4dOZPeoV3jRuQLwfv3yHo7/elVQqa0jU93YCweBVnThVUYN/jyKZ4bO5T3pk
 9v6KwUwqMGweh4VLtzewiVJpzu0cM7mH+N4a/mk3BLZWWP3lRaD8T42MtPyNmzZ5es65aTP
 GxBcP8zGdIWfHUmdAy4hF6dDtX5uHGD1XCH3DYsVl/NwEDbNIDJtjmrqk5XFP3tIA+r8gIB
 F3gxx/IeLaJeQiJxOh1y3ehsK0hcwnncvP6nIV/Z9UC8OZ7fzbfxTXpPrypP6ONwH4HZBaM
 +V/wmHDTS/eyBgPV4nJ4DvFLEepn1eXIE7AiorPZVgDZcbhTU5j4ykmWXcfVPOtjoWAhaGo
 6mJn3CUxfpgnmRs2N4Bx4vZiBxbaYdabRr/KFh7IdWq8wvvV3KjP2FnNuhm4Mo851Y57Ezh
 XKoOhf4fb98Ojd9Jvn1Nh92oIaIsTJnY9Lu1bXMfjkPrP4VbZ7ZkDtCKUkLjKRJHHklSZAW
 HTt4m3RINM2g1hZkfXfQWh1woxsZ41od42EtpLzRwv1nKaQ7V+jSMd7y7wiU/TNwL024x/C
 XIU7DlkoWNqWaibwbzo56j4nay7w1c12oIDJbP/6tUJw4tuiKs09iBCs3doBqcN5zWSJ01I
 kyQtB9ZoB+pGWguJrqjBBqb0cXAb75DsrkOZaOBWnZjIdxNagFn31upxLDZ5GljNDcqcKdi
 CxL3X+DqTYkyqL1DNWOWEteRRmw+MmUS1gu8N/W62w+3Qpuxrg9wvAODk/vjRFyP5KZu4kf
 wvZM+Hlf7ZU3H+CRhP1H8A/Z7AcXsUxwQjg7z/FPQly0kZ4n5Zj0xTP0aGsI9TEJmY8v5r9
 F6hph/Aw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

W552946AAA is a panel by Wanchanglong. This panel utilizes the
Ilitek ILI9881D controller.

W552946AAA is similar to W552946ABA, but the W552946AAA only
uses 2 lanes.

Tested on rk3506g-evb1-v10.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 225 ++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ad4993b2f92a..9b3e9450808d 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -820,6 +820,204 @@ static const struct ili9881c_instr tl050hdv35_init[] = {
 	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
 };
 
+static const struct ili9881c_instr w552946aaa_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x53),
+	ILI9881C_COMMAND_INSTR(0x04, 0x53),
+	ILI9881C_COMMAND_INSTR(0x05, 0x13),
+	ILI9881C_COMMAND_INSTR(0x06, 0x04),
+	ILI9881C_COMMAND_INSTR(0x07, 0x02),
+	ILI9881C_COMMAND_INSTR(0x08, 0x02),
+	ILI9881C_COMMAND_INSTR(0x09, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x10, 0x00),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x08),
+	ILI9881C_COMMAND_INSTR(0x16, 0x10),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x08),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x02),
+	ILI9881C_COMMAND_INSTR(0x21, 0x09),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x55),
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
+	ILI9881C_COMMAND_INSTR(0x34, 0x04),
+	ILI9881C_COMMAND_INSTR(0x35, 0x05),
+	ILI9881C_COMMAND_INSTR(0x36, 0x05),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3c),
+	ILI9881C_COMMAND_INSTR(0x39, 0x35),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x40),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x88),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x1f),
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
+	ILI9881C_COMMAND_INSTR(0x5e, 0x03),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x14),
+	ILI9881C_COMMAND_INSTR(0x60, 0x15),
+	ILI9881C_COMMAND_INSTR(0x61, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x63, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x64, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x65, 0x10),
+	ILI9881C_COMMAND_INSTR(0x66, 0x11),
+	ILI9881C_COMMAND_INSTR(0x67, 0x08),
+	ILI9881C_COMMAND_INSTR(0x68, 0x02),
+	ILI9881C_COMMAND_INSTR(0x69, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
+	ILI9881C_COMMAND_INSTR(0x70, 0x02),
+	ILI9881C_COMMAND_INSTR(0x71, 0x02),
+	ILI9881C_COMMAND_INSTR(0x72, 0x06),
+	ILI9881C_COMMAND_INSTR(0x73, 0x02),
+	ILI9881C_COMMAND_INSTR(0x74, 0x02),
+	ILI9881C_COMMAND_INSTR(0x75, 0x14),
+	ILI9881C_COMMAND_INSTR(0x76, 0x15),
+	ILI9881C_COMMAND_INSTR(0x77, 0x0f),
+	ILI9881C_COMMAND_INSTR(0x78, 0x0e),
+	ILI9881C_COMMAND_INSTR(0x79, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x7a, 0x0c),
+	ILI9881C_COMMAND_INSTR(0x7b, 0x11),
+	ILI9881C_COMMAND_INSTR(0x7c, 0x10),
+	ILI9881C_COMMAND_INSTR(0x7d, 0x06),
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
+	ILI9881C_COMMAND_INSTR(0x7f, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x80, 0x02),
+	ILI9881C_COMMAND_INSTR(0x81, 0x02),
+	ILI9881C_COMMAND_INSTR(0x82, 0x02),
+	ILI9881C_COMMAND_INSTR(0x83, 0x02),
+	ILI9881C_COMMAND_INSTR(0x84, 0x02),
+	ILI9881C_COMMAND_INSTR(0x85, 0x02),
+	ILI9881C_COMMAND_INSTR(0x86, 0x02),
+	ILI9881C_COMMAND_INSTR(0x87, 0x02),
+	ILI9881C_COMMAND_INSTR(0x88, 0x08),
+	ILI9881C_COMMAND_INSTR(0x89, 0x02),
+	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x00, 0x80),
+	ILI9881C_COMMAND_INSTR(0x70, 0x00),
+	ILI9881C_COMMAND_INSTR(0x71, 0x00),
+	ILI9881C_COMMAND_INSTR(0x66, 0xfe),
+	ILI9881C_COMMAND_INSTR(0x82, 0x15),
+	ILI9881C_COMMAND_INSTR(0x84, 0x15),
+	ILI9881C_COMMAND_INSTR(0x85, 0x15),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x24),
+	ILI9881C_COMMAND_INSTR(0x32, 0xac),
+	ILI9881C_COMMAND_INSTR(0x8c, 0x80),
+	ILI9881C_COMMAND_INSTR(0x3c, 0xf5),
+	ILI9881C_COMMAND_INSTR(0x88, 0x33),
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x53, 0x78),
+	ILI9881C_COMMAND_INSTR(0x55, 0x7b),
+	ILI9881C_COMMAND_INSTR(0x60, 0x20),
+	ILI9881C_COMMAND_INSTR(0x61, 0x00),
+	ILI9881C_COMMAND_INSTR(0x62, 0x0d),
+	ILI9881C_COMMAND_INSTR(0x63, 0x00),
+	ILI9881C_COMMAND_INSTR(0xa0, 0x00),
+	ILI9881C_COMMAND_INSTR(0xa1, 0x10),
+	ILI9881C_COMMAND_INSTR(0xa2, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xa3, 0x13),
+	ILI9881C_COMMAND_INSTR(0xa4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xa5, 0x26),
+	ILI9881C_COMMAND_INSTR(0xa6, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xa7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xa8, 0x67),
+	ILI9881C_COMMAND_INSTR(0xa9, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xaa, 0x29),
+	ILI9881C_COMMAND_INSTR(0xab, 0x5b),
+	ILI9881C_COMMAND_INSTR(0xac, 0x26),
+	ILI9881C_COMMAND_INSTR(0xad, 0x28),
+	ILI9881C_COMMAND_INSTR(0xae, 0x5c),
+	ILI9881C_COMMAND_INSTR(0xaf, 0x30),
+	ILI9881C_COMMAND_INSTR(0xb0, 0x31),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x32),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x00),
+	ILI9881C_COMMAND_INSTR(0xb1, 0x2e),
+	ILI9881C_COMMAND_INSTR(0xb2, 0x32),
+	ILI9881C_COMMAND_INSTR(0xb3, 0x00),
+	ILI9881C_COMMAND_INSTR(0xb6, 0x02),
+	ILI9881C_COMMAND_INSTR(0xb7, 0x03),
+	ILI9881C_COMMAND_INSTR(0xc0, 0x00),
+	ILI9881C_COMMAND_INSTR(0xc1, 0x10),
+	ILI9881C_COMMAND_INSTR(0xc2, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xc3, 0x13),
+	ILI9881C_COMMAND_INSTR(0xc4, 0x15),
+	ILI9881C_COMMAND_INSTR(0xc5, 0x26),
+	ILI9881C_COMMAND_INSTR(0xc6, 0x1a),
+	ILI9881C_COMMAND_INSTR(0xc7, 0x1d),
+	ILI9881C_COMMAND_INSTR(0xc8, 0x67),
+	ILI9881C_COMMAND_INSTR(0xc9, 0x1c),
+	ILI9881C_COMMAND_INSTR(0xca, 0x29),
+	ILI9881C_COMMAND_INSTR(0xcb, 0x5b),
+	ILI9881C_COMMAND_INSTR(0xcc, 0x26),
+	ILI9881C_COMMAND_INSTR(0xcd, 0x28),
+	ILI9881C_COMMAND_INSTR(0xce, 0x5c),
+	ILI9881C_COMMAND_INSTR(0xcf, 0x30),
+	ILI9881C_COMMAND_INSTR(0xd0, 0x31),
+	ILI9881C_COMMAND_INSTR(0xd1, 0x2e),
+	ILI9881C_COMMAND_INSTR(0xd2, 0x32),
+	ILI9881C_COMMAND_INSTR(0xd3, 0x00),
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+};
+
 static const struct ili9881c_instr w552946ab_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(3),
 	ILI9881C_COMMAND_INSTR(0x01, 0x00),
@@ -1772,6 +1970,23 @@ static const struct drm_display_mode tl050hdv35_default_mode = {
 	.height_mm	= 110,
 };
 
+static const struct drm_display_mode w552946aaa_default_mode = {
+	.clock		= 65000,
+
+	.hdisplay	= 720,
+	.hsync_start	= 720 + 52,
+	.hsync_end	= 720 + 52 + 8,
+	.htotal		= 720 + 52 + 8 + 48,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 16,
+	.vsync_end	= 1280 + 16 + 6,
+	.vtotal		= 1280 + 16 + 6 + 15,
+
+	.width_mm	= 68,
+	.height_mm	= 121,
+};
+
 static const struct drm_display_mode w552946aba_default_mode = {
 	.clock		= 64000,
 
@@ -1983,6 +2198,15 @@ static const struct ili9881c_desc tl050hdv35_desc = {
 	.default_address_mode = 0x03,
 };
 
+static const struct ili9881c_desc w552946aaa_desc = {
+	.init = w552946aaa_init,
+	.init_length = ARRAY_SIZE(w552946aaa_init),
+	.mode = &w552946aaa_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
+	.lanes = 2,
+};
+
 static const struct ili9881c_desc w552946aba_desc = {
 	.init = w552946ab_init,
 	.init_length = ARRAY_SIZE(w552946ab_init),
@@ -2023,6 +2247,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
 	{ .compatible = "startek,kd050hdfia020", .data = &kd050hdfia020_desc },
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
+	{ .compatible = "wanchanglong,w552946aaa", .data = &w552946aaa_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
 	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },
-- 
2.51.1

