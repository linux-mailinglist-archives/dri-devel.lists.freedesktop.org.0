Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42887225886
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284E889FC0;
	Mon, 20 Jul 2020 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1656E286
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 20:03:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o8so18765989wmh.4
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WoXFd0SV1/eqOnBq17jLxZ1E6FRJYzbrzrT0wsL/bTc=;
 b=tQ66ff1lLYZag32k5qkE2SZoAAjv8UkJZhytRTvdENmozmF4WUkJST6u9iOJRFzB5l
 hKTV/0yMr2gZih9mnWD3dr7Q/LVzCjNL7XbDrDaHRfsorJ8ZMCTamOuJZpKdAtYOEfSA
 prMlYUX1w7bm+OUaFr6Fl1jIl723J6oaLAqNWeLps9co51ppFzFX8Tsd9GiXOGf8h2CV
 Yg2hEImkW+NAqLMjXqBt1sqW06ttBcizxlYPWwMCZdQfrNccniGxAJ9UPlbONXpkH/bo
 HQSh2SZxsIPk7my30BMf41vfoHdZZA+DBNd1klWLCXI+8rq1Qd/BXmW2MeYuvkv0qfCM
 htxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WoXFd0SV1/eqOnBq17jLxZ1E6FRJYzbrzrT0wsL/bTc=;
 b=FV0pTtCC4qwacUBhLe18wuMWnLhXDxUZxOqnmZanbVRuELMnDinpQLsIfGx7M02+1W
 dT+LAbZZYWT2+lU5kIw0DUXc3X9ClI842KygmggZYWJLeaB1GzjyGxJ3E5zCKFAadHEw
 uq7TwD3LEKR0Dc5z8KLirVhc+QW81MA1loHQASZjx72oykzooD6K888lcoKInCw5t9MY
 wxg5jbykjb9EHPsfp1De9zqNBYH5GvwzkCRkPmf+noVEMeKzMkfPTp2iSvUdZnhT0XIb
 GDpn8ejgy3SPoSd1vKBWpY7+BWriLXRqvQ2DFPeduibaK0H7el7SSDLkas7RI3smt54l
 PFkg==
X-Gm-Message-State: AOAM532P8QigOrAaxvvBw3k2JQXsN+90jH01viy5FYDwLjh1Dar8s/ka
 nPwNo7hZ8BfpMmkhQGiq/A==
X-Google-Smtp-Source: ABdhPJxsgMlbapRvQL6kbwNdmqeoS3ATi3VifOxmbtRfh2u4yxlMDxYRuBI3wpfEHIRgQ6BxT3goSw==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr15109002wmk.149.1595102631460; 
 Sat, 18 Jul 2020 13:03:51 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 l15sm21073826wro.33.2020.07.18.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 13:03:51 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH 2/5] drm: rockchip: add missing registers for RK3188
Date: Sat, 18 Jul 2020 22:03:20 +0200
Message-Id: <20200718200323.3559-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718200323.3559-1-knaerzche@gmail.com>
References: <20200718200323.3559-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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
Cc: David Airlie <airlied@linux.ie>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds dither_up, dsp_lut_en, data_blank and dsp_data_swap
registers to enable their respective functionality for RK3188's VOP.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b046910129fb..971a6bda7458 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -512,6 +512,10 @@ static const struct vop_common rk3188_common = {
 	.dither_down_en = VOP_REG(RK3188_DSP_CTRL0, 0x1, 11),
 	.dither_down_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 10),
 	.dsp_blank = VOP_REG(RK3188_DSP_CTRL1, 0x3, 24),
+	.dither_up = VOP_REG(RK3188_DSP_CTRL0, 0x1, 9),
+	.dsp_lut_en = VOP_REG(RK3188_SYS_CTRL, 0x1, 28),
+	.data_blank = VOP_REG(RK3188_DSP_CTRL1, 0x1, 25),
+	.dsp_data_swap = VOP_REG(RK3188_DSP_CTRL1, 0x1f, 26),
 };
 
 static const struct vop_win_data rk3188_vop_win_data[] = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
