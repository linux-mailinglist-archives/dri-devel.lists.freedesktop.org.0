Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F149DA05EF4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8A210E8D0;
	Wed,  8 Jan 2025 14:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sklp7Zpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3176C10E8D0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:40:40 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aaf57c2e0beso1467111066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736347179; x=1736951979; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+jujrpOc62dfLDuJvGTA1l4Fb+UZ4JKp3nDe8a+P2YU=;
 b=Sklp7Zpy/rWpNMXLcUp5ZSp9gMzDA2KKnj8G8CSuc2DJL6cznHMe5pIb12KcqbzXpY
 AZeorzMLGjFzu0XHQSBLKWLbwRn4XbqIOJvcWcY1yEW9B8k3YegZE2DmtiM5o6jEJ3Zr
 lO9Yw51J5OfNZtbvqoUw9aWTEcIy8ojOnlYRmdqiEdR5pRLiI6uEdOfwgvV+ZKq9FqKq
 WSF0Lkk2WgP2f0TxHmVOVYOAFM+0w5ph/NZSz8efcZgNTPBrtQpetAD9nKnp1er4YOTq
 jDSQODifijAuI+utSxauMgH612klQT2xEpbDdltUWmmJAHJtXp7EQU/NhVoyC8slh7Td
 OEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736347179; x=1736951979;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jujrpOc62dfLDuJvGTA1l4Fb+UZ4JKp3nDe8a+P2YU=;
 b=syMkC/g8j+8rcHQ3Bdx5oWny4y9fWBwpZo7f5AVNkY5nph/QK/OWUpkL1G11bA5wCz
 42vOoI/TuDGi9/RWaFbrGO6MP6vlW1WKFdGrd29cISMnUhjd4kIPNG1yyUteRZV8H4uo
 AI51LtRukwNBtQTyAtnaBfaIisp75pBfkL4MihqzHkM11qrTz4QDj4TKjjepncDxF3//
 pQYwjsoMSl4zcnmxszOXVPmjFC909l+H9xQM8V5SRcGD62dZ5gOa/AyGPzWrbec+sgAD
 TE8iTmX9zscd5IfrPjMATj5bQO0IBmhX+U4n5FBDBr24v28k4ZjlFAZHlipYOwFhq2mo
 F+wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZRVZS0lpiE8aWR6lpw7YIbFHhUryCIK+phtIk/duI6JiRwBJaNrRV+Sm4KN6BG1P1XhvCtLccCZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXXecarGzaDvJhr9aK+Efv1XgMjRI53uvN3CVvEDy7dvEJW+Lj
 Pzb15PV0xKdltOsI6AfgbY0LJzZrFjVxcIuuhuwBPF5Ak45SKjt4HRtz8k4Gfi5lijfOKeGzA+t
 z
X-Gm-Gg: ASbGnctqoaML0aah5pPF7nlZ20dUgnxSQ+bqvwD9gf/03paSYoIZprFb2niD+xhgHwO
 RrMq8MeFeGLTYeQB8fwDUJWJTlqfwBfLDC9mFP/H0VfB6bYcT/+JK5Cnh3rW/NXOI0xH3ZQEXNi
 4mlU3mUBV7+j+upwqR3ZSTXD9R6LH9QEJzt8V3dkIH+yA0o/GbUlEeoZ0c/gZq9kwbVEi+aG8qh
 7vwUeG9ewvVGUC8gqYLo+Ha6uqmVk/iCe9VlwQTpP9sDKEUTIxJl6Wy
X-Google-Smtp-Source: AGHT+IGaIDQlqPS504o1O/zyLX5qhdWguSocQGDnOn2wpB8opY97HAItR5eD/SovsojJHKkwgRdW4Q==
X-Received: by 2002:a05:600c:3ca2:b0:434:9499:9e87 with SMTP id
 5b1f17b1804b1-436e26e5159mr21957015e9.25.1736346731434; 
 Wed, 08 Jan 2025 06:32:11 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89e14sm22741445e9.33.2025.01.08.06.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:32:10 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 08 Jan 2025 16:31:46 +0200
Subject: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
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
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3405; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=gGD3sgWWKsWmZCbwj23CZ+mFd/H5NaRSFUP35PwpXX0=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnfoxgHIDfMJj0b2BEuxIl+LhVXL3lTbbVduy2B
 j5EgHydbryJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ36MYAAKCRAbX0TJAJUV
 VpwBD/9NB5RkB8wmNALPhbXeaU3+pvYY4I3FGE8tvFKBNxVnnnGHblZOMbHU6z2WS1s6WVZ3OsI
 ngNMet1tVi0j/SZLy1Wmu1rpEt67TAHUkEQlBQLhRjbNJWsj9lbAkQPR0jlwiDjzWADUqao+wW+
 b09Hrco7d99sYgCTOEikq3DM/MpQf6AWrh/K9KflicTrEQ5b/hg5CC0CN+hwmhj+WBZJKHtt496
 kjyHDSqWmz3a2TbkknzfAV/7nklR8Fm8ip6AZ6cukHbB+CUrXyZTC5MmOH8bSLq9Mg57mdDOOyH
 +Ps2ncVdMh9svTKquhUopu+ydUxMYWrPFcS1UqAAVMpwKBz/jr0F2M+b4VvUhkVZO7enCSE0Rh3
 qfFwchwovWHOXn53ezc0zFGCBQ8419BGTSXd/hw+uFb05HRHwLIPn/Vh0T0LR93LoVFvIZQFTbf
 FsFBUiOKPrsOz0FXc1ZvJscYM3ObR5X6RwgdOYnaFIdgUWV+6OiJ+j6viy56sBIWpVW9yXGu15d
 OAekrCv4810gA0mNxtqKwZhTT4WVCW0tKEuTKXVz3PQ9Bk6Lz13xIplXyVvEhBuFGWYv0YYrtHX
 TQPdQwbtl2PUstj2MygUJkbR4xUtGpBUzLq/ySJNXub3hbCVV61ykWSakKBQC3laYYedTZFDfvb
 HkAeeBmNm2sOaDQ==
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
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

