Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182EA3AED32
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 18:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422F6E20A;
	Mon, 21 Jun 2021 16:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FE46E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 16:13:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so14285295wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YZ5jvtRoj/Rc3yW3uNUP4T0A+RWsbe0Q60+gCG3YCZw=;
 b=Ts7Up1YaojKwWZdVrmJdHBsGLOe3Tpn4OBRo9knbDF7EBhZMc6HqjiA1xhE/WcXYNk
 S0CPw8EzWPB5HKf6CM+7vfu3b6JZEAHnsB90PuYxEUJc3JmUtEn+b6b1JOekXnlNAulu
 3l1iMNyjzKT2lXkJbDZjOoQqay0UCfIRwiy1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YZ5jvtRoj/Rc3yW3uNUP4T0A+RWsbe0Q60+gCG3YCZw=;
 b=pJ9LqZwoJVQvQzZeKBEWUGq9xzZlf9j76maAutUI8ebvTRu+EQxUEKFRI4ky8c3tG0
 0ZCatNhjbjPxRihRyqrEkoXCZoFRi1gzb2hAS6PsvyUxxlmiIua0CkRxE1SuLsss+fiq
 FEVWufRhAeG0vA6+Ixxj2DUdAGjYkOCREfkZFg3OixXRUpzjuFKH2SxFCQfBf0Hq/sfo
 lr/W5fEWwWXiCkUYHO0ZrRXh15cVBxuk37FO88EnI2hBWAPqbHEuIh2dUKhc7EcBwptq
 e18pVVAeOLavFlh0yyg+9k/NU0KNmytQnDXOh1atlFJlD7+jeZfXs9h8a6h44TOHJjOK
 QCGg==
X-Gm-Message-State: AOAM531bZknN4VIliIZl7n1/IKZ8l7/sKOJ8X+NuhXWZCFP6hBp3BVQw
 La2l2LNXBqanPVIS4rsw+ZiT0Q==
X-Google-Smtp-Source: ABdhPJw6afDSISlQFjCaDK/M8n4zqWK2w3Q2V8P57Yw5lOY+iPC1dv182jSrKOBhcWX8Us87Yky/Lg==
X-Received: by 2002:a05:600c:2e53:: with SMTP id
 q19mr19459226wmf.39.1624292018191; 
 Mon, 21 Jun 2021 09:13:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p8sm10901430wmi.46.2021.06.21.09.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:13:37 -0700 (PDT)
Date: Mon, 21 Jun 2021 18:13:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] dma-buf: Document non-dynamic exporter expectations better
Message-ID: <YNC6ryxraAupKVbH@phenom.ffwll.local>
References: <20210621150732.2345632-1-daniel.vetter@ffwll.ch>
 <20210621151758.2347474-1-daniel.vetter@ffwll.ch>
 <75e2dff9-41e3-b24a-5c9c-068c8b1a18c9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75e2dff9-41e3-b24a-5c9c-068c8b1a18c9@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 05:53:46PM +0200, Christian König wrote:
> Am 21.06.21 um 17:17 schrieb Daniel Vetter:
> > Christian and me realized we have a pretty massive disconnect about
> > different interpretations of what dma_resv is used for by different
> > drivers. The discussion is much, much bigger than this change here,
> > but this is an important one:
> > 
> > Non-dynamic exporters must guarantee that the memory they return is
> > ready for use. They cannot expect importers to wait for the exclusive
> > fence. Only dynamic importers are required to obey the dma_resv fences
> > strictly (and more patches are needed to define exactly what this
> > means).
> > 
> > Christian has patches to update nouvea, radeon and amdgpu. The only
> > other driver using both ttm and supporting dma-buf export is qxl,
> > which only uses synchronous ttm_bo_move.
> > 
> > v2: To hammer this in document that dynamic importers _must_ wait for
> > the exclusive fence after having called dma_buf_map_attachment.
> > 
> > Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Applied to drm-misc-next, thanks for taking a look. Maybe when you merge
the actual bugfixes link to this patch as an explanation in each commit
message:

References: https://lore.kernel.org/dri-devel/20210621151758.2347474-1-daniel.vetter@ffwll.ch/

That helps a bit with your rather terse commit messages.
-Daniel

> 
> > ---
> >   drivers/dma-buf/dma-buf.c |  3 +++
> >   include/linux/dma-buf.h   | 15 +++++++++++++++
> >   2 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index e3ba5db5f292..65cbd7f0f16a 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -956,6 +956,9 @@ EXPORT_SYMBOL_GPL(dma_buf_unpin);
> >    * the underlying backing storage is pinned for as long as a mapping exists,
> >    * therefore users/importers should not hold onto a mapping for undue amounts of
> >    * time.
> > + *
> > + * Important: Dynamic importers must wait for the exclusive fence of the struct
> > + * dma_resv attached to the DMA-BUF first.
> >    */
> >   struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> >   					enum dma_data_direction direction)
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 342585bd6dff..92eec38a03aa 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -96,6 +96,12 @@ struct dma_buf_ops {
> >   	 * This is called automatically for non-dynamic importers from
> >   	 * dma_buf_attach().
> >   	 *
> > +	 * Note that similar to non-dynamic exporters in their @map_dma_buf
> > +	 * callback the driver must guarantee that the memory is available for
> > +	 * use and cleared of any old data by the time this function returns.
> > +	 * Drivers which pipeline their buffer moves internally must wait for
> > +	 * all moves and clears to complete.
> > +	 *
> >   	 * Returns:
> >   	 *
> >   	 * 0 on success, negative error code on failure.
> > @@ -144,6 +150,15 @@ struct dma_buf_ops {
> >   	 * This is always called with the dmabuf->resv object locked when
> >   	 * the dynamic_mapping flag is true.
> >   	 *
> > +	 * Note that for non-dynamic exporters the driver must guarantee that
> > +	 * that the memory is available for use and cleared of any old data by
> > +	 * the time this function returns.  Drivers which pipeline their buffer
> > +	 * moves internally must wait for all moves and clears to complete.
> > +	 * Dynamic exporters do not need to follow this rule: For non-dynamic
> > +	 * importers the buffer is already pinned through @pin, which has the
> > +	 * same requirements. Dynamic importers otoh are required to obey the
> > +	 * dma_resv fences.
> > +	 *
> >   	 * Returns:
> >   	 *
> >   	 * A &sg_table scatter list of or the backing storage of the DMA buffer,
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
