Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E3691D109
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 12:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD5110E0BE;
	Sun, 30 Jun 2024 10:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e4cYsABx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9929710E0BE;
 Sun, 30 Jun 2024 10:04:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57cd26347d3so2505079a12.1; 
 Sun, 30 Jun 2024 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719741885; x=1720346685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o617bWQRGL7AXpKHgsvXTyzvAX01tVJwbwYGMP9yg4c=;
 b=e4cYsABxOANwwWqicDshoJKxqqVtrScjliNZaczGVCPnNsg4MiVOBQMw6bG/EIcg0t
 YXDRhI3pyCYj5nWJohXdTs08b8AwcmtatXgKiBDxNjt245suBb1KPl27W3WXxx26qtgd
 lo0aB1XW4WvUmz/EshacBjOXTqmdrs1g++XCNOUnt87p/WhnpN6IsYpjer9tyqXuWU2e
 TKOxleciIto91imPjqQEzTkwuhrjFkXXX0oLCmJRDNyFX58GChK7NjXA03wYrBnhWYg7
 JSsrmdSspCsyCbtV1CrvvqbE7j934UbhFhmRt2UhqiE+Tu8wQcv4ACBzcy2XiGVBH1RS
 sdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719741885; x=1720346685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o617bWQRGL7AXpKHgsvXTyzvAX01tVJwbwYGMP9yg4c=;
 b=ZTgbS6OVDHUZSBVRI9KC1GenjjIynTbkh/xprRoZbPsukOxnmAY+ihG+GahZURrGP+
 TbdfwKAw7D/e/XeyO9Q2m1bQGofM3+6PNn4Ymh+fCKjnx8zD5uLqWE6v5L3kfZUyNyst
 4UCdiZWSK4XamU3EsJnRR3K/hxYeRksXCD6uNSkL0gfJNWem7FEhuTjOmjsRfor8SyYi
 Ig0oPvcjml0QQOqL8B9CzxyNABSx215+SU2fWjfHKvflIPRmkmWHREf4COJAoZEdmYXz
 4Eud5ku7MbSems14gMtLHwypfM3b+wmW/kkFZcW18ivsZC2nFxjohwgYLxaiwa8ZLqTF
 HUMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJpHhgmbkFK8ZVansIVZuXQvgaXRoVTobXMrcblpbOUzj2leSqa6HhHhEroLxadEoBZGB6X/MrWwu2jVn3EW3aXenEt45AaLnMyqzuEnX0VzsObHcDpQLiccUYeh7EvQ4CTmR98lYtRd7MQA==
X-Gm-Message-State: AOJu0Yx8Tn8Mw/mtfob52esNW3bm9SiKKJS6nJ+Q0dNQRvP4Pmf041pv
 mknIn3OL+Wjg7m2j3Ch4qgckU7dXk8D7VBo+tgUd4w6RrtHfkFhwKvJauOJnwu5jetI2j0dNm75
 xFCJkyIS7d6kIE4DDC1+Up1B1Rr8=
X-Google-Smtp-Source: AGHT+IFPqEU+V1VDRuCLs1LVF3C/KXP2R6B7s5PTM8+z/ve2MiGYbV7HExEQvJFtLMY2yJcfKaeSiA78h2EcS2EpMnE=
X-Received: by 2002:a17:906:bc90:b0:a6f:f1bc:21ce with SMTP id
 a640c23a62f3a-a75144f666amr161051366b.47.1719741884561; Sun, 30 Jun 2024
 03:04:44 -0700 (PDT)
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
In-Reply-To: <74c69c3bb4498099a195ec890e1a7896@manjaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 30 Jun 2024 18:04:31 +0800
Message-ID: <CAKGbVbvDdLMAS9Z4yDtY2gmaqM9SGgk7z38Kb0EzWX_y42XE3Q@mail.gmail.com>
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

Applied to drm-misc-next.

