Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040114F721A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD3B10E6AB;
	Thu,  7 Apr 2022 02:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D3810E6AB;
 Thu,  7 Apr 2022 02:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1649298732;
 bh=EE9E+vmbSiL+K//wojxGVNYmWUWjLLsXN8IgKVrebUk=;
 h=From:To:Cc:Subject:Date;
 b=OuIOFMkE2v14WJyUFfOxHhhyUSUTW43Xd3Fc/l2f5UWAp5iPiOyhIGkagdFIm6eog
 vWBnjRekeNrD5l7haTJXWUhIjbrSYiJyGGP2p60qHQUx+nefu41Zyyza63NsTggb+q
 7p+yAsUaw14U/Zj1U4OVA1HhI/aSdlfJEqIlr1nY=
Received: from localhost.localdomain ([43.227.138.48])
 by newxmesmtplogicsvrszb6.qq.com (NewEsmtp) with SMTP
 id 8082725D; Thu, 07 Apr 2022 10:32:08 +0800
X-QQ-mid: xmsmtpt1649298728tccwz3535
Message-ID: <tencent_8E2A1C78140EE1784AB2FF4B2088CC0AB908@qq.com>
X-QQ-XMAILINFO: NSMIDlHhjvLjbXcmEjGjYtMMB+VxtOCuqM52WBMXPTZa5F9/hJEebwSU+dSyh+
 7DH+K4JCzvWDAE2eWZm4BoFyPznmN7xhHELxv+2zcDNzm5tG/NvjSbBPXMoIRXICEgy7IPe3Mkbg
 2YvBRmYADVDi2NnIBnTxVNEVk0s6jPXhUDMnnwPwS8tGvymQkEHYOyVVwabh8PHONsCr8UxennEI
 2rczCZMJhDKnn1SsowQH20yEc8UvqiCnyEPR1UvJKVeCh1B/XWoyx98Dxa8i9K3c+nkhrHFQmfiJ
 EefFHV4HCPA2Jdvgh++/jgIZRWJy9qQn/3wVevqYub1ZqJfFY7/owJzgDnQqNqIsrR4cdHzp9oA/
 VGn59ERTFRjezkhVk2qVVfky8SkvymTT18b08Ltmy+Mg/KLztiv4FVXL6f0mW6Q7LXoqJpu4pRmj
 f8JcbGA+cZGAkznfpPo7FVbfpTLXnOgj7z7VlR0ZwRuHxaeTiDPQioe5BbZK1yivn0HtM5IvSFHo
 EmlrIe9r4UAScMtBOqJjAXaKC2vtaS2K2qFf6DQizXTeOjNIk2r1mpbNK+wCPXsOy2WRT7NlHjZ1
 boNu7eNzS84EfqN/NU9Uiujal69kaQ8wS767eTRNkOqIj6JAeU0HhJAxS0gf87joAL9bCyyLncSq
 Xuutjrjh9Q+FlJ7LwIZIu0ZB29VTnnBwVcEL8I3elo1lQ/454vlId/Ht8P3pUka77/zJrWcyu34z
 d1fMesTcUmBq6Woqwe96DhUcbdUktUtUupCNLVP+rXQ5ZOCj+1wWRU+00Mqz/Yp95ezOHsrUM5ZJ
 g+A4q2PCokVhj8QtZoPOJ/B78AeGQXPY5AaL9tfYm/5BwLdyp/NYvLJUlrWNUD5lctGJSMCbVGm1
 npco49BZrkNCXZjLY9ZUJXOonZOP6rux1flXJ/f5YPvHFEGCFrBRA/PO2Y1FjfK2Q9mRMlvQUh6m
 VpUX3Nun3qh06suqvJlQ==
From: xkernel.wang@foxmail.com
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com
Subject: [PATCH v2] drm/msm/mdp5: check the return of kzalloc()
Date: Thu,  7 Apr 2022 10:31:51 +0800
X-OQ-MSGID: <20220407023151.13663-1-xkernel.wang@foxmail.com>
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kzalloc() is a memory allocation function which can return NULL when
some internal memory errors happen. So it is better to check it to
prevent potential wrong memory access.

Besides, since mdp5_plane_reset() is void type, so we should better
set `plane-state` to NULL after releasing it.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
ChangeLog:
v1->v2 simplify the patch and update the description.
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index c6b69af..50e8542 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -90,7 +90,10 @@ static void mdp5_plane_reset(struct drm_plane *plane)
 		__drm_atomic_helper_plane_destroy_state(plane->state);
 
 	kfree(to_mdp5_plane_state(plane->state));
+	plane->state = NULL;
 	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return;
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 		mdp5_state->base.zpos = STAGE_BASE;
-- 
