Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99541AC0C7A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA3C10E89B;
	Thu, 22 May 2025 13:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="go5P8l60";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7AF10E89B;
 Thu, 22 May 2025 13:15:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a375e72473so2695454f8f.0; 
 Thu, 22 May 2025 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747919724; x=1748524524; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vxoelLQ3xnZ3lWasfsz00R9QOcYSSG43AUGMwmnbgI0=;
 b=go5P8l60uS8BZSJ569dH6p/Llc6QXg6Vmc6tuhqKY8Jv/kIe+gnEF6jc+4T/MD0YZP
 7LGkpI8o+n/AzCLfA+F67w45SPONosElHdNQs/y+Vs5aTKlwQ+Tf0CFUF7NqugaHONbZ
 Yvi8t2J0la/O2dOm+djCh3m7ZAOuOdUc2MRC41M2mhFY950pcGJfN7hKw41BCip5zjti
 gjI6VOqA4E92D1dMWvq0JmTmufVvN4zLabiTXUu7MTKoUeEZ8i44557v/0K5d0GSGyJO
 tKZxsxmF3/ZyBderSyXre4A4lK0+sVJTxpA1cmEpcpdl6oy4vSYwHWibBXH16D40WWFd
 x8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747919724; x=1748524524;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vxoelLQ3xnZ3lWasfsz00R9QOcYSSG43AUGMwmnbgI0=;
 b=IVAsAeCaQnI4uIw1UiPb8ZxrQnLp2dwureCewFufqFh3t8fLlnNazFQ+C2+QMf+rwM
 nFQzYJxuLfCYrvie3F68T9q6HCQWZ4CZ4OmUKrD94mPQQSTTzlzyWrBPD++/LZIYrh66
 XG7GVns7PPx2RJeT+QSpZJdt9w+4NuqpZH362Okjr2o2NVYOZn2lfj9m5hZGdA6HZzTn
 WBnAxbvYZUN051SRgNUHx3fIFUafcSH2Fq255v+a4jHE33jfyTn5iwKI3OiX66vjf0fH
 Mhv+4rzjsYuff1SrgBAhDQjEdQ5nNsIJgy91rnKoF3dYvP0XZtudxRpC7aj4cNZJTIo9
 Yr7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7JclEjqUQR+XPhCQzJzi/oZVDiCwXNgTWWELmBLbk6Byt6VwwT0X5VLlhQ1XTsujlE5dlbf7YkUo=@lists.freedesktop.org,
 AJvYcCUtj/JP5Ax8/15L+IXPc7vNdv1wIAZ3gb2t3klXGttt6VCDxZGzACgfKEfBNybf3H8lk84yzjC0ow==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvz2OKyipDPLKhjxXs7Fn9MPz1Vy1ZBrqW8yReFU209rIISuLK
 hgbbllz/9idXZYYLt1eaGhyY8KSoY86/lEj6OZp8lLG+2Td/Mkq3mdsz
X-Gm-Gg: ASbGncvf6RpLw0esCyCgHWwnyDBtRGQmRv8Qt/pRbxYHrsopByQCtBrb+5hgEwVDk27
 VzxVKzvABMepals2+JVBYKsDh6kzu4uDL4YB6QT9eNDUH7tOJ++iN1VMR6jaPt/pFMQX3dHEEKi
 PKNpq2yBo6oQd3fZwqjW2M25CIhMwgPGRPUbKHORCxsFvhAQIuk4ickzad6f9ExW8bS84FQrF07
 WeKJCTYPz+QtBNYXlFs3BzFKgkBuV1jG2zcgJ2t56F9fKn41vBpEMfKRPqSRJ582JpRmEXaQ+if
 tRTEu2M4dcPdC13nWvF351WhoEKqOhVkVpvOEhwRA7rSh+Yn7NKrvZp9Uvi9
X-Google-Smtp-Source: AGHT+IH1gCShUo+Eencgynt6FZ8+7Ck0TbDUAZN4oMnq9B63JRHVRgGdEuduDPWJ4m1a07j0hOB08A==
X-Received: by 2002:a05:6000:18a5:b0:3a3:76ff:a617 with SMTP id
 ffacd0b85a97d-3a376ffafa7mr11926320f8f.32.1747919723549; 
 Thu, 22 May 2025 06:15:23 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a3631c728esm21833904f8f.60.2025.05.22.06.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 06:15:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/gsp: Fix potential integer overflow on
 integer shifts
Date: Thu, 22 May 2025 14:15:12 +0100
Message-ID: <20250522131512.2768310-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

The left shift int 32 bit integer constants 1 is evaluated using 32 bit
arithmetic and then assigned to a 64 bit unsigned integer. In the case
where the shift is 32 or more this can lead to an overflow. Avoid this
by shifting using the BIT_ULL macro instead.

Fixes: 6c3ac7bcfcff ("drm/nouveau/gsp: support deeper page tables in COPY_SERVER_RESERVED_PDES")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 52f2e5f14517..f25ea610cd99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -121,7 +121,7 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 			page_shift -= desc->bits;
 
 			ctrl->levels[i].physAddress = pd->pt[0]->addr;
-			ctrl->levels[i].size = (1 << desc->bits) * desc->size;
+			ctrl->levels[i].size = BIT_ULL(desc->bits) * desc->size;
 			ctrl->levels[i].aperture = 1;
 			ctrl->levels[i].pageShift = page_shift;
 
-- 
2.49.0