On Wed, Jun 26, 2024 at 2:49=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Qiang,
>
> On 2024-06-26 03:11, Qiang Yu wrote:
> > On Wed, Jun 26, 2024 at 2:15=E2=80=AFAM Dragan Simic <dsimic@manjaro.or=
g>
> > wrote:
> >>
> >> Hello everyone,
> >>
> >> Just checking, any further thoughts about this patch?
> >>
> > I'm OK with this as a temp workaround because it's simple and do no
> > harm
> > even it's not perfect. If no other better suggestion for short term,
> > I'll submit
> > this at weekend.
>
> Thanks.  Just as you described it, it's far from perfect, but it's still
> fine until there's a better solution, such as harddeps.  I'll continue
> my
> research about the possibility for adding harddeps, which would
> hopefully
> replace quite a few instances of the softdep (ab)use.
>
> >> On 2024-06-18 21:22, Dragan Simic wrote:
> >> > On 2024-06-18 12:33, Dragan Simic wrote:
> >> >> On 2024-06-18 10:13, Maxime Ripard wrote:
> >> >>> On Tue, Jun 18, 2024 at 04:01:26PM GMT, Qiang Yu wrote:
> >> >>>> On Tue, Jun 18, 2024 at 12:33=E2=80=AFPM Qiang Yu <yuq825@gmail.c=
om> wrote:
> >> >>>> >
> >> >>>> > I see the problem that initramfs need to build a module depende=
ncy chain,
> >> >>>> > but lima does not call any symbol from simpleondemand governor =
module.
> >> >>>> > softdep module seems to be optional while our dependency is har=
d one,
> >> >>>> > can we just add MODULE_INFO(depends, _depends), or create a new
> >> >>>> > macro called MODULE_DEPENDS()?
> >> >>
> >> >> I had the same thoughts, because softdeps are for optional module
> >> >> dependencies, while in this case it's a hard dependency.  Though,
> >> >> I went with adding a softdep, simply because I saw no better option
> >> >> available.
> >> >>
> >> >>>> This doesn't work on my side because depmod generates modules.dep
> >> >>>> by symbol lookup instead of modinfo section. So softdep may be ou=
r
> >> >>>> only
> >> >>>> choice to add module dependency manually. I can accept the softde=
p
> >> >>>> first, then make PM optional later.
> >> >>
> >> >> I also thought about making devfreq optional in the Lima driver,
> >> >> which would make this additional softdep much more appropriate.
> >> >> Though, I'm not really sure that's a good approach, because not
> >> >> having working devfreq for Lima might actually cause issues on
> >> >> some devices, such as increased power consumption.
> >> >>
> >> >> In other words, it might be better to have Lima probing fail if
> >> >> devfreq can't be initialized, rather than having probing succeed
> >> >> with no working devfreq.  Basically, failed probing is obvious,
> >> >> while a warning in the kernel log about no devfreq might easily
> >> >> be overlooked, causing regressions on some devices.
> >> >>
> >> >>> It's still super fragile, and depends on the user not changing the
> >> >>> policy. It should be solved in some other, more robust way.
> >> >>
> >> >> I see, but I'm not really sure how to make it more robust?  In
> >> >> the end, some user can blacklist the simple_ondemand governor
> >> >> module, and we can't do much about it.
> >> >>
> >> >> Introducing harddeps alongside softdeps would make sense from
> >> >> the design standpoint, but the amount of required changes wouldn't
> >> >> be trivial at all, on various levels.
> >> >
> >> > After further investigation, it seems that the softdeps have
> >> > already seen a fair amount of abuse for what they actually aren't
> >> > intended, i.e. resolving hard dependencies.  For example, have
> >> > a look at the commit d5178578bcd4 (btrfs: directly call into
> >> > crypto framework for checksumming) [1] and the lines containing
> >> > MODULE_SOFTDEP() at the very end of fs/btrfs/super.c. [2]
> >> >
> >> > If a filesystem driver can rely on the abuse of softdeps, which
> >> > admittedly are a bit fragile, I think we can follow the same
> >> > approach, at least for now.
> >> >
> >> > With all that in mind, I think that accepting this patch, as well
> >> > as the related Panfrost patch, [3] should be warranted.  I'd keep
> >> > investigating the possibility of introducing harddeps in form
> >> > of MODULE_HARDDEP() and the related support in kmod project,
> >> > similar to the already existing softdep support, [4] but that
> >> > will inevitably take a lot of time, both for implementing it
> >> > and for reaching various Linux distributions, which is another
> >> > reason why accepting these patches seems reasonable.
> >> >
> >> > [1]
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3Dd5178578bcd4
> >> > [2]
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/fs/btrfs/super.c#n2593
> >> > [3]
> >> > https://lore.kernel.org/dri-devel/4e1e00422a14db4e2a80870afb704405da=
16fd1b.1718655077.git.dsimic@manjaro.org/
> >> > [4]
> >> > https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=
=3D49d8e0b59052999de577ab732b719cfbeb89504d
