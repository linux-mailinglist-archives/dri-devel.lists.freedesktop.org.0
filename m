Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CCD736080
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 02:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885D310E166;
	Tue, 20 Jun 2023 00:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE7410E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 00:08:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so1006517e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687219732; x=1689811732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yc5Gpk7GlAItFVd/hh1BsMKbvkwwHWamsjHCC1M3Ias=;
 b=ipD7E6C1N87G3aQYZ4/RFgMvFm88HJ/PccLdFr+xio427gkoEjIyw0sal0E3J5eots
 D03lDsZxhAiwJIwFbFSVDCzmu1qAlJdZoD9+WhR2WS1b0/7cVBUPF99Bi4Qo0h5/OLRZ
 hRvZEjo7BZYVGrUNnd2YXgqIeT/9y+wqBf7xCWII4Keh7l+HheALoXCG8CJDgoUCPCxU
 42fMPKXf4+BGME0fdCjcUGXJtBwP7o40p0+2q4GSl5FNIcOXrHCMhexi5SucmR/ki7Jn
 bXBLHq35cHZRQJGWSCzsBc+k1PRjmUUUBYydD9ARK8SHH8f9hMqoHe6T7SYs3R8m5jXI
 R7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687219732; x=1689811732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yc5Gpk7GlAItFVd/hh1BsMKbvkwwHWamsjHCC1M3Ias=;
 b=UzVo5RjIdc5zNCz4wKaggkRRsZItZXcTRmoW+/TrLmEwIUdNZU9kxDYa701lSuYCHx
 HyPLrcf1d4CqCmcowqgRX0TxOiv2LDge+LGJBODWlSEBtQEqUGqjZXB9WzDz4f1oCD6E
 MAR9icCQMU9pVludl86AqdXTXkzj7qdmQUEzXylRvw8CmLdcOt3Dov3o89ZkXNhjfZ2Q
 9+hDj8E184blUQXnojGkWE8rN5eWTLqvVX+JGxwX0sxUNlec5StCAtiAMJFRbwQow82Q
 RVh93p1AYfGyWJiWgZo+3SMaig/HHRHKZcYsTzmjKs/NuNBDq0GpJ1SKzYeC0iX9ykLg
 NZyg==
X-Gm-Message-State: AC+VfDxBvv+fX6z+gj71pvkV0ZP1909pcnyMDsAQV/mJ0plPUHIMRGNx
 wrt6aC9+9JCF8jigyxxxtdhcJA==
X-Google-Smtp-Source: ACHHUZ7u2Javcxy3i+jtBR8J9MI3xj+egrINv9A5LA9CoenjO1rXWv5TNa01402Q5nxO5HtIMc08OQ==
X-Received: by 2002:a19:f203:0:b0:4f5:f736:cb9f with SMTP id
 q3-20020a19f203000000b004f5f736cb9fmr6142524lfh.67.1687219732616; 
 Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 4/8] drm/msm/dpu: rework indentation in dpu_core_perf
Date: Tue, 20 Jun 2023 03:08:42 +0300
Message-Id: <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index ba146af73bc5..f8d5c87d0915 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -148,8 +148,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -194,8 +194,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
 			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
@@ -325,10 +324,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

