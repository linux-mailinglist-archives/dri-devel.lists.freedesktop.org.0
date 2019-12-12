Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F811C68F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 08:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C916EC70;
	Thu, 12 Dec 2019 07:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6C6EC72
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 07:41:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86D9AAFB0;
 Thu, 12 Dec 2019 07:41:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 0/3] drm/vram-helper: Various cleanups
Date: Thu, 12 Dec 2019 08:41:14 +0100
Message-Id: <20191212074117.29283-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A number of cleanups that I wanted to apply for some time. The first
two patches simplify the public interface. The third patch adds support
for struct drm_driver.gem_create_object. All tested by running fbdev,
X11 and Weston on ast HW.

v2:
	* make drm_gem_vram_create() still work if GEM object is not
	  first in struct

Thomas Zimmermann (3):
  drm/vram-helper: Remove interruptible flag from public interface
  drm/vram-helper: Remove BO device from public interface
  drm/vram-helper: Support struct drm_driver.gem_create_object

 drivers/gpu/drm/ast/ast_mode.c              |  3 +-
 drivers/gpu/drm/drm_gem_vram_helper.c       | 41 ++++++++++-----------
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_cursor.c    |  3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c       |  3 +-
 include/drm/drm_gem_vram_helper.h           |  6 +--
 6 files changed, 25 insertions(+), 33 deletions(-)

--
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
