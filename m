Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46059AF9AFF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 21:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9E610EA6D;
	Fri,  4 Jul 2025 19:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bx2Ni8Zz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7929A10EA64
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dhkj8G4Lkt5ZrDcOsiUSC5ggMg/nJbcKqL6DITIgXm0=; b=bx2Ni8ZzwXP9m0S+Wc0EtMHgx7
 TzuOQjuUrAZSCRDViNQgfiVRlrmfLNyHNAnTlhM47u0LJWuyFvoUEv236AotRgodKYTexcOJKHFoX
 qQc3D6vmK308mpiNqrMImkFMO3GACvxNkB3zGxC/v7am0lTxMC2VOhKjymNY7oXpUFGv8AWTavfNw
 2qv1gdRwfBFydnUlRGbLuVsDWY4wXTPBJ6uJ13mOl2Id65ez37eyUnjpu1Pum3a+1tUP1+l3ZajIf
 3AU6QBl7jhi3tbhosriLBYOpri2ETZdYaZoLXRpfxHF0f2LzpEG307mlaIlVLjJ+2S8Nx8jjbqjbi
 n20JYksw==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uXlkz-00CY0F-R0; Fri, 04 Jul 2025 21:07:34 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, airlied@gmail.com,
 simona@ffwll.ch, " Raag Jadav " <raag.jadav@intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v4 3/3] drm/doc: Fix grammar for "Task information"
Date: Fri,  4 Jul 2025 16:07:24 -0300
Message-ID: <20250704190724.1159416-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the repetitive wording at the end of "Task information" section.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 5bc1da4915af..843facf01b2d 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -460,8 +460,8 @@ event string.
 
 The reliability of this information is driver and hardware specific, and should
 be taken with a caution regarding it's precision. To have a big picture of what
-really happened, the devcoredump file provides should have much more detailed
-information about the device state and about the event.
+really happened, the devcoredump file provides much more detailed information
+about the device state and about the event.
 
 Consumer prerequisites
 ----------------------
-- 
2.49.0

