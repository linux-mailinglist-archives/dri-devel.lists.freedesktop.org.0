Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF212716C4A
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1C10E40A;
	Tue, 30 May 2023 18:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF7F10E402;
 Tue, 30 May 2023 18:25:02 +0000 (UTC)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at
 [84.115.214.73])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id EA9E8CFC42;
 Tue, 30 May 2023 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
 t=1685471070; bh=tSyVDSi1R0wPUkpeZdZY3/k1LG5m9jxQOZeT/ptDISM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=TlDQIwMxQNaz6waHH9OYtBwLvLeRaosqpKMkSdBffpf9RevXbBZcUyKp4NvRRVhtJ
 UcBb+CA/kpXAgLcQKFiESVLGQA3b1kLfWUY607k0pjFXWrnRP4ajecUTS2i3o1pcwv
 Vj/9HchqkJ5anWbPln/H8aiXxnhovOVSF3n+RC88=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Tue, 30 May 2023 20:24:15 +0200
Subject: [PATCH v2 5/7] drm/msm/dsi: Add configuration for MSM8226
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v2-5-e005b769ee28@z3ntu.xyz>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=tSyVDSi1R0wPUkpeZdZY3/k1LG5m9jxQOZeT/ptDISM=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9VaoueF0hGskMcZQ/G+5BNdYTyh3QFo84xA
 FYiXB3mHMWJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/VQAKCRBy2EO4nU3X
 VvdAEACWLm51oDLFfRk14xBcRWiP8GhkLFr61vb6hVhnfbwULHe0mkDIIA6gypDvcWSJ2UgqaoV
 RUG63J3n0SWC4sqsfEs5aE41ZtpxVxylRrgxHxCeS6Hh9X0kDCtkTrzLIeuLBnYEx6tVlgtOD6r
 +x/mFYTJuD/oN6xcuyCOrNq7rg9G+PF2ifMotLyVEwxxvL0pNUb0tHIIo/0dVXLC2bOxofgu6pe
 oGId0qQmjBLfoOtJf0VE3Hpkmy8knIvuzAziXGb92G/qLUb8rIJiXJN/0oAHjBXARVIG6PFxRAy
 dN3WpI8w59SpB3Y4g/3ZMNHJXrzvXgahRij+lroW5yL8ikMIInQNYuQ0/RephC/UzN/F4Qb0xCJ
 l/Hk1rUoe7Y+0vCkCzbtttOuqhXz+5KbiffoQo6iWUWmkTKEO6mDndJ49gCl0GKjkL1k38wGL1O
 BZE1jLvqdeFb7oMf1EEm9oHywhwU9O68JMLhRCumUjdUmPkPBeSLS2x0QoiL17sGaMH2s4zc57m
 JXdnhsCUGm4dja0JMuzEfqTb2st6g4kM/oJepG5LWCNGHM9eZTTKhMwad+1TbbsnawSPupjMbQW
 3Li8Cq6E6jDaChFA7qqgbo43DrGaMKLZdY7in1+CYPwINkomafRAm5lMpwM8MniPFaH6ApeahrE
 d9gzXg9MVdxaqeQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
existing bits from other revisions that are identical for v1.0.2.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 29ccd755cc2e..8a5fb6df7210 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -245,6 +245,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0_2,
+		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1,
 		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 91bdaf50bb1a..43f0dd74edb6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -11,6 +11,7 @@
 #define MSM_DSI_VER_MAJOR_V2	0x02
 #define MSM_DSI_VER_MAJOR_6G	0x03
 #define MSM_DSI_6G_VER_MINOR_V1_0	0x10000000
+#define MSM_DSI_6G_VER_MINOR_V1_0_2	0x10000002
 #define MSM_DSI_6G_VER_MINOR_V1_1	0x10010000
 #define MSM_DSI_6G_VER_MINOR_V1_1_1	0x10010001
 #define MSM_DSI_6G_VER_MINOR_V1_2	0x10020000

-- 
2.40.1

