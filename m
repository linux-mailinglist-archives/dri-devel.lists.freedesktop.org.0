Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A01A6107B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 12:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B283910E9CA;
	Fri, 14 Mar 2025 11:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=braiins.cz header.i=@braiins.cz header.b="Cor+tHDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D95310E9DF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 11:57:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-22398e09e39so40923605ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 04:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braiins.cz; s=google; t=1741953459; x=1742558259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJeA0GHePEFuPrdY8Z4frXDRorK67oRtYbNMgmYRHTg=;
 b=Cor+tHDAx7TVCCwexGwCjPV+Jsx8tn/nun/6a7hmcI66LSvQROaUqthyIU13LYRwgV
 5s0zU7BDJJKNXDA20DXgqFF8R95sCOj6jdglJdAoSWEJh1XZYpeAnxvgpRerA5JGAbD5
 iYRj65h9vNsM6kJJ2Y+C/z/C7ZN48c9TLoz7AhmGSytNtSkdrYb94g2ONcerhXncUyjq
 07/MTdyARrfWwEt6bY/dltkYIzZR5S5uF6EzZYiRmP3DNWv7tLbDowS3FCImwajt/br9
 hj7ZYiNTaY+p/zhRs88WwsqD8aJIr1De8diDIEJdhgvNvGjHEJxKFQwWuG1Le8wFbl8T
 rSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741953459; x=1742558259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJeA0GHePEFuPrdY8Z4frXDRorK67oRtYbNMgmYRHTg=;
 b=Sxda26hlJpXmGSxX04uAriy+Ucvf2BSA/ChEUYTqFBItqhMYw8fvQ2fvKfFHAnGQ3U
 XhDkB9amJbHD3dlpFALfWoUvSKAi2FSPoSeb8SaZn0agTxLONEb6wReTITdB/bDXPYgU
 YgEPT9MQ7iU/htS503TCz46HdYp6MJbKE7PdPp8M4bokC0WZpRh6mQAEDL2wLDjRtODd
 WkloGlo7gN1pP8n/eTCpJhZO0i26lYHhwoknbqgFTX+bO9FezI9Za+G2Y9r5L/SxMpyY
 m62Jq68B5P9N6c4OylNTQc3TOwzhFIyN/j1PQu6AQsv/5wb0q7nqESwbEKeKcqB2o2b0
 Q/Lw==
X-Gm-Message-State: AOJu0YyqnPXwpwTkXfMWu3c5v+M03MWj3CeVczvzQ8JXyfr1xxVrD03B
 gb1r3n53N40loOnOr3IZIfO4LoFCWRKgiopu4Pbjpxk4mBTScxoF4rmpyQABtx6GXxqQIbm4W2U
 SuiyEL8mJQvaK/ihVOHX7svm5Yd2wwxSJ9BUK0A==
X-Gm-Gg: ASbGncukbfH/BFDmbBx/1LMPLWRC+7P3Sbf0JknChDYUHIeSI/rP0IJl8Uhe3We/soj
 ugHiUbYaUUky3f+/6Xh7KQlsU7ZAWs7TAuZyW8xFBVUqUASrAVzAgBDfA53G/Q0MB2vDxIMphoz
 3T+4tB+cCOE09Tbm8rFWiDq2v9
