Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66730394B86
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0336C6E141;
	Sat, 29 May 2021 10:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3046F5BC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:06:18 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id h20so5304573ejg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRDj0MZVdTsSCC1Yf3hrs6Pt5+GzbpR4T0o/AaDM1so=;
 b=le92jVWjnEdA6redTACjRiKgL2NgrE87F0JvfHKsxfuifm2jTp16JBup34YX7nDupa
 qWQxUmK1nk8QhbJ6/SebSibILZ94srX5WDvugZRT7DePZBdqw1g8PLrgtov5U1tap8l6
 PjOn4C0xkEBn/nGocm9U+4L0j/wz2XxqNRsS5pH25Hb3FuXvtKbpQ4vlX5AIURE4r3Tc
 tSkAN1LTdKD+GLcDqFVco0ni0pw276ndduPPVqtk/3tMLfZE/qVNJolEM8gPJ4D6vPYX
 dbYCGGCxKA//VzGHTJfKmGQECY0QxKajXc7LUJ3YyM/26QVdP09G8SJPyw6HPjNPoqnV
 IXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRDj0MZVdTsSCC1Yf3hrs6Pt5+GzbpR4T0o/AaDM1so=;
 b=LFvDxrv9QISPjBlXbyjObRnmkeXKoX4iESB5F4EN3M0uD1vp5vloojk2zfYX90f2cr
 IyaJYvzdxyD9K7HWZg6xdWmZu3sbd2Kxlttdp1O3fw+VC4eqU61pKoEPL8xZEM6Ow+Qz
 sJttQ05QCD9L7ThLipbSUjQVJoiI6MBM8OvjGzvBR8Hq8k4acGCNh6lUHnvShXTaNh1n
 NUntM6c70m2Ta8PFXrCwLOdb4gus8BbIQdWoiVDq+4r4qgtQTnTRoMsROII6GwpWpQmJ
 CJGKw1vjtV6rs3ru2z6BpqM6TqL7VsW/QtYNYr55nyzR1pxh7U4HLcKgCBLfa5L3wetJ
 F2mw==
X-Gm-Message-State: AOAM531gF5vlG9GbEsFtb7IFriJvpVxIA4X0hgUt2eeZxZQM38IXA8jP
 9Q0/63hVseKTiSxXpUWwpA==
X-Google-Smtp-Source: ABdhPJzN2bFZQ/fRjfwL+SSSResnIJ4d7NrC0RuT1/aM7rHhN33jSvaMZPlKhuoDcWNeqB7on3W4+g==
X-Received: by 2002:a17:906:4a5a:: with SMTP id
 a26mr9053546ejv.548.1622207176474; 
 Fri, 28 May 2021 06:06:16 -0700 (PDT)
Received: from localhost.localdomain (ip4d17b4b8.dynamic.kabel-deutschland.de.
 [77.23.180.184])
 by smtp.googlemail.com with ESMTPSA id u21sm2322778ejg.50.2021.05.28.06.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:06:16 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3 3/5] drm: rockchip: add missing registers for RK3066
Date: Fri, 28 May 2021 15:05:52 +0200
Message-Id: <20210528130554.72191-4-knaerzche@gmail.com>
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
respective functionality for RK3066's VOP.

While at that also fix .rb_swap and .format registers for all windows,
which have to be set though RK3066_SYS_CTRL1 register.
Also remove .scl from win1: Scaling is only supported on the primary
plane.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---

 Changes in v3:
 - added patch

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 2aa6d937a078..b7c51933729f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -355,8 +355,8 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.nformats = ARRAY_SIZE(formats_win_full),
 	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 0),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 4),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 19),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 4),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 19),
 	.act_info = VOP_REG(RK3066_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN0_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN0_DSP_ST, 0x1fff1fff, 0),
@@ -367,13 +367,12 @@ static const struct vop_win_phy rk3066_win0_data = {
 };
 
 static const struct vop_win_phy rk3066_win1_data = {
-	.scl = &rk3066_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
 	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 1),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 7),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 23),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 7),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 23),
 	.act_info = VOP_REG(RK3066_WIN1_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN1_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN1_DSP_ST, 0x1fff1fff, 0),
@@ -388,8 +387,8 @@ static const struct vop_win_phy rk3066_win2_data = {
 	.nformats = ARRAY_SIZE(formats_win_lite),
 	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 2),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 10),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 27),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 10),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 27),
 	.dsp_info = VOP_REG(RK3066_WIN2_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN2_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3066_WIN2_MST, 0xffffffff, 0),
@@ -414,6 +413,9 @@ static const struct vop_common rk3066_common = {
 	.dither_down_en = VOP_REG(RK3066_DSP_CTRL0, 0x1, 11),
 	.dither_down_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 10),
 	.dsp_blank = VOP_REG(RK3066_DSP_CTRL1, 0x1, 24),
+	.dither_up = VOP_REG(RK3066_DSP_CTRL0, 0x1, 9),
+	.dsp_lut_en = VOP_REG(RK3066_SYS_CTRL1, 0x1, 31),
+	.data_blank = VOP_REG(RK3066_DSP_CTRL1, 0x1, 25),
 };
 
 static const struct vop_win_data rk3066_vop_win_data[] = {
-- 
2.27.0

