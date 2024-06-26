Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A262917573
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 03:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1864F10E280;
	Wed, 26 Jun 2024 01:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mrCoJBLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9010E134;
 Wed, 26 Jun 2024 01:11:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso7752951a12.3; 
 Tue, 25 Jun 2024 18:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719364280; x=1719969080; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asyx3WntG4OThCRcShDwfSCXWLgRQ+/Uaa7W33Vqtyk=;
 b=mrCoJBLXc3Lwu1VZtBTFmm1p22NLW82i1xs02C3h2ZvPqBY+U1SqFQMTLM7uitYfFI
 uYzkDk+egUv3k1jryOleFiwEe8ivpwLm05EGge6R0k5lDm3ay9pP037+1qAuW95tAgO5
 q/hovmVXNcrcIR8vg0bNvtrk9bw66CAQmP3W5dYyLNiG23QxUlEEWzgs21Xs7382mAqD
 OlKdU4IsOcZ/pDLqL4VeEyBLp4kjEOSHmsKsyN2ybAMzEfR78+KhVBiWDuNiH40HcMBj
 4q+bKjJQbI3hjcKBalAI8vMDXCzARw3D+YYYplzwLaZWt+Q6l1nwo8SGLSGynQMBFQJI
 lIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719364280; x=1719969080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asyx3WntG4OThCRcShDwfSCXWLgRQ+/Uaa7W33Vqtyk=;
 b=LoAGIWEbRNGgTcwXVBSz4wgi4ffGtGG9eVGLuEPRebjfmS2fhfqfdxbCMVR9AX6FK8
 EZQ7RpDoPAcSmFhZPC8l3P1V1Wihf+5NjKxL47DVxaoXkoLEN78sewyk/kLhKO8mMYW9
 fytZ5auFSyWzjCygxbQPwFTRcW2CFkstj9wGVu5kk5lv8Vp1zsdAezIBybDugXANTLtW
 dPaMqtXmeSzXJGktNx3Ho0EqWh+BpwyZ8d2g3p/PA/cuxpv9R9rp6LH3tFkGZ/3oKAMQ
 GNNrYwiVmwS2dhGQKVvmKFlJR8dTeo7AaHd+DeVYDXoFdqlpWmGrE8GzLOieFNX85dSv
 dlBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI7w2WE+qFGPCB43cidWWpw+/N6J7sCbuIdDpCVIvj16viOqFWu7vDAuh/z7NO6Atxtt3djC9qgoCeow1YB9MKyAm3XvcC3jWZV14+ILAu3A8AAzQFlKmKhBa4oC81vL23If03MQRKi9PAAw==
X-Gm-Message-State: AOJu0YxsmzLzi85W+jiXqF0JTbxasrSwAUxXmbJ261t3Og6zv0GdyTHG
 M37rJMTNnj+P8HXD5CXUkglNlSTYAjg6WF9o8PnXZrXJM5b93UAtOzjTrmX5GYzWSldRf2X7aqr
 ikHKFP97pGxks4cGSuzA+1bHzDmg=
X-Google-Smtp-Source: AGHT+IFGmha0T9jNof/KuwAohpk4SnLJgwELl6O3jUe3eisCuLf5J9RjYsaDsvAcLzroKTOUT2WgmJb2X6FeYvkzxHQ=
X-Received: by 2002:a50:cd93:0:b0:57a:2fe7:6699 with SMTP id
 4fb4d7f45d1cf-57d4a281750mr7434714a12.14.1719364279832; Tue, 25 Jun 2024
 18:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <fdaf2e41bb6a0c5118ff9cc21f4f62583208d885.1718655070.git.dsimic@manjaro.org>
 <CAKGbVbs8VmCXVOHbhkCYEHNJiKWwy10p0SV9J09h2h7xjs7hUg@mail.gmail.com>
 <CAKGbVbsM4rCprWdp+aGXE-pvCkb6N7weUyG2z4nXqFpv+y=LrA@mail.gmail.com>
 <20240618-great-hissing-skink-b7950e@houat>
 <4813a6885648e5368028cd822e8b2381@manjaro.org>
 <457ae7654dba38fcd8b50e38a1275461@manjaro.org>
 <2c072cc4bc800a0c52518fa2476ef9dd@manjaro.org>
