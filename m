Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1D5A4BD5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DBE10F1A1;
	Mon, 29 Aug 2022 12:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A5010F1A1;
 Mon, 29 Aug 2022 12:29:20 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w88-20020a17090a6be100b001fbb0f0b013so8371405pjj.5; 
 Mon, 29 Aug 2022 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=CQmPQiZbqJl3F1hmW3HEOlbIzS9LIPFvPFvLkS4xj3A=;
 b=OYKzSZaMCxX4OXsRl1egB+pH2XdaiGlHR5RdNXaCcpG2JWVN+/X1Gg4jhGTuCDsqS3
 xQieVSf1ZVHuHezy46Pz4X+r+auMgAbjBZQqJIJUUjOFGfo9M/1BecpJdnVqVzJcQR+D
 5zpoqRsdzwxL0jC6akJ2u4RWY514EZfImXJpiUfHPxD8xYpSL7RelRug948NB8icEPdU
 h+9D5swl8uKtXhJfYIVoX01taLqe2M+7S8YYVOcxB2yXMSrKBBir5LhqjRq8b+spCs4S
 okHtMa1GHZFw9vgDHKKnENsXw1j2uNmLPbCla5eOLzm56Wev5V7DrzTS5rWp51z6BaUh
 Tbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=CQmPQiZbqJl3F1hmW3HEOlbIzS9LIPFvPFvLkS4xj3A=;
 b=DudwB7LvJ7rjGWnEsnIPGrn/5ohX8bKsr3G7jh0KNXcMSG/9ia5BSJ474uApdJp8ir
 T19SByQzfWH/Y/MWOeZQ7G8a3mO1fH+KnfTrzSMlt9bFR1TGhCDGGy9znOBmseOGu/bv
 x8ibnFgRkzPZj8bH6qeu5G0JIVnevrLaZUQ1pp/2Wkt0qnqYflepNgafKnFWQq/VoNub
 Bz5BDnuU2taa8Z1pC5oZB4kQDJ8T+3+0xgfkRvKHM3+/gR5y+achBdQdeaYOCHhXPfeZ
 ENBKLa53NYjMAuxIo+0SOnpiVZ5BVzTfdTi1pEcIV+kbISNn8A2Q5dVKkr7MJQ23AVCA
 p4tA==
X-Gm-Message-State: ACgBeo2gPWozElWdhs8Ys27Ar6f8/omF9225kexeITSD5YJnT3Eu6OS4
 GczbTZk9neYLu+l80bKBp94=
X-Google-Smtp-Source: AA6agR4ERp49BkEJRZeAPhtidKBWr2tA9X2Jqu9y5S2+tKQ9seYBETGT092ViFsKvqltgF+DFoNh7A==
X-Received: by 2002:a17:902:be16:b0:170:8ebf:204c with SMTP id
 r22-20020a170902be1600b001708ebf204cmr17047264pls.47.1661776160098; 
 Mon, 29 Aug 2022 05:29:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b202-20020a621bd3000000b005377c854b50sm7109553pfb.1.2022.08.29.05.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 05:29:19 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH linux-next] drm/amdkfd: remove redundant variables err and ret
Date: Mon, 29 Aug 2022 12:29:14 +0000
Message-Id: <20220829122914.268251-1-cui.jinpeng2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jinpeng Cui <cui.jinpeng2@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

Return value from kfd_wait_on_events() and io_remap_pfn_range() directly
instead of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 664e8b5d82c0..84da1a9ce37c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -876,14 +876,11 @@ static int kfd_ioctl_wait_events(struct file *filp, struct kfd_process *p,
 				void *data)
 {
 	struct kfd_ioctl_wait_events_args *args = data;
-	int err;
 
-	err = kfd_wait_on_events(p, args->num_events,
+	return kfd_wait_on_events(p, args->num_events,
 			(void __user *)args->events_ptr,
 			(args->wait_for_all != 0),
 			&args->timeout, &args->wait_result);
-
-	return err;
 }
 static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 					struct kfd_process *p, void *data)
@@ -2860,7 +2857,6 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
 		      struct vm_area_struct *vma)
 {
 	phys_addr_t address;
-	int ret;
 
 	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
 		return -EINVAL;
@@ -2880,12 +2876,11 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
 		 process->pasid, (unsigned long long) vma->vm_start,
 		 address, vma->vm_flags, PAGE_SIZE);
 
-	ret = io_remap_pfn_range(vma,
+	return io_remap_pfn_range(vma,
 				vma->vm_start,
 				address >> PAGE_SHIFT,
 				PAGE_SIZE,
 				vma->vm_page_prot);
-	return ret;
 }
 
 
-- 
2.25.1

