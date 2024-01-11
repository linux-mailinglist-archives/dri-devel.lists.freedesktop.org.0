Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04282A9A9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C268910E845;
	Thu, 11 Jan 2024 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F58B10E7DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=tMlRLR1qg9/lV8ANg5
 oVzk/RVrvunJWO7lURJe1t1h8=; b=ajYwqpnGMRiPJTBKgGzZbowc9V/hYuo0VH
 fqpYjRoXIkyvaZxGgF4mxhANfrMU6QtUQUGofQ1m+bHQGxp2VJF16AM1/icLTQN6
 amy7Tg10+icGhsFij0ILfrX4O5M0xsoMwFwL0DpCycJKxCoT98jMDUQkp3YLP4o0
 oA8uBMo/M=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3X+8wkZ9lbDKQAA--.17659S2;
 Thu, 11 Jan 2024 14:56:49 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, patrik.r.jakobsson@gmail.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: Clean up errors in cdv_intel_dp.h
Date: Thu, 11 Jan 2024 06:56:48 +0000
Message-Id: <20240111065648.9170-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3X+8wkZ9lbDKQAA--.17659S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur13Ww1fXFyUZr1rJF4kXrb_yoW3trX_WF
 4UXrsrZrW3Cay5Wry7Ar9I9ryYvF1F93yv9Fy7Ka43Jw17Ary5u3429FykZ3WrCryUWFsr
 J3WkXFyrCrn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8wItUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBNi1mVOBk5u1AAAsW
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: else should follow close brace '}'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 27cfeb6b470f..135a1226df1a 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -735,7 +735,7 @@ cdv_intel_dp_aux_native_read(struct gma_encoder *encoder,
 		if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_ACK) {
 			memcpy(recv, reply + 1, ret - 1);
 			return ret - 1;
-		} else 
+		} else
 			if ((ack & DP_AUX_NATIVE_REPLY_MASK) == DP_AUX_NATIVE_REPLY_DEFER)
 				udelay(100);
 			else
-- 
2.17.1

