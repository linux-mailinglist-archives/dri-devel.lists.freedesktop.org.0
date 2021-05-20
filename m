Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA9438AD63
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839BE89700;
	Thu, 20 May 2021 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868776F411
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z17so17370324wrq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p87lVshS5WtAkP+vwHETLCg2+KWBSmqiA1YnmqxNMnI=;
 b=a0NIQqA5rLn8/zDIH1ZHgTKtjrdQNFOqYKVUhlTWUmu+HMX/QdYMhzdfw1vnVRI6h9
 5ftpgP6sU1hD4Yn0LY+AZQcGCSfvqqS1Z0rNcyjthxY2amFnTWc+tBhkI+IXvW6ISVPy
 Znuiyk6IycvT5V+n60HIOQd+Agl7RJ2VvoUzoTkPlhNskqEB+uSoeWDAft89rOUwhqOn
 GJskOcGB3CvTGt/Qy4NqIM/pw4JTKpD6N1mdJVmotEQdhStQMDA1j/V3xJBruo5ull0c
 96oVQpgw0QpTNeNkj73P8Zfrg3kq8efATw2NO6gQqRt5Uxk5RXecfUzUiHsY24AKuzno
 pMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p87lVshS5WtAkP+vwHETLCg2+KWBSmqiA1YnmqxNMnI=;
 b=bDJxE9l9IUMXH9XQLRgP+pP+4wZqvMMhxtnshyy7/QUrYbr/DqUcyXleiOP187SnXB
 h53BfAYGL94clRCWsCol62gdwd1wGw0ScSh0UIzUYSotWNG6Sk/MNFo8dGAAmpOpux9c
 GBl7bfe5aHsCijjRO3huUPAvUI1DoU11JYiY43+WdqzLXT9f9+67aRghATji4j4vxEtF
 52q8jCyY1NkzywypTQuF1jFpV6X7U9TijzhgefDp2Oimz8jLH5MWZSeNY6wSVGdU9adG
 nUQ4Bsal8YaC3ZRPck6ZgWWhAGBeR3Uln6kGILlWfLtY9C4rPf7K0IrpRNzai4Vjdli5
 TVZg==
X-Gm-Message-State: AOAM532oixB00tf1slMzItHsysBJgvIkh4IMx3aaZlAX17DYZfmwHx5A
 BYIp7+grxULwNxUoi0g8FRe4/w==
X-Google-Smtp-Source: ABdhPJztEhcLl1ZB7W0IJsYbUWN1YgmHDJ7/kY6TYSk37pdkh/b5zgKfJXBzKdNZaNHzScPv6WULWQ==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr3888694wrp.341.1621512185252; 
 Thu, 20 May 2021 05:03:05 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/38] drm/amd/amdgpu/cik_sdma: Fix a few incorrectly named
 functions
Date: Thu, 20 May 2021 13:02:23 +0100
Message-Id: <20210520120248.3464013-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:735: warning: expecting prototype for cik_sdma_vm_copy_pages(). Prototype was for cik_sdma_vm_copy_pte() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:762: warning: expecting prototype for cik_sdma_vm_write_pages(). Prototype was for cik_sdma_vm_write_pte() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:792: warning: expecting prototype for cik_sdma_vm_set_pages(). Prototype was for cik_sdma_vm_set_pte_pde() instead
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c:814: warning: expecting prototype for cik_sdma_vm_pad_ib(). Prototype was for cik_sdma_ring_pad_ib() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index c4bb8eed246d6..c8ebd108548d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -720,7 +720,7 @@ static int cik_sdma_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 }
 
 /**
- * cik_sdma_vm_copy_pages - update PTEs by copying them from the GART
+ * cik_sdma_vm_copy_pte - update PTEs by copying them from the GART
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -746,7 +746,7 @@ static void cik_sdma_vm_copy_pte(struct amdgpu_ib *ib,
 }
 
 /**
- * cik_sdma_vm_write_pages - update PTEs by writing them manually
+ * cik_sdma_vm_write_pte - update PTEs by writing them manually
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -775,7 +775,7 @@ static void cik_sdma_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
 }
 
 /**
- * cik_sdma_vm_set_pages - update the page tables using sDMA
+ * cik_sdma_vm_set_pte_pde - update the page tables using sDMA
  *
  * @ib: indirect buffer to fill with commands
  * @pe: addr of the page entry
@@ -804,7 +804,7 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 }
 
 /**
- * cik_sdma_vm_pad_ib - pad the IB to the required number of dw
+ * cik_sdma_ring_pad_ib - pad the IB to the required number of dw
  *
  * @ring: amdgpu_ring structure holding ring information
  * @ib: indirect buffer to fill with padding
-- 
2.31.1

