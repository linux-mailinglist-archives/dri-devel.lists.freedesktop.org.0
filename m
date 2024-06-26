Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C7917A29
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB3110E7A8;
	Wed, 26 Jun 2024 07:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PFxH+dGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638DD10E7AD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:53:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42499b98d4cso13922545e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719388398; x=1719993198; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T1area+MaFWUDermRoLera9+4OUrjSIeeXP24Yb/vWo=;
 b=PFxH+dGUXKwI1peYnfb+6Gaw9Yu7fg0KEta8O6sZp/jbjdAbd2YwiSO1sDykJD9pPJ
 zzwDpL1ZAT5jZ+M7UHXi47JcfwBJn1R40vyrDw/12bVFniTaRJBqWOpMzWAiIXnIgtxR
 GWqwVAQ/NvHu+lovMFHHigmar3dLww8GrJm/JakPkzVzLxqgrS9Uf0PgXqJ3vmxTpsda
 DKp/ePWe3a0JESQhGKPYL5OfZrK9WPsKanh4z8AjoVCe0kYF/pVNJJ1Zm3s76FIHqFKX
 8S2vYlnnoaTub6QB3IOPAK8j3BIH+9jvI//jXgOgKbgS+ErcdF1Wd4Tp/zXmnGV0FdHf
 qWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719388398; x=1719993198;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T1area+MaFWUDermRoLera9+4OUrjSIeeXP24Yb/vWo=;
 b=bX/l/4aer17JDsyL1qUR4q1kGh9XW67GrMYWSVqWYA4mAsgQOBkHvLbYncXEhKvZsz
 dXYBd4oqT2h1Rvcd7ZP60Ee6YHsnH9Relcw2fSQLCOjb3TXAgMucRRmPILu6hxe49I7e
 +/dXkiQzsjXu+FNRRs867QLQSKnn60c5wQFB1nULyJ0+KSgJZlY1xFbqDiLPMnhdikiF
 1L+jYNezjq3kHfOWSqpUCcWd7naWKVfBo9kZRVpbJUfAltsh3itW7stz1F01PM4686Oy
 5WDG4y/ra0FSnI7WUITpiQuMIVj0LM1zrbVx3hRghZ+7iS3zbWPLWPTSgAgDFlR1q7+0
 uaog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmi2hDy9cwgYUSMOn4Cm6B6Xpv1w+zmwlf6awrHH56YCB188hgirvMro3oBJOWWt1m8lIV0MCEsDV8FRErchp2BgjHO+1dqXLbgVNw4sXh
X-Gm-Message-State: AOJu0YweZXrfi0VMXCa11H01ElslZo6uKNEnCQR0I0PyQ/kEKiULQiJ5
 ywqouXIxVu6Zb5TqjPiw62LVeRJmeCm/RAd1zh6V/VqmjRXuU9EyXyg9sZJU/ZBpMoc+kT1w9xc
 mF4w=
X-Google-Smtp-Source: AGHT+IEKkrz0XZ/FGEkp/KPMY67ejxiTdOZ2Rr+AaQrnwx9g/w+KQHYoLnBiwYIQALSatGlYPyNnbA==
X-Received: by 2002:a05:600c:54e1:b0:424:9024:d45e with SMTP id
 5b1f17b1804b1-4249024d4c3mr52628185e9.4.1719388398204; 
 Wed, 26 Jun 2024 00:53:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c846a8f0sm15220405e9.42.2024.06.26.00.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 00:53:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 26 Jun 2024 09:53:16 +0200
Subject: [PATCH] drm/msm/adreno: fix a7xx gpu init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-v1-1-ff0a0b7c778d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOvIe2YC/x2NQQqDMBAAvyJ77kKa2qT2K6WHNV3tHowhG0tA/
 Luhx4FhZgflLKzw7HbI/BOVNTa4XjoIX4ozo3wagzW2N846LGuSgLo86t3glrRkpgUnqUi+Vpz
 ThhKl4DAFGnzvRvI3aLWUuUn/0+t9HCcYzCoBeQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bUFnBCaoWkPM+lGdjHQoFsITf35bWEg8TZpL0ja8QGc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBme8jssCMYsrSvaqz+TTf5G43VRs8w40xKxUjTe1ob
 Oi2BEbKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnvI7AAKCRB33NvayMhJ0Rl8EA
 CTLPfyc5SoiA/wMMY88mBc4/bIBJu7jvcEe9ZWRP2vZij3UYKZ8m3vriQasDVE5InlydLVkg6NPDya
 x9k0G9sB4fUth9fcDSkLPwYRNd/boSaBKHdMVE21RYmI6Ey6j5c0l3Y3ImR8qk+pUsaWThoXD77zaW
 FS6C7W6uBc2kANexdq5RzGjmKsD18q8GFrUA8e7sS1q0FODY5NmLoCWt/R25Xb2V/CcRkvXuZpbdQ3
 vTtoHxb6D+BhciasoGg5vxGDaSjDboUT8pGIUGE7rK29NDz1GLCqDWkIQZ7xG5uOqJ4BENhwwDHCSb
 ibaklVDg9H4cCZNguEoeEaFezXp4PAExiQocS93ubxtyqbYl+fxn2NZLZ29s5TYmfElTEaN4k11XIc
 l6c/Z7TYgDKfgwte0OGXaRP/cEln/0NJddsOnAqHEJMnIPoD9jbEtr2HfaaJ6Z3W1XPIyHwDY76P5y
 SMAPFgdVKK59j5ySK9ykgRqnr0AHXgEfhcMCx9Vm7dJA3skalFaIKirgQwUYCpsXugXZRurkoiF8h8
 0q0jccQYhyd8OxbW3ONfn39pO/JcDEkbyRIDy9H2TKxQSOLuvJ9XX/86OLlHtcHqFH+4vlz1qsNupc
 xb3qT/JL4cSCDqcqT3oDtgXeAovGoZ2fN+62prqnqdZOSjhjaUECz4L1rgVA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The gpulist has twice the a6xx gpulist, replace the second one
with the a7xx gpulist.

Solves:
msm_dpu ae01000.display-controller: Unknown GPU revision: 7.3.0.1
msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.10.1
msm_dpu ae01000.display-controller: Unknown GPU revision: 67.5.20.1

on SM8450, SM8550 & SM8560.

Fixes: 8ed322f632a9 ("drm/msm/adreno: Split up giant device table")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 1e789ff6945e..cfc74a9e2646 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -33,7 +33,7 @@ static const struct adreno_gpulist *gpulists[] = {
 	&a4xx_gpulist,
 	&a5xx_gpulist,
 	&a6xx_gpulist,
-	&a6xx_gpulist,
+	&a7xx_gpulist,
 };
 
 static const struct adreno_info *adreno_info(uint32_t chip_id)

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240626-topic-sm8x50-upstream-fix-a7xx-gpu-init-9fca9746ba73

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

