Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6271C854C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 11:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE676E0DC;
	Thu,  7 May 2020 09:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B9A6E0D3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 09:03:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6459DAD31;
 Thu,  7 May 2020 09:03:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, john.p.donnelly@oracle.com
Subject: [PATCH v2 0/6] Prepare mgag200 for simple KMS and managed init
Date: Thu,  7 May 2020 11:03:09 +0200
Message-Id: <20200507090315.21274-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
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

(was: drm/mgag200: Embed DRM device in struct mga_device)

This is v2 of the patchset for embedding the DRM device instance in struct
mga_device. Following Sam's suggestion I only picked the first three
patches of v1. On top of that I added 3 patches from mgag200's simple-KMS
patchset. The patch set prepares mgag200 for simple KMS and managed
initialization, but also makes sense on its own.

All patches have been reviewed and/or acked already. If no one objects, I'll
soon merge them into drm-misc-next.

v2:
	* removed patches 4 and 5, added 3 patches from simple-KMS patchset
	* improved commit messages
	* to_mga_device() is now a function
	* fixed error mesage for mgag200_vga_connector_init()

Thomas Zimmermann (6):
  drm/mgag200: Convert struct drm_device to struct mga_device with
    helper
  drm/mgag200: Remove several references to struct mga_device.dev
  drm/mgag200: Integrate init function into load function
  drm/mgag200: Use managed mode-config initialization
  drm/mgag200: Remove unused fields from struct mga_device
  drm/mgag200: Embed connector instance in struct mga_device

 drivers/gpu/drm/mgag200/mgag200_cursor.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c    |   2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  15 ++-
 drivers/gpu/drm/mgag200/mgag200_i2c.c    |  10 +-
 drivers/gpu/drm/mgag200/mgag200_main.c   | 115 ++++++--------------
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 127 ++++++++++++++---------
 6 files changed, 125 insertions(+), 148 deletions(-)

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
