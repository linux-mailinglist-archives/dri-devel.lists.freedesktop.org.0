Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F0A7CE780
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 21:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21FA10E43F;
	Wed, 18 Oct 2023 19:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5077610E455
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 19:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1697656440; bh=KGqlSDYBgWttHIyKz56cezEh4s6DnMn/uHHqAtaHZ2Q=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=l1gXdYSyRuJwtImnarUvdmkO1qFyaKI3DhuvRM1XwaJ3D60Q5CiE+Fpjieji0wWqz
 maPAA0QuWZl7fOhCq+G68H4kphX2IQZbZuAk0L5HigHfFO48t8Dpfnh1FMAKkX5MBH
 wKl0N0AM3G/dlw8n4p7j/qZMGi6f2hmnQm+qiPLs=
Received: by b221-4.in.mailobj.net [192.168.90.24] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Wed, 18 Oct 2023 21:14:00 +0200 (CEST)
X-EA-Auth: PNQy6XQwm0gdVvIHuOoPi65nI93ancTUU5UJb9uuFsXaKNI5l1yFOTyrmjbf5nkDWZG4QnGtqv6NOJZneH8bR4WWtBB5XN68
Date: Thu, 19 Oct 2023 00:43:54 +0530
From: Deepak R Varma <drv@mailo.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/ivpu: Delete the TODO file
Message-ID: <ZTAucrOT69/tQK2o@runicha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Deepak R Varma <drv@mailo.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The work items listed in the TODO file of this driver file are either
completed or dropped. The file is no more significant according
to the maintainers. Hence removing it from the sources.

Suggested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/accel/ivpu/TODO | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 drivers/accel/ivpu/TODO

diff --git a/drivers/accel/ivpu/TODO b/drivers/accel/ivpu/TODO
deleted file mode 100644
index 9077217ae10f..000000000000
--- a/drivers/accel/ivpu/TODO
+++ /dev/null
@@ -1,11 +0,0 @@
-- Move to threaded_irqs to mitigate potential infinite loop in ivpu_ipc_irq_handler()
-- Implement support for BLOB IDs
-- Add debugfs support to improve debugging and testing
-- Add tracing events for performance debugging
-- Implement HW based scheduling support
-- Use syncobjs for submit/sync
-- Refactor IPC protocol to improve message latency
-- Implement BO cache and MADVISE IOCTL
-- Add support for user allocated buffers using prime import and dma-buf heaps
-- Refactor struct ivpu_bo to use struct drm_gem_shmem_object
-- Add driver/device documentation
--
2.39.2



