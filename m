Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C746E2A78
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 21:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F9110EE61;
	Fri, 14 Apr 2023 19:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142D310EE69
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EdNvHo9u33nfqJjqPsoIwHD8pScLPFMH4XTEGE58Fj0=; b=PrBqXnOFiRmkjDgxzgmgTNy3Wg
 jG8+zEIOdtuZxSwQ9zHm2VjwzUlVNAkPk+gon+vzRvIOL0ya/Ec6pKoXyhegqdYBQNVYQ11Yuf4SW
 0CwDWKghA1aLW93pJ5WPxLqqMZPXmjzjxNyTtBrA7VL/FUknb4NYSzTXTrZpgcns+icFWyGARfB0Q
 bjGKO5RkgmT9La7zlCJqCMmJb6WPvlzCu5nk1KqLx66jPEXciOBYY2cG6eNhR51ApcTwiwFRUgc5Q
 RKAHwCdoNPBGYHpBt32tcg1hp8AgBdNjWMK4s7SINAIujI5AkkWASXdFRfUSrfrPi1mKzklHgeRzL
 tAG+hOiA==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pnOnU-001FnP-Uk; Fri, 14 Apr 2023 21:09:25 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 2/2] drm/vkms: Drop full alpha blending TODO
Date: Fri, 14 Apr 2023 16:09:13 -0300
Message-Id: <20230414190913.106633-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414190913.106633-1-mcanal@igalia.com>
References: <20230414190913.106633-1-mcanal@igalia.com>
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

Now that VKMS supports full alpha blending on all planes, drop the
"ARGB format on primary plane" and "Full alpha blending on all planes"
tasks from the TODO list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/vkms.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 49db221c0f52..0f599c897614 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -118,13 +118,8 @@ Add Plane Features
 
 There's lots of plane features we could add support for:
 
-- ARGB format on primary plane: blend the primary plane into background with
-  translucent alpha.
-
 - Add background color KMS property[Good to get started].
 
-- Full alpha blending on all planes.
-
 - Rotation, scaling.
 
 - Additional buffer formats, especially YUV formats for video like NV12.
-- 
2.39.2

