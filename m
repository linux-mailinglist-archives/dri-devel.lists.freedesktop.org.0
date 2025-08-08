Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E378B1E596
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1386010E8EF;
	Fri,  8 Aug 2025 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fVmJWN4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174E710E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 09:24:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 32C6FA55AFD;
 Fri,  8 Aug 2025 09:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A079FC4CEED;
 Fri,  8 Aug 2025 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754645082;
 bh=TWwvhH6UvfqW8nQUU7AdiyPCs7ejHvM1UOFBja/EwLo=;
 h=From:To:Cc:Subject:Date:From;
 b=fVmJWN4rjY6z8OPGO1dtT+BNAq42hcl8HPwPXONrA9B6nBvJQQw/cnN7T6nNuyvdD
 6tJ/tVtT544rygOBchYiq8PmyOXlR+/BIBnwM2vFL9QljiSM77vJ7I55jsy5ny/qzJ
 Ar9f4BlVWK0kE+YPsL6aIqqNm5P3xAh7Vo8TrSCqpPPOkY6+OU3JDLM6n6IIjw9EV2
 ALRXP1e5Q5XH5SO73/T07VUv/cf7YV3vY9QwUitFNwMT0uZ7+p62qfeOQdeA9YBpcd
 K8EZRhhi1Y0qJ4Etw3uX9g5xG4Q1gQCsukPVf9moatllj15/XCp6DfCjJxzFTCdXd0
 sjeHJcDfQeSrw==
From: Danilo Krummrich <dakr@kernel.org>
To: boris.brezillon@collabora.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, aliceryhl@google.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: entry for DRM GPUVM
Date: Fri,  8 Aug 2025 11:20:49 +0200
Message-ID: <20250808092432.461250-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GPUVM deserves a bit more coordination, also given the upcoming Rust
work for GPUVM, hence add a dedicated maintainers entry for DRM GPUVM.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
@Boris: I think it'd be good to add you as well, but haven't heard back from you
so far, hence I did not add you to the entry for now.
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd62ad58a47f..ea42a43851cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8426,6 +8426,17 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/scheduler/
 F:	include/drm/gpu_scheduler.h
 
+DRM GPUVM
+M:	Danilo Krummrich <dakr@kernel.org>
+R:	Matthew Brost <matthew.brost@intel.com>
+R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
+R:	Alice Ryhl <aliceryhl@google.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/drm_gpuvm.c
+F:	include/drm/drm_gpuvm.h
+
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
 M:	Javier Martinez Canillas <javierm@redhat.com>
-- 
2.50.1

