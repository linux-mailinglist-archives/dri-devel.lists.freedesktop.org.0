Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7359932B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468ED10E3D8;
	Mon,  7 Oct 2024 16:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EJG5VeHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E770010E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:11:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9550640008;
 Mon,  7 Oct 2024 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728317460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsQ2CTA2pljllkiENrEWMPdAOoEF3CDQQvjJFAj8G3E=;
 b=EJG5VeHdqibkfEsHHeUJaCQBZZwB336Y4Yae/96UlN/93JIijpUfk/wwXyvHZhUleAQrHd
 6fCTX1D0rMkYm1eLDea0pzM7NzLiqSf1+eD4TsZaSQ/xbxafi2ONvhp8A7UWxNB2GWoOdw
 XDXVY7dZB7tpSZCefijomhLcuTgIliATaYrME//Oscc7k3Nr0Ck1FLuQNwCIofdvECVcfk
 Gl/FC8OIpF8ATfzrxuYzh9SRFLFhwLKzyprgOdA0Wsd1zhWqUEDivDRQBRkQuNLf5vBpyV
 KEFDtqrS3ZygJ8BxTo+yTNXl2yQQDOaZnWsQ1gX/Inyf43raUikMCVoMhyWhpw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 07 Oct 2024 18:10:46 +0200
Subject: [PATCH v12 12/15] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-yuv-v12-12-01c1ada6fec8@bootlin.com>
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
In-Reply-To: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=881;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=P2BW0rn/HzAIDwl58Rwi6B7V7fHRrzFFCT1b251G+Ng=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBAgDBR4uYZGO5txdh3vIJuJ290SkPJaRBtVsM
 0SZfu4oxKiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQIAwAKCRAgrS7GWxAs
 4g0ZD/4l2jUUXLh+lNGvq3/zf1ZIVNEXoElmkH3U0WT66RPA7zwYPQ8oPLsg3AElGByOrNuI/y9
 D491sMgq058XAnVkiEYm2jOizTQSFwZNpunbi14DXK2riPrGj0BxUgMwbixvll+EoKTRQNZJ8Nb
 lRLy9iPKDkDhhAzZVFPeaamDEb79Ea4G8jiBKaf+6+II5D/c+jlaBo6+yb2Fcuvb+YIsdSWyt4K
 70zOv/GQL0rGyUlvG75wI/hC/xoCzlTQ65qLj2Bf7jtXPMa6GyeJM0njPKiHKRDwrvZJyaea8eM
 nl5gLaGANrTj7RDn4Na8WnUFTUoxY6J//jpW1kEBWmeaCPVC3SoIH/8PRB2H/5vfAz6Qgpb0MQ1
 qoxZOdQ6hRmXsJ7s5pE70XURz29WXuWN21OxFW0TXGyCVDof/O+cvLolNSMk2ZBTsADcF5oXVEh
 On4E75gzAn/APqR7GLwya1fTqJHhmFhD/Xn2Q4Q/oAQjZNPMndWIUm/FvD5LTfsUktGGqI7KzmP
 zYY1GqTid7lBh93L39hLWxbVllYzCdUsTm4OMsAeXCtUHZ9fWaXXO7WWv5xOUGQoemR1JzPVklm
 MN/DZ9mvzk4/Nan9qL9/C0KIn9/1jliYWvjRoMaxg1cGkS0GQZsX4tGgP0phlcaHvCoPLYt/LrA
 Tm8OO6tKglleMxA==
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

