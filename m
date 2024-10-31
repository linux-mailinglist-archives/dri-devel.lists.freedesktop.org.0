Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9809B8228
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:06:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C4810E905;
	Thu, 31 Oct 2024 18:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DPQD5qUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FC110E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:06:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 831F22000B;
 Thu, 31 Oct 2024 18:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsQ2CTA2pljllkiENrEWMPdAOoEF3CDQQvjJFAj8G3E=;
 b=DPQD5qUkYkmp/uTYcGSpBlp7CYk0GB6U5ar80NulIzYl9Y49YCPnhcRuDrknHevkSUVm1L
 9VO4T0DBrYCHrtO/gtFq6XAG95mb9mSiQbAWaRE55jvXBfUEE4++AXZbtCP6XW0NyPR7pJ
 Ieb7g4P485uhxVZwTlSHFam9SsF4RJeB1Tlj6NpjzWMPbuKwCWsNXuG4Tj6FzphJ+o9msk
 LgraFgyO98FwJ5PT2V6aOJmtFD4nRhYRyrggt0Gkcj5QoTXuHHBDcdIkV6NWx3aU9JWGkS
 2rhAPJmz9I7UQBdHpb5CQixRD+wmwhi6e4R6CZYRmzwl/KpNBjYuOIxsMW3O/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 31 Oct 2024 19:06:03 +0100
Subject: [PATCH v13 3/7] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-yuv-v13-3-c67a337301ae@bootlin.com>
References: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
In-Reply-To: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P2BW0rn/HzAIDwl58Rwi6B7V7fHRrzFFCT1b251G+Ng=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cNTg7Vuqg944sB2+yE/4NQDuaF8i/v33e2M
 TxAZd53WzuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDQAKCRAgrS7GWxAs
 4i+4D/9+eY7dnehTONtd/+40Vi4PhyrB8h7laI5EeVBfEFG1vvcV/Q5W5VdtDTKPn+hEb+JZmkR
 NVe7SmjHHjApdudPYlEB+6wMgE/igdXbuu0qXL9vGhFfDASuD3lIxVeRCghZjLho0ZGeyDb1TSu
 O34LB2lpUpAUmgnoCqeHl4+Nl5Vt4adS7NlxG814SY4lra1o1N8T5UtSUSqo9g3ndbWfTm/MJqx
 4W+rkJSUZxf72V23MAM5mT+6XTCtP92D1vYN+H9yPI0xSspyfEmyblGLH/Q8W7OI+sgVVKbH4WI
 N756sKHtglDAT0uVcTgGOcDp9UQD6n3OcFhWmtILXhPkCE+mhbJIDTRLaFRW4prlwJXOV8c1Gkr
 xgeqpDpE5mnijB3zCnWh6Z3UXnT8FHVAaL4F7xMX7jiN2DyFoWaAdFqyP0opMcpp8F7FpZxHQF7
 yNVxkhqRzvLSOtXRWriIQazObUw9CHyId9g/qYwFlcgDe4bW1GMTK/c4u5h9Y6h4qdGZNoVDsDA
 ziTsbTIgWQK+6m1mh21/weiwzJuB4fztM9m1OBPt53MhQlo+Q+kGGzhvy3Tw7cfUiKvdMknRhk3
 R2neb1AP4t8Cwb3wPRLNErieXXE2cq+IocgLhul74Lr5Il7i7IHAUyzGEAL4cXx8OG/S7OTYjVU
 EyireR2ErzDnkXw==
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
2.46.2

