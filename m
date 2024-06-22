Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A103091367D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 00:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028D110EDF6;
	Sat, 22 Jun 2024 22:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NMQaWRu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6573010EDEC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:25 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so32636241fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093743; x=1719698543; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CtmbOfPaOUNb/xUduVMXDOuWoblMLauE6Af8hrHbRgE=;
 b=NMQaWRu8A1J5ZoykQqyLx9fc2bFGLle7XUm5y74jqnUc26w2urhiTFBop98Jw/UdEu
 1A48CnO2AL9AYWSEu6TjTf7g9RlsndB3MsfdpmuY8xMH5f9XGIBj9KSBrsmyCefqhYqZ
 vNSelD/BBh2KLnS005KxOYSvE+9/ZhTt29hRY+285Q/Y/vTscKVs/oOy82L1XbXURn63
 zggjMBAek+oLkcUHHAgrrUqIZEoIvtTKD6VbGKEoIELHZ9HlXtSjxisGMAx00qAy0xzj
 yh2/X58mS6CFKo19aLpChI3YZuea3tr3GXa5lNNHEBTCkNybOHsC/VyPca//pA5tJ+fr
 Es0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093743; x=1719698543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CtmbOfPaOUNb/xUduVMXDOuWoblMLauE6Af8hrHbRgE=;
 b=WNgBjw6Dca8fa+mWmUeVqPk1nhRnbBIiAsCYeqHHO3NbniNVunfTcU631tlpQrYW4V
 x08FF2ZgkorYycVY/88mg8892W6jNKBCNmmQDFF/PSXdFLRdXM7oZOhvaxf4tWFxjCzI
 80L0YgWRnbCbiw1+bN0Jm070fmnP86UaQ40Lz/FjG2ZrgYgKPA3sj6WriiWfkvjPou+x
 aF9lbg6B+eInnvvSCojIg1YbTAWtbIsmKfT/zDugNYudQe3TPLjlX8iclrMpeofoCsVc
 B4sZeMZS65YSjVNQBQKAdRXvTnvbPFhWZnLYs3zLPHBZ856wqXqFp9CgsFuDo/tZ3U6C
 jLUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzx2nD4N/5TAyCdyouCCgvB7NuU29uDYYl3d1RSFF2TR1Gih3lUce/tn0c1WkJHRLJOYEKOQizHe2eqbmQ3+m9IhanQYCd6o8or/aokaxO
X-Gm-Message-State: AOJu0YyN9z8Z3RwW9pm1gRKLsPHgPZpVwmNqgIHQIJu6qUGM3/PxLcWE
 EtQ3tCZLuXyj6MGS6yKmALJe1gIII8/iKeiKxKYC89HJO7biwtkP5frg2xKZh/NVgr4SW5ZeVCA
 X7GE=
X-Google-Smtp-Source: AGHT+IFwxLQa126PcNr0V293dyG07jdnFORLo0TrMcMkOvdVXZTtsEVGMDFPHgMRWJ3JGAyugxXTPQ==
X-Received: by 2002:a2e:730b:0:b0:2ec:5933:a624 with SMTP id
 38308e7fff4ca-2ec5b38ac4amr4414821fa.25.1719093743672; 
 Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:20 +0300
Subject: [PATCH v3 07/13] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-7-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QxzkmaQ0F6u3Vo6vT1cw2voI5Zf/br+EPvgD/mm50S8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npagDRaaHh/etYkVpsH1SbuurrBPWY5IUbT
 LQyDC7RbTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1T0yCACmTbalmvI7VNRR8xt6vysRhyetuTY3yYoAhuQmrYq9Kc/rqU8+HkB7jRrjHNfAa7O7Vvq
 BQTnhAqZonSES2XQ2coTU0c7OjZ+p7/TaxqwbYZcSuzeJMArHsr8knx5Yl7B5ssga8SglXieMto
 CX/HoukjQfeVmqLolpBwbMbyG3JvXR+UJeYKAODnNdPm94Lg0Z8VoAZY3ksdXf8SNIFcaS1WMJh
 gDUmAo9WqNskxyMYujkhs/Q9fKGGYuAuRraeMnt7WmBjFuvKCa2IikDDTh+nI0UCfXbYRIT3zZI
 uxYEjV5LeNUUlpAhxEQiGOkD6DKwgRtUi9cY2V9y2kb9LDnb
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

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240..ebefea4fb408 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.2

