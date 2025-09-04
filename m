Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4BDB43F76
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C07C10E262;
	Thu,  4 Sep 2025 14:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pqBq6TfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7E410E262
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 14:46:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54D064475E;
 Thu,  4 Sep 2025 14:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605EAC4CEF0;
 Thu,  4 Sep 2025 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756997199;
 bh=4OaoR6MRUGnsrwO71uu7b4nnkdjqtaki59n/6Bd07X8=;
 h=From:To:Cc:Subject:Date:From;
 b=pqBq6TfYq0sg8YPd0tgoEzqnCS6x7wxF18vHnp0J3PvJJtfyqCwGnU+yD9gUHCRGH
 WCV3iTU0Tyz7N8Q6o+X9ZkZ/BPxWQj/IoUFspHQtxG6z39h8G1yqBWeoE5hiEHpDBe
 km2IHflZjYe2uuspiyvZucYSox7dJfKkezYF7qbbuoN6c89dE9YnF6haFoarZTprdD
 92tDG9APvqzREUzYsN5CGEwT81w5oQX4dmv0CHGURCIjD2QPl1nHXikskMClpI0dGF
 AeGEllg/3rfLmMarDP6aIC5ZCid2x4eYRRXMEanaBbqSnCCm+nIgwzdx953BFmTSG5
 ugKhDf1EB/F9A==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: drm-rust: add drm-misc maintainers as reviewers
Date: Thu,  4 Sep 2025 16:45:50 +0200
Message-ID: <20250904144614.6406-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
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

As suggested by Maxime, add the drm-misc maintainers as reviewers to the
drm-rust entry.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b155a12f776..aac8cbeb7f2c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8098,6 +8098,9 @@ X:	drivers/gpu/drm/xe/
 DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
 M:	Alice Ryhl <aliceryhl@google.com>
+R:	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+R:	Maxime Ripard <mripard@kernel.org>
+R:	Thomas Zimmermann <tzimmermann@suse.de>
 S:	Supported
 W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git

base-commit: e4cefcf8c7dea4a32bc6f8d6352b083e5c82f23d
-- 
2.51.0

