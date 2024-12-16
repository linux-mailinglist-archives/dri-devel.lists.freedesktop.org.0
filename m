Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77B9F2BC8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16A710E09F;
	Mon, 16 Dec 2024 08:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rQmtKiPp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB5A10E526
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ffd6af012eso43389541fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337654; x=1734942454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
 b=rQmtKiPp+tLki2+evsN71n5C39zMqZ9MGjQJ10fUTP98j+Rq39S6LIEaelNkMlatTp
 RH2aIrEHdQfUMWuAbYmXNlPZ5CR/hXNg5bAkdNSWHf5ORwI8w2mtvu2ezdE6ijVEyHtW
 bDsqCzc4f1RnopWblzFkcmcu/VgZOWwAhA/XQMVgbTr1V1b3OKcXUN98hzxqHFzP1vXB
 FUt7XaL9QRNV1xXXv4LxFXiHZHVjQggyOshUtKFryXeqMngrUE96tCP4Wj32BcZdZ3ql
 461ZyBAYI+ZkWFlJblt2YMp+xZbFXkMW37L7bPSi4Mkc1vo6oQRRqcPaL2z3S8hie30P
 l8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337654; x=1734942454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N9TgW+CYKyvw5H3rblc158ZUNsXRwqGtSWGiWPsFQ+U=;
 b=XS8NTGVQ2xwdbp0aBtvl05oBz0MZeQNyOqXVEJv/SaVLh0hqHUrrf0KPzFeww81h/L
 i4/EwDOcLms8aTHXNxb0+VcP3nvniEPrWlYAtuzeI5MUjg8gS+t9ZqQNq/Fr7EZHQNGj
 DCsL0EVkj+rqOMlTqlleQZ36lkRmTNHjDkNqNP9UIGHohv3g6o9FSNBZcIk1am3uS1Gg
 JnbCRtKepB+jITjsHeHE6dYbPp+OtaU1/Ry+QLimSvUhmf3OUefeF/1c9gsskL0K7YmQ
 taThWLBwB9DeXxB22WbPBVajjzfJtc8u/KuMZ6xSOBzNASlmvh8fMjr5njvWXtuCnEvy
 xQ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ZvKfFfAJa/jkhRTMrQiihg31Zh1fghhyFxSNzRFSEiMDWoncLdPZe8dsmvY/8IicsMa3c4qm3iI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFccojsVsOfqvoWK3TTA2enV3fHU67f72dbdLV1DLSiJUScZyo
 syIWYAH1N+oC5UWfg3n4NyLA3cjwQLSuT3FIXdWYU//dFaQv/LqFpakZOLrS2Eg=
X-Gm-Gg: ASbGncv0l5H9wUrZHhfe6CWYsp7IRWDBP9eVFZxxUgD2hMQ4mr1GMV8ZXdWVX7M8ayM
 7NcZjYAP9pcoiWfWfsMix50DfQx/e6G8XU+OewRGGDj9aZPszrC/Kx8XSRlKtFyEYZ7Z8dKKBzz
 w1Hpqf7vGDjAwSN/2L9Hb/OnDertFNS1k0P2SblnayunX7ecFwDW0sUlzBei3L6+KLY4oUBqk/i
 gttv8y/turI4UOzyzXgFR9WnrFXtEClzWdJmDHRCjAQ2p5xN4OYRjVR/OakzGA+
X-Google-Smtp-Source: AGHT+IEjxE5JIr4I0Nm0OK3tkP2CuqAphMvXWSvP6WKojU0Rmwh9ouZ5/B23d8RiNZkCJxKI3XPBFQ==
X-Received: by 2002:a2e:a99e:0:b0:302:25ef:813e with SMTP id
 38308e7fff4ca-302544cd566mr44359121fa.32.1734337653638; 
 Mon, 16 Dec 2024 00:27:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:24 +0200
Subject: [PATCH 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-3-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yl0V5Ivn93jx2EQt5ftkkxVs5AyWzNRaoZkPTxOHYqg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsNa4mfff9jlJCLVtKJCVNAAOA4sqhGhdPP
 ZRfeHjaZJ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1R5xCACE0lAdnhvMx22yf+S5fY20DT3I1EtoBvnhHEJOC1FXew7rU/BZ53+LAzPkmEs3vZdnDNY
 kwdwQoGw0qrXMIHK2qbwCAZSSut3s25QfWa7Cd3b29i24/nLx0pptqs1uonxBtwyBQhDUKoF06c
 PEGk/tCs1wYqbPLvR+IDrWg6zK0OGSv9BQjZlQXRM6xBclFYVdXT/3j1tQbBS2HGjGYguN3wjRd
 3c1jGeTe1y7RxmNPL2e4hVHgCvixm/CewFJlsh44yx2hI2WgEb7iQfukYQHmACnAa7K6v2oiMO0
 WpfYKq+iVxIFsQE+pz4M0gvGMdsRFyoYjiJyxTp5ZWIdmUUz
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a57d50b1f0280776bb95f55b8fce9aa8259d7041..e8916ae826a6daf30eb08de53521dae89c07636c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

