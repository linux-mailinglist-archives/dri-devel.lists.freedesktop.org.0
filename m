Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E022A94D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799286E46D;
	Thu, 23 Jul 2020 07:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126476E06D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 18:14:27 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a1so2342408edt.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8DzSnA+/kDSS5MO4IA6iCFwIhWVFbU1RNSo1HqBPhhE=;
 b=h74/5hAiMInjB9Fh08FXp2jhDwcfejMysp5Tyeezamsue8iNB23OsKWUBXt3A0am1I
 nBcB+8gUGZiVM+0ZthTspcxTVKzsI2CiMMnms+shi3KdJrcrDrMgIxO+aT0hhMmRJFad
 M70iXUs+ZS9QGlP1Uek4npwRV356wYHb2Bdf+hlVb+rwsO/CbS4qsXMSeBwJW9/uAwG7
 g8ChBR4i4ULijJk16piKMt6//vlz9v7LW8fecxk983jDTUNMFk1ytlwkGhEa62Zdlipj
 BH5jReOJYvJpbf9HJvGd/PILO0NpoYP0tI3wnh32qfYXKLnntvmtzPOtbOty08HT5Nsf
 LoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8DzSnA+/kDSS5MO4IA6iCFwIhWVFbU1RNSo1HqBPhhE=;
 b=BybKFE4thRNl+U1sxXP4ZpK4tiKhwc3bnAKax2PaBzpxUeaWFH+/V+p9X3cZEMPe5G
 W0uni0m5A2PxfPYTQpCQSaa08Vevjt0j917Gcxax5+GCJ1HmIEROFA7+4JniL+DAJbN7
 KZzaI2OekQ2CDzOpMEdYcoq/fXLMKM6bTXHDKsH75jaMjxPCTDCzkvGN4JI6Qrl85a4D
 OL/O/ueCMeTcm0xNf8XGORmc5aoajcHnY0aElR0HNNucDIqP1UmysI/lJLRwwVC9fJ62
 +yk8tQQhgE1wNlSyIoakQjy+c7XSfYwp88duap/bc799RDr9Wfl84zdM39lGvEalcUis
 JyTw==
X-Gm-Message-State: AOAM531iNPFWVZi47JKQgHA76NdjLT2jLa8SwZQ424eG+tq9QB8PfkX/
 obv0wClGGffGT4Rb55G2iA==
X-Google-Smtp-Source: ABdhPJwP7oFCOGzbeuXabVgTdjc+lVDGG1HApDtuMAMIV7v5O3m1ikWS1rZCnLDPzEy+7DsURp/2eQ==
X-Received: by 2002:aa7:c4d1:: with SMTP id p17mr680912edr.268.1595441665602; 
 Wed, 22 Jul 2020 11:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:922b:34ff:fe38:6455])
 by smtp.googlemail.com with ESMTPSA id
 x64sm372954edc.95.2020.07.22.11.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 11:14:25 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner=20?= <heiko@sntech.de>
Subject: [PATCH v2 3/5] drm: rockchip: add alpha support for RK3036, RK3066,
 RK3126 and RK3188
Date: Wed, 22 Jul 2020 20:13:30 +0200
Message-Id: <20200722181332.26995-4-knaerzche@gmail.com>
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

With commit 2aae8ed1f390
("drm/rockchip: Add per-pixel alpha support for the PX30 VOP") alpha
support was introduced for PX30's VOP.
RK3036, RK3066, RK3126 and RK3188 VOPs support alpha blending in the
same manner.
With the exception of RK3066 all of them support pre-multiplied alpha.

Lets add these registers to make this work for those VOPs as well.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

Changes in v2:
- rephrase commit message

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index a50877818a86..5a13b4ab77e1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -104,6 +104,9 @@ static const struct vop_win_phy rk3036_win0_data = {
 	.uv_mst = VOP_REG(RK3036_WIN0_CBR_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN0_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3036_WIN0_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 18),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 0),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_phy rk3036_win1_data = {
@@ -119,6 +122,9 @@ static const struct vop_win_phy rk3036_win1_data = {
 	.dsp_st = VOP_REG(RK3036_WIN1_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3036_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN1_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_data rk3036_vop_win_data[] = {
@@ -185,6 +191,9 @@ static const struct vop_win_phy rk3126_win1_data = {
 	.dsp_st = VOP_REG(RK3126_WIN1_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3126_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3036_WIN1_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3036_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3036_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3036_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_data rk3126_vop_win_data[] = {
@@ -364,6 +373,8 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.uv_mst = VOP_REG(RK3066_WIN0_CBR_MST0, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN0_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3066_WIN0_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 21),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 0),
 };
 
 static const struct vop_win_phy rk3066_win1_data = {
@@ -381,6 +392,8 @@ static const struct vop_win_phy rk3066_win1_data = {
 	.uv_mst = VOP_REG(RK3066_WIN1_CBR_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN1_VIR, 0xffff, 0),
 	.uv_vir = VOP_REG(RK3066_WIN1_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 22),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 1),
 };
 
 static const struct vop_win_phy rk3066_win2_data = {
@@ -394,6 +407,8 @@ static const struct vop_win_phy rk3066_win2_data = {
 	.dsp_st = VOP_REG(RK3066_WIN2_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3066_WIN2_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3066_WIN2_VIR, 0xffff, 0),
+	.alpha_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 23),
+	.alpha_en = VOP_REG(RK3066_BLEND_CTRL, 0x1, 2),
 };
 
 static const struct vop_modeset rk3066_modeset = {
@@ -476,6 +491,9 @@ static const struct vop_win_phy rk3188_win0_data = {
 	.yrgb_mst = VOP_REG(RK3188_WIN0_YRGB_MST0, 0xffffffff, 0),
 	.uv_mst = VOP_REG(RK3188_WIN0_CBR_MST0, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3188_WIN_VIR, 0x1fff, 0),
+	.alpha_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 18),
+	.alpha_en = VOP_REG(RK3188_ALPHA_CTRL, 0x1, 0),
+	.alpha_pre_mul = VOP_REG(RK3188_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_win_phy rk3188_win1_data = {
@@ -490,6 +508,9 @@ static const struct vop_win_phy rk3188_win1_data = {
 	.dsp_st = VOP_REG(RK3188_WIN1_DSP_ST, 0x0fff0fff, 0),
 	.yrgb_mst = VOP_REG(RK3188_WIN1_MST, 0xffffffff, 0),
 	.yrgb_vir = VOP_REG(RK3188_WIN_VIR, 0x1fff, 16),
+	.alpha_mode = VOP_REG(RK3188_DSP_CTRL0, 0x1, 19),
+	.alpha_en = VOP_REG(RK3188_ALPHA_CTRL, 0x1, 1),
+	.alpha_pre_mul = VOP_REG(RK3188_DSP_CTRL0, 0x1, 29),
 };
 
 static const struct vop_modeset rk3188_modeset = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
index 6e9fa5815d4d..0b3cd65ba5c1 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
@@ -955,6 +955,7 @@
 #define RK3188_DSP_CTRL0		0x04
 #define RK3188_DSP_CTRL1		0x08
 #define RK3188_INT_STATUS		0x10
+#define RK3188_ALPHA_CTRL		0x14
 #define RK3188_WIN0_YRGB_MST0		0x20
 #define RK3188_WIN0_CBR_MST0		0x24
 #define RK3188_WIN0_YRGB_MST1		0x28
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
