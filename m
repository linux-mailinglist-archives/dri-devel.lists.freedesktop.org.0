Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7AA7AA6C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD30B10EA73;
	Thu,  3 Apr 2025 19:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f01DyL7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577F10EA70;
 Thu,  3 Apr 2025 19:13:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AC4A434E9;
 Thu,  3 Apr 2025 19:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CADDC4CEE8;
 Thu,  3 Apr 2025 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707607;
 bh=SRyFvLMMRGesH6dLXsN6I9az/EgLLJC2UoRs9dEt4/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f01DyL7tHh2c8wjXu2kjpZJRCzgga4H3rWtjvrx3IDdDn++wc2+EQwKJ/6rlRcrY0
 DBnE2p6klBpf+z4+qohF9Ej4hBPf77v5CbcQjJv/WeED9d6G5j5lrp/XGX9ghNjI8f
 oy1L6nYIhRRtse6TVrJg+m/T2GNUmsTmMV/eFvL/scwTqClaQTomiv/yL95eUJ03Dd
 gF6Bbo3RU7l0ff2+el45anRZc+5/lJw2l2GijuUWrEtt/QhsZgWhqGweY1BXgQBsqG
 uQlmEhSV27tkC4ZHIzDNR+Pli1s61+vdLds2BbYe9H7vt2VbcojZPTlAiVwNYJR1Vf
 zXjuhv0c/RAGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Clint Taylor <Clinton.A.Taylor@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sasha Levin <sashal@kernel.org>,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 05/44] drm/xe/ptl: Update the PTL pci id table
Date: Thu,  3 Apr 2025 15:12:34 -0400
Message-Id: <20250403191313.2679091-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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

From: Matt Atwood <matthew.s.atwood@intel.com>

[ Upstream commit 16016ade13f691da315fac7b23ebf1ab7b28b7ab ]

Update to current bspec table.

Bspec: 72574

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Clint Taylor <Clinton.A.Taylor@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250128175102.45797-1-matthew.s.atwood@intel.com
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/intel/pciids.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 4035e215c962a..f9d3e85142ea8 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -856,12 +856,10 @@
 	MACRO__(0xB080, ## __VA_ARGS__), \
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
-	MACRO__(0xB091, ## __VA_ARGS__), \
-	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.39.5

