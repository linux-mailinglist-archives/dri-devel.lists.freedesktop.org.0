Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AB42824A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 17:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990036E332;
	Sun, 10 Oct 2021 15:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240836E332
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 15:32:12 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n8so59955919lfk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1rpdPrFDqjSDlQM4/xeyql1J912iBebRnv6liKAQE0g=;
 b=j6iQjh1tToVrzJtt7fH1P0Ms8/WhjifKtfcvmZ9+CgCIbQq/8NeHwRceEEKa1uhbqs
 n9ls8nIxVPVjmoweNSTdwEMD1cH9ppZYtIAoLDxqxBZUCczX3kjfHE8GO+gQ0nGi4ysp
 xZ1iGRAYTjKEfimvl8BYJVXwndQHhHUk1ZPbdK3lRgE4W664gerwwxY6939vg+QvlnEy
 Q7AzUKIRgcd1E05hReiExfiV/nSialR3/u69MRpUij4F7r2JFS5AMg813S5nK1KfEUL0
 y5xGdjU6SDULP4cvDSoxEuEw1VkZJ4xMq+eZsXR4PUWYRkPDmf4Ge6bTlkezlNg5duUU
 EENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1rpdPrFDqjSDlQM4/xeyql1J912iBebRnv6liKAQE0g=;
 b=aqmX+SsQMdp+3KJ8GzQ6P6DCbyRI5wr3kc3zpiSt+ciEUkr65ktHYYiTgP21gcackE
 ElpoFvo2Cr2lGMWpYifo3dfZ+naGRis7ELkmCEaelRkWnD6OE5C5B1ZKglJEPneYqYjb
 ng1ti7JKZK4uauJ87WDpJNJgJhRCU3VTeRJ6XeGdzaW4VsVrN+EY8bCWbygIZA5/H5Jn
 cPyAPan15c2f3qRfKCqw/wCgA/nEStkpAnGCFxEWyR4c8vi9UNBJ+lR/Z96Qs/zU68Ug
 UwfBDQRVirvqbU2KlPTa22hz0cgEO2s8AHn0HMxmK/gemtRYmGn9yjEa/KYNf5w7VwXh
 wQJw==
X-Gm-Message-State: AOAM531t7HbK6RRzvkXw+6Pz4pgMeS0nnb2aE1KFyRIcTHc80l8Y2s/H
 XnqFtSjwHZvK26/kY+Fp1In38jgZkJxt70WoM/I=
X-Google-Smtp-Source: ABdhPJxlXX56rnWAN26VHPoa1prBkAG9E1MGtFp9RJVf2LbBsuT9cbojKXYLD55A1Pb8Rr3Dtn1X54gTIwsrGQAuafM=
X-Received: by 2002:a05:651c:230e:: with SMTP id
 bi14mr15752888ljb.467.1633879930288; 
 Sun, 10 Oct 2021 08:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210929041905.126454-1-mie@igel.co.jp>
In-Reply-To: <20210929041905.126454-1-mie@igel.co.jp>
From: Zhu Yanjun <zyjzyj2000@gmail.com>
Date: Sun, 10 Oct 2021 23:31:58 +0800
Message-ID: <CAD=hENexf1asHuHROrxh-X8BUn22LM9fzvFRS1zq_XeO3DCyMA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] RDMA/rxe: Add dma-buf support
To: Shunsuke Mie <mie@igel.co.jp>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Jianxin Xiong <jianxin.xiong@intel.com>, Leon Romanovsky <leon@kernel.org>, 
 Maor Gottlieb <maorg@nvidia.com>, Sean Hefty <sean.hefty@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 RDMA mailing list <linux-rdma@vger.kernel.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>, 
 Takanari Hayama <taki@igel.co.jp>, Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 29, 2021 at 12:19 PM Shunsuke Mie <mie@igel.co.jp> wrote:
>
> This patch series add a dma-buf support for rxe driver.
>
> A dma-buf based memory registering has beed introduced to use the memory
> region that lack of associated page structures (e.g. device memory and CMA
> managed memory) [1]. However, to use the dma-buf based memory, each rdma
> device drivers require add some implementation. The rxe driver has not
> support yet.
>
> [1] https://www.spinics.net/lists/linux-rdma/msg98592.html

It seems that dma-buf is in discussion. We will focus on this discussion.
After dma-buf is accepted, we will check this dma-buf on rxe.

Zhu Yanjun

>
> To enable to use the dma-buf memory in rxe rdma device, add some changes
> and implementation in this patch series.
>
> This series consists of two patches. The first patch changes the IB core
> to support for rdma drivers that has not dma device. The secound patch adds
> the dma-buf support to rxe driver.
>
> Related user space RDMA library changes are provided as a separate patch.
>
> v2:
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
>  drivers/infiniband/sw/rxe/rxe_mr.c    | 118 ++++++++++++++++++++++++++
>  drivers/infiniband/sw/rxe/rxe_verbs.c |  34 ++++++++
>  drivers/infiniband/sw/rxe/rxe_verbs.h |   2 +
>  include/rdma/ib_umem.h                |   1 +
>  6 files changed, 173 insertions(+), 4 deletions(-)
>
> --
> 2.17.1
>
