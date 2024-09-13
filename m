Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234089782FC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 16:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E2810E279;
	Fri, 13 Sep 2024 14:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="lsyKC0l6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1804 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2024 14:52:50 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 638AE10E279
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vhXsw
 QNcNfx7zs0+92P6rzpmeXE/YeSFV7cX1UuXW/M=; b=lsyKC0l6/4u2P0oMF6LLj
 8T52HnuNh9V71pC3rmEX8+SxoSt2B0Y3nO0dTrGaGofmaw2BAt2bhVeOWLMSJ7AM
 IzmKNHU7Ahx7V3zXso5BClxN448Qt9VbM5dL0YOrBFf7qn7dUbcLdzNaCjGgEwNp
 JOw2I/lRMbeP3IJtgknVBg=
Received: from zhanghe-System-Product-Name.. (unknown [183.14.213.146])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wDnDzkbR+RmkOrcAQ--.52329S4;
 Fri, 13 Sep 2024 22:07:24 +0800 (CST)
From: Zhang He <zhanghe9702@163.com>
To: andi.shyti@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 trivial@kernel.org, Zhang He <zhanghe9702@163.com>
Subject: [PATCH] drm/i915/gt: Fixed an typo
Date: Fri, 13 Sep 2024 22:07:21 +0800
Message-Id: <20240913140721.31165-1-zhanghe9702@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnDzkbR+RmkOrcAQ--.52329S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw47XrW8XFWUCw1kWFyDWrg_yoWfZFc_Kw
 47trs7J3y3Ga909347Ar13uF1jkanI9r97Wr1xtFW3Ary2yr4UX3WfWry7Xr4rKa13JayD
 A3WkXr1fZwnxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREs2atUUUUU==
X-Originating-IP: [183.14.213.146]
X-CM-SenderInfo: x2kd0wlkhzliqs6rljoofrz/xtbBDxxZamVOGqM8SQAAsH
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

column header should be GPU, not CPU

Signed-off-by: Zhang He <zhanghe9702@163.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 8d08b38874ef..b635aa2820d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -431,7 +431,7 @@ static int llc_show(struct seq_file *m, void *data)
 		max_gpu_freq /= GEN9_FREQ_SCALER;
 	}
 
-	seq_puts(m, "GPU freq (MHz)\tEffective CPU freq (MHz)\tEffective Ring freq (MHz)\n");
+	seq_puts(m, "GPU freq (MHz)\tEffective GPU freq (MHz)\tEffective Ring freq (MHz)\n");
 
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 	for (gpu_freq = min_gpu_freq; gpu_freq <= max_gpu_freq; gpu_freq++) {
-- 
2.34.1

