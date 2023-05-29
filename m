Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47705714AC3
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 15:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1C10E29A;
	Mon, 29 May 2023 13:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862B810E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 13:52:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so3533795e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368349; x=1687960349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
 b=j6o4ndm9exCbsyMtXk7Ddvm8aXJGgxxHXxGXxrHyc+TdJLtea0+YEg+aBLvLMyQiH8
 6NEHuo70+dGEtt9Me9Ybbazq8THoTxkBOx0i3EnX6sH9Jx/NtaABirAg+buUVC4ZyEEW
 V9icn6p/WRymbWrGoKOd/+xGr8ZF8Ck0sNoxv879dvWazSm/fmCn8PwXHsOaUqBvj1lA
 C92vnLvToWCFQwLbv8XgVNG+iHa44WbmffsjC9gmynRhuhM/7MEFE+THlFgdb/mqaC/X
 ivrdPvJcu1r+snAEeNy2L8ngQInK4EKBs5KYqagUui9NzlsLPX06Km5qPbSkuiq7YBDY
 AM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368349; x=1687960349;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zp5vgGCljU9Pzelevk/Q8qB+omVB6SpjUQQoV9nlSfc=;
 b=aPbqNGvKYvH7hUVDwezSPddsRtdAcA52gPG+d+EYfKHpFqDg91WfILBmlbEoNUJYHo
 BCy1upUv2NMxrWgbK2tM3LP5VxaseU5V0rZZc/VcrQEbqFPA3RQjNddY7ssctcqOlv9B
 EBMxepbp/hlZh4rj+od5wHogEVxjfgH9i/jrTlAOPtMZGCcBizawpkIJs09UMSLrEPXF
 xWNqxg4jwxRaqPyOFgue8+/4l6MLADPnl56IyDRgNkeMRpZvzP0NwQ+/8Cq3alIiVPS0
 eM56qTkxptag9VmdBzF+ZgHfYyGvsDlU0ulBq7EqL0YqKyWoZo7EThGyAuA75zloJ8LY
 JxZg==
X-Gm-Message-State: AC+VfDzFveImjyHXNkINo7PYExVLhhB8f/T3k5wBXBSiKI3ZXsgq3mBr
 6p1jUubBWuiINKBGV+rLj6liiw==
X-Google-Smtp-Source: ACHHUZ4ELGEOuSiCSoEkpbsfF8oQU8hAjPpkpF8iYAlnhL0aPjqWp9vWkryBVQmkXUQWqPwuu1BcDA==
X-Received: by 2002:ac2:593b:0:b0:4f4:e26c:644c with SMTP id
 v27-20020ac2593b000000b004f4e26c644cmr3511386lfi.68.1685368349674; 
 Mon, 29 May 2023 06:52:29 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:29 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:22 +0200
Subject: [PATCH v8 03/18] drm/msm/a6xx: Remove static keyword from sptprac
 en/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-3-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UGqbGuIs6LlGAaix8p6ok6zP4Iy0VYtXRGz1T9C6CU8=;
 b=iOq1ICy96MlI+LSJpYN6hOW4tYAsXyISkNiXCfzDVHQx+stBruh5n3B4XG2uwGKuvy1fVBVdI
 QyXR733auXZDDVrvKNMntXFujlUjBq1VkLyinovCsZcpyENLQPAkPn1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.1

