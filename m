Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7234D215306
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA06E1BC;
	Mon,  6 Jul 2020 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D046E113
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 13:14:47 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id di5so9296302qvb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SkKE2cHtoC6QnB7EIDlRboTvU4UZ4rc7BGA1P56tIu0=;
 b=nZ+KcpPDHexgm357/fqvU7+VQjzGKymeORvN/t8m0kH6EHfmO1djyJo00c4ua/5ZUR
 Vxi3HO97jB8Y983Qs5OAvTD84HUB2LWG8HyPpc1k/sgRad+QwjF48YQDD0RWM4vSA5OI
 3slb8JjUh9DykF6O+OIhDFNxvmIYW3jP/E2Rs8oNsWY7DBvK5cp+VQY8iRzIWtzNn47S
 ONhIqUuf8mKeVNpMAM4AK/m349/G/dL6fLVw6aNxPqc8fYvC8glZw8gt+NvxLoAODtOg
 KnW7bQHrymS6t13M3/qnbuLy5/Dj7nvEEFyN4RZdsF/M/yQTM8pwHuC22ZsIEPThSTSa
 dz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SkKE2cHtoC6QnB7EIDlRboTvU4UZ4rc7BGA1P56tIu0=;
 b=KaNbcOWw/rKRjumaQ71Uqj1BDbHv1b5LOkoeTJiZtRyPcKiI1U8aYGwdizAxIj84HG
 3GELvI0rJhLTUIkeKMCYovJBLeMZ81cfmW/v2wZD1lLqDOHwZ4sqijkDvqov7Bs54KQh
 XUZHnpFeM771qckecue4SejgfbUfkZxWDAEBoq0xgoSmdSGU7WzKJPMB4EpD9pi5MS1I
 a1UBugxs3UMWE66/az9Dfle4+3cDyVqQzyz9y106ed3XuS7wGt1XAszVWZhq00ouhCWh
 DvbQqh5N5CBqlw/lh4Ly6E7XVz/x145f5Wz4nbSU2RRg1UTZXIZg1LWnTv+Ng7B2wOY/
 VyZg==
X-Gm-Message-State: AOAM530juVYrLtYDaIDXjhJgJNpk2tvDyAkJXJdlftJOqoJZyLIZxo6p
 fg4ssJmnbko8Cf8ZzZ9FBY+JEg==
X-Google-Smtp-Source: ABdhPJw38gG6c/7THKM9olPhRo8b++3mDeKvGE5brGFyeHdS1AWGt1vvwet3iR7jiA4ulKawpxm2Tw==
X-Received: by 2002:ad4:48cf:: with SMTP id v15mr35835161qvx.101.1593782086787; 
 Fri, 03 Jul 2020 06:14:46 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x29sm11148829qtv.80.2020.07.03.06.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 06:14:46 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jrLWf-003aeK-KP; Fri, 03 Jul 2020 10:14:45 -0300
Date: Fri, 3 Jul 2020 10:14:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
Message-ID: <20200703131445.GU25301@ziepe.ca>
References: <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
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

On Fri, Jul 03, 2020 at 02:52:03PM +0200, Daniel Vetter wrote:

> So maybe I'm just totally confused about the rdma model. I thought:
> - you bind a pile of memory for various transactions, that might
> happen whenever. Kernel driver doesn't have much if any insight into
> when memory isn't needed anymore. I think in the rdma world that's
> called registering memory, but not sure.

Sure, but once registered the memory is able to be used at any moment with
no visibilty from the kernel.

Unlike GPU the transactions that trigger memory access do not go
through the kernel - so there is no ability to interrupt a command
flow and fiddle with mappings.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
