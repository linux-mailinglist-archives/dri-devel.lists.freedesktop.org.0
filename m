Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD7193CFEE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 10:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F5610E94F;
	Fri, 26 Jul 2024 08:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X59W9Exn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E93610E94D;
 Fri, 26 Jul 2024 08:55:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so1924649a12.3; 
 Fri, 26 Jul 2024 01:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721984105; x=1722588905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STqdda2SEZjOE7whuhp/QZewj60K8H9Mte6gIw2bzZk=;
 b=X59W9Exnbn6BfsswXYi9K/xvnZsWhH3i79sJq7RLvpzYf0uf0LSX27N3SlOqoNq3g8
 i+T/AaDxxgtSomWmlE35uVyu7wX4mSCLyDG+PFYWFETDPHWY0sLe2su2No9t9pnt9ZNX
 +1jiznRAqbz5WtFunHQxFgdgtY5IBlyRmKr3WSft1Ud0UlN3U+s6v6XE8evARriALXXU
 LGjgsvYQ4pkhi+nWgliL+ydSP+Lhzn6xDD8jeZEeyFPlUnG2l2ZM537FezixoLCq2oZu
 wBDXndPk0inPhCJyIZ3iqCuqoVNZv1d7V+/c2wIb55pTOkV+C9zyi8KwKTqdpZgWSgMF
 EqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721984105; x=1722588905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STqdda2SEZjOE7whuhp/QZewj60K8H9Mte6gIw2bzZk=;
 b=sPPd+s4oc3Eky8e5GeOX2AJ1A+HI40+XJHhhOrzUuXNnyDEX7hSJr4eqNHiZpLiUtz
 /WujHM+mwFhXClAM1q1JqlmoleuQ8hmQypuMV/A77Pk6GINdcFncKxpvecm9/JhjAZLz
 lA3eGjezhV1MG9eFD3/6wLLikii3/FQsC2NfHHW7sIM+dYzmQN8znSEvM7a8mYJ+NuT/
 yu5AYOOTashI0A072tkFFqURcnxcQe73DpStCZBt/qUysfCGEoFXUADXVmKQetBnEzSt
 hgf1Sqd1SDZWpSwxR9r/LMXnMseFtUe6w+PUZpwDsqgTHm7JOZKJJfT/Cv/Mxju8Z6kx
 ZW3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxXq+xr+c++Dhu3xe0XsA7MeEOWYgGzkmCYGlt3J6GPo62O78StK40u7qWkn4KLC6XAniZ1oEkoILh3Pt+BFXxuQbaRMVmxscE5femambv69E45mvSZrknlu3sc0VaV0KBZ8pN29snsk2fPg==
X-Gm-Message-State: AOJu0YxuiVLpNF1uo9OH3+etyoc9vQwbCC+77MGxc/4x/BVkz6k80Lcp
 fZ86hsGZebF+shC90R3gS55GTWQ6Y/OyKWm5Uh6I0Pt3m1rGTnaqwewoXpGkDMv/tJ1htN+qd5o
 Z52hUOIMf1Q1a+gArc8b0brmaGoA=
X-Google-Smtp-Source: AGHT+IEuCu0LH7RWYE4C2+y6Xq5Gd2lTUbSPZXSufj4wZklvkT/2hJWwi5rBWclTtW6+ZEIpzQUnvUyY0BRiDSmspAE=
X-Received: by 2002:a50:8d5a:0:b0:5a1:7362:91d9 with SMTP id
 4fb4d7f45d1cf-5ac629fb8d8mr3328924a12.22.1721984104539; Fri, 26 Jul 2024
 01:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
 <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
 <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
 <20240618-great-hissing-skink-b7950e@houat>
 <4813a6885648e5368028cd822e8b2381@manjaro.org>
 <457ae7654dba38fcd8b50e38a1275461@manjaro.org>
 <2c072cc4bc800a0c52518fa2476ef9dd@manjaro.org>
 <CAKGbVbsGm7emEPzGuf0Xn5k22Pbjfg9J9ykJHtvDF3SacfDg6A@mail.gmail.com>
 <74c69c3bb4498099a195ec890e1a7896@manjaro.org>
 <4498852466ec9b49cc5288c5f091b3ae@manjaro.org>
 <CAKGbVbucXy+5Sn9U55DY69Lw9bQ+emmN1G4L8DQcUC1wdFSP_Q@mail.gmail.com>
 <7d1c35d6829f00fa62ea39b6fee656be@manjaro.org>
In-Reply-To: <7d1c35d6829f00fa62ea39b6fee656be@manjaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 26 Jul 2024 16:54:52 +0800
Message-ID: <CAKGbVbukwz5naLwe7oW+UU8Ghtz6PmTjZ8k0PNZr2+h1Y20Qzw@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Mark simple_ondemand governor as softdep
To: Dragan Simic <dsimic@manjaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 linux-kernel@vger.kernel.org, Philip Muller <philm@manjaro.org>, 
 Oliver Smith <ollieparanoid@postmarketos.org>,
 Daniel Smith <danct12@disroot.org>, stable@vger.kernel.org
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

