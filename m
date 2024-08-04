Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DBD946F3B
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 16:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1EC10E0B0;
	Sun,  4 Aug 2024 14:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="RPSe+GaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de
 [129.70.45.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB610E0AC;
 Sun,  4 Aug 2024 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1722780013;
 bh=m876A2GsQgfOTGHpdHgrxcX3ISbk2r46rH1W+Dyrem4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPSe+GaAbVD7/kHTEEsKRQlkLMmquP4kVooxiB9KCB3PvNKHcf8MusIu2fCK8W8bJ
 bijPkhBtUoNzwhuGJ33Hu8snD8colrtVVi4tpeX6y2HvTY9FEAD+JoqdZHo+ijtkWh
 RV+uWPzYd3G7VIBcvoGpT4kMbAYBZDpTGP5cYcfJxfJsK5JXbysmGTxJ/GVlCYvzP+
 AUvy5M5e0oJftXyioSmftLDiTrITMSkJhZBn8H6O5WediVx4W3N3Vto6wAolaINAJD
 3vnQPozr3gGYIoHxbCyBONy7+LSqS8FYevBt4IoH//LwSTtNSsWQ1FhkXQTzkadVXr
 84651KGijGvYQ==
Received: from localhost (dslb-088-074-203-146.088.074.pools.vodafone-ip.de
 [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id 320D921086;
 Sun,  4 Aug 2024 16:00:13 +0200 (CEST)
From: tjakobi@math.uni-bielefeld.de
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/amdgpu/swsmu: fix SMU11 typos (memlk -> memclk)
Date: Sun,  4 Aug 2024 15:56:29 +0200
Message-ID: <ba5afac355b7c74b417c8f886e992abbfa3c046c.1722778722.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
References: <cover.1722778722.git.tjakobi@math.uni-bielefeld.de>
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

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

No functional changes.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 5a68d365967f..a1a0e6224d72 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -1978,7 +1978,7 @@ static int navi10_get_power_profile_mode(struct smu_context *smu, char *buf)
 		size += sysfs_emit_at(buf, size, "%19s %d(%13s) %7d %7d %7d %7d %7d %7d %7d %7d %7d\n",
 			" ",
 			2,
-			"MEMLK",
+			"MEMCLK",
 			activity_monitor.Mem_FPS,
 			activity_monitor.Mem_MinFreqStep,
 			activity_monitor.Mem_MinActiveFreqType,
@@ -2038,7 +2038,7 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
 			activity_monitor.Soc_PD_Data_error_coeff = input[8];
 			activity_monitor.Soc_PD_Data_error_rate_coeff = input[9];
 			break;
-		case 2: /* Memlk */
+		case 2: /* Memclk */
 			activity_monitor.Mem_FPS = input[1];
 			activity_monitor.Mem_MinFreqStep = input[2];
 			activity_monitor.Mem_MinActiveFreqType = input[3];
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index e426f457a017..a7340569b9a1 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -1691,7 +1691,7 @@ static int sienna_cichlid_get_power_profile_mode(struct smu_context *smu, char *
 		size += sysfs_emit_at(buf, size, "%19s %d(%13s) %7d %7d %7d %7d %7d %7d %7d %7d %7d\n",
 			" ",
 			2,
-			"MEMLK",
+			"MEMCLK",
 			activity_monitor->Mem_FPS,
 			activity_monitor->Mem_MinFreqStep,
 			activity_monitor->Mem_MinActiveFreqType,
@@ -1754,7 +1754,7 @@ static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *
 			activity_monitor->Fclk_PD_Data_error_coeff = input[8];
 			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[9];
 			break;
-		case 2: /* Memlk */
+		case 2: /* Memclk */
 			activity_monitor->Mem_FPS = input[1];
 			activity_monitor->Mem_MinFreqStep = input[2];
 			activity_monitor->Mem_MinActiveFreqType = input[3];
-- 
2.44.2

