Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B842135F3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF96EB44;
	Fri,  3 Jul 2020 08:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924906EAE3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:29:55 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j10so21159767qtq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3paf1fgwrTN6xWmTfZjK9eyuojwjFKP+Z/7I1P21GqM=;
 b=U8Fzyi8zAinP1bGlLvPk8DgCSHaKoTAN6xuzB8ijf27q/+dBrCmFMMb44Y/AKWlBM6
 f9T3uyG6/ckQ1S+sqTSm9XauwnLlM2O1fHn253cl9i4GSR4/QivSD3LQMairxG6csPd/
 pW2O5ow05vgc2hqHywCcFpvNQuIsnzeuppLn08ikKgOYNBuN/qttBfXOUpLT6o2/pSlF
 yaM2qyNtvjffvUjn4ZWhy13hAi5IbmuNnvlR3ISo4f7AIPHyU30anTdOL/3CxWcZNKoG
 IgAGbDa7JTKEwIyfo2LXgOojHmo3ZVMBvi0lDGiXJ33PIyEKqpXzas6MHws9Ya9VX8pS
 CNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3paf1fgwrTN6xWmTfZjK9eyuojwjFKP+Z/7I1P21GqM=;
 b=OCq9ut7DNGF5UtQQa4XNobV5nIXpf5THRkgkNto34NM1AIdjqpsJrQhnpjv4GI6+xi
 XbtRinkijIcbhWsPu2zNLiFzFnda+/SO4sJgcVAEX12YZt9XzZWw+d9X9jBhzQKVAFqG
 Kkyls8WEyYt2xwBe8lZvFs505Jvu9lzXJgqTpz1WbWVCZMp/ooJxQrVQSA7Rxyr8eq06
 w/UIx1dwIAfx3+vqMt8XApWGuVlaBtBlVNSEuWaGV/LZqAcBQf8HtrCSp8P30IHFumU4
 uMp1lTHTADT3dP+qhhqUa4mh8mlZFv04s7b2Zo9d3B5ByVUyGp2wCbvut4eQ1qh0VuZ0
 lynA==
X-Gm-Message-State: AOAM530hSv/O1AWkvEqM0o53aJBL095wIyPIvMy80kt0F3ZrzVoSiFYG
 BPocnszbT3j87DVjoVztPgnDHQ==
X-Google-Smtp-Source: ABdhPJzXEWBO+dsuKN6OTP0OvZpgluc4k+GJ5tOIl2wijcnYnbSVn/3/Vd3vDdVAcqN3qj0/Px5jXA==
X-Received: by 2002:ac8:44ad:: with SMTP id a13mr24299666qto.387.1593696594505; 
 Thu, 02 Jul 2020 06:29:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o145sm8252660qke.2.2020.07.02.06.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 06:29:53 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jqzHl-002s4M-CR; Thu, 02 Jul 2020 10:29:53 -0300
Date: Thu, 2 Jul 2020 10:29:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200702132953.GS25301@ziepe.ca>
References: <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702131000.GW3278063@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 03:10:00PM +0200, Daniel Vetter wrote:
> On Wed, Jul 01, 2020 at 02:15:24PM -0300, Jason Gunthorpe wrote:
> > On Wed, Jul 01, 2020 at 05:42:21PM +0200, Daniel Vetter wrote:
> > > > >> All you need is the ability to stop wait for ongoing accesses to end and
> > > > >> make sure that new ones grab a new mapping.
> > > > > Swap and flush isn't a general HW ability either..
> > > > >
> > > > > I'm unclear how this could be useful, it is guarenteed to corrupt
> > > > > in-progress writes?
> > > > >
> > > > > Did you mean pause, swap and resume? That's ODP.
> > > >
> > > > Yes, something like this. And good to know, never heard of ODP.
> > > 
> > > Hm I thought ODP was full hw page faults at an individual page
> > > level,
> > 
> > Yes
> > 
> > > and this stop&resume is for the entire nic. Under the hood both apply
> > > back-pressure on the network if a transmission can't be received,
> > > but
> > 
> > NIC's don't do stop and resume, blocking the Rx pipe is very
> > problematic and performance destroying.
> > 
> > The strategy for something like ODP is more complex, and so far no NIC
> > has deployed it at any granularity larger than per-page.
> > 
> > > So since Jason really doesn't like dma_fence much I think for rdma
> > > synchronous it is. And it shouldn't really matter, since waiting for a
> > > small transaction to complete at rdma wire speed isn't really that
> > > long an operation. 
> > 
> > Even if DMA fence were to somehow be involved, how would it look?
> 
> Well above you're saying it would be performance destroying, but let's
> pretend that's not a problem :-) Also, I have no clue about rdma, so this
> is really just the flow we have on the gpu side.

I see, no, this is not workable, the command flow in RDMA is not at
all like GPU - what you are a proposing is a global 'stop the whole
chip' Tx and Rx flows for an undetermined time. Not feasible

What we can do is use ODP techniques and pause only the MR attached to
the DMA buf with the process you outline below. This is not so hard to
implement.

> 3. rdma driver worker gets busy to restart rx:
> 	1. lock all dma-buf that are currently in use (dma_resv_lock).
> 	thanks to ww_mutex deadlock avoidance this is possible

Why all? Why not just lock the one that was invalidated to restore the
mappings? That is some artifact of the GPU approach?

And why is this done with work queues and locking instead of a
callback saying the buffer is valid again?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