X-Google-Smtp-Source: AGHT+IGUEX0VTjAYQN1Z5uuQ+upkeY7JAwV0HJT1RhJ40h9w+45EhK9Bq+WEpduHakYxptx+0yyam49ZfH1/o6LYu5c=
X-Received: by 2002:a17:90b:180d:b0:2fe:9783:afd3 with SMTP id
 98e67ed59e1d1-30151c59cfbmr3204665a91.2.1741953458737; Fri, 14 Mar 2025
 04:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACnTymYtkLJ=EfZK-c1nCW+bLSKAaq2sTW1x+Bj-_ve7hfAdKA@mail.gmail.com>
 <n7qaikyyisdq3m74buqjfxzyi5lgntnsmtirrmw5vi2nkf7izl@6coklitzp3uc>
 <fm4kqbfknroub3onbbhbzvurw7ig3fsjrxpeucdtioobssstjk@hzmdxa7uby6f>
 <CACnTymYBYmGMk8z5Xp=OGBHvsA-hwJtGAi6MSHfpTGJBHMQqSw@mail.gmail.com>
 <spav7ftc45ypks3no2sgaciagym2jbd2hfcyqmforvwli47ixj@6rtvedapu342>
 <CACnTymaA5UZGRGveAOOFTtRWrWr9rnyWj8Ah6qmMOTS0dbuVNg@mail.gmail.com>
 <6he4g5se6cqu6l3bdbfv636pm62ucvzsm5ujhi2xjig7srxxqb@gagbovuujysx>
 <CACnTymbj8u_QchzC9CT2mcbg-0MPfVBs8ukwdWkJtjq_SpCvwQ@mail.gmail.com>
 <p6ajylavycnvylrn7wmtsp2rqrezkkthajszuobqsm4bhymqzz@lki2bo6ybxpz>
In-Reply-To: <p6ajylavycnvylrn7wmtsp2rqrezkkthajszuobqsm4bhymqzz@lki2bo6ybxpz>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef.lusticky@braiins.cz>
Date: Fri, 14 Mar 2025 12:57:27 +0100
X-Gm-Features: AQ5f1JouE7n2RAuIFHM5h7gmjzqnAbJb5XzhTSm2N-4LpMW-TUzzpovbZefl-j4
Message-ID: <CACnTymZX7DY72Dmc0HWFvbKYzGaC3_tM-8f6EimndpPYOYf+sA@mail.gmail.com>
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

On Mon, Mar 10, 2025 at 7:33=E2=80=AFPM Alex Lanzano <lanzano.alex@gmail.co=
m> wrote:
>
> On Fri, Mar 07, 2025 at 10:25:18AM +0100, Josef Lu=C5=A1tick=C3=BD wrote:
> > Ok, I'll implement the change and post it for a review.
> > About the property naming, I tend to name it something like
> > "inverted-reset-gpio-fixed" to denote that it is assumed the code
> > using the "reset-gpios" property was fixed.
> > What are your thoughts?
> >
>
> You probably wnat something more concise and in present tense like
> 'invert-reset-gpio'

OK, I understand.
It still feels like the 'invert' would mean that the code is supposed
to do something non-standard with the reset-gpios property
specification.
How about 'correct-reset-gpio' or 'proper-reset-gpio' to denote that
the reset-gpio property describes the HW correctly.

>
> Best regards,
> Alex
>
> > On Tue, Feb 25, 2025 at 2:46=E2=80=AFPM Alex Lanzano <lanzano.alex@gmai=
l.com> wrote:
> > >
> > > On Tue, Feb 25, 2025 at 12:59:59PM +0100, Josef Lu=C5=A1tick=C3=BD wr=
ote:
> > > > On Mon, Feb 24, 2025 at 12:13=E2=80=AFAM Alex Lanzano <lanzano.alex=
@gmail.com> wrote:
> > > > >
> > > > > On Mon, Feb 17, 2025 at 12:39:01PM +0100, Josef Lu=C5=A1tick=C3=
=BD wrote:
> > > > > > On Sat, Feb 15, 2025 at 8:14=E2=80=AFPM Alex Lanzano <lanzano.a=
lex@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Feb 14, 2025 at 08:04:41PM -0500, Alex Lanzano wrote:
> > > > > > > > On Fri, Feb 14, 2025 at 10:29:29AM +0100, Josef Lu=C5=A1tic=
k=C3=BD wrote:
> > > > > > > > > Hello Alex,
> > > > > > > > > there is a bug in mipi_dbi_hw_reset() function that imple=
ments the logic of
> > > > > > > > > display reset contrary.
> > > > > > > > > It keeps the reset line activated which keeps displays in=
 reset state.
