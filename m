Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD531B804
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 12:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB01589FF7;
	Mon, 15 Feb 2021 11:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAB789FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=jqOKNqjixeHymtVGiT
 /YXCDtkOtiKO4vy73LiPAvZ6U=; b=e51yYAzJFzAmwdTbuQCyKxxzDg1nWOovZ8
 JSvx8dWFN75kxO/nbNE6DTdReeDO0DlmPu+2/7ttFlm28cSq8nDyllj1Qm7ohmsD
 BqiK54UknLBENQpyb2njUYr7e9cB8VGZG3UiiaU33TmreNzzh1AariSFHLyNY646
 Zc3ArneCM=
Received: from localhost.localdomain (unknown [125.70.196.55])
 by smtp9 (Coremail) with SMTP id DcCowABHW3tdWypgPnp0fQ--.17946S2;
 Mon, 15 Feb 2021 19:30:46 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/i915: Remove unused function pointer typedef
 long_pulse_detect_func
Date: Mon, 15 Feb 2021 19:30:19 +0800
Message-Id: <1613388619-3276-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
X-CM-TRANSID: DcCowABHW3tdWypgPnp0fQ--.17946S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4UCFy5CFy7CFW5ur4DJwb_yoW3Arg_Gr
 1UZrZrWrWUZFsI9a43W398XFyYyr1Uuay8Z3WSvas3Jas2y3s0yrW2qFyUZFn7WFW7JF9I
 q3WDWFsYyrZrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0bTmDUUUUU==
X-Originating-IP: [125.70.196.55]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/1tbiygY6nlQHLJC4DQAAsy
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen Lin <chen.lin5@zte.com.cn>,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Lin <chen.lin5@zte.com.cn>

Remove the 'long_pulse_detect_func' typedef as it is not used.

Signed-off-by: Chen Lin <chen.lin5@zte.com.cn>
---
 drivers/gpu/drm/i915/i915_irq.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 6cdb052..c294ac6 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -78,7 +78,6 @@ static inline void pmu_irq_stats(struct drm_i915_private *i915,
 	WRITE_ONCE(i915->pmu.irq_count, i915->pmu.irq_count + 1);
 }
 
-typedef bool (*long_pulse_detect_func)(enum hpd_pin pin, u32 val);
 typedef u32 (*hotplug_enables_func)(struct drm_i915_private *i915,
 				    enum hpd_pin pin);
 
-- 
1.7.9.5


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
