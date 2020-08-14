Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A92444B9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 07:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0876E5A5;
	Fri, 14 Aug 2020 05:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D36E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 05:59:15 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id z22so7281061oid.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ek1Xj7F+p5V5QHuUBuug/aAxVgWdWkwQ14dvtLIgIA=;
 b=u/d3+AkOSH0ZAUrREdpKK1K7+3ubxoyTo9I05t6URCCnVPUTye+E+pdV9V2a3+ccif
 jWmpaZGdH4f5C8gDoW6VBuNLHhE1+5zuMQeQxEUtLt583MPJeaDnuM4ZIjXApLZMDldZ
 cI8sNWvgt7TJWl02eoF2qITSBjQxL+K9NrXJ8TrvklB+qqHO5k48Y90zZ/69fX0WrF/R
 MA6niyBPxhu67sI+tFb0PnUtTD7MV1RvC4LgKGWOvhWzCj7wmC5lwJYbKFKeXstgY9eL
 z2qErVVTp3z2vziasizR4KHWl5qtoCFKMNuPyd+OX+cHRRC8SRlXrsEWvZfxOz/SYkje
 AWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ek1Xj7F+p5V5QHuUBuug/aAxVgWdWkwQ14dvtLIgIA=;
 b=h4YhbSxe5i3mitqUbZUH2UCudSk4mIX0EYNqfaLeuvknNFkV9380VE0hRuhnquBoDi
 kpBO6s4PH7Tja0Aoz2EhQlLkNEWL9r9uQrEwNpKSNGVXdu8TOXygJwPAxQ0JDVgmh+WX
 R6Oddjj2TeG7+2DNqn2JOSk2lF+ZLjwGO0hEzD/QS6emtXgQdFeoMy4VAU1YmUcNFDIv
 y4ABHoByY+QJYoJz//S3Z6TU7Xi0J20zc8ZEys46ZZfUVJg+IVbV8PYCehLJteOritrs
 OGxMTdH/HGLaKAFVqmnqhSxkfrj2x/x22IHO/XHMRvfcpWxDj8ulv2rHaqdmCatavjKq
 OBnw==
X-Gm-Message-State: AOAM5335XpWyO3BZnzzKGe0Frm5uAiGOBZo7+G8+qAe54Y23ChyjZP3r
 S66x7dQmrh7jVy1yyqbIHOqP6ORutrwn6v4ShM9/gnmUWEg=
X-Google-Smtp-Source: ABdhPJygjIyHSKquccaPWBOnwk40OPCWOWVkacRMrzSamBOp7G/opmXIa+Evw20OaDL+Y6ykmzsGN0rJzm1g8bL1p74=
X-Received: by 2002:aca:dc85:: with SMTP id t127mr588618oig.169.1597384754309; 
 Thu, 13 Aug 2020 22:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200729051632.66040-1-john.stultz@linaro.org>
 <20200729051632.66040-2-john.stultz@linaro.org>
 <3aabe118-929d-6ada-b317-dfa72d180717@arm.com>
In-Reply-To: <3aabe118-929d-6ada-b317-dfa72d180717@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 13 Aug 2020 22:59:02 -0700
Message-ID: <CALAqxLWjbhD3LN7phqPW_PrvXFeGd3aFHzAU0AAjVcNJNOTVoA@mail.gmail.com>
Subject: Re: [RFC][PATCH 2/2] dma-heap: Add a system-uncached heap
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 4:06 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-07-29 06:16, John Stultz wrote:
> > This adds a heap that allocates non-contiguous buffers that are
> > marked as writecombined, so they are not cached by the CPU.
> >
...
> > +     ret = sg_alloc_table(new_table, table->nents, GFP_KERNEL);
> > +     if (ret) {
> > +             kfree(new_table);
> > +             return ERR_PTR(-ENOMEM);
> > +     }
> > +
> > +     new_sg = new_table->sgl;
> > +     for_each_sg(table->sgl, sg, table->nents, i) {
>
> Consider using the new sgtable helpers that are just about to land - in
> this case, for_each_sgtable_sg().

Ack! Thanks for the suggestion!


> > +             memcpy(new_sg, sg, sizeof(*sg));
> > +             new_sg->dma_address = 0;
>
> This seems a little bit hairy, as in theory a consumer could still treat
> a nonzero DMA length as the address being valid. Rather than copying the
> whole entry then trying to undo parts of that, maybe just:
>
>         sg_set_page(new_sg, sg_page(sg), sg->len, sg->offset);
>
> ?

Sounds good.


> > +static struct sg_table *dma_heap_map_dma_buf(struct dma_buf_attachment *attachment,
> > +                                          enum dma_data_direction direction)
> > +{
> > +     struct dma_heap_attachment *a = attachment->priv;
> > +     struct sg_table *table = a->table;
> > +
> > +     if (!dma_map_sg_attrs(attachment->dev, table->sgl, table->nents, direction,
> > +                           DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WRITE_COMBINE))
>
> dma_map_sgtable()
>
> Also, DMA_ATTR_WRITE_COMBINE is meaningless for streaming DMA.
>

Hrm. Ok, my grasp of "streaming" vs "consistent" definitions are maybe
slightly off, since while we are mapping and unmapping buffers, the
point of this heap is that the allocated memory is uncached/coherent,
so we avoid the cache sync overhead on each mapping/unmapping, which I
thought was closer to the "consistent" definition.

But maybe if the mapping and unmapping part is really the key
difference, then ok.

Either way, from my testing, you seem to be right that the
ATTR_WRITE_COMBINE doesn't seem to make any difference in behavior.

> > +     pgprot = pgprot_writecombine(PAGE_KERNEL);
> > +
> > +     for_each_sg(table->sgl, sg, table->nents, i) {
>
> for_each_sg_page()

Ack.

> > +     /*
> > +      * XXX This is hackish. While the buffer will be uncached, we need
> > +      * to initially flush cpu cache, since the the __GFP_ZERO on the
> > +      * allocation means the zeroing was done by the cpu and thus it is likely
> > +      * cached. Map & flush it out now so we don't get corruption later on.
> > +      *
> > +      * Ideally we could do this without using the heap device as a dummy dev.
> > +      */
> > +     dma_map_sg_attrs(dma_heap_get_dev(heap), table->sgl, table->nents,
> > +                      DMA_BIDIRECTIONAL, DMA_ATTR_WRITE_COMBINE);
>
> Again, DMA_ATTR_WRITE_COMBINE is meaningless here.
>
> > +     dma_sync_sg_for_device(dma_heap_get_dev(heap), table->sgl, table->nents,
> > +                            DMA_BIDIRECTIONAL);
>
> This doesn't do anything that the map hasn't already just done.

Good point!

> > +     }
> > +     dma_heap_get_dev(heap->heap)->dma_mask = &dummy_mask;
> > +     dma_set_mask(dma_heap_get_dev(heap->heap), DMA_BIT_MASK(64));
>
> Much as I'd hate to encourage using dma_coerce_mask_and_coherent(), I'm
> not sure this is really any better :/

Sounds fair.

Thanks so much for the review, I really appreciate the feedback!
(Sorry I was a little slow to respond. The merge window has really
been something this cycle.. :P)

I'll get this all integrated and resend the patch here shortly.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
