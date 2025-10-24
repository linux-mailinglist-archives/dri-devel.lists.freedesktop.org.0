Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1CC04AEE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AA310E9E8;
	Fri, 24 Oct 2025 07:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GunBM+4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5469A10E09A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:47:06 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-430cadec5deso15086045ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 20:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761277625; x=1761882425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BTRPcVehq1ZOZm7xL/IWpW023usBfc4VwA4QLz9tUds=;
 b=GunBM+4Ow6UbCYAmkVSXIvyfkn7B0ouyHUY7mPofDrY44TVn0u2sgrDgIvVe/aWdq9
 DhqzsB0FSslAlMgIcrsA9a65J+YmHZ1+eS4clv/1yVa2uSyBryR4qWtIxf0afTbmtQm/
 erCzWCs3/2Eu3DTRSQrNt0Ezb1UPcSwAh9+zTlU6MtfgJW/i6RYsL/Oo80klWZUH8pL5
 0zWCYtcIrXWOojoq91/FqJBGOxMcy2rdU/fP6OuaDkCKwcHfrSku5NHRuklP4lCtox6c
 XpwVUKnrg4svWbvwt8ry6rcsy78I7jdrmYPZAtpyvyab2hJq9Cpbwyy7OTDllosuVu1y
 iHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761277625; x=1761882425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BTRPcVehq1ZOZm7xL/IWpW023usBfc4VwA4QLz9tUds=;
 b=u2DduUva8E0xdf+EVYh75l302izpqwqLlK+T/k8p5X98DA8f6+BJmpxEuWrDoOwLAb
 Jc/7m70witLE6BFidwqmea2W6NzJ8VTE2M5ce0f4jGk0Uvcj5gmH4CNBYzA45L9G3uc6
 ZOHG27p9oGlEzZ9TkjcfP2wWMRNv1ZOEfu7wsqroDskXBXbek0o0Vo+b8xmcnMYLMD+J
 TMzTQujjQ/8dCKh+L+qQz3CvZFMkNU8NhD3GO9ZsVRSHBkh7aUJVyUYZRd1bm4d2S314
 SPS13hHiURUzmVZ0AS8es1P+FvXdTjzDvRTwuW2gz58/9I6yslBDeVEi5YRslnm7IttW
 C6+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPvLiKyL1rZXyGVuX1jtyQgVqFCGyjjubnJHH2Rw8mk89DyrT16uqYRv1mysOblYFN/bLiaXGS9Wk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5E9mg8X87c7+OJ8H6rgksdgln6k5fHrJaO6kWDj5fmhNR7Lof
 vjU6fIF5Mrihcder2r5ShC7hK2IRCKljAAn5nkRutZ6JPW+mjZ9n7UgM
X-Gm-Gg: ASbGncsOTy3Nk9wd4pe9F5FSWUERtpp7rtzqebvrLlJPXDLAckWjsi0MUQP/rhU8dEC
 p8G+d5EelBzCCLehdRFp0c65ylXQhI+8KwlLcJYWF8s0zUAo9D3xjH7Xe0kb79+e2e5rwo3bDX1
 /Akb7M/ntJRyKrsAoJz3vJuMafeVN1dZAtT8gqWRGCWOkS3pCAh9NTQRB/ZwhASRBtbFeNG5GDe
 RGp/RXha+8++SQMfRUBNcwgvdQonaTiT7VG16WDt7DyE69TZla9C21Fr6YBfLCoEyh3v5VyeijR
 lkeqdsdWQzg2HR41XEXZnwmA6CRgoRqiIcNQ53jyMQPJcLRt9yJc353xLAngE5qdl1WnF4Br48g
 ujkxy2GqaBizNnXicdmkfWIR3AcsOz0/Jngy/iVadz2P+zyNgwo7tA6WdJOyOmQVo4LWkumiow4
 gXwh+V+M1li/wGGPunwu1u2f93zT+jC1QsilvwmyNRHATpkudilhKvFyB6qk+NyDgHFinSIWnyg
 L/888wL6B0YG14=
X-Google-Smtp-Source: AGHT+IF4nK0dDcEQMxrByQtKSDL+Vtp/h2LVbn+x1BPoCFDYFALAcbNWnpX4PRVrQ+b7Q3SGYy2kzQ==
X-Received: by 2002:a05:6e02:3e04:b0:430:c394:15a3 with SMTP id
 e9e14a558f8ab-430c528d628mr363410005ab.22.1761277625271; 
 Thu, 23 Oct 2025 20:47:05 -0700 (PDT)
