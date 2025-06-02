Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FBDACAFAA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:52:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8D310E51D;
	Mon,  2 Jun 2025 13:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="cUy3PkhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E802A10E2CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=wT0xSehkFMhJxM+xwntmgLgxS4/GaYJns88pyew5XvY=; b=cUy3PkhEzwaHIpJh
 yNau8oXC45In7BO2agAsQL74YVhi0KL9Umvwelib+DDtsn5Jltc9cT8pqSu7zBxilhOj1wexRc1bR
 rxiAZ+opCmk5DH+60yk8KSUq2kT4w6ZcjrjjnbgG9SUJuHfUTthE9abrOR7/9/piAMzjGFe4MMa8I
 ZcKurPhecFDpjsvGsrl/NCOb09JB8k5FOJz7Tya7m+NI+ZqQx1PkJ5yw+breQXoEoPXgXU8EN4ucI
 mikjq1+s1O0LbNYnEaGJ8qUwO3q//nWhCfh6KpOW1ysJvzj/dR2eKFeqNAw1nXXS0FkXRTKuYpDyi
 F/qZFSpigHhyMoS2Pg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uM5a9-007CLX-1W;
 Mon, 02 Jun 2025 13:52:05 +0000
From: linux@treblig.org
To: dmitry.baryshkov@oss.qualcomm.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 0/3] DRM deadcode
Date: Mon,  2 Jun 2025 14:51:58 +0100
Message-ID: <20250602135201.207466-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

This is simply a rebased repost of v2 which was posted
in October 2024 and had a Review-by on the last patch by
Dmitry, but otherwise hasn't moved.

The only change is of the order of the commit message
in the Revert, as commented on by Dmitry.

The original v2 thread is:
  https://lore.kernel.org/all/20241029234706.285087-1-linux@treblig.org/
Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  drm: Remove unused drm_atomic_helper_commit_planes_on_crtc
  drm/sysfs: Remove unused drm_class_device_(un)register
  Revert "drm/client: Add drm_client_modeset_check()"

 drivers/gpu/drm/drm_atomic_helper.c  | 72 ----------------------------
 drivers/gpu/drm/drm_client_modeset.c | 35 ++------------
 drivers/gpu/drm/drm_sysfs.c          | 32 -------------
 include/drm/drm_atomic_helper.h      |  1 -
 include/drm/drm_client.h             |  1 -
 include/drm/drm_sysfs.h              |  4 --
 6 files changed, 4 insertions(+), 141 deletions(-)

-- 
2.49.0

