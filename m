Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4942689B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 13:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6D36F468;
	Fri,  8 Oct 2021 11:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1026F468
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 11:20:17 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n2so5922011plk.12
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 04:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=9lO276wIMhh4FqI4kuDPYPf5UGxyINlwwJai4bRIJN4=;
 b=NDvLhFA7NEbl3MKRLemxLPPIkH19wT3blVgHRAB/Pz+O+Q4JzWKbT6ihElHxNYSgZr
 y3I7uRVU+fxmHUQDef6qMndsv7kh3KTF/MHyYGZ4UTgk9287SIQO9Pj7/oqXCJqZsi8l
 UTBgj4FAXfmHg605pWC+uMAXUyUhsuRlnDzLYDGTo/U8I4MX6V/AdkkmU5s2g4pMlxut
 WdUDIX/S5+hXZxg+t7yCdLnlFXQXGocyUYWGnCMRBkok1JawGjSvDE8QApVH1iVU5qxW
 qKS6DWGCGScjKzixhBFKwdvH1E3r8tmZnLZxs1eEZdrlOO0HMPgx+eOT1Y1ZnSGtYncC
 d6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9lO276wIMhh4FqI4kuDPYPf5UGxyINlwwJai4bRIJN4=;
 b=AF+K25OWigghzlAp81CCQ80AidGIYbJ2e2zc2bARuZeQc8eeuqGS3hevCB9rjZldfd
 pTRYW4/KA0/LlgOv0dgC0/q7Vx3VkLJ3Amwy8imLNSsBIlhxRtM0mYHfN+h+hsPt5zEl
 ezGQmTgLPtcRxnN7xue87/LD3kiYn7/JTNtZXGQuzHltqN8s5Q0NaOhJOgqLI07v0KWo
 4lIadv9wT217CHxc2w4QCcWaLe9bWiunqANz6/s7QNLKCx4fyI0WAt5T7gwTjBB6JbUU
 Tlj9mBFE8+4RhelQFweopdi5S+Crh6sLww5FZVokdEhYFafyyf/IICHLpuuAZHfvQte1
 4Tyg==
X-Gm-Message-State: AOAM530G2Zn8+ULEaWyG3mi7ZIk80FEGkVdjTPxbb8Q8vOiCStI8hjq7
 fbQ4mGXrybCFzbWm+5bMq/S68g==
X-Google-Smtp-Source: ABdhPJzJjPsiSxRaq/tNhUgnovpywMMR+S13s4qXRW1prEypz2cDRITZLFPyXUPbKfcExpbwpPOjfA==
X-Received: by 2002:a17:90a:4b47:: with SMTP id
 o7mr200773pjl.198.1633692016603; 
 Fri, 08 Oct 2021 04:20:16 -0700 (PDT)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id y18sm2490089pff.184.2021.10.08.04.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 04:20:16 -0700 (PDT)
From: Shunsuke Mie <mie@igel.co.jp>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: mie@igel.co.jp,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: Update obsoluted comments on dma_buf_vmap/vunmap()
Date: Fri,  8 Oct 2021 20:20:09 +0900
Message-Id: <20211008112009.118996-1-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
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

A comment for the dma_buf_vmap/vunmap() is not catching up a
corresponding implementation.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
---
 drivers/dma-buf/dma-buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index beb504a92d60..7b619998f03a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1052,8 +1052,8 @@ EXPORT_SYMBOL_GPL(dma_buf_move_notify);
  *
  *   Interfaces::
  *
- *      void \*dma_buf_vmap(struct dma_buf \*dmabuf)
- *      void dma_buf_vunmap(struct dma_buf \*dmabuf, void \*vaddr)
+ *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
+ *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct dma_buf_map \*map)
  *
  *   The vmap call can fail if there is no vmap support in the exporter, or if
  *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
-- 
2.17.1

