Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C9381E9A
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B1289B0B;
	Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC03189B01;
 Sun, 16 May 2021 12:13:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3306BB118;
 Sun, 16 May 2021 12:13:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Subject: [PATCH 0/4] drm: Finally retire struct drm_format_name_buf
Date: Sun, 16 May 2021 14:13:11 +0200
Message-Id: <20210516121315.30321-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a cleanup patchset to remove drm_format_name_buf et al. There
are two instances in drivers that need to be replaced with the %4cc
printk format modifier. Patch 3 was left over back from an earlier
patchset. [1] Patch 4 removes struct drm_format_name_buf.

I built-tested with drm-tip. The patchsetcan be mered through drm-misc.

[1] https://lore.kernel.org/dri-devel/20210216155723.17109-1-sakari.ailus@linux.intel.com/

Sakari Ailus (1):
  drm: Remove drm_get_format_name()

Thomas Zimmermann (3):
  drm/amdgpu: Use %p4cc to print 4CC format
  drm/simpledrm: Use %p4cc to print 4CC format
  drm/fourcc: Remove struct drm_format_buf_name

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  7 ++----
 drivers/gpu/drm/drm_fourcc.c                | 25 ---------------------
 drivers/gpu/drm/tiny/simpledrm.c            |  6 ++---
 include/drm/drm_fourcc.h                    |  9 --------
 4 files changed, 4 insertions(+), 43 deletions(-)

--
2.31.1