> > > > > > > > >
> > > > > > > > > I reported the bug to
> > > > > > > > > https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/6=
3
> > > > > > > > >
> > > > > > > > > Unfortunately, fixing the bug would mean current DTB-ABI =
breakage and
> > > > > > > > > device-trees modification would be needed.
> > > > > > > > > I mainly write this email to let you and other people kno=
w about it, so
> > > > > > > > > hopefully it can be found easier.
> > > > > > > > > What are your thoughts?
> > > > > > > > Thanks for making me aware. I'll dig into over the weekend =
and get back
> > > > > > > > to you
> > > > > > >
> > > > > > > Alright so I looked into a bit more. Looks like the MIPI Spec=
ification
> > > > > > > says that the reset line is active low. So, if we want dt ent=
ries to be
> > > > > > > correct the logic for setting the reset line in mipi_dbi_hw_r=
eset()
> > > > > > > should be flipped. However, like you said, this is going to c=
ause a some
> > > > > > > confused developers to break out their oscilloscopes to figur=
e out
> > > > > > > why their display isn't working.
> > > > > > >
> > > > > > > Best regards,
> > > > > > > Alex
> > > > > >
> > > > > > Thank you Alex for looking into this.
> > > > > > I think all the supported dts can be changed together with
> > > > > > mipi_dbi_hw_reset(), however the fix would break existing DTBs =
and
> > > > > > third party DTSs.
> > > > > > So I think it shall be either noted somewhere that due to this =
bug,
> > > > > > the reset line needs to be "wrongly" ACTIVE_HIGH in DTS
> > > > > > or the mipi_dbi_hw_reset() is changed and the compatibility is =
broken,
> > > > > > which needs to be announced.
> > > > > >
> > > > > > BTW Zephyr fixed the code [1], but they introduced the MIPI DBI
> > > > > > support just a couple of weeks before the fix, so they avoided =
the
> > > > > > compatibility issue.
> > > > > > I was not able to find users mentioning issues related to the d=
isplay
> > > > > > not functioning properly, so I had to dig into the code.
> > > > > > But afterwards I found a thread on Raspberry PI forums, where o=
ne of
> > > > > > the moderators mentions it [2].
> > > > > >
> > > > > > [1] https://github.com/zephyrproject-rtos/zephyr/issues/68562
> > > > > > [2] https://forums.raspberrypi.com/viewtopic.php?p=3D2165720#p2=
165720
> > > > >
> > > > > So, here are my thoughts on this after pondering it over for a bi=
t.
> > > > > Ideally we should eventually reverse the reset logic so the DTS e=
ntry
> > > > > correctly specifies the hardware. However, instead of an abrupt c=
hange
> > > > > maybe we add an additional property to the DTS node that when pre=
sent
> > > > > uses the correct reset logic. If the property isn't present we us=
e the
> > > > > current incorrect reset logic and print out a dev_warn that it wi=
ll soon
> > > > > be deprecated.
> > > > >
> > > > > Let me know what you think.
> > > > >
> > > > > Best regards,
> > > > > Alex
> > > > >
> > > > >
> > > > I think it's a good idea if the current logic is about to be fixed.
> > > > Another (probably not as good) idea is to introduce a new property
> > > > named "nreset-gpios =3D ..." or something like that, but I realise =
that
> > > > "reset-gpios" is the de-facto standard naming.
> > > >
> > > > Best regards,
> > > > Josef
> > > >
> > >
> > > Yeah I think it may be simpler to just add a boolean property like
> > > 'reverse-reset'. It would make the driver code simpler to implement t=
oo.
> > > Would you like to implement this change and submit the patch or would
> > > you like me to?
> > >
> > > Best regards,
> > > Alex
