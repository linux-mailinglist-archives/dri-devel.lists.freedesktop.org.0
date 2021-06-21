Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA673AEB03
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E560E6E176;
	Mon, 21 Jun 2021 14:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050A86E182
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:17:59 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id z4so13502645qts.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f5JgZDeoCfa2i8b2+lJPyccTDGeyU3UeQJEKpYqzmGw=;
 b=iW/qNwvjUN60qOdsm7Tc/2UgFmrbPL7i3tcOoqV4K4nAE5p++VtMzaD7tQUmZY5aS/
 08eVJcFISGR01jyo6CIqviQAi8/x8nwo8NCY7YrYTVakAPQRX4ny9mcq8xMudYSJADOQ
 h+yKiUXxtEnGjWiqtTAEO+fkAVZBXqOEiFWJnEcxmy2hkR14/qsVhyet4cLlhORAQjbS
 5b3b0Ub6MVs3bJel4J0zd7N6pAGiflA4WAmb2m/748JAvI/uviYVvmmbpTnenWCmngzg
 /0zm6jCnZ052zu8m26gQyrxVJtmvIX29vAGvfAg8myajT6QOMOcUsreOn1mLyatblaTF
 2yQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f5JgZDeoCfa2i8b2+lJPyccTDGeyU3UeQJEKpYqzmGw=;
 b=QMUZFf4KBi4EO1ADRFtxF/8KUdZMcz6MKkHSajLVCbF1vwP6dUG2J+QNmbWv0J2wkn
 7gjGbSUv8Iy+F1bBVEPZiTZm3iKSdPdNm6lSNqK3JVjNLUvzn9eJqvNWryVQ76YqykU/
 OEZiVKB/Wdmg54rAMHFu7DxMXaWRK1xcxGqmp7pwy7M48/SKLqbmZfFaOfThfstvBqP1
 1OUpAIpG9xFoxtFF4yGkWJrAgu/Tj8Rqxjk0HTrV86gKIF62KQ0U5zGnSigdhxpqQeVa
 /bTsm8TmyYiYS7/uIw84oF6H2ncG1ORhyIm4LRC4C/KlJBj6eD7puz+/uitrIn6v3LvS
 1p5A==
X-Gm-Message-State: AOAM531QDBzAsegEVbSeXL2PAD4B5LT7KiC7yuSIKm5ugy/Lcy3LYOHM
 3f5uMbErwt7np9J6YVbh7S4SnA==
X-Google-Smtp-Source: ABdhPJwxuJR5FNaFOeQuuTYdtMofIT5+18r8iXh+MV7YhfMRJf27n/x+7ThZDE3kkaBxOtliYq23Aw==
X-Received: by 2002:ac8:44ca:: with SMTP id b10mr24067709qto.224.1624285077981; 
 Mon, 21 Jun 2021 07:17:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id y15sm10797034qto.90.2021.06.21.07.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:17:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lvKkO-009WjS-US; Mon, 21 Jun 2021 11:17:56 -0300
Date: Mon, 21 Jun 2021 11:17:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
Message-ID: <20210621141756.GF1096940@ziepe.ca>
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
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
Cc: sleybo@amazon.com, Gal Pressman <galpress@amazon.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:

> Mission acomplished, we've gone full circle, and the totally-not-a-gpu
> driver is now trying to use gpu infrastructure. And seems to have
> gained vram meanwhile too. Next up is going to be synchronization
> using dma_fence so you can pass buffers back&forth without stalls
> among drivers.

Well, we can't even see the other side of this so who knows

This is a new uAPI, where is the userspace? In RDMA at least I require
to see the new userspace and test suite before changes to
include/uapi/rdma can go ahead.

> Doug/Jason from infiniband: Should we add linux-rdma to the dma-buf
> wildcard match so that you can catch these next time around too? At
> least when people use scripts/get_maintainers.pl correctly. All the
> other subsystems using dma-buf are on there already (dri-devel,
> linux-media and linaro-mm-sig for android/arm embedded stuff).

My bigger concern is this doesn't seem to be implementing PCI P2P DMA
correctly. This is following the same hacky NULL page approach that
Christoph Hellwig already NAK'd for AMD.

This should not be allowed to proliferate.

I would be much happier seeing this be done using the approach of
Logan's series here:

https://lore.kernel.org/linux-block/20210513223203.5542-1-logang@deltatee.com/

Jason
