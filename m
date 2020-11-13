Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C42B1753
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829576E45D;
	Fri, 13 Nov 2020 08:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9F06E284
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 00:30:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v11so5571777qtq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VAUTqaRdYriL9ikCRyVwcZhWWf8pr98Y/t+SUiAJzpQ=;
 b=OFwmO73kjrLq0BTbsquDWMAHhUunDpspnVxYzG0hKspTPGPEwchpFJalE4CVxdq/6N
 hntAyBrWm0lED/RAeNlq5qKcuzUtjaHx3gqLpZ/rY2M785ZpAxxk22r7lseJfmoEC4Kl
 ymj0FWovEzLaSvIjoKjUtXNz1D7X4F0Fno+HVMxg7I5SVvuBmCg5vugsxOJ4Mkc6YGeb
 ENlF+JYCqb5dJvwf9SnTndBID73lQMysH1HblCef8scatZgKoUkI0tHJSMxRlOZlEOSd
 Q/IVryXvSzQxBs3749Ljycf6rRwxNa8djZ/CEljOeYcqw3rAsqrXtB1NDllYBrr3lSoR
 sKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VAUTqaRdYriL9ikCRyVwcZhWWf8pr98Y/t+SUiAJzpQ=;
 b=cdIdQofYxQG7UmcF211FeNVEP9Mgn/HlIL4Pbnt3ipcCwnrQG+olqjofwkcO94T3nM
 CltpguifKSY+49ba1O9tZARUEzDROEnfH7MNXvwlIkrVG78EaQrdTUjg4htNCewy4Vhr
 ZLT4tbyapo4UVrls1DEVIP89bjXuDk3UcTkMW/7rs1b5N/gQ6fr0GTGxGxauRqVyyv9d
 oOFm2XMixCdo0IwP9RqUHSheJCbLWPN1o6rOFiY2cZEZ3H44J38LVz8RG9MUH7bRfYm6
 7klbobg4iYXXF0uHmVZKMTG/Qcj5DZbflEHfDUL9LYuf0HcozahhEik7/ankK2rV/GGF
 NPxA==
X-Gm-Message-State: AOAM531f3mVzkrzyZRz+MZYJIkbkFTBWpZcZlUNgezhfWu12ZC8v9bJI
 BF6EUrm7OsU/6qPh3d6A2hSh4g==
X-Google-Smtp-Source: ABdhPJyqkJZqj9tYMcUaitD2/SN0Z1DZJXYlAje/elLKwN4YiBqOPqIwise8iROhXPOy1oeUtklPAA==
X-Received: by 2002:ac8:c02:: with SMTP id k2mr1892470qti.189.1605227438686;
 Thu, 12 Nov 2020 16:30:38 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x24sm1703606qkx.23.2020.11.12.16.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:30:37 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdMz7-004CTI-A4; Thu, 12 Nov 2020 20:30:37 -0400
Date: Thu, 12 Nov 2020 20:30:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v10 1/6] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201113003037.GY244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605044477-51833-2-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 01:41:12PM -0800, Jianxin Xiong wrote:
> +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +				   unsigned long offset, size_t size,
> +				   int fd, int access,
> +				   const struct dma_buf_attach_ops *ops)
> +{
> +	struct dma_buf *dmabuf;
> +	struct ib_umem_dmabuf *umem_dmabuf;
> +	struct ib_umem *umem;
> +	unsigned long end;
> +	long ret;
> +
> +	if (check_add_overflow(offset, (unsigned long)size, &end))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> +		return ERR_PTR(-EINVAL);

This is weird, what does it do?

> +
> +	if (unlikely(!ops || !ops->move_notify))
> +		return ERR_PTR(-EINVAL);
> +
> +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> +	if (!umem_dmabuf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	umem = &umem_dmabuf->umem;
> +	umem->ibdev = device;
> +	umem->length = size;
> +	umem->address = offset;
> +	umem->writable = ib_access_writable(access);
> +	umem->is_dmabuf = 1;
> +
> +	if (unlikely(!ib_umem_num_pages(umem))) {
> +		ret = -EINVAL;
> +		goto out_free_umem;
> +	}
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto out_free_umem;
> +	}
> +
> +	if (dmabuf->size < offset + size) {
> +		ret = -EINVAL;
> +		goto out_release_dmabuf;

offset + size == end, already computed, in fact move this above the
kzalloc

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
