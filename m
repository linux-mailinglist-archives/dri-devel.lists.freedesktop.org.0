Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837AA634ACC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 00:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6401F10E49C;
	Tue, 22 Nov 2022 23:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B548910E494
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:44 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z4so2685711ljq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=jvD4z8ILaPy0aiGdKMyoEDLjDAxXWw4uFkzNuXgPyQi9Anix9LXrc9uedgTq0+4dU2
 wRxX2TZbfJ/P7DZSLvZc9+1nrvlz9HzwAyvUm935n7RAZY8Jh7OTPlsqteBpf/o1v2B6
 ZQUA5JNJe8xMBgnuBrWsSqQ/19qorcjdmFCFHWGFsCOwvk1L3yZT1/wywPJ9xvNQErl8
 k96KfaYlVT2xd1A+D6J2zAyOm1D/CQpU/z9s1P56uVapIG+iBt06008j5n+Il8KMY42x
 GAW3P/TM5EVRQCptVXn2Iht04yjDyQIB/SZTALWwOcFXy2UBDqyeW8JrSj03CMMGhf/F
 gU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=61k6bXSvbeAmviYmS9fvkr8TrntNtTXBH7bnxVHWJ6vkumOjVHSG4YyQZBBJ0kfS4O
 1sHiAdlxhtZw86X+qBN2F8SotXe3xZLLB9H0supEIvgh+0ZLAhPsJrLt3X3un8bkD6m2
 LCNgwRdjEaIv5oQrx2V8lekqwvc3hM6pB82+/DPAerZa/gv7KaGdtHRQIXBSUWEIxX6l
 74FsRyqzhci91X2s/43udVspYJdYYxLdP1s2m+iQArhqGnMOHCcWy6Hi79v4hqXCTWEb
 S6P7gds6t73pRsuDV5crpe+KLNENVeYdK6rRD7AKrTSyENXpVffTgeltXnw/bcLaNckj
 o94g==
X-Gm-Message-State: ANoB5pmz9gXYUgpnX4RNEB9JKuyKUhDvWZWEh67nQ8SLuCmkwmwIJ8Wq
 YaOTDzUHBHvKCn/TLkNC+2uvBA==
X-Google-Smtp-Source: AA0mqf51/Z2whokzsqkJu03zvx9yJ6wglnBbfp5WyOcGJhJg/KGKg2Xn7HtLsXqeXJ4rSSrOGsJeYw==
X-Received: by 2002:a2e:a988:0:b0:276:de0b:ce2d with SMTP id
 x8-20020a2ea988000000b00276de0bce2dmr1964445ljq.212.1669158762730; 
 Tue, 22 Nov 2022 15:12:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 08/11] drm/msm/dsi: add support for DSI 2.6.0
Date: Wed, 23 Nov 2022 01:12:31 +0200
Message-Id: <20221122231235.3299737-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7e97c239ed48..59a4cc95a251 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -300,6 +300,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8f04e685a74e..95957fab499d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.35.1

