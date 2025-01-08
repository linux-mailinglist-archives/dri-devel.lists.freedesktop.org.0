Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53078A05EF6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B266810E8D2;
	Wed,  8 Jan 2025 14:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QiAfSdIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D96C10E8D2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:40:57 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so309132a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736347196; x=1736951996; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=QiAfSdIWpExhTwKVrxLLgpi4J6aHtwUwy/mBcbyFMJGEbT8geXGghULQfsfYZ6ie/G
 J+cgjdiiMWepBQOZdgcaJ5Fpz7/RAufHTeH9bRKxLVP8P4QLMsttAgHmVhgLojYTslmZ
 +91DOCehnxoUq4bcrEjTuIDpU2ovnphRT53wOaLTduoXfywQcwV5pDCuuL0SNj6Vkozv
 DirmEI/HyhkuHRttKCXUcz3Nlvv+6EjDgZzmY6BI8on3vbqE0krrQF9RDycafPKDs2cK
 Leh22dbq+EWZutS4gNeiA4hHKGfsNXi61H8SxrHcyFmF5+tXPc0OTq9t10nzaSRnfPmU
 hWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736347196; x=1736951996;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rGR892CsW48bbjquxFjsrZJbQNkPKwTMgb7XwAF2pQ=;
 b=IDZf+TVBlDta3Ve0A66/KhD4ZllcBQfWf5SYSPXd1/AHP3twKgnIRRaaTNta2RxwY4
 4rL0HCOvwJqE81gXbk0R1JGZO46yOUInjmcMy3HIYFOM1JFpaUUBGmz8x/mgBYyZx4av
 wQ2+txDDcuKm5ootm/VrqPjij5HN30wMxsaA+ooS+GYKt1y1LwyHtOdf7MHiGWmbS6LV
 5X03ueGC2jBTybrU+9MP/nqQ9QPlzqAP4kH6B10fO1sfsCWDWi/c9puKG70URaIGIC9y
 QD9RX1LFSQc537hKDW6dMz6dW/wambY8sOA52FbjxnKDo9IF/yOy+Tb57MO9GPaPswzp
 r5DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv429nocsYivnljawWl32fAcs6DjpVaBUeg9anUjmsHJSnIGBuGO9B77gmksTYizaQgdYVfj9KfUI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW8hStDpoPT33c4OCZHiW16EP18nkwKBWkgjUCE96V8CmL4CW5
 z1dttBD/VEIntTcD489BBgmrZZMPGiOQ7y3Sihj96139zb6UM9xXfESROG1yOnNO1FVcIuxACfv
 H
X-Gm-Gg: ASbGncvVFnEvNCYaQpgFNJ97Us/9dHUtdEU7N8scbT/zJzVkjuOF7V2eT2vVXZTW2iO
 u5U14jjbfvtVnqYLEDclOA2j6Fiz8Qr25gWwssz9KfUGPfPjYzqzXL+DrhjOVFvjK7g79n3ddBC
 AJz3SU9jZzs0K+A0l0oDOGfSAu6abFGcBeQ45iwTmFURyfGwilmissHTyTKpzF3yQQmoo5UkwA9
 i2eCaMWnxnYobB9Bvw4/SfTe6fldLJHDqreipabTFubcpi248oSKeYO
X-Google-Smtp-Source: AGHT+IHOFNgi43hh97zw23/scdO9rgdvzo4suhicC6urfK1gf1ViwOyw1YHkL1LYT0r9NFeFOfWQ9Q==
X-Received: by 2002:a05:600c:4f15:b0:436:51bb:7a43 with SMTP id
 5b1f17b1804b1-436e26776f7mr25763075e9.5.1736346729387; 
 Wed, 08 Jan 2025 06:32:09 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:45 +0200
Subject: [PATCH v4 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-3-918949bc2e3a@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
In-Reply-To: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxeHNki79B0QYd4mTUlmaS4L+1SJlhYA9Z/v
 A4IDLvBSQeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MXgAKCRAbX0TJAJUV
 VvsXD/oC6cp0EXwMhmMRSeEBz9Zyx8ZcCFWQr/TnVk4AXiXuzPX9TJGnd77Zq+bPTvcfFEkGd9T
 2iCgdfAC12kiMTsTGPfSC4CJw5A6F8fKgAu3Gzm9mhGMIvSEGMUH9ObSxk8aLljgxHjWqJdBfsS
 PnX+z1pwhNwDf7dJMqmeyDCUtaTCAOX2/0aPtGYDaPV9+5xHAUDipJ8/6f+XAbgUKLmisnmVeO/
 x1JN8l4JHYndHJ0UVM5r86iEytn0+7Y/WDSv5faTe9lxmZXBL2vbr+IGwI25/dsCFbueTZxL1ot
 N4uZBzIFRqUMN2eTq2DHF2IKtKoSHsEdDUcrGkmolIL+4B2BIP1mrjrd1N5MbiFtEaHfmFdNkzj
 XNSijG0GamQoUl+OC+VC5AyL3QYvG7X80lZhthpK3Ad4wiXzqJG59so0TeEpx9OWAqs7BTGdF0T
 +wwS6vXDmzqygQrfXuQfY1zatwG0RZHuY4LDJz8U1rs3gb2HUqgxesCwaXK95u4Xcms5qGrr6Qf
 V7UFT8z0OFgZ6jzG++l1+Ud28R6i2GbJgISqMjRqEstLMKA/HPo8db1bIiY6lgiMTj3Qth8kcSA
 lY+oYAQaSCGcqdUVuE4D9b8V/3CL+h7FF4sSgISfB2xfD7eq2XAV43yQ4tc5uPB2BiqR0hqyuPc
 +ZR64oI0/smoEBA==
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

