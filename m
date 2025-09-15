Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4FB57CC2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0BC10E4AB;
	Mon, 15 Sep 2025 13:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MAYd2sXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDB810E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 13:23:51 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7724df82cabso4335350b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757942630; x=1758547430; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z2TvYipap11Nwq0kRFNhZ3v3SKE4qJBU+nYeSgKSe5Y=;
 b=MAYd2sXSZzyryEY+uJCaOSiDQIdWILM8VIwH0g6CJOe0RGcAKpYtbTjK6tfFhY79Dq
 3m7plFqKJsvtGt7+JLdjjoOJVvgTcPqysJDSPrB0+0zK9WbZ7vjnZ0hOLhSYQcvQKbrm
 at/DErWWJ55/GFq3lBP0tt+EbHASIerwGVt2EiYyNDiefXLOP0F5T7v2P5mZamgiZRAI
 SZ+IrPb+VuqW/TUeD1OuGcpk98gBnRfzrVRgxgp6WSEGn1ofy0sS08lhtPLXujbOYHKS
 SB7F/64b+iVS+T8HXlkNaUvATI57K2OJxKPmJuprVTJfCHyNR4oJBrN6p3J35xe68a7p
 iF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757942630; x=1758547430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z2TvYipap11Nwq0kRFNhZ3v3SKE4qJBU+nYeSgKSe5Y=;
 b=NNxneTwz88IQf0L8JhUk+wkg12X46MCwTzdBsy/E1FikGmxM0I/ybORE4zOxIgkqqm
 ZWg6oECN3sYo6B/Fl3w5NCkN59v3ZKfkVuJaG32jJBWlpDTMhcad20S/wO0nfLd9ZWbE
 wkuPztnyJvV1WIfE8JwkeTGnT1rbaHmgjKjlmX2AnDaOhwkVBlbrCtShnNJ0A/7Th6Fc
 HC8+NLdo592CacwM8hpfqlZ+GV6FmHf8XchRs4tA/s4fWTGPxKp7sU+P0geMoN99zZ/Q
 T1w5ZGXuWNBWo6Y0Pu8f+zRxr8r+nAGNpH+o5qyZgh8pNluZpT90sb38De2QBd7NJE4R
 +kPg==
X-Gm-Message-State: AOJu0Yzxa9aqzPMN2rJHL7+My+e13JSO06DdqASxChq6c/zQXn0gQ+rP
 mlW8cXfZgpfO6VQOC5RaeUf75zZ14E4gSWjtP55O5QPZCD9Hlm4UHhfroGPb2Gqw
X-Gm-Gg: ASbGnctYCOSw77rT1pCAQMjzVw6W1J9yI6br07WZn0ogAxBUMW1VtD4vUT0zkU3JjKO
 +SXpdGy7H+QH5RSfdW3jK4vH9E9jZdvZ2iWGDaVkvC4GpNw5xy6kCXXXTxV/h94xFcHUZDW7vQO
 CsKLGLmBFvZH7UoN6+TNXFoySaD/V/dZikrpZtsRE3g1Rt9c93KXKZWC8rKVNVXi5x3u/tzLe+H
 xQ1b89bMhOzEhMnxygWHtO7HwqaH+mRRadA5ymrzqlejSLnAFHtauNH+Lcv0tZPKyJnwJk3MrRy
 fk729NDcN/d4uZuvFf68t21i/bKyNuAWJUq6gEyNUoRcg5ZgoevryDnT6iFL1Tj28SAeZUKpyO4
 6X5Gj9fEtZIH1V2EXo5d3aqwGK+A=
X-Google-Smtp-Source: AGHT+IFPvIRXD088t+oFYvznY8Gmu7AuJys7aItwGtTGBP/7g+Db+VBC9DwdYHlcnXJ05LR1RhAixg==
X-Received: by 2002:a05:6a00:10d1:b0:771:e3d7:4320 with SMTP id
 d2e1a72fcca58-7761217369cmr14330824b3a.19.1757942630315; 
 Mon, 15 Sep 2025 06:23:50 -0700 (PDT)
Received: from vostro ([113.132.11.201]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607c48f22sm13563411b3a.92.2025.09.15.06.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 06:23:49 -0700 (PDT)
From: Luc Ma <onion0709@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: onion0709@gmail.com, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/sched: struct member doc fix
Date: Mon, 15 Sep 2025 21:23:26 +0800
Message-ID: <20250915132327.6293-1-onion0709@gmail.com>
X-Mailer: git-send-email 2.51.0
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

The mentioned function has been renamed since commit 180fc134d712
("drm/scheduler: Rename cleanup functions v2."), so let it refer to
the current one.

v2: use proper pattern for function cross-reference

Signed-off-by: Luc Ma <onion0709@gmail.com>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 323a505e6e6a..fb88301b3c45 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -546,7 +546,7 @@ struct drm_sched_backend_ops {
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
  *           as there's usually one run-queue per priority, but could be less.
  * @sched_rq: An allocated array of run-queues of size @num_rqs;
- * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
+ * @job_scheduled: once drm_sched_entity_flush() is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @job_id_count: used to assign unique id to the each job.
-- 
2.51.0

