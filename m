Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A65744B0B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 22:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D79510E0FD;
	Sat,  1 Jul 2023 20:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 606 seconds by postgrey-1.36 at gabe;
 Sat, 01 Jul 2023 12:19:43 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.206.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CC210E05A
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 12:19:43 +0000 (UTC)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4QtWFn6bmmz43Fq;
 Sat,  1 Jul 2023 14:09:33 +0200 (CEST)
Authentication-Results: relay02-mors.netcup.net;
 dkim=permerror (bad message/signature format)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4QtWFn6BrQz7wMf;
 Sat,  1 Jul 2023 14:09:33 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4QtWFn1lCHz8sZN;
 Sat,  1 Jul 2023 14:09:33 +0200 (CEST)
Received: from thinkpad.fritz.box (p5dccec2e.dip0.t-ipconnect.de
 [93.204.236.46])
 by mxe217.netcup.net (Postfix) with ESMTPSA id 5FB6781510;
 Sat,  1 Jul 2023 14:09:21 +0200 (CEST)
From: Julius Zint <julius@zint.sh>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
Subject: [PATCH 0/1] Backlight driver for the Apple Studio Display
Date: Sat,  1 Jul 2023 14:08:02 +0200
Message-ID: <20230701120806.11812-1-julius@zint.sh>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5FB6781510
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: YFEmzM2+SWjZm4RjqPhIGUYNOBYO3NqIk4q8mJG+
X-Mailman-Approved-At: Sat, 01 Jul 2023 20:32:16 +0000
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
Cc: Julius Zint <julius@zint.sh>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have been using and testing this as a DKMS for 6 months now without
any known issues. It bothers me, that it needs to be part of the
initramfs instead of just working out of the box. Maybe someone else
here knows, how to tell the USB HID driver, that this is not a HID device
and it should keep its fingers from it.

Julius Zint (1):
  backlight: apple_bl_usb: Add Apple Studio Display support

 drivers/video/backlight/Kconfig        |   8 +
 drivers/video/backlight/Makefile       |   1 +
 drivers/video/backlight/apple_bl_usb.c | 264 +++++++++++++++++++++++++
 3 files changed, 273 insertions(+)
 create mode 100644 drivers/video/backlight/apple_bl_usb.c

-- 
2.41.0

