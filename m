Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57D1F6397
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D794189D63;
	Thu, 11 Jun 2020 08:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E32889D42
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:28:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DAE7AE28;
 Thu, 11 Jun 2020 08:28:15 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.velikov@collabora.com, kraxel@redhat.com, noralf@tronnes.org,
 chen@aspeedtech.com
Subject: [PATCH 0/3] ast cleanups
Date: Thu, 11 Jun 2020 10:28:06 +0200
Message-Id: <20200611082809.7838-1-tzimmermann@suse.de>
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

Ast still has to be converted to managed initialization, and embed the
DRM device in the ast structure. In preparation of these changes, add
some cleanups to the driver.

Tested on ast HW.

Thomas Zimmermann (3):
  drm/ast: Remove unused code paths for AST 1180
  drm/ast: Upcast from DRM device to ast structure via to_ast_private()
  drm/ast: Use per-device logging macros

 drivers/gpu/drm/ast/ast_dp501.c |  24 +++----
 drivers/gpu/drm/ast/ast_drv.c   |   1 -
 drivers/gpu/drm/ast/ast_drv.h   |   7 +-
 drivers/gpu/drm/ast/ast_main.c  | 115 +++++++++++++++-----------------
 drivers/gpu/drm/ast/ast_mode.c  |  59 +++++++---------
 drivers/gpu/drm/ast/ast_post.c  |  28 ++++----
 drivers/gpu/drm/ast/ast_ttm.c   |   2 +-
 7 files changed, 107 insertions(+), 129 deletions(-)

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
