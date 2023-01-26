Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A791267CFD6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E1010E933;
	Thu, 26 Jan 2023 15:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929DB10E934
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id z11so2178313ede.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkFbFkSGCftg9vK3KhuB5C5KHQRRp5s7MFTXq3oSOXU=;
 b=Jtg30tmKUbLWZISWIXPATPJyGvDdzOARaqfHtjngPwzKZTLT00A130F95I8DgGT4Y5
 NI+FaLpiGNIYbeDMxLkmR3sIMjno9RV2nKzKo+kAkK6W6Al6xOCR2yaAcBKNvP/EyW+M
 n13ki4W+c2ATtX5UkBBkRVurGbxF64vLO1xP2f5iFFmrpAnwwZuoEJjp4ojrv/bmBqvj
 okaGgNIUX0lFkGEj0KiLfBN1RurMYenCTFEuRd0EKEGgEXgdPLMHSOKbrSdtbVZqpYsk
 NVbz+AiJwctK7n4Z8i1+bpL3ytt0IDEvBx2yVeuF3+QuptmVtEoWplRZ+zp5qdlQskLy
 E3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkFbFkSGCftg9vK3KhuB5C5KHQRRp5s7MFTXq3oSOXU=;
 b=WYkFOHd5EbQMW3YSteSxnMtZd6QHyoZ6MdLpri20VqqGP7b1jmPIiZJO9GJSn1whVt
 KacRr1juWPx4OqgD3JFoDfLwsaumFH3s7MSUDYz6F7JKg/gLXIPzVXuHqqUS0OYmkpGs
 ex43EcwB9iN4Id4OMfuic1sk/axpF/Tx7Q8fr0kuyuelD9VeZF+h3gjUIy9T+CXnS36E
 lNU7MB0hWnp8aqQYIcHFW6GZXq1Neesslv+lVRznmiXk0F7gecV5jjorR9mzJL7+G/cE
 Mcw3ffJtY4UoXb0/0/MKPE+ckDPyP9k8NlWPAzoKZmXKC+XmZx0kdnT3LmzU/+nhOyvW
 APiw==
X-Gm-Message-State: AO0yUKU32nj0TLmVhwpnnb8x26AzRW7bbGfmMeBw+PiqE8xOqcpHaZdU
 temMXCge4s/1uNddQpzrg4HP3g==
X-Google-Smtp-Source: AK7set96BkvFoMp+uw6C2kTl76s9zo0QxmZus/Wf/NGW92Dg51mUoa7BnK/qe7pjMt3PITcVKbTnNQ==
X-Received: by 2002:aa7:cd65:0:b0:4a0:e415:d39f with SMTP id
 ca5-20020aa7cd65000000b004a0e415d39fmr1699657edb.41.1674746278103; 
 Thu, 26 Jan 2023 07:17:58 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH 12/14] drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
Date: Thu, 26 Jan 2023 16:16:16 +0100
Message-Id: <20230126151618.225127-13-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can only be one at a time. Turn a series of ifs into if +
elseifs to save some CPU cycles.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6d6b71306ee5..452ba32699b2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2150,16 +2150,16 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
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
2.39.1

