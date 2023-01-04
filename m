Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41765CF30
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97C910E50D;
	Wed,  4 Jan 2023 09:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8A210E504
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:08:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso23709683wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 01:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WprIPOLxeNcgWUttCw+DqHxkS2tICIGh8IzytcEHCm8=;
 b=aOBxY7T1bzKenUwbAgBCiC9qyOhIhX5SgHS+q5PYj5kOxxynDGiq+l0l9OkMygd0tZ
 gVIUj6PI0VOYVunHIROncM2hceMnJRmwA4eZwpKnz+88nNbtzQesLbD5JhK89tzmEMzn
 gflz4qai5/nDVsQK3pKSGv15ATF/6RhdCh2Zt4aNnBRFOdFqViTIYsPo7aeHdekdkgRq
 QzFr2H02mgop+dfr0b5m2TnkHi8hJFjDIuHTBwg7UCdRTzx9Tf79SWj6nz0S/1H4caVR
 qO+qXN0yMNATfLeQCaubbvrUTVystcHg2phdTo+JQ7wur0MjvrwjAU+cq9qDl84iBRnO
 5Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WprIPOLxeNcgWUttCw+DqHxkS2tICIGh8IzytcEHCm8=;
 b=2DPYguOqZceybgDFYS9U3szVrUdyPzCoge/DsxwynLU5jxV41/Tr0cuZNUR0e9kexV
 IaBH4VYO472pjMn+dWHFyR0cpk20zeEw9FnX2OoiEv85ZhfSU4UHVEmoyxx/sLPQdDLA
 WIUR8APq5pC0NZ7wsZ0B9A/xlqTaoDzZbzbu6GkvpU7UUgzyobVfqp8EBITJxi3CDaty
 v2gVncuN/z9ZHwd3B5zS/89opvY5cScaa5H7Tay7TrNx1EHvkjcfYPhpNCa/ftZ0wse6
 2LQcFSnumwoQ2FXgeVF7ru+pn0bvJ4kjvBrVqAT6NlpTuR8852iYPXgLKELUTIHD16Ap
 9R5w==
X-Gm-Message-State: AFqh2kpxHJEVsfdtpTteameEaukI/53VLLXG74Mqi1gYrgVbCsUMyq90
 Ap6Qgc5Rn1M3lh0gdIKTsrstdTyT9K52W/zV
X-Google-Smtp-Source: AMrXdXslBasQ4LdObbKLPkGGFzFif/3uHl/3JGpxTA8fN4C2Sl34fkMwGmjVnZ6wwIzofFscQhqTjw==
X-Received: by 2002:a05:600c:3d0e:b0:3d2:3ca2:2d4f with SMTP id
 bh14-20020a05600c3d0e00b003d23ca22d4fmr35783226wmb.36.1672823331097; 
 Wed, 04 Jan 2023 01:08:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 01:08:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Jan 2023 10:08:46 +0100
Subject: [PATCH 4/6] drm/msm: mdss: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-4-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 144c8dd82be1..54483fe30ffd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -288,6 +288,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -521,6 +522,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
