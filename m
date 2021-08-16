Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59B3ECDC7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 06:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0672F899A3;
	Mon, 16 Aug 2021 04:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91E4899A3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 04:51:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g138so10740214wmg.4
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Aug 2021 21:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RphnUBEt34MSuCSux5WFwvzGFfUud9Ts11mkIoUQlVQ=;
 b=KrPcEyar18EXWuaOYpw289qXqGSPImiRdoY/iZ2s5I3j9ls3O4zM8DMHfQiVg+mN9u
 wm/2jYAb3NErN5Dvm4i/pFv3asZqIDH7FqRuHM2LVBH5AapTCSSiDuT/c2Dx3pc8JnxP
 fGXjBZdJxfOVvrO6plMT3oPpZcIp+lzxosIs0i75n/dpnJQAH38SHf+JIn5uzYGP0Yf8
 O//gfVQ6/PnG3IzxleRuKRrP4IEoA984GVHwWeVrg4QA16ADgdrPiL36xpsPu6rbtWXa
 dGcnGSBiVErRWwTvphT6DSmU8dms7LfxYPUAneEQH4+1FIid7Tds2vDqoSKrxbrvjm8A
 RJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RphnUBEt34MSuCSux5WFwvzGFfUud9Ts11mkIoUQlVQ=;
 b=DNZY/XItARb2fTGqn9KnjYm7lwPi2eaww33WvyTd32B1TqCKXi88ZH322qwmmHRmpS
 Q7yWQE3/fE9+jAievKbycZi1/VeUf8KWqw5e6qBD/rIbsVf27bif/Si5Y22F3bfVB3Bf
 50XSEsXaIOG5LAD8gb20LZcNFy8csUMe+tbrgxhwfpTOklX0qXteVjcZgJY/BuYVvm9x
 C6KbTiFynjox4o3Xwr3qXOXIsbIX+j/is3cBCjSotarxt83K+fgiEjQPzoLIO3GlmAbM
 q5iOVf2WkFQKnjIrzVrAoMCwPGi8jndQ7VrNO3vtpca6vVSiTJqJC8YCGsE6gryXfMXU
 Salw==
X-Gm-Message-State: AOAM533z/axZE8qoEU3fRIwbExDDikm6ecWMxPqD9hY4Gl/S8kplDT9R
 FeQRfwCmQUf+rDezo7Y5ot6JEnSOjjt28czapAo=
X-Google-Smtp-Source: ABdhPJzHPMTOMtvmT9r5tLjNFJ28kdUeCIuR1ed0GTWe38RPKwEfCC8sQV1n49uqy6rdJTnuyXnTrA2bPpRTIhrDcLA=
X-Received: by 2002:a1c:804a:: with SMTP id b71mr13228133wmd.141.1629089473890; 
 Sun, 15 Aug 2021 21:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <CALqoU4wAf2EcedVJ+favUQv+3Pfj-3_OvONGY=ae3a6zrk2_OA@mail.gmail.com>
 <20210816044556.iqkdatwbkdig2pr2@sirius.home.kraxel.org>
In-Reply-To: <20210816044556.iqkdatwbkdig2pr2@sirius.home.kraxel.org>
From: lepton <ytht.net@gmail.com>
Date: Sun, 15 Aug 2021 21:51:02 -0700
Message-ID: <CALqoU4yU3mySw9DQ0V1O=wZ_iWgftSngmZFZZbGN9Y0tYNHq9g@mail.gmail.com>
Subject: Re: Why we didn't use embedded gem object for virtio gpu when making
 ttm bo a gem bo subclass?
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

Thanks for your reply. I was aware of that change, but need a fix for
5.4 kernel as a temp solution for now.
If the reason is just that you will move away from ttm soon,then I
guess a CL like http://crrev.com/c/3092457 should
work for 5.4, just hope I don't miss anything else.

Thanks!

On Sun, Aug 15, 2021 at 9:46 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Aug 13, 2021 at 12:42:51PM -0700, lepton wrote:
> > Hi Gerd,
> >
> > We found a bug in 5.4 kernel and virtgpu_gem_prime_mmap doesn't work
> > because it references vma_node in gem_base object while ttm code
> > initialized vma_node in tbo.base object. I am wondering, in your
> > original serial:
> > https://patchwork.kernel.org/project/dri-devel/cover/20190805124310.3275-1-kraxel@redhat.com/
> > (drm/ttm: make ttm bo a gem bo subclass), why you changed to use
> > embedded gem object for most gpu drivers but skipping virtio gpu? Is
> > there some specific reason?
>
> commit c66df701e783bc666593e6e665f13670760883ee
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Thu Aug 29 12:32:57 2019 +0200
>
>     drm/virtio: switch from ttm to gem shmem helpers
>
> HTH,
>   Gerd
>
