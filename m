Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D0A591A2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FE810E26B;
	Mon, 10 Mar 2025 10:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UzzfUNn2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05F10E26B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 10:48:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so4663965e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741603685; x=1742208485; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
 b=UzzfUNn2h61lx78Lvd67li16jeAMAfcj7P91XCFhSKrhSoohUAH16TlJeIzwwv/kxb
 r/IKR3aA2gp7NCEqJ1xXKMXp+H6VBuofxUlwuPzLS1qAAJuorUsEFW0IYxE+JUAJcXnk
 SBeCQ7rjQbq2kT4YK+P5+UpLiKMRG5VI2wtcJkFVBsTHdvQ+Oi0Xr+dVYqh96eCQnMj8
 hW3dr00ffcAES5SiAxA2rY7ScRlnoj1kOdjCLBqSLKneRHi8biN92jFLlyEH19p+Bbqu
 C57Y5rqRVZOF7U204yAm/t6hW1a76aLjm3FTJO/gfBz3WFXCBU713I4C3s+0cCmSgOMe
 n3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741603685; x=1742208485;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E0yircpCo/QVU3P+N7sKYScgPv6naVVovFtBRlbgD6Q=;
 b=VFvTsOAFTqwUYisBVXQB7pxEUIJAWocTDvCWaED2Rm3q3SHeMRrquGg2bJ/XaVHVm+
 yTe3/Vf6rSNE7kS6Srt5BGAYxzlv4lZdDtbtAiBAEZiBp0pc0uv2/05C/kwwziZsfcfU
 e8oUj+3r+99xOsJ5gLmRUEYatucMv21q/7cX5YVady1znU9lI3WOVFtxpeo0Rf6I3kkV
 6H7kKDcvkfWBiard8Wpq3nhmOp4vUURf+XsYklqJ6LwoFO3ktbbOukBIPuOJOipTWyob
 COkYVXwJg7H6BCgRPwKRreS7p6vFB+ZFeYt173m8QcTeL9qkjsOz6roqKYRpCgFcw1cO
 M78w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOi1vJTOVOW8Kja+ECUYqLTc0MC8b0P0cqW/EtYD25OtTCI1Hrrl0AzDFLuQqkeNhd6hngSh/u/dI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMA5oJjshr2aBx7ceLPrywQKlarqWvYB9D0Uwc/KxOMpdTE6Jz
 2HyuW5T31DJeoPg+n06oajrF5b+QMl1Ce5TR71lNrW9iue85hYJ/2QccqdQxfMI=
X-Gm-Gg: ASbGncumYsaAblWdP6DF3QmofUgt3vY5DkY3SUJe91D4/tLbUGYKa1KMyA/c2TGcO3O
 MOkZLy4BZo23KCbeNh/7p10EWjMy9oADw804oZjb4CnZvi6kUlLwsoLf0Svkv7S5sQT52tkqilY
 tZBK0D8u8TROajvKhA+7M5DSraEOHPCcD9F+xpYxUAk1nAn1K6/Xwf+cmtm7dC3yXWce35dt1az
 JDVxpKgTJM2cPr+ZosN0f486qiVfy2scWQSsKh50+PqBAOUxJvlZzXHgwClqZMDk0ZbGWk9IUtT
 YA6CqbwLgUlQy+YOgTDNq2QVRflghaKgvFreebtGUtofG3AWnpkEeePkOE2Z
X-Google-Smtp-Source: AGHT+IFlBbMsdDkibGs+3E90ni36pDU1DtBtQx2GYLaxL8v3OUzQ9CG7PxwMtpFknCcyL00KBQQ92Q==
X-Received: by 2002:a5d:47cb:0:b0:390:df83:1f22 with SMTP id
 ffacd0b85a97d-3913af390a9mr5568803f8f.25.1741603684736; 
 Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3912c0e2bb7sm14676793f8f.63.2025.03.10.03.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 03:48:04 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix uninitialized variable in xe_vm_bind_ioctl()
Message-ID: <4a74b296-8b51-4dab-a2f1-69919da1ca62@stanley.mountain>
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

The error handling assumes that vm_bind_ioctl_check_args() will
initialize "bind_ops" but there are a couple early returns where that's
not true.  Initialize "bind_ops" to NULL from the start.

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 22a26aff3a6e..d85759b958d0 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3287,7 +3287,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q = NULL;
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
-	struct drm_xe_vm_bind_op *bind_ops;
+	struct drm_xe_vm_bind_op *bind_ops = NULL;
 	struct xe_vma_ops vops;
 	struct dma_fence *fence;
 	int err;
-- 
2.47.2

