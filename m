Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE17B181726
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 12:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17A26E138;
	Wed, 11 Mar 2020 11:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2796E138
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:56:53 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id y6so603990ual.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghfByCsYV0tzZm0t/1UMs+6s5A158EdC1WFnmWqbcF0=;
 b=cTjhseSldh2081Ayu55XO97w4waM+3jAJjNWUFcf/p2ANOoh0KBw8pk1tGdf1XB/mW
 iWNldHPdLvNEFzQdvPnVPN4eK2IDENpEtS7EWehaO3cr40VFxidePiqIu8FGxShXwI80
 ru+F2a7f3QpYIBhm9wDdO5uN5hFTOKFD7UB/PYjjhUYux7Emc5NW+Uz7uP4p9ycvuIYf
 BeRzDtN0+e0lclC9J2iCoBZ5q3lmp/ZQqUV+z7s5Y/xMCW04XIgkXqfcJSy6YUU6jpWg
 khzs+irR4rIAFNXWXT/WOtEY3DAcZkNIFvLxQv+qcuJC8N3wywd8gieUGVbObFkWzI9Q
 +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghfByCsYV0tzZm0t/1UMs+6s5A158EdC1WFnmWqbcF0=;
 b=OA4wkKz4xRuX9rW5Gdusp8Sw/izE4Aw4h1fh/kAT0pmepLDG3o5ZmP/Cf3J415DeFl
 ls2pRlnBqx7jsYWnqigQ2F4PeCj5E6Aysvg6h9WrEaC8JAe94756y0QzszYsv9Lpub0p
 sPM9O5Tq0Akb5azYXBYIV7On1DAKp58qDDkS5B0wafm0SVwlk5fngK3gyAbIfBnWFKFX
 weB3+rPWfpqurFDBck6kmcIwfPRoK9WbbBwhmSzbV+9WNXxHle9p2msecRAGfU+9Axb9
 lR93qfG7XlKF2y8hiOzJMAV1o98IBuizpYoETRpK7HmqCRzFp2nEQpnwZL0UaF2/nL3A
 5ldw==
X-Gm-Message-State: ANhLgQ3R2Vb0HWzj0amwBBNKATXGYEsWSVqC5c6mjtvXrFQcSh/I1fD2
 AyMOGZxB5W92Notk6k8uBV3otIenG8lrCV7ZxK8=
X-Google-Smtp-Source: ADFU+vsnZXcpZgmhIwbeN+8kMaTxGan0c9rXmQRvNLtj7PpJ4bM8jUbc+4TUM2Ealbamdx/B2FX73sl2hXuN6Y0Vkv8=
X-Received: by 2002:ab0:20ad:: with SMTP id y13mr1533998ual.46.1583927812070; 
 Wed, 11 Mar 2020 04:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
 <20200306160012.42274b9a@eldfell.localdomain>
 <CACvgo51cC08dqpqfsUddu-EuX+5bxVo70V7vDBohEJAZ_h1kKA@mail.gmail.com>
 <20200309103824.7d106671@eldfell.localdomain>
 <CACvgo51TO7ByNWVN880uUZA35zjiwLmHMj3HoXHm6+u--AJ5Zg@mail.gmail.com>
 <CACvgo52-GsY9QXsNcaOH8rNYr7Y+DWAcvDf5gtx4ZpKyW=Lqzg@mail.gmail.com>
In-Reply-To: <CACvgo52-GsY9QXsNcaOH8rNYr7Y+DWAcvDf5gtx4ZpKyW=Lqzg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 11 Mar 2020 11:56:04 +0000
Message-ID: <CACvgo53qtR-n6jJm-um6rcrxHaB4rkm4MnT_M8fYw6pTvqJBSA@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Mar 2020 at 18:36, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Mon, 9 Mar 2020 at 13:13, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> > > OTOH, if applications exist that rely on drop-master failing in this
> > > specific case, making drop-master succeed would break them. That might
> > > include a buggy set-master path that was written, but does not actually
> > > work because it was never tested since drop-master never worked.
> > >
> > > So I do not fully buy this argument yet, but I also cannot name any
> > > explicit examples that would break.
> > >
> > >
> > I've ventured for a while in the X (Xorg + drivers), Weston,
> > sway/wlroots and Mesa's codebase.
> > There were zero instances of such misuse. If other projects come to
> > mind - I'll gladly take a look.
> >
> Just checked a few other projects with git pickaxe* - zero cases of
> mentioned (mis)use. In particular:
>  - qtbase + qtwayland + gtk
> Never used the wrappers or ioctls
>
>  - kwin + plasmashell
> Never used the wrappers or ioctls
>
>  - mutter + gnome-shell
> Briefly used the wrappers. Sane codepath
>
>  - igt-gpu-tools ... just because I had it open
> Sane use both wrappers and ioctls.
>
> Any other projects I should check?
>
Coming back from an interesting venture in efl world:
 - enlightment - correctly usage during 2012-2014, switched to ecore_drm
 - evas (imlib2 successor) correct usage, few months in 2014, switched
to ecore_drm
 - legacy/ecore - never used either
 - ecore - ecore_drm backend, correct usage of drmSet/DropMaster

Given the above, it does seem that the raised concern is more or less
hypothetical.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
