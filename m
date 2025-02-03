Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538BA25791
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D7B10E499;
	Mon,  3 Feb 2025 10:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/QtydVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EB310E498
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 10:58:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so49854685e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 02:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738580308; x=1739185108; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YU2toixtghG/UIHIgDfi+TrJAb+KbxkNuLjUS/jgDXM=;
 b=b/QtydVI0PW6nP7mnZhaz4NrS/bPOegsLHzbo9qeJVYF/DxGU2pJwa2DcZmAvm3rKq
 saA5cxL/UkfNG5yis2Hx2Ocj8A68ohiVI9ZHaCveBNcvzWuTOhCiC8ito5aHsWsu8+eu
 8gsh6GhGnFaAMqPLyxdBcie884m9x6e1JCpk1Jpj85fEUoe9yG6VfgfCh3ORA6hUH8OD
 omxI6d/AgaT/2fr8hTyEa2dCN3VHtUL2WMm0PIEYRFccWT2X7x7PPiubyTpxI9uu1PUr
 G7PEpUcDZWcVH8aJ6AW8oi66bGMWo33ZACJFH4mxz+IIsoc7ECeBXiePa/Cc6Xwxvlxg
 RL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580308; x=1739185108;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YU2toixtghG/UIHIgDfi+TrJAb+KbxkNuLjUS/jgDXM=;
 b=QeJM3Ig4Q9sOVY+rU5f74+5SXliXUiuwqEnakIZmVI2THzp7yAFqLjOk7wOxh1gGDU
 WvV7vY95RRKKg4MkfB9JS/9ZlmncBJS9ve6nv8IT3yobgCGK/OkNbvBP9g1EuaBsyq+x
 Uf7KU6oPxtAlro/WYk3n2O0A9Qqv4mohsBWsW3m3avQrBVSTJvLClOufmzzGCBHTh7id
 +CMwQqoQ6kCjB2Oz96Kv/tc+9yI4qY+aJcQhnGy5rj7BlkiFrJ9clZR0mDQqjpzIRNjp
 petGwGnz1W7DwtgT0DmCiJT/nyFyVUWkvaczKg9dBCGtF0Q9k2ai6uKf58gUTTq0BFNB
 hCyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/+13o4Chub7K9O+dRv67Dm1Agl2vLRDL2xauoaHsBuqEg5XGWc7KbJsB0tWcDS2wXwTzx+95ykY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdBQ657T2+los4VpKwbVojxTUiKx9NyFX6ytHjpZICJmVQdTRS
 SbUO/lPJSS0RK4I+92S2SM7D1Yb2Zr8Gn+rqahXhvBI3YHy2+YW/xHx+6CenVKE=
X-Gm-Gg: ASbGncs1bFqe+g1eYRe0f16ZR+cki283pPWE8nnyai1Hyo1c+xdDKQZYJWMWPGyXeKS
 DbOxvNaecXOKciTitNdpnPoUtGvxB6nnkRvEriLGrScKvqwaBtstT81C1ft4R0VL4xLQPi+/AOZ
 4C+eLAuQFP1vpeSJowqP/EFulzvwKwj87/gQIls66oh+NZ0EFrae+Yam2Sc2WByAf2tOUFaLsb0
 XyZYPCnKO3VaqFxhsNhq2JyM8KHLMeqqzny9AifsD2xH7zmmQronAlMJ1HRX3JrtwFg8817m/MD
 eV1rlQiuI6IWC70=
X-Google-Smtp-Source: AGHT+IG3sxZoF1BxKwDs6D8yKh85vjYaq2CGCwZLuA4JBiE6X/IAqNanFP9ag+j0VZ8Qqg5mgek9bg==
X-Received: by 2002:a05:600c:35d1:b0:436:1971:2a4 with SMTP id
 5b1f17b1804b1-438dc3cc9f1mr185238805e9.17.1738580307609; 
 Mon, 03 Feb 2025 02:58:27 -0800 (PST)
Received: from [127.0.1.1] ([86.123.96.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c13a0efsm12555083f8f.60.2025.02.03.02.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 02:58:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 03 Feb 2025 12:57:59 +0200
Subject: [PATCH v5 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-drm-dp-msm-add-lttpr-transparent-mode-set-v5-4-c865d0e56d6e@linaro.org>
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
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Jh+EL4p/6JSMFadATMQ/dMawzZEL4l2MOkq/1iyumns=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnoKFIouFywSlDaZiCw4jErWqSRIqEpI3epr4AW
 pUfu6e93kKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ6ChSAAKCRAbX0TJAJUV
 VkinEADM92QE1zN3OdqwoLmwOoyxpCMwh545d6+dM1Jydy6p2+/Kc4BB1xjuxNF1HNo5rtoqH07
 ym9dN4Q2Qq7XF1KIk/3CrsDT4I6xsQyH+dZXcInkRjCUYzr92gP/vw1kR3ZEqKR0MhGKoby+vee
 AMNZ73KL9sbyxqDOSvYlfU64YT+4M3Y0RjyunUFlc8d0B77KoL9D1lf+9S/cf/VIG5xt10eHvCI
 Y/7TVphY3czZAV8pnzwIf8rvKl8ovXxM1wuxLd5rbHSICbG9xkbeuPm9Gk0ayUP21CpdlnMwnrO
 ZgiMbd646uADECWUTsnLP+vy/yGmYdZk+wxCNssoiv8Uwdn5ZBIDrTreTRLOTRfs0yrkWKw+2Rr
 nvsWS9eg48JbmcR2ZEUHO9TK8fTbA7zOnb/X1M9Xm6dTObpCTrH/1WvFKyJHOT+F8lkUhOhWYM5
 FHml27aV+44Peh/GLto6Qzz4d2+f92sCsBH9ywrCKadg7S/0e9kxiYCsVG5CPv74tlxnI1MJTIk
 38joR4PETewNrhxKk1ppq87XoZJCSGrVxk/IZsbYHALamKacJUTrn6kJ91yS/mNIU23LtyOTkdh
 M2PhJ+2wRSHuQtQv19TyrWt+d38PCVc5NM4iGWqb0J4QbPzEgPwhp1xeCLwRcvp1mk/vM6udNFY
 hRWMZsNaZcQlw7w==
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

Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
1.4a specification. As the name suggests, these PHY repeaters are
capable of adjusting their output for link training purposes.

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between these two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

The msm DP driver is currently lacking any handling of LTTPRs.
This means that if at least one LTTPR is found between DPTX and DPRX,
the link training would fail if that LTTPR was not already configured
in transparent mode.

The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
that before link training with the LTTPR is started, the DPTX may place
the LTTPR in non-transparent mode by first switching to transparent mode
and then to non-transparent mode. This operation seems to be needed only
on first link training and doesn't need to be done again until device is
unplugged.

It has been observed on a few X Elite-based platforms which have
such LTTPRs in their board design that the DPTX needs to follow the
procedure described above in order for the link training to be successful.

So add support for reading the LTTPR DPCD caps to figure out the number
of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
at least one such an LTTPR, set its operation mode to transparent mode
first and then to non-transparent, just like the mentioned section of
the specification mandates.

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..1dd8f94e27475ae5b5b25d80f758968e6818f6cc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -367,6 +367,19 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -377,6 +390,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	if (rc)
 		goto end;
 
+	msm_dp_display_lttpr_init(dp);
+
 	msm_dp_link_process_request(dp->link);
 
 	if (!dp->msm_dp_display.is_edp)

-- 
2.34.1

