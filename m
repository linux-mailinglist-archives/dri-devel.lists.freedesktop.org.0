Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C77E88E179
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 14:04:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BCE10F7DD;
	Wed, 27 Mar 2024 13:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kiXNd6Ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CD610F78C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 13:04:00 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAB38675;
 Wed, 27 Mar 2024 14:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1711544606;
 bh=fBckXIMsHbe2+Au1I+FoaYupzsY+KA/9pDk1D4J+lrA=;
 h=From:Date:Subject:To:Cc:From;
 b=kiXNd6EiywZInrxTUGsPmXI5/cxcIGs1SsCgdnoqpj4m2xvfWUY1qjHPvvmQjjhMP
 pJSHyxHrKlteTkg4YYv6jGlIpdf/5fFaOkgh6vLlynUiHKDL3wicN1Dfl6KqL1hPZq
 Dmr/aIfJ0k9aSYwMmQVValoI3FXd4CNWdJyfkdjs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 27 Mar 2024 15:03:33 +0200
Subject: [PATCH] MAINTAINERS: Add myself as maintainer for Xilinx DRM drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-xilinx-maintainer-v1-1-c5fdc115f448@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIACQZBGYC/x2MQQqAIBAAvyJ7TjATg74SHUzXWigLjRDEvycd5
 jCHmQIJI2GCiRWI+FKiKzTpOwZ2N2FDTq45SCGVGOTIMx0UMj8NhaeBkXstpPDarkY5aN0d0VP
 +n/NS6weR6D87YwAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fBckXIMsHbe2+Au1I+FoaYupzsY+KA/9pDk1D4J+lrA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmBBk6L8A9Xw88l1g2tAOprbKEqvM/FkgDFMvRy
 GIXq1PQrL6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZgQZOgAKCRD6PaqMvJYe
 9Tk8D/4nlr7//mnEaXjY4VB+nbvdiZd8PrY7w/u4Bj0G4sg3+mXp2amK74xzBx6IN4/tWjBfmmx
 dngDQ6Mt3s9XE3hO9vZbNmK5IFRNBSwPZxkofpRWa/18QE0TNNyk9smJcTGeeZ1HTcMDTke146G
 blrMJfukfPO6n7AIZHetyDMebRpd7tTqL/9HvgLV7zAWj+Hr4+0JeQh5x6cFOhBBg/hzpS1ftdZ
 pmWthypWIyZP9hP/vdOZ0A3T/XJlLpPrmwd9VE2Q31/rMPNOffC0jWHJnmHywkhL/0KJGT/RraK
 7SHZ+9mtfIoXIRMAMxi3KaNgg3G/qbksQG0brjLPmdjdq2FuNz+oj1ZPDcUmoX7sTwt7rjUczgL
 RxQL9rSSpsi+R40OHHDUd2qXNpTryfdpnKvUdUxh0G5GyzNHDp49dYKbNoM3EQX0XRbfzI7yQ01
 ZNLl7j8SLEO0ecEQQQke31bsKmvwvFu29Ie9Su+qrXWZ+ynFw4fdNXTipD0/5nUNn/d2lzCiJIY
 GdYsEwSWrW20EYQbI4OanhZlY2OcX0BcNomPWHNVVvoldRqPYolALIfbyHA9LJ44Xgn9Pgr5vS3
 SpXGML1TFLsRCHsvqU379BX/AYOf/LTO5IBZYxgfQCu2/KvR3F2toeFPFZ0nBuq9oQ/gi9QOcVR
 ZF7zNBREqcXB6DA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add myself as a co-maintainer for Xilinx DRM drivers to help Laurent.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1aabf1c15bb3..79ef5a6bf21b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7306,6 +7306,7 @@ F:	drivers/gpu/drm/xen/
 
 DRM DRIVERS FOR XILINX
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc

---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240327-xilinx-maintainer-f6020f6cba4d

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

