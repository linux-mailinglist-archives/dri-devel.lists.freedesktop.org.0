Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5DA881D3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2040510E5B9;
	Mon, 14 Apr 2025 13:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c28KFnPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5F010E5B5;
 Mon, 14 Apr 2025 13:26:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 628A0614BD;
 Mon, 14 Apr 2025 13:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25B2C4CEEC;
 Mon, 14 Apr 2025 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637211;
 bh=Qp6THprdWDFWle92yah0O82HvsSdGxsVeMTRew2db0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c28KFnPfyXlJi9B+gFDTnhXBRQrlmO9tkvfLkzsMNtQgaJ8G7Svmg3rxxUg+nxD54
 6wdBMm+olWpHU27/yr8wYNxFDiqRPLLP4GyfsNYSoO9vpYB6xvoMhk5bwyeI3TAcvh
 Qq91gdSzc/pxtT6InHN3yz5OiTTjBu0ktP/gya1kfbWYBG1AMCVtMLom7vwwwQJJpc
 02ApqMH3n1uWs4MANXeELQO08QtvoGCTxwLf+9aTAVHcE39P+eeXgzg3NOz7La7ol0
 Nnx9qS9vqIJXQ+5YaDwaBDLzvp0dQ4ZZM5Gj7FtiI2eF8J3rD9tP8gkrRjl3Q5z1NE
 RDyPRktUuJyLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sasha Levin <sashal@kernel.org>, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 16/34] drm/xe/xe3lpg: Apply Wa_14022293748,
 Wa_22019794406
Date: Mon, 14 Apr 2025 09:25:52 -0400
Message-Id: <20250414132610.677644-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

[ Upstream commit 00e0ae4f1f872800413c819f8a2a909dc29cdc35 ]

Extend Wa_14022293748, Wa_22019794406 to Xe3_LPG

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Link: https://lore.kernel.org/r/20250325224310.1455499-1-julia.filipchuk@intel.com
(cherry picked from commit 32af900f2c6b1846fd3ede8ad36dd180d7e4ae70)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 40438c3d9b723..32d3853b08ec8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,8 +30,10 @@
 13011645652	GRAPHICS_VERSION(2004)
 14022293748	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019794406	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
+		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
-- 
2.39.5

