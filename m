Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16556774B1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 05:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC37B10E305;
	Mon, 23 Jan 2023 04:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C321F10E305
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gn+EEhD9AwqmASOet+WmWkkx11j/sBtEj1r0Vez2fZ8=; b=cnSg/aTEkcd6NarLXKMWFH55Hj
 +tnCgTrOR1ZFnaARi0DacKX4/GvKX6g9aY7vLQiWcHE03/Q++qgFKL5/KLz6IvbiusZFSRqQjzodp
 hzGE5KGiQM4bkWS0tbn132VKC+JnGmdfLjVKLfVoEukfFHOTHxIuGxL0XsZKqJQ1w1131oDNRScq6
 IJHLfNnq1urBDj6F2ZAJeNs68ZIuPMrMyQ9s1xTAt83D5QmmygtC31t7L8Gz+QZmANxmvYOtIB+fs
 I0eKJDci8/bA4Wp1N3jeQ2dA4mixnjLp0Bb13foCgJQTnoy9ebMBWQ0/hSAkW4t6biPiQqK7Y2RAQ
 bHU9lDQQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pJoZF-003yRD-Jz; Mon, 23 Jan 2023 04:36:25 +0000
Date: Mon, 23 Jan 2023 04:36:25 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [LSF/MM/BPF proposal]: Physr discussion
Message-ID: <Y84OyQSKHelPOkW3@casper.infradead.org>
References: <Y8v+qVZ8OmodOCQ9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8v+qVZ8OmodOCQ9@nvidia.com>
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

On Sat, Jan 21, 2023 at 11:03:05AM -0400, Jason Gunthorpe wrote:
> I would like to have a session at LSF to talk about Matthew's
> physr discussion starter:
> 
>  https://lore.kernel.org/linux-mm/YdyKWeU0HTv8m7wD@casper.infradead.org/

I'm definitely interested in discussing phyrs (even if you'd rather
pronounce it "fizzers" than "fires" ;-)

> I've been working on an implementation and hope to have something
> draft to show on the lists in a few weeks. It is pretty clear there
> are several interesting decisions to make that I think will benefit
> from a live discussion.

Cool!  Here's my latest noodlings:
https://git.infradead.org/users/willy/pagecache.git/shortlog/refs/heads/phyr

Just the top two commits; the other stuff is unrelated.  Shakeel has
also been interested in this.

