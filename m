Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F58AD973
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 01:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373AD112E60;
	Mon, 22 Apr 2024 23:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c43VIKTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDB8112E60
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 23:54:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8526ECE0A54;
 Mon, 22 Apr 2024 23:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F1C2BD11;
 Mon, 22 Apr 2024 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713830077;
 bh=ORyF3E69A5jDJre8UM/0l1GJc/YxLifcAcCq/V7oblI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c43VIKTj1xZZIiHah4bqEmaXrkfgL7I9hJ1aFhty6SvLvKnxLNazolPVp5u7qFMwT
 NX4ITlEY09jlImVAn+dWgapXE7+c7ZWE9FeLLByuq/kvgN+Q85yauXhnsMM/kJTdNz
 R37Mry5kKjAIPPmJS9JjTUVSDcjh74tYXd5JF3Thit9fNiv8qKvovi6vR3r/l2MIoR
 PBSfA2uq+Wfx19QTbWt37Pq0NopLKy79kCo9b4zhWqjeh6noVpqklEO6LIBg1U7zfq
 K03iryT/Slk936vRyX5o/828cEr4M8c3vI3RIk2NoLOv+8AnSwu9LMDbHWBaLD9q1d
 bwFtPq4Kqe28Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>,
	Wachowski@freedesktop.org,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>, stanislaw.gruszka@linux.intel.com,
	ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.8 18/43] accel/ivpu: Improve clarity of MMU error
 messages
Date: Mon, 22 Apr 2024 19:14:04 -0400
Message-ID: <20240422231521.1592991-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422231521.1592991-1-sashal@kernel.org>
References: <20240422231521.1592991-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.7
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

[ Upstream commit 3556f922612caf4c9b97cf7337626f8342b3dea3 ]

This patch improves readability and clarity of MMU error messages.
Previously, the error strings were somewhat confusing and could lead to
ambiguous interpretations, making it difficult to diagnose issues.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240402104929.941186-6-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 91bd640655ab3..2e46b322c4505 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -278,7 +278,7 @@ static const char *ivpu_mmu_event_to_str(u32 cmd)
 	case IVPU_MMU_EVT_F_VMS_FETCH:
 		return "Fetch of VMS caused external abort";
 	default:
-		return "Unknown CMDQ command";
+		return "Unknown event";
 	}
 }
 
@@ -286,15 +286,15 @@ static const char *ivpu_mmu_cmdq_err_to_str(u32 err)
 {
 	switch (err) {
 	case IVPU_MMU_CERROR_NONE:
-		return "No CMDQ Error";
+		return "No error";
 	case IVPU_MMU_CERROR_ILL:
 		return "Illegal command";
 	case IVPU_MMU_CERROR_ABT:
-		return "External abort on CMDQ read";
+		return "External abort on command queue read";
 	case IVPU_MMU_CERROR_ATC_INV_SYNC:
 		return "Sync failed to complete ATS invalidation";
 	default:
-		return "Unknown CMDQ Error";
+		return "Unknown error";
 	}
 }
 
-- 
2.43.0

