Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56658369B5D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 22:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40E06E182;
	Fri, 23 Apr 2021 20:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B316E182
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 20:37:02 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 35-20020a9d05260000b029029c82502d7bso14971578otw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n+Lz2TX+kMzb81cQaVrZn/S3HsQ886ZKObdk4TR8rGM=;
 b=mtUubTCiYbbtl7jdlEhqYee9xYWGtLmQVd4S4ti3uiFf7RNFAxhNToaQ0yBpWsEmIS
 7X3AhI/WrAuco42pB5so245EmeieJ7GNpsc7COlKbr5L9eR95+8y0Nm2dquGuopmg4wv
 0GCVape7MMBAJfE34o5kkcuLxHJ1/r0XDBPP1N/T2DrASZ/2tJADHqNj77tHKqUc7al8
 a9vQIUzYSR6LyoZi1cZ2x56Z6wb4i/mrFiBoxwGnxVIYYlKiscE62M2+Jz/4MYfGwVuR
 ZohYPvIkptMVLvgZGiKdoYKF865X65zf9nEdnAAWPDZAp3XLL4IV4P/Y9shMioYlGdUm
 2c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n+Lz2TX+kMzb81cQaVrZn/S3HsQ886ZKObdk4TR8rGM=;
 b=pb1OXk+t5KJ+O9XOgQ3AsohcB4nWTioTxBPI6dVZGtl6X4DA+YIt8i40Qit7jUzBRZ
 JElvA3A6PW9OtV7KONqsKFk9YESHWIn3nPrRNcdvUgP76K0UIXNO2p8VLApbG5KQFrE3
 GTR0z5KhqVrsgeOoBBukeUcPAHpBpYIDnLBwnFaURtrRM5UrTI8XTX+8rTVr+CSa0pWV
 cAnXQu7pYGGWVp4sfLP9RXbURQBZ5sWcfmCQ8LoHFl27j/VQR9PFplqCbXWQ0TqOuLhW
 8SUTP2OQIPe/MWZ5NSHTN5A2CBvGSeoe1/E9aOnq6FY2PFCPa/Lvr7MpLHgTmZ1+43Oe
 IIYQ==
X-Gm-Message-State: AOAM5330P9gBFchHkVl076cntj1BfTxCHCHT8ecfYV/GmYqu1n4le6Ce
 74OU81Xhs5xdDwTs6JkuLY1Ad+AbaKx9c+jOVMcf+CsqWPNBdfWz
X-Google-Smtp-Source: ABdhPJzC4zx2bb7IiGqj8Z2NxHVgJ1/V4g7any3R9OrebY62e+iqDOGxVUVa2v8coETtkxX7ySnfVX7V4tNPA5HKJ1M=
X-Received: by 2002:a05:6830:15d3:: with SMTP id
 j19mr4891264otr.23.1619210222043; 
 Fri, 23 Apr 2021 13:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210416124044.53d4beee@canb.auug.org.au>
 <20210421164024.42bc068f@canb.auug.org.au>
In-Reply-To: <20210421164024.42bc068f@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Apr 2021 16:36:50 -0400
Message-ID: <CADnq5_NGLC719T9Mx1wR+aLi8Ybwr8-ocCSYCRe=uNEBvJ+R4A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Prike Liang <Prike.Liang@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 2:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Fri, 16 Apr 2021 12:40:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> >
> > drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
> > drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-variable]
> >   312 |  struct pci_dev *rdev;
> >       |                  ^~~~
> >
> > Introduced by commit
> >
> >   9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to simple suspend/resume path")
>
> I am still seeing this warning.

I no longer have that patch in my tree.  Was this an old build?

Alex

>
> --
> Cheers,
> Stephen Rothwell
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
