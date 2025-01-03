Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA7A009F0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 14:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433BF10E8B4;
	Fri,  3 Jan 2025 13:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DLQnb3Hp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C089E10E8B3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 13:29:02 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aae81f4fdc4so1934535366b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 05:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735910881; x=1736515681; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=DLQnb3HpTTlz/dnxCtzXsuEjty0eUZL5OEFmiax/o2HuWbsOxmWN8uY0UNijdlcb04
 G5ZMKcj7BL7lLsBMKCBm9w+Y8YtC4KcdW8Z87gkiqps2vhoJ6hXwkDAep0uVfy8311sx
 pPop/EubrxDrNe04d0tj9jDLRU1mHr0yWWLai0J0nNhzuHA6mK85Dhm1N1i0CVAdP7x6
 N4AS+cCKD2GvxSRwEx3TThoZK/w8dOqo0VlEc9Q5D+lwD4WeaAEPuZUw2rKbKbpYTVxh
 4tQizWBpnKpVb3yPbOqOBqxAkry7XKxe6JtrGJIVCWo30XQQsGwcGLXmhGpm1VFTX2pj
 H6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735910881; x=1736515681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ja7AsPHVhh/ztffyEqltS3S3NOI8MWwC75cFS3zUfQ=;
 b=uH4xOixF7MMtGgPVbQ6n2lVrzHs+DpLT/l9CheJMkqU7LKACNDg9UY0KxIeAxZIQnc
 Rzqx/4khwlWUx2P0c6/ipIjpjSWBJ/1h9XFHNlqtH+T6S/mvxmkwKXv9jjlglyVCDct0
 fQImQXlUiM7IlLf3S2lXH1vnrKrTgvbg42esFIfskqYFLVl2D4M3zR1yhtJ3Zu3xIoZ0
 z74zFi+4opwnR0ng8r6mWqYps2seSoUceLifAxRR9h2Khzm/4AF2y/OLk60zyHY4oL/+
 ORv0IVQMqOiQWihsQMD7suInVDHInpgRDE7Sas/yV3WmSqC49daUVMwppkR5ZZas8LjD
 V8UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCCXaRjRqr3EsmsBM5uHoYQ4rkvlNvkXoJR1+AgBDOMvckqxvOO4pb1MXE5plOcbfFZadRTs7bZe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsK1X96VuF2uXYJ1b4VeB7UWfn0DsMOPQJg/sWKGx9Fx69Y/F2
 YHDomzcvQ/wsnHsq331P3igMiOeuJ0GLtWDZor2qQY1jGV1ReyzzTNdPawqmnTNXHtOUAienhVN
 R
X-Gm-Gg: ASbGncv9S36Y/e204yTsB/LiWJ5SzxeYJQOr2hXTUWjCdgb3VJzDlRU27OGL5atlRBJ
 yaW9xskBcLzViZX6bABhYby0DeyZD6C9Oe+azrXYPfVy0yMGAu3BniGdZhqdS78Iv7IVt5YdupV
 PlTmZFavgGUnBk9s9i+VgJ44spGdwZSOO+FwB6qitI40Nk5FJwEydYeGGMT+UcSF73a30/qSO8S
 +ACtF5hnD3f2KdvQg1i4sWZTj9de3SLuXxFy7caB+CJCVlhMByMV1Ee
X-Google-Smtp-Source: AGHT+IHuqDHnHcd3WF9fZflWdy+Epup29qUDvzgDke+6NvPjnNnt0l09UcQvUzjj7ALc15cgq9nQ7g==
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id
 ffacd0b85a97d-38a22405d3emr42892574f8f.58.1735909131268; 
 Fri, 03 Jan 2025 04:58:51 -0800 (PST)
Received: from [127.0.1.1] ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8acadcsm40225591f8f.105.2025.01.03.04.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 04:58:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 03 Jan 2025 14:58:16 +0200
Subject: [PATCH v3 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-2-5c367f4b0763@linaro.org>
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
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1634; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=zSpYhtCfdoGV8lx5sZ6QJCKOEoZaxgqNtvMuGie1uZU=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnd98By7+7V5W8HMUxlKldGyiQrYwuq4jO5Of1X
 B3VQSkyoXKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ3ffAQAKCRAbX0TJAJUV
 VuApD/4qJrXPMuVFlu1Y3C0w2QBGNOwC8Kd1/O1an/dVPfDmHFzp1BN4X5XeV54FXsFUPl7z/Yv
 CLx7tlv9WL2kvIqM/n93QJkE67uOATYU1pcOPkmnQc8HZ+x5JN2QZgyD3saXpcv2UUEzEMlcxY/
 KeZHgN4TKA7G4LZHG79/0tYd26xSR0HgOOpjD+ltQ8LCD9rF6zY4TAgCy3HgzrbQvBG8c++rQRA
 He8crsrdI25Xh1uXL+YuieNyNP6OwxpYfxbUcJNEbmfK66CDf7vHcbM8uyzR6+dq4DHof8D/VRv
 LL7F5L7VHvN5ysvlCRTuEBRaZ+k41TLkkCW2C2QABpXk/NE1Nc6honOz8l0kOnfxuKK6xqg+tgk
 5h39FDZEaMvbkcz2JD/Cu6KfhgNiqMeY/UzReYHNDVoK71OdB2ogBcdujH8tCQAhHoE1t06Civ+
 /x4fsT3oyE6IKfInlIDQq0rpK+4F6eDNwHFBJCCp0lIY6XWmTk1ehHrySv6zH3z2MbUJBNZsKQ2
 GKQO9QF7w9OgfciGKtoKNptEilU9MO/yIyih95mVXG97xYdGt1QwZqD+MjLVoihfhl9SiavHziH
 VbIalr2poTpXTXVQZ67PSqmogwtYx5ba2nwdNhrOm9hu8tu2/sXkpgUb5g86pQo3WI98DUoS2ak
 dzODu9EtTIz9otA==
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
cleaner.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..55691ec44abaa53c84e73358e33df1949bb1e35c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -79,21 +79,8 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 	    !drm_dp_read_lttpr_common_caps(aux, dpcd, outp->dp.lttpr.caps)) {
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
-		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
-
-			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
-				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
-				} else {
-					outp->dp.lttpr.nr = nr;
-				}
-			}
-		}
+		if (!drm_dp_lttpr_init(aux, nr))
+			outp->dp.lttpr.nr = nr;
 	}
 
 	ret = drm_dp_read_dpcd_caps(aux, dpcd);

-- 
2.34.1

