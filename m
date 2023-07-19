Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF875973E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 15:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02410E4B0;
	Wed, 19 Jul 2023 13:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048610E4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:43:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b89e10d356so43810895ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689774204; x=1690379004;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uj4bycoHIi78Tfh9p5PlVQ04avMBcEsGppMMatw0U6g=;
 b=CJrnhE7Trr0nlNCxZ6FHqOnklJL3pq5ya/g8BUqmj2ArNdHTcyWdHwtH3q+eK3gIdA
 F2LT4d11H0PEw+LgU+8f/C3zPwukCl2hJ9XfUpxCcGk4RTGadMyQWD3tWKT+cZKoEyOY
 6OUHM6T2BwKCGljZ1dwOkIHrqr3reMjvxFI/kFGoYHTRFV8O1ECpZJ/4ABfETLag/RRe
 7GCyFZK/OcqBVl2auOmO6W4Ema4K6EdVlLkyvnmPlhPnqxZAj+S91H3dN4VFYRwWYQcH
 SIO82jrJaXfflRhYWhtVVlILQbP2LmpgEJ/LpKLBn1WblL5xUCrvaYjALr3TZtbyOzUl
 8NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689774204; x=1690379004;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uj4bycoHIi78Tfh9p5PlVQ04avMBcEsGppMMatw0U6g=;
 b=Q6j+ipmVJAWghJPKiEFclMVsPiG3Ifxkbr252lhAO4fybFqztWKQs+fVb6jPXZLN/z
 CXRYhNZP5lkhJnaiSPXbyJ7jiEERYf2+xabvL6gtqRC/it0SoYH59nP7eevdXDs078PY
 Cbapg8nDwfG0UusSSMJ9ZFmHUYSwX7vwterEmkaCA/l4WChlzCwWCmd8Nu32airf8+7s
 lfxhIY6/v8mSR0DR6M+FcMnRF9cVNmfsxOq6Q5rI2jpQS6sD7b+Fxa+7cKBdfGsbaHwA
 PjkyxQeKBzR7RARFfIZCPEvC2+FvG7+Yg6ULc5U8/x5ggSbVBOxavMGwD3zt/CILb2nO
 4naw==
X-Gm-Message-State: ABy/qLZFi+sdLvksjux0yA//WlICO52jJl+1XbWWcBOHVSLOmoZcvUAk
 FV6G0swgVLiMPiP6C2Ac3jqWFSwsS6zuhQ==
X-Google-Smtp-Source: APBJJlF8PGF3kIOqDDcd8iBgMQDwo5SHYLCSJ23t56NouDYZxRwNMVfNh4+/C0uNHBeZG1qHtYxJFA==
X-Received: by 2002:a17:902:b28b:b0:1b8:6cab:db7f with SMTP id
 u11-20020a170902b28b00b001b86cabdb7fmr4807352plr.53.1689774203465; 
 Wed, 19 Jul 2023 06:43:23 -0700 (PDT)
Received: from ubuntu ([59.178.102.25]) by smtp.gmail.com with ESMTPSA id
 iz9-20020a170902ef8900b001a1b66af22fsm3991568plb.62.2023.07.19.06.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 06:43:22 -0700 (PDT)
Date: Wed, 19 Jul 2023 06:43:14 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Fabio <fmdefrancesco@gmail.com>,
 Deepak R Varma <drv@mailo.com>, Sumitra Sharma <sumitraartsy@gmail.com>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH] Remove unnecessary calls to kmap{,_local_page}() when
 acquiring pages using GFP_DMA32.
Message-ID: <20230719134314.GA7590@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The GFP_DMA32 uses the DMA32 zone to satisfy the allocation
requests. Therefore, pages allocated with GFP_DMA32 cannot
come from Highmem.

Avoid using calls to kmap() / kunmap() as the kmap() is being
deprecated [1].

Avoid using calls to kmap_local_page() / kunmap_local() as the
code does not depends on the implicit disable of migration of
local mappings and is, in fact, an unnecessary overhead for
the main code [2].

Hence, use a plain page_address() directly in the
psb_mmu_alloc_pd function.

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com/
[2]: https://lwn.net/Articles/836503/

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/gpu/drm/gma500/mmu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index a70b01ccdf70..1a44dd062fd1 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -184,20 +184,15 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
 		pd->invalid_pte = 0;
 	}
 
-	v = kmap_local_page(pd->dummy_pt);
+	v = page_address(pd->dummy_pt);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pte;
 
-	kunmap_local(v);
-
-	v = kmap_local_page(pd->p);
+	v = page_address(pd->p);
 	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
 		v[i] = pd->invalid_pde;
 
-	kunmap_local(v);
-
-	clear_page(kmap(pd->dummy_page));
-	kunmap(pd->dummy_page);
+	clear_page(page_address(pd->dummy_page));
 
 	pd->tables = vmalloc_user(sizeof(struct psb_mmu_pt *) * 1024);
 	if (!pd->tables)
-- 
2.25.1

