Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4D782B16
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC7810E0C1;
	Mon, 21 Aug 2023 14:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A5910E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:02:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C46436159C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DE0C433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 14:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692626530;
 bh=FgkHaXC4Wapg7xzyfBVPWo9hIOqxVC+RqZlONq6oBEY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NFQL9q18/j6VTmXHgIawGjMOI1j27ZlzBgXdXeEpt3dS0QzGgtFqGQZdpUvkouyw8
 f9eL41LQCj1GeWM80OHfdxWoK9DVdpsNRaih6jO+ialAi0sCLcgOpzr/Uf/OteqeNI
 nQQA5PM/8yJxGGDH1kM+VQ6qUrjCuyra2lJdBrYGjdhHe0oXY2gyWarVR5hFmdLbas
 VSuzCqTMMdRDcA2pkT0POgbJXBqGclUr4xiKqxFunHbJ8VpRqRGcQWElrH2v4Zac5G
 FUD5IhnDkG5JTKjkndFXyMuCLv8JdkPwa6wMBTfZE8g4QZIV+x01vpUFQF0cQqbnO/
 uzNGjZv1dyidg==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2bcb50e194dso24247371fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 07:02:10 -0700 (PDT)
X-Gm-Message-State: AOJu0YwDxCin8p96Dm89dljVZWq0mB6IDRfLKg8KDMbDDpreLKaX48+5
 qxNX799TToVmwGO6gZjwjjbM8vOXWaSnJb0QuQ==
X-Google-Smtp-Source: AGHT+IERshdXG1O8VtXfjE9QC29CTwTrfF4ZJfDWtLbrhes6CadorBZ80XMVPrRy6ZDZOE8VUdgfnjdEg9PsZglKbsU=
X-Received: by 2002:a2e:a0c7:0:b0:2b1:a89a:5f2b with SMTP id
 f7-20020a2ea0c7000000b002b1a89a5f2bmr4849426ljm.2.1692626528132; Mon, 21 Aug
 2023 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <CAL_JsqJgymu8r0ApXmYkwL2dk5o5KyZ8iG14t7th_heJY5uP+w@mail.gmail.com>
 <20230810174438.2dba9b04@collabora.com>
In-Reply-To: <20230810174438.2dba9b04@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Aug 2023 09:01:56 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLAkVwBkeexpU9MjdjmM6Z05gEGy9m2q91Y14OSjmGGqQ@mail.gmail.com>
Message-ID: <CAL_JsqLAkVwBkeexpU9MjdjmM6Z05gEGy9m2q91Y14OSjmGGqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm: Add a driver for FW-based Mali GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 10:44=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hello Rob,
>
> On Wed, 9 Aug 2023 14:22:59 -0600
> Rob Herring <robh@kernel.org> wrote:
>
> > On Wed, Aug 9, 2023 at 10:53=E2=80=AFAM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > I tried to Cc anyone that was involved in any development of the code
> > > I picked from panfrost, so they can acknowledge the GPL2 -> MIT+GPL2
> > > change. If I missed someone, please let me know.
> >
> > Panfrost was largely based on etnaviv, vc4, v3d, and msm. Those are
> > all GPL2 (or 2+) only.
>
> Uh, I must have missed some copyright headers then. Note that not all
> panfrost files were taken as a base for panthor:
>
> - Makefile/Kconfig. I honestly hope there's nothing copyright-able in
>   there, given there's no other way to define your driver and
>   compilation rules.
> - panthor_device.{c,h} copied from panfrost_device.{c,h} with quite a
>   few modifications in the process. This one has your copyright, and
>   Marty's one.
> - a tiny part of panthor_drv.c was copied from panfrost_drv.c, but let's
>   be honest, the part that was copied (ioctl wrappers, mostly), can't
>   really be done differently. This one has your copyright, Marty's one,
>   and Collabora's one.
> - panthor_regs.h copied from panfrost_regs.h. This one has your
>   copyright, Marty's one and Arm's one (definitions extracted from
>   kbase). But again, I'm not even sure register definitions are
>   copyright-able, given there's no other way to define them. If that
>   makes a difference, I changed the prefix, and dropped definition that
>   do not exist on CSF HW.
> - panthor_gpu.{c,h} copied from panfrost_gpu.{c,h}. These files have
>   your copyright, Marty's one, and Collabora's one.
> - panthor_{gem,mmu}.{c,h} copied from panfrost_{gem,mmu}.{c,h}. Those
>   ones have your copyright only.
> - panthor_devfreq.{c,h} copied from panfrost_devfreq.{c,h}. Collabora's
>   copyright only.
> - panthor_{heap,fw,sched}.{c,h}. Those are brand new files, that were
>   written from scratch.
>
> I also git-blamed the lines I copies to Cc any contributors to the
> above files. I might have omitted someone, but I did my best to
> try and spot people that have a word in this decision.
>
> > How is relicensing that code okay?
>
> Sorry, the copyright headers of the files I copied didn't mention that
> :-/. If that's an omission, it would be good to have the headers updated
> to reflect the actual chain of copyrights.

Yes, we probably should make it more explicit though at this point it
would be fairly vague in terms of the exact sources. IMO, it should be
assumed by default any driver is derived work. No one writes a new
driver from scratch (unless they are really actively trying to avoid
being derivative work). Then the question is what driver(s) were the
source. I think it is safe to say no one copies the big 3 (Intel, AMD,
NVIDIA) nor para-virt drivers as those are the MIT licensed ones. The
ones left are pretty much *all* GPL.

> > Also,
> > panfrost depends on drm_gem_shmem_helper.c (at least) which is GPL2.
> > Does that get re-implemented in a MIT licensed environment?
>
> Not only drm_gem_shmem, but drm_gpuva_mgr and drm_sched too. And yes,
> any helper function/lib that's not GPL+MIT will have to be
> re-implemented or replaced by something else.
>
> >
> > Maybe some drivers are enough of a silo to get away with MIT
> > licensing, but I wouldn't be comfortable claiming it.
>
> Well, yes, re-using the code as-is is almost impossible, unless
> someone rewrites the various GPL components we depend on. But if
> someone wants to pick, say, the scheduling logic, and replace drm_sched
> by something else, they can. Not saying it's worth it, just saying it's
> possible.

Sure, it is possible. Seems like reimplementing all that would be more
work than the driver. Maybe the BSDs already have?

Rob
