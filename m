Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FF31CD14
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 16:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF626E17A;
	Tue, 16 Feb 2021 15:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F226E17A;
 Tue, 16 Feb 2021 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=JG9uWKvpbV1Cd8Iaar
 ecJYRe4VJqRgKnHB+UIjS2A8I=; b=MZIAdTFnnI+5JK2Lasch2eoHgymL+m/oX9
 bRvnooZbxbDSoA5QzjF85fEmnSkNAeB+QVJwONPHKS9eH7g9dyv+6rHi7a8cQNJG
 ldhBeDU2JWLdlUb7Cj1kxYK1lWsJxWPibAdO+vhnz2ZarVDC87Dv9SLxwo9qWZfQ
 lVhM1OtDk=
Received: from localhost.localdomain (unknown [125.70.193.99])
 by smtp10 (Coremail) with SMTP id DsCowABnjpr05itgrT+llA--.32407S2;
 Tue, 16 Feb 2021 23:38:38 +0800 (CST)
From: Chen Lin <chen45464546@163.com>
To: ville.syrjala@linux.intel.com
Subject: [v2] drm/i915: Use function pointer typedef long_pulse_detect_func in
 intel_get_hpd_pins
Date: Tue, 16 Feb 2021 23:39:05 +0800
Message-Id: <1613489945-5875-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YCuvRTwGxocZULT1@intel.com>
References: <YCuvRTwGxocZULT1@intel.com>
X-CM-TRANSID: DsCowABnjpr05itgrT+llA--.32407S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4fuw47Ar1xXrWrCFykXwb_yoW3uwb_WF
 4UZrZrGrWDAFsI9F9xuws8JFyay343ua1kAwn2y3Zxta4xAwn3t3sFgryUXr4fXF13JFnx
 Jw4qgFsYyr4kGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0b4S5UUUUU==
X-Originating-IP: [125.70.193.99]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/xtbBRw47nlPAB0KDxAAAs9
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chen.lin5@zte.com.cn, rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chen Lin <chen.lin5@zte.com.cn>

Use function pointer typedef long_pulse_detect_func in intel_get_hpd_pins.

Signed-off-by: Chen Lin <chen.lin5@zte.com.cn>
---
 drivers/gpu/drm/i915/i915_irq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 6cdb052..4339bad 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -1203,7 +1203,7 @@ static void intel_get_hpd_pins(struct drm_i915_private *dev_priv,
 			       u32 *pin_mask, u32 *long_mask,
 			       u32 hotplug_trigger, u32 dig_hotplug_reg,
 			       const u32 hpd[HPD_NUM_PINS],
-			       bool long_pulse_detect(enum hpd_pin pin, u32 val))
+			       long_pulse_detect_func long_pulse_detect)
 {
 	enum hpd_pin pin;
 
-- 
1.7.9.5


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
