Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC89ECCC5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 14:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0525C10EB4D;
	Wed, 11 Dec 2024 13:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PHQ61rZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5810EB4D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 13:04:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso71382995e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 05:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733922277; x=1734527077; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=28bZGkoWiLyO5A4XpJ79KUw0LbLMW2C62tX+fuihWns=;
 b=PHQ61rZlId43KcXV5ucHLEzmupxL0Um8FXEo0sTRaoNrlrD+9cIhgI91oxflysmPh5
 gE+vTYH0hwrbJyhw8/BdpoAc4RqwbYJvL1/et/RnH9/TTtCOO79yKx8kxgCVgTA7iH5C
 HpSPy2aXgCZwYa1R8cDEzT0U5sZPIfDk/I+Q11wVDjNyWOrjBzGCVUaYhqCeH7WTr+uQ
 XbJHu6k35sv+gm3AFuZEI8hu9kfrZ+9hc41D1QG4mfSkgM58zekcbHQwhxR8bPu1RzUN
 uUJUBIQqUxKw0qCEx8mU2upRjf9cnKoRJi3qL18Qh6ZPhlyJLFKt4QKrTZu0iJu4ULyU
 Ekuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733922277; x=1734527077;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28bZGkoWiLyO5A4XpJ79KUw0LbLMW2C62tX+fuihWns=;
 b=LFDO+E1LweG3pEtw6xihW/o906wB/JTeFeKDMjscuhya2MDif11YspHiq1kVucPUJ+
 WWEwnwhdjdokszBi7Xy5YZd7+Tu3+heJyzhxsrDuaxzrUb8MjrfkCtuydw0gIR5+jujE
 MzIdenxKn4dFzSyRB4dRac87uKt9X8aFEmcIqKNsrq0LF29YB51kPDjPscaK6wLLwKl+
 LwMYIuWZ0IAiIERuINU6DqHLttthYjBUb4NqERL+TLNTvLHs3BQCEHJ7wj91CtEK/hny
 dsXsgP3ba4oUgKcfE5RI4AVegFh8yiOHyHU3Wl/VMOWl3UYqkaeu9oOg4AoLVUSHUSAe
 /6yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt6Uosc18TnSfBw1Iz7N9RLtWwdmJ2v9Bh66Kce91tSmogm8mCI6VMzPx00HSTDsQIVK7tReJsdkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzobiJuHc+q9MDXS4j1Cf8482QTmYfN+rYox2YGtwmgg/ScVq6
 LG+D/fHFbscVDdv+NhgVdlQ/eBZN6WaErzv06TSr+r9cinTYonR88KYXbCcjnBU=
X-Gm-Gg: ASbGnctbjC7EpEQxBRxWgcoRT3ojHZOoZJqpNqs/61XyUIIlGrNSBa61L3dpbG9Nrdu
 qrONaucdBOGuYDOMOWB6fJ2hPqnbFloTVRGdzyZKGdIUFC3WycBvD3TuwGcIbd+LhXD40SpuVjc
 o6N0npLiDLxZMU721ibiPaVVpbVUL9pZ+beYVfTAu51iyEygp+wPVH3+w4RIXwGfVE3omXG7csh
 dCHejwocTd2+DqRI6AU71GXS9hjxhDlKvPPc+/BK/+tWFbxD6iRIw==
X-Google-Smtp-Source: AGHT+IFZXSfLm1b/QrF6/gmf0rL4rQkDB8lDObG2xoYYrC2PbfvXR4plcwl4l0GsTbAHftPRAcd2vQ==
X-Received: by 2002:a05:600c:3b9b:b0:434:fa61:fdfb with SMTP id
 5b1f17b1804b1-4361c3c6dd9mr21544895e9.18.1733922276963; 
 Wed, 11 Dec 2024 05:04:36 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 05:04:36 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:15 +0200
Subject: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3196; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=yJyF2pRWoU6DoNOFceA6M5EvvSsiRr5WvZMjlqLU/hw=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3ZmjK9nP2mI5vRrJF2OoY0F6I9GZVuOIkuE
 U9JJNJfAXOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN2QAKCRAbX0TJAJUV
 VqA/EAC5MeQnOtUM3E6JKASMby2RnxPkjX1cJM9tj9E1A01ZNC8qGF4pIjpJImpXaSxPWi2XB1O
 10dxLgkhDegiDtFYJ2Z1U/fL+hi2prXQccQUrALOPl9VBvg/lqLGigcJNcj51MikceOQOifC9la
 Cpwn9N4Qss+kTr1IlOz0KjGeIqZpGT4+EoA8Ti2Ity8TVRneorf7FXdbwmeawO1SXX15W32DI/e
 C4+4xVdQmeE3Aq/rZXCxHnHNhqv2K2EYqwebsVbhbjAEg2yIRK8BD++k8a9cnROEZ2HTd80wCok
 QWUbs1jiNHeznKyDQKUe3nb4hAXGisDXjL467VuiimNUnZ3ZEvhzmwYJGxA30qmrvf75NPeEW6m
 gUKlIQHk/YmyYiT6a8Rw9Ja5DQjvRKdjE1vyr0dzZqhIW5969Qo+fvSZySqymcTrv0HX/Gy+Frs
 x7KogH+1zd8Q5ubpPrTpvv/2Ntxetgey1kr9o+WhfBvDz8lEenqhy4voXOTrDmZlwQBbUkApbRD
 e5u52Wm0mfFYYv/klst3rYRyHusbQ/a8A7uuLRoGnHU5yjlwOiBXNgpVw20k5AXuSzcdyyZqfoD
 g8iFwlwnWlptrdtgsQ21zXF7Mj65ksD9pukcnrM+e3e7uJe/bHgFFkY8yQ5YjJ/FvJiVzQEkNWc
 g9ko+QTKP4o5Khw==
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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aff51bb973ebe0835c96420d16547ebae0c6c0f2..a8d5563538bbcd83cf88a159dc86080e2c897fe1 100644
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
+	int lttpr_count;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
+
+	drm_dp_lttpr_init(dp->aux, lttpr_count);
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

