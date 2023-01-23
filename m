Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4226786B7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 20:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CBC10E1F7;
	Mon, 23 Jan 2023 19:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE51410E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 19:47:26 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id v23so12539215plo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 11:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBsOuBeZmizkCpiObnueSyLNHUyq18ijoTACbxi/qCw=;
 b=yZd9stu7uvgbBJAPxxgmBfDp8I7urK7h90y0pYHkz6Fqo1TCsaRh9792gAAxh7JU6l
 KNjFuo1wwS4n+B3zh0Laxl3FOrUpisO2XAPU5WCL8UqTHqdnhWfj1S6Zd3fForjLVlxj
 FHNZG1lm8vOP/3fu58dQi7NGOjUys429TaZnpiQuiHieYOEUWDOlBlZ86QG1iy1D1R76
 LzdIrxj/KsuNBLD0rv7JpuorqC58kHMEwCch6inNc8Gc+ICCFjjBAokjLfn1RG/jHoDc
 W7icqHXq+18I9uaekV/mVDfXcnW7+w6CyVP77vePynuwW8DWOSqMzIYvxS2OefF9OMZX
 i/LA==
X-Gm-Message-State: AFqh2kqE/g9EtIF4HmDHgoDKdqmMceIZ4VjITvDeQpxD1oIQClgawrF3
 J++URPR0ZD3J+tSy4IhS39Y=
X-Google-Smtp-Source: AMrXdXvfK5mbs8dNd8I/pgphfjpkG9tj7Pxsz/hA5VFQ+HwYWwvNOoHEYzZM9wNmI4uRnGef/Yze9g==
X-Received: by 2002:a17:90a:b002:b0:229:932:a0f3 with SMTP id
 x2-20020a17090ab00200b002290932a0f3mr27137965pjq.27.1674503246346; 
 Mon, 23 Jan 2023 11:47:26 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:dbe2:4986:5f46:bb00?
 ([2620:15c:211:201:dbe2:4986:5f46:bb00])
 by smtp.gmail.com with ESMTPSA id
 gd23-20020a17090b0fd700b00212e5fe09d7sm39962pjb.10.2023.01.23.11.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 11:47:25 -0800 (PST)
Message-ID: <771236a2-b746-368d-f15f-23585f760ebd@acm.org>
Date: Mon, 23 Jan 2023 11:47:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [LSF/MM/BPF proposal]: Physr discussion
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>
References: <Y8v+qVZ8OmodOCQ9@nvidia.com>
 <Y84OyQSKHelPOkW3@casper.infradead.org> <Y86PRiNCUIKbfUZz@nvidia.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <Y86PRiNCUIKbfUZz@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nvdimm@lists.linux.dev, lsf-pc@lists.linuxfoundation.org,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 dri-devel@lists.freedesktop.org, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 Shakeel Butt <shakeelb@google.com>, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/23 05:44, Jason Gunthorpe wrote:
> I've gone from quite a different starting point - I've been working
> DMA API upwards, so what does the dma_map_XX look like, what APIs do
> we need to support the dma_map_ops implementations to iterate/etc, how
> do we form and return the dma mapped list, how does P2P, with all the
> checks, actually work, etc. These help inform what we want from the
> "phyr" as an API.

I'm interested in this topic. I'm wondering whether eliminating 
scatterlists could help to make the block layer faster.

Thanks,

Bart.

