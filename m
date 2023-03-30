Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6CA6D1185
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E643E10F090;
	Thu, 30 Mar 2023 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BF010F082
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id j11so26357456lfg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=RlE3Jk2kza5Hn6wvqs8H9mJXXZ+sdzAOFGgtcnJZg4LtCra7uRcpSy+7UvgmmCa9g5
 agx0CxEhawLxeIbUZHi2wMEtvFZuaOJKcdive7Up/dSmymfpJpx4h3gw6tkPZW+hItCV
 SH0fah8/KsavNF3uTWEwCXk6mt01FGz+etcOFaEZ40gcTTIK3nMSBMlnsIhlr0aZ2YKh
 AnbfVz3yYB3cR3jwBvGLs+J495z3jhH7W7avBbrpF1Zm7IpMtNanzFeKIUotsfz2iBFo
 TyS1EZ9dT8pXURKsEq2wZkJaz8KcaySwXDs1dx7NLVRStYhN6u+8HS+Ph/mcTwlkKsWA
 BlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=57SxU7d8cj8qvRsJtRuXNglU/B3Pr/fHi0xZkWlCepkCCRjcLuAMg/xeRXxnRqW60s
 MW80qbde60Oz2g987ZkwsUIdB0LAKNQNi4424tvMTRM20561EjMI0WLkPvy4wO2eQI1H
 cySDm/d/lChpJy1HVH8Mvfm3HBeoMk7gBuHdGpaZdQn+eB+sFOKlK8FVuAC0u1atz0XH
 pXC9mAcvoQHcCfXTrPsKG7URRXwa9w0myip7DhgPYYGVCt+WAumcd4rRIATQo0tKsz+j
 Svb3+1kge709XF8/CWoqDh6BGbKiVjA8EkbsnM6/+7eYYWLgfFaikqVtYS/LGKqprEgE
 C9iQ==
X-Gm-Message-State: AAQBX9cb5IvBzM3Bx/Lp18j1Fg5bK5KJfl+jR/cvhJDXW5WW0Uv8gTyN
 LfzsNXAMYCAW4WWLb4meFADGZg==
X-Google-Smtp-Source: AKy350Yq+zO6EudWHj9Ls+EFPMtnQ5dFAOYX4oVyujhvLt4gbmYXlKaK7Iy4Wk0zRJVvHlG1qMqGKw==
X-Received: by 2002:ac2:51ad:0:b0:4eb:c18:efae with SMTP id
 f13-20020ac251ad000000b004eb0c18efaemr5579067lfk.17.1680213263400; 
 Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 38/38] drm/msm/dpu: rename MERGE_3D_foo_MASK to contain
 major DPU version
Date: Fri, 31 Mar 2023 00:53:24 +0300
Message-Id: <20230330215324.1853304-39-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 96c5b94264e8..d74029f163c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -88,7 +88,7 @@
 #define CTL_DPU_9_MASK (CTL_DPU_7_MASK | \
 			BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -529,7 +529,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.2

