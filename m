Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FEC2C504A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A6E6E86E;
	Thu, 26 Nov 2020 08:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049E86E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 14:12:46 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id f15so1607420qto.13
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 06:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2m9DC+TbVxZpxmRbjSlmcBQirDZa4fZfdvPGxT1eWog=;
 b=f56rDruwzJbLVe+DzWANSAFhymVcwr8bCGkFkxHqDTbH7tYEFjJUCjNxH3dS8qln42
 h3Qsclr942mG1kxkiI7my4GKsO0iGfxISM9RsJfUr/d3F4toLK/ihiOtiad9DpbajqI2
 eYkncyQ7kPvta19ia7Q5oBO4DTjqnbEYpLGn/pCVsOmOROig8jzG5waB43GuKMVJsHND
 pel9WJVR1/R5jL3PNJVmH/cqDz+2y91Rp8NDNSqdtuL+GwAS9IVplISR4fv6+SMe8WHG
 f3x85rEmyOgS2mmPKYaPYtuOnsvfckfzzo0Y1upHoouN2DEIHH5+43PP8Mo4N1tixVQc
 /M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2m9DC+TbVxZpxmRbjSlmcBQirDZa4fZfdvPGxT1eWog=;
 b=aywowbqwHcllQpLco1GM3y7TRmb0jvrTzW6iY+2h7VhQFrbENIoBpbCFvxxsqMMzhC
 45ipiFcCprVxHa7JQA8JFTmTC/r7zygz97ERbYs8pFdCFyzi7pnWAsx5cYhVfq/IxUME
 lE+QIAtYvbZlypEDogoEhkhxqYn1ZuCfYK6BphgTBpZ36XXwIKE3sGkXHGrnkJ45urMp
 WNGHCSRoZYWbWH3h0AC5CRRIHkAaH0CUqDROXNwnkcQjUXQQhhsJcsLX/686iW5NIqbR
 9OsrWf0xsz4xhYMYOfIwq3dcLI4f9zUMRDic7zhvxmEtW24E/L/tJtHnAEZGLmrL3Nu4
 J8oA==
X-Gm-Message-State: AOAM533EGjJ42HwfokCB61I+23g3bfO1VnIgoQatWe57IMA0mW2XE5C7
 nzXlt0V7JR+l0EtmWZgAdbg87Q==
X-Google-Smtp-Source: ABdhPJy+Hc1+XSQ5Ki4YDwpHS2sjBkxDuLqOllk/dPYFMN72kkviHvHFz+Rf7m8lIkwUiNTpaVEjzg==
X-Received: by 2002:aed:2393:: with SMTP id j19mr3239141qtc.23.1606313566133; 
 Wed, 25 Nov 2020 06:12:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h13sm2722429qtc.4.2020.11.25.06.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 06:12:45 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khvXI-001C7G-26; Wed, 25 Nov 2020 10:12:44 -0400
Date: Wed, 25 Nov 2020 10:12:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core v2 2/6] verbs: Support dma-buf based memory
 region
Message-ID: <20201125141244.GN5487@ziepe.ca>
References: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
 <1606253934-67181-3-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606253934-67181-3-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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

On Tue, Nov 24, 2020 at 01:38:50PM -0800, Jianxin Xiong wrote:
> +/**
> + * ibv_reg_dmabuf_mr - Register a dambuf-based memory region
> + */
> +struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset, size_t length,
> +				 int fd, int access);

Please include the iova in addition to the offset for this API

Similar to ibv_reg_mr_iova

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
