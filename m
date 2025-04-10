Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399FA84980
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DB710EA03;
	Thu, 10 Apr 2025 16:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ymsib04u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576F210EA03
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:25:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so655220f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744302318; x=1744907118; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wB7GpXUjol0KQ/YbX53LBVb2Ev80ElCPLnkY+8Zk89U=;
 b=ymsib04uqVdV3nzTIpzEMrE2YB17LVwEmqqtBQrKCLMkru9ArQhy+yStufHTNChcLc
 ferN0ViVMMmDMLFn4jpbwSMq50peuNmXTvjRS4sF6Oys+gAz58R99q39g2EXmhhX2THV
 WFOTzmEBOXRf3+Xt7yz5RQrrMSXRehhIDq0GFK9VEioXfs8AGWWl4479rqiLVxtTLI8J
 Vl5n36uYNFQTFZTJC8D3+UYe994NEhrA2WYjX6Ana1+GB/VpPtwyJ1WwE/JsxCrGKvH5
 +mHeIBYqT0YJ2zyRJl5adsY4KQlBnLzbei9aKhX0OhOjIoOdF9lFZCHTEHy0trOyW7zU
 nQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744302318; x=1744907118;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wB7GpXUjol0KQ/YbX53LBVb2Ev80ElCPLnkY+8Zk89U=;
 b=RXR2bToL7t9OdP2L1OUrzmRIe0DPfGEidZ7L71K6TRkfIys5WEnc+Ml/jlHOgfZ3+z
 e5LucbvDCZ7w61e7L0M6WKyG7nKwcrD9SA5FPyaYJpxevn8cEVx5XLEKbdqDXSUFnjpe
 22IPfw76fHaCkzHOQqYPxauYWOfHXPLuul7juJ8yg4FiB8jL7GlSNXWw828hlnxbfwRL
 rdx0O53w3oU1tpx6KbDU9WS46ptA/1K6XPtbonYZEJ1eEfP2iG65M1Vha2j5jq9o0Vle
 nGjsuC8eaYhns+6x2nJKPJrVr8i2vE9fNfcbO+/jH1VPLIKhpg8A04qRG67ltP/QaZ1Y
 TkCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAHBPv89PcpP1arftltFx6pZrj8VONQdLzxr9bnp04YLlTHvTdso143YTinjdli4Xsycnho1FSBk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKUfX3tgM3b/x7Yy/m1X+6C6+VLMY2IcHVT1fBPfos/yHKM4Ci
 VmQljCQWHOGTkv36lXnJTG+okyT7C/PwzMMLGGlZ7budJfKyEKIi5K0khfAz5Z4=
X-Gm-Gg: ASbGncuDZ32Raqe6z6Qn9TRaZrpLfNYdmVSMLN+s/AG/1aV1aGlq1sGL/XYl7glbuE5
 Mm9HWDfyBJXShHxlJTLBYu/VoqXbZjpkYcZlkA9iC6kxhFzODkxx/eUUX22QprDxGtDYf3z0xPC
 c7Ta8yNJBGUPG5+zzHo552UWOoVZFsUr08EXzNxK/nsIVC7JO+KgSZdabuqHIcuZE2Id4ZVjMMp
 zJNhTgKQfU0p2y/BdCLH4PTEm0sevQOHbb1TvvUYLUrgsuQzuDfsEzt0WyctzS187Twh6s5ioT1
 vuCeq/wrLPvcuX/qcJ3y1dOHaWVQP0RjWayBaV8Xdi+oWw==
X-Google-Smtp-Source: AGHT+IFeTZmUdQ2vt1x1tnJcXZclhQ5dTgbaFR30GmeNzwyzvcpuB5z3WB17x7rprpf4keTp6EzbIA==
X-Received: by 2002:a05:6000:2903:b0:391:4999:778b with SMTP id
 ffacd0b85a97d-39d8fd522b7mr2970676f8f.28.1744302317763; 
 Thu, 10 Apr 2025 09:25:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39d89362fd6sm5398648f8f.16.2025.04.10.09.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 09:25:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 19:25:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Imre Deak <imre.deak@intel.com>, Lyude Paul <lyude@redhat.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Abel Vesa <abel.vesa@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/display: dp: delete some dead code
Message-ID: <de03fbc6-ca8d-4d3d-b80f-d1235b2b346f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We re-worked this code a bit in commit af67978ee37e ("drm/display: dp:
use new DCPD access helpers") but there was a little bit of stray
dead code left over.  Clean it up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 57828f2b7b5a..f38b4dc14e1c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3570,7 +3570,6 @@ EXPORT_SYMBOL(drm_dp_pcon_frl_configure_1);
 int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 				u8 frl_type)
 {
-	int ret;
 	u8 buf = max_frl_mask;
 
 	if (frl_type == DP_PCON_FRL_LINK_TRAIN_EXTENDED)
@@ -3579,10 +3578,6 @@ int drm_dp_pcon_frl_configure_2(struct drm_dp_aux *aux, int max_frl_mask,
 		buf &= ~DP_PCON_FRL_LINK_TRAIN_EXTENDED;
 
 	return drm_dp_dpcd_write_byte(aux, DP_PCON_HDMI_LINK_CONFIG_2, buf);
-	if (ret < 0)
-		return ret;
-
-	return 0;
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_configure_2);
 
@@ -4044,7 +4039,7 @@ int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backli
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	ret = drm_edp_backlight_set_level(aux, bl, level);
@@ -4192,7 +4187,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
-- 
2.47.2

