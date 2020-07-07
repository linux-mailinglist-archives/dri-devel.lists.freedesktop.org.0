Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD297218064
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866E26E894;
	Wed,  8 Jul 2020 07:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD3989C8F;
 Tue,  7 Jul 2020 18:18:04 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id k15so25298066lfc.4;
 Tue, 07 Jul 2020 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BS5oJnyO5K6NCAB/a52k+DpKF9O4k6VgS2Nzs3Rg6YI=;
 b=ey0CiRFAVZbnWmWODi8Xx4vhHFmJgql/gTkk6J7K1SKAyufCkI5s9HfnX8dQtnx7Ss
 uz813mi+4nomybriOWWXmy8bLN0RzFivymy2YY4R8mzM8IVwfY83UYEtJdvtHRnIrS8k
 3eUprbqbJNWX3wIIo+4/Yh8EDHdqm0NshTptsqEidKNb5JZifJyOYMUPYW4oSkXQWleH
 PkhXyZmhn3DCGC2xjIrSo/qS4okjg+aEyhHWtq25j4ajy90Fb0ejYwzcnHAmYwP+n2qP
 rTSVVpPPOC01AhL1yTYbsCKjvQmdIJOUxzNy+cnl4TWx/+9eg838aRsHuxVV7qp1h6IY
 nrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BS5oJnyO5K6NCAB/a52k+DpKF9O4k6VgS2Nzs3Rg6YI=;
 b=G+tA8SiCsh/Jas5yplrYT445noPlT8Nt97qXBNM+5gBqs1Wqo19jO72XJ4R9Z3tCAF
 pDESaGA3iTpm4KHFnxrukuKl9q2gt15t4JZBzHz7YOxTxXWGf0V3z7Tx3usYRf/+yru1
 0priGOhRRWmrtjnLQBENU/b0ThRdwzVxqdUq7vntnLWpbEuirmkbgB5HzvApK0Jlh8Ir
 GJ6rkaZEZsLH7kZnuphohqlj3KkVoFx10WPSR8f7Jm593tZzV8nOB/v8NC+2ykm/REzK
 EzFw/81N/x9ZK9ioKg6D6r0pQMKWq4RLAvXiaaKUxiAU0oaK5jIud7SPSyat59ieRkgy
 nnsQ==
X-Gm-Message-State: AOAM532z1vvy5gmuq1XWEjPFI+mVBZsoEs4PprIgsz3nZ8NAETdnOLrA
 mVZOz76FpGuUYIlHtuMzBxYAR25uNY5FGmDEM0D8nJQRBqE=
X-Google-Smtp-Source: ABdhPJy93bC3ASladwqXdXhPKCrPOP5AsPWvyqZe8J8HwWOnhjwya9nI/LymqqZJpEniYeng3NvHsQpNlhFSRPLS4Vg=
X-Received: by 2002:a05:6512:4c6:: with SMTP id
 w6mr31399501lfq.76.1594145882259; 
 Tue, 07 Jul 2020 11:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200707160012.1299338-1-chris@chris-wilson.co.uk>
 <CALqoU4y61Yc5ndaLSO3WoGSPxGm1nJJufk3U=uxhZe3sT1Xyzg@mail.gmail.com>
 <159414243217.17526.6453360763938648186@build.alporthouse.com>
In-Reply-To: <159414243217.17526.6453360763938648186@build.alporthouse.com>
From: lepton <ytht.net@gmail.com>
Date: Tue, 7 Jul 2020 11:17:51 -0700
Message-ID: <CALqoU4ypBqcAo+xH2usVRffKzR6AkgGdJBmQ0vWe9MZ1kTHCqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vgem: Do not allocate backing shmemfs file for an
 import dmabuf object
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 "# v4 . 10+" <stable@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 7, 2020 at 10:20 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting lepton (2020-07-07 18:05:21)
> > On Tue, Jul 7, 2020 at 9:00 AM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > >
> > > If we assign obj->filp, we believe that the create vgem bo is native and
> > > allow direct operations like mmap() assuming it behaves as backed by a
> > > shmemfs inode. When imported from a dmabuf, the obj->pages are
> > > not always meaningful and the shmemfs backing store misleading.
> > >
> > > Note, that regular mmap access to a vgem bo is via the dumb buffer API,
> > > and that rejects attempts to mmap an imported dmabuf,
> > What do you mean by "regular mmap access" here?  It looks like vgem is
> > using vgem_gem_dumb_map as .dumb_map_offset callback then it doesn't call
> > drm_gem_dumb_map_offset
>
> As I too found out, and so had to correct my story telling.
>
> By regular mmap() access I mean mmap on the vgem bo [via the dumb buffer
> API] as opposed to mmap() via an exported dma-buf fd. I had to look at
> igt to see how it was being used.
Now it seems your fix is to disable "regular mmap" on imported dma buf
for vgem. I am not really a graphic guy, but then the api looks like:
for a gem handle, user space has to guess to find out the way to mmap
it. If user space guess wrong, then it will fail to mmap. Is this the
expected way
for people to handle gpu buffer?
> -Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
