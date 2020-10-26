Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51329A642
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73096EB27;
	Tue, 27 Oct 2020 08:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE0E6EA64;
 Mon, 26 Oct 2020 18:12:49 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id l2so3481121pjt.5;
 Mon, 26 Oct 2020 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=5HO3BVg0bRzxOwVnCXHaH7lLzHwWVLX1pNvQSsPVR34=;
 b=rOPmEVV1mJNejym0bVuvH9D4QxMR/bgR/uiSbmV/sI7ehBqx9zE3tPQI3irbzRxDDd
 NVkrepuMoOB1w0rze3dUFqEABBGq17D70yo/wQS+XFRhJ1knlr0TapHWZeaLm0lLgVCk
 ajbJ95GkSBe22vslkDkxh0/mNDW9UCzxwEqwbcAtBcZ3rWDFT8cs/8wr40BP+cKqQAHf
 Xqaj+8TzKs8sGYoowwCqyFoKjAJxNF44AEdMxKebFyX5QZoG10rCJsWZXnAoU8L+BFA/
 TxvFoEMzVN/jfugVoIQqz07xC2kpg1KYm5gwFSxpUVe5PR3Uwti4rO2g8TWdiFD7Ja6N
 cmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=5HO3BVg0bRzxOwVnCXHaH7lLzHwWVLX1pNvQSsPVR34=;
 b=hXlSbc0VccIgVJs9qn0mJu9n/q1FBOEwjh40BYF3GzEXKhhD07Ew1vTkdgQTEjzT2V
 jLWFVO4Fi1pELUWl+Kge8Oi3b4gB9ZwgDsOvN6hnVIcS2SkRjazfxghTT3Tfu9YTkAMG
 6g75I3ExMv+IAVcqTvUFbzcovGuL6Q2BPihLbKo9/z0Q1mQi4ihNTILEffn2Yittjkn/
 Wgjt244F4j9bGuTwqXbcvwSVcyWIFgsljG+RtgTghFbKOykkE7DdQXcYpMOnuWdi4I0C
 LaSQemZ1nIEz5y9pQRNvVjfYSaMkrZnqurpxx+yQ22S8t1KCjjH6QhP0bgICPYhPkNcU
 +zpA==
X-Gm-Message-State: AOAM531SG8mKgF7z9x/owqeqHsTeNVIy9sJ53M3+tbjaFL20cY+2BmsP
 SJEKHrsSzCMusywKECEgACvLq0Na/UQ1XQ==
X-Google-Smtp-Source: ABdhPJw3MC9VJsJhf5LCjsccN1B3MXJSG0DukEpFAVyN8RH/TmAVMPOYgh2O/ngXwLl+nzdW6ZCrPw==
X-Received: by 2002:a17:90a:ca:: with SMTP id
 v10mr22381893pjd.18.1603735968845; 
 Mon, 26 Oct 2020 11:12:48 -0700 (PDT)
Received: from adolin ([49.207.196.21])
 by smtp.gmail.com with ESMTPSA id m3sm7813796pfd.217.2020.10.26.11.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:12:48 -0700 (PDT)
Date: Mon, 26 Oct 2020 23:42:42 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [Outreachy][PATCH] drm/amdgpu: use true and false for bool
 initialisations
Message-ID: <20201026181242.76bf3b6gx2yx7hr7@adolin>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:12:06 +0000
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bool initialisation should use 'true' and 'false' values instead of 0
and 1.

Modify amdgpu_amdkfd_gpuvm.c to initialise variable is_imported
to false instead of 0.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 64d4b5ff95d6..ba4bd06bfcc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1288,7 +1288,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
-	bool is_imported = 0;
+	bool is_imported = false;
 
 	mutex_lock(&mem->lock);
 	mapped_to_gpu_memory = mem->mapped_to_gpu_memory;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
