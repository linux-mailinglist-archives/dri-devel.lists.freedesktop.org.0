Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C224A76C724
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748E810E515;
	Wed,  2 Aug 2023 07:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861E610E513;
 Wed,  2 Aug 2023 07:39:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so9497229e87.3; 
 Wed, 02 Aug 2023 00:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690961953; x=1691566753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Wu+ajQyRgIN0Emiwp7sguZBZB+ZCl4Y83l4Rcy5bsA=;
 b=bzlONBjURYW4qGGnnzHXuoPtxWB3/pqAmj7uXC143EG89y9cKhrAB/QmY8HmcZqWZi
 uLXcd08R2OWcwV9B3bGZfTC/zcx3WS9It8KPKCQPYCo5HAAl/HL/WDMheUk2qssGXGSw
 aXh4KUscuvOvXip/H9njIk9+rNRqyTqUnxZYmunRXNkCsZ37B8ZZwGss8V2SaenxOVle
 C12Q475TyaS9K/vgoouh+KERHbzeNJ4YxVur6eNNnioRo6XI8nCYs7tlWJ+m9uiQCV98
 lpu57U5Nt+K7E1XKJ6xPRik+XK+/NzW0FKp9MTkpi8xa9pkj2yQ0xGFo+kZ4tj8kdkBg
 F5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690961953; x=1691566753;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Wu+ajQyRgIN0Emiwp7sguZBZB+ZCl4Y83l4Rcy5bsA=;
 b=JTgTUkZy7unPWk81cp5dW5AWMm9qetvD2NpwmhgcBMN+n3JHbAMzk/k4thsDG1sAQ5
 B7PxHlSKhbjAg9DxN9KBNhAozIU2nN0kw9wZOlV18tEaF5n8L/1K5UI9IRzCZhFLQdk9
 qu+2rigVpiSuPqu56SxPYr5F4BwyCBU24Vt7bN1j1bkGu+NZBxddrd1SYsJeLsXuOkjY
 3LeSozOyTD0hBsMPd+qyRDmleLy8lzENe2i8H4njsulYkp7LvQR5fFAUfmKjbUe/ILCn
 VzVchyt2q6scxOy8iyK4R/YxIbY+L7+/F8ubGiE+b2xlFpgpD/Fg4Ao7DgJgb08OMGJ/
 PzQw==
X-Gm-Message-State: ABy/qLZ8WQQ6Q9zM5HGaIMIppuR0OPFEnw//rOsEjQTedg+cVmYaEroQ
 Tgo2hWE9tpVCui4vtNYe/IhNdnAtV3NBZnDFzEk=
X-Google-Smtp-Source: APBJJlGj6n1AQt5CK0flz5hFWYdPmceWBg9cQU3umZ++tCTzukPeb/1viPtGEVGRL9DGEubLvO9hj4lGai0eGPDrdE0=
X-Received: by 2002:ac2:4e07:0:b0:4fe:ec5:2698 with SMTP id
 e7-20020ac24e07000000b004fe0ec52698mr4893493lfr.50.1690961952440; Wed, 02 Aug
 2023 00:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230627132323.115440-1-andrealmeid@igalia.com>
 <e292a30f-5cad-1968-de4f-0d43c9c1e943@igalia.com>
 <45a1e527-f5dc-aa6f-9482-8958566ecb96@mailbox.org>
 <a1fecc5c-30c0-2754-70a1-2edb2fe118fb@igalia.com>
 <8eb58a5f-02d0-fadf-1d5a-790b6af2d81e@mailbox.org>
In-Reply-To: <8eb58a5f-02d0-fadf-1d5a-790b6af2d81e@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 2 Aug 2023 03:38:36 -0400
Message-ID: <CAAxE2A6xy5yi7yMH-tzEfC2f3AgL7aesYQNpr=1oZ8Rx0K4=Ug@mail.gmail.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A screen that doesn't update isn't usable. Killing the window system
and returning to the login screen is one option. Killing the window
system manually from a terminal or over ssh and then returning to the
login screen is another option, but 99% of users either hard-reset the
machine or do sysrq+REISUB anyway because it's faster that way. Those
are all your options. If we don't do the kill, users might decide to
do a hard reset with an unsync'd file system, which can cause more
damage.

The precedent from the CPU land is pretty strong here. There is
SIGSEGV for invalid CPU memory access and SIGILL for invalid CPU
instructions, yet we do nothing for invalid GPU memory access and
invalid GPU instructions. Sending a terminating signal from the kernel
would be the most natural thing to do. Instead, we just keep a frozen
GUI to keep users helpless, or we continue command submission and then
the hanging app can cause an infinite cycle of GPU hangs and resets,
making the GPU unusable until somebody kills the app over ssh.

