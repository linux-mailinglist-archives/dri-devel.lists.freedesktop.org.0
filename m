Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5CEB40D7F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222F10E81F;
	Tue,  2 Sep 2025 19:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eWccGRAI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E5510E81F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:03:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6931432C1;
 Tue,  2 Sep 2025 19:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECF8C4CEED;
 Tue,  2 Sep 2025 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756839789;
 bh=Sa+ecDxCqs9FN1B/i4rvFCE69l3/h70iyFxc7ANcI84=;
 h=From:To:Cc:Subject:Date:From;
 b=eWccGRAI0o81fSfrc6dQ53e5vDexEJdfMThWEqK3mbPfCP9xRjWOH5GwBe5IDxANZ
 00Zh3Hpj3CdgTaspGoIOQ3XxnHPlUva0i5RxOoL9x6SfMB87HG5jGqDHC1cMLN64Rs
 xcNl/ENfmy5q1cQNRLRpgOFjc1PbESvV8osp14i1Ws280uCEaxhZ/Oxi2nuR5qHItP
 ygAdlGlVQo9YmnpSd5M7clL1jp73uhQpyg0LTuCTbRtCm6q2JQjpZuJykhwmF8SbHh
 sxqsPzyAX84SK9Mf+Y7wyB2fRiNloxomzq01osrxYfdG+Wd6U29MH/tbUx2u6iU/jO
 toTmGAlqirvmQ==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 acourbot@nvidia.com
Cc: dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: drm-misc: fix X: entries for nova/nouveau
Date: Tue,  2 Sep 2025 21:02:22 +0200
Message-ID: <20250902190247.435340-1-dakr@kernel.org>
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

Nouveau patches usually flow through the drm-misc tree, while nova (and
nova-core) are maintained through a dedicated driver tree and soon
through drm-rust.

Hence, fix up the corresponding X: entries to list nova instead of
nouveau.

Reported-by: Maxime Ripard <mripard@kernel.org>
Closes: https://lore.kernel.org/dri-devel/enuksb2qk5wyrilz3l2vnog45lghgmplrav5to6pd5k5owi36h@pxdq6y5dpgpt/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef..84e07eb11da3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8091,7 +8091,7 @@ X:	drivers/gpu/drm/i915/
 X:	drivers/gpu/drm/kmb/
 X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
-X:	drivers/gpu/drm/nouveau/
+X:	drivers/gpu/drm/nova/
 X:	drivers/gpu/drm/radeon/
 X:	drivers/gpu/drm/tegra/
 X:	drivers/gpu/drm/xe/

base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.51.0

