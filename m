Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4DA0BC88
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A2C10E6F5;
	Mon, 13 Jan 2025 15:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="acf4BC3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1E810E6F1;
 Mon, 13 Jan 2025 15:48:46 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ee67e9287fso7513246a91.0; 
 Mon, 13 Jan 2025 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736783325; x=1737388125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GOWQXV4O4PW3a432Gu/+8jRdielqIfGd4MIzjAae258=;
 b=acf4BC3aiP4hHTYNkkKqbbzd1ov2X+wlLtqtTHg8igH/Ec6XKuwpvBt1BxJbIuMQfu
 ey+UIQ1GqU5VhNvxU/1Her9O+aNX7SGl25xKiCGFQvjkOjbSNpZjJ2Kb3mTvXLxeucpy
 0bNVzE4DEAcpxdwNai4GzyyFYcL+rwSuKkZCRsCgAutBi5ZB4Oz0TMX6s9Fo6l4sVZQg
 MGgc7TgCdK5MQYLKsBz1IUUn54nIshMuGZRNU/PeTIvYF0hqzajEmd8tumv7+4xEX1Q2
 ZAZXAJlKbKFjnvSfl+GPdh+9iXbv0Sjdr4aLxI33oLY0DZf0zdqnKLYI9GWO3HtFnM1n
 9pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736783325; x=1737388125;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GOWQXV4O4PW3a432Gu/+8jRdielqIfGd4MIzjAae258=;
 b=u05tdOCxrrV2G3wCseHwE21EMPxKgSiVmOuReBmvL8c265uKVbwciT43KTcC0AGKPe
 hTWzPr1eDt06Wno9r202MXjr68q3GmW8pdNv4HuEGNWmrW2cv3bfPPOHE6hfNyNeTjRh
 YwWpHugGgg7X5Ps6bJ3LFGUEKk6mxRV7Vj2W3wcWr1H0/r9qHtxPIemZUuVD8mcz8ADf
 DG7NkG71SEy1Ta/sMYvc8K685MbG+fdWyBpITn56s94ipu48UdCzvwyPsip3Eebd+w3O
 C9q46KiXt3+M4RfuE+9RcodtS+rkk8HvJKoEEUO5eugiznKI5IBOYqg5kPFOGguqlIKr
 NNUg==
X-Gm-Message-State: AOJu0YxOOFzLGUaCnvri7TRtTjCJFtLShkDWjE2Bf6dJBKF2l5OlAGNT
 jieROIBBTW+c9smWmovzOZsb4j0JPWKq49m/5xTKarzdYLm3eRBXzQnMIQ==
X-Gm-Gg: ASbGncsieqa0RidV0PX5hqosZUErb2zHX+qiTH8b0mQFU7Lu8ElVSPmL+dyc5T6r8QE
 +G5VscBDr/HkJJVU545Ksz3PQXeMXmMsh2+BzRu08iQynFSEl8EG5unxZQq08WulddDhEWPlSNY
 +hDjDpSB+XNowbDnFQKe1QWNLwfXJ6dnFdpgBdL7vWuK+26vUd3ESCOLjYLMp7Nv2BPiZJwIB1R
 GvSkrUn0GbqJ1N5iii5tjMeI8C7VcsjOV26QMyb1hMhoz+h5PvN9NE9V3hkSSbHnrMqrba7lz54
 KAGXV4R0+v1dgRyT5rdEq6cZ/tGhHSg=
X-Google-Smtp-Source: AGHT+IEB4HRVmV2UtNPCt3Qi11rnIt16AZGSceKAxCUp6976MdfO5rkvSpatyjjYH6n4suj+mkjZ5w==
X-Received: by 2002:a17:90b:6c3:b0:2ee:c918:cd42 with SMTP id
 98e67ed59e1d1-2f548ecf156mr26272101a91.22.1736783325480; 
 Mon, 13 Jan 2025 07:48:45 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22ee14sm54595935ad.186.2025.01.13.07.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 07:48:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Avoid rounding up to one jiffy
Date: Mon, 13 Jan 2025 07:48:41 -0800
Message-ID: <20250113154841.129521-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Rob Clark <robdclark@chromium.org>

If userspace is trying to achieve a timeout of zero, let 'em have it.
Only round up if the timeout is greater than zero.

Fixes: 4969bccd5f4e ("drm/msm: Avoid rounding down to zero jiffies")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d5..a65077855201 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -537,15 +537,12 @@ static inline int align_pitch(int width, int bpp)
 static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 {
 	ktime_t now = ktime_get();
-	s64 remaining_jiffies;
 
-	if (ktime_compare(*timeout, now) < 0) {
-		remaining_jiffies = 0;
-	} else {
-		ktime_t rem = ktime_sub(*timeout, now);
-		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
-	}
+	if (ktime_compare(*timeout, now) <= 0)
+		return 0;
 
+	ktime_t rem = ktime_sub(*timeout, now);
+	s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
 	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 }
 
-- 
2.47.1

