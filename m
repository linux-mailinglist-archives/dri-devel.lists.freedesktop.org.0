Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4659005F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B253B3B90;
	Thu, 11 Aug 2022 15:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B90A10F42B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 15:43:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18BE8B82150;
 Thu, 11 Aug 2022 15:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1189C433D7;
 Thu, 11 Aug 2022 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232590;
 bh=9Ueg5z2RmYuHVN12Ymoa2nwN1mbLVrlL9TUmV9jv+48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5+JYZwH6klAmtNEzhbrmoxpRTccxNjO4AmiB/HEWd/00FC7vsdgHeK+CoOrELMeE
 0C9NNdXpKureLvEN9nUS/MV7N7bWova9JYU87q9MOyzoJ5JTmdqUTVZwqQ+ybKRuN9
 0RmlAAHRhUpncT8p0f6TzqgCxungxIeLYDI9msDmc34daDTOvHE5NlcOSD3UM9Cscu
 n4OYecpVpCOMoNntM6BXA+GdVfc1+P5NpoQ13iyzLh99Q5K0YtqAD0UzhAZqfN227K
 5hW6V7t1gBWonmv/JaFJ5wXF1ufXEIgcFSQ+KAmqM5dSO1S1/CLrmChEhRUYJ01WLz
 MS7gt7TYhEKGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 08/93] drm/panfrost: Add arm,
 mali-valhall-jm compatible
Date: Thu, 11 Aug 2022 11:41:02 -0400
Message-Id: <20220811154237.1531313-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

[ Upstream commit 952cd974509251d6b5074bc3677b8297826a6ef1 ]

The most important Valhall-specific quirks have been handled, so add the
Valhall compatible and probe.

v2: Use arm,mali-valhall-jm compatible.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20220525145754.25866-10-alyssa.rosenzweig@collabora.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 601e124842e1..c1260532f003 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -664,6 +664,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
+	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{}
 };
-- 
2.35.1

