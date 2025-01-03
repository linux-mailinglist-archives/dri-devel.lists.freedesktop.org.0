Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91710A009B7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 14:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC910E8A0;
	Fri,  3 Jan 2025 13:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z6SiDZmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188A010E8A0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 13:05:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so138589345e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 05:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735909472; x=1736514272; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=Z6SiDZmF7pHwn8mKMb5L+f3iPuUwiN0IXX1TjIOWYRXrfxnPfwUkIfdxIWgQssbNPK
 2DDfNv8pFzo8rh0j6YNKuM7gFTVxw4H4ZPVEQeWIAfatQ4kr1l1nKNUZaTF4baFkH4XM
 NHnpGn46tfRVrIJv/H98+mx+NJkhpER64zBRwRNOM3kmG8RSdl+pJjeac3ykilCcUvAm
 gVXM17GHJzt3Ro0YcQlGfeOr/H24F2Ny0FUfkDY0Yy8wKdHvJ27iq2ki76GO8T9wg+rL
 XlXRmwMqgCa7FI2bgp5cPefh0h6GwtwivT3Dp1+Il3o57PUwwFvb/G9+u+wdCP2zHvWk
 Tv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735909472; x=1736514272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VITqw/dBrN6Eh2YzRoSLvwchdbQ5DNjyYt5nkHrQ30o=;
 b=NudRev54teNM1Kz66/zqiwpBC50H+cgny2DEbwt7TuGJ40p6OgRSS78jZlVQHwhyLD
 tqee005RUDz1casjuDgzzxO0xu0D/qC6zwFjBGGeLne3VpScgvQ5eZWEUDdO7VFa58lB
 F1dgutU5GTpTQHD+49tepqWx+b9DLvzNc3LTkGdM0acBesYsusAVYdObqVbV9C2HWYp9
 R51kGAxXbgmxqJHXIPUA4KTYJCVPrfNcE10XWKvHXoJkFyfMYIRMLCCu0y91Sk1p7MSs
 1dUFrb95LPXZ+1O1eN1ifQ/tB9oYLPvcF2V7oRpQXSjpsv2kFzhRFIRRoSI9b48SirYP
 xJmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeHq2nizNazJq8rqc4K6XAwS3ab6QLawxe7nf4hnFYN/E3TNI89XZDZyUOtcpzf3tV5aKmI6gX69E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVQVYaW0NiJXD+VI/rRcXJ3U247ZIYB9AwM/HUiujPjHvxBmtq
 A/8pheG7VN65d+74K0CfpEyDOjB/q+LAXpusohaB9nKh1M4n/zxtj4er22Lq2P6Cx20x6IYLenH
 Y
X-Gm-Gg: ASbGncs5/2ekV3MgRaWi4dvE2/hqSQylekdzJUg8MqKSzMTo6kUDkhFixHiclGKPNjt
 /BWgCQA6f1f8P+ZIeG/Pm+oktG/y0voGIc42zLBQ7pAL8lkDGODq79uepsk6S0eFqdP9z28N3Pn
 Gow6VBPcOeofRWcpI3Sc//fgrDaGg+eS5YAI0+PBV4NqG8YNqH72/5Y3E1TI+dbVcS2QkvoAJrg
 IoVSEYgR3HhiNbA6Tsl1zGQdX02cRctDgUAgb2tSf0Xp4+PYyAJ5krL
X-Google-Smtp-Source: AGHT+IGUnpXjnchYmTBFtUQ71LNCqNAU5Q0SOmAgi8sEQyivFL6wDbTXzLedPgyb7rzrtBvhgs98IA==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id
 5b1f17b1804b1-4366854c062mr416478835e9.5.1735909135449; 
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:18 +0200
Subject: [PATCH v3 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-4-5c367f4b0763@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zhRY8lT1G9JeELkZ54ealjEatpcKTP9np6vn+j2kA9w=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98D5vjbEpomMQ8dXV6RVZNIUGfQhGggxggBR
 Qdgu7UHk5eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAwAKCRAbX0TJAJUV
 Voh8D/9SfWx0sZ/dkeV5jYSYWRDoRArPfvo/DRVwDxLshqbRTU8todXxZViuaYxdh0+wz1yC/Tl
 QEgnwoaexcdVCEAq25zErdxGc4DeAW9RvqP/VVsiJug9NL1tl3wpnml4UY6A5JfU7ZB3/JOy9/F
 /ONMwxpcEqk7hKvuddzOaCg1m/haAPzk+i1foSK1pMOcFttgGGASktqORFxgTLVEfYY8cHB4yxM
 dvBYkfyMHeH4AHeDxpk08PfpDC7+kdjNESFHUjBbTQXdkT5tEu/AGxWOoyPQ/T84KwG/0izcapT
 mM2YxbX25qmTlAbYB7G6xo0nZs9IPz1lhpDnv49OF6A0Cji+YOfhvDdQizk4uDXrcS1rwEqNJja
 O82hu9RoIPEiXDGv3rYeLjA/4mkctvac/eWZv3CKxxxadOQfbX46cqUP5ax+8tvgzsY4GDpQ97M
 o0ZNmdt1dc09tsGlamOHx4vapCTX3qSXt9Oj8w0HWezaWJW0MHuDfoH+tZpHYbYZ5+J4i2DExJK
 6igXX5ziVN/sJVwhFYPYRdVp0T3ZkUkCpBTJRBAG/+6uS4hffPzIh+wWpkfNmHMhAatBd10ifQo
 SovAsasDDp0M8XgZ6QSM4qpqr2Z6a0qO6NY0DuXvyC5loIDA2uFCsYWFvBQe8y3+YQAOqdaq5ma
 Xl+1+4xOfJyy7zw==
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

Switching between this two modes is done by the DPTX by issuing
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
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..6ea8245284ab5b6068bfba64f01a960838f577b2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct msm_dp_display_private {
 	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
@@ -367,12 +369,27 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 	return 0;
 }
 
+static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
+{
+	int rc;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(dp->lttpr_caps));
+	if (rc)
+		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	msm_dp_display_lttpr_init(dp);
+
 	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1

