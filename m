Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5F7F2821
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F00E10E2A3;
	Tue, 21 Nov 2023 08:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Tue, 21 Nov 2023 04:43:14 UTC
Received: from zg8tmtu5ljg5lje1ms4xmtka.icoremail.net
 (zg8tmtu5ljg5lje1ms4xmtka.icoremail.net [159.89.151.119])
 by gabe.freedesktop.org (Postfix) with ESMTP id B485D10E035;
 Tue, 21 Nov 2023 04:43:14 +0000 (UTC)
Received: from hust.edu.cn (unknown [172.16.0.52])
 by app1 (Coremail) with SMTP id HgEQrABnDG3OM1xlKCQaAA--.55822S2;
 Tue, 21 Nov 2023 12:36:30 +0800 (CST)
Received: from ubuntu.localdomain (unknown [10.12.173.122])
 by gateway (Coremail) with SMTP id _____wDX61HHM1xlw68DAA--.6772S2;
 Tue, 21 Nov 2023 12:36:29 +0800 (CST)
From: RutingZhang <u202112078@hust.edu.cn>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] gpu: display: remove unnecessary braces to fix coding style
Date: Tue, 21 Nov 2023 12:36:20 +0800
Message-Id: <20231121043621.9351-1-u202112078@hust.edu.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HgEQrABnDG3OM1xlKCQaAA--.55822S2
Authentication-Results: app1; spf=neutral smtp.mail=u202112078@hust.ed
	u.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtFy5Xw48GF17tr1xJF1xuFg_yoWkWrb_CF
 18Kan3Gw15AF1vqFW2yr4ruwsIkrWUuan7W3Z8KFWakay7Ww1Ut3y7WFyYgw1fZF9xAFyD
 CFWkGF15Zwn2kjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbmxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
 s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
 8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
 WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
 YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
 1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42
 xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY
 6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVFApDUUUU
X-CM-SenderInfo: rxsqjiirsqlmo6kx23oohg3hdfq/
X-Mailman-Approved-At: Tue, 21 Nov 2023 08:54:58 +0000
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
Cc: hust-os-kernel-patches@googlegroups.com,
 RutingZhang <u202112078@hust.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dongliang Mu <dzm91@hust.edu.cn>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

checkpatch complains that:

WARNING: braces {} are not necessary for single statement blocks
+                if (pool->base.irqs != NULL) {
+                        dal_irq_service_destroy(&pool->base.irqs);
+                }

Fixed it by removing unnecessary braces to fix the coding style issue.

Signed-off-by: RutingZhang <u202112078@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 447de8492594..6835dbb733a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -713,9 +713,8 @@ static void dcn21_resource_destruct(struct dcn21_resource_pool *pool)
 			pool->base.hubps[i] = NULL;
 		}
 
-		if (pool->base.irqs != NULL) { 
+		if (pool->base.irqs != NULL)
 			dal_irq_service_destroy(&pool->base.irqs);
-		}
 	}
 
 	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
-- 
2.25.1

