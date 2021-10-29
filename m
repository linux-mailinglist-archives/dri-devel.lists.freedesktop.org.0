Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBBC43F799
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 09:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9A06E9F1;
	Fri, 29 Oct 2021 07:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E014E6E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 07:03:09 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id np13so6556195pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 00:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBWdZ+D4rVuAM/YVY5PfNR/VqcL1cfHe5Q0y/P8//ew=;
 b=BF1UHSWlvI3/HOU1nzG+lh7R6COCYCDihZSUpBn1Y7hcTEs69SKIUwMVP1+q47NcFn
 OAodoerM0PM+trbldYixN+Ax09PYB1najZ8draC0zQ0l2jlPvZd8TaDXkos1UIfyMwQx
 GQnc4pH0EBcYsQ7lKoxoTHesH7PyX4mF70rTyAmvITU0+ERjCerc9G+FQ14RkwdNrzAy
 5PFwi3uvH1uPUWpFZMZ5ifO9T98nQMlbthS7WAaP5y6TDEFOiWzJsIc3X49WXZfFM5hX
 DPwDUOxaRqYlmvrCLCfiAePjH1/niVk/RfIXNbW+zbpD2rBV3xXjzzX/q0D3fgKkh81O
 XaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OBWdZ+D4rVuAM/YVY5PfNR/VqcL1cfHe5Q0y/P8//ew=;
 b=X7vBt0TyeEaRZsx6hvCfJ3fInuArqdOgKA/LsSZ/JZzW/IHYcEOMlGgStTd9bZibkQ
 7+4+CawpdxnyeXE7WA2aHDPTMdB5W4ouUeRlD168jwayuXZCYxMHCUo4xJP1jLE0isFE
 p4L8blZ9ZAu28bjKR6ZbyR6/ynhIX8OqNKje2X/NjNAXRyEaYDhPOnkLP+ziQSAIfCTU
 FXkXV/XCI+CzzdU9U1jOfOIh9KHZ4uKx9FTMQymUuhAnba19bj/8e+LWA8qmlgOoQFGx
 4iZSrTi4xSA6s50+PmW+XKw2p3VNeqJb3Bpn6ntmlXxkHn9mL5+MzL3lC6fDcOTF4+Wq
 CWzw==
X-Gm-Message-State: AOAM531zSBZN2yXhLP194NYTlq54tXFn6J/lanroal/INlfUf7gLxDhu
 dumUm0m8ZrV1QuIb38MRqRGxkw==
X-Google-Smtp-Source: ABdhPJyYcpsVVRs4dnJPUYk4jb1Z9YeTTmvs001e9rR1+K+F1QyW9gs4iEr1+r7SwPegB9ktIbf7Ww==
X-Received: by 2002:a17:90b:388a:: with SMTP id
 mu10mr17448632pjb.221.1635490989501; 
 Fri, 29 Oct 2021 00:03:09 -0700 (PDT)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id p16sm6039787pfh.97.2021.10.29.00.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 00:03:08 -0700 (PDT)
From: Shunsuke Mie <mie@igel.co.jp>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Shunsuke Mie <mie@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Sean Hefty <sean.hefty@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, dhobsong@igel.co.jp, taki@igel.co.jp,
 etom@igel.co.jp
Subject: [RFC PATCH v3 0/2] RDMA/rxe: Add dma-buf support
Date: Fri, 29 Oct 2021 16:02:56 +0900
Message-Id: <20211029070258.59299-1-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
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

This patch series add a dma-buf support for rxe driver.

A dma-buf based memory registering has beed introduced to use the memory
region that lack of associated page structures (e.g. device memory and CMA
managed memory) [1]. However, to use the dma-buf based memory, each rdma
device drivers require add some implementation. The rxe driver has not
support yet.

[1] https://www.spinics.net/lists/linux-rdma/msg98592.html

To enable to use the dma-buf memory in rxe rdma device, add some changes
and implementation in this patch series.

This series consists of two patches. The first patch changes the IB core
to support for rdma drivers that has not dma device. The secound patch adds
the dma-buf support to rxe driver.

Related user space RDMA library changes are provided as a separate patch.

v3:
* Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
* Fix to use dma-buf-map helpers
v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
* Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
* Instead of using a dummy dma_device to attach dma-buf, just store
  dma-buf to use software RDMA driver
* Use dma-buf vmap() interface
* Check to pass tests of rdma-core
v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
* The initial patch set
* Use ib_device as dma_device.
* Use dma-buf dynamic attach interface
* Add dma-buf support to rxe device

Shunsuke Mie (2):
  RDMA/umem: Change for rdma devices has not dma device
  RDMA/rxe: Add dma-buf support

 drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
 drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
 drivers/infiniband/sw/rxe/rxe_mr.c    | 113 ++++++++++++++++++++++++++
 drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
 include/rdma/ib_umem.h                |   1 +
 5 files changed, 166 insertions(+), 4 deletions(-)

-- 
2.17.1

