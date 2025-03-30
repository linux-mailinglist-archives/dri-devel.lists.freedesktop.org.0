Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B8DA75ABC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 17:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FE710E0B6;
	Sun, 30 Mar 2025 15:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g4IlSaoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E5510E0B6;
 Sun, 30 Mar 2025 15:57:36 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6f47ed1f40dso24851937b3.1; 
 Sun, 30 Mar 2025 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743350256; x=1743955056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzR43zxb6NjxOFs7Go+WlhmJwzD4twZ04Ri3ThXZFIs=;
 b=g4IlSaoWcMt9DFMwzcMq7SXmJrcJlJlqs7hZ/cvF8shrKGoGXJYqd+5xM1r6LBopBf
 MEP2jnIoSo3L72LMEU9G+5Ktw0whwjfqL8we+nU3fYfkjGYCQZMl0fRWPp0V3N+Qu6gC
 U6jvEvc9KgeHE78orkuG5NYJ+Ms1p4NpLxw7MY39Gr921TnLflfKvvl1kWb28T+I1iD7
 t+fIybwKBCr/vs/ihV5AyuR+VUc6UFTsMlYGD7G7odRSfW3nzRui5b/mY7M7H2d4Z+Lk
 IWl6se9uIkoiK5C7Lpq6m95vbp46EQSuN2SDucnpwMe+jrlGiBdHPpcBsqdNnfqV8KF5
 raog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743350256; x=1743955056;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzR43zxb6NjxOFs7Go+WlhmJwzD4twZ04Ri3ThXZFIs=;
 b=pxJc1v6m3EGzlYSjUYMrrsPM5HyqhFiZw2ZREhkq5vLSy6jrCLJciInHo6dgwPV04U
 RjNSGUuF4yZ/4P0kcXnY4XCzBz5ZEtMTC1WQpIVRatY7vpcaioimpTxKttmpR4lmNI/7
 03pabM3KAGGRs1rHDQ4vHSK9FpXmivBouY0/xNIWEPL3re3DbkHP3eFm10cyKete5RzC
 lN7FX51Jc3DOPWJPkoeHmkSNhJWlFEwN1+EAqyvWq9K9MmG58jQN6TY+/UCIek+Ms2Ri
 oKjLYe87UTDHgIxX46BYsqumPRnMT3mhCwzicSJTvtHfmCqtRmXwCJZ2Y6dOhCc5I/Ld
 Lj7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAHRYeo21iYMwLWoDYJQSIyOfm7bQOuObkDWbzplBeCAu56hxPFB63jwPWGuAAqH/5iHJb7H7UJQ==@lists.freedesktop.org,
 AJvYcCUP1L7ThxxufK/ts99jKSUZe71rfJavJn6nCU8rAybNtkSnXO8ynp7XvLilTJeUj2imThplxsW69Yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPR45PYNlEQBRrL233U8xDopkD/b6VgX0rkCIhJcJCGtChCgUD
 tPBID3ngsy+iMqfqgi4vre1tyCdt05pDrQUofVNEM8cmcC7qE40+tUna10y+5+MsGZB6ok0z/Ez
 lsMhKbTRlHwSemCsbTsZfsZK+07A=
X-Gm-Gg: ASbGncsbWxhVqdNuhdGjzDvjTO9lsZME+XDO1iF1PcOzN0APBb8qA74WYtiO2E6eYyU
 Dc1GHTO2Tn364KzwCFnb0K3fwxUOYCoCqSGKqvPAQHfEszFC0ydHV6+DdvUlJsdsk0zPoTGvgvy
 lNG5gX/h+LIQ3UEWpZy4loBtUbqxjBVsp6motjM5ziDILfnUKVfrKVlNiYMQ==
X-Google-Smtp-Source: AGHT+IHNGW/KpfzMAlBXwefGE/j3fXIjH0+5OMThAC27I8OvFTrt7XTy3sWzrCHtMa+yyxEypTP0jvy3doTOqS7/1xw=
X-Received: by 2002:a05:690c:f89:b0:6fb:b7b7:f1e5 with SMTP id
 00721157ae682-702570d1318mr89095287b3.14.1743350255656; Sun, 30 Mar 2025
 08:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <Z-ljeKZd7vNoQZJZ@pampelmuse>
 <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
In-Reply-To: <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
From: Gonsolo <gonsolo@gmail.com>
Date: Sun, 30 Mar 2025 17:57:25 +0200
X-Gm-Features: AQ5f1Joy6X8BzXlGuDAhZrd8PwEk7sq1bPQcQ3Gc_d3QydZypJ3fRc-d9iMtgao
Message-ID: <CANL0fFSZWVKELUC2xaXHXcWn2tLNSUE-kbUR6WovuiJSuJG=8Q@mail.gmail.com>
Subject: Re: Screen corruption with second monitor
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Update:
Sleeping with two working monitors also corrupts the second monitor.

Am So., 30. M=C3=A4rz 2025 um 17:54 Uhr schrieb Gonsolo <gonsolo@gmail.com>=
:
>
> Hi!
>
> Second try without attachment.
> Youtube link of screen: https://youtu.be/zVbuzxECinI
>
> Am So., 30. M=C3=A4rz 2025 um 17:30 Uhr schrieb Gon Solo <gonsolo@gmail.c=
om>:
> >
> > Hi!
> >
> > I bought a Displayport-to-HDMI cable to connect a second monitor to my
> > NVIDIA 3060 12GB with three Displayport and one HDMI outputs.
> > The first monitor is connected via the only HDMI output.
> > The (second) monitor via on DP-HDMI flickers and has vertical stripes (=
see the
> > attached video). I'm running the latest Arch with Nouveau and NVK.
> > The first monitor is attached via
> > Kernel 6.13.8-arch1-1
> > Mesa 25.0.2
> >
> > I think it's the driver's fault because
> > a) console works, flickering starts with the graphical console,
> > b) on Windows it works,
> > c) with NVIDIA (nvidia-open, nvidia-utils) drivers it works,
> > d) booting with just the second monitor (Displayport-HDMI) works, and
> > e) funny enough, booting with just the second monitor, and plugging in =
the first one
> > later also works.
> >
> > So my guess would be, there's something not working with Nouveau's hand=
ling of
> > the second screen.
> >
> > I'm happy to provide more details on request.
> >
> > Cheers,
> > Andreas
>
> --
> Andreas



--=20
g
