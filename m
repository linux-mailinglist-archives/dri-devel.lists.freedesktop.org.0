Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAF67D6CC6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 15:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5BD10E655;
	Wed, 25 Oct 2023 13:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10730 seconds by postgrey-1.36 at gabe;
 Wed, 25 Oct 2023 13:10:50 UTC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEDF10E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 13:10:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C53E1C0008;
 Wed, 25 Oct 2023 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1698239448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvYmcIcCGRiRBdovjjijg/K4s2UhXR/ugjcSPeRqWQE=;
 b=fqr6A0QBx9OdbMBlweZ9mllXJ7PsOsV/vG9zCJ7AAInKEDTkgJ99KTerKJfFitSfZGBXzS
 nXuZL5vf8rPYgtMa6tRnOeK72TRI0l5+LSZyc2+iFzlZHq48PhLopt35AaYpre5fV/yaLc
 ORA/A+OmQ/PaNW41tigZrrB7VvwA4vtoYR9mMKISfATlYnq5yZlX7qf9CcPOxxxOAvFuDd
 Mq/URw2B1q12lXcQbUfJKwb1R1phtOGcyk82F02xaGzt7udpVzxYw3tv/HC3b4jHO8nrAE
 nCYSjfVKTrGBxdrhhTv7jGeCs42RvUicO9X66Sh5OfyOefN65MP0NpPrJzQc4Q==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/logicvc: Define max dimensions from USHRT_MAX
Date: Wed, 25 Oct 2023 15:09:46 +0200
Message-ID: <20231025130946.119957-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025130946.119957-1-paul.kocialkowski@bootlin.com>
References: <20231025130946.119957-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: paul.kocialkowski@bootlin.com
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the existing macro instead of redefining it.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpu/drm/logicvc/logicvc_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_regs.h b/drivers/gpu/drm/logicvc/logicvc_regs.h
index 4aae27e9ba2b..0fc413fef6dd 100644
--- a/drivers/gpu/drm/logicvc/logicvc_regs.h
+++ b/drivers/gpu/drm/logicvc/logicvc_regs.h
@@ -10,7 +10,7 @@
 #ifndef _LOGICVC_REGS_H_
 #define _LOGICVC_REGS_H_
 
-#define LOGICVC_DIMENSIONS_MAX		(BIT(16) - 1)
+#define LOGICVC_DIMENSIONS_MAX		USHRT_MAX
 
 #define LOGICVC_HSYNC_FRONT_PORCH_REG	0x00
 #define LOGICVC_HSYNC_REG		0x08
-- 
2.42.0

