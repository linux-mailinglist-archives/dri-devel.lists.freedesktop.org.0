Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34E98EA6F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0CE10E7B7;
	Thu,  3 Oct 2024 07:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdbzrFfB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E229B10E1E3;
 Thu,  3 Oct 2024 07:15:02 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-656d8b346d2so359867a12.2; 
 Thu, 03 Oct 2024 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727939702; x=1728544502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wa4pIu5pC+135xygnD713lEhYzLZxMaLiQkWjJzvNgM=;
 b=NdbzrFfB6bC404gglxeeS2LVrOwEnQWihhv6oDCA5fPMaSdlk6pyA6jXy+2V6l51Nk
 SqYTIcGc+h8MJ6O1rX9O5ZeSC2acURV2OhrXlBq7pm4CUdVeWOAb/OPvhrHyQ/Y05di3
 Plfu0d/Maoi+sED27SzcYcddY5DwxbGt+KtBffY6f5XFCob4THJOJIfAJTY3vKQWXwwG
 qkERHwyZ8gegiElbYd1zCi8uFFJWN9aD5XGpw9nv0m9mEp+O2qOzoY9XGs0AjYZhfB+S
 TQMCIg4TVXm2hYaN5XcuydnqNswBv7LbELtXIRC8DqvdhCICsEis86cIJ8lhGqBU9Cuo
 hqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727939702; x=1728544502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wa4pIu5pC+135xygnD713lEhYzLZxMaLiQkWjJzvNgM=;
 b=OXR0TovJNGTsLXZJCnigyGthgalhs003fe4IwQFFM2kBmUws+SLnxyr5eSI2VbjtJ9
 8F654U8svO6RofSiWzZqfrZXQombnetVe6VL0TSmo2E/l58vt8TNPBeTGtJrjOLiG7k0
 2qzbmaHqRk98TjQYaufPwFYH7y5C7bZZblVdKT8rWIiPEn8OrXW6cwVGHYoYI1ljxM4o
 aoaqlbjFQ5jDvpnTofq+jfyI28hfDWbLk+iWnXQnmkAEHftSXh0Yz7n4gDBDx4o0c5jc
 q8etBEMpYAlM+YaAhOOhLsRyq5JwW5n7Y9+SG6lel/kev1udfOo0nxhAArTbgwNWTch2
 u6cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+nRpvRjSKHSaTbXzyHcsgXP0N4fzo/xd0SZZwc6GUvfuT+Uld0OZalecmhBD/EXKge3aWbFwdWf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkcXeWtEnL8X24Jg8bC3dql2oHPVnyZUlinu45Dv66HMXMQmO1
 iD9oShzRKECDGFHLzJp6pVhls/kr6ZzRuFwt+s615Q5C6a5VaV7x
X-Google-Smtp-Source: AGHT+IG395izEmIc+wheQbgooKM2yOIXSyp8HxCpDyfAtHvRK9D3lYz5JKBwip2Ls4SZJD7e4PEZOQ==
X-Received: by 2002:a17:90a:8f03:b0:2d3:d68e:e8d8 with SMTP id
 98e67ed59e1d1-2e1849e48bemr5475891a91.40.1727939702292; 
 Thu, 03 Oct 2024 00:15:02 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:b1fd:ba19:3835:b7cf])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1bff53549sm763656a91.55.2024.10.03.00.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 00:15:01 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, advaitdhamorikar@gmail.com,
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: [PATCH-next] Fix unintentional integer overflow
Date: Thu,  3 Oct 2024 12:44:31 +0530
Message-Id: <20241003071431.328259-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Oct 2024 07:37:11 +0000
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

Fix overflow issue by casting uint8_t to uint64_t in JPEG
instance multiplication.
The expression's value may not be what the programmer intended,
because the expression is evaluated using
a narrow (i.e. few bits) integer type.

Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..b6f0435f56ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
+	mask = ((uint64_t)1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
 	if ((val & mask) == 0)
 		return -EINVAL;
 
-- 
2.34.1

