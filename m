Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E81FF500
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 16:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73CC6E45E;
	Thu, 18 Jun 2020 14:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69AB6E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:42:40 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so6300735wru.12
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pdYzXGFouE6m4FSIkgrBziaqe3C5lzqdVFEvi65td6k=;
 b=Yv00WEyiSIg66gxJEUUQwcy2Tlc1E6Wc6zvKRDzYUlRDO6iCWLetHtRbnLoDvvQlXe
 zOvWWpAvNNuvZIWHgr0fKWDsU8iNkZKTU9Ci4Vt8EkYVQUyV00qvQSrVYglPeqw2m8hn
 YqvRGf3NKI0NMSmp82ufCgdaCILt0ba9vFJX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pdYzXGFouE6m4FSIkgrBziaqe3C5lzqdVFEvi65td6k=;
 b=MTIXxsM5e7k3zRTtWCQ55BClfFqp0hsdfH1hijn4iNLUulz+3TxGvw+Y8FVJe65dyc
 IuwlotdPgtewz6AIOfI5M8tIww9rZsH7rMlM9nQIBer1zQUphEgvQQDp5V64vKxS47Oe
 4exDZztnG3fWfgQbBMhqMh3i29FCjPSc/QKYUPAVNx8sgQ3UQPx+HrWO0lY/K/GmfFML
 AAfyrT+cUBGi73bYzTDItRmuQOs8YIoaja/q+yylhSh1Pn5IAYiQ2fh4a6MinCRAkwa8
 4wUBoI6p/OXp/Brfk2r9hBcly7zksJSivA3g9M2mNH4tPz1rrOfsgahtNZGRYB/s4YV/
 MDGQ==
X-Gm-Message-State: AOAM5300cdsOj5wa+i1otOyfwhr2UfM28MdawXTj+ZVX8iUugYeuisfv
 jTtmE3lwJ7yH93YeqB/hYd1lzA==
X-Google-Smtp-Source: ABdhPJxnVXjNFjlZjZjkcFFWafgkcwR6ZwnMtNAx31PJPXgT9P8/Pv/85bqfzuCJe/q/lkXd/e/Xbg==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr4325124wrj.265.1592491359458; 
 Thu, 18 Jun 2020 07:42:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g25sm3649693wmh.18.2020.06.18.07.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 07:42:38 -0700 (PDT)
Date: Thu, 18 Jun 2020 16:42:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200618144236.GR20149@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
 <20200604081224.863494-5-daniel.vetter@ffwll.ch>
 <b11c2140-1b9c-9013-d9bb-9eb2c1906710@shipmail.org>
 <20200611083430.GD20149@phenom.ffwll.local>
 <20200611141515.GW6578@ziepe.ca>
 <20200616120719.GL20149@phenom.ffwll.local>
 <20200616145312.GC6578@ziepe.ca>
 <CAKMK7uER6ax1zr14xYLKqDfDZp+ycBsY9Yx7JaVkKQ849VfSPg@mail.gmail.com>
 <20200617152940.GG6578@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617152940.GG6578@ziepe.ca>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 12:29:40PM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 17, 2020 at 09:57:54AM +0200, Daniel Vetter wrote:
> 
> > > At the very least I think there should be some big warning that
> > > dma_fence in notifiers should be avoided.
> > 
> > Yeah I'm working on documentation, and also the notifiers here
> > hopefully make it clear it's massive pain. I think we could even make
> > a hard rule that dma_fence in mmu notifier outside of drivers/gpu is a
> > bug/misfeature.
> 
> Yep!
>
> > Might be a good idea to add a MAINTAINERS entry with a K: regex
> > pattern, so that you can catch such modifiers. We do already have such
> > a pattern for dma-fence, to catch abuse. So if you want I could type
> > up a documentation patch for this, get your and others acks and the
> > dri-devel folks would enforce that the dma_fence_wait madness doesn't
> > leak beyond drivers/gpu
> 
> It seems like the best thing

Just thought about where to best put this, and I think including it as
another paragraph in the next round of this series makes the most sense.
You'll get cc'ed for acking when that happens - might take a while since
there's a lot of details here all over to sort out.
-Daniel

>  
> > Oded has agreed to remove the dma-fence usage, since they really don't
> > need it (and all the baggage that comes with it), plain old completion
> > is enough for their use. This use is also why I added the regex to
> > MAINTAINERS, so that in the future we can catch people who try to use
> > dma_fence because it looks cute and useful, and are completely
> > oblivious to all the pain and headaches involved.
> 
> This is good!
> 
> Thanks,
> Jason 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
