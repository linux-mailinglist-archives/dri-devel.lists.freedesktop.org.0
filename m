Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD99ECA750A
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B5C10EABE;
	Fri,  5 Dec 2025 11:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heSebT0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE1810EABE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:10:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42e2e239ec0so1253335f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764933036; x=1765537836; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
 b=heSebT0YwLGcFfctAD/6K7k3zouyyHKgVuoH6CbMYmHdoISCxMc4FOkZ5K62PPedxM
 8e9BOEjhBKkycD/dplmKWz+y2VGBm8H+YDFAaBHMZcX1jZLrnDX4PJ2N2BT4SqoUE3ko
 xH8kJUOv0cFKS7RukqAmNGyLexCpE7Kia1Ptdxwzi895w5rpepqMrQhCw5GsEqwpvsgY
 pRas8J+iBzVdes2IjI5c8vHM1YIkppBLOknHkbt2yldTr0USOaEl8wAV4J9ETISZw+vE
 Pt9Jeq9bCazVAWs8ohLPaMC+OLEQDNj4CDZ4lwf0oEvX38n12l+pgIbMDSDvkQ3VhMam
 sN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764933036; x=1765537836;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zh3HlpbXaEbsFU72svAbecwrRCi03W2DYbr0+25RALI=;
 b=RB2bB0MeXB23+v6TawsR3x4x2/Leh8RT8leOK1WH0bKTonBWbX1IJ/9pOEN9hCS0GJ
 UcJ/eZJiUpyiW8+9+ZM08jwxlq2r4+HrCMy0kdv27zWFyoq9fq8Sdepz0lbpqyNoT9f3
 lEQtfdZ4uRhOyZx19diO2H6tqdliYqlDNK0sSO7MQimqfl9m4BJiKUnSQa3E6qxtp6Tb
 hNzGnMj0RvpGTf6e2/UCKnf1ppVAbkJl6d0hzdv/Ak+B/kpuohsF0TM415mdj/muaozs
 XNxSw0d1hHGPpEnSgYnU1wJeW4bNSOiLz5T56p5dJE+t/YyUlyI/JRHDf2wS5slT4vMR
 Bupg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWarey2R3wXNLlQ8XqpkMVHAXZIw2OQXclTyk0SvXpp/m2eSR56YdtO4du7Yxrup6c6m6BXStiylyw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSVkUoIL3CR0xiB6awck+hao2/8boweFHk+lxtcbD3HV7WbZyI
 Uh0zd/5CqBJWfCpFEiz+CHuDo+JQ/9hV5FPS2oa8Uj9iFtRIYIZPkHn7zteZYtE2Wjs=
X-Gm-Gg: ASbGncs/56QdkFERBgGmVv6ALsyKkz6QFiiC17DjRh1yHbVdGnWRFyIZl7PGh1PoELw
 5nc9Jlo7ReS5pryQFwKCjYzPNzYIQTh3RTi/4qKv7I67IUVS5Nopq65bDIWDRHSnRLxhhPPa/2o
 RFvdCi3BDuV+A8ZJlLfULqYG1oK93D6rNIyO9oagbSgLiyzH0Sd6boXVhAh4rJku51ouJrQDHxU
 Te5pVEbCyBZSrp4wZqetQbJays2RpVWtb/hNAkns+aF39IRb0RJT3wnJHM1GRioWAK/M9bfs/bM
 vEAYkXzLI6zKRjHOl5NLT7iEAPpM2tV0rEe8TlBFmeCebWJxlFZa3YQ3v5ZQbshNI4xKotPDWYZ
 0bCJ5pzDYlhHeIwheNJP8YkVstZvDyOnFI7jRaaRO7lyuXyZaLqPbusWj7VHECenJ8gaSbHQG3F
 TMaof02wXZyLruawrVLZtUmUkw74k=
X-Google-Smtp-Source: AGHT+IFBPmoLYadSLlgUwTUBgvI/LNUXNDFZy6frbQ03ZessPie4IT5h/pfwlVJys+MolOQK0aUa6w==
X-Received: by 2002:a05:6000:22c2:b0:42b:3c25:cd06 with SMTP id
 ffacd0b85a97d-42f731729b0mr10031252f8f.22.1764933035867; 
 Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42f7d2231dfsm8337840f8f.26.2025.12.05.03.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:10:35 -0800 (PST)
Date: Fri, 5 Dec 2025 14:10:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe/vf: fix return type in vf_migration_init_late()
Message-ID: <aTK9pwJ_roc8vpDi@stanley.mountain>
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

The vf_migration_init_late() function is supposed to return zero on
success and negative error codes on failure.  The error code
eventually gets propagated back to the probe() function and returned.
The problem is it's declared as type bool so it returns true on
error.  Change it to type int instead.

Fixes: 2e2dab20dd66 ("drm/xe/vf: Enable VF migration only on supported GuC versions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 86423a799d57..1b75405b8d02 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -226,7 +226,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 	vf_migration_init_early(xe);
 }
 
-static bool vf_migration_init_late(struct xe_device *xe)
+static int vf_migration_init_late(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	struct xe_uc_fw_version guc_version;
-- 
2.51.0

