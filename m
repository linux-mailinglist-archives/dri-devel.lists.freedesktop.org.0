Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930565500B4
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D59D10E338;
	Fri, 17 Jun 2022 23:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995AD10E242
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:24:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s10so6170784ljh.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZ+dOp4Z4kFod4DkYa3/glNVXupx/hzcZ+pGIy9A73g=;
 b=kTPE8xQhlnU+DF0lB6ZBnP2DBaScpH/GKYgCRgU9jdOZhhhjO5q7xfPr468LCdVrmA
 qyghjqWpxUUN/S5+6BHoW3NX2bmMFJJT3/M8osRP333bBU+RkZxhB2JvE/MioL3+daeU
 r/z3mCsnGIyxP0WWS1StHzY7NS4Vkw4Mn01NNKrP/DvTG0RkrCvvOJsXMC5pzqvE9Gzv
 /pPol/JmJeCW+NGmCXEiRGpsM9jrk4XnQj+je9CnNNabemNjd5/Lnvnrw+HlQRPRe03M
 NtkomSaRN0+pc7Tv3m+AkAOFcF6yu2ZrF0w2iYtj4NmSnF83kfK0rh0yVVVOfSuc8f4B
 qecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZ+dOp4Z4kFod4DkYa3/glNVXupx/hzcZ+pGIy9A73g=;
 b=PA0Vu//HA6/7WExQHOpQG3pVoqR0wdd2xnAUtz4R2P8RM3FSP8Mfi4TJCTvGci1lbr
 7AynVxWytmom3p2Ftds7wGv/J43cI76c3YZN7A/jn/fe/488vGkDQWEYsMd6VuW16bnk
 7cdzmUTUP4FHRwkJWqlTHjIe865A154yTJAkMyL+TKALdUvGfV1IMvt4wsKVIXFiKsl2
 7yzHgWeX2ryzCG74tu5D/nK+Lf2Dcmc5qMC4oNkwb5luHoadzJtqT/E/RfyUjBnVYbH8
 yiZv0JmsMkxWVkFzmXoau6RBsporWXW9InsYGaS/k3f/taNsXjQUbpzxq44mx5rqlkyp
 nK4A==
X-Gm-Message-State: AJIora8k6xg/Hf31yopRh4puZXrfha3m5qraoFabJ8QYdJcRURXSPa83
 EPvIKGQHne/n5U2ZpgfSVJe+0Q==
X-Google-Smtp-Source: AGRyM1sN+iG8PVMK7zauSWr0l9ms1QCEcumjsR+hlo6UhXmunHRrJEOs5wRGS3LMnxi0VnSWb4Xywg==
X-Received: by 2002:a2e:875a:0:b0:25a:4307:dd4c with SMTP id
 q26-20020a2e875a000000b0025a4307dd4cmr6091853ljj.32.1655508276960; 
 Fri, 17 Jun 2022 16:24:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:24:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 2/3] drm/msm/dp: rename second dp_display_enable()'s
 argument
Date: Sat, 18 Jun 2022 02:24:33 +0300
Message-Id: <20220617232434.1139950-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To follow up recent changes, rename (and change type of) second
dp_display_enable()'s argument from generic u32 data to bool
force_link_train, which is later passed to dp_ctrl_on_stream().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added patch
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fea610793dc4..96defacc92dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -608,7 +608,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
+static int dp_display_enable(struct dp_display_private *dp, bool force_link_train);
 static int dp_display_disable(struct dp_display_private *dp, u32 data);
 
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
@@ -857,7 +857,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp, bool force_link_train)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -868,7 +868,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	rc = dp_ctrl_on_stream(dp->ctrl, data);
+	rc = dp_ctrl_on_stream(dp->ctrl, force_link_train);
 	if (!rc)
 		dp_display->power_on = true;
 
-- 
2.35.1

