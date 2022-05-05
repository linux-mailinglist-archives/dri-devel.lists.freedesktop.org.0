Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE751BDC3
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BCF10F92A;
	Thu,  5 May 2022 11:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DED10F92A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:10:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p189so2420787wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fZe7ZuhkcHkphV8RgWm+aqXThfc6HEs1D3+w7fnW1E=;
 b=SF6NsgMh/aI7dxvNSm4J0F8dduL8PgQFBddrpPStEMC88whboFowO6an+39Xec59dR
 cialT9GTdpTTBlnhpUM3FJSMNcMenDRq9vxT4AhKLE3FnWOfGvhKUzv0XPRX4S9unHyq
 SJn01UIX7/0ppvj+tlyfSojkTUi5skbGGPe9dk8NaZoZdBQX9dYZ530f4HegVXm4Qjce
 4WoZ0Qoa/0mHf/bMvlgoA1/dkJSg9rWKe90SPua56pGHGvs7cDaJzGPwL7fBTageCK/X
 GnR+nS2Nf9KkS2HbQuhuIIJb9/NIPZKcM9hVS65VZ5Z+yNCJMxuXjicKlW+QD0DVUUP3
 RmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fZe7ZuhkcHkphV8RgWm+aqXThfc6HEs1D3+w7fnW1E=;
 b=Ku4CJVV0VeZQQIZp7um6f/VcEHlTNhOS3YUtX6dRYGyVNThUc1UEEdVKU88hwd8zbh
 uCwIyIdoyjdh3hqN5nLvAPzTSSfwRr6pB+qHJ7Y+fBdXvb1V+k0pVIKNV/oPq6CPdp8L
 07wmJDenhLHRsLda7KWn6DFBO5JkprT6/yXfQlIcNHSEfoObkVrhLMjqWkO3w8SCLgYp
 2SvDOhsDZMBa5JHgFXJl9DcxzaRZZL71A8/FviLhWdi92KfS3RJYn63yoMKCQNlte6K1
 LE/075AlGR93gG9BcYzx1UU4kQ/Oh8Q9ksg+5mOHWk2+bLDr4VurReX7Wc/oN3AyuKXe
 rsdQ==
X-Gm-Message-State: AOAM531th405n9vIwyGfNoIDF8WUQAM70xv9Pyn+HBnJirRpU5evxNyN
 KCLbpZu81gB2ybwkQjo7Rkg=
X-Google-Smtp-Source: ABdhPJx/+pEPKFamTmmbN/plSGNtO72hEEKl6yTB7HoNEk+TwL9rhZ7ovl3RzseVO64gCmaWJwIfCg==
X-Received: by 2002:a05:600c:2045:b0:394:2457:9c36 with SMTP id
 p5-20020a05600c204500b0039424579c36mr4002675wmg.76.1651749045827; 
 Thu, 05 May 2022 04:10:45 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 z7-20020a5d4d07000000b0020c5253d920sm1122934wrt.108.2022.05.05.04.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 04:10:45 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH][next] drm/rockchip: Fix spelling mistake "aligened" ->
 "aligned"
Date: Thu,  5 May 2022 12:10:44 +0100
Message-Id: <20220505111044.374174-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a drm_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0b49fed16535..04e8e22a8640 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1202,7 +1202,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 */
 		stride = (fb->pitches[0] << 3) / bpp;
 		if ((stride & 0x3f) && (xmirror || rotate_90 || rotate_270))
-			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligened\n",
+			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
 				vp->id, win->data->name, stride);
 
 		rb_swap = vop2_afbc_rb_swap(fb->format->format);
-- 
2.35.1

