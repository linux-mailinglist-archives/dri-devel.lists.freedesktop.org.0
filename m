Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629F94D5BF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D156A10E9C8;
	Fri,  9 Aug 2024 17:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SNn7fnUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4441910E9C6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:55:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD3C4FF80E;
 Fri,  9 Aug 2024 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuZLqDhbRxZyFl4sZYfc726XqKnvDZ+QCn+mY1H6AVo=;
 b=SNn7fnUGehKVONU15RAo5kZ/IF3bZDnDzbLFjbWgn+UYWYGeP7YRmUW/evvVO0f3pAxahM
 Oa+nRbAMz8YhCvUYBVBeLtFTgY0nWRz/6GPvvN2CABZco/fB19V/WtNagOFfXvXiVd6yjR
 Pl7sO2tBD5YEvcfP9vF2bqR9/n6p8gkxNtUV6c1c0awXnA0UbeGtktMUDv3cE+VAp2qT57
 zx/sK/rcIfZeFN6Z+nzGyGeNNyYupcdrjo4cEiP3bVImNOoo9WcdUqqmwh0hwnRizJMI/C
 zC5Tp1VVA6/i5/D/UeHXkRSfQA6hpOS9lAYioZmDVmbw83+UHYxtz10x8jqZig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:54 +0200
Subject: [PATCH v10 13/16] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-yuv-v10-13-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Ji1Dob1J5G/v0m+OtcxBdGyR/6s9qdXv8iTJqYtkSqI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfr+iFGUcMsiIsyg9/BpXreo06y/ptqMsbQE
 j2f0gEhQuOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6wAKCRAgrS7GWxAs
 4rDTD/0XBtpjZlBjaUNdMhnzcSFf6SznpchqRUGBV0zujW1csNfqfslS2J1MtIQG2a9p1eVXuC9
 BfXsejooOJ8SC9y4QK89z8fzwKo5u2zdXxKEL4Sb9YIv4Y3PwSSNbYjU/rvvXLu2AmympGH013V
 mpVvUJpZoI/BkQIKUBqepj5hh7uP5nPTpNxKUCPUZHrRZbM8pY/uAvmTQmFvYuaYSrQC/9UY+aq
 bQlm4CD1sm9d+M0bzW2aTquZE+W5tpnQSOEcZ/Skzj3gBontiZogMHnLwE6z9Kpv+dL1oCH/gNd
 hKmuCJ/BRjii5t2tDfoG19+rGzK2mYjmRb/FPg0OWT8tJG42jG6XK/KXQBZJbwxfLpGJ8H0Y7z9
 nXEgT/RlBFLsUljz6N812gbtOOJ+JXUargiFx0Iygyq/b5oQWpA6QwIVfcqjS2mHwNJ1bkTiP0+
 w4lTpvkze2XFA7t8LvvAI9RGHHAHeZDJg2lSsimXgCwc/EUxpTIxP3mrT/APGeYWAMLEm9/s9Fe
 8WEPy92CzzOwy9+uzYyk/PDCl2aNJ44VHjYUOcNgquIHu0K21rgTGffocXDFlI21N569J9sFj29
 0UWtwqq7iIX3Geb8+9ScCb9YYfdqWPHkU12nh4pHjI0yyRNs9UPsnaPurj1Govsqrosfl4MO8L1
 P6ciKtjL3bEaB6Q==
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
2.44.2

