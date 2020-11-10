Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E012AD871
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3278F89262;
	Tue, 10 Nov 2020 14:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24A189262
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:14:49 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b6so1480266wrt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8IcGGTKYyeJzANG/fH/4OAuqD6l1LU2uOKX7qMbCBZA=;
 b=ZMmpCnGxT6S84bDoG46UlaLwRiQ1gDDBqsmHOxrOomO6S/WC7lm/CkFL6l/jEbG2VE
 0uUNIVSRlyWZIH0XvjuiIhJ7/nyKnTlTHlAbcHB+4tEtMHyv7xEGekHYi1h6UjxMtfaz
 jxmFK8Yd9UF4q17j06Fs+WDiJwzyKTx95pXes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8IcGGTKYyeJzANG/fH/4OAuqD6l1LU2uOKX7qMbCBZA=;
 b=CQ4zs6IhayxGvGOo08HpyL2zLZ2vzts93O/3UjLCg86cR9YzHSn+cR1ttpFkMWXTe0
 PEEAc5+ncBs8TfRI5lpgE2jVvTXSpaPPG/y4W3IPWWJ35exLajNQA3azIDsfpoe+cDNX
 x1Bki9qvX5OYFshphOSKQb5gCrgrScHVwDzmg/vXBK789wc4BExajnOjfFb2a0J4QEVC
 dwUMuBG4zAFGq6kj8Px7w5LzoQnGl+jr80xPVfP3LHSxwA7kyTSK+P7UNRufln8g+L8p
 eoC0SGtwzzHHNlSuzGFstGtdnBARM2NheXEWTi0iwTny/m0aUNQaZTQYY3Its19Cge9l
 pG9g==
X-Gm-Message-State: AOAM531o87LathzE8WqoO7/S7Kg2iY4Y2PFAYLSN6KnATfaB40YtcRKv
 0tdBZvpNE62nO/w1saK9VxDUzg==
X-Google-Smtp-Source: ABdhPJzG/UIF3dNTtGW7tPhr4EP9TwE3B/cEGkHpgw4VNMo89aauYpYSkqO0ZWw2XriDN6QoBX/YVQ==
X-Received: by 2002:a5d:6046:: with SMTP id j6mr24473612wrt.317.1605017688496; 
 Tue, 10 Nov 2020 06:14:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a128sm3232055wmf.5.2020.11.10.06.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:14:47 -0800 (PST)
Date: Tue, 10 Nov 2020 15:14:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201110141445.GI401619@phenom.ffwll.local>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-2-git-send-email-jianxin.xiong@intel.com>
 <20201106000851.GK36674@ziepe.ca>
 <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201106163953.GR36674@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106163953.GR36674@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 12:39:53PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 06, 2020 at 04:34:07PM +0000, Xiong, Jianxin wrote:
> 
> > > The user could specify a length that is beyond the dma buf, can
> > > the dma buf length be checked during get?
> > 
> > In order to check the length, the buffer needs to be mapped. That can be done.
> 
> Do DMA bufs even have definitate immutable lengths? Going to be a
> probelm if they can shrink

Yup. Unfortunately that's not document in the structures themselves,
there's just some random comments sprinkled all over that dma-buf size is
invariant, e.g. see the @mmap kerneldoc in dma_buf_ops:

https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf_ops#c.dma_buf_ops

"Because dma-buf buffers have invariant size over their lifetime, ..."

Jianxin, can you pls do a kerneldoc patch which updates the comment for
dma_buf.size and dma_buf_export_info.size?

Thanks, Daniel

> 
> > > Also page_size can be 0 because iova is not OK. iova should be
> > > checked for alignment during get as well:
> > > 
> > >   iova & (PAGE_SIZE-1) == umem->addr & (PAGE_SIZE-1)
> > 
> > If ib_umem_dmabuf_map_pages is called during get this error is automatically caught.
> 
> The ib_umem_find_best_pgsz() checks this equation, yes.
> 
> So you'd map the sgl before allocating the mkey? This then checks the
> length and iova?
> 
> Jason
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
