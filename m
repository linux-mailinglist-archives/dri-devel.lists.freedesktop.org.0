Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2306D1171
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47E410F063;
	Thu, 30 Mar 2023 21:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E960C10F050
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:13 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c29so26407338lfv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=THA5DUvHPQ+QBL52nYEV9tpu0q9xe8F7GdtDC6yUElY=;
 b=L1l5VCjjOrGugOkWjAYfesM48HOoXaUvGkQBeWHDUod2JhXJJM1tJxGU1q8mACQcOW
 jJUMh19gAAmC+w7yn9h4NethUgJq6a7RKyXtBqzVlqC1v8TrzvZ4QlOV7VUnRzBTOxVo
 u9tOKxawcRlK/DIlExi4AcNRcIjOVVKyh+S86mbop2hzRZ84bZ8gmXiHNPRzA8lGSvw7
 SX0n7AUh0MVQdNJwGHWzDg2Tzf3fv6u7qQvRZEzXgjVyf/j3Nmb30ct7SBJjNzsP/FXy
 IrAvVhK8cQLRp42mN6g49h4c0HEL7WRWnhLwz6Ml8yXV1FzgJvpa/vhSe2kg+ZbdkcX7
 dh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=THA5DUvHPQ+QBL52nYEV9tpu0q9xe8F7GdtDC6yUElY=;
 b=qEbBxR8zvu+5g5lx3/xHHhCUsNy5AbMPEm7LAB9c0qknk8rNAZkMQpox0CegGmHytM
 U7oBBnxFhNs5DCVYjpnNkLVri5hyJ4szvqPQOxY6pe6kJG1q2fa0BhwHr3pUlc8Pc1Ir
 PJfUshCAsgeQx9FcCp5Vy5HHYjLy0+4MlcqmY4T/axfy1TYjmI4cDq5WyHvcZOxxaiYD
 y47/UynpYkTMKpx+YlI0PBrTiGfuxjxhQl2YqUXZVTr8cxM8wERaLtocIoMMs71YqYX9
 KmAuDnXTlMSGo00Hs1xLoXZtNiqE/CRApEUfKpDCaN4I27DZLWfAhQI68FtE+epRuaQw
 tj8g==
X-Gm-Message-State: AAQBX9fsWHjs7GfoAZ+2E8EQh+Am1FSZ0K3NOS2rgrgv868N2hFVA02r
 goMdkGBcgnkrC+wjSqsxAoR7Gg==
X-Google-Smtp-Source: AKy350aMiFLWOXGj92k+fnGY7+ygGYr47Uqs3EWoqoncyX9U8TD45i1h09RqZ6yA1i8grHAS2Lnz7w==
X-Received: by 2002:ac2:5337:0:b0:4d7:59e6:388e with SMTP id
 f23-20020ac25337000000b004d759e6388emr6619193lfh.46.1680213253510; 
 Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 24/38] drm/msm/dpu: catalog: add comments regarding
 DPU_CTL_SPLIT_DISPLAY
Date: Fri, 31 Mar 2023 00:53:10 +0300
Message-Id: <20230330215324.1853304-25-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For sm8150+ the DPU_CTL_SPLIT_DISPLAY should be replaced with
DPU_CTL_ACTIVE_CFG support (which supports having a single CTL for both
interfaces in a split). Add comments where this conversion is required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e6280b0cb207..6c6f8b4a4be8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8150_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index f19d1c2ba845..cfaa68a25427 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 9afcb6cc50a5..84396240f0d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -41,6 +41,7 @@ static const struct dpu_mdp_cfg sm8350_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index af80e1ced3ce..49dd4a908413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -42,6 +42,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 5c437c7682ea..c9d1892ec8f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -43,6 +43,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
-- 
2.39.2

