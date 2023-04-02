Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D16D38CF
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 17:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A8010E0D4;
	Sun,  2 Apr 2023 15:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 423 seconds by postgrey-1.36 at gabe;
 Sun, 02 Apr 2023 15:41:27 UTC
Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39010E0D4
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 15:41:27 +0000 (UTC)
Received: from ritsuko.sh.sumomo.pri (unknown [112.64.60.49])
 by kozue.soulik.info (Postfix) with ESMTPSA id 579C9101D5C;
 Mon,  3 Apr 2023 00:34:07 +0900 (JST)
From: Randy Li <ayaka@soulik.info>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/2] Add pixel formats used in Synatpics SoC
Date: Sun,  2 Apr 2023 23:33:56 +0800
Message-Id: <20230402153358.32948-1-ayaka@soulik.info>
X-Mailer: git-send-email 2.39.2
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
Cc: tzimmermann@suse.de, Randy Li <ayaka@soulik.info>,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org, nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those pixel formats are used in Synaptics's VideoSmart series SoCs,
likes VS640, VS680. I just disclose the pixel formats used in the video
codecs and display pipeline this time. Actually any device connected to
the MTR module could support those tiling and compressed pixel formats.

https://synaptics.com/products/multimedia-solutions

Changelog:
v7:
Fixed all warnings and errors for its document.
Add its document to GPU tree.
v6:
Refresh and fix warnings in its document.
v5:
Moving back the document and rewriting the description.
v4:
Removed the patches for V4L2, V4L2 would use the drm_fourcc.h .
Moving the documents to the mesa project.
v3:
There was a mistake in format macro.
Correcting the description of 64L4 variant modifiers.
v2:
The DRM modifiers in the first draft is too simple, it can't tell
the tiles in group attribute in memory layout.
Removing the v4l2 fourcc. Adding a document for the future v4l2 extended
fmt.
v1:
first draft of DRM modifiers
Try to put basic tile formats into v4l2 fourcc

Hsia-Jun(Randy) Li (1):
  drm/fourcc: Add Synaptics VideoSmart tiled modifiers

Randy Li (1):
  Documentation/gpu: Add Synaptics tiling formats documentation

 Documentation/gpu/drivers.rst   |  1 +
 Documentation/gpu/synaptics.rst | 81 +++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_fourcc.h   | 75 ++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 Documentation/gpu/synaptics.rst

-- 
2.39.2

