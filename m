Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789DB54FE7
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 15:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67E10EC47;
	Fri, 12 Sep 2025 13:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KO19ZFvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBFA10EC5F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:45:01 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7723cf6e4b6so1630368b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757684700; x=1758289500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDQVS0oN98gtOxGh4UkJ37N+aDlWZS/uJKzs0i7u/6M=;
 b=KO19ZFvRUxULw34PWLFtFokRYz4wyGBpUKJVNRzvm6OjoJ5A/BGojsFsrayr6Jiosz
 BU3rMj9MVW4RS9KsjnYn7csrO1RW4NKUDgvFrfM3H10c8dfyPRQgNuSbjNfxImOoXY+W
 R/yLkGlWzfWkSf4G35u1gbDPltBsVa3yM9vKi6ZMHO2M8QspPLBR4oxrsVdYxEhxWsuH
 h5sYeGytylfUeKhK+IW3fZeIftfzFIOAa7qtmwaSXgXp8MfievxJxg1hTeiq3588L4i1
 SCnHVwvPVrVGuyk792PaIlGzBSCz5nwoc6oulhd2A+MEQS9u4lJ/Fx03eCPYu9JclaLS
 +O/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757684700; x=1758289500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDQVS0oN98gtOxGh4UkJ37N+aDlWZS/uJKzs0i7u/6M=;
 b=VeKq7mfeCP+UXYNcb6X7ncSl+dp82nWCQNh5kfxxI2r7vroaX77QFj19iNerf25DMH
 sFeKkRP/RDkLasokgQHq1oTEGbXSUki1Ru1R5JCBy2arxfYmKMcbE6msL7zPfYOiyTKi
 jWhTfcbiNbKEykzrDjQUxSGBW5f4KPEVlBfKoCt3gCkPxtVrrU/1LxRwK+a9jLFY2pw/
 0LWcy1VI52fk5NO3CGVRZGWpltyIxZoyekDACiXyNYMLVMubJBg+NYCaN7Ezzrreink0
 NBJn/B/mg9EHCnb2bN/yHozjvQ5vOqjjTqrh4l3dfqty7Zh3dswkw68Sd+OYp8Av4oRx
 fjMA==
X-Gm-Message-State: AOJu0YyuBqEy4CiKgdwS+ZYVBlUfJhc3dUmOaAkYFV3Am5OUglcXMZef
 pfnd/Dsx7ARCakvDOkpHTMkMm4ycLFln8mdbWyyAsCjlUiXniRzAlKWMlmjdWH/O
X-Gm-Gg: ASbGncscCA7ANZ1bJ70mE+c8HNDwXrG9j3J3cpEDfybDHADtaAEu5Zr8YfSLrapK9X4
 oHNUNrqragGLhANH9ftRhT/920RPV8wlijeJgTxeTdEIPEbsAaSC0PMvVZ65X+XjxoVV+BfAeHr
 TfG3xdXotMNhGARC6TG5c5UnfiU3PVBpo9tUemlZJTWxPrmM9zYWIeezlJGPm8CavZfZXq4FqkA
 xkFkOQ8HGRUX/3PAW1Fukpi2M6ipGoq8R1CPFaK4dwzjO6KwLkKuzltvhFKxCDbhstGkuAoUbI/
 Ei3LJC+VhxdGFl4+DM8OQQm2hi+u10C7/3hEjs3l1w+ifgRcojVCdySKCvcPNJ6aYky9RHutq0I
 LzLIcS1o3rqBUNynjOsQNlvZb6PM=
X-Google-Smtp-Source: AGHT+IEI/yWZoWRDsD/sO/L7HND76jgnTXIrLo1qA2nfeIPD2quPMlWWHT6V0FurKrHF0qLWQEp8eA==
X-Received: by 2002:a05:6a00:21cb:b0:771:fbc3:f151 with SMTP id
 d2e1a72fcca58-77612163666mr4136197b3a.15.1757684700373; 
 Fri, 12 Sep 2025 06:45:00 -0700 (PDT)
Received: from vostro ([117.36.116.175]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77613e4308csm2641444b3a.73.2025.09.12.06.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 06:44:59 -0700 (PDT)
From: Luc Ma <onion0709@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: onion0709@gmail.com, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: struct member doc fix
Date: Fri, 12 Sep 2025 21:44:05 +0800
Message-ID: <20250912134406.221443-1-onion0709@gmail.com>
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

Signed-off-by: Luc Ma <onion0709@gmail.com>
---
 include/drm/gpu_scheduler.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 323a505e6e6a..6c4d0563e3d7 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -546,7 +546,7 @@ struct drm_sched_backend_ops {
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
  *           as there's usually one run-queue per priority, but could be less.
  * @sched_rq: An allocated array of run-queues of size @num_rqs;
- * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
+ * @job_scheduled: once @drm_sched_entity_flush is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @job_id_count: used to assign unique id to the each job.
-- 
2.51.0

