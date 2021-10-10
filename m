Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C54842814F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 14:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6D36E323;
	Sun, 10 Oct 2021 12:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927016E323
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 12:42:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C42B560E9B;
 Sun, 10 Oct 2021 12:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633869734;
 bh=Bpy6PoeXSREAwPQ0KcOu32aZSxTiBSBrVaAh6SrEQFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FxbNIA7lfuxW1Is4/zht8jBaWGaBkTbxAVU0xxna4LeFF89ZKaxT5p2Zkx5WlaTCd
 4IYJ02oEBRZ4+NwHoF0HaxZW3xebMMOeD/C81pMhuCLnOZFF8l7hbO+6XhRuByYTo9
 oKKIswcBFig4LUq9HHluZs5/ETup12NyjW5H5MLs=
Date: Sun, 10 Oct 2021 14:42:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
Message-ID: <YWLfo5xRKjVGmP62@kroah.com>
References: <YU8oVDFoeD5YYeDT@kroah.com>
 <CAK8P3a3pdVhjv4J4HSB1cvHU7U_P7TV7HCOYmrK==V_MAnT2BQ@mail.gmail.com>
 <CAK8P3a0gSJrR=rLtyLOH+D-grsoy_9_kOOS-AT3aX8R48p+zww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0gSJrR=rLtyLOH+D-grsoy_9_kOOS-AT3aX8R48p+zww@mail.gmail.com>
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

On Mon, Sep 27, 2021 at 11:39:21AM +0200, Arnd Bergmann wrote:
> On Sat, Sep 25, 2021 at 7:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Sep 25, 2021 at 3:47 PM Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > > Only test-built on x86 allmodconfig, don't know what other arches will
> > > pick up, will let 0-day run on it for a bit...
> >
> > I've added it to my build box doing arm32/arm64/x86 randconfig tests,
> > if it doesn't report anything by Monday, it's probably good in that regard.
> 
> It found these two, please fold into your patch:

Now folded in, odd that 0-day didn't find it...

Thanks for the ack as well, I'll send out a v2 soon.

greg k-h
