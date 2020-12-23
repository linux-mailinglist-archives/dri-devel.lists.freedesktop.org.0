Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622B2E11BC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590AE6E89C;
	Wed, 23 Dec 2020 02:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACEB6E8A4;
 Wed, 23 Dec 2020 02:17:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E0B23341;
 Wed, 23 Dec 2020 02:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689835;
 bh=7smt5Nbw/mwOG2CpwBEnVx/tDr69zosBjPJScyDkKb4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EzNSjTdxQnou4rChDgn38dEMbxSnDH4J7sGrxV7/NLjejx2YFONwCPgr6NaTab4SV
 3546wF7Uc8IkbOhTtq8k+IRpHRDpICsLNzr94ehL6OFHXhAJB/mpCzEgDh5XcTclQ0
 SlE0W+v5xtyWB6ht+EFBPp+Fs+kiTCTn6YueBPibpIZOVvSMvGhfwatPh+/zoOxAP8
 rF9S3P/GpECXj2dHpWWESL5y/jaO1Qu2Uk9pfkA0pD30s2T/a+jJAzlqwcN57RVbVq
 b3kxfPck7A+t76l/s5ga3L7rB+k0YjEkvJawO8fQqxC0+ofLGzAJEWB9TgzoqrPKcN
 I6/wojApY2BFA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 036/217] drm/amdgpu: add missing clock gating
 info in amdgpu_pm_info
Date: Tue, 22 Dec 2020 21:13:25 -0500
Message-Id: <20201223021626.2790791-36-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Wang <kevin1.wang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Wang <kevin1.wang@amd.com>

[ Upstream commit 71037bfc78bf63a6640792ace925741767fb6bfc ]

add missing clock gating informations in amdgpu_pm_info
1. AMD_CG_SUPPORT_VCN_MGCG
2. AMD_CG_SUPPORT_HDP_DS
3. AMD_CG_SUPPORT_HDP_SD
4. AMD_CG_SUPPORT_IH_CG
5. AMD_CG_SUPPORT_JPEG_MGCG

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 529816637c731..0cfba189cde6c 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -63,6 +63,11 @@ static const struct cg_flag_name clocks[] = {
 	{AMD_CG_SUPPORT_DRM_LS, "Digital Right Management Light Sleep"},
 	{AMD_CG_SUPPORT_ROM_MGCG, "Rom Medium Grain Clock Gating"},
 	{AMD_CG_SUPPORT_DF_MGCG, "Data Fabric Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_VCN_MGCG, "VCN Medium Grain Clock Gating"},
+	{AMD_CG_SUPPORT_HDP_DS, "Host Data Path Deep Sleep"},
+	{AMD_CG_SUPPORT_HDP_SD, "Host Data Path Shutdown"},
+	{AMD_CG_SUPPORT_IH_CG, "Interrupt Handler Clock Gating"},
+	{AMD_CG_SUPPORT_JPEG_MGCG, "JPEG Medium Grain Clock Gating"},
 
 	{AMD_CG_SUPPORT_ATHUB_MGCG, "Address Translation Hub Medium Grain Clock Gating"},
 	{AMD_CG_SUPPORT_ATHUB_LS, "Address Translation Hub Light Sleep"},
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
