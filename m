Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F051596659B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 17:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660EC10E543;
	Fri, 30 Aug 2024 15:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RMe+O04C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2B10E6A5;
 Fri, 30 Aug 2024 15:33:28 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a86acbaddb4so238507466b.1; 
 Fri, 30 Aug 2024 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725032007; x=1725636807; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7cYv3N1pFipBqf+1lX2kupGjS5LmNs0GYGfXh5AxTY0=;
 b=RMe+O04Ckf45X/q/oLEPMJIfqhHy2LIiA8gv6lPLDCYrNy9n4ObxN3doYUi9Rdfa5t
 dto8ADulDe86d+JizrznpfzILBjVcmIKTHzAw8VDY1WER82INkjmXhfSwY7ONQC2YGhr
 IFrKdT0bhHbFwJsJJhb+vS1XRwQVv6gWOaMwK2/jj72cl31rQFWMXDXZjH03cw3rVQy6
 luuQ0848FwKH/0X4UPeJ4YGqOO1bXZg4I9InszmfINc9oLaNj9RyL0InE81zOLly08wk
 9hA7LnrPNUCFJyaMm8ZSXgSZVQQqGYvuK8wCgY3kKaRgVNEtLBwhwnqVbyrQYAE59W79
 uoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725032007; x=1725636807;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cYv3N1pFipBqf+1lX2kupGjS5LmNs0GYGfXh5AxTY0=;
 b=tu77ybxp1sD3LbvJ3CCgwduhv8NaCR4jVB992jhi3Yy6X5BdcC7raIg3Fn8GI6K6+o
 fQTQQC+77g4ZPUAr7ZgRJ3B5A2QaHeYo/gw2+V8OaOmOJLlkNZWgkFk3R+zKoy2wz/kG
 bMdnoY0skfA6h99TlJzclhrOerk+vvaideY5Swro0hR3ZEpKLvNkEME9gYStrHSiSi96
 85QRz7APlfKwpOVQjFkyEgjj49TnVAyUq+iisSKfvtdyOlOumbrlnT/tFqDMQm5yLJn/
 FoycFJ08bCUa528SW0e1IdNjM7WWldA5U/qJqGfBBAXSvP7Wc3O1Tvi4QPl00lPCc1Rb
 Fhqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPFMrxhnWtled0BFZ2GMN8/QCwv8QUpInAnD/uCJ2FTwePioih0rqa0uBA5C6TwwuQr+1mTcJT0O8=@lists.freedesktop.org,
 AJvYcCWRxEwCX+Pb37I9D+6u1Osmnpah9WOOZPWLE2tG7HeS7LQCvFHDrlyU2mZVVqjssPaN0oRXYjdwHLK/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU241zfn3Rb9Nk0ejpf8zLQkf4NldxWKFQPn+9vHLiwmButAGx
 qxNB563LrJB12iojHlkkPC5ep6VX8tNWFo0P/ecH7PA75AO0i4Cu
X-Google-Smtp-Source: AGHT+IHuDC67lqetxy9o227OrMKM3T5NnYaQpLkADrw68HKXG5WOBv0iSWqmatubTcOO5U+i7Zoh4g==
X-Received: by 2002:a17:906:6a28:b0:a86:442e:6e10 with SMTP id
 a640c23a62f3a-a897f78950dmr512029666b.2.1725032006314; 
 Fri, 30 Aug 2024 08:33:26 -0700 (PDT)
Received: from [192.168.1.14] (host-95-234-170-37.retail.telecomitalia.it.
 [95.234.170.37]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988ff4233sm227157866b.25.2024.08.30.08.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:33:26 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Fri, 30 Aug 2024 17:32:51 +0200
Subject: [PATCH v2 9/9] drm/msm/A6xx: Enable preemption for A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-preemption-a750-t-v2-9-86aeead2cd80@gmail.com>
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725031992; l=1015;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=MwrIm+imYoZ8N/YJQUJ6DlX24C1Ou+/mKpHwjs54qbA=;
 b=dAbILMt2zEkXopYpbgmokhdMBQr4kKjJXBYANhGu6QwWsrTxZukmd7VQrZIG8FsGSnEun092X
 7iWcSUYnpwLAECHEA4/yNMO/EywdLatiKyHUEQYoey4WWeh4fQLPQQP
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Initialize with 4 rings to enable preemption.

For now only on A750 as other targets require testing.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a2853309288b..ea518209c03d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2609,7 +2609,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (is_a7xx)
+	if (adreno_is_a750(adreno_gpu))
+		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
+	else if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);

-- 
2.46.0

