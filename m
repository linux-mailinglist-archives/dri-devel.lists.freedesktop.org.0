Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA194920F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B190C10E36C;
	Tue,  6 Aug 2024 13:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snMa1FEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA21E10E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:51:02 +0000 (UTC)
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1D74CD;
 Tue,  6 Aug 2024 15:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1722952209;
 bh=4HSMw/HU7AGAzzVaZuC80Yuo8WSKYY3sDqLnUPMKEzs=;
 h=From:Subject:Date:To:Cc:From;
 b=snMa1FEY50ru9jiYiXJfB9qXf/ywoncBxtTuB9jWuREAZ3dOLJkUDVvp1dWteswdz
 lHPZ35EqvNeoU3eA38umKjnID7b4j5PW8116Gcb/QEbXl9XBH/iy4gb2x5r0w8wyAW
 0k/F83mCpVY40zi2TGlBm9f8IDbL2QCDNG4lop4s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/3] drm/omap: Minor fixes
Date: Tue, 06 Aug 2024 16:50:26 +0300
Message-Id: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACIqsmYC/x3LQQqAIBBA0avIrBtQi8iuEi0kp5qFFg5EIN49a
 fn4/AJCmUlgVgUyPSx8pQbTKdhOnw5CDs1gtR30pEe8or9DjhhZNtz5JUFL3lltXB8CQRvvTH9
 o37LW+gGov5eQZAAAAA==
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 kernel test robot <lkp@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=4HSMw/HU7AGAzzVaZuC80Yuo8WSKYY3sDqLnUPMKEzs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBmsio9r372s623W9DcayrF14x5KJ0kKj8dCIrIL
 4DkbYIbXBeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZrIqPQAKCRD6PaqMvJYe
 9dO5D/9wfKM0rKjJvQCyU+XiP1tDzwK1wtBTkUkflysczZXhTLZIv7r9Mng9GqkbgXpZK4vzZG4
 lDPbYAvnhCfcjRAOuWu/+3HrjwyaULnp/6Y9poXIjxNd3gsggzfOkV9TAkJZuNRbMFJjzh+E7W4
 iI9v9y8a52lTl5YvpU9ZrJkNXuF1SPsb9RRnRHlSaimzwMCEo46xRETPwhwqAwO6ELuTZQdNe6z
 UPIgj4hdqOSYs0uc4C25MkRPR9ASuRck1YSMGLC23KAii82mmHJPjSiGnvRWa9ifBsfRTB2v596
 TC7NHidy+GWbt3AlalAS47W6LsVnH0+1MmRr4GRKmsLHFdXXGVeii+Q8UHiGSnhKJ1rX2U9Bnr9
 TZS2AGigbOBMBEBuVXbFjYOfrT9t4mcdWxRiZUaunuMnbMQUMrK/wfrgnjBJ2ve0Asv/b0hWwp0
 u1yxBqMs9smA1RUUDk0dcMb9AQx6UWGdIMHA+vFfsqFDsF+1nU1jAVwPwJBnU1J0gQR18oXYb+8
 ORry5RJ9EDdpERjofem1EaaQ3ZdY10Pqro1gCpvYqNK9ENJCwGEUCcuwxRDg4nYzDO0qO96n24w
 bRj6Yci0JMnyxfF88SVSnn1uRmCfDyoppficRj3+I3tDYiCeEM1jTcdtvU+YkDGfBkFrLup9L1T
 +G20XLENzWH7BvQ==
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

A few minor fixes to omapdrm, mostly to remove sparse or other checker
warnings.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (3):
      drm/omap: Fix possible NULL dereference
      drm/omap: Hide sparse warnings
      drm/omap: Fix locking in omap_gem_new_dmabuf()

 drivers/gpu/drm/omapdrm/dss/base.c       | 25 ++++++-------------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h    |  3 +--
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c |  6 +++---
 drivers/gpu/drm/omapdrm/omap_drv.c       |  4 ++--
 drivers/gpu/drm/omapdrm/omap_gem.c       | 10 ++--------
 5 files changed, 14 insertions(+), 34 deletions(-)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240806-omapdrm-misc-fixes-2ea920193dde

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

