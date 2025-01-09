Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEBA0834A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 00:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB02110EF47;
	Thu,  9 Jan 2025 23:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PBtrbK+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DE610E4A3;
 Thu,  9 Jan 2025 23:08:38 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so1914923a91.3; 
 Thu, 09 Jan 2025 15:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736464058; x=1737068858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hsEXuz5pOePCgHaBAUoGEuivEUiSeuPzmqjBLNVeF5U=;
 b=PBtrbK+oKXOamPWIL3Kbg/xIx9GQFc6pXXkYy8dh7GxomwPePCHeD2gTi4hPZ6/x9u
 evONU2XwVlTJJaxDjNO86V4+f+qqd3RmnvR1/sDXg6k+ysf8TzvRr707uIxTsNxQ6i22
 naZ2BpO7T58Mgm+KYhiKmhjNthe13AHegDuuTAIKJa9unvRkNbb56Y9UM63W7XjDWBSG
 jfIEznGk2wN3NlAr28WJw+wuc9+ULhGCfxq+oFJ+kqqFQOT1bLzsJaRUV8E80SMPVY9A
 rhSnuMe/qsRKCaskage6rCV/87BaxOoK6uOJBmQU1MzMNzzRonaAjbkLfzKSYkLGAecF
 rveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736464058; x=1737068858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsEXuz5pOePCgHaBAUoGEuivEUiSeuPzmqjBLNVeF5U=;
 b=GGAXeJbBmjUJVoxlon+SWdBNSRmuztRyDg5zOgTq2LM21yhiUetMRxHJIUvKIpJGWE
 ExG0BJBooXS6xQdLLdgGg2fUPhaQPYKWBkw+XaNkdxpa+ScAbar+J6MHHEojNnCv6mKl
 60fNrMbuHoBPl7wcHOJpQfn7Qk/5HdkIcFkQPfhGbHfKi92jlWpa97tibuHmWcckLj8G
 qVXlIGhMAabbFbn5gokIMytTXdSERTmyrN55DsS7kwvB7EC2dQZv8vGMX3oE0gvSo/xE
 8J00M4nTxU2NrMvSCQHUIsCAmsUkFuLVwarnqgFPCmLngg45c9tFyY60dM49omD5VFKf
 qkHQ==
X-Gm-Message-State: AOJu0YwnIye3b+6J0CvNqIvfflZ4ntcHA5OgYRkIsZOycarFDT/vy3HC
 YxT9+StCnga6uCkbPH9cDqj9c+KgbFza576D+ld/DJE50b23lE+g2z+wuA==
X-Gm-Gg: ASbGncvowKhuAJecFf8bFUyyi4MctnsLF+hf3wqzvYFth2AKXzT/aj4SIsd3BGa7qso
 J2WBT5/X80zEA0NnJH0b3E+XlKLNUEjlAMDJstR8FOT8jGfdDgb7pWeUcBerZX66f6bzn1MDz8P
 RLOD45NWiaXwp1vkwierBYNjxILV9XLf4GfZx5fRjt5btMbZOa8AhB7t5csP+X9cVzFGFS47/gF
 X5HhFm2eu0Nvq0lBdvJRUETO3XGjlSKAsjq4r+pNFP5AXUr14rllBgumv262tIRKhw8nDvfAHB6
 SLdBxIhK0PeylkB4kH15abB/An9J9FA=
X-Google-Smtp-Source: AGHT+IFijBusIXQNveTYyVkWineuwP7XNYtVjA05OP1gn+j7t447g9otZeq6N7nH7yR5y0Gph1vzJQ==
X-Received: by 2002:a17:90b:540b:b0:2f2:3efd:96da with SMTP id
 98e67ed59e1d1-2f548f4ea9emr13487800a91.24.1736464058061; 
 Thu, 09 Jan 2025 15:07:38 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f54a28730dsm4544298a91.20.2025.01.09.15.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 15:07:37 -0800 (PST)
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
Subject: [PATCH] drm/msm: Avoid rounding up to one jiffy
Date: Thu,  9 Jan 2025 15:07:33 -0800
Message-ID: <20250109230734.8111-1-robdclark@gmail.com>
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
 drivers/gpu/drm/msm/msm_drv.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index fee31680a6d5..451d258b9827 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -537,16 +537,14 @@ static inline int align_pitch(int width, int bpp)
 static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 {
 	ktime_t now = ktime_get();
-	s64 remaining_jiffies;
 
-	if (ktime_compare(*timeout, now) < 0) {
-		remaining_jiffies = 0;
+	if (ktime_compare(*timeout, now) <= 0) {
+		return 0;
 	} else {
 		ktime_t rem = ktime_sub(*timeout, now);
-		remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
+		s64 remaining_jiffies = ktime_divns(rem, NSEC_PER_SEC / HZ);
+		return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 	}
-
-	return clamp(remaining_jiffies, 1LL, (s64)INT_MAX);
 }
 
 /* Driver helpers */
-- 
2.47.1

