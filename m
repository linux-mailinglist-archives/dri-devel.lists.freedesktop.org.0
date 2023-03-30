Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6C6D1329
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 01:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B89710F0B6;
	Thu, 30 Mar 2023 23:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B164210F0B8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:39 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bi9so26634156lfb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UJtkSDvqvd+N2tN3r+04S+rFblpzh6izfhKCgwy399E=;
 b=s/HQPOIdCM2wx2RJyNPmcY8kV97ZK8TPWptMk4d6ChufFzl048iV/b0pKilbqFYFLM
 fctgLgBgPNtgNKads49nSe5vS+rLAtQVuL9a+yYSNcVoTB8JMy3Kk5m/b3jaqc2/XMvQ
 0tVWo+ncgHjFdoUK3n4NOk/beBq1RiIIDAQJ3Qco1DQJQBN+IoG/2w9X+7Kia0WY3pRC
 ze/1Nrv13evTUnj68o0qPswjVD/wOlvfp9ZjP+xqoDC+OeKzABkYRkbfdXS2NYqmOa8E
 HBclZC+f95kzpkBktPHPl5FZZXOYiyZ4AyC9NUkCwl/yzZ4TTmyZc4UJTyDHdsqnW7oD
 kaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UJtkSDvqvd+N2tN3r+04S+rFblpzh6izfhKCgwy399E=;
 b=NkjHQl757i6hdtOWSLdMnzQxAcYK45gxRwcnq23PnJfdroyPUkgfYiXWZzXNhabZYU
 4bgXLn/q+agXSGYZpQQHT2M3rk8BzaRYkBFiQbWFdDVZGqSmERTgIYEdVoA+JcUTk+Pb
 sLbXGptsREIIqSEbL2mFnJzATSQH3Af+TYZXbwcXXd1MAr/meZBr5nDrIDNlF6jbLSNs
 xcbvJQLaEMpQn/jPgm3Nt81QWDKgRSwjNOrj0fGFdxWexd/8DM+uw2lVdsHaAyjZivWN
 J04rFmjY8vy62N9KRCIUH5Bh97S3IXDeLCFYnXTFM1SbuQmo3krTqXXGaSkYRQVSuYZc
 vRIg==
X-Gm-Message-State: AAQBX9c38qjyxqko67Pm5U2I2ZWZ/i1fYYU3bINVfH2x/fGvOnzz2Dsp
 01x9WbAlWDN1p7wthGpQxLLSEw==
X-Google-Smtp-Source: AKy350bMoH8wrzy9X0rOyF6hSdT6cQnVC6QTyeEWjyMPdHp3rpeoxywyZ1y63v6eDY9URujHnuYDyg==
X-Received: by 2002:a19:910f:0:b0:4dc:8049:6f36 with SMTP id
 t15-20020a19910f000000b004dc80496f36mr2150438lfd.1.1680218739267; 
 Thu, 30 Mar 2023 16:25:39 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:26 +0200
Subject: [PATCH v5 12/15] drm/msm/a6xx: Use "else if" in GPU speedbin rev
 matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-12-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1434;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=s5xbHS5B3ZCiDUXL36LQuQu/YVWHv1Qws9XL8zObDRw=;
 b=0lrLA/hfvQb9236UuY0WgfSVa7GWwFJWUOE4cP7zBhaQUQVZPEH06Zl/rGSuLhfW8wRkV8u9tTsT
 woreoyUMDHtF32a1vNknVlAKJy5ylWmHmItoggCtDa0EAchVD7A9
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

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1f553451ffa5..87ff48f7f3be 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2224,16 +2224,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
 		val = a619_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
 		val = a640_get_speed_bin(fuse);
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {

-- 
2.40.0

