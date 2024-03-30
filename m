Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D389291C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 04:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45CD10E360;
	Sat, 30 Mar 2024 03:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lZJwtb4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371EE10E350
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 03:53:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-513d717269fso2894446e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 20:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711770803; x=1712375603; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4HhadJWBqLYlQ+JGSckxPKjGceAzGEjZXZw9f6mT8Bs=;
 b=lZJwtb4gYsUQgrFryy8kCTrBiV1euiJgB2JYHsXZzgiVXKC044Tap+lqlcP8rshfSH
 AzMYxLUBVWZRVudk173sOQcI00DJrHBh9LF4Z8iKqMDD51HKZbfKKlY3Ke7y88b9lfbH
 yEdDaH0jP1E2ynOlghAo8uU5K5GdENGmbjv3NvQuKQfJF4C6UqyUUfO49RME0eK5bSEq
 s7PImlzy3P87PdRfzoaybt1APJH7uIdHngzX2U51vueRy/OftmzAQAoRfuJyeSlBC8w9
 thW2rhmbAjdxmhL6t++YSZrTHhOYjoa+7vdYARax2849i9o1txCaD5bpCRWgiZEkVjot
 thEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711770803; x=1712375603;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HhadJWBqLYlQ+JGSckxPKjGceAzGEjZXZw9f6mT8Bs=;
 b=rlFsCOb/1wrc9Lsrt5B1OfD+haRobPG8k6+xBGIsVM6h88elK+HXg6yC3tQFH+gZYX
 R8QmtFDmY+Ty09FYsQYpY36Em6dCtbjBVBnEF0NTQyMt+okPJ72/iUogz8nSSeSghsx9
 TA6mbD52lAWeIeENj/ao8Mb3eJFmXa34JzSxqgipv3aXHhxOKOklrU1eVyIKlT6ogJJ4
 tTQUs8EJekJ+5Y+GbCXbhSA5BHrStM/2G4Pif71DwUsFOMPAMLNxq9sPrmWorKdWH3cZ
 E/VCabqFMHYOxy2dJC3+tbI1MdxG9AMx4Tg+OlU5zUMbwUqoJLzkHHiE72yufs0Z+4LO
 977w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtCIOCQxMx0ZuedoMiFys44Ol+bFstHjCLGl1YFHl2eqNkBxFqzzjO9GJt0ZQa7gbw65sS0bkUl73jxCA+GJTILe/D3LIZh+/xGOmOYIAz
X-Gm-Message-State: AOJu0YxaOhrNn9I7L3zQtmjiVZYbGualk5KewoudHIqmjWlXzv1ssfph
 7ToKOiL/FvRRnJzYQPY20hfKa4tDXMnouQ57/rRrd1Y4ROf2G/tHBfnaO02sAWk=
X-Google-Smtp-Source: AGHT+IF/BdmF72FuCVFZpAOD1mbipHH7TP+BtxKqyBNIdVW2qZKlCm4ZpvPVNMKLIuuO2I4jDwVshQ==
X-Received: by 2002:ac2:41c8:0:b0:515:95cd:6802 with SMTP id
 d8-20020ac241c8000000b0051595cd6802mr2339097lfi.64.1711770803231; 
 Fri, 29 Mar 2024 20:53:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 g6-20020ac25386000000b00515b9c40223sm799275lfh.157.2024.03.29.20.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 20:53:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Mar 2024 05:53:22 +0200
Subject: [PATCH] drm/msm/dpu: make error messages at
 dpu_core_irq_register_callback() more sensible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-dpu-irq-messages-v1-1-9ce782ae35f9@linaro.org>
X-B4-Tracking: v=1; b=H4sIALGMB2YC/x3MPQqAMAxA4atIZgPV+odXEYfSpjWDVRsUQby7x
 fEb3ntAKDEJjMUDiS4W3mJGVRZgFxMDIbtsqFXdKK0Vuv1ETgeuJGICCbbWV9q7vu0GCznbE3m
 +/+U0v+8HNtHKY2IAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rmxrPkNwcnQ5eicm+waZz+484lVk8rSYWNsasqg9gss=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmB4yy6zupNXEuQMfp1M8C95DUpWr+L4OjZVQIe
 zfcDrGI5WKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgeMsgAKCRCLPIo+Aiko
 1eP2B/46YLDaoiuJtieSNIpLNqjx3fLskcjuMG5mbDq5Rf0uWWxujyg3SEK5Veffez5b0HQPOu1
 JKFFfJgSRoO3wKRLtjin6cz8CG/86mtQngGOkQJcseDrDPzFNMejSuzT2G5Bt9JMrGGj+VuPWTa
 7DkgUEPnd7gutF46/ePfykkNyUaZJZvPO/osEc7oK4/hompeGCP6oHohlDy1QUowGGwM1I7n/Vn
 rPxXQJBDO0+dHLwOHxetR8Pt+MMYNVpFRK4CbSQVtuWMm0mvQDepUIW7HESyjtn2osuxpHOyxH7
 r6KqVn4wFleYuZyx1truyyVRbxSn4S3zArxd1EaYklYuPoys
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

There is little point in using %ps to print a value known to be NULL. On
the other hand it makes sense to print the callback symbol in the
'invalid IRQ' message. Correct those two error messages to make more
sense.

Fixes: 6893199183f8 ("drm/msm/dpu: stop using raw IRQ indices in the kernel output")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 946dd0135dff..6a0a74832fb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -525,14 +525,14 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms,
 	int ret;
 
 	if (!irq_cb) {
-		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
-			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
+		DPU_ERROR("IRQ=[%d, %d] NULL callback\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 		return -EINVAL;
 	}
 
 	if (!dpu_core_irq_is_valid(irq_idx)) {
-		DPU_ERROR("invalid IRQ=[%d, %d]\n",
-			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
+		DPU_ERROR("invalid IRQ=[%d, %d] irq_cb:%ps\n",
+			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 		return -EINVAL;
 	}
 

---
base-commit: 13ee4a7161b6fd938aef6688ff43b163f6d83e37
change-id: 20240330-dpu-irq-messages-5cf13fd7568c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

