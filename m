Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DEC2B1768
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2666E45E;
	Fri, 13 Nov 2020 08:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD746E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 13:25:16 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g17so3888731qts.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 05:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Vkv5jtIJud+QIqcEKAOrz49oEiKkFPAoACrsXa1ygRI=;
 b=Y+8FL3R3aa2iCZyQyaVvGjWPzY6Z3jTlOk9UvCp0XbmnptOo8ioxNJ342L9eRV87/v
 kBr7Uc3IcB3jLIhgBWj1JLHFlzjPn0ONvp4KvsrXBnvBpM1bbAQYW80fTqopVwzy7/QL
 v145ule18cZqgJGNSFTRfnRLoNxnfkxGCv93Qk+prb4/ElemeYtnlRkwMxXSTIaZ2+et
 7uTa75c1MGuYO6AE50dBzd6nJ7UOsGsItaUtEd1GToXwyuwnyUraDj3IyQ6RLvWLuc7e
 C8Y2B8b1gQCO5U6HOpbcp7psDZG3km2Wm82VXZqxWnB0n4UhGhU+sr85efHvVAPMlDt4
 j5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vkv5jtIJud+QIqcEKAOrz49oEiKkFPAoACrsXa1ygRI=;
 b=BhA8HXZg5+TPW7dSLDljoce05KnoMCieeUHf5oNjiGxga1ycDnf+dblbPnSqOE1j7M
 GVwpx8dcg+X0EwQJiV0eY5w3v1kkVRO5iYPtsQnOjpkmxxfPHsQ53r1D+sN+3Ti39YRN
 RnooABigyR7K1Vk9Bf9zdO6Yfg5EUZ75+zLIR9OxuooiVv3Oytgo50pJljNbosH9nqlX
 KeJpVfsZ4O648yGMtL9JmsMuFzV0LuzHCKKj8wzaxYiu+laWgrAI80mZizBL6BjI8vzY
 j+OTWFP4VXFWEbbHz04ZPaFmqcsXkQPyc6kcyX/q8oTSLViuVKQJVByrYZZrTrrfOJ1P
 GBFw==
X-Gm-Message-State: AOAM530dszbZavgbQ8EFdsQYgIIHvQHHIgHJSEJL+LKgkAZXUB4mI00X
 UkSzlvj1ka77lFewt6XJx5BJpg==
X-Google-Smtp-Source: ABdhPJwYDJZ9CsmJHHji4+pBSpYm8kKmHl05XRyzWDUaADZStBu1Fbw/SJ8cr66iCQGhH6tHaJ1vNw==
X-Received: by 2002:a05:622a:254:: with SMTP id
 c20mr5230454qtx.335.1605187515293; 
 Thu, 12 Nov 2020 05:25:15 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id w45sm5038843qtw.96.2020.11.12.05.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 05:25:14 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kdCbC-003frw-5j; Thu, 12 Nov 2020 09:25:14 -0400
Date: Thu, 12 Nov 2020 09:25:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v10 6/6] dma-buf: Document that dma-buf size is fixed
Message-ID: <20201112132514.GR244516@ziepe.ca>
References: <1605044477-51833-1-git-send-email-jianxin.xiong@intel.com>
 <1605044477-51833-7-git-send-email-jianxin.xiong@intel.com>
 <20201111163323.GP401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111163323.GP401619@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 05:33:23PM +0100, Daniel Vetter wrote:
> On Tue, Nov 10, 2020 at 01:41:17PM -0800, Jianxin Xiong wrote:
> > The fact that the size of dma-buf is invariant over the lifetime of the
> > buffer is mentioned in the comment of 'dma_buf_ops.mmap', but is not
> > documented at where the info is defined. Add the missing documentation.
> > 
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> 
> Applied to drm-misc-next, thanks for your patch. For the preceeding
> dma-buf patch I'll wait for more review/acks before I apply it. Ack from
> Jason might also be good, since looks like this dma_virt_ops is only used
> in rdma.

We are likely to delete it entirely this cycle, Christoph already has
a patch series to do it:

https://patchwork.kernel.org/project/linux-rdma/list/?series=379277

So, lets just forget about it

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
