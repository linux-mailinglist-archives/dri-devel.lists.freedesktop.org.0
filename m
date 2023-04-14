Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF96E24C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B96510ED5B;
	Fri, 14 Apr 2023 13:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE61210ED75
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 13:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HGSWzD8/tLZV+T56VOcM69YG1VcCQfm8Z6T3Bdgvjhc=; b=UGvP0sS8ZtaGvzo0gqN9lPo6oo
 /5qb0mRaH7OS24k31+yqapizYXiZ3TYwpXFLkHMZ0xSjkLXDxAuASqvrAMJFTdv1F40pN1J6Ptrhr
 U+TZUu1Bu9CE4NV6YoY5nGW+zXVkr3+0i4G/5tDr+/0kiRcqsDeQLhgHdpDCqyLXynnn74+Zjx+vC
 eLoM3cjMVfAS6g82HulgrhUGCy5h8Tw8K4Al6q/1/fk8SzJg31fLQsQ3yk28UTnGbs5PfRzuN9bEU
 SmTosEJiddIoQJQF4JXF2tjGItxETLmEA9zNVpvGGI26VoTmdRY/7dE80Zk7QPpPAhXpkxeHoU77M
 JRkzfgzA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnJqp-0015Av-NO; Fri, 14 Apr 2023 15:52:32 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 7/7] drm/vkms: drop "Rotation" TODO
Date: Fri, 14 Apr 2023 10:51:51 -0300
Message-Id: <20230414135151.75975-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414135151.75975-1-mcanal@igalia.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
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

