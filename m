Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE432410882
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 22:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3DC6E102;
	Sat, 18 Sep 2021 20:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660F6E102
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 20:13:44 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bi4so19005371oib.9
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 13:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stapelberg.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V1jiy9G5MC1aNJdoc13LI28JYNtg6cEuj8WNcYbnF9A=;
 b=SFrkyIVHplpQ4iOCGwFqH57JyNKVzPyCPHkb1qCsrADyuRHYoJD711slax6jbFWSms
 NQAaP8tY5paG7sivh3EwhGQsXGjGdp5nOuLfBiVcWhYlIzi50pVJj57CH5jb7Yxsf9it
 HJ0+cu5qhNVkeI9+v77fasUsuiDFOmoOo+o15vRzVVRgUr6Abn6/62DBO8J4jocuY4t7
 47yJWJyEli9/aS3v5iqUo/QFW7fwSZg84Ycm4AoagjgM5+OOWuevP3CRkJsuIJwXK08Z
 8E9u/0RzRBr8FochL/wfyXtljvNePP5NZFFCIVHpG/rUT4er0CVxMLok1j/1SIHmVUEs
 zmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V1jiy9G5MC1aNJdoc13LI28JYNtg6cEuj8WNcYbnF9A=;
 b=6wOK9kiZeo04a6/qwETi8gSth3rLTdNlcNeAsDMayjlAIkK8KmZeEhgx8RslFS2gxL
 yIKF1Aa/4jaO1Jc06zg5Hfl1bHEcEdbcF7TOUQ6CfGfv5KWLfTDJL1f3W9Tgx3E1kMOk
 uEvLLgOnWWTiKZRiNSS87nC+0ahIPQy/sAYzK+5gE9Wyw0CR+l5yNmPUYAL61E5l03xt
 V7TS1w2Jvx0ZA/Fwjk2EFvTaecgtTPl+uNyRq21gRZm4jW8BWiuibMAsnM9Jq5xgNjwX
 KhPO9/PTUdQZp+WDZXpw8sGpdJ+clR6C/bWjM00u9spaLDGzEdP2ZF3FVpsIwdMr3FHg
 03eQ==
X-Gm-Message-State: AOAM530aqTlWKO5WpK9Iemp6nc0GuK4D5JvmU/B4oPKsHDx+zZX6TdjR
 Bl30RCfIjZrd381sUtznTxcWXZQhqH/fn85mrFZrFA==
X-Google-Smtp-Source: ABdhPJz/YS8WnvZetVUlXW6HAtLGh8GYGXCL3lHa/oEOgSPeiTsLR/5IYSTZhcvPQpsLL4ADJyPzq560c8yr+xCjG0I=
X-Received: by 2002:aca:ab51:: with SMTP id u78mr8876037oie.177.1631996023279; 
 Sat, 18 Sep 2021 13:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
In-Reply-To: <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
From: Michael Stapelberg <michael@stapelberg.ch>
Date: Sat, 18 Sep 2021 22:13:27 +0200
Message-ID: <CANnVG6mOWLeLHtFrAA9zWzZRtZ6+E1EYYW5+ekwC-=rAEcB71w@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
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

On Sat, 18 Sept 2021 at 21:24, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 18, 2021 at 2:18 AM Michael Stapelberg
> <michael@stapelberg.ch> wrote:
> >
> > torvalds at linux-foundation.org (Linus Torvalds) writes:
> > > Did I fix it up correctly? Who knows. The code makes more sense to me
> > > now and seems valid. But I really *really* want to stress how locking
> > > is important.
> >
> > As far as I can tell, this merge conflict resolution made my Raspberry
> > Pi 3 hang on boot.
>
> Ok, that's a different merge issue than the locking one (which is
> about the amd ttm code).

Ah, my apologies for getting these mixed up!

>
> But the VC4 driver did have changes close to each other in the hdmi
> detection and clock setting code.
>
> And it doesn't seem to be just RPi3, there was a report back a couple
> of weeks ago about RPi4 also having regressed (with an Ubuntu
> install). That one was an oops in vc4_hdmi_audio_prepare(). I don't
> know if that got resolved, I heard nothing about it after the report.
>
> So there's something seriously wrong in VC4 space.
>
> The main issue seems to be the runtime power management changes. As
> far as I can tell, the commits that didn't come in through that drm
> pull were these two
>
>   9984d6664ce9 ("drm/vc4: hdmi: Make sure the controller is powered in de=
tect")
>   411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to runtime_pm")
>
> Michael - do things work if you revert those two (sadly, they don't
> revert cleanly exactly _because_ of the other changes in the same
> area)?

Reverting only 9984d6664ce9 is not sufficient, but reverting both
9984d6664ce9 and 411efa18e4b0 does indeed make my Raspberry Pi 3 boot
again!

Thanks for identifying the faulty commits. Please let me know if any
of y=E2=80=99all want me to test anything else in the process to get this
fixed for the next kernel release (or perhaps even a minor release)?

>
> Maxime?
>
>              Linus



--=20
Best regards,
Michael
