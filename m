Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B2339997
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 23:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1676E6E057;
	Fri, 12 Mar 2021 22:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55746E057;
 Fri, 12 Mar 2021 22:19:11 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id gb6so5825249pjb.0;
 Fri, 12 Mar 2021 14:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5lCTRTL0XOntWq+/Jewv+3VDq5DVbLtgsr4PgJEUSAQ=;
 b=qsTbGYznsg4e7gIVNRJb1Wje1KmeFBB2621CW6lcd0qquAG8lwMa8ABuWdTamWZRkD
 AMw8elFz6Wly5FxmQcHEGQ7Ht0j6Qb5ty+IXNTRqeYhKP4Qg7KZotu7Ho7Il9x+Yf7zM
 pk+DusfI2ktr8p75HiRbXy4stwJArc79STx8fEHR7wc6MvdR7c9rlLxKF/3ZmbJOrwn4
 KL+WHDbvE5uVQPKMvx34QdnLmZT/nRodV2lDRA6jdBtlHm0wvX6GJOzXjNL9oseexnRh
 MJmCMoWtX1kcXW8YXEIzlblYaizhYgzZdVwqf6KKre+TZlqXbcqEgDlP8qoEwNwrGl+7
 EkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5lCTRTL0XOntWq+/Jewv+3VDq5DVbLtgsr4PgJEUSAQ=;
 b=BihUdty0MtPl+ePOZ4EuZ6wQ7uqeV+/zpFkgCtWsY3ImHSUMex5NuyvTwVKqdgJOG7
 avLSaUTLX+VjGPR+Q7X2uiPtc9S155MyBs8IyP2BxMXud1t7XBp3yBA0hBydAwq5oh9B
 eZ5qV1+X5X5BLhQax4vSMUYdY4fBDYdfYYeYM8fGuwK+sBgSww0QNmbkQsQ19w5P6yaq
 968LZcqv6hw+FAWn2LzB1Z8WC0Ve6hpgDxUUrqnE8VNGpydPDXDH4Rk18Ddc5zGSB/wU
 5SHB1QgZQK0tkIQtfWGLjU0TNVjwweFitfvP58aLe+JxCGF2MGig+KWVgj2Grwo22qGm
 frMA==
X-Gm-Message-State: AOAM532caPSSk/FFcqf/gpClcIfr+F48Lh6z9Y36ao+ZyespiuqjHIiK
 nHEY4zb4z3rbO8p1jwSDfyk=
X-Google-Smtp-Source: ABdhPJwklsbFkTp8L268idsEDENQZHXVv+PsUT6z+eiAfp5PhwrYIRisF5EVudW6Lta4saWme4DDxQ==
X-Received: by 2002:a17:902:bc87:b029:e3:aae4:3188 with SMTP id
 bb7-20020a170902bc87b02900e3aae43188mr650144plb.56.1615587551227; 
 Fri, 12 Mar 2021 14:19:11 -0800 (PST)
Received: from localhost.localdomain ([49.37.85.112])
 by smtp.gmail.com with ESMTPSA id z68sm6487329pfz.39.2021.03.12.14.19.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Mar 2021 14:19:10 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, Oak.Zeng@amd.com,
 felix.kuehling@amd.com, kevin1.wang@amd.com, le.ma@amd.com,
 lijo.lazar@amd.com
Subject: [PATCH] drm/amdgpu: Mark mmhub_v1_7_setup_vm_pt_regs() as static
Date: Sat, 13 Mar 2021 03:48:57 +0530
Message-Id: <1615587537-28989-1-git-send-email-jrdr.linux@gmail.com>
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

drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c:56:6: warning: no previous
prototype for 'mmhub_v1_7_setup_vm_pt_regs' [-Wmissing-prototypes]

Mark mmhub_v1_7_setup_vm_pt_regs() as static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
index 4df0b73..ae7d8a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -53,7 +53,7 @@ static u64 mmhub_v1_7_get_fb_location(struct amdgpu_device *adev)
 	return base;
 }
 
-void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
+static void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
 				uint64_t page_table_base)
 {
 	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
