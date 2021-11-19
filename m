Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28754456D3A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 11:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306FF6F39B;
	Fri, 19 Nov 2021 10:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174936F39B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 10:25:28 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bf8so20996310oib.6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 02:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q9uL0HApTLYtEbl6Qpw5yQc93JTPfHRoZZ5IwTYyy+c=;
 b=rx61n9CZkMYwsgre+o8nI5OToO6GH4kCXlzdXsUOpCtB68ILYl/gheufYSCrsWRPmH
 42gZQjyFcOzCrFfy76cYaGdZQM52lS1BfZoeckIAVZUTmhCLq6eGiY7m9TJ1Q2zqh38V
 zuox07do6Nixm6lDzG3IjxroVtLtq589FP0uqw5Bjf6LyVVSBh6hZhBMUqtKO5WOBNRU
 iqzejYkH3qfSyBkf28FVEOphvi9B1j9secUBmN7R2561dr9uu8HvFHSXKNR/ufmzBy0S
 g7UwbYGIW9KAUY+KRTNqSvSqqguMpsr8vZ7Ujp/rjvRj/42MO1Ou4T8gmLnt1ejkm67S
 C+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q9uL0HApTLYtEbl6Qpw5yQc93JTPfHRoZZ5IwTYyy+c=;
 b=OKG8urzHVJy0jDxRV6aS50B23drekGFdNNkj1W85JjUnZ0uRlO+ykg7khEFB7L2q5Q
 CanbNu/OIhp7BrZgaXpmVuzgfb5rXbZSn2U4TS500QtjZhBBuzYgVHMXpxTLyMNKip+o
 Hk/KDbzz7rVVGKpxofl+hDlht0e8EKiEWvfwGiGExGITG5soQpT47fmJRVJMGZiG3lCM
 X9IL5gjagFOxFl/u/I0/XVb1JJXu8FO/OlHY47MD+z40A8j5CA6DwxS38WmQ3hnlMPx5
 Wjyny2weFBKukc813M1LkxlzicT7am++qHOvy8C/Vosgsdu7yR9gB54Kow7014WD4IER
 PtaA==
X-Gm-Message-State: AOAM531Bh+KD+RRu3h5oIzGPdcF9eqpB+YuNvXHpiEwsrVL4o++kV87l
 Oi2wtWJEDA6DCUyVJE/Q3erWfpMK8k04dUNo1Iq3IQ==
X-Google-Smtp-Source: ABdhPJxpcY0rnfJYaYAw74/NvNuuq+7UKBNPy0yyFT9On80fwm84q44IX6QooZaru5ODqGhU7liDmvqqTezTcdhBrdo=
X-Received: by 2002:a05:6808:d1:: with SMTP id
 t17mr3852868oic.161.1637317528107; 
 Fri, 19 Nov 2021 02:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
 <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
In-Reply-To: <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Fri, 19 Nov 2021 18:24:34 +0800
Message-ID: <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8818=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8817=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms: Co=
nvert to
> > > atomic helpers") introduced a number of issues in corner cases, most =
of them
> > > showing themselves in the form of either a vblank timeout or use-afte=
r-free
> > > error.
> > >
> > > These patches should fix most of them, some of them still being debug=
ged.
> > >
> > > Maxime
> > >
> > > Changes from v1:
> > >   - Prevent a null pointer dereference
> > >
> > > Maxime Ripard (6):
> > >   drm/vc4: kms: Wait for the commit before increasing our clock rate
> > >   drm/vc4: kms: Fix return code check
> > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > >   drm/vc4: kms: Don't duplicate pending commit
> > >   drm/vc4: kms: Fix previous HVS commit wait
> > >
> > >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-----------------=
--
> > >  1 file changed, 19 insertions(+), 23 deletions(-)
> >
> > I tested the v2 patches based on latest mainline kernel with RPi 4B.
> > System can boot up into desktop environment.
>
> So the thing that was broken initially isn't anymore?

No.  It does not appear anymore.

> > Although it still hit the bug [1], which might be under debugging, I
> > think these patches LGTM.
>
> The vblank timeout stuff is a symptom of various different bugs. Can you
> share your setup, your config.txt, and what you're doing to trigger it?

I get the RPi boot firmware files from raspberrypi's repository at tag
1.20211029 [1]
And, make system boots:
RPi firmware -> U-Boot -> Linux kernel (aarch64) with corresponding DTB

The config.txt only has:
enable_uart=3D1
arm_64bit=3D1
kernel=3Duboot.bin

This bug can be reproduced with es2gears command easily.  May need to
wait it running a while.

Mesa: 21.2.2
libdrm: 2.4.107
xserver/wayland: 1.20.11  Using wayland

This bug happens with direct boot path as well:
RPi firmware -> Linux kernel (aarch64) with corresponding DTB

I tried with Endless OS and Ubuntu's RPi 4B images.
An easy setup is using Ubuntu 21.10 RPi 4B image [2].  Then, replace
the kernel & device tree blob and edit the config.txt.

[1] https://github.com/raspberrypi/firmware/tree/1.20211029/boot
[2] https://ubuntu.com/download/raspberry-pi

Jian-Hong Pan

> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D214991
> >
> > Tested-by: Jian-Hong Pan <jhp@endlessos.org>
>
> Thanks!
> Maxime
