Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C44FA59199
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D138E10E3F1;
	Mon, 10 Mar 2025 10:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qEOD6wfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712E510E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:47:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso348538f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603650; x=1742208450; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sR/CcMTKsdlA9AlU4rM5jg8thXN0o1ZO9YRyBCXqGLI=;
 b=qEOD6wfoQmfVplkiMgzuVFJbU8XZs80NhGl01e5rFyn1LIRP3+80Dpbm3+qR9kA2SK
 3bRhXvf/vuPavVNdC9ixROoRVRTnXBQtoiGru7OkF51MBO0Ypg8BsXV+KzL98EkWPiwN
 /Cqc38i3WW9U/GwV6RrNnDCUIiJ3aA+7W13zfZL1nECY4PBAQYVZyU0rm5zALIdrYTas
 qJVihOP8bR4BPUF9TqH5w0PB8i7baCGVXzIl5/u4ZW4xgYeWqckvK7NGFjLIJ8hgSbs5
 32gwB3SR+sF/r+DqdcMMCHH3vqVssE9xqJE+OUR/7C2h/T3UuvF0I4usiwyUuS8g/1V+
 acJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603650; x=1742208450;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sR/CcMTKsdlA9AlU4rM5jg8thXN0o1ZO9YRyBCXqGLI=;
 b=H1MplPKlZKeepUkPI2VMo7fW/+qR98tLo62BVvSYIFC1Wlw4pChgt2MI3KaizB7jbw
 lnajUgACuiMyY2/GuYNem0qIDqFdaj27+JdUAzx7HtNlKD5GmjTTgyxIMyuH8n+zDBCU
 HRIWK8ZJvFFa9M5bl1GVH47xL+2g70GB2AnQJzClVDFeiwmvKgmk8Vm4w58YH69d4IU5
 tQXOkQ9AOejEIamiwIGfNP4NNPn8rpzIH1BioclP78i1NInMT7QZCdijG7BF6dxilVz1
 sU+V+lGM7i7oTyuA7vRSu6+hAda0YzVwOWRx4C1BfxeFCjP5Zd/Sd2NzfLD6lp7+ytd0
 IKbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrGxGu3SZ+MiafslcJIIE0T+NLofq3FV9J5UkBpewAqDLic/vFCyY5uatiAwxU3EiOHSwyeKZ2slI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw58DgkyST+xn8nwVEMrT41d+T4c8/bobBK4j80LQXTsCihKlUR
 6TQrO6cwSldPBbwkgBYaOKqLpITrBl2zUz9NoQwsqOdN/bUnJTC0eg15ySFJexE=
X-Gm-Gg: ASbGncs0jTUxQ7F/u98dfWQaRvFAEX0M9234i1JUt41wZdKw+69TkP/OpvfWGERPwCy
 qTdHhR3i7tilO8stvIWLjzNjuHzaQ92JdM9Ef6NGvTzB6H/T9zj8cW40TGlIM0rKah3RUIa7BrE
 RELkJJIQzgN4Aa8Zr4lIrrsKN/SuFCUGzviasNW4gY3aAuoMPKdgkyJIyQ6/d8D4GoAh7JdP4bc
 pmefabRxLwViGcHjG0RBFBQYWs9VevEnawlCJyPXfCDBw+9HeKZnbE4MUhhJZfeghD9aN/4n461
 kAP6MQAKWMlv6kHwsgbfKr7KoLm2O9aF3lgFnr0uKDEI/McyCuRKS70NfHsx
X-Google-Smtp-Source: AGHT+IG8QM+WxzxCzm0SZiOEb6aIF64Be3WE+Zs9nuUEYTEOzCjQ3A3RPLHlKVFRDpcen2hFRlv+hw==
X-Received: by 2002:a5d:5f45:0:b0:390:fb37:1bd with SMTP id
 ffacd0b85a97d-39132da8e47mr7295090f8f.46.1741603649926; 
 Mon, 10 Mar 2025 03:47:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c01952dsm14227332f8f.45.2025.03.10.03.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:47:29 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:47:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdkfd: delete stray tab in kfd_dbg_set_mes_debug_mode()
Message-ID: <ece8324f-0d58-4c83-adca-7187f730c56f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

These lines are indented one tab more than they should be.  Delete
the stray tabs.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
index 12456c61ffa5..ba99e0f258ae 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
@@ -357,12 +357,12 @@ int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd, bool sq_trap_en)
 		return 0;
 
 	if (!pdd->proc_ctx_cpu_ptr) {
-			r = amdgpu_amdkfd_alloc_gtt_mem(adev,
-				AMDGPU_MES_PROC_CTX_SIZE,
-				&pdd->proc_ctx_bo,
-				&pdd->proc_ctx_gpu_addr,
-				&pdd->proc_ctx_cpu_ptr,
-				false);
+		r = amdgpu_amdkfd_alloc_gtt_mem(adev,
+			AMDGPU_MES_PROC_CTX_SIZE,
+			&pdd->proc_ctx_bo,
+			&pdd->proc_ctx_gpu_addr,
+			&pdd->proc_ctx_cpu_ptr,
+			false);
 		if (r) {
 			dev_err(adev->dev,
 			"failed to allocate process context bo\n");
-- 
2.47.2

