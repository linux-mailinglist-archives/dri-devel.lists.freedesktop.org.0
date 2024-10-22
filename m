Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2969ABA0F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 01:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9A110E283;
	Tue, 22 Oct 2024 23:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="mGuzYDRF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E417510E283
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=mHrKY4OSTFuiDHRVzjLDtBvBzUfYqHv22XLr1Ipmg6M=; b=mGuzYDRFhxQ5doLK
 ztjIDPKfAAKhgvXUrhtjXJDo1Klb2lNikEdzF6zbVii8ThRBYrMRd1lnI2Q0q8b+H29XIyvVJXcxi
 VWZaNWVjfQH4Z5HurMBUroxDB6Gj4xvNgUxy0yzcUPy6Dt6RpommV1vvgs4dIwZHX5rcXbjGU7dSp
 YdlCZoiOBlI+9wCmoRQeznFQJsTQnfcKiNYeB3nnvk+42HK9n9OKOwZ9JDyGSD6izcUBTkRrxPT7P
 NTnlnaf34lSRi8d4b37jxCRt6AqbuIZNbUeTBF2mrqX4upWnkf1OH/Ikls787AL5sliDDrAmaxT8e
 M5jghRlH2m4P2cU97A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t3OJj-00CtGr-1Z;
 Tue, 22 Oct 2024 23:29:35 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/5] DRM deadcode
Date: Wed, 23 Oct 2024 00:29:29 +0100
Message-ID: <20241022232934.238124-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
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

Hi,
  This is a bunch of deadcode removals; they're all whole
function removals, no changing actual code or behaviour.

Note the last 3 delete functions that were each added (long ago)
by patches that explicitly added that individual function, but then
neve used them.

Dave

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (5):
  drm: Remove unused drm_atomic_helper_commit_planes_on_crtc
  drm/sysfs: Remove unused drm_class_device_(un)register
  drm/vblank: Remove unused drm_crtc_vblank_count_and_time
  drm/client: Remove unused drm_client_framebuffer_flush
  drm/client: Remove unused drm_client_modeset_check

 drivers/gpu/drm/drm_atomic_helper.c  | 72 ----------------------------
 drivers/gpu/drm/drm_client.c         | 33 -------------
 drivers/gpu/drm/drm_client_modeset.c | 24 ----------
 drivers/gpu/drm/drm_sysfs.c          | 32 -------------
 drivers/gpu/drm/drm_vblank.c         | 44 ++++-------------
 include/drm/drm_atomic_helper.h      |  1 -
 include/drm/drm_client.h             |  2 -
 include/drm/drm_sysfs.h              |  4 --
 include/drm/drm_vblank.h             | 10 ++--
 9 files changed, 12 insertions(+), 210 deletions(-)

-- 
2.47.0

