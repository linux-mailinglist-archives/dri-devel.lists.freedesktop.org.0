Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60344A0B2B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D200610E5DE;
	Mon, 13 Jan 2025 09:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3Mir3fs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC5410E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:26:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 030C1A40CFB;
 Mon, 13 Jan 2025 09:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDEAC4CEE1;
 Mon, 13 Jan 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736760383;
 bh=rKYRxwVH9G5tQwnPWN7e8BfY/H/rOa2mgN6RvB1yR3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b3Mir3fsZqeqgviEiyMCwErgpkWgzeXc0Qiw+jwgoU5IukW5Q7AzAXU+D+kY1L2Z9
 yTUcTDxk/+2l4guY0iBl7F8cjC3m0FTEvxAoPvcDTKwzSrK53fcgKoxVSw9SeD/c3r
 v+JDFBMr6jb4dXvxJSArgCyBa+VUUo3KNqADV/n8L3uEA0rlLMdrj8cPRG3Aen7z6i
 oHammgNfgMfhWE03QUae0HpB9UpuCkVs+h41ifzOevQlsuRVOLnNWgGG3JUPfOjckx
 FYKpxgBdRf5Wdjr1YOybIiSnzEkM2cxoRcf8UEo7v4UO0cBvRCR7mO4ELrqY7gWgVG
 idu+OhOXGRxnw==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 4/4] doc/cgroup: Fix title underline length
Date: Mon, 13 Jan 2025 10:26:08 +0100
Message-ID: <20250113092608.1349287-4-mripard@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113092608.1349287-1-mripard@kernel.org>
References: <20250113092608.1349287-1-mripard@kernel.org>
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

Commit

Commit b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting
cgroup") introduced a new documentation file, with a shorter than
expected underline. This results in a documentation build warning. Fix
that underline length.

Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20250113154611.624256bf@canb.auug.org.au/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/core-api/cgroup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core-api/cgroup.rst
index 8696e9513f51..734ea21e1e17 100644
--- a/Documentation/core-api/cgroup.rst
+++ b/Documentation/core-api/cgroup.rst
@@ -1,9 +1,9 @@
 ==================
 Cgroup Kernel APIs
 ==================
 
 Device Memory Cgroup API (dmemcg)
-=========================
+=================================
 .. kernel-doc:: kernel/cgroup/dmem.c
    :export:
 
-- 
2.47.1

