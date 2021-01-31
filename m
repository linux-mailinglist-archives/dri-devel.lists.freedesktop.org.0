Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78130A30D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0883B6E434;
	Mon,  1 Feb 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548F26E2DE
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 12:51:22 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c6so15756295ede.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 04:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Fjrhs7HTb3KAOHD/Z4OsRiZR3fTTDer1xRtVh5uEzQQ=;
 b=mggdTO+OzSrMYTeeVpTG18ltZSkuUAgNUjWRpyNavueifr3EL59jk3fHyG9b5MsMze
 ad8BHI0O2eNoZY97JPbZ1QHjYDxOXDfc0Jt239VSK3FX5ZnmaZZHpHOJmFQjSbsxjrcM
 EQFgUhi6D24LVeGlH2+65JujeTPiJ2tO6u+UKnOGCjociHuocF6Jg1lQZlju6V4Y4hKQ
 Qj3D8U930n43hN2SaK/S6T8jBrHsWPs4uSNHaL9ZTNbjR6NZP+NvO9qB64aQnZMESzb+
 W9RI+8p/GXntTFwJV6saoi+FK5gCYRPq3E2th+r2C8lO1DbiXVrfzBGlFvGyH/92YwYV
 84aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fjrhs7HTb3KAOHD/Z4OsRiZR3fTTDer1xRtVh5uEzQQ=;
 b=AyEStl1JybyXwFXOPpgjGKpjkEMTEfIHvCnsliA1ZOcKFj1/4zRGxwLSsER0WwlSNn
 GTVhPknIwQ1E7cjzRkmmhhHdBbcBQtnhFu6GXia47yCg+Df2rhNH65xQlXB8lYm01Q/V
 0Ls1rhQDr4rNWdDO/vE+eKZ5+TyLG5Afj2HdhazZraT9YGzu8S6FMftanFeKZ7KDE1iA
 o3ig+Rf6R2hgSO/4lmCXczTmMDNc83fHBCw2Ft04/Tf5Mduxnvo3INfFWMQ3XY5ppHuf
 jziN7oHzXoKt3BKqCcKS3/BLFTHdJfqADsll8W6rP8F8Tgv4R8bXS9AqHLZc6dOD495/
 BeHQ==
X-Gm-Message-State: AOAM532oZP/scX6KJOzIaeXzYUR8Su6rUp+NBm32hcDDt+RWpZn2uOiK
 TU2qQX6RwA4GFpT0+vkMmhyTpwJ6Rpo=
X-Google-Smtp-Source: ABdhPJyIMzfAVupXZdw07J+8FbSpRt9OxCqtZKCXvj20Dih48GzJhmB94RAfPNXYaiSCctESwwkr0w==
X-Received: by 2002:a05:6402:1b11:: with SMTP id
 by17mr13753486edb.373.1612097481028; 
 Sun, 31 Jan 2021 04:51:21 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id i15sm6552820ejj.28.2021.01.31.04.51.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:51:20 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [RFC PATCH] drm/rockchip: vop_reg: add rk3036 hdmi support
Date: Sun, 31 Jan 2021 13:51:14 +0100
Message-Id: <20210131125114.10885-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:06 +0000
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A Rockchip Inno HDMI driver was added, but the rk3036
VOP regs with HDMI support in the manufacturer tree never
made it to the mainline kernel.
This patch adds only hdmi_en and hdmi_dclk_pol.
The inno hdmi driver must set hdmi_pin_pol in
GRF_SOC_CON2.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
Not tested with hardware
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 0697057e7..c164690a1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -147,6 +147,8 @@ static const struct vop_modeset rk3036_modeset = {
 
 static const struct vop_output rk3036_output = {
 	.pin_pol = VOP_REG(RK3036_DSP_CTRL0, 0xf, 4),
+	.hdmi_en = VOP_REG(RK3036_AXI_BUS_CTRL, 0x1, 22),
+	.hdmi_dclk_pol = VOP_REG(RK3036_AXI_BUS_CTRL, 0x1, 23),
 };
 
 static const struct vop_common rk3036_common = {
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
