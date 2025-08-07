Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A396EB1DB12
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 17:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F1710E87A;
	Thu,  7 Aug 2025 15:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ijMzHt4T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D3210E87A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 15:53:46 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso8152855e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754582025; x=1755186825; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
 b=ijMzHt4TrCRvGAD0d/NlA/MjczqCFo0SeuqJTISY2rPfj7D5JtjrYYc7U/p0HP8dwt
 atltHTs049+DyKHm0APh+EqNcd/rTdPrCFieSkm7afRsg4rr9k7wesuXN8yfW/jPxsNv
 7TrKUGCO7zHKvKqb7qlBw8ZFlijOvrPlfzmVFvGzp1Dnar19m56cVillLMfDtijb6cjw
 y5lukL9kcpBNbgBC01dmBX7bPJKm3sBQ5OyVsS2FRusbLPWxEE/4kfCbsimk+713yTri
 pMdtDpkToQA++GXCjKjc0vSBWAtsCqmOzy5t3akM/en1A9zVevMn4OE/qJd4i694wLH5
 VdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754582025; x=1755186825;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
 b=mILJYV3YVuN/CzF6sH8KvlYsBxGL9pLFMZ4oOia3GlqBTsrFctkk/9tLH7tVv0OpeD
 f5OPEv1lrEyP6Pz+BwoK+Dc7Sibj/8zI/hjfwe1v7iDXDQoyMCDxuxEcKS/JYqxechnv
 rgrPjZ4EJtutLFsr2giGostpKq0OUukwIoqXRC/YjR6qc6y/V2MO1XxricKPLcgpuYb9
 2ACD9Y1YfvZArwNknPZ3SMRb744S3MvFi8gwxkzhTHlNsmhCv7xaDPgRJpNdroW9YGOA
 Ie0FINdP9M+B12TBb9gvCGnKDMHhJ0OWwVH/pKZ5CVvQAf+79vz5xtQtkTcHC0Peq2v1
 4d/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCMDgW/qAndKj2h1EssIHUGP+SnRsunzmBTISDV00PGM1DZpJSHh222cnKJeI6ezvQNaC58uXqcWU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEKWBDso+8/RkvBOJQkVvWNAuu4qQRMt+CyYjhCR2aetR/q26J
 phYzMztrKxy0k//19WUFpFEcCwXz4IeE/ioZrw6Dl+lAwVzdoG+q6yh3AYi/u6TRmeY=
X-Gm-Gg: ASbGnctsXF4hQr3owmgb6tFGq2fdgMwzDeFRGYsQJYpIDMwiOROQ3D8VBmaA+92zPOJ
 GAXZ+yilm2h5T37NJwF9vvr3SMPp76jk6YC3inUjkOdC+WWb3DnHMQBX0D2OA924xjxdKsjilwp
 ubBn4MYoKhWu7hSqY1eP7LaTKBirBoSWUnYbXpPBAvSeNS8dCLbpRmiij3pBkxEiIXSPwXosavc
 5LuNsmdq9cd4XYWhCLRoHTYPgv6UWedjZM7QPD5T10WGZ0MzLJepAHsoaAgUgKPrrefIKVipfJh
 UrlpnAfm+XiWXAs3iUNQNItORJcfxBR1g6sXkJfn7xAiJCnX2Vn9EuYEBVTQouHuiCQpMthvB1I
 uLSCPtdsZz3SRDn84s/3YVeEfKM8h+vJoU+t77Q==
X-Google-Smtp-Source: AGHT+IEuAgZgwkFD7Z8Xqqn2h/YYU+isAy36WnGYO+M9a5Hc0G0oFkUuedFLpME4SUzRmU7sRh6FqA==
X-Received: by 2002:a05:6000:2204:b0:3a6:d349:1b52 with SMTP id
 ffacd0b85a97d-3b8f41980femr6076763f8f.21.1754582025300; 
 Thu, 07 Aug 2025 08:53:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459dc7e1ddesm176487365e9.27.2025.08.07.08.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:53:44 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:53:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aJTMBdX97cof_009@stanley.mountain>
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

The xe_preempt_fence_create() function returns error pointers.  It
never returns NULL.  Update the error checking to match.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..5c58c6d99dce 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	pfence = xe_preempt_fence_create(q, q->lr.context,
 					 ++q->lr.seqno);
-	if (!pfence) {
-		err = -ENOMEM;
+	if (IS_ERR(pfence)) {
+		err = PTR_ERR(pfence);
 		goto out_fini;
 	}
 
-- 
2.47.2

