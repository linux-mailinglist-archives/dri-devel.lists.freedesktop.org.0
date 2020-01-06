Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326D130B7E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 02:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91489B4D;
	Mon,  6 Jan 2020 01:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9689B4D;
 Mon,  6 Jan 2020 01:30:51 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id g7so12081950vkl.12;
 Sun, 05 Jan 2020 17:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ijoE6e4s38wqjodm/VFMAPDPo/h7Nctkq2zte82cWkU=;
 b=fzFINUeqysKrynxMaTqrPL/i6sTEQfofJLEp89X3Bror9mIKXa81bNWQW/AelXrNRc
 DigVVkqklQRewGS7Z+Imx56Psz8+tigAsgaTsHeqimj2104FC62DcwoYPNTgwuQEzyhf
 5K7xdo7qjVXaGqXr6tqAG8Ktxw1OQ/JD4gatJsqGhp+Yurzb1khwkb9DdYoomdx4jAnW
 DmAR2HX2vX7ZvqNfDXzBBOAL0FjRHWKT4SjgZvFxmb5Z+ZllKwUsxIvyG+D8VAJho+FS
 0V+X9GVdtZFckGy60CD2b+SQe1YANfbfPIJpBTQmtNEL+JXqVd8dAu63RYaA6V7XTx5k
 dmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ijoE6e4s38wqjodm/VFMAPDPo/h7Nctkq2zte82cWkU=;
 b=SSX14Q2hvVmY1poBa3LMotNfv4zq9Sjli5uFhCvjWx2rYE7gPrDrFboc+rTh/FUMoO
 fHaorxqkw4CpwrEqnEia9qWsJSvcsb8+0+NqP8cLCZHX6v7himKeEYiw/qLrYx2ZKjzt
 DO7ujQsKM3VeDQaeCoLNI8aRdQ3jsDlzsdnattETf357Nlnjznj9Hm3ls4PhX7124Czf
 J14VdhVi4nasIqSSewgNV8PHnc7P0DyfhY8exZt9wq+6KOOzbZidscpEbN4u0sXSMcb1
 ht7V7hCLThMa0Us43r2NzKSLvlcQefoxHDVoidBTw54ua9FlLOmpWeMmCgQALfZKgcGq
 KO+Q==
X-Gm-Message-State: APjAAAWZC2I5JSVA3v7fIHkstzLj8eKBtuiJDfCQmoBBs1d2+9sTavZH
 JtoMOhwr8JFmSR1QNZRITyPKLaJsGDqbKCIVqSU=
X-Google-Smtp-Source: APXvYqypiKFrLjZN2vFWvRskFXPZ3v9dkUc9capjzXdZBcTlxd17A34TXUGuw2mAZBCmaRFsWn2M9eY4PFs4R5GcY5k=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr55923667vkc.12.1578274250848; 
 Sun, 05 Jan 2020 17:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20191217004520.2404-1-jajones@nvidia.com>
In-Reply-To: <20191217004520.2404-1-jajones@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 11:30:40 +1000
Message-ID: <CACAvsv6AKt=10JgjaEKc=pkmKfGJoUJjq_Unn0yGTuQK85Es2g@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2 0/3] drm/nouveau: Support NVIDIA format
 modifiers
To: James Jones <jajones@nvidia.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 at 10:44, James Jones <jajones@nvidia.com> wrote:
>
> This series modifies the NV5x+ nouveau display backends to advertise
> appropriate format modifiers on their display planes in atomic mode
> setting blobs.
>
> Corresponding modifications to Mesa/userspace are available here:
>
> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
>
> But those need a bit of cleanup before they're ready to submit.
>
> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
> using various formats and all the exposed format modifiers, plus some
> negative testing with invalid ones.
>
> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
> Linear DRM format mod" patch submitted to dri-devel.
>
> v2: Used Tesla family instead of NV50 chipset compare to avoid treating
>     oddly numbered NV4x-class chipsets as NV50+ GPUs.  Other instances
>     of compares with chipset number in the series were audited, deemed
>     safe, and left as-is for consistency with existing code.
Hey James,

These look OK to me, with the minor issue I mentioned on one of the
patches dealt with.  I'll hold off merging anything until I get the
go-ahead that the modifier definitions are definitely set in stone /
userspace is ready for inclusion.

Thanks,
Ben.

>
> James Jones (3):
>   drm/nouveau: Add format mod prop to base/ovly/nvdisp
>   drm/nouveau: Check framebuffer size against bo
>   drm/nouveau: Support NVIDIA format modifiers
>
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c |   7 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  59 ++++++++
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     |   4 +
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  35 ++++-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  17 +++
>  drivers/gpu/drm/nouveau/nouveau_display.c   | 154 ++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_display.h   |   4 +
>  7 files changed, 272 insertions(+), 8 deletions(-)
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
