Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45A692D40
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 03:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A501110EE95;
	Sat, 11 Feb 2023 02:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B547410EE87
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ud5so20238038ejc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5i21R7JP0H/rN6EdxfT/uxDsuzXK7e5UT/U0od2qKqs=;
 b=VcxpmFT3ncqU4l7V8bMvWZWCyZTg/2jmicRzkBwz5KKl7ATPpZGjNX5ufv5sB5OO/I
 memsWNODlS4RUfZo1DBPnGACaDYakJ5DPWyorqCXFNYapvKx7xiZyDRI4eZLbVYc8lca
 Mz4ND58F3Cz+B9alpX1Euv08p95+GfjbpExgyKrCj5puLa7GoJLSfLxoONI4j5figgCn
 R3HiSzGho1T7Vc97pwBaUmwnBTIBllWo6j9c/1crR+sRTGPgHfv50dq6aGN2wS3xA1AB
 SVmxaRtn44iWfaDWf2vFfbOFPWBg0YHvvWfhI8ObQS0KABd63wviweJ1yq7hHg9i7cis
 MnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5i21R7JP0H/rN6EdxfT/uxDsuzXK7e5UT/U0od2qKqs=;
 b=1qwdAxt+GC7Kb45poCxYeVCChfktuEknYZcHN/WBQJO7jt8tZ2M2gOnZQPs1DJjoLp
 y2+tSosJNL4iF1rc+35VvZb95TeztYrhKsH4KZZWy1ZStsFKpxclxr720GXeqlsL9OJA
 EVkSfxTSIHdYd4ce4NW2MvWUS+uCl56Tq8qGLPuCXleTXoVwqoRa+7UkFogjPNgaMrUR
 hngqA3oBxH+2YwEmF0oTx2bRv7O6AZZ/etmtFNnP7EAJdOcVBzaYgZgNBqkVzHrFJn55
 b4KtYM1kt5OwLjQ3FmtlwGlCQTAFLKz1gxFaPYelWdY/M8yqWF4zxQIuprFoCtXKs9Gq
 TlUw==
X-Gm-Message-State: AO0yUKWOkprSSmLJCS23+X6cKT/zkuVZDvHJBGh+nN3UERjlnimZulM+
 atlVIUQmNTKYRd/wpPCvWzBo2ASk7pTvw39k
X-Google-Smtp-Source: AK7set8NaGDhwqw/BOpzA53mP5VOJ/LU28ODqa+tyRe5Cn+oWJFuNChqsSO0x4mCxNwaDMaVFYUwXw==
X-Received: by 2002:a17:906:a242:b0:878:734d:1d87 with SMTP id
 bi2-20020a170906a24200b00878734d1d87mr19306532ejb.47.1676081498346; 
 Fri, 10 Feb 2023 18:11:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 41/43] drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
Date: Sat, 11 Feb 2023 04:10:51 +0200
Message-Id: <20230211021053.1078648-42-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

The msm8998 doesn't seem to support DIM_LAYER, so drop it from
the supported features mask.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8189bbb88b10..23fe5f1ce92d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -50,7 +50,7 @@
 	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-- 
2.39.1

