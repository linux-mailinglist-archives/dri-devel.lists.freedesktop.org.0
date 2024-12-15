Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D749F23D2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 13:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB41F10E385;
	Sun, 15 Dec 2024 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cen4na8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E7710E385
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 12:40:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso3214039e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734266429; x=1734871229; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
 b=cen4na8xAoZPay8bcMXAUADDvY8q8yWi6+C8B/6rt2Mxzg19a9y2uH4vZ+aHrHCBkN
 0O3BJ1et5EaOWeta/e6mvQXxhRqwNcgE1GYk/sayrD+/tnxJ9X0F0FoSVZiwuKwxC8hY
 g0axaCkoUPUotZnRarcEhSBQJoaD8WuteChno1caFqZ+014zSkhfVbeML6F8HBYYeYXd
 zDT8NZY+KanGI1MzMj3n0mUcij06bdnFp8MqhyUQ6YrKQnKZ7+AIacCL3fx64Jk+o4aY
 g0cgi0bfszq/SU3xdVFmeRNL6M7Mk9C0LinD9wx+LJU5yLXlQ/y5rpA8m9Z9Nv4iJaxD
 rmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734266429; x=1734871229;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VKqGEI95SPDDmcPKpKKR/7dRWUBLgzZRIDEydq7WGYo=;
 b=T7SqzePLH7byj51jytQUIGf4WggK/ICAJ/HCg75lhOz4mSDa2DiSISN8COs03FN1w5
 W0hKqcjJnyVwGORnkHpwIiOPrTzX6W6No4JvN+Iq8JjBFOtuoXoUJRqG6YP6TtJ63ACb
 mZsG+6Qmk0k74NGNQaMHB8vyYDukwoBs+MdJcMFJO89NmZGVwjgmcXVmVK5FNEpL1CiL
 +o9xcX3TK60XAuglX7VXtCcVUnQcQK0M1ngtleKwHa6rRsXWWYKd47eROFbopqFDiJG4
 vkFztcFNNvAvukU/pwRdjsO/yiLq7sp4zWa3Q/zS8fp+e3W4vmJzx3DxrxMxVDm/XBic
 9Chg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ymUxp+j1A2hXq2Kz706xH68BY9wHcW7hYpul8rs2lOzMOquaYsFzKj0erKY2ZXy/SfOFBV3RApk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWGw8cH0v/lS5uDavZtYXijn+c77+cckLJ4MMslP7B90lzlnQ+
 6dKR+1t3I7zPUytoqmTWBinYorcVDuaYRiXZU4EKbsjoz9IFrT4TZs/eM2OJV4s=
X-Gm-Gg: ASbGnctWlthemqBg3R9+sF2jQpf462LZby5aenmOTVUkuX8aQRffWXlvxG1Vy35EQbh
 XQzzIjbFSyKrg9CPI6fe9fkGcsyhtY9wltB04i1YD5nYwY7QmosP5m0qCFrbYAs2ktc46UYqMEy
 7ND1mXTRutGPYVPlD5Wgykb/ZPYNBSS1GSUNTB0orclr9yIp30AWTjW5FHt8u9Cdg65SiZX7J/9
 +1YR3CCaHgLzed1O67GQ9VaS6Eo59nvBWtQHjU6cGEtqahscDpGEu+6nmTRum2T
X-Google-Smtp-Source: AGHT+IHmwjv0eptuZxFT2gpCHkWuQYV+04StJGmgC+Z4JEQQCD20hv3AqzkFpjgizuTHMQMM+eyw5Q==
X-Received: by 2002:a05:6512:2356:b0:53e:3c3a:2032 with SMTP id
 2adb3069b0e04-54099b72f79mr3223549e87.57.1734266428987; 
 Sun, 15 Dec 2024 04:40:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13be2sm491481e87.195.2024.12.15.04.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 04:40:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 15 Dec 2024 14:40:18 +0200
Subject: [PATCH v8 3/3] drm/msm/dpu: include SSPP allocation state into the
 dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241215-dpu-virtual-wide-v8-3-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rtLNZvWI4/c1Z6JTypcd/rzPjp3y7gPITQRLIp73VhE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXs4zHmqv+4KEvs+fxhU8HXyTshs00svWF3yCZ
 T6ZvsMWzTaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ17OMwAKCRCLPIo+Aiko
 1a/7B/41SmL6WXZHL42KtlTVJqEfm4JwzZrRiO7+EugrG1qKC+8+k1TQMOS8fjmtA9SfefGuwTe
 qlhWq3y18LWzTMHxLh+BKbguLUrLIP9RsaHzEKF4S6Q5qYrM5BKzKJbYn4AgxOPCKn5ScLAvPqZ
 jj2K93ctOcK01v9sLQp0bdcIvZWqnhc1algDaWSmFrdpv8FBR+5zOXJnM8nzHbhnU9bqkYieebx
 4OvZq2H6wtpipdUTg4Qb2pUkSwjY+ehAhxsL8q07t2SBEfjM7+L53yeF2Y0kuTd/BN0SntNMCSj
 O9byED58fAcpKgEQr/2GVjwyOMcvx7vR9goNc1p/+p4TDG+p
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2c325bcd328aa475cba9b9a2146ee3e009816551..17b5d53297f23169aba3537f85f02f04421ac9e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -941,4 +941,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.5

