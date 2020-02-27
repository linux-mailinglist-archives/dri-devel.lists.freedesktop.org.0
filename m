Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76685170F94
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 05:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615FB6E4B3;
	Thu, 27 Feb 2020 04:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42486E4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 04:20:34 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EEC024683;
 Thu, 27 Feb 2020 04:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582777234;
 bh=BECaB+Ut74MoxAcBNYXnzotnl92PywVMuwfwsNQiQfk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O5f+tM8RERi9tm/HS7jSaT1YrCXKOFmCYNZ0sYoBt0dwOTTFxmmoAYJ6YmCixIFDo
 z8MK7H3SeqJSWLryyYBWGskvRZ57Btkrm5rv252k5Pkc8t0m2NQsPv+LZQ02gBm7HF
 tzgq1imgdl6LsZjcH9cwo7jZM5hT4rFZw1J/YRCw=
Date: Wed, 26 Feb 2020 20:20:33 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: + dma-buf-free-dmabuf-name-in-dma_buf_release.patch added to
 -mm tree
Message-Id: <20200226202033.c3fccbaca353e110b1a3bf00@linux-foundation.org>
In-Reply-To: <CAKMK7uGvixQ2xoQMt3pvt0OpNXDjDGTvSWsaAppsKrmO_EP3Kg@mail.gmail.com>
References: <20200203173311.6269a8be06a05e5a4aa08a93@linux-foundation.org>
 <20200226015504.7GW9ptoIA%akpm@linux-foundation.org>
 <CAO_48GFr9-aY4=kRqWB=UkEzPj5fQDip+G1tNZMsT0XoQpBC7Q@mail.gmail.com>
 <CAKMK7uGvixQ2xoQMt3pvt0OpNXDjDGTvSWsaAppsKrmO_EP3Kg@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: mm-commits@vger.kernel.org, Chenbo Feng <fengc@google.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Greg Hackmann <ghackmann@google.com>, WANG Cong <xiyou.wangcong@gmail.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Feb 2020 10:36:26 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:

> On Wed, Feb 26, 2020 at 5:29 AM Sumit Semwal <sumit.semwal@linaro.org> wrote:
> >
> > Hello Andrew,
> >
> >
> > On Wed, 26 Feb 2020 at 07:25, Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > >
> > > The patch titled
> > >      Subject: dma-buf: free dmabuf->name in dma_buf_release()
> > > has been added to the -mm tree.  Its filename is
> > >      dma-buf-free-dmabuf-name-in-dma_buf_release.patch
> >
> > Thanks for taking this patch via -mm during my absence (I'm just
> > returning from a bit of an illness). If there are other dma-buf
> > patches on your radar that you'd like to take via the mm tree, please
> > let me know and I can provide the necessary Acks.
> > Else I will take them in via drm-misc as usual.
> 
> I thought at least that for cases like these -mm is the last resort
> tree, so proper thing to do here is apply this fix to drm-misc-fixes
> and get it out there. -mm rebases, so will fall out again.

Yup, go ahead.  If a patch pops up in linux-next I'll autodrop by copy.

And please do give some thought to whether this should be cc:stable. 
If it's an unprivileged operation then hellyeah.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
