Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4969A4362F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 08:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DBA10E595;
	Tue, 25 Feb 2025 07:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p7UG6gv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCDC10E585
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 07:30:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5ded51d31f1so9334374a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 23:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740468631; x=1741073431; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
 b=p7UG6gv1SjP0T5PwGANjG92JPBoCV0OB82ed0p+yyAr33gc4B69w+x9JLx00HsSitQ
 NzkGZKCYCOkTQbwf5rYbjG49750paIwfW5+8EOu2AV9ALdKk/g4t02zvpgeLpMsX6Gi6
 FaOakmEI0d8rKTRWHGxhJcXKsgI04VksJ/+ENMyk8X0CsBkSvo/GqTDPdgI6BQv9cC26
 8hkZ0p9NwmZsyLvuguV1M5AnSxQNML/DL4HN1tZcMc+zbvZs0oJKTyYMhqyQIg5yX9Gd
 DncoH3qR0ZXHTf/8q6b3VuqmQGTMSab1g6dltqsN2jvuZJQ/aFKthwMWANKVYU8FE9py
 lOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740468631; x=1741073431;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfuM5g5b1bzsFznJjaGXX66+r8znKzFeJVWgK6VGC58=;
 b=jl192fkhQXAto+W1ceuUonagjlAnIJdaLu/Gf2to6LRPs5qlHfE/b3Tn2DE1ZURYK6
 5fVqjPiy6c8z2EyReNAr+MPn3c2xR1dXm394ckuwjwp0dtIswMI9VtBBRoneF9RA8coa
 suUbfbdFWYcNlh8pUnIWpiLr7yY4AgHT5Kii4CuI3I9OQDT60LJLMEHRbPEgNQ7zoHX5
 CrCu1OAOS/TRqf/xvCkPbLuSc+3l6sa07l2Pkqp9+GKdTLHEYJV3/8SCSnFgN21H+LXJ
 /vN00B3cuxkXY/FvtOFgQuwAFaNQmLkAOGENB5sk5gSvlJAld4er9ZS9HDkV6WaX5pll
 x0sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaBZEi4lzCy6PnOllgoRRRniGuIKXUzWsCie+gil8q0U8UG0I/glAN5kV4/B1ehQ/gEon8n8h2+vM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2KQ21UPTDXrBoY8qcQicubk0metOaAYv/ke5G353WA0V8Zn8Y
 G9Xsr4yJ1encdsjaMp0ummhVtx6x/AMvqxh8GvCi7bIBrAlLItSXiGvp1Id7rvY=
X-Gm-Gg: ASbGncuIm2FVMlchbQdNXo0XgG9so54ix73B4bzByZGW9CnC37eTZ8GM7rQDfLTAA+i
 q6Q4lO1a/RHfx7BeOTS4h1LxGWrtAweJyVUVJNRE/ISlpdUU2KhKw3Xo0HNA6h6NYn9GneibMRB
 7RfxZjfYje81FoRcW0dp64SUh98n+nv3PvZcoyp/BFd9ZaLo4Re1fZ62DurI/9A9R++pjMTLo0+
 q4EK03Sdm7eSFG6+rkx8MhGPf/1iUyzIowH71lLOTgrqyE/CoqRn1y7QrfYEFoSRm5T6sk+oHnI
 94kmsSjn9rz4p7FW4w2bU5gcVjJN52I=
X-Google-Smtp-Source: AGHT+IF1jD1nIi0UqQ/yrLSB611MTk3aZB/2hvtf9cDDpXVP93eDIhNTWNWnPWPNHZu27Gv83YTAhQ==
X-Received: by 2002:a05:6402:27c8:b0:5e0:8261:ebb2 with SMTP id
 4fb4d7f45d1cf-5e0b70d6598mr16065265a12.12.1740468631260; 
 Mon, 24 Feb 2025 23:30:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e461f3e7f8sm788694a12.69.2025.02.24.23.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 23:30:30 -0800 (PST)
Date: Tue, 25 Feb 2025 10:30:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/msm/dpu: fix error pointer dereference in
 msm_kms_init_aspace()
Message-ID: <3221e88c-3351-42e6-aeb1-69f4f014b509@stanley.mountain>
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

If msm_gem_address_space_create() fails, then return right away.
Otherwise it leads to a Oops when we dereference "aspace" on the next
line.

Fixes: 2d215d440faa ("drm/msm: register a fault handler for display mmu faults")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index b877278888e6..35d5397e73b4 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -209,6 +209,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	if (IS_ERR(aspace)) {
 		dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
 		mmu->funcs->destroy(mmu);
+		return aspace;
 	}
 
 	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
-- 
2.47.2

