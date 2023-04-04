Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88EA6D625C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 15:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F58A10E679;
	Tue,  4 Apr 2023 13:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048610E6AE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:39 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 20so33790750lju.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTrfxNS455dyhbBxBU85MaGVZ2L6Sx4keDpYm3AdwYE=;
 b=ZBUZAzw7m/XyaBI0Bwj+r9D2as1jOWlsdQ2Neb45+YE3cpR6jxBnelJRThh1hjJHQM
 0jrlkS++CPU9FUnmd4+T3TqISBgRql48S8Vm/TBAvsGhbyoRbD2DpPT8K2b6fqO3FyPv
 6wZZOgSogOqk8fp2+5a4lrO++YTR+sBLay7EU7WK8JMSMlbXh961HvZiXDkMv+K1fIAL
 CYVF4Rgu6PihiFeftxqSQC4Oc24kXqYMNSj0GUHRHab7FJmvhyGGxEUVR8wLZry4Jkmf
 aI+ZNiTCK5+lwmUDAyEE3gvH935A1A7TpN9DWwu54dqGPSd9PytNUsdfku8AH5EiW1kk
 l6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTrfxNS455dyhbBxBU85MaGVZ2L6Sx4keDpYm3AdwYE=;
 b=NhjvlNNN7AO5/RgoQqe+N0my5nZeLbgfDZuSQtJA80yw0Nxf2EZgGLeyHgKu1YTUYv
 EPS6F/XbH+An6OjEK1uLxPJq9+MtKVlyeYMI+2VbY28ScYeR+aJ29xF6weh22oPoNKLx
 M2xno3hB4m47ifWdKae6xY/vJYaET3q++BzMzN8bV6+AhxQyZEUiStkp2vDavvJ8F+Sx
 v3135qXAyoIOLakhZ6E9DD3XqENK/yVgUpTHn9llF7uBddwPAoF2FeQXtpq5YCa+WaPf
 iR5xScTYpp5KvDcV+pEw3GOdiosdCukC8+uXXGL5eLMJedrv3WyMTaOQEBq7sm6mlHfn
 jCkg==
X-Gm-Message-State: AAQBX9cQ17nuD/xaiFUgQX89sxc/iESFZBNPKrmVVwFEkSfu9ddk/lFo
 tw2joHk5ssSqXOAKNs2UwtOSaA==
X-Google-Smtp-Source: AKy350a7n4/e88rPnh82kJvKZUEi+JNqmkei7MqljI3BN2fuSHccLWPazfhL/sUDbHb97daH1EwOPw==
X-Received: by 2002:a2e:8005:0:b0:2a6:1e50:ba42 with SMTP id
 j5-20020a2e8005000000b002a61e50ba42mr849797ljg.48.1680613779312; 
 Tue, 04 Apr 2023 06:09:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 42/42] drm/msm/dpu: drop unused macros from hw catalog
Date: Tue,  4 Apr 2023 16:06:22 +0300
Message-Id: <20230404130622.509628-43-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the version comparison macros from dpu_hw_catalog.h, they are
unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 42 -------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7c2331d8070a..71584cd56fd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -19,48 +19,6 @@
  */
 #define MAX_BLOCKS    12
 
-#define DPU_HW_VER(MAJOR, MINOR, STEP)			\
-		((((unsigned int)MAJOR & 0xF) << 28) |	\
-		((MINOR & 0xFFF) << 16) |		\
-		(STEP & 0xFFFF))
-
-#define DPU_HW_MAJOR(rev)		((rev) >> 28)
-#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
-#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
-#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
-
-#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
-	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
-
-#define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
-#define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
-#define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
-#define DPU_HW_VER_300	DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
-#define DPU_HW_VER_301	DPU_HW_VER(3, 0, 1) /* 8998 v1.1 */
-#define DPU_HW_VER_400	DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
-#define DPU_HW_VER_401	DPU_HW_VER(4, 0, 1) /* sdm845 v2.0 */
-#define DPU_HW_VER_410	DPU_HW_VER(4, 1, 0) /* sdm670 v1.0 */
-#define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
-#define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
-#define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
-#define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
-#define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
-#define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
-#define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
-#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
-#define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
-#define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
-#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
-#define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
-
-#define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
-#define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
-#define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
-#define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
-#define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
-#define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
-#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
-
 #define DPU_HW_BLK_NAME_LEN	16
 
 #define MAX_IMG_WIDTH 0x3fff
-- 
2.39.2

