Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D169B8597
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8010E93E;
	Thu, 31 Oct 2024 21:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xS2lmo97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AD710E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:44:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so2409941e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411060; x=1731015860; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jw811QvSxkKlTSi13fRKJUYPt91Pu2RmLTiZSYENA0A=;
 b=xS2lmo97L5nVaiX2hIdAradt+U8U+ZzAwnbjtzk2cQPKLxnnF7mQ+oXCqUmgOide6Y
 0qvIBWY3rdcdK1Uac0vPgOKFnezjawSYaU6OZVWRav+sIGdpSXyx7+APRTlLkWUX+mbK
 lukTqqlHiAuVxQFNYGWFks7XBCgHHS1PTKqiNQuLC0X8vjK0K00C9aU/eEw16ckHGw5r
 ey9X0xcj+iztLYoxLrC9vrswua+sY7nbLR8TnwF3ZFWZN8Qzc65mTfae/mTLqwaRCAhR
 GOiDk4dNXmVdN5Yz44Yq5x8IbYq364Rt1HZUFyVIDv1jaZHfb5yc3oZbKZyQZZUuLVev
 8drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411060; x=1731015860;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jw811QvSxkKlTSi13fRKJUYPt91Pu2RmLTiZSYENA0A=;
 b=MwqE4lx1yMGh0mb5UwYuj1O77s3NnSccSTPNGju+U8Tj3bsfGFvGPSt6YElvbglMew
 spyVcdO2DBjtbsjPXGVwCkoCkGFTZh5Ucmfn5bvt8XKCwjHIWzTxE1Ha1dTv/+GyMBOc
 zoz2stXUwmSjLG3M5UI+uub+ZsEtLxkQcRiWVtERa22MT7L6aM7aI+T6n0iNfcRlnekY
 El+Uxt/D4RNLSTBoNLgn2miKZIFHsxgs+kSgdfPJU+nvwWCGgKezRsnfrorwrViR2LTZ
 bjlg4T0LXEFW0lB8JUSastCytLNAByL5LTowL3kw+21CsWFg4xzG3wTMwU6RwPelt+fE
 LyzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuV5HnbzWTeglLAxsQhbX2wq6zrpsipTSXVs3hZrfclIC5qQ1mR1Y/Kb18b2V57pVNG4/i4O8mPxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAgTg70RdN/OTj0uPNnwTPsecjpx47yCP6dL/mqsHtavRGF6YY
 O5HEfgrBl0Li02XPbQAnoRNL7txFhznY+cj42jDFAjEiw43UPz4GVZVhOnLuSXCRAAuQmECIa0U
 1
X-Google-Smtp-Source: AGHT+IHHauso5gw92N1K625tiIBh5li6TkbAZXQxxn6Vk07CDy0EXyPPBPtOf/csQkc5zctsYe1C1g==
X-Received: by 2002:a05:6512:3f09:b0:539:901c:e2e with SMTP id
 2adb3069b0e04-53d65e1634fmr1394608e87.58.1730411059664; 
 Thu, 31 Oct 2024 14:44:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:44:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 23:44:08 +0200
Subject: [PATCH 3/3] drm/msm: drop MAX_BRIDGES define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-dpu-move-topology-v1-3-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwRkgGoOjzZgmKn1Q7SGF0bYYDkMueTmYikFdU7ocIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opEO4nZnJKudYd5VJNkM81POL5z8Lk8UCtt
 VL/KX7M452JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1cprB/sEXHm98G7GhObz4/5yVDFNvTe00LSqFqAxgVssZBeqVE1wpljTMyaLDeW8j1/MuMs5aeI
 qv1qfeR8geOzJDZUsileUt7Hk2uWaLTpYcVAJqY4FCcctOq1LntrRX334wYzenxOFEdrnrGxUMu
 +Ku9Vmho3rB2mxEeBrI/frE5DtUsoC1sYRFlEAtgWjJ4qdE36JcUm7tr4vugAknz94xD4lNbouz
 o8kNdVF0pudl7ZZgrso5LFZSc1AqClTnXcMHceeb0mqMC3g2dKkxkBkfgLUJiHyNlMfh+CPIB/e
 LOfxjc++UkGDLVp0nVea20hvKveOQ4jOjQoue27okFvu/iLh
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

The const MAX_BRIDGES is unused after the commit 4d1a1e4686bd ("drm/msm:
remove msm_drm_private::bridges field"), drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1dc161d9bf51..d8c9a1b19263 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -52,7 +52,6 @@ struct msm_gem_vma;
 struct msm_disp_state;
 
 #define MAX_CRTCS      8
-#define MAX_BRIDGES    8
 
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 

-- 
2.39.5

