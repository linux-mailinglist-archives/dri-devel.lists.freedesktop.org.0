Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0544A2578C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EC310E48D;
	Mon,  3 Feb 2025 10:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5AgdLVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D16910E490
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:58:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso2076419f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738580305; x=1739185105; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=f5AgdLVRzNISq1Myj4bK62FImeUeOxSgJIYY9HzL+y5k+rPZY0xgdVaAwGykfSHPR+
 wrck5OwPoxnqMXS+4Pb/OEB8/CUYs8pUy8eO90J1uSdXuQTI0mQtx8PlFFbpmj5AYZO5
 5/7j/jGtmkP/JDifHwMpBQ2il+75NSKKjfuSHV2ST1+Rg/25z8gsF7I8QuRrpKfcoNjd
 h9rncIazZQ7A8hcKQi4lwinFEoSNg94TfjykGFhdkFUPc4BR49PUOJnsGy5f+obKY/5K
 MOZTtYwKvvK8O8+6wqfgezdvccsFI5B/5e9eb98jV96bo0Ju9vX7u2Dw7x9EmxNskP+U
 /rPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580305; x=1739185105;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=MqcqNXHqcE2QIx6yvZryxnlMzckstEhQtOVCId12GKDbVeOxxrg2en/ULnrsZz1XiK
 iXqcRThnUYnUlooxJRUNFkTnK8Jx6dC4p5LajRJxJNPSU+G0Z2emym4ALNYr6IMEiOjd
 JRpzh2p0394cjtHg+wNKzjoAqz+Ve787+4BRXbkmMBb6JaJAQJUQ/xDpK31SOspVDXwQ
 rMqO1Uk+qQT84YM7QiPNR6XiRAwvXfvF9VBtKSGUE6QyZIWpzsyy92zro64y8+dgh364
 bLcH8dv3JQDZ7Kk4xg12nw0s6gFf/1cfXeO8xoNZD6HWcOvP5CJ/Yo+IfU105m9B+dBg
 ewqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTXy2tiGYfiSGP9MdpkcOuCYq3pRsqWXFgE4PvZ8UghMI5cYVfKBlrxlBzGlkumkkak/lZbvkavDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjmJEmqwHd5/BgI8JkUALmereIKrjn65xkZ+a8uhnwBFpPqtvP
 /ELDWFA5XpNzs3gcG7MXnp7Pd161MsHgCS6G5kfBuThDDLXhvweyXkOgA9Vf4oE=
X-Gm-Gg: ASbGnctwdHD9ozjqMfssadMz5IVqbi483LCyrUd+1Dsl8sJ4pJP7cEmtbUBlJFGFs29
 0FApLEuy610SHmrx/UHtGJNUQsuSvklCAb3Q792m4jREzi7lj29T+GMZVAAXoRUmvVJG7oFh0NS
 XI+egqpG88iyfTUE/LnesTlmnuu+K2Iq6BPTcmZzScyclPYNifZRkhlo2Vvave6LS4zxyD6uzH5
 7mIjCe1AqjTaBzguo3t1uhyTqLgUQhrKeKsI8DK59sqQHCSqSSiTF9WVWrDT9AjOsVXO/84CxH/
 OTpnJqnnyis/iyk=
X-Google-Smtp-Source: AGHT+IFSasDqEOzfX51Cb+efM0QKQ3elXk+hBHYXZYdwzgdqIdkhz/Op8fasjqvlbzslKL+ssHNviA==
X-Received: by 2002:a5d:6d0c:0:b0:38a:6929:ff9e with SMTP id
 ffacd0b85a97d-38c51946af3mr15013169f8f.7.1738580305547; 
 Mon, 03 Feb 2025 02:58:25 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:58:25 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:58 +0200
Subject: [PATCH v5 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-3-c865d0e56d6e@linaro.org>
References: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
In-Reply-To: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-0-c865d0e56d6e@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>, 
 Imre Deak <imre.deak@intel.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3093; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=i0gLL9cKFwnwAUFAvwIYOq+eSp8wWGGPgQgjnTN3PKE=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFHEE1x6guj2+EFNZpgvNKSLMm0sxnSo8XDB
 ultsrbwiS6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChRwAKCRAbX0TJAJUV
 VrQMD/9ZbpIZU+o65MtFjC7Lzb0Aw68FMO4/mI5BTwjbk/4A9V72TEg3Npiq8ArwZ1e9Fyb198d
 RlPUg5v1NRguCXwPgx5Im1wTWKo5ntOzsQC+nbzFuWO2alKkcnCBW2+n3Usud9raVxTj2NBpEF8
 b6LICKL7tcGZhhhYewU10Ta1pScIoYnrjGsoxl3IaK322mXuf8sQNGF486p60IVHeEfwY9h040/
 /f/I+wt3ADnPQtjxGwMjQxCqi+Fjk259rhIpwn5Dwid3++ZMX1mjk1DxyBU7i/6NKM/38oAyoS0
 /iubtZbC6+ssuxcFdu0TN2ideAZLCIB+bGzDdlyTqXvZAmrNfvnerEo4Dpom9Tg65ql71KMXMw0
 9xbPF1r2shnWKqNDR7ZCzSeTdJnn+ManTv/kZUwWxEW1dW6SUqXrrbuGhmkb1L3rgxPKQFyCqcG
 H1LLJdtpczf/yH8tmyWmlpAbBp9jE5sTdj601fsf2E71Q8twQmlEVM3MTjypO0bcdZy8f81lAa6
 fPR7nWGWLeOCNpJK/9rSxzxRIc/d8UVY7YVw/PQq0M6HiDHH4khXZvTz/7IkAzDfZmeuPD1NDPq
 RKPceFqsfbHAKpJVzM+S5SQZ5sw9tn+VtmquzckpoJuocNO0LK6mGnOZFpVCLQITKBVS65LEn/v
 za3N8+9CZVBz7Rg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them, which
is handling the explicit disabling of non-transparent mode and its
disable->enable sequence mentioned in the DP Standard v2.0 section
3.6.6.1.

So use the new drm generic helper instead as it makes the code a bit
cleaner. Since the driver specific implementation holds the
lttrp_common_caps, if the call to the drm generic helper fails, the
lttrp_common_caps need to be updated as the helper has already rolled
back to transparent mode.

Acked-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
 	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
 			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
 
-	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
-		return false;
-
 	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
 				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
 
@@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
 static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 {
 	int lttpr_count;
+	int ret;
 
 	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
 		return 0;
@@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		return lttpr_count;
 	}
 
-	/*
-	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
-	 * non-transparent mode and the disable->enable non-transparent mode
-	 * sequence.
-	 */
-	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
-
-	/*
-	 * In case of unsupported number of LTTPRs or failing to switch to
-	 * non-transparent mode fall-back to transparent link training mode,
-	 * still taking into account any LTTPR common lane- rate/count limits.
-	 */
-	if (lttpr_count < 0)
-		goto out_reset_lttpr_count;
-
-	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
+	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
+	if (ret) {
 		lt_dbg(intel_dp, DP_PHY_DPRX,
 		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
 
@@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
 		goto out_reset_lttpr_count;
 	}
 
+	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
+
 	return lttpr_count;
 
 out_reset_lttpr_count:

-- 
2.34.1

