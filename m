Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540D25FD87
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 17:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C466E49F;
	Mon,  7 Sep 2020 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A26E49F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 15:51:41 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w1so13237504edr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vMIZm3cLWzkFGrMWJF6j0H4AX6C1QhXOuWzVwrWqKpY=;
 b=HRPbf6EH510r+2KlPVReiUcrftnFS0aP625viCQTJRsfVSmCUeXpX9YLl5oJ/P11C1
 P/i75fqE+eNcG9e5kUCp2ekc6Rx+s9nM14yqI/WFc9wQAYiF4Kl/0WvXRIaJ2Q77GYQl
 Gyq3DbMZQO06yCPUXd/n75dvU2QX9PybQVSSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vMIZm3cLWzkFGrMWJF6j0H4AX6C1QhXOuWzVwrWqKpY=;
 b=uj2AfABHwE+vRjtHlI1ZOlmdd+DhtrPHIBhPn3PUJOqybkkx21Cv/f96PwKDbWtXlZ
 b2HFlpR9Kbf8Fs3c+NV2wlCOPLVxxs+agXljBa4QSALDnOH+/MYL1jCjJz9RtPZTKBkE
 wHwPYR/3aNx3oYEeeJdI0ARlkcYCEQiWEx451KrQ5OBPlDV47eYzsRWZq6vL86dOtrCn
 1Z0RtaRSgTdDffqqxPHHfTVHO2WuwkI77kV0GdxuqJnmKKloLPlXcfZ4S35X+QpjxOgv
 UkE/cMAI+WGukldbCglbM0YxywNwJz0SZp/cybv4Ou0b/YVBt53O0yZzcj20GUrXMfrk
 whGg==
X-Gm-Message-State: AOAM5304jFsxmbor9fHI+rVlH1kL12IfS4sn3fU5nWxUA72gR3iD7fR5
 b3yj5KSz0tNAs/05sBtNZrEKNH1pl3UjyA==
X-Google-Smtp-Source: ABdhPJwbj1GnvHfZaAK8sDorJAAXCoBiO3DbbCHk3svJxlhecfeKrJoyYFawUt2NeT7+XFUnoyfl6g==
X-Received: by 2002:a05:6402:17da:: with SMTP id
 s26mr22333319edy.221.1599493899734; 
 Mon, 07 Sep 2020 08:51:39 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id nh1sm15730758ejb.21.2020.09.07.08.51.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 08:51:38 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id c15so16239939wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 08:51:38 -0700 (PDT)
X-Received: by 2002:a5d:660f:: with SMTP id n15mr17487462wru.103.1599493898026; 
 Mon, 07 Sep 2020 08:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200904133512eucas1p204efa4e252ceb5fb50715239705f9965@eucas1p2.samsung.com>
 <20200904131711.12950-1-m.szyprowski@samsung.com>
 <20200904131711.12950-31-m.szyprowski@samsung.com>
 <CAAFQd5AZDzG6i00gcAZKM9ZV1tATWufL=+xXUAmgrbTPt8W6Gw@mail.gmail.com>
 <bdd3503f-d4f1-a1af-d10d-d75a1037ac5a@samsung.com>
In-Reply-To: <bdd3503f-d4f1-a1af-d10d-d75a1037ac5a@samsung.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 7 Sep 2020 17:51:26 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Dp4qBVN1H0LfJ8h49pwGe+7MnCKZnmS4-6yxzii_Ct8A@mail.gmail.com>
Message-ID: <CAAFQd5Dp4qBVN1H0LfJ8h49pwGe+7MnCKZnmS4-6yxzii_Ct8A@mail.gmail.com>
Subject: Re: [PATCH v10 30/30] videobuf2: use sgtable-based scatterlist
 wrappers
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 7, 2020 at 4:02 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Tomasz,
>
> On 07.09.2020 15:07, Tomasz Figa wrote:
> > On Fri, Sep 4, 2020 at 3:35 PM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> Use recently introduced common wrappers operating directly on the struct
> >> sg_table objects and scatterlist page iterators to make the code a bit
> >> more compact, robust, easier to follow and copy/paste safe.
> >>
> >> No functional change, because the code already properly did all the
> >> scatterlist related calls.
> >>
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> >> ---
> >>   .../common/videobuf2/videobuf2-dma-contig.c   | 34 ++++++++-----------
> >>   .../media/common/videobuf2/videobuf2-dma-sg.c | 32 +++++++----------
> >>   .../common/videobuf2/videobuf2-vmalloc.c      | 12 +++----
> >>   3 files changed, 31 insertions(+), 47 deletions(-)
> >>
> > Thanks for the patch! Please see my comments inline.
> >
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> index ec3446cc45b8..1b242d844dde 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> @@ -58,10 +58,10 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
> >>          unsigned int i;
> >>          unsigned long size = 0;
> >>
> >> -       for_each_sg(sgt->sgl, s, sgt->nents, i) {
> >> +       for_each_sgtable_dma_sg(sgt, s, i) {
> >>                  if (sg_dma_address(s) != expected)
> >>                          break;
> >> -               expected = sg_dma_address(s) + sg_dma_len(s);
> >> +               expected += sg_dma_len(s);
> >>                  size += sg_dma_len(s);
> >>          }
> >>          return size;
> >> @@ -103,8 +103,7 @@ static void vb2_dc_prepare(void *buf_priv)
> >>          if (!sgt)
> >>                  return;
> >>
> >> -       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
> >> -                              buf->dma_dir);
> >> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> >>   }
> >>
> >>   static void vb2_dc_finish(void *buf_priv)
> >> @@ -115,7 +114,7 @@ static void vb2_dc_finish(void *buf_priv)
> >>          if (!sgt)
> >>                  return;
> >>
> >> -       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
> >> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> >>   }
> >>
> >>   /*********************************************/
> >> @@ -275,8 +274,8 @@ static void vb2_dc_dmabuf_ops_detach(struct dma_buf *dbuf,
> >>                   * memory locations do not require any explicit cache
> >>                   * maintenance prior or after being used by the device.
> >>                   */
> >> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> >> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> >> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> >> +                                 DMA_ATTR_SKIP_CPU_SYNC);
> >>          sg_free_table(sgt);
> >>          kfree(attach);
> >>          db_attach->priv = NULL;
> >> @@ -301,8 +300,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
> >>
> >>          /* release any previous cache */
> >>          if (attach->dma_dir != DMA_NONE) {
> >> -               dma_unmap_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> >> -                                  attach->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> >> +               dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir,
> >> +                                 DMA_ATTR_SKIP_CPU_SYNC);
> >>                  attach->dma_dir = DMA_NONE;
> >>          }
> >>
> >> @@ -310,9 +309,8 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
> >>           * mapping to the client with new direction, no cache sync
> >>           * required see comment in vb2_dc_dmabuf_ops_detach()
> >>           */
> >> -       sgt->nents = dma_map_sg_attrs(db_attach->dev, sgt->sgl, sgt->orig_nents,
> >> -                                     dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> >> -       if (!sgt->nents) {
> >> +       if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
> >> +                           DMA_ATTR_SKIP_CPU_SYNC)) {
> >>                  pr_err("failed to map scatterlist\n");
> >>                  mutex_unlock(lock);
> >>                  return ERR_PTR(-EIO);
> > As opposed to dma_map_sg_attrs(), dma_map_sgtable() now returns an
> > error code on its own. Is it expected to ignore it and return -EIO?
>
> Those errors are more or less propagated to userspace and -EIO has been
> already widely documented in V4L2 documentation as the error code for
> the most of the V4L2 ioctls. I don't want to change it. A possible
> -EINVAL returned from dma_map_sgtable() was just one of the 'generic'
> error codes, not very descriptive in that case. Probably the main
> problem here is that dma_map_sg() and friend doesn't return any error
> codes...

True for the alloc/get_*() callbacks, but the dmabuf_ops_map() ones
are used for the in-kernel DMA-buf exporter ops, called by DMA-buf
importers.

As a side note, returning user-facing error codes from deep internals
of vb2 and having the userspace rely on particular values sounds quite
fragile. For example, I see vb2_dc_attach_dmabuf() returning a return
value coming from dma_buf_attach() directly and __prepare_dmabuf()
propagating it back to __buf_prepare(), which can just return that
back to the userspace. I guess we might have to do some follow-up work
to clean it up.

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
