Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB689D9E1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6823A112D8F;
	Tue,  9 Apr 2024 13:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=falconsigh.net header.i=@falconsigh.net header.b="eaPaOygV";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ks4PqO3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 850 seconds by postgrey-1.36 at gabe;
 Tue, 09 Apr 2024 13:11:24 UTC
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CB4112D8D;
 Tue,  9 Apr 2024 13:11:23 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 3A4861140125;
 Tue,  9 Apr 2024 08:57:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Apr 2024 08:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=falconsigh.net;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1712667433; x=1712753833; bh=bX6N1mV9wA
 YLoKewLAuFKZq5rTPxUZFmis0Y0wufflo=; b=eaPaOygVLGfoLq1oyOjJ0jA85b
 WcteDCKDRYqGhP7PEgGvHgbQyrw8zK2YPiDMCjHP2RCxT98YKo4z0cD5xV12ZCqf
 WTyt444eEEHZKkPhHMCRc2XQ9TE4KJEyD++fGhAVQVFRQVa2Pf1hT2R0u2kWVByg
 hEWRY4Ciu9XCZBrmw3DbNlfn43wZyYQ5S7qDc4kz6FV4e2oD8jla0MR2WJs+Ijxq
 Vx2L8yxY+Z9cESVJylDUS3x4asjKkXBuEMcaevEpA7ZroKF9Ri0NxEVGbyiWJVMP
 EkQUjYOn8ZBYL4H85udyS1RieOFhZcCFsANjnBNiOcgxt47HQA650ueunufg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1712667433; x=1712753833; bh=bX6N1mV9wAYLoKewLAuFKZq5rTPx
 UZFmis0Y0wufflo=; b=Ks4PqO3mTmVhRPyW+vwbWDuCw7bUn4NoBMjz5VjQNpJy
 tLU0zElC35fssob62gkWgBTxlPT1ISQNp1qSOFJPXdoiukQwMEw83CAAJcqPcjOH
 OF+UKd1JO+uuTF+/XSBbqxL1GA5xTEar5y+CvrzMUtW1+9Kvmq9202/tbERYB9nD
 2JSMTtCRS5NLS68vkDjg1rYxIujEvjflSiEm0xc4QFF13DzUaTYlimKsRiPA87ub
 c8KalVq7MaxgTDl3CMfekql3pU5jxh9BsDrUugpZxg39P9jn/0HxP9psnFdNxkPI
 xpwAN/VpImI5dBCfxMKlGiJR8U8x/7IR1fcTEKa+7g==
X-ME-Sender: <xms:KDsVZsaLzgPFl5VvagALJGRqGY6I0KIxGYvkTP-vmAw0W8dSEPz5Zg>
 <xme:KDsVZnaDAwdIz5dLucqM6UyuwDGuzvWt_dgMM080npfmL9BHess6BUyhhMKB8v03_
 LjcEM8pF8Xl3KvSqg>
X-ME-Received: <xmr:KDsVZm9Vw6ANxFGz9aP_bQ_bL3loUojw3WyeoTo8LPhaPMi_fl5-vSOkMM4IEU5rx572-nJHn1vexuJaZz7Ngw7kbFp8fsx4IB8L5Vj8nUrW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehtddgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepiigrnhesfhgr
 lhgtohhnshhighhhrdhnvghtnecuggftrfgrthhtvghrnhepueeuieegueehieetveehge
 dukeffteeuffdtjeeuteetjeeigeekgeetudffhfdtnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepiigrnhesfhgrlhgtohhnshhighhhrdhnvg
 ht
X-ME-Proxy: <xmx:KDsVZmqGJDvZOKuWqEZ2hN-oBiaz9IauwKSmKz4qDJc_2S26urdQuA>
 <xmx:KDsVZno7TBFfo2-qr6RdtSYsr1YLJlJaIzpBKC583JDFcNsWuA6i9g>
 <xmx:KDsVZkSLQ_zyGDBgQ4ngv3jpAFVJAl82id8-Qw7BlmKc-sb783ijCQ>
 <xmx:KDsVZnr1LuW-f3XbPDyBwS2zgzdE1as5jxQVybEctW-BSnnlaV86lA>
 <xmx:KTsVZon5F0tLUdQXqPdkuCryRt9gObIfH2xWguP4z23NWDSRE9VwXV0w>
Feedback-ID: i9d3c4088:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Apr 2024 08:57:11 -0400 (EDT)
From: zan@falconsigh.net
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, robdclark@gmail.com,
 konrad.dybcio@linaro.org, Zan Dobersek <zdobersek@igalia.com>
Subject: [PATCH] drm/msm/adreno: fix CP cycles stat retrieval on a7xx
Date: Tue,  9 Apr 2024 14:57:00 +0200
Message-ID: <20240409125700.651398-1-zan@falconsigh.net>
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

From: Zan Dobersek <zdobersek@igalia.com>

a7xx_submit() should use the a7xx variant of the RBBM_PERFCTR_CP register
for retrieving the CP cycles value before and after the submitted command
stream execution.

Signed-off-by: Zan Dobersek <zdobersek@igalia.com>
Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0674aca0f8a3..107d3277bcee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -284,7 +284,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
 
-	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
+	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_start));
 	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
 		rbmemptr_stats(ring, index, alwayson_start));
@@ -330,7 +330,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x00e); /* IB1LIST end */
 
-	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
+	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
 	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
 		rbmemptr_stats(ring, index, alwayson_end));
-- 
2.43.0

