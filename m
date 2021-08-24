Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697253F6756
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 19:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1CB6E088;
	Tue, 24 Aug 2021 17:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD086E088
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 17:32:31 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id j9so12142596qvt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 10:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lwC1/qqMXCHkSEuX0aG71XmLnSxkAQ0/tMDOcg4Aies=;
 b=KjMF1lA4YayhkMA/+onna2RUZsN7mjQYxMOcX2gD+57MQisyXwxt6Oi053+GIgqrkX
 wkN4XahJSetG45Hq/xYogC9dQnfLRCPsyHSD6Q7tpElYbipZG4FkwyJuWVih3LEz06oM
 +KHM4YBcae8DcATClLFJCnIgSzugnAHylazYJXvwdV+UitfGYHbYhLMgFpbtiVjDQ/hZ
 6FpUoL9d2o+MQCSNfZoI0mMyluhTbm9YMZ+emKes/bQHe0tESliqVviSsh1yLLwb/OtF
 O+Qael98lhH1hoeAIJlJwHnICFbEg0iI1liC8rgXZzX6OwslIY1ztRDfgZkeDvmxsRFp
 KsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lwC1/qqMXCHkSEuX0aG71XmLnSxkAQ0/tMDOcg4Aies=;
 b=LQsvQiGziq5ldKxgnoHYvOAFdkwrx9hNWnnL95Z89Ls5nyK5fn0x9kDrilV3GMRZvQ
 0FPuOHcyWSKr/x/ymZNv1jxNYFOJ2Zzfs2rGytGt9SkCzCkH/F9ao7bKHXUJyZJ665ON
 zKgf1H507/fK07E2HlKxdT/P5MyzwlM+ECU/HHSUJpIYVIcmOM9nfy7qvOAuIc3+Ymdq
 aLAvSaxj/6QMGkHMgKjKDR/xwNsmWHMjPkj0sKGZ/2s1188z9mmvY0Cby/xqtQJwuXdp
 M2cOC12SHejaGkbN73MBywIpaMohO8/OXbS6ltdkJi1D6UM5a0Wv18BxjZjXkfpEGEq2
 7AXg==
X-Gm-Message-State: AOAM533rRy0HjqMxu3b4Vl9fUpvlXN+RzKwqp8bRkH6MzZqjcLx5zlYV
 wY1okJXf5Qa53qck+r+pDtrqJA==
X-Google-Smtp-Source: ABdhPJwJ+2u+qDYC4MSLYpqJCPTaTMcY6ziqO6lM9p9+dgrNw/00zITDynb3bfoU+1EwIclnIvZtfQ==
X-Received: by 2002:a05:6214:1787:: with SMTP id
 ct7mr40068660qvb.53.1629826350573; 
 Tue, 24 Aug 2021 10:32:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id m68sm9660473qkb.105.2021.08.24.10.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:32:29 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mIaHk-004XHB-QJ; Tue, 24 Aug 2021 14:32:28 -0300
Date: Tue, 24 Aug 2021 14:32:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Gal Pressman <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210824173228.GE543798@ziepe.ca>
References: <20210819230602.GU543798@ziepe.ca>
 <CAKMK7uGgQWcs4Va6TGN9akHSSkmTs1i0Kx+6WpeiXWhJKpasLA@mail.gmail.com>
 <20210820123316.GV543798@ziepe.ca>
 <0fc94ac0-2bb9-4835-62b8-ea14f85fe512@amazon.com>
 <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
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

On Tue, Aug 24, 2021 at 10:27:23AM -0700, John Hubbard wrote:
> On 8/24/21 2:32 AM, Christian König wrote:
> > Am 24.08.21 um 11:06 schrieb Gal Pressman:
> > > On 23/08/2021 13:43, Christian König wrote:
> > > > Am 21.08.21 um 11:16 schrieb Gal Pressman:
> > > > > On 20/08/2021 17:32, Jason Gunthorpe wrote:
> > > > > > On Fri, Aug 20, 2021 at 03:58:33PM +0300, Gal Pressman wrote:
> ...
> > > > > IIUC, we're talking about three different exporter "types":
> > > > > - Dynamic with move_notify (requires ODP)
> > > > > - Dynamic with revoke_notify
> > > > > - Static
> > > > > 
> > > > > Which changes do we need to make the third one work?
> > > > Basically none at all in the framework.
> > > > 
> > > > You just need to properly use the dma_buf_pin() function when you start using a
> > > > buffer (e.g. before you create an attachment) and the dma_buf_unpin() function
> > > > after you are done with the DMA-buf.
> > > I replied to your previous mail, but I'll ask again.
> > > Doesn't the pin operation migrate the memory to host memory?
> > 
> > Sorry missed your previous reply.
> > 
> > And yes at least for the amdgpu driver we migrate the memory to host
> > memory as soon as it is pinned and I would expect that other GPU drivers
> > do something similar.
> 
> Well...for many topologies, migrating to host memory will result in a
> dramatically slower p2p setup. For that reason, some GPU drivers may
> want to allow pinning of video memory in some situations.
> 
> Ideally, you've got modern ODP devices and you don't even need to pin.
> But if not, and you still hope to do high performance p2p between a GPU
> and a non-ODP Infiniband device, then you would need to leave the pinned
> memory in vidmem.
> 
> So I think we don't want to rule out that behavior, right? Or is the
> thinking more like, "you're lucky that this old non-ODP setup works at
> all, and we'll make it work by routing through host/cpu memory, but it
> will be slow"?

I think it depends on the user, if the user creates memory which is
permanently located on the GPU then it should be pinnable in this way
without force migration. But if the memory is inherently migratable
then it just cannot be pinned in the GPU at all as we can't
indefinately block migration from happening eg if the CPU touches it
later or something.

Jason
