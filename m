Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45088C3C83
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D6D10E4DC;
	Mon, 13 May 2024 07:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PJmJp52y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E343010E4C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A29820002;
 Mon, 13 May 2024 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pbUUmy13w4guEulP+QztTkzQuy51RgJPVYnilwQVRo=;
 b=PJmJp52yTa3VBMoLB3QdVsrYKCqn35SO941YttvXPDyPvO9AhRXaTIaY5SSDQp7+cuRPCi
 XNg2hqP6w8yIcqfV+di/8z+03oNS8vHTFIUL0Kl3Noqbnfd6wZ01Rr/nJMYu/chzvJhepM
 EThrX/BxH0ZPkWlcs9TFRUiIkxnFKUyBZ/6VunSsIhwd5W+uX0H83KiWP+k3sASbCt0dVJ
 hGh3oaogAJIpYhc1UH8fHzQnlS+JL7EG0nXy7BRH1KDFSJuh3CWUNhlPP3T6WI48o4pED9
 u6eU5cSVyxkYPn106uAvJEyozsO0NbzsPDuybqdImf2jzLuWzipKWgjmCFHuJw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:35 +0200
Subject: [PATCH v7 14/17] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-14-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=N9UhJoLZuEKa5YILFan7TkC9c/lglpLVoc0iCcUfoUg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZEpJ3YUey+C2QjSA6iW6tV6sCnz4j0bSPLm
 7J9jJYcsDiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGRAAKCRAgrS7GWxAs
 4o1kEACGQv8EjpwNwm8D36/N4jUFxU9HRqnp1sIyxYROywAkyhvLLVIQtx+d5bVPgzdo8yaRigb
 0YCfB+YCNql05/pnXzey5nN6jRxqyIlRc6FJtH9u5ZcazA8ZhtfMvuaDzZereKHCKbjMm4bRebZ
 rbSa+WwER/t0oLI5GUvTN2LIsHLivyGnwfV21lRGDz192wkzc2/0tJwnU0ixR7hBa4r3ajt4Dlf
 iWh30x3W9JQKrQJNUGBqBdlliGFQI1JcHdllQY/kp/1ttcMlqnc+M/LzoLealeJ+xR3kVfvann4
 v2KMu4r6KgCUteB4dI3gf0i5bI2u9+WfH61tZIhj76I33TYxFxW2wEnUo6ZpZOAT67NvsbhFqFc
 KXDOf+Xip5tN/jcphPdLXvqdr5oCYXvAzSYCIYiekYi2NC3aI9A0qPiiu0colcKOrYtrxTNr9pU
 cZxkw5nX9NDxpBJYzEdiKG5LVGLAd4XLNdvZ2KcbA/PqDLbgspaOYUoQ0Ih9pg9kDXZFat35hiD
 wN4DRZBW4ggoal9MFo0D9BJ+z3/C/HxKIXe3LMBSo+riTHwO5hNq3le9rPUfAT401NFlgI5CDfw
 7EqRMLS1q3MG9mZkaS/WggtSEVNW3qpKuWfYjzxPO6D11RPa5gRFdUhSs+ygyv6Yd9PWDHHG3Ay
 PUkn8QxtMclXT/g==
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
2.43.2

