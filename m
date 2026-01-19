Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDC4D3AF07
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB5D10E1B7;
	Mon, 19 Jan 2026 15:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ucI4Eg3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7745010E19B;
 Mon, 19 Jan 2026 15:31:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8054660055;
 Mon, 19 Jan 2026 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23105C116C6;
 Mon, 19 Jan 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768836694;
 bh=R4jVPr/K6xpQd5trxW23FdPhEhh//UE/8gc+kZSHETk=;
 h=From:To:Cc:Subject:Date:From;
 b=ucI4Eg3RzHVvlO55oTCrqSWKV/RWoSjn7S5KZf2XHWBJqb458OIryuJtlvCHe9QL4
 QMnxObb08e7/gcjQtE4JYgxFsmM3pFoD3EM2qViIKFL2Y4UTci3rJRM8yqVU5BSBID
 +bhIVsasVhaZKdW802QHqmAMPuF6lmndNcWWdL6azyEs5tdX3iu2BlSRLGcr202vc8
 pDb6blMh4ora//8Gipn8wDbnMJA0BE5jIbY31PphqwkWOvcld2EdMSMMFj369Hk0G5
 EBmooFo6Whgn7fy0B1L15C0snvkPzpwsRz+7KaUQifd/Ili+zj/mExqe5b4WiBG0s9
 8knw5b7jPpqWw==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] Documentation: nova: remove completed tasks
Date: Mon, 19 Jan 2026 16:31:04 +0100
Message-ID: <20260119153129.59876-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
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

Remove completed tasks from Nova's task list.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/gpu/nova/core/todo.rst | 42 ----------------------------
 1 file changed, 42 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 35cc7c31d423..2d920ee76ab0 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -134,21 +134,6 @@ A `num` core kernel module is being designed to provide these operations.
 | Complexity: Intermediate
 | Contact: Alexandre Courbot
 
-IRQ abstractions
-----------------
-
-Rust abstractions for IRQ handling.
-
-There is active ongoing work from Daniel Almeida [1] for the "core" abstractions
-to request IRQs.
-
-Besides optional review and testing work, the required ``pci::Device`` code
-around those core abstractions needs to be worked out.
-
-| Complexity: Intermediate
-| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.almeida@collabora.com/ [1]
-| Contact: Daniel Almeida
-
 Page abstraction for foreign pages
 ----------------------------------
 
@@ -161,17 +146,6 @@ There is active onging work from Abdiel Janulgue [1] and Lina [2].
 | Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel.janulgue@gmail.com/ [1]
 | Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net/ [2]
 
-Scatterlist / sg_table abstractions
------------------------------------
-
-Rust abstractions for scatterlist / sg_table.
-
-There is preceding work from Abdiel Janulgue, which hasn't made it to the
-mailing list yet.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 PCI MISC APIs
 -------------
 
@@ -180,22 +154,6 @@ capability, MSI API abstractions.
 
 | Complexity: Beginner
 
-XArray bindings [XARR]
-----------------------
-
-We need bindings for `xa_alloc`/`xa_alloc_cyclic` in order to generate the
-auxiliary device IDs.
-
-| Complexity: Intermediate
-
-Debugfs abstractions
---------------------
-
-Rust abstraction for debugfs APIs.
-
-| Reference: Export GSP log buffers
-| Complexity: Intermediate
-
 GPU (general)
 =============
 

base-commit: 086714bbb96f63785da251e1f8d1ce3e716a6e42
-- 
2.52.0

