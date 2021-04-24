Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C736A08D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 11:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267F6E1F6;
	Sat, 24 Apr 2021 09:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841CE6E1F6;
 Sat, 24 Apr 2021 09:40:30 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id y62so3010848pfg.4;
 Sat, 24 Apr 2021 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LA57vWCVMiY4P4woVTvjEC8mwlFLbTmc6hS8nrtLwxk=;
 b=UHnm3Zn5HEbbnn5HFCMzzMQPadz+vkhBazkUKZ4mAc3p5JOou3t9BqDtm1cb6txw2G
 gAnZ38tfzxUXHSNmbcMdXUhCnLjjb2R67/imj108QATFLT+Jv3DUW5jOr96RumMzj5w/
 kbfGNlszEGrOx72VzADAdcZzlL1LbeGmedZtkikkTj1OotgEUFkI3L04xFzupfqxV/Uo
 lgb3cS+fPoVCN2K+WxdR3q2Y3LmbwUo7BmOPPXJHd+J0TuzBTzI/Lw56wGbt63dhG1d9
 TXb6xOGfjQf1k7kGWGaLhpXsbtxBu8LUc2iZ3j8jIlhiajMkGAJCazJ1v7WQpcITpwrr
 xkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LA57vWCVMiY4P4woVTvjEC8mwlFLbTmc6hS8nrtLwxk=;
 b=nUpwyAA2HmNDYSafUZemWdvi2wJj+T13j9Ggg5A7pxherzFHLwLj51xUcjX1NnWaAe
 HZZ8aFwh58nMRDm3Vvk0PNIbqzK1kJJjTFoNuE8MW3GiJnyQrtO3T5Fzemz5AmH+wjbx
 URkt4FqB8BlsNe4sCM3Kx6tnSToK5nJjZznxfqu20Vuf0c7tcv/1qLLlmb1EBUIF69s7
 u8w2IiCx8XVMFQ7822PErmdIKGOhMlhb1spitSFoBMVuagpQEIiBi+Rik+3W1dfiDaTP
 XY3WRmUmo6Y9IuwsedPkWZMkWO29hIm0S35fiqxccJQgB4vj5y2f6VFw5G7d1pY4la4F
 as4g==
X-Gm-Message-State: AOAM532dunEqPfhlC7TtaKq5+i39z6OyTyrdR2zEQuqc/ez7Y2StdFpB
 WhNQNDk2fTaYxalZsINRPdPsuDpARHo=
X-Google-Smtp-Source: ABdhPJwg+tg8GcPgDvv2TDIocwUvqkaroiM+AEvPeULvWWiUJbExOXBCKpVrELN6EVIIo6LoFm7imw==
X-Received: by 2002:a62:9283:0:b029:25d:4039:cac1 with SMTP id
 o125-20020a6292830000b029025d4039cac1mr7867494pfd.77.1619257229981; 
 Sat, 24 Apr 2021 02:40:29 -0700 (PDT)
Received: from localhost.localdomain ([49.37.81.172])
 by smtp.gmail.com with ESMTPSA id o9sm7228119pfh.217.2021.04.24.02.40.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 02:40:29 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/amdgpu: Added missing prototype
Date: Sat, 24 Apr 2021 15:10:20 +0530
Message-Id: <1619257220-3905-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel test robot throws below warning ->

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:125:5: warning:
>> no previous prototype for 'kgd_arcturus_hqd_sdma_load'
>> [-Wmissing-prototypes]
     125 | int kgd_arcturus_hqd_sdma_load(struct kgd_dev *kgd, void
*mqd,

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:195:5: warning:
>> no previous prototype for 'kgd_arcturus_hqd_sdma_dump'
>> [-Wmissing-prototypes]
     195 | int kgd_arcturus_hqd_sdma_dump(struct kgd_dev *kgd,

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:227:6: warning:
>> no previous prototype for 'kgd_arcturus_hqd_sdma_is_occupied'
>> [-Wmissing-prototypes]
     227 | bool kgd_arcturus_hqd_sdma_is_occupied(struct kgd_dev *kgd,
void *mqd)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c:246:5: warning:
>> no previous prototype for 'kgd_arcturus_hqd_sdma_destroy'
>> [-Wmissing-prototypes]
     246 | int kgd_arcturus_hqd_sdma_destroy(struct kgd_dev *kgd, void
*mqd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Added prototype for these functions.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
v2:
	Added header which has the function declarations.

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 9ef9f3d..6409d6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -25,6 +25,7 @@
 #include <linux/firmware.h>
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_amdkfd_arcturus.h"
 #include "sdma0/sdma0_4_2_2_offset.h"
 #include "sdma0/sdma0_4_2_2_sh_mask.h"
 #include "sdma1/sdma1_4_2_2_offset.h"
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
