Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D177CAD12
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4D10E217;
	Mon, 16 Oct 2023 15:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E6210E21A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 15:13:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e16f076b3so8458072a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf.com; s=google; t=1697469208; x=1698074008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eR5ud+X4G99kqXhYup2CajHlyncDkkFQVZGmFycYE4=;
 b=goV4gtpsz1/wfH8exkpkj3OoGxB3FgYPILxmdwSf196QNdXjFMRXeoarWw50EobMpM
 LMuK/hCsHtmHZ2FLkoYX2DtSBi7Px5RCe5Qj7VbFanYZQphiHX4gttCkl8sXuHzAgFQd
 34oVIFb5lKDRu85zKXlJ25/kwc+52lPl1y2uyT6Jb8Q2QJ+wn3Na1LG4pBbkf3YHHGYO
 lRUttMtYXZaGTc0Doax29d1BucF+EKB0WjWHJtJMx3mL2YjGFbwEAaBd4Z4YVpW/hlke
 oBpOaH0nxTFzdBNBB1wgsgdXRMrtCRs66omedijl0IQpCr/+0hKeFjTgXeGKjto5Vecp
 P17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697469208; x=1698074008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eR5ud+X4G99kqXhYup2CajHlyncDkkFQVZGmFycYE4=;
 b=Te7dcG/jtEQld12RMxf2G9lmOUexhhoWCo7/oeA8uhkNp5eMd6d7OVQD1p4nJ7yfnF
 Y6jMRfIW5vghCcgQKWaUj+UShDo+hv5k1ySccNMp4TD0sYuoz68OyhO7mQSfsoYPpFMp
 mvj6fim482l+J5YXIH/X1tqcf+/NaWuP82GuY5qyQmTrjmiLsqx0vemY4Rm8MNc2kTCH
 1w+K+Kms84xRbZBjkbvaccuhYN5V1PfeCgHPxo02w9x/Jg7l0PxjmlGJZFKO48arM6XC
 S58FtYCkElE+EMfRJh12d85LBOg6pWetolLm+kRQ9eloXp5ZS/PE+ZViRh0HMfgkuHCg
 8ymw==
X-Gm-Message-State: AOJu0Yy/yLTKwN5iZCZzP0qxyotQf38KYkGUjbCSIayqVDQGUkANPbMm
 hsQ9hd/jUr1BHO59BPLsQ3YHCzSaah8yJVzZcrlA
X-Google-Smtp-Source: AGHT+IFg3/KAz6Mip/C3DXnI335HIk46uxk8vrysOfN9E7iyF67oOzOnHex+ShwEAuJmJYfekwilB0L9GS9E/6rpGz0=
X-Received: by 2002:a05:6402:354c:b0:53d:b59c:8f8d with SMTP id
 f12-20020a056402354c00b0053db59c8f8dmr7999575edd.8.1697469208569; Mon, 16 Oct
 2023 08:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8ByeJBrPEQSgUc91LQO9Krzjh2pauhMTjEC82M8ozayE76Yg@mail.gmail.com>
 <CAJfuBxxmL-GtBgt=033F9UNeLCreFbJh3HrQQN2nYKwR_0uTbg@mail.gmail.com>
 <20231003155810.6df9de16@gandalf.local.home>
 <CAJfuBxyJyFbFEhRxrtxJ_RazaTODV6Gg64b1aiNEzt6_iE4=Og@mail.gmail.com>
 <CAK8ByeLNc9UbTNG4x=40AxYqjjRCsvBNtNFai0PMveM2X4XCow@mail.gmail.com>
 <CAJfuBxyRF4q_T8LmHwR=-PKKDDpiFg2nO03uLnL8aGpRyBByKw@mail.gmail.com>
 <CAK8ByeLpkSV6o6gPw8eJVqq5+ynQrSDjemY7mXkO1ZmA0rYKfQ@mail.gmail.com>
 <CAJfuBxw+ANLwssAGWpkn5PeJb8ZKn4LXQkk2Gfv3aGsSN=S55Q@mail.gmail.com>
 <CAJfuBxy9qn-4i3SteTL1LBbBxPrFM52KkBd=1UhcKV3S_KdQvw@mail.gmail.com>
 <20231011114816.19d79f43@eldfell> <ZSZuACLwt5_XAL2n@phenom.ffwll.local>
 <CAJfuBxytOcUDmPBO7uQ9mMRvpNvzA3tgg_-pSGmdXpjDPe5sNQ@mail.gmail.com>
In-Reply-To: <CAJfuBxytOcUDmPBO7uQ9mMRvpNvzA3tgg_-pSGmdXpjDPe5sNQ@mail.gmail.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date: Mon, 16 Oct 2023 17:13:16 +0200
Message-ID: <CAK8Bye+v+fYsN-716vQKJCoTmDQWmTw_Z1ZGD2A=HvuuAApwig@mail.gmail.com>
Subject: Re: [PATCH v1] dynamic_debug: add support for logs destination
To: jim.cromie@gmail.com
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
Cc: linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

czw., 12 pa=C5=BA 2023 o 20:48 <jim.cromie@gmail.com> napisa=C5=82(a):
>
> > If you want the kernel to keep separate flight recorders I guess we cou=
ld
> > add that, but I don't think it currently exists for the dyndbg stuff at
> > least. Maybe a flight recorder v2 feature, once the basics are in.
> >
>
> dyndbg has   +p    writes to syslog
> +T  would separately independently write the same to global trace
>
> This would allow  graceful switchover to tracefs,
> without removing logging from dmesg, where most folks
> (and any monitor tools) would expect it.
>
> Lukas (iiuc) wants to steer each site to just 1 destination.
> Or maybe (in addition to +p > syslog) one trace destination,
> either global via events, or a separate tracebuf
>
> Im ambivalent, but thinking the smooth rollover from syslog to trace
> might be worth having to ease migration / weaning off syslog.
>
> And we have a 4 byte hole in struct _ddebug we could just use.

I'm glad you brought that up. This means we can leave class_id field
untouched, have separate +T in flags (for consistency)
and dst_id can be easily 8 bits wide.

Also can you point me to the latest version of writing debug logs to
trace events (+T option).
I would like to base trace instances work on that because both are
closely related.

> Unless the align 8 is optional on 32-bits,

I verified with "gcc -g -m32 ..." that the align(8) is honored on 32 bits.

> I think we're never gonna close the hole anywhere.
>

:)

> is align 8 a generic expression of an architectural simplifying constrain=
t ?
> or a need for 1-7 ptr offsets ?
>
>
>
>
> > > That's my idea of it. It is interesting to see how far the requiremen=
ts
> > > can be reasonably realised.
> >
> > I think aside from the "make it available directly to unpriviledged
> > userspace" everything sounds reasonable and doable.
> >
> > More on the process side of things, I think Jim is very much looking fo=
r
> > acks and tested-by by people who are interested in better drm logging
> > infra. That should help that things are moving in a direction that's
> > actually useful, even when it's not yet entirely complete.
> >
>
> yes, please.  Now posted at
>
> https://lore.kernel.org/lkml/20231012172137.3286566-1-jim.cromie@gmail.co=
m/T/#t
>
> Lukas, I managed to miss your email in the send phase.
> please consider yourself a direct recipient :-)
>
> thanks everyone
>
> > Cheers, Sima
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
