Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F430D72A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 11:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9436EA47;
	Wed,  3 Feb 2021 10:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6888A6EA47
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 10:15:21 +0000 (UTC)
Date: Wed, 03 Feb 2021 10:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612347318;
 bh=OcypwBC0JNKDbx1oN2N6fH8WJTtH+nQt0jXTr3U1tYg=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=UNEJjfm585zn+fUgtLB6O6sgaPNDT2u2V0Avj9SyPDhZ7mFUpL2Dpl/JOOqJiAurX
 +fSdW5ccKy0JWpuklyf/UOJW4y9o/5bHZcvA7dRT40fGTbaa1yfpL6oafMQexuJ1I+
 pkDT4Rue3pcBWI87Mb2dtGVaYnC+zdWqrThuQMaFORgRKSUOmhU08qNBH9eOYZHkbV
 XwcZfafdWo5HDP6zgfsw0Z8ZsqstULXAKSRxFjFjgQ8lWW+8TS0hrrGt6Il78uDyjW
 0vg/Oc8UKgs+xMDuxuMxQZFuruPeIITHPrz438/Y0lNS6UG2JHcV227TV6Bxz7UKdn
 Lx2I1w9ncaY5w==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Message-ID: <_L67Dl3bTZirFqSulhWUeN215npWnjsPyUzg7Rb-2iffHxMbZ1-H6ex7R14gdkDqZfpRw9xLoiol8m5WtPKuJxiBN_FcnailoQHvW02qNI0=@emersion.fr>
In-Reply-To: <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
 <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
 <CACvgo53wJ2XrLRBy4ysOBfU5TFo7nBwDS_CyrPkB1rotJXW5Nw@mail.gmail.com>
 <KZZVYm0Qza351oOJ53ZX0pUcEa6NRh2sJJiq5OR2IjRlmJsdCZXRusR3ZuiiL5dqUgpR_STva8ySdYIJAUnSHVkU5HnNLzC68pNSEcuYdcA=@emersion.fr>
 <1eXnpBNSePW1qsq6q5BR3IEa6Q4DGeWBmJ23QArM9eGt12sN9W2Mhpk2OkUwZj-fhRjAtf9XNne5vxJ-7_JjPl549Ml3wxwMo0hhKsojL_4=@emersion.fr>
 <CACvgo53_f83NFhCkzDx5ydE+H0KdEYKx6Mgdk+-z1hZE8piM7Q@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, February 3rd, 2021 at 11:08 AM, Emil Velikov <emil.l.velikov@gmail.com> wrote:

> On Wed, 3 Feb 2021 at 09:27, Simon Ser <contact@emersion.fr> wrote:
> >
> > On Wednesday, February 3rd, 2021 at 1:56 AM, Emil Velikov emil.l.velikov@gmail.com wrote:
> >
> > > As summed in the commit message the burden is only applicable when all
> > > of the following are set:
> > >  - non-linux
> > >  - force DRM_FOURCC_STANDALONE
> > >  - c99 -pedantic
> >
> > Oh, and FWIW, this is not a theoretical situation at all. All of these
> > conditions happen to be true on my compositor. It has FreeBSD CI,
> > -Werror, and will use DRM_FOURCC_STANDALONE when available.
>
> There are ways to disable [1] or silence [2] this - are you
> intentionally ignoring them?

We have a policy against pragma. However we already use -std=c11, so in fact
wouldn't be affected by this change.

> Or the goal here is to 'fix' the kernel for a very uncommon non-linux use-case?

If the kernel doesn't care about non-Linux, why is there an #ifdef __linux__
in the first place?

> [1] pragma GCC diagnostic warning "-Wpedantic"
> [2] pragma GCC diagnostic ignored or -std=c11
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
