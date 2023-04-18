Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4F6E6574
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308E10E7AE;
	Tue, 18 Apr 2023 13:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4658110E7AC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HGSWzD8/tLZV+T56VOcM69YG1VcCQfm8Z6T3Bdgvjhc=; b=GOgQY9J8W9spLGCbbfC+Cb8lRW
 ZOe7KfgnJaaixrZk9IVr3iL8/4CGjhUta8ufViKBcTzEFMdj1Mu48PZw6yO6YtvTiyb1xJ7WjzFX7
 Y3HpSjy0GIART+qUsmPxonGYR8NNHRrXb2I9NMGHaNMkJVabqpd5YbqbePQTr9/Z2jg9bK+mb4iyx
 sVBbcbFEt/6YNQVog4ZiQV5njOfd2IZR+bpp6EXXU3M4oQ8TDS3k6nKQGMwOTHwaQtFVnEgcYEDzo
 sJs1P5VLrYI/TOYT4k4U+ruw2EocoZ7L6MpkKupMztdl56jEOWoLcQ/Y+QEB3VNb9OGknsEIRzHD+
 rFYcLJhQ==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pol3l-0041UK-J4; Tue, 18 Apr 2023 15:07:50 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 6/6] drm/vkms: drop "Rotation" TODO
Date: Tue, 18 Apr 2023 10:05:26 -0300
Message-Id: <20230418130525.128733-7-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418130525.128733-1-mcanal@igalia.com>
References: <20230418130525.128733-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that VKMS supports all values of rotation and reflection, drop the
"Rotation" task from the TODO list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/vkms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 49db221c0f52..413e6815b9bc 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -125,7 +125,7 @@ There's lots of plane features we could add support for:
 
 - Full alpha blending on all planes.
 
-- Rotation, scaling.
+- Scaling.
 
 - Additional buffer formats, especially YUV formats for video like NV12.
   Low/high bpp RGB formats would also be interesting.
-- 
2.39.2

