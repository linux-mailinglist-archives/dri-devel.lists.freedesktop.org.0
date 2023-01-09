Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EFC6622CF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A510B10E3BF;
	Mon,  9 Jan 2023 10:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2E610E3BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso2102433wms.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=hrmmo8SfG3rmXaOE36H7v1YZqukMDa8MI8vpJRCx1CnZUlDPVo4sgTKsZe1EhicxGD
 Z7j3yv3t4IwRwCg0bPqLbt6upC4ABF6iKrwi+JCLHHa8GbiszajKnYfB9HrG6RKq9aXu
 rtVmJ/dFAKn6rp2DYq0toXAi01/YKxFGPs3WaVoSjq42zDs6FHcS1TbW/L4jN4lKB7/t
 lQBG6pawRi49WYYRWKs0yfLFWRMK7D2XSuYhWHkPU64igHOINl1a51eELIICdiX+HK5g
 2yapJv5ar9Jusxmy9ObnGiIbh9enqvpkD3xvOgnsA8XpFyBhHvtAjACkUDQNRds+F2kz
 Px8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=YyD9jiYQTl5kNofc4DqihmRrdwo8QssG4Kt14PcKZrWooPUQHwxjviV/nIjAinfwGk
 +t6J40htzZA7XUq2gdnqgIU+vTOHE9x5LanyBWvrSH5fJqg+K7FdRbi2StAwIyWqSNqu
 qxYxPYMugmhqCrTSwz56cd1y5uyVYCI772KTYhqBbdJR0lWtNSNilaSWLYV2iAp5FcSg
 /gij8hUV5Qu56u7hQSXD7luNEaYGLF2kez8dGtnHQFTXbFgIlmFzobkfI7Oc9LqQcLrG
 kF+/iNUrjo1Zi8NQmo3SWdqDdzToNe6hP9hHVM17y0dTZUuWd2Nh4Wx5n3ltEgWqwSd/
 vw4Q==
X-Gm-Message-State: AFqh2koEMHTsLW0c/lPhJh9/86qf2lNZ7MMSu6/ugSpJuG1LiIlEcoDF
 BgWKDYK6MzhWumoMosNlAGuQow==
X-Google-Smtp-Source: AMrXdXvN9kPFfEkhuEuShiZhptcP7yVgJq6IbPS8mOT9HkvcQPU81vvmcJtpG//3N6IhBs5RiJbKnw==
X-Received: by 2002:a05:600c:1c90:b0:3cf:75a8:ecf4 with SMTP id
 k16-20020a05600c1c9000b003cf75a8ecf4mr46102577wms.24.1673259325399; 
 Mon, 09 Jan 2023 02:15:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 11:15:21 +0100
Subject: [PATCH v3 5/7] drm/msm: mdss: add support for SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-5-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f9ef5085041d..02646e4bb4cd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -297,6 +297,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -532,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
