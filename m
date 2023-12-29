Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EC820251
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 23:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6438F10E2E5;
	Fri, 29 Dec 2023 22:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57EF10E2D6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e741123acso5140810e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890613; x=1704495413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
 b=lwlYltNAfP92Fj+/VCX8J2EIAFS83LMKw9sU7DeV9QHFP1qy18NsD+CiQWcCj5j9N8
 YCbEpcpvjy0c6em0DPqIR5qF2hrrcNUrlkIuoxZb/UwTimrq/GPxHLJr3icdG5iGEPbF
 8GkZzl44geF+UAbXvCVW0+UxQNaELw8HtRaIW5iQwHSoc5x8G7gsu/dYx5KNYgQGpFFU
 AacIq3Nt83mC1FqMpiewTi/adCK66Ky5Jd+g5X1YHXPdIxFdkMBmiyOR5A6rH1eZZNvA
 rSW6nArMxvoyYnVUOrAtyf+/NThkLjcM2RWF/Wy0mC2T6rE+Blj8fWsu107pTf9oP9fY
 lOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890613; x=1704495413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
 b=MWJY5/9+oFXFO6mPcsTB0bzyoDM/MFKHxm910FVn0s7PjWhlKIx3NENScQyh49MkUl
 v902PNi/ksNgsfhg/atBQ8E8jx78pKxEFs35LZF/CkA1i8MGKJUOs70fg5Gei3mW+hr8
 oZdSJuY/MRDyatMiwcrYjW/tQUyk4AAN4bO6Zm/a/aFP+4AsbAjnAtif0yH+y4w+p4yY
 COC+e83GjEW0lRGs8jo2xWmetVzxHde28miyLERlYXrJsPXaG6kHVmvTKtt0vf3Aa9DN
 R6M12MmHSpmtXhFx/FVWCbcvDJfBY7XGDSzfGjk6UjE7CU99q11/ESZD21mQc/3NtO+I
 mBEg==
X-Gm-Message-State: AOJu0YxYD2+vafdUeEQsMr6NSaC0PHQpmbgAZMhIF9FTP/3S/sBh9yK6
 OjFlz5Fbwv/B5s9FFbljvVXkoJBlzIpp7g==
X-Google-Smtp-Source: AGHT+IGVq+diA0pkorRsAbsI4Anh7OfFf9HYssPj86p2ooUO7ezBaTmvKfh/JqVgeB8/bDpP0XljlA==
X-Received: by 2002:a05:6512:3b07:b0:50e:7ef1:df8a with SMTP id
 f7-20020a0565123b0700b0050e7ef1df8amr3140027lfv.58.1703890613116; 
 Fri, 29 Dec 2023 14:56:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 02/14] drm/msm/dp: drop unused fields from dp_power_private
Date: Sat, 30 Dec 2023 00:56:38 +0200
Message-Id: <20231229225650.912751-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
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
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop unused and obsolete fields from struct dp_power_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };
-- 
2.39.2

