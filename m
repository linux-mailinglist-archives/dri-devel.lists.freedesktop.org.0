Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89CEA70DD5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 00:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070D10E638;
	Tue, 25 Mar 2025 23:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l/AW+Nqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ECF10E63A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 23:56:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BFCCA4397A;
 Tue, 25 Mar 2025 23:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF010C4CEE4;
 Tue, 25 Mar 2025 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742946993;
 bh=J+5Ar80w8tDhl22LAV7sasRTJlBrOL/KbuhE9AE55Oo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l/AW+Nqd0RyWdaexZMH3zktzNe83G/6XI83y/5R588bTz0KSUYt21ql2VlmIbVi04
 uW7tliS5n6VBYjkhEGFnedcCHmjR4ey1VRFlXBS2H3xAYRXrGW3hfB+pY4a/iAlpi7
 KAN/nMgtQE2+0GPSE+JCnQvzwx3OTkMmCdbuhWKD+aMwfaLm+fcBonRGbqarc3zz6R
 KCEbN2T1+gtA1/QWNDVnOU/ewK5wSJ6ddkoXTKg8bSMRPvoNNnqHEXarzdnXRUlgmf
 Uf5wAraulI9xq3H+F6zhzxsc28fgNizhUBSEOHK4A9xN2B7Gl9Aq8W+M4hprQub2JY
 AduQ7YO9hCf8w==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 acurrid@nvidia.com, lina@asahilina.net, daniel.almeida@collabora.com,
 j@jannau.net
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Date: Wed, 26 Mar 2025 00:54:35 +0100
Message-ID: <20250325235522.3992-9-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
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

Add the DRM Rust source files to the DRM DRIVERS maintainers entry.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index de46acc247c3..c704431f02aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7672,6 +7672,7 @@ F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/
+F:	rust/kernel/drm/
 F:	include/drm/
 F:	include/linux/vga*
 F:	include/uapi/drm/
-- 
2.49.0

