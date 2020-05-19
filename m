Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FC1D919D
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 10:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B6B89F0B;
	Tue, 19 May 2020 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9415289F0B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 08:04:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3386ACB8;
 Tue, 19 May 2020 08:04:29 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org
Subject: [PATCH v2 0/2] drm/udl: Map pages with SHMEM helpers
Date: Tue, 19 May 2020 10:04:21 +0200
Message-Id: <20200519080423.21695-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.2
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

(was: Default to cachable mappings for GEM SHMEM)

Udl implments cached mappings. Convert it to SHMEM's default helpers.

v2:
	* keep writecombine mappings as the default
	* add SHMEM helper for creating BOs with cached mappings
	* update udl on the new helper

Thomas Zimmermann (2):
  drm/shmem-helper: Add .gem_create_object helper that sets map_cached
    flag
  drm/udl: Use GEM vmap/mmap function from SHMEM helpers

 drivers/gpu/drm/drm_gem_shmem_helper.c |  27 +++++++
 drivers/gpu/drm/udl/Makefile           |   2 +-
 drivers/gpu/drm/udl/udl_drv.c          |   4 +-
 drivers/gpu/drm/udl/udl_drv.h          |   3 -
 drivers/gpu/drm/udl/udl_gem.c          | 106 -------------------------
 include/drm/drm_gem_shmem_helper.h     |   4 +
 6 files changed, 34 insertions(+), 112 deletions(-)
 delete mode 100644 drivers/gpu/drm/udl/udl_gem.c

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
