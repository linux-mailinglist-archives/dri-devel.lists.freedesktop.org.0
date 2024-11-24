Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185A9D70DC
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A2310E504;
	Sun, 24 Nov 2024 13:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j7B0nEyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5510E502;
 Sun, 24 Nov 2024 13:41:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2B3C0A40B7D;
 Sun, 24 Nov 2024 13:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EF0C4CED3;
 Sun, 24 Nov 2024 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455678;
 bh=M8vWynzc5IbnBUi2s8iUj8xr3SRbhHvpKk1BCl3C+H8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j7B0nEyo9DbQ8XqPCQakpeLGNgDaUbu6Lw589cgIpdsuPgokC0jJjWguoZ/CW6NCT
 iUjJ4FeaVkGfoD978fa/ckyd6bR3pX0kk1izlTnPB4C6BGGd6XTsS8cCFLaAkMEgwm
 zDUjHvO/CtqiGGV5cPkw5RP331O/2ykQmTdaBChvZniciZB8MSALOmhXBDpT4N6f30
 wHYj7KQsg2dTw22R4xY1oyMdePzGaArFKwULGAseGfUJ/bfVCODAzjXZp/a3A/jhma
 cRp0qam5G1lj793F0SN/xWXJgHVWUZEPqXtSwPKgE/GeKIjIyBoWgtREN6KBG4Sdwv
 gkY1utDeruYIw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Sasha Levin <sashal@kernel.org>,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 07/87] drm/xe/pciid: Add new PCI id for ARL
Date: Sun, 24 Nov 2024 08:37:45 -0500
Message-ID: <20241124134102.3344326-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

[ Upstream commit 35667a0330612bb25a689e4d3a687d47cede1d7a ]

Add new PCI id for ARL platform.

v2: Fix typo in PCI id (SaiTeja)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240912115906.2730577-1-dnyaneshwar.bhadane@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/intel/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 59233eb008628..4ba88d2dccd4b 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -179,7 +179,8 @@
 	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__)
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB640, ## __VA_ARGS__)
 
 /* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
-- 
2.43.0

