Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F265B5AAB3F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 11:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE7410E7CD;
	Fri,  2 Sep 2022 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3479110E7CA;
 Fri,  2 Sep 2022 09:20:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id mj6so1476736pjb.1;
 Fri, 02 Sep 2022 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=a8efPwvErJ860QXNpCfLYUGMS5ISwEYQYvlbxrsvr0c=;
 b=iRMyjTV5Xvwu1ZcrMmE1BePnVONvT5/Yr6o6sUTziwoh/jMxk2/Qt1Gxj8Fo72vWjq
 6surj65A15WVg+zpUKWtWPQeIWzwvPBDy3XDsszXxGNJf6O4OTyseIMqksSuEleMzFja
 1XBkqignSUZJfreXt4l+l+NpW1/n9ITfjeRC5IDKYDwP/ts39Axj9fhEIoEcCgIomX9u
 eTK9hPU7gGX76BO7FxUbERKtBJHimAzSaxyZqwtsO2ui2tWC1aoHfvy+3la+g8aKYXhz
 CQbMDflgxVDznsbAbGC7GT7NOg+XYpTRzG62NoyQ++GCOe3hs90B+z8BEkkymToQcvQn
 sBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=a8efPwvErJ860QXNpCfLYUGMS5ISwEYQYvlbxrsvr0c=;
 b=8GnangwZAbK8xehDYSMLMyVqPtxatuptoQDZ80+xnIH5l5jfjUgDx0uMYR0RjynFCf
 p9ArYcFJehjtmXPsX5ii0BCK+H/BMUJsGMJmW2v6JVqPsaqRxBU/zJKscrEAulXy4j6X
 4IJnX+jR3DxPU54nbqnUFtspZoRDdYsDzG5aKN+E4RAV4W0v7/39TfwyuQTQ1yZV/3h9
 P5/bpX3afQfXGS9mb4/LBHpiZLOPp+g40IDxi7xcxT3YjA9W1MLtWoCK3zRs6x3YeTrV
 q2Jz7qxwDEzzEReFlXtZ/0ZYczSgnhdkgor24dGzKr6IUPvLGXf08z9605orDdsNJ8Yp
 aLvw==
X-Gm-Message-State: ACgBeo3vnZ/e1aBrcNK+ib/iheJBa4oGLt0av67oHo8imTbXWdHn2zDo
 JMwi/hyEtrm1YxO/IJEYTgg=
X-Google-Smtp-Source: AA6agR7YC6a34aoZQV+vgq2FTvt8NUnTggvVcyC+RIWVPGRbz+Y/temb2uqswu2s3dUivxLdQl8C8Q==
X-Received: by 2002:a17:902:7b95:b0:172:9dc3:6c12 with SMTP id
 w21-20020a1709027b9500b001729dc36c12mr35089322pll.94.1662110433795; 
 Fri, 02 Sep 2022 02:20:33 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 s127-20020a637785000000b00429b6e6c539sm938712pgc.61.2022.09.02.02.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 02:20:33 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.songyi@zte.com.cn
To: joonas.lahtinen@linux.intel.com
Subject: [PATCH linux-next] drm/i915: Remove the unneeded result variables
Date: Fri,  2 Sep 2022 09:20:27 +0000
Message-Id: <20220902092027.320738-1-zhang.songyi@zte.com.cn>
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
Cc: tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>, zhang songyi <zhang.songyi@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Return the mul_u32_fixed16() and div_fixed16() directly instead of
 redundant variables.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/gpu/drm/i915/intel_pm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 210c1f78cc90..a6757ed9081a 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5272,7 +5272,6 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 	       uint_fixed_16_16_t plane_blocks_per_line)
 {
 	u32 wm_intermediate_val;
-	uint_fixed_16_16_t ret;
 
 	if (latency == 0)
 		return FP_16_16_MAX;
@@ -5280,8 +5279,8 @@ skl_wm_method2(u32 pixel_rate, u32 pipe_htotal, u32 latency,
 	wm_intermediate_val = latency * pixel_rate;
 	wm_intermediate_val = DIV_ROUND_UP(wm_intermediate_val,
 					   pipe_htotal * 1000);
-	ret = mul_u32_fixed16(wm_intermediate_val, plane_blocks_per_line);
-	return ret;
+
+	return mul_u32_fixed16(wm_intermediate_val, plane_blocks_per_line);
 }
 
 static uint_fixed_16_16_t
@@ -5290,7 +5289,6 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	u32 pixel_rate;
 	u32 crtc_htotal;
-	uint_fixed_16_16_t linetime_us;
 
 	if (!crtc_state->hw.active)
 		return u32_to_fixed16(0);
@@ -5301,9 +5299,8 @@ intel_get_linetime_us(const struct intel_crtc_state *crtc_state)
 		return u32_to_fixed16(0);
 
 	crtc_htotal = crtc_state->hw.pipe_mode.crtc_htotal;
-	linetime_us = div_fixed16(crtc_htotal * 1000, pixel_rate);
 
-	return linetime_us;
+	return div_fixed16(crtc_htotal * 1000, pixel_rate);
 }
 
 static int
-- 
2.25.1


