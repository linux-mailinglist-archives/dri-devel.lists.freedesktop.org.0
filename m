Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1259390A9A0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5328C10E309;
	Mon, 17 Jun 2024 09:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m4jQs6zQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF9F10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:33:14 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ead2c6b50bso45912761fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718616792; x=1719221592; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XR5GYB9eKu58vQFoGUBee/KjF/Xw+p5AvKjlrAjbe4E=;
 b=m4jQs6zQ7b1lx1xaoBKT+UIxpaz+q3cmk18F5TzxXSlKcQUXi9NBjkEbZDfy17OtwG
 /gzqHsZPLJgndA/cGHK3/wzvH74miLmyxLAxjKCPqyrnR6ARWy2m3e9dPTzgbTbZ6Zfc
 64mkg7KjLkuqkNpda5XzhF8OjX/uTmrOM2X87Ve6JIt86+d0g76qoaLBnL50tjD04Fhm
 0YpX6Hn4g3pMEC0c1KJqD7NUomvR1fExU6MQ2rzx6TDR1xjn19vwn9gN6G/wGpAXuayT
 sSezvLrORO5trArJ2sA6QIpyOVKTuVGpWjEws6cRTheSzmjnz0wmekagqK9pi4GKuDec
 vVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718616792; x=1719221592;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XR5GYB9eKu58vQFoGUBee/KjF/Xw+p5AvKjlrAjbe4E=;
 b=nLn2VIxTGHJurXn+ILY8khzo6LeQ40TM2pjRAIyhTwuZOO+hfXA1smZycqV5E5cCmx
 +rGOfjKA42GbMqysL5IPqzdVjtp7PUYisxGT/7TNzskerBOz/j1Qh7WeGw5l0SPeFPw2
 1tW6T/nGNo18zcfUCa2zI+0FzsMmk3ugNrV6VwPhuRFfGKwXEFIYgu/fLROK+KtVzW7B
 Z4YEily7GJIrbEopPoG6PuyioPMCXifDaiqVCG70bVrMVJz3K9fVh2Ds9+8v/jyyFqkg
 Ba3r+xaZrSv2jh9JWLmr04QebiUo7X4MOs683KXC8dPkUR01Sb7UjJWsA+jW3HWva1hN
 NqWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfR6fl6+si0hxrj2X6miuITFTA71+rFCrk80rW4CvQ3CcBEEvbRPmgAdhVj5kz0pHkTQL6ZFS0rYH5ze2eyan4oDJccFYhHsMWDSp7Prmh
X-Gm-Message-State: AOJu0Yx0NYP4qwm8lKk73ZlEcm5VIQKqif3S6OzRI3PRSiAwQxWRHQ+D
 G2XmcpGDgkOI1BPaD+JKXnnVqnJyPGwbzV6TMgqB9C7XE+qsK+KbQniOpHhnHbE=
X-Google-Smtp-Source: AGHT+IEa3K7XWz/lzC+j+im6KTvLDjDG7zCAkU3RZRrqaUfwf+xaegKVQs8z15qdzYiqFHNsN+qEbw==
X-Received: by 2002:a2e:9f44:0:b0:2ea:e98e:4399 with SMTP id
 38308e7fff4ca-2ec0e5ffc00mr63770771fa.36.1718616792269; 
 Mon, 17 Jun 2024 02:33:12 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bfdsm153872995e9.37.2024.06.17.02.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:33:11 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:33:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
Message-ID: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
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

Use kmemdup_array() because we're allocating an array.

The main difference between kmemdup() and kmemdup_array() is that the
kmemdup_array() function has integer overflow checking built it.  The
"args->in_sync.count" variable is a u32 so integer overflows would only
be a concern on 32bit systems.  Fortunately, however, the u_memcpya()
function has integer overflow checking which means that it is not an
issue.

Still using kmemdup_array() is more appropriate and makes auditing the
code easier.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..53d8b0584a56 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -45,10 +45,10 @@ nouveau_job_init(struct nouveau_job *job,
 		if (job->sync)
 			return -EINVAL;
 
-		job->in_sync.data = kmemdup(args->in_sync.s,
-					 sizeof(*args->in_sync.s) *
-					 args->in_sync.count,
-					 GFP_KERNEL);
+		job->in_sync.data = kmemdup_array(args->in_sync.s,
+					args->in_sync.count,
+					sizeof(*args->in_sync.s),
+					GFP_KERNEL);
 		if (!job->in_sync.data)
 			return -ENOMEM;
 	}
@@ -60,10 +60,10 @@ nouveau_job_init(struct nouveau_job *job,
 			goto err_free_in_sync;
 		}
 
-		job->out_sync.data = kmemdup(args->out_sync.s,
-					  sizeof(*args->out_sync.s) *
-					  args->out_sync.count,
-					  GFP_KERNEL);
+		job->out_sync.data = kmemdup_array(args->out_sync.s,
+					args->out_sync.count,
+					sizeof(*args->out_sync.s),
+					GFP_KERNEL);
 		if (!job->out_sync.data) {
 			ret = -ENOMEM;
 			goto err_free_in_sync;
-- 
2.43.0

