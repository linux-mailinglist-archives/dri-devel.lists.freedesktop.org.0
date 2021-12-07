Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6A46B887
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 11:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF72AB8BB;
	Tue,  7 Dec 2021 10:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177CAB8E2
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 10:12:10 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso17384009otj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wE37XgFFuURouMpTDq3V8x3RTSt4lM6vt+lYQCj7/GI=;
 b=QGH9/si30Blm2O4S79KpRoukjvFlIwH/EVW6hGu1aRF2bJxxx2PeTLg66cLLeBh3nh
 NPWDZ1EQEafv4sYGe4fDnzU8ZPaJx4Bf8vSsyXCSKHjCz5fnLLdbl1/k566eSuWECoBN
 GBTCYpjFdm4CvY59hpGBspQ+kMsqBBBmO6XdgntBctqXARJh5bQVHJpfh+6Jsa17HOxf
 t6bwbWIOPu7MYedmgyTpyTJm1YT9loMjx9+P+N9Jb0hhGeXJHh8BAa1Q6Q1Saq3oY3ef
 JVQ8aBMPpVTHqbFk1Bl7H5AnS+wWsuQdo0HkQi8K0EkP8lp5i3ZV4XJU2kXBcYKA3EgF
 NCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wE37XgFFuURouMpTDq3V8x3RTSt4lM6vt+lYQCj7/GI=;
 b=7koVB6Ym+ltUPsD2tQxDIzXLFydgbPF2JbTeYhD8p3l2XAPeMCcBr868o21TgUfwZt
 yEBlvecPi88ZroM0n/P6mvyNQqza1A0M2ZhUvwvBnd5aAEMBbRg6ags4R0j3Thd2Y2P7
 kuV7gzN4ADXTQw+PmDz7/WE0hcuEE8BjB4LLaDqRfqgjzOFT8uxtl78vCqEjMVgyDv/K
 yHKmENBQse77/UR8GcDYxx8eA6e1LoI5FlmIr9WKGhmBGqyxWWBbJOerldG9aEiLAXZc
 nB7kF/k3NzBE0bnClI+FD7bUCsy9rsXuZEWqtDKaHTrcDuTZ6NXuPTn8XWoUq+rnYuZr
 5hyA==
X-Gm-Message-State: AOAM530NfwsgGi3yzaTH8h4Ld4iTUrQd5oHwLfGl1mGoPkAXSSTEvqzS
 qY5om6YTGNr9/5SYAhJXnOjRSrqh8Z45IlNPF9CLGA==
X-Google-Smtp-Source: ABdhPJzycbQj6HafmAY064XdqmaLsWlJvbQzhOGTxNcYQhHWR+OVXizKLZQLfW7H/5Jpqp5zcEeG/bbhIrNu4uZxZng=
X-Received: by 2002:a9d:7e84:: with SMTP id m4mr34228451otp.102.1638871929452; 
 Tue, 07 Dec 2021 02:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
 <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
 <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
 <20211126154532.nqlqkoxa77apioxu@houat>
 <CAPpJ_edY+HXfv_rNL01piUFYaTUdFb9KEj2h-xN0MH0cYRyMTQ@mail.gmail.com>
 <20211203140355.p2aj7d3s4feubtap@houat>
In-Reply-To: <20211203140355.p2aj7d3s4feubtap@houat>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Tue, 7 Dec 2021 18:11:13 +0800
Message-ID: <CAPpJ_eeWVYyjmOSCkqJqYU9kqXvVfBZTubY2TJiruhfoVJkfdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] drm/vc4: kms: Misc fixes for HVS commits
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux@endlessos.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B412=E6=9C=883=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Nov 29, 2021 at 04:31:57PM +0800, Jian-Hong Pan wrote:
> > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Fri, Nov 19, 2021 at 06:24:34PM +0800, Jian-Hong Pan wrote:
> > > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=
=8818=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > >
> > > > > On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> > > > > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=
=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > > > > > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4:=
 kms: Convert to
> > > > > > > atomic helpers") introduced a number of issues in corner case=
s, most of them
> > > > > > > showing themselves in the form of either a vblank timeout or =
use-after-free
> > > > > > > error.
> > > > > > >
> > > > > > > These patches should fix most of them, some of them still bei=
ng debugged.
> > > > > > >
> > > > > > > Maxime
> > > > > > >
> > > > > > > Changes from v1:
> > > > > > >   - Prevent a null pointer dereference
> > > > > > >
> > > > > > > Maxime Ripard (6):
> > > > > > >   drm/vc4: kms: Wait for the commit before increasing our clo=
ck rate
> > > > > > >   drm/vc4: kms: Fix return code check
> > > > > > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > > > > > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > > > > > >   drm/vc4: kms: Don't duplicate pending commit
> > > > > > >   drm/vc4: kms: Fix previous HVS commit wait
> > > > > > >
> > > > > > >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++---------=
----------
> > > > > > >  1 file changed, 19 insertions(+), 23 deletions(-)
> > > > > >
> > > > > > I tested the v2 patches based on latest mainline kernel with RP=
i 4B.
> > > > > > System can boot up into desktop environment.
> > > > >
> > > > > So the thing that was broken initially isn't anymore?
> > > >
> > > > No.  It does not appear anymore.
> > > >
> > > > > > Although it still hit the bug [1], which might be under debuggi=
ng, I
> > > > > > think these patches LGTM.
> > > > >
> > > > > The vblank timeout stuff is a symptom of various different bugs. =
Can you
> > > > > share your setup, your config.txt, and what you're doing to trigg=
er it?
> > > >
> > > > I get the RPi boot firmware files from raspberrypi's repository at =
tag
> > > > 1.20211029 [1]
> > > > And, make system boots:
> > > > RPi firmware -> U-Boot -> Linux kernel (aarch64) with corresponding=
 DTB
> > > >
> > > > The config.txt only has:
> > > > enable_uart=3D1
> > > > arm_64bit=3D1
> > > > kernel=3Duboot.bin
> > > >
> > > > This bug can be reproduced with es2gears command easily.  May need =
to
> > > > wait it running a while.
> > > >
> > > > Mesa: 21.2.2
> > > > libdrm: 2.4.107
> > > > xserver/wayland: 1.20.11  Using wayland
> > > >
> > > > This bug happens with direct boot path as well:
> > > > RPi firmware -> Linux kernel (aarch64) with corresponding DTB
> > > >
> > > > I tried with Endless OS and Ubuntu's RPi 4B images.
> > > > An easy setup is using Ubuntu 21.10 RPi 4B image [2].  Then, replac=
e
> > > > the kernel & device tree blob and edit the config.txt.
> > >
> > > Does it still appear if you raise the core clock in the config.txt fi=
le
> > > using: core_freq_min=3D600 ?
> >
> > It still appears when I raise the core clock in the config.txt file:
> > core_freq_min=3D600
>
> That's weird, we had some issues like that already but could never point
> exactly what was going on.
>
> Is testing the official raspberrypi kernel an option for you? If so,
> trying the same workload with fkms would certainly help

I tested the raspberrypi kernel on rpi-5.16.y branch at commit
bcb52df6df52 ("xhci: add a quirk to work around a suspected cache bug
on VLI controllers").  Also, enabled the fkms.  So, vc4 and v3d are
loaded.  However, the "flip_done timed out" error does not appear like
mainline kernel.

Jian-Hong Pan
