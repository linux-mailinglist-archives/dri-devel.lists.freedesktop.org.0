Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE230F428
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 14:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B106E072;
	Thu,  4 Feb 2021 13:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2010B6E072
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 13:50:50 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id q3so766489oog.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 05:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DB61A9zwN5JbCrUSGbgi+YlUmk0sna7FAWRcwbAA10U=;
 b=Kc79uhb28akxRTbMPg+WMOWTfxyPp+QPmP3EeRomf34bYMT5ODsR8AsyupITlQm4+L
 PEWVUSR0Er1doMe+MFNZjGfIUNqvUlJAZ4oWw241tYp5mz00j+VGFHoc1E0FIZxgQjms
 GHkmJNhT409VDAZfclr2zMK7w+tKY01FNJHtiFggtZRKRfbLVI+1+T7dH1793imXNgOY
 StBE38MN2hTazGjwXjfbzvIwi1ZCY1F/Tzw435eBkmLSpg5tSbUh4xRNQO+482p+wgAM
 npQjxw3bGiyE4mMSWVBD92DhDGu3ZsS1yYighLlT9Ivqbg9roBdxhLrh3aloQo1qVUSo
 rRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DB61A9zwN5JbCrUSGbgi+YlUmk0sna7FAWRcwbAA10U=;
 b=b5Ghpf1DdiKkl4xQf+m73Iwbp0nfJlDlbejsdBzlqOOrxS2osVl0b4+fRDwzSxMuAc
 AaOn7IlC59ivfR8H3A8vlcN+7c3tlpRzWMy8DXZ3gY45x0laMOYCV1B5HMk5PwZ4BdUb
 VqRT8RdXIOgrOkixF5T86OWCXwbyRlF/DeZX6rS7vTAKL4ImHlYEENsa0Q6+SRsSgegw
 nnEzgMQ96yLI8/ucoJOK9IvcxWHP4eWUOfa/sgpIm2tF5jN8RT4E47nwAvzE8/Mdz6Yd
 RZs7m8nPRGjqYxRwMCAthYsQayY/PIGLFUpuf1AtsSK7KHgDmzjUZJnr2c2jpMCIAuLc
 BtBg==
X-Gm-Message-State: AOAM5332ealwQFHqjNr+i2rXhJ7GGAZCDYqIP4chXyz/4PSd6Suk6Yb5
 QdThXX0k5p3mT2WxVoE5is0Y+cAyNVFE5F4Vilg=
X-Google-Smtp-Source: ABdhPJxEHe9Sc2AQbmCn9y/ZhPaAoIay1/acK2RNsdQigvHF+i5RVELNW8SRus+VIX0Pl/ihPyre4o8LqCyN0zHQb/M=
X-Received: by 2002:a4a:de94:: with SMTP id v20mr5642639oou.90.1612446649498; 
 Thu, 04 Feb 2021 05:50:49 -0800 (PST)
MIME-Version: 1.0
References: <1608067636-98073-1-git-send-email-jianxin.xiong@intel.com>
 <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
In-Reply-To: <5e4ac17d-1654-9abc-9a14-bda223d62866@nvidia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Feb 2021 08:50:38 -0500
Message-ID: <CADnq5_M2YuOv16E2DG6sCPtL=z5SDDrN+y7iwD_pHVc7Omyrmw@mail.gmail.com>
Subject: Re: [PATCH v16 0/4] RDMA: Add dma-buf support
To: John Hubbard <jhubbard@nvidia.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 2:48 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 12/15/20 1:27 PM, Jianxin Xiong wrote:
> > This patch series adds dma-buf importer role to the RDMA driver in
> > attempt to support RDMA using device memory such as GPU VRAM. Dma-buf is
> > chosen for a few reasons: first, the API is relatively simple and allows
> > a lot of flexibility in implementing the buffer manipulation ops.
> > Second, it doesn't require page structure. Third, dma-buf is already
> > supported in many GPU drivers. However, we are aware that existing GPU
> > drivers don't allow pinning device memory via the dma-buf interface.
> > Pinning would simply cause the backing storage to migrate to system RAM.
> > True peer-to-peer access is only possible using dynamic attach, which
> > requires on-demand paging support from the NIC to work. For this reason,
> > this series only works with ODP capable NICs.
>
> Hi,
>
> Looking ahead to after this patchset is merged...
>
> Are there design thoughts out there, about the future of pinning to vidmem,
> for this? It would allow a huge group of older GPUs and NICs and such to
> do p2p with this approach, and it seems like a natural next step, right?

The argument is that vram is a scarce resource, but I don't know if
that is really the case these days.  At this point, we often have as
much vram as system ram if not more.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
