Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DAE379C54
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 03:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6646E992;
	Tue, 11 May 2021 01:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55B6E992
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 01:57:05 +0000 (UTC)
IronPort-SDR: 1cozcttm7grrrU8uxr+X+MbAR4U9Bo4+2KYx/5YRWRevwLPRIC/uTDIKbmF+qOJ2ZeSmhyopPr
 vE5FtdbGXSmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196239146"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196239146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 18:56:59 -0700
IronPort-SDR: xuJm9/Xp2bfa6nWQ3DJeYhIoAsJInpKGfKKlSetUCH4J5SxK/jfEuoBsTvYIciW9micvt8HTOS
 e1Pu4l78LBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434067376"
Received: from test.bj.intel.com ([10.238.158.204])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 18:56:56 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 0/3] Add virtio-gpu modifiers support
Date: Mon, 10 May 2021 21:49:37 -0400
Message-Id: <20210511014940.2067715-1-tina.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset introduces the modifiers support to virtio-gpu. 

This RFC version tries to add a new virtio-gpu command to let front-end driver
query the modifiers' info from the backend. Besides, the front-end driver
may also need a new drm helper function to add the supported modifiers to a
plane as its properties and allow fbs to use modifiers on that plane.

Tina Zhang (2):
  drm: Add drm_plane_add_modifiers()
  drm/virtio: Add modifier support

Vivek Kasireddy (1):
  drm/virtio: Include modifier as part of set_scanout_blob

 drivers/gpu/drm/drm_plane.c            | 41 +++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 16 +++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 45 +++++++++++++++++++++++++-
 include/drm/drm_plane.h                |  3 ++
 include/uapi/linux/virtio_gpu.h        |  9 ++++++
 7 files changed, 119 insertions(+), 1 deletion(-)

-- 
2.25.1

