Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD867A17C31
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFD110E557;
	Tue, 21 Jan 2025 10:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M2k7HUdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7669D10E552
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:48:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B9F240009;
 Tue, 21 Jan 2025 10:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1roDM4z3PzoAc0FC+uMQ2aY2OcRduLc4tYzeHMaTk+I=;
 b=M2k7HUdEgyX84G1K0FTG1rrt87WWPP8FEYtTEOPil4B0BICDM8OMFVrUeqXk4u+PRmNeSU
 8NE0sG0V3CVUSUIV4R0paB+0VwQZkC+YK+FQU/pAMhdbqvojLbIQrIzwjPpssqx6+Q5OgG
 4ULQLS4c5XTYI0SzsvjMs2/U5zVNUEyt/x3x5hINKKEu2xIGDIn9/wCZuyTiAGiyFazwUI
 vrgW7l/yNnV05kYeDCm9a/D9GJ1UqNVnABXTnPzogTdx9YvcacsgeSazKGfvvIvzZjruqG
 LFDusiHFPIbkJdTSS45Kw3dHBhwzU9fmI6R7IqEAtGrl8JdKnuibZwBm5//kOg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:04 +0100
Subject: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=scn5WH2D0SZUmHmqTUnLEUslGEChLv0xkTXLyc9tyEc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3to4dmmxlUDJZaBX3HNhTfZeE3zHyl7fjgpN
 FXw8uoq1jmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aAAKCRAgrS7GWxAs
 4ms+EADQVhm1y02fdmCDSmHyne8/ol+zTXYiPs9S1CftZn/s5SeosxJILJUAMn7gCPJdyE1NRhD
 EUksDV7hJK0C/aqKqrw9YISQC4ryf7EEJD4epxCZONsQCYBvwA3MpRXpWryuUCi3TN2rtyZeCOb
 XmuaBnV+MR4GHQ84PO78Q6Ffq7QxcPmjQHTOlaifjVuAxAyW7saIOtMZn7AL1U7Z99c7bJZeREw
 OmEQBUg2+Q2u/Go7jf8CDJalX5zQ28UgQGog4q0pX/Iso57n0gxY+D2iW9AHB1hNKE/2tL6oS8+
 neH0B20aj1FmUIqN7+nrR4EdcQqYmf3m5hSOpmb8FqY8DScq/F8lNyi0jPj17FApE6fZvkGKFXq
 9MkNPE0iteAawcQL3pPuxgY942MTt64myX0kCbU6yE2cvLU8C9Xm8NM8Uvt4bZ4uLFL8HvgnmjZ
 fZ1vFIISRrHfjiGJqhGS3q2CsiQ0g/lq7irUU5G634ohhULEBbxwSFTRaCvs86IDO6f1/6gbvwJ
 2ekMXeIGrhjvWyn4jQLaH2IbbsoKiJYVMDMaaqCMiUhi3OLUKC397TqdsjhUresMqRxWop1hzuv
 7QHuTRkhvgtUoEnQ8OlejjawtZrATUvjycSEnql72Lf+vWTj2ejDEezDVubkpVTrCEBSre2VXgK
 rd+ZibCEJ4JE7vw==
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
2.47.1

