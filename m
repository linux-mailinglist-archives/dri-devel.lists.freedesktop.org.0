Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E88590C66
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 09:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8376BA8FB3;
	Fri, 12 Aug 2022 07:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3A7B476C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:46:25 +0000 (UTC)
X-QQ-mid: bizesmtp79t1660232778tzr5b5j0
Received: from localhost.localdomain ( [110.188.55.240])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 11 Aug 2022 23:46:06 +0800 (CST)
X-QQ-SSF: 0100000000200080H000B00A0000020
X-QQ-FEAT: +ynUkgUhZJnjzrN7mCdPliHCguSTw4z30GsQ6YtcLfSYoTk3nHoXLk7B1VfMO
 jviBXR/BeGRcB7PvByHFcnOpxedidM+l+fF8cUNG9Ba8JW0taU9Rx0e8FZIobvrx0xOm1KX
 H1CF3tutl6/3y3Qe+m1iA2uyLC1gtc8Ilr3gFLskLSkfo4rmIkAcz2EQRQL6dqt2qpCZwz5
 pGjmecUGZjKyjLTnvZuER+oAsh5C0ePIwvNekX9HmR8lnx100c5umBh9ziSgaIXWSywzu1W
 +Vx4Pohxi1mHx4wCcq+gkg85lIoKgWjPUcFEU3QfWtQV2wIv7Lq3J115U2/wr4nGFP7xpyl
 Zom+yxsJ4GzW7ocfgHqMcChiVm7nCzO+lvhIGsLxsKreAAEMkhM/SRVF44q7Er41q+dmUwK
 hGguVIde88k=
X-QQ-GoodBg: 0
From: min tang <tangmin@cdjrlc.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Fix comment typo
Date: Thu, 11 Aug 2022 23:45:52 +0800
Message-Id: <20220811154552.13392-1-tangmin@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Fri, 12 Aug 2022 07:21:22 +0000
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
Cc: min tang <tangmin@cdjrlc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.orgy
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `buffer' is duplicated in line 96, remove one.

Signed-off-by: min tang <tangmin@cdjrlc.com>
---
 drivers/gpu/drm/drm_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..25660c30bbbf 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -92,7 +92,7 @@
  * corrected timestamp.
  *
  * On a lot of display hardware, programming needs to take effect during the
- * vertical blanking period so that settings like gamma, the image buffer
+ * vertical blanking period so that settings like gamma, the image
  * buffer to be scanned out, etc. can safely be changed without showing
  * any visual artifacts on the screen. In some unforgiving hardware, some of
  * this programming has to both start and end in the same vblank. To help
-- 
2.17.1