In-Reply-To: <2c072cc4bc800a0c52518fa2476ef9dd@manjaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Wed, 26 Jun 2024 09:11:07 +0800
Message-ID: <CAKGbVbsGm7emEPzGuf0Xn5k22Pbjfg9J9ykJHtvDF3SacfDg6A@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 2:15=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello everyone,
>
> Just checking, any further thoughts about this patch?
>
I'm OK with this as a temp workaround because it's simple and do no harm
even it's not perfect. If no other better suggestion for short term, I'll s=
ubmit
this at weekend.

> On 2024-06-18 21:22, Dragan Simic wrote:
> > On 2024-06-18 12:33, Dragan Simic wrote:
> >> On 2024-06-18 10:13, Maxime Ripard wrote:
> >>> On Tue, Jun 18, 2024 at 04:01:26PM GMT, Qiang Yu wrote:
> >>>> On Tue, Jun 18, 2024 at 12:33=E2=80=AFPM Qiang Yu <yuq825@gmail.com>=
 wrote:
> >>>> >
> >>>> > I see the problem that initramfs need to build a module dependency=
 chain,
> >>>> > but lima does not call any symbol from simpleondemand governor mod=
ule.
> >>>> > softdep module seems to be optional while our dependency is hard o=
ne,
> >>>> > can we just add MODULE_INFO(depends, _depends), or create a new
> >>>> > macro called MODULE_DEPENDS()?
> >>
> >> I had the same thoughts, because softdeps are for optional module
> >> dependencies, while in this case it's a hard dependency.  Though,
> >> I went with adding a softdep, simply because I saw no better option
> >> available.
> >>
> >>>> This doesn't work on my side because depmod generates modules.dep
> >>>> by symbol lookup instead of modinfo section. So softdep may be our
> >>>> only
> >>>> choice to add module dependency manually. I can accept the softdep
> >>>> first, then make PM optional later.
> >>
> >> I also thought about making devfreq optional in the Lima driver,
> >> which would make this additional softdep much more appropriate.
> >> Though, I'm not really sure that's a good approach, because not
> >> having working devfreq for Lima might actually cause issues on
> >> some devices, such as increased power consumption.
> >>
> >> In other words, it might be better to have Lima probing fail if
> >> devfreq can't be initialized, rather than having probing succeed
> >> with no working devfreq.  Basically, failed probing is obvious,
> >> while a warning in the kernel log about no devfreq might easily
> >> be overlooked, causing regressions on some devices.
> >>
> >>> It's still super fragile, and depends on the user not changing the
> >>> policy. It should be solved in some other, more robust way.
> >>
> >> I see, but I'm not really sure how to make it more robust?  In
> >> the end, some user can blacklist the simple_ondemand governor
> >> module, and we can't do much about it.
> >>
> >> Introducing harddeps alongside softdeps would make sense from
> >> the design standpoint, but the amount of required changes wouldn't
> >> be trivial at all, on various levels.
> >
> > After further investigation, it seems that the softdeps have
> > already seen a fair amount of abuse for what they actually aren't
> > intended, i.e. resolving hard dependencies.  For example, have
> > a look at the commit d5178578bcd4 (btrfs: directly call into
> > crypto framework for checksumming) [1] and the lines containing
> > MODULE_SOFTDEP() at the very end of fs/btrfs/super.c. [2]
> >
> > If a filesystem driver can rely on the abuse of softdeps, which
> > admittedly are a bit fragile, I think we can follow the same
> > approach, at least for now.
> >
> > With all that in mind, I think that accepting this patch, as well
> > as the related Panfrost patch, [3] should be warranted.  I'd keep
> > investigating the possibility of introducing harddeps in form
> > of MODULE_HARDDEP() and the related support in kmod project,
> > similar to the already existing softdep support, [4] but that
> > will inevitably take a lot of time, both for implementing it
> > and for reaching various Linux distributions, which is another
> > reason why accepting these patches seems reasonable.
> >
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dd5178578bcd4
> > [2]
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/btrfs/super.c#n2593
> > [3]
> > https://lore.kernel.org/dri-devel/4e1e00422a14db4e2a80870afb704405da16f=
d1b.1718655077.git.dsimic@manjaro.org/
> > [4]
> > https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=3D=
49d8e0b59052999de577ab732b719cfbeb89504d
