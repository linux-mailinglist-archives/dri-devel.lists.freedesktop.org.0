Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B248BAC0D05
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41410EDD6;
	Thu, 22 May 2025 13:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ggs4GHxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8D310EE2F;
 Thu, 22 May 2025 13:41:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6016d401501so10881590a12.2; 
 Thu, 22 May 2025 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747921282; x=1748526082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oxkKHwFXoioX8JC9ugNSwYvPqb9envWDOnp8CIHvuOo=;
 b=ggs4GHxv7JNwnyLhWgY8c+L23bmLszwQ9+Aaa1MgTfDZaccfL1au5oX10g3AmInhQj
 UKJm9DzzrS5d2inJbPg06dq2kv5fqzbEKMH09MeV4/ZMXJMJ+vUnFHL4OkaJKJ1nCmgs
 iaI3QtlxZei4dxzsBp5Lgpkv1+Md0jRwJs2epsZihFyOFNx1e4LU2e91G6ahAX8UQds/
 MjsPlt8Rmp+CRkF8EtzEBIe1O28gUd/ofEwimzDnIKXz3Rwy5Sx49Ld6U6I+o2BAL0Gi
 Suc5LT6z2/PZYXq8oDMNI0lTGa1o+PqkASUq426UKgizS/JdWU+85owG0JS0wmX4YhOP
 EQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747921282; x=1748526082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxkKHwFXoioX8JC9ugNSwYvPqb9envWDOnp8CIHvuOo=;
 b=MmOY8CjKHLG+Oay7E5PBWxvOfz68ZRKjky3q5ZzfzALPJ/RUjbV/8mRd2MFcKU9p4L
 6Rg6WzWaFH6GpLVh+fwBv8nLN4ltzHFJQxvixHaKNHho4FdOIVn7OiNDVNriCH9uq1rB
 esT4lSh585iD3dHdu+AJlEMNW7L8DhWq9iN3ee6tpAIVP7O70DwRcmeouBEGAvnBGje5
 ypoVvGkwGvgCAzLwfCSiG5Ucw+LAehKF51KPNwMnVF5gJP2GPauva6go7PoV9I4axFcx
 Wf0y3rkQXhSXTlCb08z5g2UfX6DatDH7bptX1GdANbGcSzEB1t4pbh6gWl7PNSt4OvY6
 ZOow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzoIpEQQRU14mYNWXcqYyAYq9CdD4jxIAm6GQ7sdhWt4b+12KU7y+cOtW7/Y/BICzhY0n5/dJG@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo8l4MpWu5nXK7a61q2UyjKkRdxJ3mXS53+sl34ngUSBdfYdOw
 scimFLYV/0BPHjmjYe0HTmzkCU9ZChrLEWDyO85LgvXkPeEka/C8kFoXVbgRgA==
X-Gm-Gg: ASbGncuxO2C5J9wGkmCc/ue6Q9tge8/ukQAU5r9kMcNj3hDL0XUbH0dII56UHWa0wfu
 9FcNzmqzJ4bQWi17LcqsedkHc/2TOPwCKBIAHpGsIt3sJ9Axp8AIr29cAXN5CDTy1/i6tBQv8PB
 n8gYybzfZioBAn/DLSaZ13yisJ+YjTr6Hr75YiQpyKPu8ucAmUD0Mqpj++Efg/m596Mo+o209lx
 k7+flAKHYbyW4VA28jKfPq9gqYuq6DRJeF1TunAlwZnpNIOfR4BkeBJfpIK8hIo8B34X5YzJpY/
 qRz/gE5NlQB79s+g84pCGe7FS4xSsANuAgFIwvqIMzsn2izlkuypMDwap6nvm5I=
X-Google-Smtp-Source: AGHT+IHyQMQUxrO5aUO2wWLzYRP8YJ7AFzH6EZDrxzkAMAe48w2xNQ/VdTsNqjVOs90KhNhlrgsOkQ==
X-Received: by 2002:a17:907:2d2a:b0:ac7:b368:b193 with SMTP id
 a640c23a62f3a-ad52d4f83ffmr2711227766b.27.1747921282218; 
 Thu, 22 May 2025 06:41:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1533:800:9db1:9b52:19ec:8c5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04af40sm1082487566b.34.2025.05.22.06.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:41:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency a bit
Date: Thu, 22 May 2025 15:41:14 +0200
Message-Id: <20250522134117.7561-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522134117.7561-1-christian.koenig@amd.com>
References: <20250522134117.7561-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Since we already iterated over the xarray we know at which index the new
entry should be stored. So instead of using xa_alloc use xa_store and
write into the index directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f7118497e47a..d2d64bf17c96 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence)
 {
+	unsigned long index = -1;
 	struct dma_fence *entry;
-	unsigned long index;
-	u32 id = 0;
-	int ret;
 
 	if (!fence)
 		return 0;
@@ -896,11 +894,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 		return 0;
 	}
 
-	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
-	if (ret != 0)
+	entry = xa_store(&job->dependencies, index + 1, fence, GFP_KERNEL);
+	if (xa_is_err(entry))
 		dma_fence_put(fence);
+	else
+		WARN_ON(entry);
 
-	return ret;
+	return xa_err(entry);
 }
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
-- 
2.34.1

