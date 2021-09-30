Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3741D48F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426AC6E32F;
	Thu, 30 Sep 2021 07:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B16E30C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 06:37:26 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so6038149otx.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 23:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpCMKte4+xNLfPIEFcorY2txGsUkKL05E8UxngAqFMw=;
 b=N5ykDUOZTUBs2Y5qWszbpDqp88cTbjalX0dj3NmeVUvMuPOrOHLAaN3NqZfr7keKOp
 njkX/0bdG6+fJIYpSQB+GXnLOZTAOWDwgZ2njIcR0CSDszZCD1NHQKOw0pyiDLCKqXQv
 24aJuN/lB9NiuQSfnRcCV3THkBQqxs6wwtZpmIQHk8LihgnPU3ZtLVOTXu9WOwhmmEf1
 BCgWe+xyHzPCiNmAtB5nlWFWL4TMO+UCT8H0MAUrvK83dq9VdN6xD6IaqHyG+lMq6B4v
 kjKHvlOQ/RJwzHgBwe5r/IjMK/ErISKfAuTrZzmvtfckdpqvlZn5eUPQCe/RmRlI78k8
 qPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpCMKte4+xNLfPIEFcorY2txGsUkKL05E8UxngAqFMw=;
 b=69MxPuMS2kdXMc2YT2fGEwwaCQQZQ0JAXULSJ3cjd0sdGNgMrn7cpM4k52aIt7HmV4
 nWlRzptaaRXaX5WyZKK2Qpw9Mv9OhoXhbL9bkISQozgKTj8Dw6KJtvGcslTrFKzV7HPd
 BumEyslBhQcxYNYTKxczydUpS+YbQlfxYcS4i+uy8nj7yFYdWMIK6OkG/S79CNq/RUri
 cGhINkhqEA8O1gwsxHkuQ6F4n6JsHrb5lVUxFdv1LxGxAgq2TaWZnXGv4q63Iex/lDHo
 RNcRGUf2qay/FQe6lPCrph8WqjWjlFds+WCB46OSM3EG/H9DH3/zgT8UfwC3HA1cTIZM
 JKtQ==
X-Gm-Message-State: AOAM530faOoqqWFLlZEras4sy241XTlQhPKldlh6xU9MnldEC+czJVBH
 H8TggebjZxnAbIrr6G7g0aeuHeLqptltLRzWQi8=
X-Google-Smtp-Source: ABdhPJxYSHNlbkBfgzm9RVq+rFNE58GGZ65ZfxotZSdw0rV8yudfRpYxR0498mEQjyXg/GMz0ISms1OLAQqNDtP3hus=
X-Received: by 2002:a05:6830:1089:: with SMTP id
 y9mr3770951oto.335.1632983845807; 
 Wed, 29 Sep 2021 23:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210930062014.38200-1-mie@igel.co.jp>
 <20210930062014.38200-2-mie@igel.co.jp>
In-Reply-To: <20210930062014.38200-2-mie@igel.co.jp>
From: Zhu Yanjun <zyjzyj2000@gmail.com>
Date: Thu, 30 Sep 2021 14:37:14 +0800
Message-ID: <CAD=hENdzYGNp14fm9y9+A71D2BJSjV5GewHMkSJKUzNOs0hqWg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] Providers/rxe: Add dma-buf support
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
 RDMA mailing list <linux-rdma@vger.kernel.org>, dhobsong@igel.co.jp,
 taki@igel.co.jp, etom@igel.co.jp
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Sep 2021 07:32:23 +0000
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

On Thu, Sep 30, 2021 at 2:20 PM Shunsuke Mie <mie@igel.co.jp> wrote:
>
> Implement a new provider method for dma-buf base memory registration.
>
> Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
> ---
>  providers/rxe/rxe.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/providers/rxe/rxe.c b/providers/rxe/rxe.c
> index 3c3ea8bb..84e00e60 100644
> --- a/providers/rxe/rxe.c
> +++ b/providers/rxe/rxe.c
> @@ -239,6 +239,26 @@ static struct ibv_mr *rxe_reg_mr(struct ibv_pd *pd, void *addr, size_t length,
>         return &vmr->ibv_mr;
>  }
>
> +static struct ibv_mr *rxe_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
> +                                       size_t length, uint64_t iova, int fd,
> +                                       int access)
> +{
> +       struct verbs_mr *vmr;
> +       int ret;
> +
> +       vmr = malloc(sizeof(*vmr));
> +       if (!vmr)
> +               return NULL;
> +

Do we need to set vmr to zero like the following?

memset(vmr, 0, sizeof(*vmr));

Zhu Yanjun

> +       ret = ibv_cmd_reg_dmabuf_mr(pd, offset, length, iova, fd, access, vmr);
> +       if (ret) {
> +               free(vmr);
> +               return NULL;
> +       }
> +
> +       return &vmr->ibv_mr;
> +}
> +
>  static int rxe_dereg_mr(struct verbs_mr *vmr)
>  {
>         int ret;
> @@ -1706,6 +1726,7 @@ static const struct verbs_context_ops rxe_ctx_ops = {
>         .alloc_pd = rxe_alloc_pd,
>         .dealloc_pd = rxe_dealloc_pd,
>         .reg_mr = rxe_reg_mr,
> +       .reg_dmabuf_mr = rxe_reg_dmabuf_mr,
>         .dereg_mr = rxe_dereg_mr,
>         .alloc_mw = rxe_alloc_mw,
>         .dealloc_mw = rxe_dealloc_mw,
> --
> 2.17.1
>