On Fri, Jul 26, 2024 at 4:03=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Qiang Yu,
>
> On 2024-07-26 08:07, Qiang Yu wrote:
> > Yeah, I agree weakdep is a better choice here. It solves the confusion
> > of softdep which the depend module is optional.
>
> Thanks, I'm glad that you agree.
>
> > But I prefer using weakdep directly instead of creating an aliasing of
> > it which has no actual difference.
>
> Just checking, did you have a chance to read what I wrote in my earlier
> response on the linux-modules mailing list, [7] which includes a rather
> elaborate explanation of the intent behind MODULE_HARDDEP being
> currently
> just a proposed alias for MODULE_WEAKDEP?  It also describes why using
> this alias might save use some time and effort in the future.
>
> [7]
> https://lore.kernel.org/linux-modules/0720a516416a92a8f683053d37ee9481@ma=
njaro.org/
>
Yeah, I've seen that mail. But I haven't seen clearly how weakdep will chan=
ge
in the future which could break our usage here. As an interface exposed to =
other
users, I expect it should be stable.

> > On Thu, Jul 25, 2024 at 4:21=E2=80=AFPM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >>
> >> Hello Qiang,
> >>
> >> On 2024-06-26 08:49, Dragan Simic wrote:
> >> > On 2024-06-26 03:11, Qiang Yu wrote:
> >> >> On Wed, Jun 26, 2024 at 2:15=E2=80=AFAM Dragan Simic <dsimic@manjar=
o.org>
> >> >> wrote:
> >> >>> Just checking, any further thoughts about this patch?
> >> >>>
> >> >> I'm OK with this as a temp workaround because it's simple and do no
> >> >> harm
> >> >> even it's not perfect. If no other better suggestion for short term=
,
> >> >> I'll submit
> >> >> this at weekend.
> >> >
> >> > Thanks.  Just as you described it, it's far from perfect, but it's
> >> > still
> >> > fine until there's a better solution, such as harddeps.  I'll contin=
ue
> >> > my
> >> > research about the possibility for adding harddeps, which would
> >> > hopefully
> >> > replace quite a few instances of the softdep (ab)use.
> >>
> >> Another option has become available for expressing additional module
> >> dependencies, weakdeps. [1][2]  Long story short, weakdeps are similar
> >> to softdeps, in the sense of telling the initial ramdisk utilities to
> >> include additional kernel modules, but weakdeps result in no module
> >> loading being performed by userspace.
> >>
> >> Maybe "weak" isn't the best possible word choice (arguably, "soft"
> >> also
> >> wasn't the best word choice), but weakdeps should be a better choice
> >> for
> >> use with Lima and governor_simpleondemand, because weakdeps provide
> >> the
> >> required information to the utilities used to generate initial
> >> ramdisk,
> >> while the actual module loading is left to the kernel.
> >>
> >> The recent addition of weakdeps renders the previously mentioned
> >> harddeps
> >> obsolete, because weakdeps actually do what we need.  Obviously,
> >> "weak"
> >> doesn't go along very well with the actual nature of the dependency
> >> between
> >> Lima and governor_simpleondemand, but it's pretty much just the
> >> somewhat
> >> unfortunate word choice.
> >>
> >> The support for weakdeps has been already added to the kmod [3][4] and
> >> Dracut [5] userspace utilities.  I'll hopefully add support for
> >> weakdeps
> >> to mkinitcpio [6] rather soon.
> >>
> >> Maybe we could actually add MODULE_HARDDEP() as some kind of syntactic
> >> sugar, which would currently be an alias for MODULE_WEAKDEP(), so the
> >> actual hard module dependencies could be expressed properly, and
> >> possibly
> >> handled differently in the future, with no need to go back and track
> >> all
> >> such instances of hard module dependencies.
> >>
> >> With all this in mind, here's what I'm going to do:
> >>
> >> 1) Submit a patch that adds MODULE_HARDDEP() as syntactic sugar
> >> 2) Implement support for weakdeps in Arch Linux's mkinitcpio [6]
> >> 3) Depending on what kind of feedback the MODULE_HARDDEP() patch
> >> receives,
> >>     I'll submit follow-up patches for Lima and Panfrost, which will
> >> swap
> >>     uses of MODULE_SOFTDEP() with MODULE_HARDDEP() or MODULE_WEAKDEP()
> >>
> >> Looking forward to your thoughts.
> >>
> >> [1]
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/include/linux/module.h?id=3D61842868de13aa7fd7391c626e889f4d6f1450bf
> >> [2]
> >> https://lore.kernel.org/linux-kernel/20240724102349.430078-1-jtornosm@=
redhat.com/T/#u
> >> [3]
> >> https://github.com/kmod-project/kmod/commit/05828b4a6e9327a63ef94df544=
a042b5e9ce4fe7
> >> [4]
> >> https://github.com/kmod-project/kmod/commit/d06712b51404061eef92cb275b=
8303814fca86ec
> >> [5]
> >> https://github.com/dracut-ng/dracut-ng/commit/8517a6be5e20f4a6d87e55fc=
e35ee3e29e2a1150
> >> [6] https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio
