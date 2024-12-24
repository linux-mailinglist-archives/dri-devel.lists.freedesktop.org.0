Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878199FB944
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 05:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D56A10E342;
	Tue, 24 Dec 2024 04:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EMoQFYC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD4810E342
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 04:26:31 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-540218726d5so5016919e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 20:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014330; x=1735619130; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aIe3XSZSGvLB3f3/ujUeMlqecW7y1Be2ynN7tMKIjvQ=;
 b=EMoQFYC06wBlJAkiIK8rmIPp/Z2lBxLKlfId0yRqa2Uvp4CFkcZUjqbDAUtcgKOar/
 wBAH/Q+g23laQ5wVhnODNUfARjD1nhUCeAodAKi1sTZYSzyNyVehGyUACebg6KdPWDvO
 SNii1eAr54T0ze5dcobgZfNpMYbskZSs0sjtVR3/SSLJuDhAYboP8AQwIo9h7Jc4iWya
 +ZHvHGxqMgWSjeM/ID/QVdJcVDlOCUHyIyvgmlCMUIhvgICPAvug7rU3RYDZMo/U8Cyk
 LyxWjePPkQlX7b1BWhu0+OCvXwgKMLehcpj79OWHYvwYolQMSatYOkmWm8Ueq4k/ZA1b
 tqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014330; x=1735619130;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIe3XSZSGvLB3f3/ujUeMlqecW7y1Be2ynN7tMKIjvQ=;
 b=trIblUcUuUiQ1/EYv7CfFt5JTPxc+MijopCpbD3dZuDWLGYjqMM8J50g3TbI7f844h
 zuBK0JFDp4kSwht1gVgMw0sHMGeQ3wdDpsZh4q0imkXPZjggBh/q36VK03I6pYhpjaTn
 REtqOLAGKSG22gS5Df4bCZPreEgcWfgaG+0kvDd8bTG3viy6vb0bhiqlvqClsPhxUkbG
 q15MpMlDKCFsw05gtgp7Gd8V0exxz9aJ34ITbBq4hIsMaOKHBcj/j7SBFoUVvKqvoUZL
 ghbIyqWi8xCPMEH0CwTF9PAJuq63lqBb3OsuoKKlZhQcsnwsnEPyWiGU88F27PWfzEib
 AXHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ZEWGdjl2j71Z9otRi6ST2YDtvMk2YgHapp2i4i3qk4JXYSRqcec+JPkaRs4HdakduoUahVbMyFU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+yBUrSiXlYVrePTpmmfHE42pmqopxImsxihglmiXGYXZzMWe5
 zXiVzWO43im7L+K5E5d4AoQS25AbdYJ3QaGiT07E8gLLw92ulf6zPmZkF2SyYmQ=
X-Gm-Gg: ASbGncsJUKxCiP3DdC4RrB+8sz1v7Y3M6hYes2Bp/Ri82Y3myaTarkApnPZOMj07SEL
 weN0ACFSPA0LJzkGPr7WNnlvJLvx5QZGef5UUlvp/VCXdIKjh2MXFIHtezNo4lkOWVrEGqZh6SD
 E2+Wi/h4vMyBSnfBacEYSty6HytO4XCVtEOH5sGQMljysnSfQw+VEkmwiMwKYy/Ee6Is26dgh8S
 cWVWiIgtlAEevgOPY/Ku8OPOZT7ciVirWnmUTYCkf0zfoi116r+NvehY6S4euwo
X-Google-Smtp-Source: AGHT+IEANYIDE0X04HPrjL1+BJxMZYcU3mesc3+IHhUPhdevtrVztipsqZxOVEXvb80N+0BF64sVBA==
X-Received: by 2002:a05:6512:1254:b0:540:1e7e:ca80 with SMTP id
 2adb3069b0e04-5422953fe81mr4835327e87.30.1735014329647; 
 Mon, 23 Dec 2024 20:25:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:25:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:20 +0200
Subject: [PATCH 4/4] drm/msm/dpu: enable CDM_0 for X Elite platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-4-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KMSI0SnihNz+eKL8svNhjt09BuUQq15nueRJ7bxyzZI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajeuAZgwTwxlpoXDIuUeCt0MYa/XwinZFH7Is
 V1HGOb4/tSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rgAKCRCLPIo+Aiko
 1TQTB/0bM54Hkjy2bhX0sAcbFXZBcXjKgYPmclx0ToTMTOmZOCVUQu+HKRfrxZlGs+Wgin2CssV
 OeOzklzqRbDLuhMzuAWOa51oIS/qZmNu2C5vQKo1LpEKcjSy/6ooJ/HFYVTTvyktbOCv7rNYmAG
 HXDCJOXPw/Y9d8Y8wM2anbaJykX0OUBt/j78PUVR8fAl/LxURxOzEPqfrD3RzHgANycgVmN+vFn
 HP5KBfhFEnge8uBJnyYo34lwdkAjhWw9jIxqRCi1pODx5yEj2MuDJVGx+qNlIahAaRKYTV3s0Kw
 HEhtbtwAuYXwQ63wuCZZv/SK/jibpysJvmGUXx08XEllQsI5
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

Enable CDM on the X Elite platform, allowing RGB to YUV conversion for
the output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d61895bb396fb4287e9b41807a3bb0cdb25d4e25..e68f5e21f3bc7fb9e07f46d6b4e68eb03a825683 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -451,6 +451,7 @@ const struct dpu_mdss_cfg dpu_x1e80100_cfg = {
 	.mdss_ver = &x1e80100_mdss_ver,
 	.caps = &x1e80100_dpu_caps,
 	.mdp = &x1e80100_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(x1e80100_ctl),
 	.ctl = x1e80100_ctl,
 	.sspp_count = ARRAY_SIZE(x1e80100_sspp),

-- 
2.39.5

