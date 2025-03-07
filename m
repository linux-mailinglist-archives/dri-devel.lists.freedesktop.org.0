Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F4A563B7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B710EB1C;
	Fri,  7 Mar 2025 09:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="MPxqtpR1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054EE10EB1C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:25:30 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2fecba90cc3so3461157a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 01:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1741339530; x=1741944330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVDJJoCxBMYFFxCBlAGc0Vtd1OzybLcI1kfvzMm/mr4=;
 b=MPxqtpR1OMtqDF/4kMdmY7UOTdNX+FrqSO979jSq9H5lTnsNpZb/M1RCTVp5RLDrVk
 +k1imTjmZlGiocbENlsRnSCVnOVU/3vdipK9nJWUIqUNU+vSkN0niPUTJtC/Lxys6/ls
 BEWiXOXV/nWnC8PFliTG43Xgk+PQasOz42FKMaIBdpy29aSdOoaZSFdJ0eFiY48G7CtE
 sLZwdO5puiewQXcSwErC5AsECSdZnx6wpfLGkydrQdAD1HQUQjhqg0tx0uVvCdiJBQW9
 GRAW+KSR00HAycImEnp4dp/+3yBfGuF4aVLbFTGwBhQXhJ39SQ86EJIoK2YrxZqZ2l2R
 GCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741339530; x=1741944330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVDJJoCxBMYFFxCBlAGc0Vtd1OzybLcI1kfvzMm/mr4=;
 b=P5TD43CkkE+6UJDyDk4t6WO2nVXHwwPSFMVSx7tRrmcvyRJ+9TF04/VsDlhG8E0ijM
 LM0v6SFU2/kubtDhsHdCl4WyplijJeSuREs8LTqrV8bEnoipBQiFlqmiIpHz+8NP8mUq
 c7vJTHf2Fv3Jy2f+WgsMqcvnQWiz8ItWVVIWEQep+em5oAyYISRf8qSvclSmW4W3hXdd
 poq0lgKCMDJ4Olz2WNNPsK5JinjCTgNH3Db3Zc+upH0KyXCqAiAUYc7Z5MjL0fgYYHFn
 IYB7dVDpO8qAc+I0o6IcpkKz8ohadGDe+eMTyPQNhvaKxbRnnyc+P0QM3hnNkpf2bElW
 ug5w==
X-Gm-Message-State: AOJu0YzoAOpWDNaDMbMIZbjrOVP3ckzHtztLYIZA/WI9yQFsMlSc1YDo
 Qz0f7a7x+R6d1oUPQj4uWiaH5prN4Qv5AU+b6AGgFQUjfVG9dEmP76NM0KS4mVDtn3e/0BI5qOP
 zjbzuLpZu7HNVgdP3miWZwKO9fJd/WCNQL9zWkSM70yRGtsAldEA=
X-Gm-Gg: ASbGncu3fltgbgxxVbqjrzplgKVV1vYj8gPJxt+jEeUUcGn+DzJ9LPApkUFLffm/zDB
 qnUSPm0kCZ2yGqKHrVdrUsNa5vn+Ch3icDOAQ7+U54AXQKh0XAaGRW1d6lbE2fuThKcy5N2LL8B
 0vzKfqOPDPv7KNUYMfQ5MQVT+b
X-Google-Smtp-Source: AGHT+IEng89zwfzrATba0MQHyZh2ayvVoOZ2YK7QldpBzBtHj4YpO4vNOCV70JZtmOtVIQcw7Jobq74vIfaPmir8Yqk=
X-Received: by 2002:a17:90a:d605:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2ff7cd31b16mr5315968a91.0.1741339529740; Fri, 07 Mar 2025
 01:25:29 -0800 (PST)
MIME-Version: 1.0
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
 <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
In-Reply-To: <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Fri, 7 Mar 2025 10:25:18 +0100
X-Gm-Features: AQ5f1Jom0rgsKfWf-i7NKYfrUGulmMvI5XdvVCRtcED-Tgi-xAycJj6Lyej7V_Q
Message-ID: <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
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

