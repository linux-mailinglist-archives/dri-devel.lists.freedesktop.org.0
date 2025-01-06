Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E8A01E1C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 04:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62B10E568;
	Mon,  6 Jan 2025 03:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OwD+82ZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB3C10E568
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 03:15:49 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso2598648066b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jan 2025 19:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736133288; x=1736738088; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
 b=OwD+82ZQBFLEoC/PkVFIQzq1gCiCFe6ouWlq7xVxOQkpigyCLOyxS+kIkXTW5DUKxr
 Kj+44ep66ON0NK7u1ViBWWzkWACN3tyBrVAryT31Lc3twZmP3d2sneSph9iXTexYUGip
 +gxXA9lye1N7fL+PoyhAc0S7NRjPPg8eu+uq98SqRjy6BcMJE1vpkA0E52Cupccezoua
 SqJQKc9Cn4e1mjkoGCvGvCNmwdFUDy6MwEVuiUpHlr5/hfYkc8ve2H4dRV4G7oJhWL0T
 yrWR0P22BHPVI6vkyH4jHJtZfuvEFxceqC+BN19ChhLjv+UOYdJZ+QxcxJUEQTPYtuO8
 ui9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736133288; x=1736738088;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d59Z3qrLfT2qIqzs5o3r/0E9tuM8fjfJdM+IihJasEc=;
 b=P7imNNEQHTvW9U/Ecp2bgp3o0WaZgKwi6BY2S1fzm80rKUJdXeIzSG2t7bNS1hP7HV
 ndxEfA2peb6Tf5ovItgehpnZ5Zni1VmzrLUCpxcL4QcmO53SoJ4zy3/EPwK65Qifzpar
 jVywgABk5lDWFgZUxla/5mTfj/8rgSm2eEbjiNuFGNLBwN7Mw/yLzCfaqyoXqM84SpbP
 1VJJ5NUJl/0mYRramg5x0PqMxzlV9A7MMRAgJhuIWpUxq/FVGHnkrNKEysvAL6TwFYRu
 8n/JAqkH6PkD+I6fsCGxYdfapUlsR7Gr4h4X53RPNOIhh5m9UYnqYyfth0Q7qW286JMh
 LzdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtvBaDd2ITYsRMrlmBXIao6BqAWljaLs6a0XEQYxZeUqG8iqjkSTb2Pno0gGOch+EXR4Anb086kXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbER0zAb/tSkW7cW/9THYVftUFlhbQyaiGxjWDZOCbvJW/rim8
 LKvDaREbZrLZjgaRIAAFWqmYUcS4xjrI2EBzmJ9x3UXVZK2P3RnIpusz0w0FMqU3CHB5tnAVbNe
 Ed8E=
X-Gm-Gg: ASbGncsy/0SnYREtNHgyiP4HhelT9FniwhPa7Qc94FiZjxkb4fIQcJjNfAFshCduGn8
 CL3aJkfdcjniS4VYSJnWIyA6ufHiYem8UifUL3zOU4ynyKK7bZKhL5UQBLGTQzMmYaEcy2GQ6ai
 KrPJSE0rzwKo0hUedKcJQgTrmWie37kFOGU5T62dF+Hk3M5j5eotNbdRnS+bjBmepsYk7peAOlV
 BlGLhFTBRpS/W4eJguJt68QFe2h2aJmjXT8j1VdRrj+1A6oSKaIY133MIDme8s2
X-Google-Smtp-Source: AGHT+IFKzrJdZbp0VnGmVQddnrS76dcPqx2IOwskz9x2OymOvb0Kcx3KnUojFYk6Yq6nsT7bEn53Og==
X-Received: by 2002:a05:6512:3d22:b0:540:1fcd:1d8a with SMTP id
 2adb3069b0e04-5422957afa2mr15539769e87.55.1736132873732; 
 Sun, 05 Jan 2025 19:07:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:40 +0200
Subject: [PATCH v4 6/9] drm/msm/dpu: rename average bandwidth-related
 debugfs files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-6-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3GO6BKanzbIFpcGY1492/FnGV+oGzdC81viLdgF4XKU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5W7DE/CqwnIGp5JjlR3b+5azAW4JhRlYR6
 23i+RdJ8RWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1YfJB/9R2mnaUTtPtDTK/pDYG4hf85YzZerMGxPbZ/HA9Mx3dw0AQY5dAaa+YHc/xw4zay7CshX
 StUPZEny53hjKaiSUjY1mm/dgtLpiFd2wqFGIoUAyewCCLarWRzzunyexzz/TOa7A3vFRDH0nW2
 omoYghdwkQLSApGVE/Gg2vSrpIL/8MC+H+Jze9O0ujL8e83QLqHF9MSByLxZKJ5fY5/QpyYcsUV
 XpjEeR0KkaWLLZKV9izhb4F9Wbe8P2TUwHgdH8YvaxwxfKSJsa2B/2+8fQXgc5oQ6AnifuDO4Yt
 tvFgPS5AjR+kCokydIdwAROQuzTzNNOtZE0s1uNHCiVatmC+
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

Rename the debugfs files to match their purpose and the patter provided
by other bandwidth and clock-related files:

threshold_high -> max_core_ab
threshold_low -> low_core_ab

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index b93f7556f187d46b325a689ad01ec177cecbc37a..70f43e8359caee2082f2ca9944a17a6a20aa3d49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -464,9 +464,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->core_clk_rate);
 	debugfs_create_u32("enable_bw_release", 0600, entry,
 			(u32 *)&perf->enable_bw_release);
-	debugfs_create_u32("threshold_low", 0400, entry,
+	debugfs_create_u32("low_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_low);
-	debugfs_create_u32("threshold_high", 0400, entry,
+	debugfs_create_u32("max_core_ab", 0400, entry,
 			(u32 *)&perf->perf_cfg->max_bw_high);
 	debugfs_create_u32("min_core_ib", 0400, entry,
 			(u32 *)&perf->perf_cfg->min_core_ib);

-- 
2.39.5

