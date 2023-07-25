Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749B761CE0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 17:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBDD10E144;
	Tue, 25 Jul 2023 15:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C4D10E124;
 Tue, 25 Jul 2023 15:05:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so8708816e87.2; 
 Tue, 25 Jul 2023 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690297537; x=1690902337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izSbvCwS33Nzu8WcsjFx0swOUhDCZ5hfgSwNc0cg4uM=;
 b=INwq7DEc2KTUbBH8qu1xUVJucRdHelF2FWT/7UoQM7/Crg1oHw0GTwilYzO+TR3aft
 izxyLQ4l49k5dZJjQM4o0xu4t1XK8BR1rbFGEANWFYDKDI01ACwGlDiQTpzgdhTLlC3m
 rZrWjVqTfOhnTN6nhjMA3MdLYrWJzCkpvDQ7IhQbTw1pNHg20xdcOm91Fs2enBPE9MgS
 iq7Uz7ik/cTqR1RK1TMiBscx+cC+MiMs1jYWLQMgbFBrWczHbLypcMWEyJoNRzW/5BOL
 VfqdvP9RJuVTAA7bFLNhC8SEsHc/qrOxEvDp0Ilr7jiOaoPO8Gq6HyJfY6aydjvO9zJu
 U7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690297537; x=1690902337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=izSbvCwS33Nzu8WcsjFx0swOUhDCZ5hfgSwNc0cg4uM=;
 b=jeqdFaFzxP0vvznky74gi3ds7c0ZI9DO+cFASlCgVUmb/9xRHVs2SZR1vOFI4DbX2i
 20tftK48EDiTdbSpiq3aXkCGuLcVQOT+EVQn51t++eRQd3PScSN1KFX/FT8rs1P5RFOs
 qeVzazNrRleNc1avAdWD1Z0q3TumPsAmY9sD5U1KE1YDZT12KSAASWDkzc8ubJ9lf6+Z
 +JQpPiJp1iaOVTyPiRaNayyGyitasMA6YEL1F8T13D7dApBFf0XoXM75lXJRDSvkN1vj
 stcOsOShtU3srp9eduxESh/UC6Kub+iTVf6jDzwSbA4Demr6BeAVE8tUUNvNnCE31Kpe
 Pcjg==
X-Gm-Message-State: ABy/qLaZXvGcEshku23jVK36CZZtryTGDHA3Y/IGTiZqufTKm+CEosS9
 7qQfQuNSwTEHmDX52tGIc/AEcbDib0NEbg3SU3w=
X-Google-Smtp-Source: APBJJlErgxAq0AM7XIRqNwjKdD9Sby9qr60ycVyvpIw0pM350sS8HYl7GbZot1w/EWlL49IB7nOENZntcNNTUTfgGvE=
X-Received: by 2002:a05:6512:ac8:b0:4fb:89ac:a967 with SMTP id
 n8-20020a0565120ac800b004fb89aca967mr7157951lfu.56.1690297536906; Tue, 25 Jul
 2023 08:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
In-Reply-To: <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 25 Jul 2023 11:05:00 -0400
Message-ID: <CAAxE2A6OhFVKSm8VY1iNJx_FvDH-ojfgxvSjTmJUwtcmouoLMw@mail.gmail.com>
Subject: Re: Non-robust apps and resets (was Re: [PATCH v5 1/1] drm/doc:
 Document DRM device reset expectations)
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
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
Cc: pierre-eric.pelloux-prayer@amd.com, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 4:03=E2=80=AFAM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 7/25/23 04:55, Andr=C3=A9 Almeida wrote:
> > Hi everyone,
> >
> > It's not clear what we should do about non-robust OpenGL apps after GPU=
 resets, so I'll try to summarize the topic, show some options and my propo=
sal to move forward on that.
> >
> > Em 27/06/2023 10:23, Andr=C3=A9 Almeida escreveu:
> >> +Robustness
> >> +----------
> >> +
> >> +The only way to try to keep an application working after a reset is i=
f it
> >> +complies with the robustness aspects of the graphical API that it is =
using.
> >> +
> >> +Graphical APIs provide ways to applications to deal with device reset=
s. However,
> >> +there is no guarantee that the app will use such features correctly, =
and the
> >> +UMD can implement policies to close the app if it is a repeating offe=
nder,
> >> +likely in a broken loop. This is done to ensure that it does not keep=
 blocking
> >> +the user interface from being correctly displayed. This should be don=
e even if
> >> +the app is correct but happens to trigger some bug in the hardware/dr=
iver.
> >> +
> > Depending on the OpenGL version, there are different robustness API ava=
ilable:
> >
> > - OpenGL ABR extension [0]
> > - OpenGL KHR extension [1]
> > - OpenGL ES extension  [2]
> >
> > Apps written in OpenGL should use whatever version is available for the=
m to make the app robust for GPU resets. That usually means calling GetGrap=
hicsResetStatusARB(), checking the status, and if it encounter something di=
fferent from NO_ERROR, that means that a reset has happened, the context is=
 considered lost and should be recreated. If an app follow this, it will li=
kely succeed recovering a reset.
> >
> > What should non-robustness apps do then? They certainly will not be not=
ified if a reset happens, and thus can't recover if their context is lost. =
OpenGL specification does not explicitly define what should be done in such=
 situations[3], and I believe that usually when the spec mandates to close =
the app, it would explicitly note it.
> >
> > However, in reality there are different types of device resets, causing=
 different results. A reset can be precise enough to damage only the guilty=
 context, and keep others alive.
> >
> > Given that, I believe drivers have the following options:
> >
> > a) Kill all non-robust apps after a reset. This may lead to lose work f=
rom innocent applications.
> >
> > b) Ignore all non-robust apps OpenGL calls. That means that application=
s would still be alive, but the user interface would be freeze. The user wo=
uld need to close it manually anyway, but in some corner cases, the app cou=
ld autosave some work or the user might be able to interact with it using s=
ome alternative method (command line?).
> >
> > c) Kill just the affected non-robust applications. To do that, the driv=
er need to be 100% sure on the impact of its resets.
> >
> > RadeonSI currently implements a), as can be seen at [4], while Iris imp=
lements what I think it's c)[5].
> >
> > For the user experience point-of-view, c) is clearly the best option, b=
ut it's the hardest to archive. There's not much gain on having b) over a),=
 perhaps it could be an optional env var for such corner case applications.
>
> I disagree on these conclusions.
>
> c) is certainly better than a), but it's not "clearly the best" in all ca=
ses. The OpenGL UMD is not a privileged/special component and is in no posi=
tion to decide whether or not the process as a whole (only some thread(s) o=
f which may use OpenGL at all) gets to continue running or not.

That's not true. I recommend that you enable b) with your driver and
then hang the GPU under different scenarios and see the result. Then
enable a) and do the same and compare.

Options a) and c) can be merged into one because they are not separate
options to choose from.

If Wayland wanted to grey out lost apps, they would appear as robust
contexts in gallium, but the reset status would be piped through the
Wayland protocol instead of the GL API.

Marek



Marek
