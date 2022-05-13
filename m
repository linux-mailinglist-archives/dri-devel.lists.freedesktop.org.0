Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2671526347
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3A210F0BA;
	Fri, 13 May 2022 13:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4E10E59D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:53:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id f2so4541651wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fZe7ZuhkcHkphV8RgWm+aqXThfc6HEs1D3+w7fnW1E=;
 b=c8pvij0fZVSEifHuKb4ntHQFJbaoWeF16rwR0TUUzsGtGA4msQL9RdM3IaImMp0HAJ
 QybhumSZY9ZmpjDfK/fwoZnyzH3wD712NJ8c6u6ePfCDoEDZBz7biWzeFeDbVQFjRqOK
 izQcfAhhn3OGdfF1r1Z5Y3v1DI5xkS7k7cuUNUBvyTtuqDNSjLeVJNZx4KAZeIvO27cg
 zHbge6ihXS69wXl3rGwOcBwzz/jumGXO/LNhxp0A1FqdwCenAty2cAih7XJMp2hu4r4Y
 jocIg7tcpjXOeKeUPLiYGzz78K/M4ZYMC6cDamRbPwOW+Q+NEU7Xt+8lg2+zHdOweNd+
 RQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7fZe7ZuhkcHkphV8RgWm+aqXThfc6HEs1D3+w7fnW1E=;
 b=vaMDmIoeS3pPxdAdOnYvWgARbzFZPm75NLXq4b6zuV2Z5bTOcXkTymoSlB1oMbYzIF
 gyZgxEmT06oDb34R7wtNsuG2/sX1KSF8EDAKfC9uMfN4/OmKNAd7shtySzCrFxjNdsiW
 fStolTeCZk7zFG9KsbPL83Y7oxZgrij0bJRZLxVwAUj+fBwajFfoQrorb/csFkFtTnZ6
 Vyqo3RQj8xwUDt4H7p0EGzbYaJraUoFdDcQgO22YPhToBvmJkBRG9MXWjtZBakDhXMmJ
 WPMyFvO7YS5Fd8R0NPWpL+SU4JrqDSgMGKkG8dYW1m3zQ2ms/Ti57qTsw2umbx6KIOd9
 m4gQ==
X-Gm-Message-State: AOAM530sNIFUkM3QWZM1ErniqTXM57oqzPg7VstgXzoE/BHOZirEj7Vh
 ymbQ5LalDkkV+ayaoSq1NyI=
X-Google-Smtp-Source: ABdhPJy+EwUp69L0cz2uBqQcXBfzCCAdTcl2Tk4p9WOhncRmnlPiaIfBKRewmbH8Fj20a+w1hQxW0w==
X-Received: by 2002:adf:e449:0:b0:20c:d56a:6020 with SMTP id
 t9-20020adfe449000000b0020cd56a6020mr4067091wrm.425.1652450023108; 
 Fri, 13 May 2022 06:53:43 -0700 (PDT)
Received: from localhost (245.218.125.91.dyn.plus.net. [91.125.218.245])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adfa386000000b0020c5253d903sm2161229wrb.79.2022.05.13.06.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 06:53:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH][next] drm/rockchip: Fix spelling mistake "aligened" ->
 "aligned"
Date: Fri, 13 May 2022 14:53:41 +0100
Message-Id: <20220513135341.290289-1-colin.i.king@gmail.com>
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