That's why GL/Vulkan robustness is required - either robust apps, or a
robust compositor that greys out lost windows and pops up a diagnostic
message with a list of actions to choose from. That's the direction we
should be taking. Non-robust apps under a non-robust compositor should
just be killed if they crash the GPU.


Marek

On Wed, Jul 26, 2023 at 4:07=E2=80=AFAM Michel D=C3=A4nzer
<michel.daenzer@mailbox.org> wrote:
>
> On 7/25/23 15:02, Andr=C3=A9 Almeida wrote:
> > Em 25/07/2023 05:03, Michel D=C3=A4nzer escreveu:
> >> On 7/25/23 04:55, Andr=C3=A9 Almeida wrote:
> >>> Hi everyone,
> >>>
> >>> It's not clear what we should do about non-robust OpenGL apps after G=
PU resets, so I'll try to summarize the topic, show some options and my pro=
posal to move forward on that.
> >>>
> >>> Em 27/06/2023 10:23, Andr=C3=A9 Almeida escreveu:
> >>>> +Robustness
> >>>> +----------
> >>>> +
> >>>> +The only way to try to keep an application working after a reset is=
 if it
> >>>> +complies with the robustness aspects of the graphical API that it i=
s using.
> >>>> +
> >>>> +Graphical APIs provide ways to applications to deal with device res=
ets. However,
> >>>> +there is no guarantee that the app will use such features correctly=
, and the
> >>>> +UMD can implement policies to close the app if it is a repeating of=
fender,
> >>>> +likely in a broken loop. This is done to ensure that it does not ke=
ep blocking
> >>>> +the user interface from being correctly displayed. This should be d=
one even if
> >>>> +the app is correct but happens to trigger some bug in the hardware/=
driver.
> >>>> +
> >>> Depending on the OpenGL version, there are different robustness API a=
vailable:
> >>>
> >>> - OpenGL ABR extension [0]
> >>> - OpenGL KHR extension [1]
> >>> - OpenGL ES extension  [2]
> >>>
> >>> Apps written in OpenGL should use whatever version is available for t=
hem to make the app robust for GPU resets. That usually means calling GetGr=
aphicsResetStatusARB(), checking the status, and if it encounter something =
different from NO_ERROR, that means that a reset has happened, the context =
is considered lost and should be recreated. If an app follow this, it will =
likely succeed recovering a reset.
> >>>
> >>> What should non-robustness apps do then? They certainly will not be n=
otified if a reset happens, and thus can't recover if their context is lost=
. OpenGL specification does not explicitly define what should be done in su=
ch situations[3], and I believe that usually when the spec mandates to clos=
e the app, it would explicitly note it.
> >>>
> >>> However, in reality there are different types of device resets, causi=
ng different results. A reset can be precise enough to damage only the guil=
ty context, and keep others alive.
> >>>
> >>> Given that, I believe drivers have the following options:
> >>>
> >>> a) Kill all non-robust apps after a reset. This may lead to lose work=
 from innocent applications.
> >>>
> >>> b) Ignore all non-robust apps OpenGL calls. That means that applicati=
ons would still be alive, but the user interface would be freeze. The user =
would need to close it manually anyway, but in some corner cases, the app c=
ould autosave some work or the user might be able to interact with it using=
 some alternative method (command line?).
> >>>
> >>> c) Kill just the affected non-robust applications. To do that, the dr=
iver need to be 100% sure on the impact of its resets.
> >>>
> >>> RadeonSI currently implements a), as can be seen at [4], while Iris i=
mplements what I think it's c)[5].
> >>>
> >>> For the user experience point-of-view, c) is clearly the best option,=
 but it's the hardest to archive. There's not much gain on having b) over a=
), perhaps it could be an optional env var for such corner case application=
s.
> >>
> >> I disagree on these conclusions.
> >>
> >> c) is certainly better than a), but it's not "clearly the best" in all=
 cases. The OpenGL UMD is not a privileged/special component and is in no p=
osition to decide whether or not the process as a whole (only some thread(s=
) of which may use OpenGL at all) gets to continue running or not.
> >>
> >
> > Thank you for the feedback. How do you think the documentation should l=
ook like for this part?
>
> The initial paragraph about robustness should say "keep OpenGL working" i=
nstead of "keep an application working". If an OpenGL context stops working=
, it doesn't necessarily mean the application stops working altogether.
>
>
> If the application doesn't use the robustness extensions, your option b) =
is what should happen by default whenever possible. And it really has to be=
 possible if the robustness extensions are supported.
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
