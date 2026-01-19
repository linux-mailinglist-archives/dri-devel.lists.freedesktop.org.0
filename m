Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54AFD3AA81
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 14:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4310E463;
	Mon, 19 Jan 2026 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IeEb3yMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70C810E3CC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:26:00 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-29f2676bb21so40976575ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 00:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768811160; x=1769415960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
 b=IeEb3yMFIElFypKdmN3v8FaJAEOVP3+OTUfCGesOh4QjIr02l1rq5u2EaKptst7wA7
 v08b9lYniTZaD+uLkjD1qat0azSdSVs1oJtwHy3IcF7l2fYTy+43nSV/s2EuO7UAefV8
 yTZ4qam6uAmn8Mw1XXDOKnpyGsWvAI99mYhp3eKbJExeLTsCFT8Vq/IBUhOW0AF4WBxD
 7REBcp5zO3sjuDp6HYasM/f7tKiVkNCwqr0sGt4uXNePrq+oK39i5C7l+flYurIj1Ly5
 D9ehrB1WnyzaXzG5EYhdbx4Yob8dIPMbM3E34B1MBdKG9928ys35DqKGrAxcDsZ5X5x4
 xo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768811160; x=1769415960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
 b=c2mDa8SYQl3lQ07TfU0rWd4yjk1LAWjYR5IRzKiL/Cn8OazL5iHArVUa9yY/4Y9PGR
 ImZyfGEo5jcFgxOmBobi7FpeYotkxuYaDZcu0bCYmyUOUm0axSo4d6ck69CC6h8MKV6A
 ytbmb4Xzmf99jiqG2lm6lgJ34VYdsOCzrtnbIbipVbef6cEYA9j5RxH9AhRW0vxpc1XM
 0k2sq8unAf8WFUB5PCEEzhAxqKWj+aaer6x3bsHKAlaDHy/BpwVeil9B1SYHuhPXs2HT
 DKFIVKvHfijXAwPFG3R3AHRjqgHf1y8LKCVnuTaUDRhAEvm/QnmC64c5nIBZQbgIt6T+
 17IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeL/d0JoPdoGWOnje1875wTAuC0Be/KRC8Vt7lIj05R+r2zIoOQEr8Liyf5nJXlI3tQJKQs4ZHobc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywgf+gHk2C5QzO02ibd1p4gFzw4itXF4/bF8j9vZ0bWX0fC+lL
 kFlo/bsqEYy04EbXvZDBSZk3rWOH+cK0NcJCmh0yBTJU+WYyhUgvzCaF
X-Gm-Gg: AZuq6aJEkPresmfhysRh5livSsTUpxg3CAxxzrEAJFaxJ2mZ7YD8v8aAt5Iyf8SJdaE
 7xRe9H20n2rG3jBjqRZYsFjrLXV8bzKvAxxC3Rz/eRU4A78dl9OaekppIaRgQdfyhgff5FIeMZU
 sTS17guhWgI9zUPQ0Rp3LbE3KfkY6XfEmKtF4orgTu3z179daai8El2cgnzTEytpaj7w18K+Rf9
 POEoE/gOHtVF6Wdp7KsE221ehanqc9ZDy9nXGooXfT4W+T1wSBDRrcLsvVdFmuSv9iqde38hKM2
 Zx3tMdMOPclBo9JNxqlwvbfIT5RbrmFopf8llGzfNavOsw+Ic+NDyxdj1MgD/JMeC6GWqR4GkfB
 K1UBXzMFVh2kVGJUgX9FJeg/HKakQ5WppnCSUPrDQGUhc8Iqq7qPFbOdyagBvjkrP6ZveDIFyib
 Ki4xN9flpZw6RRhlDOdk15/2HotsLGl0bEER9JPV+4eB1AcR2Q
X-Received: by 2002:a17:903:2282:b0:2a0:de4f:cad with SMTP id
 d9443c01a7336-2a718954195mr91095305ad.60.1768811160125; 
 Mon, 19 Jan 2026 00:26:00 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 00:25:59 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory corruption
 bugs
Date: Mon, 19 Jan 2026 17:25:50 +0900
Message-Id: <20260119082553.195181-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Jan 2026 13:39:11 +0000
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

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)
