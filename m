Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF1BE138A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3571010E2BB;
	Thu, 16 Oct 2025 02:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iBHkLNdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359B10E2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:11:41 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b5515eaefceso141215a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 19:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760580701; x=1761185501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sdptM39vQ4ZC4ul+xKv7N2vDIBoFzhiZ3qTbS/fd4wk=;
 b=iBHkLNdCGqvjVDIy4w5ulffT7f1/mrVa1+WTkhARlgWXiXQZLIKWKEvNlNFkOFhSBs
 MVTkFvgd/FVz01jEk2GHSjS0IiLoKjyNOI0j3bVEAiPpWfXTRRf5cDXfr5IiDtHCO16F
 8mhqhixkfyCs/5IhiVNVwPgoPYDUVURk0u8fPxb7sgSQG+zlHBijDyN79r8wmHkYAFRR
 /Eu+HUUZydhd8WcdkoUMIhwB3O3v2nK93pTbCqSL4cpgxPCP4S1IT/ez174p5aGEIgal
 wAtxr67U1E8oVlyujl2W7zRrr9Y/g9UW9zEoQTs8wdQbfecyk0sOqlqZi5VIFmYES6O6
 YnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760580701; x=1761185501;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sdptM39vQ4ZC4ul+xKv7N2vDIBoFzhiZ3qTbS/fd4wk=;
 b=aC5zLxDmPK7nyjr9h97NGALcM3I3X2zLKLCMMGe50sw5pn6spPqWm0GI0CO1ggLPnK
 fFi5/PEYKzV2Hdb5AII5FYCwLZKuSDSHT/UFWftPaUVmJhFN/GXHnRDoI9gghNDLY0JO
 MKfgv9/RbiCO5I7lOH5RoLsjpM4Y/SaARlC0bg8+mlWDRgAAeFiriKVjKsW1zKHn+dLF
 wS28naU7rP9ywmQ4FYx/IbbCKTaLN2Ut/58rllLaNa8eM2z5I+nQwVjY+hgcPkeiRLZO
 22pjQAXbtu65G3RDgsK/zEHBkvw2K2wWtQNYSPOCscH8NRN5R4r4RvCEqlb3YU4cOMOe
 4QFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3sXHozVgDIBnXv8HLRipVqGQMu3BrXu6TCtdGlscq52iPZx8xEU0b8cjxHImdcl7xo/ycEXBh9q0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybcp+ZZn5uLWKFAdxjQBIbG+JsGR/EWYNdlgPV9cXZbowwQqkK
 Hjp5x8eKgbn+qHIc4vsfBPPAr28GfkuknNw+0a43oWPrPaS6nRfyyent
X-Gm-Gg: ASbGncur61/FyVBszVEEkL0x1WK3KV9XsVQ1uF7krP8Fzq8YZYBtpUReEBnNV4oSEDa
 GBIazCu5MGTwvhdfLPHU4Kos++lTao5JhxrOQSOVUY3ArE0HoodXYtR866KhKbUwb71FGCde+6m
 TWIOmkgkRUFjopfOIKW6Ummj9HrB8F65KyegY8HgRx+q2G0ixtp2Y5gm15i9TTDx5lEM+dYibU4
 MIee+UqzbKZtaxU+Dj8YzNVbTrgcXeLeRWs5I23pTxMOgJW8Yjt9QtHuGYX6d+bzt+OZi5yS8zs
 kv6xg+U2QGqPWAgu8m+V86OioU/0M+MCgDov1E0aK5DE0KOf+/ofXxnyEBgqGo8gEab85Mvqtfz
 PxoB1Mz3c3FlM1BgxbPwISn5h8WamZAwn9rByGl8iRHXZWkRB1mXXxmumKmMKWzOkuHqQEW5lIx
 xCMDgXp6tD3t85POb3ETyTWKZNDLSC+nxH5HHwuc4=
X-Google-Smtp-Source: AGHT+IFbCTTdrxHYHVaVBnRH7IgNG3/mtcqYbWJHh1vVVuc/6HuS6Iye7V7sP+9RojodPULKBM28tQ==
X-Received: by 2002:a17:902:ccc8:b0:271:49f:eaf5 with SMTP id
 d9443c01a7336-290273ecb42mr374140105ad.30.1760580700864; 
 Wed, 15 Oct 2025 19:11:40 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099afdcc2sm10397715ad.115.2025.10.15.19.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 19:11:40 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 corbet@lwn.net
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kriish Sharma <kriish.sharma2006@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] htmldocs: userspace-api/dma-buf-heaps.rst: fix block quote
 warning
Date: Thu, 16 Oct 2025 02:09:12 +0000
Message-Id: <20251016020912.1653230-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix the following warning encountered when running `make htmldocs`:

  Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent

Added a blank line before the "Naming Convention" heading to comply with reST

Fixes: 507211e3c7a1 ("Documentation: dma-buf: heaps: Add naming guidelines")
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
v2:
 - Corrected the Fixes tag per Bagas Sanjaya’s review.

v1: https://lore.kernel.org/all/20251015183402.1649988-1-kriish.sharma2006@gmail.com/
 
 Documentation/userspace-api/dma-buf-heaps.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index a0979440d2a4..c0035dc257e0 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -26,6 +26,7 @@ following heaps:
    ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
    created following legacy naming conventions; the legacy name might be
    ``reserved``, ``linux,cma``, or ``default-pool``.
+
 Naming Convention
 =================
 
-- 
2.34.1

