Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620929516ED
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0CA10E430;
	Wed, 14 Aug 2024 08:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Nm/lcfyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517A310E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:47:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A4A5FF80D;
 Wed, 14 Aug 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723625222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQhoLS7i08diXkXbtDyfB57FaNUlq4prNXvWOdsu1Lw=;
 b=Nm/lcfyqa1O/kdujLGhvfB3KkPTBsUuCP4WFSLWcXT1W7MmO+EON5iZa3CgK96jKGO8oWB
 bEYbwdgU7ypLogin32tAcvcY4PxEdlxNraSt5BaBTCecTR/Is/gsSfDGtSIQier39k5xX3
 yCr4dwOyQHkqDW18lTpyin7UZzU7hw41FW3aWLJlS22DvoTWLvD5EhmRai/7lP4MoDzY/b
 dEF8uvngATMoGfO2SefZZ+gAWX/mMluNVCarcAhTd97MFU1RkabUNp6FZHWzOHgB+Nbfy5
 KKCG60JBPLoY0Z+KQ596H+d+oLiast9SzCDh5FYsiOULdnM69+DcsTEZUWEUFw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 10:46:58 +0200
Subject: [PATCH 1/3] drm/vkms: Formatting and typo fix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-clarifications-v1-1-3ee76d7d0c28@bootlin.com>
References: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
In-Reply-To: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HkTR8P7eZOA/cD9/Ci7RUHkDKH0x6aG2NAlwkUXRY7M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvG8DQPc1IkCGVGW7pZSJQkZ/lPEjqCBBdruw1
 auCE2m1bx6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxvAwAKCRAgrS7GWxAs
 4t0dEADPCsb5gb7MDZvQDbZITNlXTrm8Z7D+ShDXUsG3vBZnSiRfin9iM6XivfGFpPhz3Lpf13j
 r9NqzCFzqtAAn5YzJalLkcY4pv+nzwikQHMsXapYdnVirInZgQgCl1/zrJbxzcnTdj+9btVcjoH
 XvYKX8cCQCBOiYQEECYCxuP8ai9E4usoUdE0TwOJ1nJpKju5A1lSvhOvFYK0s5z3H/aS0EXSW5A
 PbCEzZfdgUnn4t9IjVBWt3nXEtJGaBfG1WAjVF9cF3wf2tSt+kpDk+RAMDWo1XIdtySvfj8iEjw
 YYh2Ovoi1GiCKU+qyv8aRBEUFCwHtsZHhg76g4heQCVBxWwh4Oyr6z++hq9gMcsPdL/CGbNeTjL
 K/0+0yl/RqKoHSbEqGj4sOr2rWitn0+mB0R0zUd7xkgtKv0eiCB32wZuX7fw1IamH/OYQwKbYhe
 re43JNLbnwKziGnmnL5hhCMS2HJAMAxKSoRfT5B1mE+pRlLXiktxNASYV1apW7QonXaUDwclMRS
 ll0/a5UvefhoxgveHJGTb7iOWwecQTRqv8dyswo2uZS+Cmj3LoN6ML94SwfRkZ4r8vwBfxD0O94
 a4IiEwduJ4rw5MUzFwc39JR8btyf9sRsA/yp4KNlEJn913OhSMi8O8oD/+jfTjN6sWMEa5rexF4
 9+F519cUB7Enf3g==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Some newlines were missing around comments.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6860bee8e981..5aeb43592960 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -163,9 +163,11 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.max_height = YRES_MAX;
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
-	/* FIXME: There's a confusion between bpp and depth between this and
+	/*
+	 * FIXME: There's a confusion between bpp and depth between this and
 	 * fbdev helpers. We have to go with 0, meaning "pick the default",
-	 * which ix XRGB8888 in all cases. */
+	 * which is XRGB8888 in all cases.
+	 */
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 

-- 
2.44.2

