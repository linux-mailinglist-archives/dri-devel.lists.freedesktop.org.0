Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F2434037
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83486EB68;
	Tue, 19 Oct 2021 21:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0746EB68
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:11:42 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z20so18272336edc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=OwyRLUcszsyadBr824dsTniinvYZj7Tk0bJGgvItSRM=;
 b=UuFOxeYnA6bmCHsx6C3eM8RhW7dy8MiborwVIsDzXcWw30k69JKWDiVtNm6tzfQYNS
 jKiqu/iSWMz34Bs26vA6cuq5v9Mmweone0oANMssKmhBtWARTGXALWfHR+h8jbZ8pvcy
 0krFAiUyPTdfBf/P4H/lPhWeu8aOt+4rtcYRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=OwyRLUcszsyadBr824dsTniinvYZj7Tk0bJGgvItSRM=;
 b=LXHgHLxHGtJdzt2zjgE4N9naiSo1RqmaUOGpf+O2j/ON2udjC+4rH054NYLwiOe9IF
 BKOMh1TMM3/Ca4JfblYtZ1BRRNj3NxCrjQDfsLnGenpfcJl5uewC7VQbUgq5ASciRnzM
 vNgR1vhYklpJijiRH1a9UGCgQH+M+McWo4lwyFQUl0q/Hc+rx6p/vQL5GLX2ZfTYOhmf
 JvPkIvzjFRwB2aYJCYX730SCXF4tCpWQxvQ9TCOrnd4x83/HaiJpYTruSesj/yjHs69L
 bW7X2Bpu8yR/y75h0Kf4JFyTAXncIVl6J0agR+m513+U/2pZo59fWImyQf4QzAjfsZsz
 eedQ==
X-Gm-Message-State: AOAM530iw1sU0wCv1t7yocYzSlMOZwiQZf8BWRG7QIfIqe7OcMgoZKHY
 GPstlW+dp5bUK0poHaiU5fuMZBTIhhWRJQ==
X-Google-Smtp-Source: ABdhPJxVcAFeCcFJ0BV5iO1FeaZa+XJFmc7PEYU7imdaPNyCQNJYbrUDecQv4qxDFiRydF4XQvCUaw==
X-Received: by 2002:a05:6402:2787:: with SMTP id
 b7mr56873542ede.159.1634677899626; 
 Tue, 19 Oct 2021 14:11:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm92905edj.42.2021.10.19.14.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 14:11:39 -0700 (PDT)
Date: Tue, 19 Oct 2021 23:11:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf: add attachments empty check for
 dma_buf_release
Message-ID: <YW80iakRm5jWjIUp@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 guangming.cao@mediatek.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 wsd_upstream@mediatek.com
References: <20211019122345.160555-1-guangming.cao@mediatek.com>
 <YW686sIZie4xRUQO@phenom.ffwll.local>
 <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cca7188-6484-d3a5-2b87-400f6500e742@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Oct 19, 2021 at 05:37:27PM +0200, Christian König wrote:
> 
> 
> Am 19.10.21 um 14:41 schrieb Daniel Vetter:
> > On Tue, Oct 19, 2021 at 08:23:45PM +0800, guangming.cao@mediatek.com wrote:
> > > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > > 
> > > Since there is no mandatory inspection for attachments in dma_buf_release.
> > > There will be a case that dma_buf already released but attachment is still
> > > in use, which can points to the dmabuf, and it maybe cause
> > > some unexpected issues.
> > > 
> > > With IOMMU, when this cases occurs, there will have IOMMU address
> > > translation fault(s) followed by this warning,
> > > I think it's useful for dma devices to debug issue.
> > > 
> > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > This feels a lot like hand-rolling kobject debugging. If you want to do
> > this then I think adding kobject debug support to
> > dma_buf/dma_buf_attachment would be better than hand-rolling something
> > bespoke here.
> 
> Well I would call that overkill.

I think if done right the object debug stuff should be able to give you a
backtrace. Which might be useful if you have a dma-buf heaps design where
you really have no clue why a buffer was allocated/attached without some
hints.

> > Also on the patch itself: You don't need the trylock. For correctly
> > working code non one else can get at the dma-buf, so no locking needed to
> > iterate through the attachment list. For incorrect code the kernel will be
> > on fire pretty soon anyway, trying to do locking won't help :-) And
> > without the trylock we can catch more bugs (e.g. if you also forgot to
> > unlock and not just forgot to detach).
> 
> You also don't need the WARN(!list_empty...) because a few line below we
> already have a "WARN_ON(!list_empty(&dmabuf->attachments));".

Yeah this patch here alone isn't really that useful I think. Maybe we
could add the dmabuf->exp_name or so to that warning, but otherwise the
info printed here isn't all that useful for debugging. Grabbing a
backtrace of the allocator or attacher otoh should fairly immedialy point
at the buggy code.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 511fe0d217a0..672404857d6a 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -74,6 +74,29 @@ static void dma_buf_release(struct dentry *dentry)
> > >   	 */
> > >   	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
> > > +	/* attachment check */
> > > +	if (dma_resv_trylock(dmabuf->resv) && WARN(!list_empty(&dmabuf->attachments),
> > > +	    "%s err, inode:%08lu size:%08zu name:%s exp_name:%s flags:0x%08x mode:0x%08x, %s\n",
> > > +	    __func__, file_inode(dmabuf->file)->i_ino, dmabuf->size,
> > > +	    dmabuf->name, dmabuf->exp_name,
> > > +	    dmabuf->file->f_flags, dmabuf->file->f_mode,
> > > +	    "Release dmabuf before detach all attachments, dump attach:\n")) {
> > > +		int attach_cnt = 0;
> > > +		dma_addr_t dma_addr;
> > > +		struct dma_buf_attachment *attach_obj;
> > > +		/* dump all attachment info */
> > > +		list_for_each_entry(attach_obj, &dmabuf->attachments, node) {
> > > +			dma_addr = (dma_addr_t)0;
> > > +			if (attach_obj->sgt)
> > > +				dma_addr = sg_dma_address(attach_obj->sgt->sgl);
> > > +			pr_err("attach[%d]: dev:%s dma_addr:0x%-12lx\n",
> > > +			       attach_cnt, dev_name(attach_obj->dev), dma_addr);
> > > +			attach_cnt++;
> > > +		}
> > > +		pr_err("Total %d devices attached\n\n", attach_cnt);
> > > +		dma_resv_unlock(dmabuf->resv);
> > > +	}
> > > +
> > >   	dmabuf->ops->release(dmabuf);
> > >   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
> > > -- 
> > > 2.17.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
