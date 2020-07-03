Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE64D21531A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E705A6E314;
	Mon,  6 Jul 2020 07:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FA46EB61
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 12:03:38 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id u8so14130357qvj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fdGxMNXjFPRMChoChNI232n2phwqd5WMAfBmTzyFaCA=;
 b=io/ZIfzMns8BtNmbtgig4AnbsihUo008AXWgkudubi7S5omOtZWbcf2u5xq5r6ziPd
 8VbcLiM7gvaiNtocONI3En9uup8UPIhXF6lzDcS3QY0+IlqQt2b56XP2Wd1Eq9StFNRj
 FbxqMxoSvq09ert+r1uqKwKIGlxXoy0ZW45XZSDcCbofywfXSFq4d8lHnIqKrRwanqq8
 /+qJEAYq1IsXobneb14Ws16jhmXIblDWKBwdM2jIOABicWVShZJ6BFbzhJuMeGlGty3B
 sE/CwNcGivydRmOVCIR51uWpXOrAalZBX41CqhqBRWtRDLvksgvlsixNU02FMxBoXiI2
 ynZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fdGxMNXjFPRMChoChNI232n2phwqd5WMAfBmTzyFaCA=;
 b=SuEQBIUU0YZ3VwEn0yueWJ/c+OwzYCMzhVMmpQlOsug7sMm9c0DCnNwA2j2cvrdNtc
 L+xsQoOUfb5QQ3ux/hwX6yrdnlm3GQ7evSGGKLsig6XhjoDYtQdENBS5lIDcSxpIsw35
 ZMsoXZGRxjip14vKWUPeKXSxVVfcMpuVONKQjPL3U7oW5nkAe1VgHJjXbHzxQic5BN9Z
 sbWjzXXnqoh+1j5bhEmBfmOJoBRGgtZn+DLgl84fHczAjhhO9Af73RtLJ+EXh8wGDkM4
 DIpSBJF7NGkbkolrnFyb0UFHU5eD1sAIXGp/DmwlKRnv2lCS05xGuJGK03ktazb8/ZEL
 GDJQ==
X-Gm-Message-State: AOAM5315KJ/WJP4hv0Z/Mlm0oFeI2x2X835x1FPTDeNcDiVSOf14elJu
 exuhfBmNAqi+mXH0RDOOfgCmJA==
X-Google-Smtp-Source: ABdhPJzkvP2fdUrs5YNEbm9kPZezMluWe3j86tbq6FtDJsXIejjeLeeNT4FwLdwBdZ6rU3GiAW2i4A==
X-Received: by 2002:a05:6214:851:: with SMTP id
 dg17mr35543091qvb.235.1593777817181; 
 Fri, 03 Jul 2020 05:03:37 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y16sm9988554qkb.116.2020.07.03.05.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 05:03:36 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jrKPn-003RZq-RU; Fri, 03 Jul 2020 09:03:35 -0300
Date: Fri, 3 Jul 2020 09:03:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200703120335.GT25301@ziepe.ca>
References: <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702181540.GC3278063@phenom.ffwll.local>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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

On Thu, Jul 02, 2020 at 08:15:40PM +0200, Daniel Vetter wrote:
> > > > 3. rdma driver worker gets busy to restart rx:
> > > > 	1. lock all dma-buf that are currently in use (dma_resv_lock).
> > > > 	thanks to ww_mutex deadlock avoidance this is possible
> > > Why all? Why not just lock the one that was invalidated to restore the
> > > mappings? That is some artifact of the GPU approach?
> > 
> > No, but you must make sure that mapping one doesn't invalidate others you
> > need.
> > 
> > Otherwise you can end up in a nice live lock :)
> 
> Also if you don't have pagefaults, but have to track busy memory at a
> context level, you do need to grab all locks of all buffers you need, or
> you'd race. There's nothing stopping a concurrent ->notify_move on some
> other buffer you'll need otherwise, and if you try to be clever and roll
> you're own locking, you'll anger lockdep - you're own lock will have to be
> on both sides of ww_mutex or it wont work, and that deadlocks.

So you are worried about atomically building some multi buffer
transaction? I don't think this applies to RDMA which isn't going to
be transcational here..

> > > And why is this done with work queues and locking instead of a
> > > callback saying the buffer is valid again?
> > 
> > You can do this as well, but a work queue is usually easier to handle than a
> > notification in an interrupt context of a foreign driver.
> 
> Yeah you can just install a dma_fence callback but
> - that's hardirq context
> - if you don't have per-page hw faults you need the multi-lock ww_mutex
>   dance anyway to avoid races.

It is still best to avoid the per-page faults and preload the new
mapping once it is ready.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
