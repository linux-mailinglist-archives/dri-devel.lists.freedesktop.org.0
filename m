Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCD41D3468
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 17:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3916E354;
	Thu, 14 May 2020 15:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800516E086
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 15:05:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 37CFD2A2F31
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/2] Introducing IOCTL's to set/get label's for a buffer
 object
Date: Thu, 14 May 2020 17:05:31 +0200
Message-Id: <cover.1589468282.git.rohan.garg@collabora.com>
X-Mailer: git-send-email 2.17.1
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
Cc: kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi
I've been reworking these label'ing patches in conjunction
with their userspace usage that can be found here [1].

The intention is that these patches will be useful for driver
developers and application developers alike in conjuction with
something like the OpenGL Label'ing extension [2].

Cheers
Rohan Garg

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2426/
[2] https://www.khronos.org/registry/OpenGL/extensions/EXT/EXT_debug_label.txt

Rohan Garg (2):
  drm/ioctl: Add a ioctl to set and get a label on GEM objects
  panfrost: Set default labeling helpers

 drivers/gpu/drm/drm_gem.c               | 54 ++++++++++++++++++
 drivers/gpu/drm/drm_internal.h          | 14 +++++
 drivers/gpu/drm/drm_ioctl.c             | 74 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c |  3 +
 include/drm/drm_drv.h                   | 32 +++++++++++
 include/drm/drm_gem.h                   | 16 +++++-
 include/uapi/drm/drm.h                  | 21 ++++++-
 7 files changed, 212 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
