Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E005D9542E1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 09:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0133210E5B1;
	Fri, 16 Aug 2024 07:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xd4N3p1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740A10E4E8;
 Thu, 15 Aug 2024 18:27:42 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so1483433a12.2; 
 Thu, 15 Aug 2024 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723746460; x=1724351260; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=urijkc3f3VRhrpzAWKCHRZEPKCuPoQovMvk9GPz7bsI=;
 b=Xd4N3p1lrjn6qnlKEasfl9xNXZmFKW8HgeTd8dgR92slnOovc/HNvHM7n6HnFyr5j2
 28+nF5vzNsbbPIDpc3W24dMr2onjsztf7JCHD0ZHlvr0OhfgdYLzv0/r1I3jDwH4YBoa
 9wNWbuLqdEEhOr8lz+BHn0xuOEL/sk/52SIp9aGdXd2SZrVcrCh0J8KM65cBICAwrozF
 I52zNpfHaZ8G+Qrgatcx0KPZvn1AwOdgSaSiMwmEb+csszmQyMFiv0rHTyhzyiTQVXut
 2O6vnY4HB8H3dY1kN2Y1i2uMX4FJlmrQh2l9NEJ/iwtaFdyvN6sFFs4Cm6lnqo4nIYrw
 uGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723746460; x=1724351260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urijkc3f3VRhrpzAWKCHRZEPKCuPoQovMvk9GPz7bsI=;
 b=XkSv93GOJYyWg31vGH1N+Irs/i05tQtExwnv3EMIdgarQp9Jzpw1R+NOhtcHgrvis2
 MSUri0dr9e2A7wOOFfCmNiXQoR9ryyjgU7003QCC5GIRNMb7EumobkmtoCKX7qwjL8d+
 4W+FdSe9dBCd5yKZnOGTD3BFCeypjR3/n4VEWwyH46tnBYFdSm+gBz4IFOCbUaK72tvT
 4OTVCMDJ1B9x/ZFAWqQC0qnLxGnYviZE+lxIr6j3KFFERo3hQGsj1+GcrminA5O65MUK
 AQF6mQqZMbob4qx7hSxyaA2LL4czYmoFVPHcxGcJ13GEMLfYD2G5lqrQzIVoDINml/+N
 VnuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3jjaetszaBiAlq22jM8CWzmc9TLsdzLxd+2av2NUfgjelEVzEoaIIosfTNx6BVCQtMZaQiAUrgb99G6PuBbChO/SfOY94CquuNY5SVNbcEgRgtN0KKhJNEUQOS22EfSDTJF0LRI+qm1gWRNqcevn5
X-Gm-Message-State: AOJu0YwGw8INxB13pKjwrqnSVEccZAByN3Y361URWkNMHXZ7K4jBkYU5
 JRpsKIlnzlELIDaK/bn9DFCfijB27qEmnVsADVQQ7rD7Qq5ijVvu
X-Google-Smtp-Source: AGHT+IFPZ04x5q729U6SozDVg01mhTEcXdVagZpRJc7WA7XSPWNkD+YY2Ys5R20/caD9P8YjpOsVag==
X-Received: by 2002:a17:907:2da6:b0:a7a:9144:e23b with SMTP id
 a640c23a62f3a-a83928d3597mr32453666b.19.1723746460231; 
 Thu, 15 Aug 2024 11:27:40 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it.
 [79.35.172.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 11:27:39 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:13 +0200
Subject: [PATCH 3/7] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-3-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=1771;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=WIdWkEj6n6EKxeTaGaPrvswEStAjEcIUss+Uq6HmkxU=;
 b=cdA5UOeldSfzsfOh+2uPqUWo4UgfkDMyDFPeXHAf7JKUKQafh23+o+lNgxZesuz8HMBjNfJT2
 XbSJ7pdMUM5AcJb2XW8N5sEn/s5iwrMC+/Huel9if6lm001Kp49EV+9
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Mailman-Approved-At: Fri, 16 Aug 2024 07:39:16 +0000
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

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..4cee54d57646 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1245,6 +1247,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..6b1888280a83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.0