Received: from abc-virtual-machine.localdomain
 (c-76-150-86-52.hsd1.il.comcast.net. [76.150.86.52])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5abb4e4bbefsm1712310173.5.2025.10.23.20.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 20:47:04 -0700 (PDT)
From: Yuhao Jiang <danisjiang@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, David Airlie <airlied@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Yuhao Jiang <danisjiang@gmail.com>
Subject: [PATCH] agp/alpha: fix out-of-bounds write with negative pg_start
Date: Thu, 23 Oct 2025 22:47:01 -0500
Message-Id: <20251024034701.1673459-1-danisjiang@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Oct 2025 07:21:29 +0000
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

The code contains an out-of-bounds write vulnerability due to insufficient
bounds validation. Negative pg_start values and integer overflow in
pg_start+pg_count can bypass the existing bounds check.

For example, pg_start=-1 with page_count=1 produces a sum of 0, passing
the check `(pg_start + page_count) > num_entries`, but later writes to
ptes[-1]. Similarly, pg_start=LONG_MAX-5 with pg_count=10 overflows,
bypassing the check.

Fix by explicitly rejecting negative pg_start and detecting overflow in
alpha_core_agp_insert_memory, alpha_core_agp_remove_memory, iommu_release,
iommu_bind, and iommu_unbind.

Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Yuhao Jiang <danisjiang@gmail.com>
---
 arch/alpha/kernel/pci_iommu.c | 17 ++++++++++++++++-
 drivers/char/agp/alpha-agp.c  | 13 ++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index dc91de50f906..b6293dc66d45 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -859,6 +859,11 @@ iommu_release(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 
 	if (!arena) return -EINVAL;
 
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	ptes = arena->ptes;
 
 	/* Make sure they're all reserved first... */
@@ -879,7 +884,12 @@ iommu_bind(struct pci_iommu_arena *arena, long pg_start, long pg_count,
 	long i, j;
 
 	if (!arena) return -EINVAL;
-	
+
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	spin_lock_irqsave(&arena->lock, flags);
 
 	ptes = arena->ptes;
@@ -907,6 +917,11 @@ iommu_unbind(struct pci_iommu_arena *arena, long pg_start, long pg_count)
 
 	if (!arena) return -EINVAL;
 
+	if (pg_start < 0 || pg_start + pg_count > (arena->size >> PAGE_SHIFT))
+		return -EINVAL;
+	if (pg_start + pg_count < pg_start)
+		return -EINVAL;
+
 	p = arena->ptes + pg_start;
 	for(i = 0; i < pg_count; i++)
 		p[i] = IOMMU_RESERVED_PTE;
diff --git a/drivers/char/agp/alpha-agp.c b/drivers/char/agp/alpha-agp.c
index e1763ecb8111..e2ab959662f3 100644
--- a/drivers/char/agp/alpha-agp.c
+++ b/drivers/char/agp/alpha-agp.c
@@ -93,7 +93,9 @@ static int alpha_core_agp_insert_memory(struct agp_memory *mem, off_t pg_start,
 
 	temp = agp_bridge->current_size;
 	num_entries = A_SIZE_FIX(temp)->num_entries;
-	if ((pg_start + mem->page_count) > num_entries)
+	if (pg_start < 0 || (pg_start + mem->page_count) > num_entries)
+		return -EINVAL;
+	if ((pg_start + mem->page_count) < pg_start)
 		return -EINVAL;
 
 	status = agp->ops->bind(agp, pg_start, mem);
@@ -107,8 +109,17 @@ static int alpha_core_agp_remove_memory(struct agp_memory *mem, off_t pg_start,
 					int type)
 {
 	alpha_agp_info *agp = agp_bridge->dev_private_data;
+	int num_entries;
+	void *temp;
 	int status;
 
+	temp = agp_bridge->current_size;
+	num_entries = A_SIZE_FIX(temp)->num_entries;
+	if (pg_start < 0 || (pg_start + mem->page_count) > num_entries)
+		return -EINVAL;
+	if ((pg_start + mem->page_count) < pg_start)
+		return -EINVAL;
+
 	status = agp->ops->unbind(agp, pg_start, mem);
 	alpha_core_agp_tlbflush(mem);
 	return status;
-- 
2.34.1

