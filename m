Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F895AC2748
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6ED10E835;
	Fri, 23 May 2025 16:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvZ9rKFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1438110E835
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:15:45 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b1fde81de05so15473a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748016944; x=1748621744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fcO9TXDJbv0PnpLhAYEgKHbgViS8WVoRG/IIez/PTTM=;
 b=MvZ9rKFZ9I/lQHCq0OfJVcXQCHrCsrfyDOFFmjB6a9FKH7FfMxK58C1Mv3w0NlwHU/
 ftw8SF+shZGp1kXIsngHGgu/ZdAtoiAOq13CTjaRIguZK6XB+4ZW0LVZy5vrx5Qn/xnR
 RHvKlzdPHuQ4w8jOzk4soEUtXC8kb2mgvNjniVwi/k1FR1Mf0hHN1irQLTgDPSa1Q+Ef
 37KJGo8FnLXMXFW9FFMUwvbg3Kw+ZTvnKGNxIVgD8NC0PUrY37WS6GCSYRwTzapRys6i
 GtMMXhU8ucRxViuzb3qRRSi/3kwQ9HcBNjLFWvvvUc31nuFW+oBEUEk+DKIvWOf1A7F7
 +X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016944; x=1748621744;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcO9TXDJbv0PnpLhAYEgKHbgViS8WVoRG/IIez/PTTM=;
 b=pi6yS8/2NBBNo6N/K+wghJKV0arcYqpLAxA6J2FWZKRbiwIXTp6TmkTUIkc/inTsuH
 wSs/C4Dj0a8anl/xzzpfxrnP9Ev1vH9PYuDEcKBs0UWhzx70NZKT9VZsKl4hyEYiP8jC
 4VOZ3yATge2MCeELcgn923nOWuuH0ucwdiUfbxrKn588FX+hp8TEaPOid8fWz0HRhx/a
 x5nnSawkmj6V3mGYVQZ4zGYRetr9ZwYD4qpKufr/ZfIpGxgaQpOs9nChbaxoWbGiR9Lg
 z7gb8UvDH2zqzHImtQ8UePFhyvw0JmXeJI6af0AZ1ePrxtWEUr/T+yc+QElAbTPFpjKx
 SNzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA5N2q1nHoetNVDPJXbzpMHxN+WWmfZvtbP4vrXy8nHl0uPV9kdxWZMcZ6VNP5jX+D+bRJPz0qEro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBwtlhrqIOBQUd4jVfuSEeiCNJjwVRDrAkVvL0rDk2fXPctRaD
 SMNyOpt1Jp6iMKIhKEswlpOBwYWyI2GJOwe5Jauiyb6goc2wHqHGuiDg
X-Gm-Gg: ASbGncvkSBB6VeciSgcLYLMXZR5Z4LvDjcqNb/BkvXRJSHd/fX8P4zX4FJAWHw5S4N7
 LytNNVnWN9RnbFdABwp1C70avvg6anADiYQILcNlsYoRgWuRlSiA3c00OxRHWlmNBG9zVqZxQP+
 9xg1ov0RSaWNlMwWIlr6g2Ff3E28lgOVMlWhPQoDpakdiu+cD4xJbyJxaVkal32JGV27MYuMVr+
 JKswEi5Xm9DtGR+UKS3oZebKmowuutaPpTx6AGotUcwWN9KK/E3CmJV6qsJ7gvS9qrDPXgiNXRX
 toPdWPI9elpJvyuFANBaNnKe1VrIeVypWlPNKFiC2U3hm+B9+wT+qyNVSefyH/UJaC+02fUb0Vl
 DtC6DDXocQFzUiG2NC++QjL+Rm6BnCOPCAYjXWHz1
X-Google-Smtp-Source: AGHT+IEBtJgfUd9PfG81gZCPku8xlj3yj9p8H5N/t60M0ZS5vpK6dBsg3ehnSMHrskKHTMOTXKcvtw==
X-Received: by 2002:a17:90b:48ce:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-30e7d53fedcmr53004820a91.17.1748016944385; 
 Fri, 23 May 2025 09:15:44 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365d46ffsm7526565a91.25.2025.05.23.09.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:15:44 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v3 2/4] fbdev: Add flag indicating framebuffer is allocated
 from kernel memory
Date: Fri, 23 May 2025 09:15:20 -0700
Message-Id: <20250523161522.409504-3-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250523161522.409504-1-mhklinux@outlook.com>
References: <20250523161522.409504-1-mhklinux@outlook.com>
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

Add a flag that fbdev drivers can set to indicate that the framebuffer
memory comes from alloc_pages() or similar as opposed to vmalloc()
memory. The flag is to be used by fbdev deferred I/O.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v3:
* This patch is new in v3. The definition of FBINFO_KMEMFB
  was previously combined into the next patch of the series.
  [Helge Deller]

 include/linux/fb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 05cc251035da..a1121116eef0 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -396,6 +396,7 @@ struct fb_tile_ops {
 
 /* hints */
 #define FBINFO_VIRTFB		0x0004 /* FB is System RAM, not device. */
+#define FBINFO_KMEMFB		0x0008 /* FB is allocated in contig kernel mem */
 #define FBINFO_PARTIAL_PAN_OK	0x0040 /* otw use pan only for double-buffering */
 #define FBINFO_READS_FAST	0x0080 /* soft-copy faster than rendering */
 
-- 
2.25.1

