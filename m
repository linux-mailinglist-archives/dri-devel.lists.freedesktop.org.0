Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36AFC05019
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 10:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC8410EA07;
	Fri, 24 Oct 2025 08:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gycaGLTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBEA10EA07
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:15:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 906806428F;
 Fri, 24 Oct 2025 08:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB152C4CEF1;
 Fri, 24 Oct 2025 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761293712;
 bh=49SlPs0GtTNvbbpkzvJqX5+myNBId64ehKG2ocaYIl8=;
 h=From:To:Cc:Subject:Date:From;
 b=gycaGLTbn6eObMR4+zP6K447DrVnmm//xfPqTnANoNvGwrN7uOq4biTY3s87P4KsY
 R6wT6/KNbXzfDNOxMFiRY44io30OYQxVur1cJ6jfvDnz7hjKUUPqNQrUZgUrZ3DIrH
 ndd16rjuRLzICCXNvRHz1AYqZG4p0125G2IvFig32VxhUa5LoFnpU+GcK52BN8w6b2
 mKYAO9gY9okBDm4+rVCOFrQmtH/zz67CIab6usU7jg2XnBYciFWO8Q5MHo4loxq+G1
 sL5XVRqCcj2Ptp2U0W+ohdhjCJ/7KF6ePpJVOK+K2N8MN6eQOoudADPUiJreQa9KuD
 VdkywpXDWplGw==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Maintain spsc_queue through drm_sched
Date: Fri, 24 Oct 2025 10:15:00 +0200
Message-ID: <20251024081459.164634-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Back in the day a specialized lockless queue was designed solely for the
DRM GPU Scheduler: spsc_queue. This queue's only user is drm_sched, and
there is no dedicated maintainer entry for the queue.

Add the spsc_queue header to the DRM GPU Scheduler MAINTAINERS' section.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5889df9de210..efafe2b3517c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8580,6 +8580,7 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
+F:	include/drm/spsc_queue.h
 
 DRM GPUVM
 M:	Danilo Krummrich <dakr@kernel.org>
-- 
2.49.0

