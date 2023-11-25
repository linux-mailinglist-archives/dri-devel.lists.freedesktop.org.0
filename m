Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA997F8DBB
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 20:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563F10E02B;
	Sat, 25 Nov 2023 19:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3911710E02B;
 Sat, 25 Nov 2023 19:12:03 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6cbe716b511so1973855b3a.3; 
 Sat, 25 Nov 2023 11:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700939521; x=1701544321; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xk3ugOVnpI2pTDfmgiF4q+i5xA4WKTzHI6DOtI3zDs=;
 b=eaqbmPRN7ptQGREYZWgC5/F1g/JYdmcndZlg/QVgsVEipRJat6bFGvb4yX0eL5piO9
 0ZENNo1vUiFTmYJ8KtUZ8nMgSrqolZGAWoHB/aISn/DbiYAf4e0hPkTgnkBmJ6UA25nx
 JYDCLcZzk9081XGicyBc+gBcFm6maFwgomXB4BMatxhgqQJBYcalIPtNGv7w/XRTGWFi
 bTNs2oqq1+ulrNEKLErlDk21u4+WSTsZwBgh8lW2qhEQkU6xqkMgevKQzNHpg9AtXkfa
 xkr6tQy6g6x5SpmXMBrr5FhV1mA2jesZlaEzbfAhN4553+efxckZ/Nil6++DtxZwIUsR
 8yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700939521; x=1701544321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xk3ugOVnpI2pTDfmgiF4q+i5xA4WKTzHI6DOtI3zDs=;
 b=bNavIREWj3h0GgguLnrxhux08X/Lv2GCYx+hI3Oy99E0Ro7O9RlqIlwrYTdqtErESp
 mmrVVFDcPcLgPWht+WZOV8NxBt8+7Ac3w7soy6pCQPGc+7A6W4eY4kGiTPHZ3VszDkZi
 EsrSY7hVs1kz1NNMWS4MB0NKiujlWJ80tATtbhNu0PS1ZNXIiwpCi6hAUTB/SFGTJo6k
 w1i8YVnyGXLl/8/ghJe/Ki3qjz40ApQDjNxI+DkjAmY6LwwlWtzegnkXHatknwCj3+LZ
 HAZgWVIpBVOR5Nyl4KiUqJyV1qbpDgyqBCinIg7TMhQtCSrEZ1LvQ60cuIxkGXvPHNGM
 sOmA==
X-Gm-Message-State: AOJu0YyXVSvwk4dY83gvyq0wNNNQn33XTYqKkGAjQ44XNmUbauCoQcmo
 Gis7Nq0+8Qvm5wqPxT03MXAsEO9jx4I=
X-Google-Smtp-Source: AGHT+IGD8naTfDUiWPBeJnR+Yo4y/9rpaGtpvxIBDO0LHhCEXLzfOPt6fvX7M1GGBFGomBPiRZcStg==
X-Received: by 2002:a05:6a21:a59f:b0:18b:558e:9ec7 with SMTP id
 gd31-20020a056a21a59f00b0018b558e9ec7mr7674598pzc.11.1700939521548; 
 Sat, 25 Nov 2023 11:12:01 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056a0026db00b006bd26bdc909sm4713314pfw.72.2023.11.25.11.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 11:12:00 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/msm/a6xx: Add missing BIT(7) to
 REG_A6XX_UCHE_CLIENT_PF
Date: Sat, 25 Nov 2023 11:11:50 -0800
Message-ID: <20231125191155.5375-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121162137.60488-1-robdclark@gmail.com>
References: <20231121162137.60488-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Danylo Piliaiev <dpiliaiev@igalia.com>

Downstream always set BIT(7)

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8176ea8da7a7..d10b22eeda74 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1782,7 +1782,7 @@ static int hw_init(struct msm_gpu *gpu)
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
 
-	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, 1);
+	gpu_write(gpu, REG_A6XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu)) {
-- 
2.42.0

