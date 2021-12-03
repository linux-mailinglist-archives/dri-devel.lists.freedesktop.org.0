Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 208404670E9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 04:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F396FD68;
	Fri,  3 Dec 2021 03:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000CD6FD68
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 03:51:56 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id c32so3386029lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 19:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0Vn1sEJP3rdiLC+VobT2SRCFUa76GT+sV4jtOkk4WpQ=;
 b=k7z3usEdc4wwNetvAxkaV+0JFAzAL5pL6swGTjLadTuWbVQKIwFJobt/wgduuAaAZB
 A7Ih4uAChPccnOc88KF8nOC5bYIkSUuvvGkL2GBxz4WZBXSPf4Fy3Squ1Q3+KL6PzlJl
 DUeDauIZVJFc/MwyZ0DXMeH8p+Ur9poFxpL7h4eytQIeJFVC2juVcjh6f17OxA1Cg4+q
 v2nwb1IuktPHZePZEzk/9WrzWV1U40/fsx+qPxwzW/MEgGwFfQdk0yH2LbVNmxj3Atpq
 fl4Y1aY5WFpnfmLdtmQOc0qpQGXe9us6UEWYeZklRaEbWRg/Ubv2PYXx+MgAiG5C+L52
 jOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Vn1sEJP3rdiLC+VobT2SRCFUa76GT+sV4jtOkk4WpQ=;
 b=Ta52mNTYVxKjRLKYUGuQSmOPAdxqxPVWdy5/LYuvqELqD8Ewr+EUte7+0kmXtKwPgE
 KFODFU/C4j0KVUyePi6186QQJWDtqpcAhybVm+H9Qg98DeI1YqwN0BAX06Mu68kAG08c
 +TA48uheUdIIV9SuI2yYAGFYY0q59sRoo5ZbD2Y3hJoqJr6hCjT4MFTvHEJqmNffgz31
 1yInbXdvN8Cd0hfMxosroWntpAniNJ+9PmPqTXS0SglsxSGBV+wPjkjCmSL9b/i/kBXA
 4/V4iWR/HK2ksS1TlX8QAbPMoTlhHMQFVrrQVEev4IZfLU68RA2AOZEPc0Ig7lHZhj4H
 xIQQ==
X-Gm-Message-State: AOAM531hHNYQu6VPAHOJ0JP8sUzeR22jnWGMhXXjWRh5tCnYn2yN8aNZ
 TA2gLSeRzG1VYORk9LTwthPyY7ZQ3gUqgnbmBd7MNg==
X-Google-Smtp-Source: ABdhPJzFUp4XBCsuPZlvimfYoc9hTTJ2FHaXf4B6prRnlQV5SWsUZ5WHEPTXjHu7V1T3VfnUy6M3clNJg3DdKipvI6o=
X-Received: by 2002:a05:6512:3d16:: with SMTP id
 d22mr15113188lfv.523.1638503515295; 
 Thu, 02 Dec 2021 19:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20211122110817.33319-1-mie@igel.co.jp>
In-Reply-To: <20211122110817.33319-1-mie@igel.co.jp>
From: Shunsuke Mie <mie@igel.co.jp>
Date: Fri, 3 Dec 2021 12:51:44 +0900
Message-ID: <CANXvt5oB8_2sDGccSiTMqeLYGi3Vuo-6NnHJ9PGgZZMv=fnUVw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/2] RDMA/rxe: Add dma-buf support
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tomohito Esaki <etom@igel.co.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi maintainers,

Could you please review this patch series?

Regards,
Shunsuke Mie

2021=E5=B9=B411=E6=9C=8822=E6=97=A5(=E6=9C=88) 20:08 Shunsuke Mie <mie@igel=
.co.jp>:
>
> This patch series add a dma-buf support for rxe driver.
>
> A dma-buf based memory registering has beed introduced to use the memory
> region that lack of associated page structures (e.g. device memory and CM=
A
> managed memory) [1]. However, to use the dma-buf based memory, each rdma
> device drivers require add some implementation. The rxe driver has not
> support yet.
>
> [1] https://www.spinics.net/lists/linux-rdma/msg98592.html
>
> To enable to use the dma-buf memory in rxe rdma device, add some changes
> and implementation in this patch series.
>
> This series consists of two patches. The first patch changes the IB core
> to support for rdma drivers that has not dma device. The secound patch ad=
ds
> the dma-buf support to rxe driver.
>
> Related user space RDMA library changes are provided as a separate patch.
>
> v4:
> * Fix warnings, unused variable and casting
> v3: https://www.spinics.net/lists/linux-rdma/msg106776.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc6+)
> * Fix to use dma-buf-map helpers
> v2: https://www.spinics.net/lists/linux-rdma/msg105928.html
> * Rebase to the latest linux-rdma 'for-next' branch (5.15.0-rc1+)
> * Instead of using a dummy dma_device to attach dma-buf, just store
>   dma-buf to use software RDMA driver
> * Use dma-buf vmap() interface
> * Check to pass tests of rdma-core
> v1: https://www.spinics.net/lists/linux-rdma/msg105376.html
> * The initial patch set
> * Use ib_device as dma_device.
> * Use dma-buf dynamic attach interface
> * Add dma-buf support to rxe device
>
> Shunsuke Mie (2):
>   RDMA/umem: Change for rdma devices has not dma device
>   RDMA/rxe: Add dma-buf support
>
>  drivers/infiniband/core/umem_dmabuf.c |  20 ++++-
>  drivers/infiniband/sw/rxe/rxe_loc.h   |   2 +
>  drivers/infiniband/sw/rxe/rxe_mr.c    | 113 ++++++++++++++++++++++++++
>  drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
>  include/rdma/ib_umem.h                |   1 +
>  5 files changed, 166 insertions(+), 4 deletions(-)
>
> --
> 2.17.1
>
