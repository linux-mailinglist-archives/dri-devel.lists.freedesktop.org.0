Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F246D911C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ABC10EB01;
	Thu,  6 Apr 2023 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Wed, 05 Apr 2023 20:34:28 UTC
Received: from purple.birch.relay.mailchannels.net
 (purple.birch.relay.mailchannels.net [23.83.209.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C1810E29D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 20:34:27 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|hussein@unixcat.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 39C12820ADB;
 Wed,  5 Apr 2023 20:26:13 +0000 (UTC)
Received: from pdx1-sub0-mail-a274.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 716FB8213BD;
 Wed,  5 Apr 2023 20:26:12 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1680726372; a=rsa-sha256;
 cv=none;
 b=euTqKO7VgGaow3fcWeYFMcm8F7hVlJk6q6nupsLDg8yg62hOZiMGxG1HZygAbItV51AolQ
 4SEYjf9RR2u3SqGpFiLmKMAJgYA8+Tr6pIm1V49FrkRNfKAbsGFDI6u3nmZMlc3nR/Hqlh
 +adPzsv/W8T9Bnri+v9mBNF6d25bCJUI5BpK9pPbgNOq2JDyxawastDS8gjE6JRoWXUPvP
 JiyrgeQPrQG0C+ya2//Md25n27ZOqDo/+oEs0gajW6alwOUHT7IT/A5+vZipssPV5/1lWt
 UgI7qQyzCRV0PsMv2NvbYxzXh1IXj53/vzPOnL7vy4/JGJPwibmnFcZn4K2vIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1680726372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:dkim-signature;
 bh=FuyEMZvmAWDxMJFQh1LL8xxCYlmV+MwfQRYvShWdRo0=;
 b=oZz8Cr/owe3zo+VOtnY88WvoOAvbBpSmTK1zqzbrpHCo7OSfA9WBDoonmZHDC3bTzyW+vd
 XQCt+YUaMuoPSZJlj6wD300xQf5iYG+2/ttKUqlQAI5H8awQWAttqqQAHSFtFNICNbq5i4
 qbSWsigfFTZSalEVDbxMdsR78Vr+2cGo4qPUa/4NHK11Uz8uHnSMzAbknH4Bf0u8ZsLa+4
 0qj4Ui8CD4NYRURj5BN8naml6CehGw26QgxnekTNp3TWxB090zJXD1FpYJ6HD9kaUCMyb+
 dWTqmPw4DxnQayY3HmMEnfBgXFm7i3NnhAj6rlPuynoqhI+6MZIfDG9Mm+rJJw==
ARC-Authentication-Results: i=1; rspamd-5468d68f6d-pw7rc;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=hussein@unixcat.org
X-Sender-Id: dreamhost|x-authsender|hussein@unixcat.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|hussein@unixcat.org
X-MailChannels-Auth-Id: dreamhost
X-Print-Abortive: 1f83be640e217771_1680726372967_2123184992
X-MC-Loop-Signature: 1680726372967:346014462
X-MC-Ingress-Time: 1680726372967
Received: from pdx1-sub0-mail-a274.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.125.42.143 (trex/6.7.2); Wed, 05 Apr 2023 20:26:12 +0000
Received: from localhost (unknown [175.144.191.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: hussein@unixcat.org)
 by pdx1-sub0-mail-a274.dreamhost.com (Postfix) with ESMTPSA id 4PsGNz4n7sz8n; 
 Wed,  5 Apr 2023 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixcat.org;
 s=dreamhost; t=1680726372;
 bh=FuyEMZvmAWDxMJFQh1LL8xxCYlmV+MwfQRYvShWdRo0=;
 h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
 b=vanpv/ZSmY1TYV7CZE/rRq7QtFAxqcN7aY3VlWvzv5AMwkBQ7cr1eiO46L98sRxb9
 JAJU4O4q8Sah9l0CaPB/R35ul5u7q/5G20667vx8AYZfTBZj7i6ZPsLNgREgR7ZCB5
 SrH98su2JISRD4RIYqLwD7LSgAgVpj8WfQWWpJU0=
From: Nur Hussein <hussein@unixcat.org>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra : Avoid potential integer overflow of 32 bit int
Date: Thu,  6 Apr 2023 04:25:59 +0800
Message-Id: <20230405202559.2232430-1-hussein@unixcat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Apr 2023 08:04:34 +0000
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
Cc: Nur Hussein <hussein@unixcat.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In tegra_sor_compute_config(), the 32-bit value mode->clock
is multiplied by 1000, and assigned to the u64 variable pclk.
We can avoid a potential 32-bit integer overflow by casting
mode->clock to u64 before we do the arithmetic and assignment.

Signed-off-by: Nur Hussein <hussein@unixcat.org>
---
 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index cd25f409979c..8d910695775c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1153,7 +1153,7 @@ static int tegra_sor_compute_config(struct tegra_sor *sor,
 				    struct drm_dp_link *link)
 {
 	const u64 f = 100000, link_rate = link->rate * 1000;
-	const u64 pclk = mode->clock * 1000;
+	const u64 pclk = (u64)mode->clock * 1000;
 	u64 input, output, watermark, num;
 	struct tegra_sor_params params;
 	u32 num_syms_per_line;
-- 
2.34.1