Ok, I'll implement the change and post it for a review.
About the property naming, I tend to name it something like
"inverted-reset-gpio-fixed" to denote that it is assumed the code
using the "reset-gpios" property was fixed.
What are your thoughts?

Best regards,
Josef

On Tue, Feb 25, 2025 at 2:46=E2=80=AFPM Alex Lanzano <lanzano.alex@gmail.co=
m> wrote:
>
> On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Lu=C5=A1tick=C3=BD wrote:
> > On Mon, Feb 24, 2025 at 12:13=E2=80=AFAM Alex Lanzano <lanzano.alex@gma=
il.com> wrote:
> > >
> > > On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Lu=C5=A1tick=C3=BD wr=
ote:
> > > > On Sat, Feb 15, 2025 at 8:14=E2=80=AFPM Alex Lanzano <lanzano.alex@=
gmail.com> wrote:
> > > > >
> > > > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Lu=C5=A1tick=C3=
=BD wrote:
> > > > > > > Hello Alex,
> > > > > > > there is a bug in mipi_dbi_hw_reset() function that implement=
s the logic of
> > > > > > > display reset contrary.
> > > > > > > It keeps the reset line activated which keeps displays in res=
et state.
> > > > > > >
> > > > > > > I reported the bug to
> > > > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/63
> > > > > > >
> > > > > > > Unfortunately, fixing the bug would mean current DTB-ABI brea=
kage and
> > > > > > > device-trees modification would be needed.
> > > > > > > I mainly write this email to let you and other people know ab=
out it, so
> > > > > > > hopefully it can be found easier.
> > > > > > > What are your thoughts?
> > > > > > Thanks for making me aware. I'll dig into over the weekend and =
get back
> > > > > > to you
> > > > >
> > > > > Alright so I looked into a bit more. Looks like the MIPI Specific=
ation
> > > > > says that the reset line is active low. So, if we want dt entries=
 to be
> > > > > correct the logic for setting the reset line in mipi_dbi_hw_reset=
()
> > > > > should be flipped. However, like you said, this is going to cause=
 a some
> > > > > confused developers to break out their oscilloscopes to figure ou=
t
> > > > > why their display isn't working.
> > > > >
> > > > > Best regards,
> > > > > Alex
> > > >
> > > > Thank you Alex for looking into this.
> > > > I think all the supported dts can be changed together with
> > > > mipi_dbi_hw_reset(), however the fix would break existing DTBs and
> > > > third party DTSs.
> > > > So I think it shall be either noted somewhere that due to this bug,
> > > > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > > > or the mipi_dbi_hw_reset() is changed and the compatibility is brok=
en,
> > > > which needs to be announced.
> > > >
> > > > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > > > support just a couple of weeks before the fix, so they avoided the
> > > > compatibility issue.
> > > > I was not able to find users mentioning issues related to the displ=
ay
> > > > not functioning properly, so I had to dig into the code.
> > > > But afterwards I found a thread on Raspberry PI forums, where one o=
f
> > > > the moderators mentions it [2].
> > > >
> > > > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > > > [2] https://forums.raspberrypi.com/viewtopic.php?p=3D2165720#p21657=
20
> > >
> > > So, here are my thoughts on this after pondering it over for a bit.
> > > Ideally we should eventually reverse the reset logic so the DTS entry
> > > correctly specifies the hardware. However, instead of an abrupt chang=
e
> > > maybe we add an additional property to the DTS node that when present
> > > uses the correct reset logic. If the property isn't present we use th=
e
> > > current incorrect reset logic and print out a dev_warn that it will s=
oon
> > > be deprecated.
> > >
> > > Let me know what you think.
> > >
> > > Best regards,
> > > Alex
> > >
> > >
> > I think it's a good idea if the current logic is about to be fixed.
> > Another (probably not as good) idea is to introduce a new property
> > named "nreset-gpios =3D ..." or something like that, but I realise that
> > "reset-gpios" is the de-facto standard naming.
> >
> > Best regards,
> > Josef
> >
>
> Yeah I think it may be simpler to just add a boolean property like
> 'reverse-reset'. It would make the driver code simpler to implement too.
> Would you like to implement this change and submit the patch or would
> you like me to?
>
> Best regards,
> Alex
