Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5788A2DE18
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB4810E493;
	Sun,  9 Feb 2025 13:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qTmHBiXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D84110E491
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 13:41:28 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5450b91da41so252347e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Feb 2025 05:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739108487; x=1739713287; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lWaltDjOoxflJCFYRxQATxzaFCp3PtCF169disqO0ak=;
 b=qTmHBiXUB7pJ/l+QW2UKRoTuAFHeKtXlLIvd7Z3jgN6Mv0URn2EmURF7ZGyls+6l7Z
 wlWpt5JbGYu8HcvcACLHNl+tjPHleETRYobKPt98ZWph60sDO9bi9tIUZPxNRYV7qRWu
 7eKVcZITKMtBfnuD1h/eN6StqZ/Hm8QsukeYFLEtC+7zZbyFFXS0gRxFm+9RQGzT0f5/
 O3LRL8Vz2iJYuB/VcamD/XXYKh9lfxMT5wfQiGULHTqv+eFb/R3nY4pbS+sL1KDBcDFE
 bmaEVlWw9BtEfsScW5B3wVHNhXkXpTCtpaSbVz++fSv1j+q6mwcDJrRW3CUW8NpQ4slj
 PU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739108487; x=1739713287;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lWaltDjOoxflJCFYRxQATxzaFCp3PtCF169disqO0ak=;
 b=MHn4+f6Qi8jNqbO3YrpN8ePtHpxIIbjSA3FY/MyfrYySisFwjsXJlYMtfR3hXNGjly
 PTcCMz+uWB8obKl4VFbjZJxdimHjzpu4/HJTNbmAODYUvC6dNFX0QD5E59PW0/R92wZH
 3I47N1VGNJrwWOphkuYmstfObwFBMlIPSZ6MAiwUAwMh+qcG1jhOqb8CEecNp2+LQnkK
 JIuM2ixZa5W6Z5d9DNl6c8PCMCdJ0mtNxLoBwogIDktaM2R3S10NhwEw178uafLDAwae
 1j+qstvTltVA6wYGonfPyUEhWQbVOVEpGObLAMT5sK5cROQeuzShg+9rEvB0MCHpdTv9
 +Obg==
X-Gm-Message-State: AOJu0YzZqCSadivcSFQCQcogLUzRv9vohcT+X6Zrv0491JxonsLb8UYI
 8Z211yPfPu4p21Czywp7TqP13oQIbPQxfkzW18bpIsKVhLVKxpFnbYUAiuLGOFY=
X-Gm-Gg: ASbGncvOQc60S17Oxd1CTMfNzRePcJd4WGWjdyluK4CmvEaUqw/xwF082BanuvMG/yd
 fQnZccTHvET6j2zYbSBZtFiQLQriUAjUZUIH2Of23GoxD3zckp9zv366a0PGUxvI5XObDDfdgo3
 Y61wnq+adnHPppPI4EW6L1sx5B3s8axNAxpto2Y0k5mjXBVsz0D3lqkXA1Xm9DS9aLYZ7rMn5qZ
 6tdqze1SUqJbOE/qD/4xjISK8iLEgSQfGs/CArobUiC4waaggsvHH0SWg3Cmkt280eoZbkNRy5k
 z6KApqQfgvr7uikbqlWh1Bs=
X-Google-Smtp-Source: AGHT+IH2+ci1FbKoITit5GafLqBixMvMYDNiadDVJBz/IabhQTlCodZTQPXgFXjD9PXiTXWIANayLQ==
X-Received: by 2002:ac2:58e8:0:b0:545:b28:2f94 with SMTP id
 2adb3069b0e04-5450b283186mr306347e87.25.1739108486383; 
 Sun, 09 Feb 2025 05:41:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 05:41:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 15:41:19 +0200
Subject: [PATCH v2 2/3] drm/display: bridge_connector: add DisplayPort
 subconnector property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dp-hdmi-audio-v2-2-16db6ebf22ff@linaro.org>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
In-Reply-To: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=i8AIajCFyJkuetYPgFIKKvSrw8Z3sFXPUR8DYbCT/Y8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/ZhixkAWuIJaWneUEqNA+Zs8u9ybu7ho5t
 JJfUcchAv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1TlaB/9n/dtp6mZmO1VrIP0Hjk2PuuHdQGOc7BsiKtPR3dbEM9Xd6iJMEoMDKg5dhrmn/lfCV9J
 XjlmlgAmRsd/L7GuSfEKTabhgMoma5pTlYizJvCOk0mZJezCN4x2QFBJ8gF48CrzKqOwaH8ii3E
 /n2xBFYLzPQ+AljZjaeJffl64V0QONMpLe92Pz/Xv+yi9TBGZ2E53YNBT3FEi9chbdQiTfk733S
 +WvON9hBsj6WWgWfJCcJlFnX5aZXB9c/iVf8XoYFTnSllnDkG9260wpDC31aSKykYAKB0GWD125
 5KCIOMJVxL+lqo2j4MtObd6aH1xfJwEnASBCkoq74dvveXOp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Create the DisplayPort subconnector property for DP connectors managed
through drm_bridge_connector, removing the need to create it manually by
the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5e031395b801f9a1371dcb4ac09f3da23e4615dd..df9e6b46b40454385f7023310327c5c99d5c6a5a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -662,6 +662,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
+		drm_connector_attach_dp_subconnector_property(connector);
+
 		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.39.5

