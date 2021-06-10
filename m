Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F53A34CC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841416EDDF;
	Thu, 10 Jun 2021 20:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591856EDD7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:26:34 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id m9so1130964ybo.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NvORuV7skKhdxfsWvNOps9GtT+VFGohWSjUuO0cZcHI=;
 b=O/aVKVtz4Q9zacbkZaXZpMtcCLsFqWNDj1U9Pis+s435q0WYB7X0vzqh5jXFIHkg7q
 DAL5CqN9J8TxGz6nQxtW2uLQpsWAoaSRJwWL0VcxELHb4M9cyEui7VbDuHmwwKgzBPM9
 e0qtzyQfVuldz2WNLzh7KPIXUhgoQyYfQr93sMEyRlZeJPbSUQngqKNUU/8v+0d+TpK2
 KVf5ZxZzHfKFgT5Z+rOKtFA7MAvO+c7brG5bpqC4Hqv6JTa5PnxJ4egdrEbsoqSKXqAL
 0ziJv/ZhWwdsEJlhC3nZ1YqOCW7P2dgNN1R0iGxJ645VF2sEJLLyhE3FpJXY8J4bH2JT
 h3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NvORuV7skKhdxfsWvNOps9GtT+VFGohWSjUuO0cZcHI=;
 b=cZsrMErUZQlSg86HbQDWvm0S6sRIVepnsJLok2Rp01a/I4ryB0chPgp5293AlCVhNP
 xfRx9JVtR3W1yqSCV06kQ8aajc6BaJrDS+s1apjmmM5v+7l1vD3/dK6UAktbTWfZ2X6u
 E4LuMgsUcbkFk70Uy6zMK80t8AcSDMmyI4FFlG0xXqJGRQVzHCaSAwoR+eYun0o6gnNN
 1mdaw0Lp4x4VS700ouFLEDCl+ImRTdaD3qYqXR2yxpFj/NO3wrNXSQIJx+OeGh8dUKYp
 /Y2I76OnTEMESlrM5XcGeo5luwbm8CpGXAujUsCS1T7kuRC8VVf4Fkvjp5vCLFILUQkm
 H8tw==
X-Gm-Message-State: AOAM533HBGQ1lcpCNaxiaKpelnxr5fr/X1s6kBORT4UgK7FcplhjNBeX
 hr9fTChF6Eukah1ltzxCPIbuXcddn02qtQVT6gLO3A==
X-Google-Smtp-Source: ABdhPJypNPw97GfpzsLSvMjettq8SdTAFfp3yeOW9Zt6v8Hl11llbVaDJd1jKnOiQt6whUQDIoGOr02xvHMTy0UBSRw=
X-Received: by 2002:a25:8804:: with SMTP id c4mr783707ybl.469.1623356793410;
 Thu, 10 Jun 2021 13:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <CAPaKu7Ssizz2_A8cy12G544_uCGxWuMw8v54vSusF77SwD_yiw@mail.gmail.com>
In-Reply-To: <CAPaKu7Ssizz2_A8cy12G544_uCGxWuMw8v54vSusF77SwD_yiw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 10 Jun 2021 15:26:21 -0500
Message-ID: <CAOFGe94ObDCHSo1MybrLbhoXmYvDqUMUC_jOMnnDo-J=YUAVXA@mail.gmail.com>
Subject: Re: [PATCH 0/7] dma-buf: Add an API for exporting sync files (v11)
To: Chia-I Wu <olvaffe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, mesa-dev <mesa-dev@lists.freedesktop.org>,
 Intel GFX <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 3:11 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Tue, May 25, 2021 at 2:18 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
> > Modern userspace APIs like Vulkan are built on an explicit
> > synchronization model.  This doesn't always play nicely with the
> > implicit synchronization used in the kernel and assumed by X11 and
> > Wayland.  The client -> compositor half of the synchronization isn't too
> > bad, at least on intel, because we can control whether or not i915
> > synchronizes on the buffer and whether or not it's considered written.
> We might have an important use case for this half, for virtio-gpu and Chrome OS.
>
> When the guest compositor acts as a proxy to connect guest apps to the
> host compositor, implicit fencing requires the guest compositor to do
> a wait before forwarding the buffer to the host compositor.  With this
> patch, the guest compositor can extract the dma-fence from the buffer,
> and if the fence is a virtio-gpu fence, forward both the fence and the
> buffer to the host compositor.  It will allow us to convert a
> guest-side wait into a host-side wait.

Yeah, I think the first half solves a lot of problems.  I'm rebasing
it now and will send a v12 series shortly.  I don't think there's a
lot standing between the first few patches and merging.  I've got IGT
tests and I'm pretty sure the code is good.  The last review cycle got
distracted with some renaming fun.

--Jason
