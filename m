Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8909BB2F962
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3E10E991;
	Thu, 21 Aug 2025 13:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JcGwY8Tv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E6D10E37A;
 Thu, 21 Aug 2025 13:07:02 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-61a2a5b0689so1675891a12.1; 
 Thu, 21 Aug 2025 06:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755781621; x=1756386421; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cE2xUgsCtcl5Yk5Y5dmTdO4x4ZofxQkVly4ZQAAlTxc=;
 b=JcGwY8TvtVPruDQgJU0++6kPek05GnlfT/Xn55KCxBJ/HMuO5q3NCnLJflamDKPCLf
 RVNMCszy9o4WWo4ApASR4kacYnGvUjKw3CGX0qf4qup/bSLm79xoodtO6Vj6QIswR5Ew
 9awVfKCgFi52TKllHwCSfZxNM3d2O3TVd/zIu+UT0qrTc2chnB5qbI744LJ1VQdN69Xf
 Wm+ekan8RfI3xjyqnxw5FpySySs6B2IsZF9bIIT9ZqpMZgLzLhT9GG5gi21BtltH5OAb
 ElX0PtBty9Tewd+RAWfkl6bBcDxjGL9FcnwP+CVxpjVXMCLEWvqGQb/XLADeDFudt6aJ
 XW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755781621; x=1756386421;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cE2xUgsCtcl5Yk5Y5dmTdO4x4ZofxQkVly4ZQAAlTxc=;
 b=NKUg39d6VcRa/X7qba0FcG9pYmheFQ+mtwPchuDIqFKqmKI93+GnN2tq+cIPP6EWno
 HGcx6seM5U6Fpbecb8/jHoUlO9lWbtb7TSEAtyxQcyYx2jGpM8PecjLEhh4cKvktKIiz
 fGmsJu15k+5ot1aRXKbPPBeDxEksDN8GQEIEY0jux+d+rwVI6gz4yWg0ojs8wbh1nS3W
 7X+TFnda17Fc7CrISmwBTURftCNLmWgFJUmiN9khYFv/ALTbP8z7YP7fjh/J0Ic7ZSg3
 qdxOoisq6egyFw2UdGoygpSo1qcQ+jkmtDTg5u/YiNC4vDyGWhLV55saXv2Yfch6XN25
 KWjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcZaSlxzEHJMDz8l4tllc4vXAHC04nLdbsfVLhgxxxgs29rhdQqFxiBGhemLG8tZsBQdQPuU+VVQTh@lists.freedesktop.org,
 AJvYcCW9fYWZbn6tqrly8lF1XYXITq1mHPJ1hG9/Lsnxq/PjcqD4LaOcPq4UCHtoypHGmlAYVWVcatdxLqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7dF95g6BN9id2b+5Igf1ABq6fpaAzi5aSVkEWQ3rQocpD5Jce
 NxhFGpUt4fNrQ/l2VfU0onJg60ZoHzXAN/HyCaiQL92VLiDLhT0weEKOOMGrsV7S
X-Gm-Gg: ASbGnctkwFdmf/+X0pNqUhLsDKAA6zGkzWKqlyaUgc2IkBlMxie2uG6TyrqlhhzIERS
 PLH86BxI2uIpG7OTcxtlZNkmxfAGhq5Lw/stYjHmwFuBIHyuxjAJoIVzMzQlc37LK66/BMKvpDB
 9otVjSRceM6UVIJKWAvx3xYbtIechUDYCV4c3d+Dt01+z2a6WjMRugC/69YL4x+fdv0xbIkyRDK
 PmaZBNWm5tR/RC7LIp1DlJv7PD6gP4/n2Qd0o5TD15RbpOftKuzvFWtICe5nEO0RlR2cssVRsUf
 EdPzRAb0HMqk/U7gob1o1KUENm7XxANZa3H+fssRJeWRlwVvztRRol2wkoYrcS2nOCvWqZfwv4E
 lXTTg8bUUzCxIZgyxNqBKaPrFEoG36276n7WrOgsD6RS81IbL/rx0UNijcwrUsEbaoQXy9FXayG
 1VZ6ijltCH5g==
X-Google-Smtp-Source: AGHT+IEb/ydiKkvMtEnHGcuaYMW4zGRi4TzOe4lkXKlzMl+kWF8eUQjCE+yneKRzlUBsvTdWJpLgLA==
X-Received: by 2002:a17:906:7305:b0:afd:f207:4dfb with SMTP id
 a640c23a62f3a-afe079eca14mr235776466b.25.1755781620314; 
 Thu, 21 Aug 2025 06:07:00 -0700 (PDT)
Received: from [192.168.1.17] (host-80-116-238-73.retail.telecomitalia.it.
 [80.116.238.73]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdfa887a90sm273649666b.11.2025.08.21.06.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 06:06:59 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 21 Aug 2025 15:06:34 +0200
Subject: [PATCH] drm/msm: make sure to not queue up recovery more than once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
X-B4-Tracking: v=1; b=H4sIANkZp2gC/x2MQQqAMAzAviI9W+gqovMr4kFm1V426UAU8e8Oj
 wkkD2QxlQxD9YDJqVlTLODqCsI+x01Ql8LAxC317NAkpFPsxlUvbFoK1M2eV99BSQ6Tov/dOL3
 vB9nByadeAAAA
X-Change-ID: 20250821-recovery-fix-350c07a92f97
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755781618; l=1207;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zyD2tXH2fILSn7Eg7Lk7nphonX0D1uVWaNAvjPxQDyQ=;
 b=n2R845Fa9hNlxpW+twuvg8HGdjLRRE1ADB2NlsjQnyyUSqDswNDgbqo5tzKnUgDfgircDlUPL
 b6Iksw/fWcbDDS7OBvgfOWLh41d2nnIkl8yEho7xhmy/pbDG1USNE57
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

If two fault IRQs arrive in short succession recovery work will be
queued up twice.

When recovery runs a second time it may end up killing an unrelated
context.

Prevent this by masking off interrupts when triggering recovery.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..f8992a68df7fb77362273206859e696c1a52e02f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	/* Turn off the hangcheck timer to keep it from bothering us */
 	timer_delete(&gpu->hangcheck_timer);
 
+	/* Turn off interrupts to avoid triggering recovery again */
+	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
+
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 

---
base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
change-id: 20250821-recovery-fix-350c07a92f97

Best regards,
-- 
Antonino Maniscalco <antomani103@gmail.com>

