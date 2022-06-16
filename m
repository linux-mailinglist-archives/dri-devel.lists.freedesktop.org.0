Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E8A54DB2B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC7710FFD0;
	Thu, 16 Jun 2022 07:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D310F0E4;
 Thu, 16 Jun 2022 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1655362865; bh=lVrj+B/OXD3/d9PND/gW3vEGIbfEhk331+xQfhE35V8=;
 h=From:To:Cc:Subject:Date;
 b=MoZxhzB9Jey/z0o3o+nSlP1odTpGcs/FHNXrPwVGyUem0dCWcqK5kQAjA1mtFE7AX
 Tpvhv0LO6L5YSLlzbRytAqdRtes/lhnL+Wl129CMn+xWxhD0MLPXssYlaql7ATY5ap
 tmcY2KqVU4GferPyXwAVdE0fu4APHow+jSg0QL1M=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
 id 4223CE7; Thu, 16 Jun 2022 15:01:02 +0800
X-QQ-mid: xmsmtpt1655362862tdbwc04hu
Message-ID: <tencent_C15AFFD9BBB862C56280A415C336F94C3909@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTI/YdeasDRx/1uWuyqlrk9Ifq5WHzvh7sI2nGAjl+B3/H2hZDri
 J1LRkEL9UVgbC8cmB1g6ofcSciDWcsDAYGvmRVAQEqN+PEJ3XXYO0jnivhMda1z34Q4VtocvpknB
 xhTYLtVihrsXPTsHAQxKQYVG9VNy3X3nPddy6D9wwuCRaRB+fxnh76ytujlbSgy6Z0T9mN8FGdx7
 tLP73/0jm6OXULFgQCLxANahstvi2gt1ix8p/Z26au417ARPyBGAEOGL2b7u0qmsHolDGaEZN+kw
 whgmIb6/hkLOn7H27ScGiIFg5w2upZhzDys4qEqRFLOYoDJbiksrGXcOtCFOYvfxkpkjOvj+JZP9
 YOK9dCwI8JIvTikmlpyszHhsg6JXmbYOAf1ANde6BAwL3PgrHL7wc1kf1yYxln+HjoSqE4zevyjx
 DdcxZITBqh3IwiKk6+qIN//Ig7SKaY0gPuGRHC17pRQ+BwQHQvTtq1H5TimMXFfIsS78w/a4taAF
 xXTe/xcHZ6ZyUKwDsZafSkjTQ/CTZOZLL+mzFbeUsI7pPAi5CljR7UIQAbpsQfiewBhK5AQzvbmN
 tWMDGUW0GuCMgCNJqq4dFflxvOkl1LksGagIldR0VZeQzPdPmDjPzgTGEZ/U6bOQD1zN6d0r4oFx
 RkdK4VfTTs8p8KKxI6NbqDE3b3+D566Me2NqCXRu98xHsifHiQkVWanm7ooDo1/DXd1Z1ZyUuakT
 pLF0A9N544btcttTG6B8yvmk3DH2FFB2smp4yNhIznAzckRvkLbF9g4ZO8h8sRhfAfsynjGdoPxl
 3p2hQEsBwXIbijFlltr9uUyhECnhvwzPnj6ldSUtneSmtn7iZKd0o4FGQWLL/11QBsbhHmSfsYhw
 ==
From: 1064094935@qq.com
To: Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau: Fix spelling typo in comments
Date: Thu, 16 Jun 2022 15:01:01 +0800
X-OQ-MSGID: <20220616070101.105308-1-1064094935@qq.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 Ben Skeggs <bskeggs@redhat.com>, k2ci <kernel-bot@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/nouveau/include/nvhw/drf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
index bd0fc41446e2..d6969c0e2f29 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
@@ -190,7 +190,7 @@
 #define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
 #define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
 
-/* Helper for testing against field value in aribtrary object */
+/* Helper for testing against field value in arbitrary object */
 #define DRF_TV_N(X,e,p,o,d,r,  f,cmp,v)                                          \
 	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, (v))
 #define DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
@@ -198,7 +198,7 @@
 #define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
 #define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
 
-/* Helper for testing against field definition in aribtrary object */
+/* Helper for testing against field definition in arbitrary object */
 #define DRF_TD_N(X,e,p,o,d,r,  f,cmp,v)                                                          \
 	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, d##_##r##_##f##_##v)
 #define DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                                          \
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
