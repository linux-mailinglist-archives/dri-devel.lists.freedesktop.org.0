Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C482FA2E92A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC90210E169;
	Mon, 10 Feb 2025 10:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FyXGZ9p1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C7310E169
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:24:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C40FA40FA0;
 Mon, 10 Feb 2025 10:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832C4C4CEE5;
 Mon, 10 Feb 2025 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739183042;
 bh=R/EbIe/Ut8zG0dwo6SVym6eFR34nXb/sZtcSXwfII9M=;
 h=From:To:Cc:Subject:Date:From;
 b=FyXGZ9p1YF2amZZxLqgEb4S5KaZInUNus+jqTjbyZvnMCCP532CUx5C420lzCYtEH
 ctsZnX75V2JhAiJhTBoGagRknLvE5FZfhUfJjpKRirvHN0jReAzQDQEBynC8O0IOz0
 CszU0DZJ7UKixO5bCy5Xp81NayQegjo3oAWChYNlzl5fEe5qN5A3rBB5JooeistEMN
 mphdrEovcIoEz/9oWE1VpV1+jGuTk47oeYZWah4VvPG2rIAl/tVWEAiLSC2lFcm1bn
 NIm8d3H5Zne0Bp1F/yVBrAhk/3jHolVtGgOEUWuI/ADC3FhrJTvv1o+HcdO8nnds3B
 y2dpLfIcalyRw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imagination: remove unnecessary header include path
Date: Mon, 10 Feb 2025 19:23:50 +0900
Message-ID: <20250210102352.1517115-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
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

drivers/gpu/drm/imagination/ includes local headers with the double-quote
form (#include "...").

Hence, the header search path addition is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/gpu/drm/imagination/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index 9bc6a3884c22..3d9d4d40fb80 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 # Copyright (c) 2023 Imagination Technologies Ltd.
 
-subdir-ccflags-y := -I$(src)
-
 powervr-y := \
 	pvr_ccb.o \
 	pvr_cccb.o \
-- 
2.43.0

