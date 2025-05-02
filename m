Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926EBAA699F
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356F810E8A9;
	Fri,  2 May 2025 04:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R2R3gBOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7652D10E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 04:05:35 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-309fac646adso2611977a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 21:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746158735; x=1746763535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=neyfZ9mZhPKX7BwXaaWBbaQGQo+eJ96uiikp+k/5vSs=;
 b=R2R3gBOAEiZg64CtsJbiLlpsDUF1vZ6FCnrkje0zdJIk3OAkB7NNUH9YQhzrGDtY/9
 s/9wt4lnorxnFTgTr6azl4mpdRhgdx955Od0Sj64DgAAxN1Tx2D/NsKOc94w5IgVy/Xv
 Ea9bir3XXhSYgVzcCsTBVJVtjIZ19OJLjAPK1twEsDeMKAlF1cprrZjd9+1L2/OGxByp
 8txbUzvsdfGxGDiE/6otusX+ZSTTbrzYIatryWFdKc1Uv8EAemmgS2NGzc6qSPgDmUcE
 tGDJSo4pr5kd/6bm1u2zPw8x5ISWa+grikPpuKPls18h7EKjO4JJ/Vw7RApFxjWnw8wP
 0Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746158735; x=1746763535;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=neyfZ9mZhPKX7BwXaaWBbaQGQo+eJ96uiikp+k/5vSs=;
 b=DiHTYRYKJ/BmmUfaRWPayvdl23KzwLqHve8ltDjshzxVFABRA15GLCHKSm4Y+giujq
 UQ4+WeDfJ8ZLzY23zol9MlImVN96hJK7NJJXl106EMvGUoitZy/RAbxi/lqB9Oq9hnSW
 nvTo/0OwCwoZwDqSNoTnio0wIvxQKHsezgStVvWADWvSVXIQsek4DMoZqfMTp7UXG/tE
 AM5JCZyCA0fzH5olWgog4tJmMp6ar9r6uk6uHXsXSqFG8nqnw/hsxhiwvAimAM+O5qBG
 q2DMYxwrIorNRzfyomFBPwbe08k7WCPBPtXPnsCOTRAx9o1AP06MBR3qDwXtsOlaB2xf
 OIGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaRiJXrpEwAsdTRtqEjBnlJ1DsB6kHO/MSb/pNyUdNMpJws9G5BhpsPoWW1JKPAhaKpcNbzZdVVJM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwfrW9wWgNjjrWrB4r7uCBsxWRDBWzxPhKTNpy7Zx9WGhmhDKQ
 /+/FHpDI6JSh0KSo3x6SM8Kip+CdJSgiHHZFE47IAU2EzjHdTv8+
X-Gm-Gg: ASbGncvJaA04RnnG8bhn720uASGGouZ/+kSc8NopwMoFyVsWyGIsWIp6uOiJdnMoArs
 8BB0BVuRsW/iU346kM55DC/bP2zvQPr4wfYBDlVMn4eF8rxf7yZxmq0FraAWY8T1DdlcivFD790
 QXkQDYxLJXwsrLNIOSNxaB5zuUlEYlrL3uZTleVngaZTgP1bbGf4GRxrD/WzVGaykbxkMf1Knh0
 9Z3E6yRxH4wmoQi4v20gOeZ5J/ocN9atTnuzxhNQcykStRHvCntBDEkb8lAdUX3M3GNOSqUihJ3
 D0A+aCfynMbnYBF4m9br8OTCdsfAZAJ88uxKtDbOt30xbMozPZ+ueO4VcbuDWWbQ5xRvKPK+jRp
 73rjHDPxZVHmOpjLiEWI=
X-Google-Smtp-Source: AGHT+IHo2Zl48y0lzt5k/TuCCUIjgSsIhm63oyFJMf1DlpPvH0HpvIhbqVlFBj5QVLZttS82nNSB0w==
X-Received: by 2002:a17:90b:2752:b0:2fa:1e56:5d82 with SMTP id
 98e67ed59e1d1-30a4e2387f3mr2569507a91.17.1746158735128; 
 Thu, 01 May 2025 21:05:35 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fb836sm4510635ad.141.2025.05.01.21.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 21:05:34 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v2 1/3] mm: Export vmf_insert_mixed_mkwrite()
Date: Thu,  1 May 2025 21:05:23 -0700
Message-Id: <20250502040525.822075-2-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502040525.822075-1-mhklinux@outlook.com>
References: <20250502040525.822075-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Export vmf_insert_mixed_mkwrite() for use by fbdev deferred I/O code,
which can be built as a module.

Commit cd1e0dac3a3e ("mm: unexport vmf_insert_mixed_mkwrite") is
effectively reverted.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2:
* Exported as GPL symbol [Christoph Hellwig]

 mm/memory.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory.c b/mm/memory.c
index 424420349bd3..24dc2aacea62 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2698,6 +2698,7 @@ vm_fault_t vmf_insert_mixed_mkwrite(struct vm_area_struct *vma,
 {
 	return __vm_insert_mixed(vma, addr, pfn, true);
 }
+EXPORT_SYMBOL_GPL(vmf_insert_mixed_mkwrite);
 
 /*
  * maps a range of physical memory into the requested pages. the old
-- 
2.25.1

