Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B090D9B7DF5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37410E8E6;
	Thu, 31 Oct 2024 15:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gVYZuhPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8CF10E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:13:25 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-37d50fad249so738386f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730387604; x=1730992404; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wsxO4tXj5cYVX5ty5sWr+rNFnN2giGJku8uLhfTXghk=;
 b=gVYZuhPNaCjs0H9evhTAgmmWzZsqk91Whwm/IEF+qehk293zvtzuNemTnoXJunyEYU
 o798Wd5PUSJVpyAFs8l/pZfthygEoOcwRtUNOedoKvpXPusJBRMoqMshdkSs+CJkUS2H
 EM8lAiNbxu5ufJRW4OJWjw2ov2IvegRbvIz5+xKPs3tD4WyU2Oqi5f9Ffy2TepWBONkD
 sNdU1UYOj71sgq3zxpuRRLNDyLCx9XXilwE/19p0YgpN4pQazvkn23rFhX1xv3OiuxJR
 iN7thof6ylCcCCaYPLqypbHsxO1D+9ixboMnniDIYQAhc3LG7NPZz+68uo72FKYEaHDG
 upyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730387604; x=1730992404;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsxO4tXj5cYVX5ty5sWr+rNFnN2giGJku8uLhfTXghk=;
 b=fYBTOGR2iF/tCXXQ04WIS8rs9QXtymiTUQMh5UTJcw3ZO9t93rMPrliHsAz1L9m8rv
 i692qx2P7sCGWHRcEbMp6kG6p2U4anfZ7cQ9wOEuoKQYk9LHGuhpiCZILTtgRaqvI2G3
 fZRXxDxIiZXLZup121WShik6anUbTQ/2XhOPmvfKUuXINYzWoRLFGWVw9ZNKdY6PqYta
 0hqroikeZFiMsNe/8NFms1x0vMy9rkc07keYQJkFYBjSvW48vBQxr1mb/oXkU8LpDyS6
 wKsSnMDql6LY/l8lPu2PxjRmigiCXVDR/c2uunm4w6uAoQgMBL3NgIn8fbPnDZkLZw5K
 Spwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnp9ol2V3V81tajFIOhYJpKBDjMlN9qGJHUbObaF6gEu53VZZtdXk9pIvhrjLKIs8wlVXPNf8hRDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4IW9k8CMZj1ulo0fiOJIjo9L5r+z15BnW1r8YYm4QWlFosYOn
 BJMnUXiqJzHpeouSuc6xqnTvN8paDsHCjrfdVC1vO1hwdHZGRTfAoaDc+hgS3u8=
X-Google-Smtp-Source: AGHT+IHmbLeS2jvvSq+XcHXIlfUKhKFp+lBKs4Bd0dZD1Q8Fgqy2HDTwkQq4YF13r1zeXwVZveQWXg==
X-Received: by 2002:a05:6000:1c9:b0:37d:49a1:40c7 with SMTP id
 ffacd0b85a97d-3806115a20bmr13878276f8f.28.1730387603921; 
 Thu, 31 Oct 2024 08:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 08:13:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:48 +0200
Subject: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=qRn/jvW7tE4OUa9xySn5pIJn3QDJPl3Qlp7ZmkluObc=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI55+9EzZOthRgX0FpnvhwBMl9FxxsDYIWqjv0
 XvSV6RJHv6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOefgAKCRAbX0TJAJUV
 VvZiD/45XA56D5YG0qJfIzf5NOwxDGg+R9f/jAazsIdYIb1x2Ob3QzjrmDvDHw0D7VOXJTWaZgA
 H7xLZgZTKPp1JeDPSWDc5oUnbMyiNZG1S9oa+tQ5diDxc7xapCeGNtbgXBz6ZyiKsjXAMn6MHEG
 yLcXzNNFOnwlrGmnYFkzFXwEchDmltJQVGLZhCpG/xSHtuyh8bjnC2QnHJI/kr7kLhHGKdRC0l2
 Xhkfv8pPnbokGW7JEw+40SeY+hxNUJQQywuWy836FkEgcV/4+j9jf6GQX1wS9bTVt1xhjUXGXe2
 YDCcpLkNvnruvFIG/jvcwsta8HMoi7LvKSiF2T4vVdohzqqDaT1e3BQvQTAFYsLlSyr9rPgeBxH
 G8WEtmTrNcP8rv/398u7KypnUsTR2uYPcR/F/fWlsk8brk2a8/AEyORANS3dwMOFlNZ+GXh+TTX
 tLtrYw5fCaV/ufD0oPnv04vsqrnd3dfpi8Cyz1ReCskjlDQEp49RREZ4wAt8BMewluN69ZN2kD3
 vxUELo7KvPdPW3TZ1+zJDXE1cJnChx8AFdCmDDcY6kwbedKV2DTdZ37zuvSL6zgwlVdzEIVwZce
 g0r8aezKvu5Mtlnv1rtcFbtim552XAdvIGM13ljZklYgMVtzhTH79QiE3Vwraw99FTQRCteSUC/
 iER7CQXfL8ValJQ==
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
 drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -107,6 +107,8 @@ struct dp_display_private {
 	struct dp_event event_list[DP_EVENT_Q_MAX];
 	spinlock_t event_lock;
 
+	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
+
 	bool wide_bus_supported;
 
 	struct dp_audio *audio;
@@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	return 0;
 }
 
+static void dp_display_lttpr_init(struct dp_display_private *dp)
+{
+	int lttpr_count;
+
+	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
+					  dp->lttpr_caps))
+		return;
+
+	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
+
+	if (lttpr_count) {
+		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
+
+		if (lttpr_count > 0) {
+			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
+				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
+		}
+	}
+}
+
 static int dp_display_process_hpd_high(struct dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->dp_display.connector;
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 
+	if (!dp->dp_display.is_edp)
+		dp_display_lttpr_init(dp);
+
 	rc = dp_panel_read_sink_caps(dp->panel, connector);
 	if (rc)
 		goto end;

-- 
2.34.1

