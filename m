Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51C93E556
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF98D10E182;
	Sun, 28 Jul 2024 13:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="W79Hmsjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326AA10E182
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722172087; x=1722776887; i=wahrenst@gmx.net;
 bh=EIb/0BVQLAIWTGsSf2exEUrI6S97uVc10LsFQOB7HdM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=W79Hmsjz7U7XYrhfikB5fA/d87YEALxts+rMUgHZC7K6YKogcwefVd73Px1ngb20
 365JEvCVRYXMhtiEbvA1DyAXJVDqJ1SuUk2mfYuogPsp1OG15PMNTzqM4NP54R0Y4
 rco/BWhEqtLn21wNUdabqv28AeJfmp1xOChXBhFSbNnmF0yoagC2wqa7A6Bri2ikx
 aKa0DI1+Ta02ohrOjk7IW6adAKbC28vJZyQp4VxyIIaQq1Rew4IlM1HqpAkCo34B0
 gS5QEDtNmMJpjkNQB58BsLVzvPBdM0FkqQ996gAfmPFazRgmL3u8pZSMXclP9slo4
 53BDO4YPwK/5UoFbPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1scCMG0Qdv-009Dte; Sun, 28
 Jul 2024 15:08:07 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 16/16] ARM: bcm2835_defconfig: Enable SUSPEND
Date: Sun, 28 Jul 2024 15:00:29 +0200
Message-Id: <20240728130029.78279-8-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VDKN64YJ6p518cmZoBkZcyEycWgxqBiXzFOn7tj34Md65oD5Z+v
 ZyIH2kWrCo7uD/4rinuinIoegUeMNFemd1ZI3kcdichjEYV+XGxQJ0Le6WmlVnI0Zb96mrp
 CrC/znc5FWPOwF+m8fk6KB/L52BwZlWnZJnB6nouviFVAbfZaCVgOgU439aNUNVMIuISRIf
 DTVt762wNfN8J8Lz42eNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dM3fOqR1834=;S1pLtaHrDhNPdNkUIa0I15yIguO
 Z4ExTh1CVbI2XAwJU0xnTJM+/EWJOqr0F1e6NMJwleA6TpewGejD2Qx0Jwf9Jo2g+5wjvPFNU
 Iyl6hMNb43S9FYKt651c+jNhfgCCEqf2UbXvdHos6/m2BArgd1/JGTEssBbObpItkRKxIy2BK
 c3VmdVQJ5ZMc7kvxVKmg0CtynjvYUwbBjVUqJ3hmellCsLI2cCJquD15HPE/JT0wMd/9x0Ixg
 RXoMEFKAQDguz5Sb6cprcJyOrjWmrPVM1iNrWc7uJtQOzWMoQWWsYCJoF+5YfbEUC1jIEcuum
 6H9tKXnjvOpLus+N+pf1BtxuIH+xk2wH/Y4zEb/pnjMKm25yKbeM0gzDHoAQYROdsorX48/46
 DjvLkEWVvMMqEyqr0O6S9OF5/lcVQX7AW4So/EesTHKdesVYYsYn3r7HbRlA8vzZqKtoBpJq6
 g6Z2KYshYwHlqxkbjgDxwz4JHO1CkwUSLMw0BS5ZBHcee23BtjJwVMyFg3Fyl3+zdk2g96vHv
 i5Wzjfe5rghfCDDRRt2IJ7aokGA22Upah8wtrtN90ypv8wm3vgaFbtc8RiTWUUgqfdhb5uH9V
 xyE8xI/b/0EQzz0690FoYI9rzhoyP+raQrW8zO2HbWbu5YLenJsejcfYcaF09DXx3RUWnhexJ
 GwWI75YsJuuZriwPepIFkvx7a14vWdLO5sNtc+/Tq4RL4ibM7hhTCZsbyqka6tdQbHhFA3KdY
 oOuSqF2J01n9R1mjSbzZnD4n5TfSS5gGUs1rIfsMaZzz2a5yf5pKZS4Y4vtIZ3g3xwiCvBWes
 jehdysnWw8gf/IZQgtRodJ4g==
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

Since the Raspberry Pi supports Suspend-To-Idle now, this option
should be enabled. This should make power management testing easier.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 arch/arm/configs/bcm2835_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835=
_defconfig
index b5f0bd8dd536..97632dee1ab3 100644
=2D-- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -38,8 +38,6 @@ CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
 CONFIG_CPUFREQ_DT=3Dy
 CONFIG_ARM_RASPBERRYPI_CPUFREQ=3Dy
 CONFIG_VFP=3Dy
-# CONFIG_SUSPEND is not set
-CONFIG_PM=3Dy
 CONFIG_JUMP_LABEL=3Dy
 CONFIG_MODULES=3Dy
 CONFIG_MODULE_UNLOAD=3Dy
=2D-
2.34.1

