Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC9B48D23
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFB910E4EC;
	Mon,  8 Sep 2025 12:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="j5o0QX3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC6A10E4EF
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:16:00 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-772679eb358so3904632b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333760; x=1757938560;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2c4SClBLaEcuuZYVj5SwZ6daEI8HGZlE+9CzkOMlMk=;
 b=j5o0QX3RaXZRELtat0R4Z7eyoLFVCdFvOin5EVnYcgczbGVLBALVMV0Q1XGcCHR75H
 o8x6prqPB3MQ5F17uW3FVAD7X5Y8NDeQ4CF/vmkVk8BxLQFsfyGQUegOGuFuS3/PQrwd
 rxXvCbLi7AEShSRUQJXKNiM0VBOqhehfIzeSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333760; x=1757938560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2c4SClBLaEcuuZYVj5SwZ6daEI8HGZlE+9CzkOMlMk=;
 b=J6AdsxM1JqK7gTU0S8PuOcj5oUckWn51wOjiHVJFcbgfD6N0rVZpmU0Z3o8+NzpLXF
 2RDQg5qKSiyI8NZzcBDFzkx6uNGOydbwxjLrMDJex0IcLRhCqhy0uIDQdKXEjrsV3JvL
 mbZVTQHq9atlAe716avqt7uYEyaPq6RQz3CRFLwQglO4XBgkKqQxGObhAOxqF0se+0DY
 HLzXiIPtqsGNzUaGSTbvVEHRzcuoHTRfpmEWpvFIw/JCVR1eTJiKh4HI/2MEoCB1k2Om
 gQDE1L6nwF7k4DOXsYwsRfHooQAItupmi9xYxii4i/Bldzu7ZdXw15f8+q7HTAfQK3h7
 RviA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKbcYbglwl2rSwgzTVtmZOvbeKys7U6UURalOayMYR2Ap/2VcsDpd9QHYzYplqyEhRlIJOo0yTJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtFag7Sg63qZYFj7PcHKYHhcm2wqv2IU9eBHl2IP3J6WaOgl4q
 EMw/Clf0gca6SRRNsj7v0zN4o5xVtMaxSNLLiMf6q0WHrw+HUBbgl9HFI4P/vEB2L1w=
X-Gm-Gg: ASbGncuk35ZLWaX0O8hX64zGw1cKxvI1klRoN75lZ4YpVWiyK2oOMQt5+iYq2uB5dK0
 15BdfJz0ygNcjwX2zvWiKwlTJ/Zza4gwcWr7Q1A9aNkdMYY9cP2XJhVtgrn2aakylIkRe3UK3JB
 RshSsXiF53X8IWPoRxTcc7Yzs8kVSA/Lm6vFNApPCM/+EBY158nUPHGV2AYXtvUPqVLZBV2ozcL
 myqDkTV6pGVcKKvZtOdEbwzifTFy/40eGMynbvxYXlpd6NsGYmoN7ucZTT6S1EpgKZF1yWlkPEC
 limeY6l1nZuAEfqbzRG+ctHjQvm/ZK5awXq3PMdEHhUEwQXlmHff8Ocmy+Dbr3R/QMzH98W41tV
 nGEdRF5DdoeaPdnpj7TmSJ8ZAuyZTPKzLvp+xCu+5h50=
X-Google-Smtp-Source: AGHT+IFR27ciPZayRWeKYcIz1tk2ww01LtnkwYAYHdQ7M3fImOs3JWjnycxOnV1IKCa27ToLJGUWng==
X-Received: by 2002:a05:6a00:c8c:b0:772:5487:c35a with SMTP id
 d2e1a72fcca58-7742dcd7050mr10340386b3a.14.1757333759684; 
 Mon, 08 Sep 2025 05:15:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:59 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 6/9 v4] drm/i915/display: Remove outdated struct_mutex comments
Date: Mon,  8 Sep 2025 09:15:14 -0400
Message-ID: <20250908131518.36625-7-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch update a comment about struct_mutex in i915/display, in order
to prevent future misunderstandings.

* intel_fbc.c: Removed the statement that intel_fbc->lock is the inner
  lock when overlapping with struct_mutex, since struct_mutex is no
  longer used anywhere in the driver.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d4c5deff9cbe..aaaabba77b88 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -98,11 +98,7 @@ struct intel_fbc {
 	struct intel_display *display;
 	const struct intel_fbc_funcs *funcs;
 
-	/*
-	 * This is always the inner lock when overlapping with
-	 * struct_mutex and it's the outer lock when overlapping
-	 * with stolen_lock.
-	 */
+	/* This is always the outer lock when overlapping with stolen_lock */
 	struct mutex lock;
 	unsigned int busy_bits;
 
-- 
2.50.1

