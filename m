Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53334463D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050106E487;
	Mon, 22 Mar 2021 13:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAB06E487
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:53:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so16920157wrc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=22NppRjOAxc2xE/8hJ2VOeEEh08I1RoGlHwTEuT4DVw=;
 b=XW2Y+2lFxsqebG6HnMQQIA7ET/J4WbtMDQaxJH70CTDJSGtF/LUgIY2vsO14Ihl4C7
 44Ml4z0ku6BpEwSap8xYCHmq3svHjMgOptfEmKBfqaqIXqjiVwqw/czYQl2GYsdS88d+
 PgG2cc3arcXiYW/F+8K5bFIwvUiZ6V0i9USQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=22NppRjOAxc2xE/8hJ2VOeEEh08I1RoGlHwTEuT4DVw=;
 b=NatJ35h/coWkMDRAjFYOt5oqQYtPnmEhr1UY+aFlHeT39WCs8nbopeGFfUY8Dtui3h
 e0AsJBtOA9pYHM8Fry054eB+uCXVIlRnUPoCLmdVHTJGU89n3Kxb7+5T081H+C3Y2uvR
 XSy1zO+JBa5kxkUTNiVVGMDyDjjWvUbssC0sg9A8ms87gfs7UbZh5F0dNU/I7KxJty7V
 M45e2k0JiwFKxas1Fvz7A6jHeymitU0DmmbXz2BFTwGEMvnl6wOL25IGpcprKwFORnMH
 alxajrkSWDwujErRLvmDqr/6xB3SLdLCjwNWxaBarBS3BYTdTD4r7dJszOIgP9p3MYQU
 JXLw==
X-Gm-Message-State: AOAM530Kv5VTxKApkl8DxcrER9dFxwq4s5XPO4IVUtZk1+GqnbjwVFxb
 6ySTx/cx+GqYaH1kLyBPrk7GUw==
X-Google-Smtp-Source: ABdhPJzTYzAl0xgzsxNm9bbNr/k/BzpKcJCa+yOJPVhkxN1JV1JaW9XSxdHrvrQejRhrfRlsCiXnpA==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr19129558wrw.247.1616421230627; 
 Mon, 22 Mar 2021 06:53:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l15sm19757266wru.38.2021.03.22.06.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:53:50 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:53:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add Vivante TS modifiers
Message-ID: <YFihbJmqKeU8D6qD@phenom.ffwll.local>
References: <20210319190607.2903545-1-l.stach@pengutronix.de>
 <CAH9NwWdOSiWTNpyzxXHasjcNrhOtK3Su66kaQsGA_kz7AUp53A@mail.gmail.com>
 <CAKMK7uH-X6KzxfrMLgzhhYdoceLgygtKvzZWbFt+ZztY_BCC5A@mail.gmail.com>
 <CAH9NwWeYO_WsYTtsri6E5dRfWYhD0FrUohK99jx_gZHVHJRukA@mail.gmail.com>
 <4f96f825f90836066dd89ab33e0c71e3cb922d91.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f96f825f90836066dd89ab33e0c71e3cb922d91.camel@pengutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 10:20:45AM +0100, Lucas Stach wrote:
> Hi Christian,
> =

> Am Montag, dem 22.03.2021 um 09:54 +0100 schrieb Christian Gmeiner:
> > Am Sa., 20. M=E4rz 2021 um 20:11 Uhr schrieb Daniel Vetter <daniel@ffwl=
l.ch>:
> > > =

> > > On Sat, Mar 20, 2021 at 10:28 AM Christian Gmeiner
> > > <christian.gmeiner@gmail.com> wrote:
> > > > =

> > > > Hi Lucas
> > > > =

> > > > Am Fr., 19. M=E4rz 2021 um 20:06 Uhr schrieb Lucas Stach <l.stach@p=
engutronix.de>:
> > > > > =

> > > > > Vivante TS (tile-status) buffer modifiers. They can be combined w=
ith all of
> > > > > the Vivante color buffer tiling modifiers, so they are kind of a =
modifier
> > > > > modifier. If a TS modifier is present we have a additional plane =
for the
> > > > > TS buffer and the modifier defines the layout of this TS buffer.
> > > > > =

> > > > =

> > > > I am unsure why you want to have the TS modifiers in drm_fourcc.h. =
Can
> > > > you share some insight on this?
> > > =

> > > It's the official registry for drm_fourcc codes and drm modifiers.
> > > Whether the kernel ever uses it or not doesn't matter.
> > =

> > Fair point.. but I do not see any usage of these TS modifiers in mesa
> > - that's why I am asking.
> =

> I have a Mesa series using those modifiers, which I'm currently
> rebasing and will be posted shortly. However, the way things work is:
> first get the modifier into drm_fourcc.h, then merge any code using the
> new modifiers, so I figured it would be fair game to post this patch
> before I fully finished reworking the Mesa series.

Generally post poth sides, and then _merge_ them in the order you
described. Christian has a good point that generally for modifiers that
mesa is expected to use, we want to have the mesa code as demonstration
that they work. Especially for r/e'ed drivers where there's not
authoritative spec.

I was just assuming that this has happened already.
-Daniel

PS: Since this comes up all the time, relevant part of the upstream docs:

"The kernel patch can only be merged after all the above requirements are
met, but it must be merged to either drm-next or drm-misc-next before the
userspace patches land. uAPI always flows from the kernel, doing things
the other way round risks divergence of the uAPI definitions and header
files."

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
