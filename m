Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB0A43E86
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 13:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5BB899C7;
	Tue, 25 Feb 2025 12:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="TiGOCK4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8A310E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 12:00:11 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fc32756139so8486258a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 04:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1740484811; x=1741089611; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gtp/aemzmf2y/GCUqHL+XFvdVkSn1w/XzrGDQyAc+9U=;
 b=TiGOCK4H0xNJwq5uRWcZPTsIX1jVc7JfboToyuL+SKLIehXDp22xKITNIsB1JrzvC9
 9x8ukd1eKb1aJA+BzRNeqSmMlGgJFCppEvAnHgP2cx1ZaFmyMCb/A9NXj9lVVHt7R78Z
 dRFqHEL+IOTlFGl/dQ9KOj999vzJqrlLGwjNsDOjtf0yqahoqFqE3H2j3Yizj8VOrpdr
 nSoO+qAbu0sYAaSn3Ir0JXlbZZk6lqHooSWWRlfScVltLzEiqIGRi6UGXMXGjuOeEIxX
 9ZmdZyQsApmT570FZQRLzQ3V9Q+g/VS8NstxwHuFoacHYR68rXzbxWMm7XBNVZT/6gTK
 2UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740484811; x=1741089611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gtp/aemzmf2y/GCUqHL+XFvdVkSn1w/XzrGDQyAc+9U=;
 b=LyGq86nzZ2dGDQTEo/2TdP6GpIPx9knzA+pN0jXgIBD66M3dgo/jmlPS1nyijYX+z9
 Hv9FkppIFOGAkwFTkZYgUUcoyKt92i9+snVzbhNRkAetYRsRgvcBFtWDnBbW4AfAiY2w
 ieV2q6IzC+sZEZLDwrffSu5ZIwwS/b3fa5wK2fzquDAwUfcPDaOOMP/hQanNvrebdMjN
 q1I21aV1oTTtcyWd5+JiAgfczboDWneriPRJnMl2kTa/1N8vNPTkHoC+Pu0rO4aj1HZk
 brK4gOHROHN6eSHQJScCVvYmUjRhOvAg7yoMFkyldSeOXfrDxW84QAencdkZ/AiMhmkn
 Jk9g==
X-Gm-Message-State: AOJu0YzMdfV0elw2ZTgMe6W+SmzKy72OjGOQRax6FLfJTJ9jhvkdPBeS
 AXIIlya6b9cCdmIFTHeBKp3qmyvTr3x8ZA/9RJBDalvYbbar7kc9AhRYvYFnSz2iEZo5ezRN3qY
 Uqeda7WEH+AV6QQvbt5Xfaz4+02oINmWr3WhUVZbMJ8DC/ZUN
X-Gm-Gg: ASbGncskhff0otCMzMGMM3MujBEUnkzNG/iM1CqnhcbRKnt6OcpgMRB3d6ku3pRGIf5
 uFpZWT9fNaOx0KFxMBJ4zzUKFN7/mymdmjG6svfm9x7fN1U1X1vxqArFbZt6UlBdIVUV0fn/Wyl
 RlYBzIjQ==
X-Google-Smtp-Source: AGHT+IE9VAzcA+cC/qaf4LuvFh4rVtAIrvPs9LNWNvXT58VR5kSo1FWoOBhLzl0D2bigMeIb+NdEYvifeWDMkcA/cRE=
X-Received: by 2002:a17:90b:5202:b0:2fa:b8e:3d26 with SMTP id
 98e67ed59e1d1-2fce875bd28mr26330288a91.30.1740484811041; Tue, 25 Feb 2025
 04:00:11 -0800 (PST)
MIME-Version: 1.0
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
In-Reply-To: <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Tue, 25 Feb 2025 12:59:59 +0100
X-Gm-Features: AQ5f1JpivEb4KEtuJY_1NZ2P2ahh5v47LwqwYjISelFnkAoGGLog4rlKXG0Po9c
Message-ID: <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
Subject: Re: drm: mipi_dbi_hw_reset() keeps display in reset
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: dri-devel@lists.freedesktop.org, noralf@tronnes.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think it's a good idea if the current logic is about to be fixed.
Another (probably not as good) idea is to introduce a new property
named "nreset-gpios =3D ..." or something like that, but I realise that
"reset-gpios" is the de-facto standard naming.

Best regards,
Josef

On Mon, Feb 24, 2025 at 12:13=E2=80=AFAM Alex Lanzano <lanzano.alex@gmail.c=
om> wrote:
>
> On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Lu=C5=A1tick=C3=BD wrote:
> > On Sat, Feb 15, 2025 at 8:14=E2=80=AFPM Alex Lanzano <lanzano.alex@gmai=
l.com> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Lu=C5=A1tick=C3=BD =
wrote:
> > > > > Hello Alex,
> > > > > there is a bug in mipi_dbi_hw_reset() function that implements th=
e logic of
> > > > > display reset contrary.
> > > > > It keeps the reset line activated which keeps displays in reset s=
tate.
> > > > >
> > > > > I reported the bug to
> > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > > >
> > > > > Unfortunately, fixing the bug would mean current DTB-ABI breakage=
 and
> > > > > device-trees modification would be needed.
> > > > > I mainly write this email to let you and other people know about =
it, so
> > > > > hopefully it can be found easier.
> > > > > What are your thoughts?
> > > > Thanks for making me aware. I'll dig into over the weekend and get =
back
> > > > to you
> > >
> > > Alright so I looked into a bit more. Looks like the MIPI Specificatio=
n
> > > says that the reset line is active low. So, if we want dt entries to =
be
> > > correct the logic for setting the reset line in mipi_dbi_hw_reset()
> > > should be flipped. However, like you said, this is going to cause a s=
ome
> > > confused developers to break out their oscilloscopes to figure out
> > > why their display isn't working.
> > >
> > > Best regards,
> > > Alex
> >
> > Thank you Alex for looking into this.
> > I think all the supported dts can be changed together with
> > mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> > third party DTSs.
> > So I think it shall be either noted somewhere that due to this bug,
> > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > or the mipi_dbi_hw_reset() is changed and the compatibility is broken,
> > which needs to be announced.
> >
> > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > support just a couple of weeks before the fix, so they avoided the
> > compatibility issue.
> > I was not able to find users mentioning issues related to the display
> > not functioning properly, so I had to dig into the code.
> > But afterwards I found a thread on Raspberry PI forums, where one of
> > the moderators mentions it [2].
> >
> > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > [2] https://forums.raspberrypi.com/viewtopic.php?p=3D2165720#p2165720
>
> So, here are my thoughts on this after pondering it over for a bit.
> Ideally we should eventually reverse the reset logic so the DTS entry
> correctly specifies the hardware. However, instead of an abrupt change
> maybe we add an additional property to the DTS node that when present
> uses the correct reset logic. If the property isn't present we use the
> current incorrect reset logic and print out a dev_warn that it will soon
> be deprecated.
>
> Let me know what you think.
>
> Best regards,
> Alex
>
>
