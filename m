Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB423C93E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 11:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2D489FC9;
	Wed,  5 Aug 2020 09:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E478489FC9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 09:35:06 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l84so26460321oig.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XRvAB/ps1B65nhH6QU622+QN6T8+IT77meTb1Eq0VYk=;
 b=VcqJJVZKpNJHfogUdt1XhvMZGhSAijgZjTvarKC98oo/TEz+IfGQCNNQLY4NZJvWg+
 YO5OkPAalrPO/E0TjD82WlYTJYhoXu4edZtnR/71b6Xm6H6Gurjg0ftdLWdwdrBfT3dJ
 2OE8Fw2DR+SgSdOFcUTUfQuSP1Eu/kQkq9pOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XRvAB/ps1B65nhH6QU622+QN6T8+IT77meTb1Eq0VYk=;
 b=DYCq8tRpsz/jcJTKK5EEySUqoPKLDFQSc2vMvBuTteV5hTgZWAYjwsr6kbCcerj81Y
 dRNMCD2HQqLKqd67jfvaYyz2lrOuAkb1FsApQVYeqz+0qzHPjYsyRx/Yh05Bz+4p86Cm
 Oze20V6vBQtxHLHQYKBq4JxupL34CKYBqMgoIy0l4uKJnUP6X2VOV1FStPzaGJcIsQMg
 XwmqVdfEdTcu652RaaovCPJKxZaZFb2SJ7gruh/TluxsM978I2tB8CC9rfMKqeGUMoVF
 eDG9cLUK3mIWFQpqSm5sfIs/rbYCDl28J2KG6MhVGyfdDQy8FGF0mCqy6m0s//ckbNr0
 89Hw==
X-Gm-Message-State: AOAM531S+Q0m4nvLHEu2lZ36IOZnkRVf0sa0l/ysaYTshmgj/DINpWo0
 UTmnyxme4L3qcA3oJpXhoz6j69s/jHyB5TLqMPLHXA==
X-Google-Smtp-Source: ABdhPJxgLrWkcPL+GQGMJiS4Jq2BVeB41cKVKOgKePDneKPEtXAIVTmwUZuFhJZmRqSOEEfVHDofej5XX0lfnH8azzQ=
X-Received: by 2002:aca:ab87:: with SMTP id u129mr1994406oie.128.1596620105894; 
 Wed, 05 Aug 2020 02:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200805105137.2b272efc@coco.lan>
In-Reply-To: <20200805105137.2b272efc@coco.lan>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Aug 2020 11:34:54 +0200
Message-ID: <CAKMK7uFdp_3gm-2DNko4AYa-EOgt5MTwuQLSXbo=xn-9oXayVg@mail.gmail.com>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 10:51 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi,
>
> I've been working to get upstream support for the DRM driver on HiKey 970.
>
> While the patches are not ready yet for upstream merge, I'm placing
> what I've sone so far on this repository:
>
>         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1
>
> The drivers there are a port from the Linaro's HiKey official Kernel:
>
>         https://github.com/96boards-hikey/linux
>
> The patches there preserve the old history. The porting patches
> are applied after the original patches imported from that tree.
>
> Besides the DRM driver, this repository contains:
>
> - a PMIC/regulator driver;
> - an iommu driver (still requiring some changes at DT properties);
> - A DMA driver;
> - a small ugly hack reverting some PM changes at the WiFi driver,
>   causing a regression on this board for HiKey 970.
>
> My current plans are to start upstreaming those needed drivers.
>
> The KMS/DRM driver there still need some changes. I guess it is
> not ready for being upstreamed yet. Also, it depends on the
> other drivers to work.
>
> In particular, its support for DPMS is broken: if the monitor is
> suspended, it won't return back to the right frequency settings.

Hm this is somewhat surprising, at least with atomic, since DPMS as a
separate thing doesn't exist anymore - it's the same path as any other
modeset. With the suspend/resume helpers even the same as after
resume. But of course in reality there's always potential for some
differences between boot-up state and what your atomic_disable leaves
behind to creep in.

Just figured I drop this in quickly, always great to have more hw
drivers showing up!

Cheers, Daniel

> Feel free to test it and send me patches fixing things there :-)
>
> Thanks,
> Mauro
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
