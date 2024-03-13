Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51C87ADF2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4F410F7F7;
	Wed, 13 Mar 2024 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C17aOn2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56E10F6C1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 548B340003;
 Wed, 13 Mar 2024 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mJQirOrh5uVlCQFN4AJsimww+6ayqe/xDiVoFk4V7I=;
 b=C17aOn2SwmfUwqtxzCrK39wG/2jjP8yjS1HTKUdVG5VwmS+QkJF9R8k4HP12CqqtPLC+H9
 CnKpdEbM61q9WcVM8hy4au9Dn+qTR3wYiU6iwf2sq78tD1zR5WTPgJLGCaM5YArxQdRI9x
 CLhRRu/IJwQD3DarkM9mEYk7KvCHFR07MpTYl3sC7maz7LslCsoCDX2qvWSHIvw8wVxUJ0
 uJpiHJNgvtxbvgHYv5cI3mIRcsMXdRCL1gawcGjCWUima1VA0snk4i8JNf6tHnY8Gw0o3a
 nd3bDDNAxtF45pc3t2fw8c/b7xZF2cVc8N6yZT2Hj9OXdGuGHPsd6KKPku9CDQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:45:07 +0100
Subject: [PATCH v5 13/16] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-yuv-v5-13-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
In-Reply-To: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eY0+z3WAhCy2IMeG8a1Zkre9wnYeZj8SIIpx9sY
 HczWmz6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmNAAKCRAgrS7GWxAs4jW4D/
 4qAo1dZm2a0nRqQiHL6nTT0z4G5R7SoJRefwwbIQ9oLn/87s7B7lyyvNnZ5twDZHPD7NMALtU2x3R9
 hOyeInWO1ZcOa6ilo8NZjAZE2wUBkM8X1hDd0G4rV7cGNzxr6YvLNKm+sY7w3QZzQNuXOXmPc9k2z2
 50WEb8f/NnXGZfg9lfTsyAxoAe5mgnPrarHmMNTGO0ji1z8tj5xY96Az9fTx68JH8lgFJ2zk4n7N3l
 Je0bDoz0U63X4Ir7MVm1QohDt6+GiKU+brYD20ldmdYd3AtOl2W0h59ExJi3CdfNm0DO2+uZkHUkDV
 l3ooPA7SqZ1D+//2ahX0s1e+5p0Lhhd5yomiOuaaFslehGHLXN/tqPi4j0xA8GWmOH/jLERJ3IP+Ie
 7AZqUU3WUWIDliNwzqknwAKhhTHH2LaZOCUqArJBcZm4qWeghPZyGo5hAiFo3JCXg1ZBzdVE3yrgaQ
 sjxKUYvrHokeUUl9SlyMtNuJG3rcxH9iC9CaviRM9PCno3Egx3DGWw/AkE+nIAtCkIMjz5wSRkX0Xg
 aFH+3A23XZL+QIOC9kGmEsNrAEMR1FzKmvCyz0X2IO0i/hJO+bd67hexUth/y+Qb0jGzjtXL+cLEEI
 NjqwSNlAtd+XEQQYtS0BsuNjXjXCIMH0xUG3cPOjtPYzOZgtmPAnnnoPYjQw==
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

