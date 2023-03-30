Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061906D118D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C42BC10F076;
	Thu, 30 Mar 2023 21:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EE710F071
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:19 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j11so26356828lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poUhOJaeys58+jtD9Aa/rVyzrUjEuyrJs5YUCBlvN4A=;
 b=EAyfmThl7iwzELCxzJrxDiyljtz2OJ/SGo7XYlgxzxxT8P2dg463TJrw7EXIB8oUxY
 dGGqZ2l3S2Rmtr2PXW2R+QoYNKqXOzcelPFhxjOuqRwh7mTCq0ulUlpI6+gOqj3HnFJI
 +2bWps0eu35U/JHbNRHv4m0gLsdxnkWdsOwv9LTBT6rxs3CW8yA+Km6wWKAmM80q5MZo
 QVDrm9YsG5VK0JKvFTmfZiYRXThlphWg2RVnkDBdp0/Uxf8/qSe+aNgtEzE1k37HpflU
 fqKKVsrnGt/VErV1xwDEvnIUUXN138e6l5ebJEeb1kAMY3420g50N1xMEdrqpCvBK2ZZ
 GTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poUhOJaeys58+jtD9Aa/rVyzrUjEuyrJs5YUCBlvN4A=;
 b=yq1O0I0H1FQa4f9PHT/hc2bwce0WK3FTKqvZdhR7dtTzfgMYw+nMuZDL+LfQJs6sHA
 fL+J94WE1SOLCQrVlcp16jibZV899w5NVs1bpP5u/OxvRAJzjnhxBn7NlsQwLNUqe2KV
 IfqCLvtg/iW+L991t1oQLCjkhk803pZne58g46Ax09Op+dlm6t/GpwECa34aBi3djH37
 gcor3Q7qCDBQ9ci3NtorfJTH4n/mJzVSidQIZGDUSzRB+RZQnGWMvrD2IcIcUf6ixEIF
 i5z0GbkOm2MBvDDTZcW/MyXHvkcRh+xMLwo3Xf+HrHwW7TLZGdl+eiBS+ZuHa1oEE0h7
 kwqw==
X-Gm-Message-State: AAQBX9cZt9VmXH+dWLoy1gEn1HQ3Uq5nmo8RgQpY9z9zMj0kH113YyNf
 rszjWWPMQmgPB46LH/5S7v0piA==
X-Google-Smtp-Source: AKy350aVqoIlo1aF+bYfcphODXbxeWzt6UG7YNc4A9jd5E+xYjqIU6C2o/C9PlV4Ol3NJXuG2nE/ig==
X-Received: by 2002:a19:8c43:0:b0:4db:787:e43b with SMTP id
 i3-20020a198c43000000b004db0787e43bmr2223181lfj.8.1680213258775; 
 Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 32/38] drm/msm/dpu: drop unused macros from hw catalog
Date: Fri, 31 Mar 2023 00:53:18 +0300
Message-Id: <20230330215324.1853304-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the version comparison macros from dpu_hw_catalog.h, they are
unused.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 00c3c67dd267..92cef44b5382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,14 +24,6 @@
 		((MINOR & 0xFFF) << 16) |		\
 		(STEP & 0xFFFF))
 
-#define DPU_HW_MAJOR(rev)		((rev) >> 28)
-#define DPU_HW_MINOR(rev)		(((rev) >> 16) & 0xFFF)
-#define DPU_HW_STEP(rev)		((rev) & 0xFFFF)
-#define DPU_HW_MAJOR_MINOR(rev)		((rev) >> 16)
-
-#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
-	(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
-
 #define DPU_HW_VER_170	DPU_HW_VER(1, 7, 0) /* 8996 v1.0 */
 #define DPU_HW_VER_171	DPU_HW_VER(1, 7, 1) /* 8996 v2.0 */
 #define DPU_HW_VER_172	DPU_HW_VER(1, 7, 2) /* 8996 v3.0 */
@@ -53,14 +45,6 @@
 #define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
 #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
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

