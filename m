Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA658A024
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 20:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860E4A3302;
	Thu,  4 Aug 2022 18:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB6AA32A6;
 Thu,  4 Aug 2022 18:02:13 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v3so721221wrp.0;
 Thu, 04 Aug 2022 11:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/C+hKhyGa8Z8FqlEwwzUM2g+6zJUxH3CoGD+BmNpkRU=;
 b=R8+tjsNc1/Im1xglpXDPLenvKjzuwlsNixpILoBBmgw1sfowInHxLfXcsUxBYDCPqe
 BT0FbPwYmxRogJJkTHEWDG9cuc6pw4fni2WFcQ1bHrQDsMmEWDf7mUGRFtKfQ1BZzYk3
 7R4XAhochon4AtoWTnt32GOF3r5207wHw2Sfu8eR0RWFknb4QFrg32JZawvESIn4Vpjw
 zI+Oy82c5uBFxWD8obCGqB1qwzab8ZbyTu9W15RiyYXGUxMg0C44+SiJzpmxJjj71M8z
 dsdCNlaUcILZ501DtzJB2AWnBMuDOaoBPenga+h78WHT+qH9stUufLiZ9TdsRU8wF5GC
 G4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/C+hKhyGa8Z8FqlEwwzUM2g+6zJUxH3CoGD+BmNpkRU=;
 b=hlo3PitmFtqRBlFRLFvSZCqUKjKkuaVaPBn+TOHOO3YzMBCDNWcw6yetK0k5xcSEjk
 WrjEMr3h4tzqKdcoMR8YiKTlrUJU38ksUQfZbdjN4WbY4fBziwVF3vNxEHix0bsJ1CAN
 /PwMfJxb+sKixkQ9nYoBs6diGBG8UOVz8WI91JQQB9IFTAQk4vUxCafbW2cELNz5O6ei
 nusgfTWCOuxqWtneFagvK6QhMdDzliM3zuVzjGSh5e65YBJYvMZw4x/J4pwGlhI2AWIM
 IyfTZquHoXCSb8M/zGlmVDYmjS0BRTjwzBJFltsgPUQuU+jg7/+Z0PpCj+7/6TwGdGVF
 OHLA==
X-Gm-Message-State: ACgBeo2i+i3YS9/uU/1CieDUD6D9NhxhkMci1j8eieH/Hd6lYHWKbZtJ
 O4X+6xv/O1CLLB+jqJW4nvOhkP1M7Lk=
X-Google-Smtp-Source: AA6agR7MZ6Eh57nonDd1sdO5SezOu2y7/MW7ivmV4BitL7fH4HYDy4P9YkvpltcjsrHf+7Vev7SsRQ==
X-Received: by 2002:a05:6000:186f:b0:21d:96af:31ea with SMTP id
 d15-20020a056000186f00b0021d96af31eamr2145172wri.646.1659636131906; 
 Thu, 04 Aug 2022 11:02:11 -0700 (PDT)
Received: from debian.office.codethink.co.uk
 ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b003a2e27fc275sm2411299wms.12.2022.08.04.11.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 11:02:11 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/amdgpu: fix build failure due to implicit declaration
Date: Thu,  4 Aug 2022 19:01:46 +0100
Message-Id: <20220804180146.63184-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The builds for alpha and mips allmodconfig fails with the error:

drivers/gpu/drm/amd/amdgpu/psp_v13_0.c:534:23:
  error: implicit declaration of function 'vmalloc'; did you mean
  'kvmalloc'? [-Werror=implicit-function-declaration]

drivers/gpu/drm/amd/amdgpu/psp_v13_0.c:534:21:
  error: assignment to 'void *' from 'int' makes pointer from integer
  without a cast [-Werror=int-conversion]

drivers/gpu/drm/amd/amdgpu/psp_v13_0.c:545:33: error: implicit declaration
  of function 'vfree'; did you mean 'kvfree'?
  [-Werror=implicit-function-declaration]

Add the header file for vmalloc and vfree.

Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index 63b2d32545cc..726a5bba40b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -22,6 +22,7 @@
  */
 #include <linux/dev_printk.h>
 #include <drm/drm_drv.h>
+#include <linux/vmalloc.h>
 #include "amdgpu.h"
 #include "amdgpu_psp.h"
 #include "amdgpu_ucode.h"
-- 
2.30.2

