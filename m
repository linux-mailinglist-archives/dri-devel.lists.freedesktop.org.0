Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49F86108C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19C10EBCA;
	Fri, 23 Feb 2024 11:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PYwhk9Of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86210E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:37:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB3B040007;
 Fri, 23 Feb 2024 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708688270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mJQirOrh5uVlCQFN4AJsimww+6ayqe/xDiVoFk4V7I=;
 b=PYwhk9OfsG/mMht0I1jiLjeD84ClOCScsLvw1o3f4GAiXhVON6pspy9Ybahvbys3n83Qy5
 WIT4IHxSfWV2ZwYxvVw1ST3FAM8d9ryy/OItXbVw7e2CSCXrT1NijOM11DlfSVhQvBZbIX
 C/sD+lrOCX/TqVuYNzD/TGD8F4UXdS1EAZUMxg/VKb/KLEKGgPtBEx58E6YSf+6djMHMZq
 mqL6wD8U4ruEK5q0qcQhKum+sBg1HbDlAw4sSiVps5zmgmazTT/V9ngML/Ki6GO724NSKI
 0lEXzDdBDP4Fqyo9+fXbY7u1dpG326h4g/TWpwVGOXGxXoHBJYUfu3IKz9/SnA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 23 Feb 2024 12:37:28 +0100
Subject: [PATCH v2 8/9] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-yuv-v2-8-aa6be2827bb7@bootlin.com>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
In-Reply-To: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cRkkP1b8eceTuEm0QTSGTTTnDinaYzDjRJLok06bIiI=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGXYg4Wgrf4s8NRyCy2qmIlyNHA4yLL3bKYtN/ZQk9hSIM1p+okC
 MwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJl2IOFAAoJECCtLsZbECziaLAP/1k2eXjQRD
 3FL/HeJpArItvi8W0tZUWGN1/seXhVi1peCBKJH6kiNG8VzTUHUDK4cGD4shANtO2QPQ7kiB9hMbLN
 jcZn3AkOHphwPKFBXYBcZDkbISyGE4f2lF1ycR2jGH/0kx2QIbefWJUfNm69JRjITbDcMlInLRiN1+
 UYAV5Em6fI8ma1HQU7Ml2jTPSX4mY3crSAtwKbzlBBEHIP2yaw1cnlVkTji/1EqmzsfB4PLCo/nGCR
 rm8nNYL3pamibxKc2LKG4pZwsgEaxrvR0FpPWm9HVweiGMat0XN5eChwACLbVg7DLv4+erpB72x6O4
 jqwvYt2gep3PMjtqgO6c0KP8mSgGVfIuVEa9yiKBXWR9F9O4RPR6l6gEKN1uh+Y/ircDUSnMToJt2P
 OzuGGyVI5imeR+CPVcuCeqJ2xZ8TF6PpFLhNRv4wv2T7s51AiEQjWnEzVWcVVA6bYGMv4NbCYwlAvK
 V2wqHofMtn80Z21PhsvbsocogwtarOoQNLHInURpgyR5LVhp0JdauobP/e8ZxpyNtV9r1eZJvK0p2Y
 P7gEJryTmo5GJFcouepmKgvA+UGwhTdIBCn/FJxKOAFejGmJVE6DhQ9zCud1zuNZmUFLKGrVb8mUUO
 cL8WfifL2gM+xaXyOMzAlDWex6VWKvMhu0QZh4C5ndYe8Qay4c
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

