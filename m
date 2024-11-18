Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93C9D1854
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172BA10E56C;
	Mon, 18 Nov 2024 18:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Fn2N1idl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A6410E559
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FE361BF208;
 Mon, 18 Nov 2024 18:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731955403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyuZSeQhWN8yZC/+93Agwlt6oIM4sNXPX8BuSmxPT1g=;
 b=Fn2N1idlukmyO71g/GBJznytqRX2mHPvRxWrZnkaPkJcO3bca56ePwok9cl5XkgGQu4yEt
 7d8oSPy7A6Cj625Gs/OspwqEP+dJ3cbL5rIh121vmAa7ru7eDEhc6F2lEaMwfjH0t9uyNC
 nJ9ZjwRro+wXrpy4vnl6QIynERHrgqfe5keOh6kqLslNVcor0LEHZmnADNO93ewiQbrMf0
 R7F8WsWOMGqP30gUTZggg6gJUMnPvhkDCQ0YlQtq1pwZZ2VuJlA+y2JUKEe+PiO2teR/ub
 gDBj68OqKkis/FDUqsxH029/1PPkgr4h7EutvPISRFdc8gSandAFG3a2ZLHXZg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:43:16 +0100
Subject: [PATCH v13 3/7] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-yuv-v13-3-ac0dd4129552@bootlin.com>
References: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
In-Reply-To: <20241118-yuv-v13-0-ac0dd4129552@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iDZ/HJ7Gex8d9aGNH0HIIVbXcYQeibofjLc/H+dZBcg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4rEbq/nLWfL1OQUs3buDRzlKKkI6fbaXdC5I
 ubtYOeAjFeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuKxAAKCRAgrS7GWxAs
 4kLpEACgu0VeMHjosh8+2D15PqD86N9fZXtF0j8+Jzqwyb/HafWMef0r2oNcFXfGmeuU6Z3kt3C
 Pqq1RMvuBhNk2OBE0sraz34N74xSYrXxL8tihN4mdJWaQi3LUGFYsSOE22QbDw11AZ+SYSIBt+T
 Kbz1+L3tVHWG8Dam+1cz5BFNRu4M246xM1iuGV57wIV0ECzk1Z5QjR91/5hMfdGa2+AsyNMHszM
 TSWoC3p9/0J+naA0i9LjVC7bNlqIe0sjKPfDb+UfPFUdX1Ce5sS1dSmPXra+iMjd+vqp+35rzaH
 CQwafIcSmXCFPZItTk5j43vB1qArwZ93JjLXOOTDFpPiyAuC2fQcYc7y5oncVlm+ogpx6q3jvhP
 zIXKpd4Ueg9Bsk//c5r8Fh8VsiVFqFNbV5YP3br7eVDr7AhoPCsnC8ZW2jZcHgit2WGApft3LgZ
 bog69t39IiLpH6YqSNtzmV3VqLms9rUz9aDwPzFRVHYXAsR2I+ZlvEJ3yoAljKctT9+E150vnOY
 BEQiYQDHxKdBoKcyRN5WxXXswx7ziiAsqXqQ3MTULip7G+yY2j5bHcLWJQfPtVeXNuWciMj6EHP
 UQ6801yhmSltFIj3Hp3gdoc6SHS7kx7nU1uo1jf2EfkJbJS7DBgKWumQW4WP1bUMQREUDfvhaD5
 lyckCgWT9i+2jeA==
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
index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
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
2.47.0

