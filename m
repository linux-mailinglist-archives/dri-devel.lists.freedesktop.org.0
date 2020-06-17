Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8211FC82A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 10:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E196E329;
	Wed, 17 Jun 2020 08:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AA56E329
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 08:03:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5445DAE6D;
 Wed, 17 Jun 2020 08:03:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 0/4] ast cleanups
Date: Wed, 17 Jun 2020 10:03:36 +0200
Message-Id: <20200617080340.29584-1-tzimmermann@suse.de>
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

Ast still has to be converted to managed initialization, and embed the
DRM device in the ast structure. In preparation of these changes, add
some cleanups to the driver.

Tested on ast HW.

v2:
	* remove device tests from ast_pm_freeze() (Daniel)
	* convert WARN_*() (Sam)
	* typo fixes

Thomas Zimmermann (4):
  drm/ast: Remove unused code paths for AST 1180
  drm/ast: Remove test for device from ast_pm_freeze()
  drm/ast: Upcast from DRM device to ast structure via to_ast_private()
  drm/ast: Use per-device logging macros

 drivers/gpu/drm/ast/ast_dp501.c |  24 +++----
 drivers/gpu/drm/ast/ast_drv.c   |   4 --
 drivers/gpu/drm/ast/ast_drv.h   |   7 +-
 drivers/gpu/drm/ast/ast_main.c  | 115 +++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_mode.c  |  73 ++++++++++----------
 drivers/gpu/drm/ast/ast_post.c  |  28 ++++----
 drivers/gpu/drm/ast/ast_ttm.c   |   2 +-
 7 files changed, 116 insertions(+), 137 deletions(-)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
