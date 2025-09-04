Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0607B445F5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 20:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308E10E267;
	Thu,  4 Sep 2025 18:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i/Zei/40";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C5310E26D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:58:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so10943175e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757012333; x=1757617133; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=THAARjTe9E517vMG9YGk7Zlz2cjrMzVkQSu/T28Yamo=;
 b=i/Zei/40CnmYs0NUHiRNBhqsqxemQl98ygOtNUByiDTP+9TKsRndVUY7qEa6BQO5Xf
 9b3xEQQcSsAOhCqCXESOHNLil1ZshCz8x/J2yDwpZ7gCgETxJObpinPjBlIQex+gbXCR
 lQgpd1IoaIhOUe8XuALaMig5scBCfsuVuXc+kTVl5dfw6p9p4AE/wSJdY2FTdXFCpRAG
 Vh3tS9KQWsMvg5W2wJ1MoC30qvBFQf52+tpsQmvkczDIdixup0ucsYWs19Tvw18pljVK
 FTPcX8hoQu7ZvMUhkR2jioNK9jQq94D2xjxcPBMLEc06bb0Edg8kQ4PcIj3vD5+YgLFz
 5DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757012333; x=1757617133;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THAARjTe9E517vMG9YGk7Zlz2cjrMzVkQSu/T28Yamo=;
 b=Rs2Xa9ocN2FjikwLVqKDQJOndUHWdAolF5Rv1CIYTHhUDseVBOxwDfHluY6Nov4jtp
 MkwwtozRgzQj0W7yUy/un9ZyH6za5+ZFso4LAdFl/+8wES/0x9FXfrsvnpus5xhEeLRU
 Q61MU8Ocp+qmuRNCdaqsSXxlFCgDNmfQLk4bCs30LVJ3yBoatf7+b5FQfGcEVhaudHE5
 qrXzUAtJW/KJOkAkYy+oD++e30UVd+6tIqH+sq2uT/t5lmQ22fR2UImAdfuqRvttmv5h
 QasW/iN+qA3mO2Xz5BRvgx+n3syKtDmZivynlAO0U5mBK1S4SuqbVm8hxehZ8a5hAuAK
 RHNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSKYEKFG7DBgPwaUkKOWl3gAnUypJzgiRn/bgrP2MqUx8rS59IJfzEXkRD/2Dloe3VEjw6nTVBdPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb8HuBoQEhlFyox9eVWXJe0Pub7gmgwgjxPu4MGlrHCOSRGedZ
 XxUTtOJtdCMyK54HMZftGoJRjjxo+y4irde5Ym7lXN7wpGe56GJlN0YkOJbQh6kwzwo=
X-Gm-Gg: ASbGncuj5nI0vVtSPM7hFbpg9TpokQjKqjIcN9VWQFth69UYyc/NMN8N5wSPWWCIv9y
 phtzamwJUJ2Q5LQUr9fZVT77TWU+99/poErlZspB6N2o4KHMohdEoP8/XsJBumzVrpl/+5vDNxu
 YX8FsP7gaESscSwNnacEW759RqIJug/aCHcf6R9hqEUmTjhtPHQEji4nN0KePAqrzlZTtuN631o
 ejpkKGyH7LYcDi02EurovVSHF0KGDRgpcNM9IeV3mDdeqbnKooPWhZbkGJi2r6qemfOF0XgKs7/
 6jhuZ0/hmrzQ0y7MTXWK42QhDq/PWEj1xBoDc97gyIIggWkGyhqGLMGzMXQCrwBlxo9R88T5BS7
 +ApvqtC6h7CHyyf9nzIbd+VvBR0O61ynf5mpENQ==
X-Google-Smtp-Source: AGHT+IGHjaQMqzH68th7G1hlLUvy5iZJ7Ftrhmy23VSwVbhKc0VKhfXm8Y3FkmDt97UXGlsf+UOBzQ==
X-Received: by 2002:a05:6000:2906:b0:3e2:4a3e:d3ee with SMTP id
 ffacd0b85a97d-3e24a3ef991mr1671892f8f.58.1757012332670; 
 Thu, 04 Sep 2025 11:58:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3dbead0b247sm9395154f8f.6.2025.09.04.11.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 11:58:52 -0700 (PDT)
Date: Thu, 4 Sep 2025 21:58:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Francis <David.Francis@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix error codes if copy_to_user() fails
Message-ID: <aLnhaU9cLeAdim7J@stanley.mountain>
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

The copy_to_user() function returns the number of bytes that it wasn't
able to copy, but we should return -EFAULT to the user.

Fixes: 4d82724f7f2b ("drm/amdgpu: Add mapping info option for GEM_OP ioctl")
Fixes: f9db1fc52ceb ("drm/amdgpu: Add ioctl to get all gem handles for a process")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 63eb75a579ce..2b58bc805374 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1067,7 +1067,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		drm_exec_fini(&exec);
 
 		if (num_mappings > 0 && num_mappings <= args->num_entries)
-			r = copy_to_user(u64_to_user_ptr(args->value), vm_entries, num_mappings * sizeof(*vm_entries));
+			if (copy_to_user(u64_to_user_ptr(args->value), vm_entries, num_mappings * sizeof(*vm_entries)))
+				r = -EFAULT;
 
 		args->num_entries = num_mappings;
 
@@ -1159,7 +1160,8 @@ int amdgpu_gem_list_handles_ioctl(struct drm_device *dev, void *data,
 	args->num_entries = bo_index;
 
 	if (!ret)
-		ret = copy_to_user(u64_to_user_ptr(args->entries), bo_entries, num_bos * sizeof(*bo_entries));
+		if (copy_to_user(u64_to_user_ptr(args->entries), bo_entries, num_bos * sizeof(*bo_entries)))
+			ret = -EFAULT;
 
 	kvfree(bo_entries);
 
-- 
2.47.2

