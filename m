Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EE970920
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 19:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789D410E294;
	Sun,  8 Sep 2024 17:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hf524hmU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1110E244
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 17:59:12 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53568ffc525so4918370e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725818350; x=1726423150; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SEXqofNVqvoQwq+AHz7mmjOEek3Vm7sXx+dlFFPiZAs=;
 b=hf524hmU+okvKcYVKFU7PxtacL/73yrmzALK51CVhDiA1JpyJwCmJ9Hf2OEWWbUZDB
 uhxRPHPC5vjMW4OWx09oByPXf+z4vw3aKkjePDpcl8XT/KfaNLH386mbX4Flw4C7Djo4
 asxojSBCE6oIE/BoUHjRe36cAT2Dlwe7BMjs09bt3A347LoJYsmGcRlQ0sY5rFwQgC2w
 Vw5uxXJDrx10Tu0jXemHM4Rl/40ETkfXzu5gIxvLEq33msVj5C6T4XfRqI+Ij/xEh3E4
 GTCmr9dB3paT4hwdTqidj1Ap02IPpPPHhqYaRovUcrnxnqUDIlFw8U6Mlzrinyyo/jg0
 ebrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725818350; x=1726423150;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SEXqofNVqvoQwq+AHz7mmjOEek3Vm7sXx+dlFFPiZAs=;
 b=J0QrUVufsGcYtp27WZcfs9YzNxf6K9uJIcLicAyJBHsepUK3kofUnLt6QSdEmvYTb1
 GdCtgVuy+Q9Diye2V6m+cbqHKGhb/dDmWHpYYsoE2tMdWd/eO64r6JxDmbQJ1ibZ3d8+
 r+OyKRBK2sTWFkppL52T7u5I/dIKaajXsFPmtNModKwN76hadk6gu23MyUqSwQwq8Gyh
 4WBWgggJEFOsFrDPComxVLGlPPF+NTNqemJGfaez9iSnph+B7wqJtV42SPS3IPgG34X3
 dCN0JEf7g4t3jC7gTHH9u0zNhxdEaomkO6C2k8QDAolSAt57ceaEbo/1k/6g96RGqUJI
 DhZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgyzgofpIPi2O+LyL+DUloPP+pXCS6t2J1CoUum1y0wSv/YuRddWoXRwQBm4euMApCsYh94figYz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYBdkvWeIz+A3iZ0ouk0fiSZy6oacwaymeF7SGG62lQ4PkvBq5
 FWltWgxeI5pim3kXTCqFA3maKegWhoEC+/0k1cU2MPA6MPYO443Rg+YcG3x6ZPw=
X-Google-Smtp-Source: AGHT+IEJJSPQfHQyAHzH/XtH4ap3soyFL6w/2TJreb7bvtY+yZ9Cr18RM2/lxkp51Wa79pSkVKpIRw==
X-Received: by 2002:a05:6512:108b:b0:533:526a:cd08 with SMTP id
 2adb3069b0e04-536587aadaemr6274831e87.14.1725818349192; 
 Sun, 08 Sep 2024 10:59:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f90d9d4sm482814e87.296.2024.09.08.10.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 10:59:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 08 Sep 2024 20:59:07 +0300
Subject: [PATCH] drm/msm: allow returning NULL from crete_address_space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOrl3WYC/x2MQQqAIBAAvxJ7bsHUg/aV6GC61l40FCIQ/550H
 IaZBpUKU4V1alDo4co5DVjmCfzl0knIYTBIIbWwwqALhVLGyC/621XUJqrDWqmVDTCqu9Bw/3H
 be/8AV/uMl2EAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0jdGk3Q3+Sad3aXUFv1B1JF79Let28SGgOiB3qDz7Nk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9rdp28Onojm/uTRETlD1z1nAvM69cvbpy3ZfPVCpjdb3
 Sy9Jwk6nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSEwI+/+CU2XLJtSn7c/9
 oS7/K2geX9YxPzXv88ILn7EGV+g/aAozWdhj+XHqRGsl9UuuKzIflAlkZmSXRuUv+zjhGEP9B5n
 /B7U+hS8KlDnnVOLbuNRv1hnX/ip/dn6WHL34RW6i3ivsV91SN75Todcmnqswr+jvhka3imXBFx
 OjfTInTK1OfOtYfOOU91dj7sAIFcFnSyNuNyjPZTXnKF100+BOUZPFzhURZ1Mz5Sff8Ttsq3fv8
 KOgn+/Wypl8SJmhttyaKVCP41h2c8jLTPVGlzNvOPXXGa/oDwj6klPuyy4reNt28cmM7dYpt5Sl
 j0guC9SXt9HaXHnoVhDvRZEPyRLnfPlfOoUsvPlu/gkmAA==
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

Under some circumstances it might be required to return NULL from the
create_address_space callback, meaning that the driver should use global
address space. Use IS_ERR_OR_NULL() to guard aspace->pid assignment
instead of just IS_ERR(). This plays well with the IS_ERR_OR_NULL()
check few lines below.

Fixes: 25faf2f2e065 ("drm/msm: Show process names in gem_describe")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a274b8466423..47803f410dbb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -833,7 +833,7 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *ta
 	 */
 	if (gpu->funcs->create_private_address_space) {
 		aspace = gpu->funcs->create_private_address_space(gpu);
-		if (!IS_ERR(aspace))
+		if (!IS_ERR_OR_NULL(aspace))
 			aspace->pid = get_pid(task_pid(task));
 	}
 

---
base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
change-id: 20240908-adreno-fix-cpas-48f3b992439d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

