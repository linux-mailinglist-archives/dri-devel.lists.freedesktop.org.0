Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E886A978C6E
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 03:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE7C10E095;
	Sat, 14 Sep 2024 01:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="g4B+0WRu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id C4FC310E095;
 Sat, 14 Sep 2024 01:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=b5ISz
 Ocl87C2Oa7hmnu46pT5UEWK+FR4Ymk/RNFCsoc=; b=g4B+0WRuTXRGlfAdhbVqN
 HLW1kIE0TuIYSQTP7PSD4WcoQQHX8IkeYf1LeCuMAX6xPifzVX9YW/6c8sn0S3Gn
 XsGb6myaXXY3DyHcy+2R9QKZWevOvMu+f7v+CnfYth7fE72OkSRIHLKkdYlVFtXl
 o/FA8IR9sMuY73vNzOPFBI=
Received: from zhanghe-System-Product-Name.. (unknown [183.14.213.146])
 by gzga-smtp-mta-g2-0 (Coremail) with SMTP id _____wD3v7Ko5+Rmp8TEDw--.62024S4;
 Sat, 14 Sep 2024 09:32:25 +0800 (CST)
From: Zhang He <zhanghe9702@163.com>
To: andi.shyti@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhang He <zhanghe9702@163.com>
Subject: [PATCH 2/2] drm/i915/gt: Fixed an typo
Date: Sat, 14 Sep 2024 09:31:46 +0800
Message-Id: <20240914013146.65757-1-zhanghe9702@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913140721.31165-1-zhanghe9702@163.com>
References: <20240913140721.31165-1-zhanghe9702@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v7Ko5+Rmp8TEDw--.62024S4
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1rJr15ZF4rtr1fXw4rAFb_yoWkArb_Kw
 47tr4xAa43Ga909w17Ar13ZF1jkanIvr97WF1xtrW3Ary2yr45Xas3ury7Xrs5Ga13JayD
 Aa4kXr1fZwsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUItCUUUUUU==
X-Originating-IP: [183.14.213.146]
X-CM-SenderInfo: x2kd0wlkhzliqs6rljoofrz/1tbiWwtaamV4LmnRgQAAsq
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

---
ChangeLog:
    v1: use correct name as Author and Signer
    v2: change one line in drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c,
        LLC's information header from "Effective CPU freq" to "Effective GPU freq"

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

