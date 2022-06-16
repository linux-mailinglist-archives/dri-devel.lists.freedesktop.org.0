Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38B54DB42
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AED10E6D5;
	Thu, 16 Jun 2022 07:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com
 [162.62.57.252])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1710E6D5;
 Thu, 16 Jun 2022 07:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1655363318; bh=idbdNC33xevN6ZtoUUFthqlXafvy0QHgWej1vQ9pQts=;
 h=From:To:Cc:Subject:Date;
 b=H2DwyA98gB/h2nxmsbNY1f8GBbHcSA0pKn5RpSiBY3AJ7V0EeAE5BmvuZs1Vjtbb9
 0PsVeHCPb/UGXOx3BQqrfWy7VWsauEDqxAm8vjzjeHYcFW94TyDgonbchiiARb8r68
 lXIMX2rMQLHe8u6hlejrEG6u5ay1AUIYWzwNkhrs=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc9.qq.com (NewEsmtp) with SMTP
 id 2232966F; Thu, 16 Jun 2022 15:08:35 +0800
X-QQ-mid: xmsmtpt1655363315tej6e9lnp
Message-ID: <tencent_7B226C4A9BC2B5EEB37B70C188B5015D290A@qq.com>
X-QQ-XMAILINFO: NyTsQ4JOu2J2ieFjiGNA/unOwey1GGAlUSLHpJXyAVRP49p7+EVtr4jRMXeISA
 gFeP5u+V4vXkw/Yt7ev958v8MQJrU4sQAvcPyDaL7CrUaWZ3g8Y9tQ2yt+fFwPBLX3XFxW7yD3DR
 z7u5+rPjJNCeDlmlemFmPlGgbud49c/Ob/x+koMOg0co5eOBEo/N2cwOslvV9JOcXeR9GlP/EVM3
 pzUSypm3QYTz6dIq9WScfChPLxH04jfCxXSldZquAfYt4HchZDsagL05scG6xiPTt0DTRBgTxdFa
 bVtU5FUlS43+j95d0qm95xNJwlCfImTUsFhU6roX1e2X60pf4hQNd89potAJfC33DbrTDOznhFoa
 Z6Z9htQBGU0FFidK0jH7HH8R73OZt4/4yoAlj2J/gvLQmQuaWfyBWAvPMVL+C30XaeHpoTQukN+L
 qK/fewHTReEWE88A3bKD4QJmK6PKM6Qa4vy+t+yf7oMSX4bpoxIhQrsx5hKUT7BYwmyxs3tQQP0m
 fdUJdhC9lrJ18zjbKDgR1gUKnmColtts9Em5YjfJuACGXNvRmufVuxeFom1KTe1ChOH/4zcDGx3R
 c+G2SjTufWdH5PvzHdgb10IhCGZ8WKP52gfq3sBZY9fAOxrdqVY+vPxb++mGqi3cs2qmWg15LD6V
 lY9HSQWg4VchAvCh1YulyW5dmPKUP0+tUuUyNOe/mGIKA0RoXeLbZfelm0hDQJPjCSvH5veSHYIt
 xZ4PjoKds4pdRouCUBiTIBx3Ws45QOYb9dxHwkhQyquW0Z1Xn98kn1ir26HrMHeypdMh6lXalg51
 +XyJ8MrtszKTwg4naqBjryK0N9rheVmMZBD/DMe/i+glsrDmyDdFv6COysmR3dVVUE0HGi4N87Fa
 a+hp+9NvLm1hewoBt2/8HULyg8xWDh+q4ioQYSEdLw
From: 1064094935@qq.com
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH] drm/i915: Fix spelling typo in comment
Date: Thu, 16 Jun 2022 15:08:03 +0800
X-OQ-MSGID: <20220616070803.105901-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comment.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index 80ac0db1ae8c..85518b28cd72 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -114,7 +114,7 @@ u32 i915_gem_fence_alignment(struct drm_i915_private *i915, u32 size,
 	return i915_gem_fence_size(i915, size, tiling, stride);
 }
 
-/* Check pitch constriants for all chips & tiling formats */
+/* Check pitch constraints for all chips & tiling formats */
 static bool
 i915_tiling_ok(struct drm_i915_gem_object *obj,
 	       unsigned int tiling, unsigned int stride)
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
