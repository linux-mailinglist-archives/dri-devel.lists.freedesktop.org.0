Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC73BCCCE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C31E6E283;
	Tue,  6 Jul 2021 11:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F416E288
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:18:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB82C61C66;
 Tue,  6 Jul 2021 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570337;
 bh=54JwrYKmyebOQcU6kiScVFvJq22l5JE8GEnssN0hO2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VSn0ifL3RAsCQiizbif+kQ2zlHCtamiMrt1Z5mJ4pLKRla74V8/xKFqbMsjtT+nvo
 WJshYvcl5GmwBVEeOOrrNacvdjZwvT21hLULyRVj7GgBFSUMjvGgjN7dtJ2HSA/p5u
 +9N7lhXpdxA6sNFlQv7loLuyQTrYtImk/pX04ZeEHF6RWwYC3RFux1upwB6AgdKIqO
 dL/AkkbvRLJCWY6Urc11sAQmBRAaKgmzmGNrJfFjxqzRJLDbDu7S2DDgWna1ECyyeh
 wjHYDLu1rNrqtoH+8mxWiw8IwLaeZjcqcnlOxpG1Cg8VHMqdTfFzG1n53E0DmYXOQk
 KupiEAP65uZag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 022/160] drm/bridge: lt9611: Add missing
 MODULE_DEVICE_TABLE
Date: Tue,  6 Jul 2021 07:16:08 -0400
Message-Id: <20210706111827.2060499-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 Zou Wei <zou_wei@huawei.com>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zou Wei <zou_wei@huawei.com>

[ Upstream commit 8d0b1fe81e18eb66a2d4406386760795fe0d77d9 ]

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1620801955-19188-1-git-send-email-zou_wei@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index d734d9402c35..c1926154eda8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1209,6 +1209,7 @@ static struct i2c_device_id lt9611_id[] = {
 	{ "lontium,lt9611", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, lt9611_id);
 
 static const struct of_device_id lt9611_match_table[] = {
 	{ .compatible = "lontium,lt9611" },
-- 
2.30.2

