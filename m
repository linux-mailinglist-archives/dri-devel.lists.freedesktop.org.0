Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0389DA30
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8166112DAD;
	Tue,  9 Apr 2024 13:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WZhjgNZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D738112D9E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:26:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2974124000D;
 Tue,  9 Apr 2024 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mJQirOrh5uVlCQFN4AJsimww+6ayqe/xDiVoFk4V7I=;
 b=WZhjgNZbhe1inJQhx+kDzoapFvhfDpMn5etEIcFsZc+BmHOQNOt8sHCtRjQ+ODQrtrNQPU
 M+8/DGF9DX9qxUYDEFIx++rbYOak1jBLNvrPN88xrAY08F7lZWde9AhKZzG3eVeHgxvV3w
 GIz+ekBton2PYpdGV6VYkX3uHuqZxd+4NJGO8c3uvRMzCl2ZZIuZtyZEei4SQoXG4dfCuU
 ANqPJQ1fZBvxsrarzjgGRiy5wglhnA3OI1RWbNA8120jpwGKg5nTUIaC3tX+DKcWaNTuzS
 PXfQvfw8GHJrgeZQKiExFg2Fi83iGZXGDJA7N/bsM6cLXA5qK3SeEnV2DDeVOw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Apr 2024 15:25:32 +0200
Subject: [PATCH v6 14/17] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240409-yuv-v6-14-de1c5728fd70@bootlin.com>
References: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
In-Reply-To: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
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
 bh=cRkkP1b8eceTuEm0QTSGTTTnDinaYzDjRJLok06bIiI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHTz8zP9efvg7NCkW4Fqc9/zG18J9dEg8Olx
 ahIBysKX9OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0wAKCRAgrS7GWxAs
 4iRKD/0a9HNXg9O6s7vJrac/m6ZXWrzNtKZ9DzL2pPgFhXr8pZzn1N0//qZ8oiQEhwnkoQ3LLJt
 kvWONGAnc1+7SLlwpINXPDmRcfAn+/aq1goLAMG0ywVwHm81x9aNpAoGsZ89qaUXbgbHjBgJxbE
 u3JUFOnhoZKN2npdgnohMch0ZjuS8tckhJBxbAZM8Awo1fJYPz/EFBND/zrT+EXXg76R4Ts6YxK
 49T8O/6a068hQHq0zeUIwR9V7aaj9y3NzoZWdp0JxtoLD7zhBskiJC3lD81zmL/EVU/2tQCS2XO
 ULT9deKVobVQuLOi8+hA1aTDuO7L1BpR+weKyHtoVn3C2+fSLf9PvMgy/YJjPGua+JZHr90I+gA
 qmUtPky1+b6MUUMeQG4UitHh6nAMw05djNlieMiFuHdxhnGuyzLrFQhukRSWpxPW/SHs+4y2Y0n
 cI1bGr+4Rp+LXVn5HzaZrF2HTBvaY/CDzxB9tCCoRY9RXtlkahdFz13wl7tquSjd+2sksG/JWZj
 59TcdyEkfDTqaln/IBjDe0oVlT+wsbfVgtUD63Crf80qnI3JMCOP55ZzfIoPb7SARywSuF6fqrW
 No5kozExrJvD1DaxBK135//iQ585PyQGdlAV0hLO+CptFOemqwi242cbl/D5uN6WbMPP9uW1RNX
 hXzb9VjU1HUN9FA==
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

