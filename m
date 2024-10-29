Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791239B576B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 00:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ADB10E3D0;
	Tue, 29 Oct 2024 23:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="iDd7BMEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0110E737
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 23:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=1SJ6WtqEW2HtW1rxlgiE167Eik3JoCGDIR36SiPLfcc=; b=iDd7BMEBogfD+Kg6
 C/RN9f1jFoTvsCJRmlMM5w8p67lFHyZuH0VIzNjkJc/j+PWEg3V8kOJIJMLf/x6iVmQzgfMCbS1Dv
 9+3LZEkffsOOSk+BBtqs4KQS7BBDLFtXdpuUGZKla1J0vJVKxfg8HsFUomSyfeaL4LsV9RJir6XWY
 6m4hy3EMeMQ6xOZ2x209ZxXbxbGKf4k1WW3dVFs1AYXBiIpyUONmyf3OzFLt5CFzPiNOOStCxUNR6
 N3dMALRB0tgkysXwnUi8zFynQI7M+cargSmG3UV7mKsX/6EP+b+Y5ZM3C69FHtPDIFXNdZTej/m8h
 IqGGa3NDcUb16lU3Vg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t5vvX-00EMNX-07;
 Tue, 29 Oct 2024 23:47:07 +0000
From: linux@treblig.org
To: dmitry.baryshkov@linaro.org, ville.syrjala@linux.intel.com,
 jfalempe@redhat.com, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 0/3] DRM deadcode
Date: Tue, 29 Oct 2024 23:47:02 +0000
Message-ID: <20241029234706.285087-1-linux@treblig.org>
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

This is a bunch of deadcode removals; the first two are
strictly whole function removals; the last as a revert
also undoes an extra parameter that was added.  It was a clean
revert.

v2
  Drop Remove unused drm_client_framebuffer_flush
    Jocelyn & Thomas have plans for it
  Drop Remove unused drm_crtc_vblank_count_and_time
    Ville thinks it might be easy to make use of
  Convert Remove unused drm_client_modeset_check
     As suggested by Dmitry, make this a full revert

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
2.47.0

