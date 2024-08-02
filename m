Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE12F946174
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8481610E1C3;
	Fri,  2 Aug 2024 16:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hYwYPzlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AB810E1B5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:10:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B941C0003;
 Fri,  2 Aug 2024 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1722615024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuZLqDhbRxZyFl4sZYfc726XqKnvDZ+QCn+mY1H6AVo=;
 b=hYwYPzlTXq7nmoNQdbCbOD2Ka9J7igeg2B/WKkc2luLYp0cmqaBnwiLSDJYO6be50gaPKy
 savmEeuJ3aNr58CKZ+69b6DPpNKXwvZr98iK96PMKo6caNaLlgMQ58SZDYxTb4/RHuvvtU
 L8yRNXZ92kg7lyGIFClxma7tvpovnXQhKYhnDBiT6FmjKg2w8MUivIzm4IkzN8PrQP4ZXm
 N1CPlfBVI0z7M7FZaIHFW+qAhCW2ZFrR+pvE2ncElyLHC2S2Oo/sHsTTyrt63SguKPTJeT
 g4Vikm9SgCtFp+80x95VRHvsnVdrSU1TJiaaMAaVHDnx2xdkmoUjueXjCwtycA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 02 Aug 2024 18:09:59 +0200
Subject: [PATCH v9 14/17] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240802-yuv-v9-14-08a706669e16@bootlin.com>
References: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
In-Reply-To: <20240802-yuv-v9-0-08a706669e16@bootlin.com>
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
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmrQTbKIk7q/I0MoTj7k+bL/K60avtVyb6k45vA
 F6vsy908UuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZq0E2wAKCRAgrS7GWxAs
 4mjbEACdkCMIg5RS2lS+7m8nRDQu9ANky2ZL1oKre2beCDPr7nQkGWE9lu6mMs83UEtAZ63+4x0
 Zl9WwQRldMKlGxq3OP2qlcHiBLqF/IXPSPyPMy17qt4N5IBGfzh9JzdWWsL7+Ga/UUKUqIgmp9M
 P3lk16P9DnIscE7FzLX3PkQyA3S75At2Qlf0pRIR1PILPhMyiBVahhvmVn99N82E/VKjEseAm2L
 ym3eGzgb+m4aZ9ncJ/xcnBcIIf/AlKiokkNZtwzjM6qiq8jUg4+1YYv897H7JWRefgztRvR/dKX
 NTOXiDz2x+9P5Bdws1uaNA46PFtl5l8ZVQfycQfy8DFfFBjamqXE1PRceQvCLtNUkFXADO4Idfz
 8GxZPcXSAAbE/87fA3L++mTQHHQrVp66GwiXj1ihqXbHRXuGxZpTXpc4PzkyKvMzEVNRNlK8i0q
 43pA5CaxTlyo1TgWfxPOe5hf4baj8oK3Ri15P7x97eV27iLqV6dxV7YRuqf5hw1DxzYU5KjZCC6
 mP5F1wldDLBUTtdcByNxIa1I9TbMyqPgR5tpaHiHD3zRBDjyOj81VoHGWDRUYKO6n1ueVZsQais
 wPsvfIFWdzSxXHtJfh7VcjI8+KYHuZDAThINT63VJHm6wimUp3t4Omg7ZMk4LGZ0so6PuVfO5r2
 HJSKXnBcO9hrezQ==
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

