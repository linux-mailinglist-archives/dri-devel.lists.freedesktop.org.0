Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38680291402
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8176E247;
	Sat, 17 Oct 2020 19:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC826E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 19:00:01 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q9so5172871iow.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VyUcxuS+q3Ki2t27YEs5CSq4Bu05DRppkqJKzHXj8pU=;
 b=L7QY1qC5KzpxZDrE+afO/LgMISXbMAQNCh4zwIj7g6jORAm/qUibRFTJfy9Bf07qaI
 /01A1J/vBA0e63lBQaWfc4MpcMlvIW3jZLjWDBTzg90RclwyyI/YXg7FXSNZZSIswnC5
 sGMj1RrRyilLtu5/V4nU/BzY6hOETP4AtBYgR5pNecXQuPC2oDl8RjXZEEgy7ZQXMw+Q
 kvQ+pVZJYLKWAEkPiUt6aDxmHm5P8M/8732RkEjsMRLCi9H52Pi/R9a7xiUXnO2ne6KY
 Np0uPLBSA9ho1tZ1e67fLLb72mNdejO5gR++aDcBWl8bpm84W4qb0tGbsb9nrAhLSgsQ
 T9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VyUcxuS+q3Ki2t27YEs5CSq4Bu05DRppkqJKzHXj8pU=;
 b=lCyr4X0vpzwMlXFeaUBWR+cOp0V22INjJCw4iyyVrknuEh52fM3w6hpEp8OKghzF5n
 AwBBB4AKQ5g5gB0YWPZ/ErfI7eoqBssTxRvMVA1uO1tdDn3Xuz9CcJlbtv7NCq1TMttu
 4Uc0ldrnsXCRbxwviw1JKhVuOLhF0oASkNR0Qi3D9HcboUtK2NJ4je/N+Sqse0GFI84w
 XtTh07CV2kpLRNpQrakKo6C6W1i9dIGI2Qm9GM9CbIX3mLMjewQB8oyXbN3HIuYQ3RKD
 Y4cUp/be4BuQlp+XzINkpJJCUVoDPdowRcHnggeSzaDDDcN0QYPtWX/DRKbIBvzGpAum
 esrg==
X-Gm-Message-State: AOAM5313UftWX79fesW2VjNdTO1phS5yE8C9mHfEgzRGyWKT/kiLV+iM
 Y90H7AG0RsBvYS/LtYsvBZFAjQ==
X-Google-Smtp-Source: ABdhPJzP4ehwc/PwReEFNRYC8BtVx3mqVAJi/bP+rFK4edA3NReIwy6akkcy+piEhBU03ujV74RkVA==
X-Received: by 2002:a6b:5019:: with SMTP id e25mr3685801iob.123.1602874800517; 
 Fri, 16 Oct 2020 12:00:00 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id a21sm2710614ioh.12.2020.10.16.11.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 11:59:59 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kTUxL-000yqz-2O; Fri, 16 Oct 2020 15:59:59 -0300
Date: Fri, 16 Oct 2020 15:59:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201016185959.GC37159@ziepe.ca>
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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

On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:

> +static void ib_umem_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	ib_umem_dmabuf_unmap_pages(&umem_dmabuf->umem, true);
> +	queue_work(ib_wq, &umem_dmabuf->work);

Do we really want to queue remapping or should it wait until there is
a page fault?

What do GPUs do?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
