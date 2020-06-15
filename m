Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DA1FA038
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 21:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791E26E4E3;
	Mon, 15 Jun 2020 19:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079186E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 19:28:47 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id o2so10052351vsr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QOJ0mUuvXJg51WujICWBnnB1jeXcsIKvXD4gMm0th9k=;
 b=aiD8RHg6PESYVh4o2BlRcryqHImBMZp9g1Eg6OEBW21Ag79wpQgCCPSvsyXkLBEfts
 STbERe70wjzyc27HelAUh5nRiA/CKFj2oMVy+xdetqi4ObED6O74wE2D1fSkrEalr+Z1
 uJBPRmjod8HpByW8QRM02oYDTjkdsGEOFvyrTH4Eg5TRmvbOe5eoAYm7YMnrGyVmkz8a
 dYm3XXXhj478Rn3USJwraXSV/zY967jxfl/9U4D7ChgqTqrc/FU9ZHjRjnJsrBdjb7Lc
 YsYXUyP+XligLaCNMQE81gaBe7/MdyJ8/X3R8dbTvyJksNgMFt3rG2JHJJBbRrhEP03B
 +arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QOJ0mUuvXJg51WujICWBnnB1jeXcsIKvXD4gMm0th9k=;
 b=r1ibEjndCXXceaks7Nj8rfw+GeIVdAEmerc5Kw4Vr6JRFu7wDtdQxPKdQB8zQbB3gW
 ECTJ4uKEBPaj3VGqSqbpDtblxe+lw62n3p/zSDOfFKHAUf8Pa7RieCjUXANDRjM1jksZ
 4nyA2ZCNcFhZONFpzfo6Dgvq+g4y9oj4NP86rvtDA2awOXikbNESJxSJ4WZe2N420i9q
 KdqCNg5KS3i76WWow7dwaTghmCmUuTxzqAHcyMwrXMkBbzETk6NyHuuZHEiW+FhGzx+l
 X+srSCS8ZpBYMJ0mUDJlL3XamYb+VL4V4f0B8CxF4niZDRNkhnyCcY0VlqeYkjTL8f1p
 5fhQ==
X-Gm-Message-State: AOAM532OxG5ZMrWxorstYycHnkgEssWDbaSirKDN4hCMbuaHJzd/ZFXA
 kn/auh7GrrX6Zu4bupOQimbbvUoylSXWGzAjVhk9bQ33
X-Google-Smtp-Source: ABdhPJz//mlq8fjWmdkr2gLL3jGCIKSJQKdUfhesOTxM7ooYEdMyl3pCMNkVSklAtf0kUBvzyWusM8MxtGKzJMXsBZk=
X-Received: by 2002:a67:3291:: with SMTP id y139mr20875177vsy.37.1592249327208; 
 Mon, 15 Jun 2020 12:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200517193655.3895087-1-emil.l.velikov@gmail.com>
 <20200518111043.GR159988@e110455-lin.cambridge.arm.com>
 <CACvgo50zr5WzgwE33Fa=BRc+AuBzg+OjxBTEMaQ5qt1SpW-D_Q@mail.gmail.com>
 <20200601174236.GP159988@e110455-lin.cambridge.arm.com>
In-Reply-To: <20200601174236.GP159988@e110455-lin.cambridge.arm.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 15 Jun 2020 20:25:06 +0100
Message-ID: <CACvgo52Dmt2NM1ww9KT0N3Z1jAzV2fyJS35H9Tj4Rf34Cc-YvA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/arm: Kconfig annotate drivers as COMPILE_TEST
To: Liviu Dudau <liviu.dudau@arm.com>
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
Cc: Mali DP Maintainers <malidp@foss.arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Jun 2020 at 18:42, Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> Hi Emil,
>
> On Wed, May 20, 2020 at 12:54:17AM +0100, Emil Velikov wrote:
> > On Mon, 18 May 2020 at 12:10, Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >
> > > On Sun, May 17, 2020 at 08:36:53PM +0100, Emil Velikov wrote:
> > > > Add the COMPILE_TEST conditional, so that people can at least build test
> > > > the drivers.
> > > >
> > > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > >
> > > Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> > >
> > > > Cc: Brian Starkey <brian.starkey@arm.com>
> > > > Cc: Mali DP Maintainers <malidp@foss.arm.com>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > > > ---
> > > > Please merge through the ARM tree.
> > >
> > > We're not using the ARM tree anymore, we push patches through drm-misc.
> > >
> > > I'm happy if you want to push the whole series or I can do the 2 patches
> > > that I've been Cc-ed on.
> > >
> > The third patch should be taken care of. So 1/3 + 2/3 need taking care of.
> > Please do a quick runtime test for 2/3. As you can see I've only compiled it.
>
> For 1/3 + 2/3:
>
> Tested-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>
Thank you Liviu. Added the tags and pushed to drm-misc.

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
