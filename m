Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2B3B2038
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 20:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC36E970;
	Wed, 23 Jun 2021 18:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D2C6E95D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 18:24:37 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id x6so1938485qvx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ay2MFJ8k8M7R+vcG/EIgcKO9+a17Gdo2IRp61Ubbznw=;
 b=mCvqGy8+wtoV1fX/pyjo8KTMFPXZBXguyo9f6344j9Tuu6bvNitRH+6EMM391SPgX6
 SQMYyLNce8QZVpU7zBjnXebtb+Q1dmFuIlrzFz1aYg4dzKB/BRgz4LB8VyLVDBN8SLbD
 /DnbLaMY7YnyWKxjMZMgiPK42h8fTN66ErFs85v1J8jFaHQ7sl2AsFzx96c0xf/l9U1g
 an4hgyfwGlZSu7q9rvwAQ11c2UHFj6bACLkguqt6g9SVPdmo2aTNRobeEQ+DP+d/WoQh
 ZrnVQWoPWeo+kqw9aoKL73cB5McCCDUOBzJRc7EqyhLF4fkeGZrtBUlGnWa8WWodzdtj
 vF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ay2MFJ8k8M7R+vcG/EIgcKO9+a17Gdo2IRp61Ubbznw=;
 b=mHu+yMqQnoiCZLSWO3dFquAh7depatiFY1UIT0oeyXDbOs16JiAesAsLwS45hVZyDy
 3fy+VNM0QvIisuGHU0rYb+0eSZxtsDbwl2zu+GTRM6Eb9QC9PVwaVH0TvK+ZkUmhCitK
 iNC8tyky8KLzBtIzcj79TBJLZ7i0+S39FLZ7/0/VykjQ8D1e4bHje9TUJLlbJ1flwzmN
 lKaVZ6rMfgfZWP6873ffJEEETqZBN4Z7zwBeXVrNJ7wqXWtWs4B7kvhiPhU8/wvmw7zD
 KTf77MPnSP6CSYj/PsfZQfuzVN5nYz24ZJp+kmYDcry/mj8pH2y84QZba94F1ttLvoV+
 B9jg==
X-Gm-Message-State: AOAM531PYUJHoMwJptyvOU7PVXwVJ5ZHhTwXEciqaR2aRtw+g47Bb/Vm
 GR/end+5xOHSPGifbuObLyYjLg==
X-Google-Smtp-Source: ABdhPJwlrtEHn8YPQ5NuHFKzj1NcK0jWPqvPQ5lmMB0+rCMklEH74CDToqHNweA68dTG1W74jUsdaA==
X-Received: by 2002:a0c:f309:: with SMTP id j9mr1350376qvl.12.1624472676911;
 Wed, 23 Jun 2021 11:24:36 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id 85sm456567qkl.46.2021.06.23.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:24:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lw7YB-00BlF7-OO; Wed, 23 Jun 2021 15:24:35 -0300
Date: Wed, 23 Jun 2021 15:24:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH v3 1/2] habanalabs: define uAPI to export
 FD for DMA-BUF
Message-ID: <20210623182435.GX1096940@ziepe.ca>
References: <d358c740-fd3a-9ecd-7001-676e2cb44ec9@gmail.com>
 <CAFCwf11h_Nj_GEdCdeTzO5jgr-Y9em+W-v_pYUfz64i5Ac25yg@mail.gmail.com>
 <20210622120142.GL1096940@ziepe.ca>
 <d497b0a2-897e-adff-295c-cf0f4ff93cb4@amd.com>
 <20210622152343.GO1096940@ziepe.ca>
 <3fabe8b7-7174-bf49-5ffe-26db30968a27@amd.com>
 <20210622154027.GS1096940@ziepe.ca>
 <09df4a03-d99c-3949-05b2-8b49c71a109e@amd.com>
 <20210622160538.GT1096940@ziepe.ca>
 <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d600a638-9e55-6249-b574-0986cd5cea1e@gmail.com>
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, sleybo@amazon.com,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 10:57:35AM +0200, Christian König wrote:

> > > No it isn't. It makes devices depend on allocating struct pages for their
> > > BARs which is not necessary nor desired.
> > Which dramatically reduces the cost of establishing DMA mappings, a
> > loop of dma_map_resource() is very expensive.
> 
> Yeah, but that is perfectly ok. Our BAR allocations are either in chunks of
> at least 2MiB or only a single 4KiB page.

And very small apparently
 
> > > Allocating a struct pages has their use case, for example for exposing VRAM
> > > as memory for HMM. But that is something very specific and should not limit
> > > PCIe P2P DMA in general.
> > Sure, but that is an ideal we are far from obtaining, and nobody wants
> > to work on it prefering to do hacky hacky like this.
> > 
> > If you believe in this then remove the scatter list from dmabuf, add a
> > new set of dma_map* APIs to work on physical addresses and all the
> > other stuff needed.
> 
> Yeah, that's what I totally agree on. And I actually hoped that the new P2P
> work for PCIe would go into that direction, but that didn't materialized.

It is a lot of work and the only gain is to save a bit of memory for
struct pages. Not a very big pay off.
 
> But allocating struct pages for PCIe BARs which are essentially registers
> and not memory is much more hacky than the dma_resource_map() approach.

It doesn't really matter. The pages are in a special zone and are only
being used as handles for the BAR memory.

> By using PCIe P2P we want to avoid the round trip to the CPU when one device
> has filled the ring buffer and another device must be woken up to process
> it.

Sure, we all have these scenarios, what is inside the memory doesn't
realy matter. The mechanism is generic and the struct pages don't care
much if they point at something memory-like or at something
register-like.

They are already in big trouble because you can't portably use CPU
instructions to access them anyhow.

Jason
