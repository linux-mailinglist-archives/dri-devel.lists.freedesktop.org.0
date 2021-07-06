Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A898D3BCB96
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7CC6E02E;
	Tue,  6 Jul 2021 11:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62236E02C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:14:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D12861C27;
 Tue,  6 Jul 2021 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570089;
 bh=VJ8P4Ab1nZCdjjRelUX3TpNPd6Tpk7LP2DA5BWQnWO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R7JYqZTjYYhkrtY6NgateibNNTztyjis3sH35dnpV26dy6ynM65XjrvA8LEJJHkpu
 UTDE4TyB0bs0JL9PDi9seChaFE/AaGbBKlWnacpbfll/p/iJqcLg5WqZsQ6D/vP+L7
 EV6cp9eWIWPHvaRyLAYNQ95u56V1+ey3A4ZkLpEfgdRFdP4xRK4Fia9j2NrTMXyT1w
 YAGvCpuK7ZuNodrUok4lwV8jpxMX8kSfyfk34th1EcMefPEiAUx7eXv9XhsvJ1quVZ
 V3k9EIousoyehEpttTdDEe5iWurEUzTq6AzEBo5LObRUzG5HK1nLirYHIAftmQ2QRY
 ILx9dKN+1KaxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 028/189] drm/bridge: lt9611: Add missing
 MODULE_DEVICE_TABLE
Date: Tue,  6 Jul 2021 07:11:28 -0400
Message-Id: <20210706111409.2058071-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
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
index e8eb8deb444b..29b1ce2140ab 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1215,6 +1215,7 @@ static struct i2c_device_id lt9611_id[] = {
 	{ "lontium,lt9611", 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, lt9611_id);
 
 static const struct of_device_id lt9611_match_table[] = {
 	{ .compatible = "lontium,lt9611" },
-- 
2.30.2

