Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22DB2C0503
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0668918E;
	Mon, 23 Nov 2020 11:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B189216
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:56:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE92AAC98;
 Mon, 23 Nov 2020 11:56:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net
Subject: [PATCH 0/2] drm/cma-helper: Move mmap to object functions
Date: Mon, 23 Nov 2020 12:56:44 +0100
Message-Id: <20201123115646.11004-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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

This patchset moves CMA's mmap into a GEM object function. This change
allows for removing CMA's mmap and gem_prime_mmap callbacks in favor of
the default implementation.

Tested with vc4 on RPi3.

Thomas Zimmermann (2):
  drm/cma-helper: Remove prime infix from GEM object functions
  drm/cma-helper: Implement mmap as GEM CMA object functions

 drivers/gpu/drm/drm_file.c           |   3 +-
 drivers/gpu/drm/drm_gem_cma_helper.c | 141 +++++++++------------------
 drivers/gpu/drm/pl111/pl111_drv.c    |   2 +-
 drivers/gpu/drm/vc4/vc4_bo.c         |   6 +-
 include/drm/drm_gem_cma_helper.h     |  14 +--
 5 files changed, 58 insertions(+), 108 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
