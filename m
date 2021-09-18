Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B8410859
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 21:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345C96E0EC;
	Sat, 18 Sep 2021 19:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EE46E0EC
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 19:24:59 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id g1so48387550lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 12:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkBEYEtCuP5aFNaZkn24F11fxynpPV1GDOA6+KlC7I0=;
 b=NvbjjHi/ZAK6N5BToUlr9+DnzcZz/YSWlX91/KNSQT63s4Q2ktAPVmllpU9AkpjBOb
 Oz7GAjvDhDJrC9k7i8oJAocR5/gNid6fxwFWm5BcBvjDRX+jmpNQaFBGuNaraDAuK/LU
 zg5No2O/gV6FMsDxLGT9x6jyJZZvNbHKWtnq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkBEYEtCuP5aFNaZkn24F11fxynpPV1GDOA6+KlC7I0=;
 b=bmVw+n95IUjm1f+3kNu8h3HXj6FKG1sgVwxYCGe6yIU0zEVMvhApymfTyqud0g+euq
 PzGCjV+pO1rcPv6rZ8/jMGXqYGGi0p1V817vJ2cCtwjNc5ZF+6tQkYX0hi7s5JJVbjCi
 0CmCB3CsudG56GJW9sjVcwLY+2sL5jkpq/JvOEAzZ5xE4jHc99MeXReAb4hSSmB4Y2l7
 Ysak21pZN7uvfpvHJNR4+ibliuV5Z7mKXMlnX16R+GPnpORl7auMGILZ7IR/9rJkSmXW
 Q6/40wQu+zQz31MpiPFPEaVEkD181p9tUZDSwRNdZHFzsPOjiBxXGHmD/susBlEUf7D+
 VKVA==
X-Gm-Message-State: AOAM533SZ8JN7UMfeWBD+2ZnqPwtmcl5jm2OpU89xYnaKpJUy7YYbpt4
 uXUaAe+NrRjz5gT69AW9Y1qd8zt6/KN7plJXZIY=
X-Google-Smtp-Source: ABdhPJypeWd62INr7UDuGZDi97FynlGOTySy+xBPXlP13ofC4XcSTcZSqhSv1G2eOl8E631e5XXzyg==
X-Received: by 2002:a05:6512:b27:: with SMTP id
 w39mr13668991lfu.129.1631993097733; 
 Sat, 18 Sep 2021 12:24:57 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44])
 by smtp.gmail.com with ESMTPSA id a11sm840774lfo.5.2021.09.18.12.24.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 12:24:57 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id z24so21585265lfu.13
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Sep 2021 12:24:56 -0700 (PDT)
X-Received: by 2002:a19:ae15:: with SMTP id f21mr12842156lfc.402.1631993096626; 
 Sat, 18 Sep 2021 12:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 18 Sep 2021 12:24:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
Message-ID: <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Michael Stapelberg <michael@stapelberg.ch>,
 Maxime Ripard <maxime@cerno.tech>, 
 Emma Anholt <emma@anholt.net>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Felix Kuehling <felix.kuehling@amd.com>, Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Sep 18, 2021 at 2:18 AM Michael Stapelberg
<michael@stapelberg.ch> wrote:
>
> torvalds at linux-foundation.org (Linus Torvalds) writes:
> > Did I fix it up correctly? Who knows. The code makes more sense to me
> > now and seems valid. But I really *really* want to stress how locking
> > is important.
>
> As far as I can tell, this merge conflict resolution made my Raspberry
> Pi 3 hang on boot.

Ok, that's a different merge issue than the locking one (which is
about the amd ttm code).

But the VC4 driver did have changes close to each other in the hdmi
detection and clock setting code.

And it doesn't seem to be just RPi3, there was a report back a couple
of weeks ago about RPi4 also having regressed (with an Ubuntu
install). That one was an oops in vc4_hdmi_audio_prepare(). I don't
know if that got resolved, I heard nothing about it after the report.

So there's something seriously wrong in VC4 space.

The main issue seems to be the runtime power management changes. As
far as I can tell, the commits that didn't come in through that drm
pull were these two

  9984d6664ce9 ("drm/vc4: hdmi: Make sure the controller is powered in detect")
  411efa18e4b0 ("drm/vc4: hdmi: Move the HSM clock enable to runtime_pm")

Michael - do things work if you revert those two (sadly, they don't
revert cleanly exactly _because_ of the other changes in the same
area)?

Maxime?

             Linus
