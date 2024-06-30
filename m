Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA7E91D308
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 19:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C07B10E2AC;
	Sun, 30 Jun 2024 17:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kHx9bke4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68310E2AC
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719767983; x=1720372783; i=wahrenst@gmx.net;
 bh=TwgxqCRks5hKhBV/6phe1u8rgr3lRsdIwXbXbOF9qug=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kHx9bke4Kg+R+wEbUy+3WT/t5SdDiSohZME11eY+ImacFKQ+fhcBsZskQZMxriTV
 LZw+i3WwoS14Ry2aOEe+1uS8JMHWz1kuQyTM6PEaTcxwKJyjMUAYz0oAvK+f3nLwh
 +aTs+KzeCE5wAscsHzVEHcJ3vON4zwOqsaGj5/EhCdAv8P1pnX1neNKEpP1J9DLV5
 6SRFhf4gsgFnhXNQN5Spdi/RtWGXxLpgUx8DSl23U5GLj6sCi9DNpH0BaSzSTjitY
 49iCtRaJv/+9IJBGAFs2uHM95/xC85FwzShoO6XkPXYFBk654CpuZAlzgYNgXGW+i
 XRL+EmT/yoAJ4YFiWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1sq7jd0H8o-00ORUC; Sun, 30
 Jun 2024 19:19:43 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 11/11] ARM: bcm2835_defconfig: Enable SUSPEND
Date: Sun, 30 Jun 2024 19:19:26 +0200
Message-Id: <20240630171926.323426-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zqtyf/Sv3ew+qgoOSE4zRrcg9fRFBv468Pq4gY3jUBz8dUdUgD0
 n2jEfMCDPZevDTgfj7KHz/L97w9v3kXpV3immPkEmlIGA/Hbv8bUG6gWxsy1ltCBzIoPssE
 1hELuNvIbsUJatT3gtokpvJWs3DyyLo5R5hHZfS+nOZPBnKFYbRAyPVnT+Qh/Yrj9kpQHKX
 ItTNfpetMB5/vazmEMebA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4JoxQbbPUq0=;EcqCyU0NoxnU+tpxe8XWkVyflO7
 hKcYXlwL6ZpFanEiGw4G5OZR6he0TPBkxMT9h4g6QgIzgZ1qfnZeEJMJxIDGZ5WZYmFm1KzRZ
 zmYee1yAouEtibxABNEodMAQLGvt8YNfasmdJDlBOZR64mtxUXWVwI7QFDoyMPmpXBpaDNSp4
 +qSQkuviA1giKrjF+ZbXFM+CztozF7XHTmoKF/ALl/w36IUaFLcnw0DwCZzCU1HpuHxscU17K
 9MOvvKYGxfGZHm5mPn2/6bGHdXB6R269+t4RytybWp3e7tWetTn/UJBmzE2+H1+VoS3KSaiyp
 qWjcqfUduH4voP0cledTq9DoYZPTqOhxdy9IV/QwftjpKfbfKe++p8wlh9IXdG6+E1fqSJYpg
 vu96P4ElFDdjqQ7WQVf0P91UYRVQlzvH9daRI6QSvXOVRaA+XDQLJ4S8HWDcOTrJCZh5ouWQC
 klNyzJSSFZYNHzNHi3WmWFcsx3QJfDv1c7b4PW3wXozttRYeNwkMzLcnbRPljRuy18lNZAnZd
 fTzZLrEy5idQPGmm5JNfzu2ICCFMc62mjc3KOLnclUBzRn9aPpXRcTzJ0Irhqdib/gh3sMjbB
 h6owDQonwhO1TJi2iJasJwPf02uR6UozY6sqnBDaGU7q3/XENuoGzQYIw67YzHI0+G87Nwm/V
 zj+rx3EUqxs0R11MNiJNgX72KpVIeZtm0U8YSZ3X/BSRKpVH6RiEoaGu2vBGqLlOhl/LOzY8m
 zBHt5N3j/utJu/EeXZmdNfARrIxVFRC9LI66S/U4jlb8TpOYjICNhtPrsLcJggDn87vdGXLCC
 4+MSE+zf6Y0GGG9NkyzvaCGI6+AJUqjzZUtseOeXz/Il4=
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

