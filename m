Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56C866CE6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CC110EF74;
	Mon, 26 Feb 2024 08:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CVuxn1my";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1337010EF6C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:47:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A26D6E0017;
 Mon, 26 Feb 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708937274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mJQirOrh5uVlCQFN4AJsimww+6ayqe/xDiVoFk4V7I=;
 b=CVuxn1myfU3LPO3kH3trNGJMOwPFbT8wPap3ipJ7wly2E6Zp4lXXxWgy62jODYSjiHFi92
 TrFwS/V8zP5tSUgZqHSBIkJDfHw7Qo8igxIh4C4GVp80chJClwxz1Tba20yLxz/89EHQIr
 ZJc+jA5fkaIberpmWnsjH21oE4ePyDwpYJlXCyA+d+yUczeQCRvEn992RtK9g9Nolh2UWW
 NgfOFEVVMYHZNV/cwK/zs7SQxc3oDsYJFyqNazx+TaTYr1nOVqI1yreTJhimmGp4FsTUVd
 mh8sMuvt2Yek1v3nW98MldkBil7DJJ2F5512W3W6tyCXAm8zNB+gbIV9QzDQYA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 26 Feb 2024 09:46:38 +0100
Subject: [PATCH v3 8/9] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-yuv-v3-8-ff662f0994db@bootlin.com>
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
In-Reply-To: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cRkkP1b8eceTuEm0QTSGTTTnDinaYzDjRJLok06bIiI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl3FAu3/xcYIu2XAyaRI/irSXXd3yp6kz0cLwrVbyp
 0xQKpeWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdxQLgAKCRAgrS7GWxAs4py2D/
 4oCJKYWdQ5WV+LIcdPmG3crkYWUByr39Mn+bDJCPeCOV1vmo34h/CzYxTmVCtbug32zjEBXJlmSOak
 G9hmdOjo7SyfibyQXn7WdpM5Vo8CKFW+7coN0KFrCCdxHYCiOZiHgA6Zu3JUv48i+woltLznIqFlkg
 R1+1Za/MBevfss2JwDRKMwkK9EvW5mHFhaJzD94H8EF9J70djpk6mzet9dxpotZafXhm8nvnlrkkkQ
 DXqKgLq9jImO6XKuNgvRlWgOZYOVu1F1wqYWuelXbOTxxwk7jRSbVMm4mY3oSqdKbgn08JALodn5Tl
 NJIAZ4hZJxJvg3VWm19TumirnP4uGP/v2eAqeeT9N5VvtMnKaUp8lAH3GhRl6C7eFqxddBAGzhhXcz
 cyWJXzoQVqZmWDsqOT05WuSCL0AYWvR5odfLjHvrv6utXqsk54GbimCsr04yY9uCm8/4uu1fSafYwR
 FLz6NHcsSV8zhkQH7aILKm7DRWbdrOD1UiietonzLCN2c619aFilI+/tcjnPHGobVtpMcoOkyGDY4b
 rpKAYQxTah8fK8YADYY/llu7TFyBQxJZMD2sR/tR+E9Jo9uFiIFweUE/GQkLGNeUAVC4xSnDu6Zk03
 fpKLdfYom5S/iVYWHeM+K8Vs2x1V6+S/PacHfDQGausgla/IgjwIgV43JnyQ==
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

From: Arthur Grillo <arthurgrillo@riseup.net>

VKMS has support for YUV formats now. Remove the task from the TODO
list.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ba04ac7c2167..13b866c3617c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
 
 - Scaling.
 
-- Additional buffer formats, especially YUV formats for video like NV12.
-  Low/high bpp RGB formats would also be interesting.
+- Additional buffer formats. Low/high bpp RGB formats would be interesting.
 
 - Async updates (currently only possible on cursor plane using the legacy
   cursor api).

-- 
2.43.0

