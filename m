Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D551221EB71
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 10:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13786E178;
	Tue, 14 Jul 2020 08:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF9A6E177
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 08:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C03BAC7C;
 Tue, 14 Jul 2020 08:32:43 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, jiayang5@huawei.com,
 butterflyhuangxx@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/vram-helper: Update GEM VRAM object creation
Date: Tue, 14 Jul 2020 10:32:35 +0200
Message-Id: <20200714083238.28479-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
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

This patchset updates drm_gem_vram_create() and related code. The
first patch fixes a double-free bug in the error path. Patch #2
simplifies the object creation. Patch #3 allow drivers to override
GEM functions.

Jia Yang (1):
  drm: fix double free for gbo in drm_gem_vram_init and
    drm_gem_vram_create

Thomas Zimmermann (2):
  drm/vram-helper: Integrate drm_gem_vram_init() into
    drm_gem_vram_create()
  drm/vram-helper: Set object function iff they are not provided by
    driver

 drivers/gpu/drm/drm_gem_vram_helper.c | 79 +++++++++++----------------
 1 file changed, 33 insertions(+), 46 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
