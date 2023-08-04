Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FC76FE4D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FF610E059;
	Fri,  4 Aug 2023 10:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7B310E059
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:19:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe32ec7201so56415e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691144396; x=1691749196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1EpS0BMomvLcLosH0n3oTZl+kwzi/lkliHRMULd3Y+8=;
 b=ZwPvk/yH5kYz92/l5aHMVvCqdbqpFWf8njn7T37ek79AR5hckiZxhaVBHq1KwR/UV+
 ryGMvy1xTvi1BQgiXr/m44lqC4ZWU0uAxOSbZMd1PQBBiT7OYGCQ6zbkqsjo2oDQDr2X
 SG/kMjiq0bB3RQ4XPQueyuG0iv0SRAaX7YZY/31k9N0ar4975LmiwmJo4v4rlESTm2sr
 K+TSBEtBEJzBxT6EI/O7IQQC7aVq+EGb6kujOUHzNaQ6Qk12iJf7H1DN8XOW6WjY3JVg
 WUT08P/yuU15aMYdZZGsLnRrdmY31G71WSRvZ96ZS172KhK8o+5+dhFgBY8xRPUxfQZU
 IWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691144396; x=1691749196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1EpS0BMomvLcLosH0n3oTZl+kwzi/lkliHRMULd3Y+8=;
 b=Br6BwVfKOkZl5jJ7C6ybk1Ie8I2dfJwupF3/WTM333JrE4RV3WOCbXTIX0/JjaC7I9
 dx0XOc4Iij1bvOghOHM+K3Fpxh6S786QazDuf8aKv79lTwNg8eg6y/tSjE8d4HPsi3bI
 55fF5XfWKF2IQJqo+ndOB/78E3C0j6kiD3qkWWX48Lburw+NcvXrD2aZfqF+C1qatH1i
 49sgIEc0e4+SDFO9EYdQuiiU7SnMpSPRoLUlnsHsanvkgMHKUcdIxzFAqVGYZBmDjvu5
 eOOJA63yFYK1OsXTWtrpEnB95bzsEmXIHYheddJ/H0Ii13w8cMAucOrxigvfSFswDBK5
 z5eQ==
X-Gm-Message-State: AOJu0Yxt4flH/cB2v1K1ONsKnPGzhb1+h45S0QRD31hw4tI9X8UcKkJf
 bu1+tpU1W+CzwDuW0QPVn3u75r2CBFocUyFfbwwX4g==
X-Google-Smtp-Source: AGHT+IHTPJOUgMMTx+b5xtE4xcZE+at2fSux7/FeFS2nemnumlru9GyrHv9zIfKBMV3+CSDubQ44Nqyp7zrukV9Y3Ag=
X-Received: by 2002:a05:600c:510e:b0:3f7:e463:a0d6 with SMTP id
 o14-20020a05600c510e00b003f7e463a0d6mr37103wms.0.1691144396424; Fri, 04 Aug
 2023 03:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230803144227.2187749-1-nogikh@google.com>
 <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
 <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
 <CAHCN7xKG=8ygSi8st31fe+t3Mn+k-7VUHKixFCZUuuDLOX8-kQ@mail.gmail.com>
 <d8a57aee-bb8a-dc5a-7c4f-b8a293d37bec@infradead.org>
 <CAHCN7xKnRAmKh60dAtVaxz-dQtjzhBNtS0aN2swmddfo5FAD-Q@mail.gmail.com>
 <b43e642d-8aa1-fb8a-6bff-86039a06d57b@infradead.org>
In-Reply-To: <b43e642d-8aa1-fb8a-6bff-86039a06d57b@infradead.org>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 4 Aug 2023 12:19:44 +0200
Message-ID: <CANp29Y6_VcgQAHERdaXUqBZahfFkJ=ksvjVVeMkZz88Xxjz1jw@mail.gmail.com>
Subject: Re: drivers/gpu/drm/bridge/samsung-dsim.c link error
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, syzkaller@googlegroups.com,
 jagan@amarulasolutions.com, dvyukov@google.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 4:47=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> On 8/3/23 19:42, Adam Ford wrote:
> > On Thu, Aug 3, 2023 at 9:37=E2=80=AFPM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >>
> >> On 8/3/23 19:26, Adam Ford wrote:
> >>> Where/how was the .config generated?
> >>>
> >>
> >> Aleksandr posted a link to the config file above.
> >
> > I get that, but I am not sure how this was generated.
> >
>
> Nor am I. Alexsandr can hopefully tell us.

We take a defconfig and apply a number of modifications on top of it
(*). Some configs are enabled (e.g. various sanitizers), some are
disabled (e.g. a number of heavy subsystems are disabled for instances
that run on qemu w/o hardware acceleration).

We rely heavily on olddefconfig to detect inconsistencies during
config generation (we regenerate them manually once in a while and the
tool makes sure our changes do not contradict KConfigs) and to
automatically correct inconsistencies when a kernel is being
(re-)built (there's no other way -- something constantly changes in
the mainline tree and it's impossible to keep track of it all
manually).

In this particular case, we indeed disabled CONFIG_GENERIC_PHY, but
left other dependent configs enabled and `make olddefconfig` could
unfortunately neither help us detect the problem nor resolve it during
the build :(

(*) FWIW here's a doc for reference:
https://github.com/google/syzkaller/blob/master/dashboard/config/linux/READ=
ME.md

>
> >>
> >>> Are you building linux-next or something else?  The .config file
> >>> generated when I build the arm64 defconfig  show both enabled:
> >>
> >> linux-next.
> >>
> >>
> >>> $ grep GENERIC_PHY .config
> >>> CONFIG_GENERIC_PHY=3Dy
> >>> CONFIG_GENERIC_PHY_MIPI_DPHY=3Dy
> >>>
> >>
> >> Yes, this is not a defconfig file.
> >
> > I know, but it is a .config file that is generated from make defconfig
> > ARCH=3Darm64
> >>
>
> Not necessarily. It could be generated by 'make randconfig'.
>
> >>>
> >>>> but yes, selecting GENERIC_PHY (needed in 3 places) does fix the war=
nings
> >>>> and build error.  2 instance in drm/bridge/Kconfig and one in
> >>>> drm/bridge/cadence/Kconfig (found by inspection).
> >>>>
> >>>> I had no problem replicating the kconfig warnings and build error.
> >>>
> >>> If you can replicate the problem, I'd suggest submitting a patch.
> >>
> >> Sure, I'll do that.
> >
> > Great!  thanks.

I see the patch has already been sent. Thank you very much!

> >
> > adam
> >>
> >> --
> >> ~Randy
>
> --
> ~Randy
