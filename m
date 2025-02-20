Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D12A3DC1B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C72B10E966;
	Thu, 20 Feb 2025 14:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9841E10E966
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:08:17 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: dri-devel@lists.freedesktop.org,
	cgroups@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>,
 Natalie Vock <natalie.vock@gmx.de>
Subject: [PATCH] MAINTAINERS: Add entry for DMEM cgroup controller
Date: Thu, 20 Feb 2025 15:07:57 +0100
Message-ID: <20250220140757.16823-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

The cgroups controller is currently maintained through the
drm-misc tree, so lets add add Maxime Ripard, Natalie Vock
and me as specific maintainers for dmem.

We keep the cgroup mailing list CC'd on all cgroup specific patches.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Natalie Vock <natalie.vock@gmx.de>
---
 .mailmap    |  1 +
 MAINTAINERS | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/.mailmap b/.mailmap
index fedebf86640ad..52718c77aa479 100644
--- a/.mailmap
+++ b/.mailmap
@@ -519,6 +519,7 @@ Nadav Amit <nadav.amit@gmail.com> <namit@cs.technion.ac.il>
 Nadia Yvette Chambers <nyc@holomorphy.com> William Lee Irwin III <wli@holomorphy.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <n-horiguchi@ah.jp.nec.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <naoya.horiguchi@nec.com>
+Natalie Vock <natalie.vock@gmx.de> <friedrich.vock@gmx.de>
 Nathan Chancellor <nathan@kernel.org> <natechancellor@gmail.com>
 Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.ibm.com>
 Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.vnet.ibm.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 4684e38368db2..5d57278904534 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5926,6 +5926,17 @@ F:	tools/testing/selftests/cgroup/test_cpuset.c
 F:	tools/testing/selftests/cgroup/test_cpuset_prs.sh
 F:	tools/testing/selftests/cgroup/test_cpuset_v1_base.sh
 
+CONTROL GROUP - DEVICE MEMORY CONTROLLER (DMEM)
+M:	Maarten Lankhorst <dev@lankhorst.se>
+M:	Maxime Ripard <mripard@kernel.org>
+M:	Natalie Vock <natalie.vock@gmx.de>
+S:	Maintained
+L:	cgroups@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	include/linux/cgroup_dmem.h
+F:	kernel/cgroup/dmem.c
+
 CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)
 M:	Johannes Weiner <hannes@cmpxchg.org>
 M:	Michal Hocko <mhocko@kernel.org>
-- 
2.45.2

