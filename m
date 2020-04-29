Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F801BF16C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 09:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF0A6EB52;
	Thu, 30 Apr 2020 07:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DE46EB21
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 22:41:30 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id g74so3801900qke.13
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yBgZcrV4iWdwc8bXr1UgNLaniSphIyQASgPqncouw5A=;
 b=f12ZywN6K7/T0vh/KFA3gH3gfK1sZ3o1eqim7onv3KljZBN4EOi4bv6G5V+XbG4ut1
 QQLVUyAfs4arAjqaqFVeMkgjxNn40gaGCjoQ7o0T29H6bsy2WzWeCqi+bO3ZRddrrCIx
 ZpoSV5qQBQZnrndmt08qcR/DcYoVpUDmC5hY7V0oWPPMSFSPw5y5/KRbFoEpmjdnydS9
 baSt1dM3SYcyQ1N3yyIRPCOPHVdxSN8akC48vdq9aPEUZEPCm7Q2lckDBnXUDRGzXwp2
 4bh9Wy/0+rhTYdXvbRRxtmS5bIVA54WQzEwFvGgqOS4DEMnxOYBSpNngwveCYRtgj0jf
 jg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yBgZcrV4iWdwc8bXr1UgNLaniSphIyQASgPqncouw5A=;
 b=PWhsNNtjmoVl3WVDh21znnTGSHE7ltLZEQxLStVkgsc5/BR/kJI3/w/UMn4kt6cz8F
 Iq8cTtQ/Xel3gZScuBy14TAIKVFkU/wC5CauePgw+WNkPsQE8il1/TFGwyj50laIkG1C
 +UEAIpxTO/0IHdEtgqdusZ07rszdvZW+R/HT/JC2W3lpHicHoljNib6/zlXJwgz+KuXe
 gd1oUN/WHuhxvbEHq/nnVqFablY4EU+TDoj2pkORVZurOkgYV7RnUPIlcgp5m1A5NtTu
 ZGPIvcvyvzvpo1l3NBTH0AfamokFgcMQrJcOakFQIWyO9e5QIIslPCRwddclQx1iJr7e
 68cg==
X-Gm-Message-State: AGi0PuZv5KhK3nRQO4lFjc+678D1aR94j0hUQgOUTuwpxkc5TX7VCa5X
 2sTG5DAdy3kU7A7bKdnA58f5LgWvPUw=
X-Google-Smtp-Source: APiQypLKqND0JKjNOfB6OKttFWw4PueCh+kW/uTm/J+/8LnYtWQ1Yu18biU6LtzJiRmM87wUIsCivg==
X-Received: by 2002:a05:620a:1305:: with SMTP id
 o5mr811497qkj.222.1588200089029; 
 Wed, 29 Apr 2020 15:41:29 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id v27sm551028qtb.35.2020.04.29.15.41.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 15:41:28 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jTvOR-0000GO-Rd; Wed, 29 Apr 2020 19:41:27 -0300
Date: Wed, 29 Apr 2020 19:41:27 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH hmm 5/5] mm/hmm: remove the customizable pfn format from
 hmm_range_fault
Message-ID: <20200429224127.GB3824@ziepe.ca>
References: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec276ac2-a346-5728-4ac6-9c9bd9ffcd41@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 30 Apr 2020 07:31:56 +0000
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 01:52:32PM -0400, Felix Kuehling wrote:
> [+Philip Yang]
> 
> Am 2020-04-21 um 8:21 p.m. schrieb Jason Gunthorpe:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> >
> > Presumably the intent here was that hmm_range_fault() could put the data
> > into some HW specific format and thus avoid some work. However, nothing
> > actually does that, and it isn't clear how anything actually could do that
> > as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> >
> > Perhaps there is some special HW that does not need DMA mapping, but we
> > don't have any examples of this, and the theoretical performance win of
> > avoiding an extra scan over the pfns array doesn't seem worth the
> > complexity. Plus pfns needs to be scanned anyhow to sort out any
> > DEVICE_PRIVATE pages.
> >
> > This version replaces the uint64_t with an usigned long containing a pfn
> > and fix flags. On input flags is filled with the HMM_PFN_REQ_* values, on
> > successful output it is filled with HMM_PFN_* values, describing the state
> > of the pages.
> >
> > amdgpu is simple to convert, it doesn't use snapshot and doesn't use
> > per-page flags.
> >
> > nouveau uses only 16 hmm_pte entries at most (ie fits in a few cache
> > lines), and it sweeps over its pfns array a couple of times anyhow.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Hi Jason,
> 
> I pointed out a typo in the documentation inline. Other than that, the
> series is
> 
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> I'll try to build it and run some basic tests later.

Got it, thanks! Let me know if there are problems

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
