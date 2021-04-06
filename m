Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94820355560
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 15:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAFE89FF7;
	Tue,  6 Apr 2021 13:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AFB89FF7;
 Tue,  6 Apr 2021 13:39:42 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lTlvf-0003iY-Hg; Tue, 06 Apr 2021 13:39:39 +0000
From: Colin King <colin.king@canonical.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH][next] drm/msm: Fix spelling mistake "Purgable" -> "Purgeable"
Date: Tue,  6 Apr 2021 14:39:39 +0100
Message-Id: <20210406133939.425987-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in debugfs gem stats. Fix it. Also
re-align output to cater for the extra 1 character.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index f146d9c5ba9c..4e2e0a93d17d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -979,13 +979,13 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 		msm_gem_describe(obj, m, &stats);
 	}
 
-	seq_printf(m, "Total:    %4d objects, %9zu bytes\n",
+	seq_printf(m, "Total:     %4d objects, %9zu bytes\n",
 			stats.all.count, stats.all.size);
-	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
+	seq_printf(m, "Active:    %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
-	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
+	seq_printf(m, "Purgeable: %4d objects, %9zu bytes\n",
 			stats.purgable.count, stats.purgable.size);
-	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
+	seq_printf(m, "Purged:    %4d objects, %9zu bytes\n",
 			stats.purged.count, stats.purged.size);
 }
 #endif
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
