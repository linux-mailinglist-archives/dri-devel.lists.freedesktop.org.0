Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69C410B31
	for <lists+dri-devel@lfdr.de>; Sun, 19 Sep 2021 13:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839AE6E1B6;
	Sun, 19 Sep 2021 11:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799636E1B6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 11:05:43 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id y144so32804121qkb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Sep 2021 04:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PzL8+kiUIjQsb+femzqQPdbqJkdPqzOqlOdexgwKB/0=;
 b=C05vDGjCaRhmeNmKKihvgJzzyq9pukpbsBg0XeDyta1snq2+svKjuMWwHGuY28dw4h
 aR0jj+or3Sa5AQbM+oQoX2UuIWFHf7A5z79TPuV914i4qwTex8+KV3tjVbM6k3HLEcu0
 0+syPWiCPhmYIhz3iTE71pceTGBAFveGnIFF25IcpLU9epOknLXj9cjCMjrYo9H328S7
 N9/cMmaaAZnXoHDH74XqVk8/hUri4xMnaDJT4TfM1FnFU/Vygo51Qe7j/xSpZgGmiqKR
 5FoB1p//J/GdJ/65iQ16x7tCAGatCVD3CCcgzQ3qpGK4pADhjXkQ41vGnA4esDPRBW8R
 +WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PzL8+kiUIjQsb+femzqQPdbqJkdPqzOqlOdexgwKB/0=;
 b=N1Jh+Y+Sue7SXSYCIEeUqWyMsVfnJgm27iEr126zuYDX1exZfG+tqBGxOHfwdfjZXT
 5z+u0rx9HJPwdD9nLs1pff70QRxQf5Nru4fr+6f3b8CZmtlm6OsCIwlUvsah+7r4lC7z
 RoXT1/nkMb7G+OXX61aoIt6Cyx+hMky3soRQ/MQWoTZdBPhCmy87q80uMtWbi3XKyKTX
 0uUTqlYxsb49b6z0kodSt8fTmtBUUOCBm9T5CQCmTIaICXOiCgI+BDDYmOGL4b9x4wRY
 gcnagiPImR6+jB0qSEpUoRgVmvVjLAjikp7RiFQtY0UJmT2N9Fn9c3+R1rTr1wtcnxI4
 xovw==
X-Gm-Message-State: AOAM533AdrcfwM73aDRkxHTHTuifzFsp/FKkUc95l3vzGO2PZrfNkP7t
 v29gVV/xOzEiihieOedQp4SLfZDl9HnuQmF2/EU=
X-Google-Smtp-Source: ABdhPJwursPMmKC92QU1moT7U6x/JHXQ3sMSb3Qott7w7yM2BQQT4LRPgmk0OWN1CpEIuSQag1H4gCzZcIrkwL1EumU=
X-Received: by 2002:a25:804:: with SMTP id 4mr24026698ybi.346.1632049542334;
 Sun, 19 Sep 2021 04:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzR4BqTtamrTy4T_XV7E0fUNyduaVtH5zAi=sqwX_3udg@mail.gmail.com>
 <CAHk-=whgcN6MEyZBgK3UZRw=vwd1CAAK9+rafmZ2vsOiGpsMSA@mail.gmail.com>
 <871r5mp7h2.fsf@midna.i-did-not-set--mail-host-address--so-tickle-me>
 <CAHk-=wjuN8afLz-QnefNgt2qKAOY7cez_63oAkdDmTu4Wscv_g@mail.gmail.com>
 <CADVatmP2MxpV8722WrEcPqHn=0CTsU6X64OsbZifmUrhiiTk4Q@mail.gmail.com>
 <CAHk-=wiun6vK5k9NpRiaF=La2NOqq7Cph7Lhd8XiyT1vQWR27w@mail.gmail.com>
 <CADVatmNTKof8jMyx4xx9b2fQ=zVb2ZtXZh1uoYE2R-6DkaHj8w@mail.gmail.com>
 <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjZ_EXdfongpgRV3BrrNm6CX6CmKYT5TixK-nOsaGG81Q@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 19 Sep 2021 12:05:06 +0100
Message-ID: <CADVatmN5EpRshGEPS_JozbFQRXg5w_8LFB3OMP1Ai-ghxd3w4g@mail.gmail.com>
Subject: Re: [git pull] drm for 5.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Stapelberg <michael@stapelberg.ch>,
 Maxime Ripard <maxime@cerno.tech>, 
 Emma Anholt <emma@anholt.net>, dri-devel <dri-devel@lists.freedesktop.org>, 
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

Hi Linus,

On Sun, Sep 19, 2021 at 12:06 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Sep 18, 2021 at 3:48 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > Also, I have now tested by reverting those two commits and I still get
> > the same trace on rpi4.
>
> Ok. I'm afraid we really need to have the VC4 people figure it out - I
> count do the two reverts that are reported to fix the RPi3 issue, but
> it looks like the RPi4 pulseaudio issue needs something else.
>
> Any chance you could bisect that?

Done, here is the bisect log:

# bad: [7c636d4d20f8c5acfbfbc60f326fddb0e1cf5daa] Merge tag 'dt-5.15'
of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
# good: [9e9fb7655ed585da8f468e29221f0ba194a5f613] Merge tag
'net-next-5.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect start '7c636d4d20f8' '9e9fb7655ed5' '--' 'drivers/gpu/drm/vc4/'
# good: [776efe800feda95a29cefecce1ce36cc27d70b29] drm/vc4: hdmi: Drop
devm interrupt handler for hotplug interrupts
git bisect good 776efe800feda95a29cefecce1ce36cc27d70b29
# bad: [588b3eee528873d73bf777f329d35b2e65e24777] Merge tag
'drm-misc-next-2021-07-16' of
git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad 588b3eee528873d73bf777f329d35b2e65e24777
# bad: [27da370e0fb343a0baf308f503bb3e5dcdfe3362] drm/vc4: hdmi:
Remove drm_encoder->crtc usage
git bisect bad 27da370e0fb343a0baf308f503bb3e5dcdfe3362
# good: [44fe9f90eb9d2533d049b4ba09540eed6cad9f49] drm/vc4: hdmi: Only
call into DRM framework if registered
git bisect good 44fe9f90eb9d2533d049b4ba09540eed6cad9f49
# first bad commit: [27da370e0fb343a0baf308f503bb3e5dcdfe3362]
drm/vc4: hdmi: Remove drm_encoder->crtc usage

And indeed, reverting 27da370e0fb3 ("drm/vc4: hdmi: Remove
drm_encoder->crtc usage") on top of d4d016caa4b8 ("alpha: move
__udiv_qrnnd library function to arch/alpha/lib/")
has fixed the error.


-- 
Regards
Sudip
