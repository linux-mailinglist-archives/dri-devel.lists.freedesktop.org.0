Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55E394B8A
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0556E174;
	Sat, 29 May 2021 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65E86F5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:16 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id jt22so5247467ejb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HCinzeYxY1ACn5rVFsalymDNpiU4s0UULJ02Uf8Q/Xg=;
 b=fZyN+lO4LFqwFoO/0z3KNjFxtMLxQzWT8zoJyQ7UJJup0gRGyBHAsep+UMq5f4nWyc
 0dp/kp10b0V7xAJFvPPLIO1dEti3HqArWKb/SZjPk4YqBwM2hTL6l5Ve5ptRtAng3zQE
 NN6cKmdmx/aOBVkXGJuxBRbsj/VBxffvNjhIhChQSMVXTN978VZqmTDXOqBhn0EOStkZ
 mJb56Mn7hS1E3IwqB22Nn9zm4hH6SAPO5xfaDFcprAnzYYd8unjZ5AWA0HHMukiyM7DZ
 FmBYvtR+wE/lHOm5Iym4enQmYTGcKS4A7Ze4u4IQW1kDyOL/lcndOEV7P2go2GNDIm4W
 /pXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCinzeYxY1ACn5rVFsalymDNpiU4s0UULJ02Uf8Q/Xg=;
 b=nUTwz+k3/bZaoOBmy5aOh69TR77wnZmYSzJcTSTQL5tvjo0FgRrqF+BH7NPvKbhjwx
 Z2N4tZGxsiNjk0r2IVYdgLqgESnXFIl6jNrNjkOVJEqSJhqp1Sg5XCXfZgqfYEP+Bg5e
 kV1bGsQS6PoBY6GakyXZ59YLI4N1psBeNqx8sieLFRw+S9FZnZgwdttHKsc+HXXVh+x0
 QqULwMpJUtfk8k1hK3HIq9dCrGOP+EnQg2zxOPMPY752kgkWLkRnXkfBF/2WMIfXljMG
 NwNBfCR9NKwyLkYXVGWZtd1iEsx55brMVKPsYwSWWsq0CrDkbYpnUkeruUjeNdkMTR60
 R5GQ==
X-Gm-Message-State: AOAM532HvRg5wyJv87EkqxYc9DR54xdIfZt8nCitwdSjcYCB7Y0y3Qa/
 CM4owcCCunVIih4Ekr83WQ==
X-Google-Smtp-Source: ABdhPJxTQMDcAVUJtuWxOiFDEOTvOyxEsGOfb0YMDTG/HlvUeVbiyINIs4BEhRPMAergrBzosF8RKw==
X-Received: by 2002:a17:907:37b:: with SMTP id
 rs27mr9151356ejb.287.1622207175489; 
 Fri, 28 May 2021 06:06:15 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:15 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 2/5] drm: rockchip: add missing registers for RK3188
Date: Fri, 28 May 2021 15:05:51 +0200
Message-Id: <20210528130554.72191-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210528130554.72191-1-knaerzche@gmail.com>
References: <20210528130554.72191-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dither_up, dsp_lut_en and data_blank registers to enable their
respective functionality for RK3188's VOP.
While at that also fix .dsp_blank register which is (only) set with
BIT24 (same as RK3066)

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v2:
 - drop the not yet upstreamed dsp_data_swap and rephrase the commit
   message according

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b046910129fb..2aa6d937a078 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -511,7 +511,10 @@ static const struct vop_common rk3188_common = {
 	.dither_down_sel = VOP_REG(RK3188_DSP_CTRL0, 0x1, 27),
 	.dither_down_en = VOP_REG(RK3188_DSP_CTRL0, 0x1, 11),
 	.dither_down_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 10),
-	.dsp_blank = VOP_REG(RK3188_DSP_CTRL1, 0x3, 24),
+	.dsp_blank = VOP_REG(RK3188_DSP_CTRL1, 0x1, 24),
+	.dither_up = VOP_REG(RK3188_DSP_CTRL0, 0x1, 9),
+	.dsp_lut_en = VOP_REG(RK3188_SYS_CTRL, 0x1, 28),
+	.data_blank = VOP_REG(RK3188_DSP_CTRL1, 0x1, 25),
 };
 
 static const struct vop_win_data rk3188_vop_win_data[] = {
-- 
2.27.0

