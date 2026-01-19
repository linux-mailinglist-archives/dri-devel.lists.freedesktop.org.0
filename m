Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D2AD3AF0B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 16:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927D310E4A2;
	Mon, 19 Jan 2026 15:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P4XhWmby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37C810E19B;
 Mon, 19 Jan 2026 15:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 21B5E60055;
 Mon, 19 Jan 2026 15:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F74C19423;
 Mon, 19 Jan 2026 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768836695;
 bh=Rutg44yRMmYuxi30Cfs/bJk2QNaEIsjLQT0fhQq38kA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P4XhWmby85H+lO40VgKGtSK24/QHQ6E5L84nZE8Pd9j6jlq7qb3SzZ6ZjMzbVZ5Gn
 xKUtz46DZEZXGaMMiMat+XTN9GSs5SLnBl/fJgTGTj5ruG2n37i/ZqraXzrGi2OgMY
 N6p9VhX5v7/uIG0phchviPvni4XSBh/6meWakfO8zN8By/cfL+nLCcakee3XqJyuy7
 fHA3vR7E5gDBhSW8CMNR5cuQ48KlOvjgkN1Jl7F9ijVnn+gMmEdR7JvH3fspNNZygK
 gOIcVotUxqMq1me14RZE/wsXs35Ug5Gof+230udkb/BdDORD64IPZ/kdTOLUbrUHUc
 VthUxFSvoT0RA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] Documentation: nova: update pending tasks
Date: Mon, 19 Jan 2026 16:31:05 +0100
Message-ID: <20260119153129.59876-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119153129.59876-1-dakr@kernel.org>
References: <20260119153129.59876-1-dakr@kernel.org>
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

Some tasks, while already having some progress, are still pending, hence
update them.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 2d920ee76ab0..a3ba3e189049 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -41,8 +41,15 @@ trait [1] from the num crate.
 Having this generalization also helps with implementing a generic macro that
 automatically generates the corresponding mappings between a value and a number.
 
+FromPrimitive support has been worked on in the past, but hasn't been followed
+since then [1].
+
+There also have been considerations of ToPrimitive [2].
+
 | Complexity: Beginner
 | Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
+| Link: https://lore.kernel.org/all/cover.1750689857.git.y.j3ms.n@gmail.com/ [1]
+| Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Implement.20.60FromPrimitive.60.20trait.20.2B.20derive.20macro.20for.20nova-core/with/541971854 [2]
 
 Generic register abstraction [REGA]
 -----------------------------------
@@ -152,7 +159,11 @@ PCI MISC APIs
 Extend the existing PCI device / driver abstractions by SR-IOV, config space,
 capability, MSI API abstractions.
 
+SR-IOV [1] and PCI configuration space [2] work is in progress.
+
 | Complexity: Beginner
+| Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com/ [1]
+| Link: https://lore.kernel.org/all/20260115212657.399231-5-zhiw@nvidia.com/ [2]
 
 GPU (general)
 =============
@@ -191,7 +202,10 @@ Some possible options:
     - maple_tree
   - native Rust collections
 
+There is work in progress for using drm_buddy [1].
+
 | Complexity: Advanced
+| Link: https://lore.kernel.org/all/20251219203805.1246586-4-joelagnelf@nvidia.com/ [1]
 
 Instance Memory
 ---------------
-- 
2.52.0

