Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C922A93D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDBB8969E;
	Thu, 23 Jul 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34356E067
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:14:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h28so2380616edz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RThPcly/jHnmJGOhuBZQDBDLJozqCS4adNNhKvYM4Mg=;
 b=B3tIpl7TcVNNRXBuZlga8XftggXq7bERUxzV260Fo9X43VhGO6VZRdWcUPOlTFHvd7
 kSpw3npLSuA0SyJ6bVVhduLTwnPqeCeeuUTd6D7nSJc1D8dLD6s6oaurlHq9DLPsYxzM
 atOy5pKERBUqD9sKNa2ypB5dD0j1YWxJu/Wr4Nm2MrW+TA7FFfLbPB0Z/R1SjZYn7wC5
 sfskxZ4FDUo/OKrA/xXnxd4nL45smGcElGi8Oz9QF39Hr7zTaygaaVaa1ZM39uGRH+j4
 Pj7mx4q5aXWt08ecF6UURZodhiL46pXRCYbFx+B9p987RWuhrAzj2ZjIeOtsU+GpBx0A
 PZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RThPcly/jHnmJGOhuBZQDBDLJozqCS4adNNhKvYM4Mg=;
 b=tr8LAS8AV0TB3U9q52homPADovoaAeYxjaD41w4YE539/SFBWT3bmF2dYf7CptOg0z
 GEprK1KhSQZYB38oKrfbJeyVSsHkFQIKEMgIcMQt6V8NoZLwQHabn+dNHZHvg5WqilMn
 NJx20cR5Nk0tgjl8uR+FDnfyxxuQHFCGCAduaPQ4axhH/PRoCblH500wkZ2jPE4W5eO8
 FRTnG1kHsrk/PmAhjApCnnuY89NwnH7vD8So02nja1i6rypOBcaHv2uadiTGhBquJstx
 xaOP3Mav7MUsK3bciy8vbh4TLP8vEO2XEzmMtbTTJ3dISC7J1JpzDJyrACY+rdE7TBCU
 M99g==
X-Gm-Message-State: AOAM531u+xtIPjLUz/rv9qSQaLXEfy9NefY07Mbfiy9Sg10rrD3ubov3
 yzwZsxVg+Woy8WIJGl47GJ31DXhK3Q==
X-Google-Smtp-Source: ABdhPJw92ztJ/Nw8og4fgLjKEfKRszbcX6/RXPzIu2YBLzTwtDy6VFd45FxJ1Z76COkY76NtNEZ5JA==
X-Received: by 2002:a05:6402:1c10:: with SMTP id
 ck16mr738438edb.72.1595441659181; 
 Wed, 22 Jul 2020 11:14:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:14:18 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 2/5] drm: rockchip: add missing registers for RK3188
Date: Wed, 22 Jul 2020 20:13:29 +0200
Message-Id: <20200722181332.26995-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722181332.26995-1-knaerzche@gmail.com>
References: <20200722181332.26995-1-knaerzche@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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

Add dither_up, dsp_lut_en and data_blank registers to enable their
respective functionality for RK3188's VOP.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

Changes in v2:
- drop the not yet upstreamed dsp_data_swap and rephrase the commit
  message according

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b046910129fb..a50877818a86 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -512,6 +512,9 @@ static const struct vop_common rk3188_common = {
 	.dither_down_en = VOP_REG(RK3188_DSP_CTRL0, 0x1, 11),
 	.dither_down_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 10),
 	.dsp_blank = VOP_REG(RK3188_DSP_CTRL1, 0x3, 24),
+	.dither_up = VOP_REG(RK3188_DSP_CTRL0, 0x1, 9),
+	.dsp_lut_en = VOP_REG(RK3188_SYS_CTRL, 0x1, 28),
+	.data_blank = VOP_REG(RK3188_DSP_CTRL1, 0x1, 25),
 };
 
 static const struct vop_win_data rk3188_vop_win_data[] = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
