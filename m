Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36157461033
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 09:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE8789FC0;
	Mon, 29 Nov 2021 08:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7AE89FC0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 08:32:53 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id m6so33264381oim.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 00:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rwc850qEx+gUCUmNKlaJOy0vTY6vGtT6G1QMh1XvqZc=;
 b=A0h5EAnxVJ5E20f/17Lv8k4IrpoCJMsRZ4swOCA7r8qeJHEDkfL9uWr/eCZY6jpDyl
 cEksK+1ARoyvUxJ5GmeqiFQIp/Pw9aGiJof/EUH5/m2G0RVoI+zg51jqlbhBeqkTC7m9
 7dByiDS16Or8pKiGDrvfO2trocI/B4TzlqVsPWz+VHYPv1PxEMllalSTd7FRvSa61aVN
 vM6UEoqtjL+AcrsVO9LYHID0yWXg9sc/D9TUMNL/hFu7dgXR1jtmVFb0vE2fI2ExfqmD
 0DPO0BgpalxtV/CbmmQeMw+1fEtoOx2vFLog7L59ZpB+iQVBA44EYm1owaa0cTa+TQLO
 78jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rwc850qEx+gUCUmNKlaJOy0vTY6vGtT6G1QMh1XvqZc=;
 b=ilQzmseKIBw4mILc0lGIkPwI13eKdGxfy6JM5YMP0usvWsA2Fuug4JDWnNSbxQZcyS
 bOJ1GOQmVoMVSn9HjW3tE/ncZq5nig1tDjNvFi/8hXJRla9f4+UnOT1L5vp7SslXSk93
 +v+j3Vn/bvzjLs2EuM8wVu4VLWEzukHqwR1CIPe5fK5L3P29XGz1dueHQ1YI9c4mn9Mx
 P0Tdj+iI02hW87OMkAoa0aEM8/rLc14fdKkyobY13F8NebLssu3C5oelknny7J5/nMz9
 qoOfRjXpd99yfyhZhZyq7rHJ3kZ3HwE+Zlci/U4XIg7ZepQWo/CRO9Lz7LPy2KGMod3t
 ZtqA==
X-Gm-Message-State: AOAM5334GSCqCwpW4GqS8p7s4ArUyncGmq54z3px0UCuO9qwS5wdnM+T
 A7zAcCUEmPaCu/FgJC6hrvgUJp+KbdtoG92r36PSsA==
X-Google-Smtp-Source: ABdhPJwlNFdW9bUJ57b9IqSQRJMCO/DDWdEch+Wp8rz+rX1zMVMTq3FdtfqB7x/oGezg64rPbDqlC32TX4W+fMo+8hQ=
X-Received: by 2002:a05:6808:d1:: with SMTP id
 t17mr39003581oic.161.1638174772939; 
 Mon, 29 Nov 2021 00:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20211117094527.146275-1-maxime@cerno.tech>
 <CAPpJ_eewp9Z_xdpmB+E_NFH1GGq8oyckVBmS1PD84CvCRUminQ@mail.gmail.com>
 <20211118104009.jkvkhxi5nh4e4zlp@gilmour>
 <CAPpJ_ef5XeLKpHAzxsrokkdg8M8uqrLo9X9E5uGbFn1-Baroig@mail.gmail.com>
 <20211126154532.nqlqkoxa77apioxu@houat>
In-Reply-To: <20211126154532.nqlqkoxa77apioxu@houat>
From: Jian-Hong Pan <jhp@endlessos.org>
Date: Mon, 29 Nov 2021 16:31:57 +0800
Message-ID: <CAPpJ_edY+HXfv_rNL01piUFYaTUdFb9KEj2h-xN0MH0cYRyMTQ@mail.gmail.com>
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

Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Fri, Nov 19, 2021 at 06:24:34PM +0800, Jian-Hong Pan wrote:
> > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=8818=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > On Thu, Nov 18, 2021 at 02:42:58PM +0800, Jian-Hong Pan wrote:
> > > > Maxime Ripard <maxime@cerno.tech> =E6=96=BC 2021=E5=B9=B411=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:45=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > > > The conversion to DRM commit helpers (f3c420fe19f8, "drm/vc4: kms=
: Convert to
> > > > > atomic helpers") introduced a number of issues in corner cases, m=
ost of them
> > > > > showing themselves in the form of either a vblank timeout or use-=
after-free
> > > > > error.
> > > > >
> > > > > These patches should fix most of them, some of them still being d=
ebugged.
> > > > >
> > > > > Maxime
> > > > >
> > > > > Changes from v1:
> > > > >   - Prevent a null pointer dereference
> > > > >
> > > > > Maxime Ripard (6):
> > > > >   drm/vc4: kms: Wait for the commit before increasing our clock r=
ate
> > > > >   drm/vc4: kms: Fix return code check
> > > > >   drm/vc4: kms: Add missing drm_crtc_commit_put
> > > > >   drm/vc4: kms: Clear the HVS FIFO commit pointer once done
> > > > >   drm/vc4: kms: Don't duplicate pending commit
> > > > >   drm/vc4: kms: Fix previous HVS commit wait
> > > > >
> > > > >  drivers/gpu/drm/vc4/vc4_kms.c | 42 ++++++++++++++++-------------=
------
> > > > >  1 file changed, 19 insertions(+), 23 deletions(-)
> > > >
> > > > I tested the v2 patches based on latest mainline kernel with RPi 4B=
.
> > > > System can boot up into desktop environment.
> > >
> > > So the thing that was broken initially isn't anymore?
> >
> > No.  It does not appear anymore.
> >
> > > > Although it still hit the bug [1], which might be under debugging, =
I
> > > > think these patches LGTM.
> > >
> > > The vblank timeout stuff is a symptom of various different bugs. Can =
you
> > > share your setup, your config.txt, and what you're doing to trigger i=
t?
> >
> > I get the RPi boot firmware files from raspberrypi's repository at tag
> > 1.20211029 [1]
> > And, make system boots:
> > RPi firmware -> U-Boot -> Linux kernel (aarch64) with corresponding DTB
> >
> > The config.txt only has:
> > enable_uart=3D1
> > arm_64bit=3D1
> > kernel=3Duboot.bin
> >
> > This bug can be reproduced with es2gears command easily.  May need to
> > wait it running a while.
> >
> > Mesa: 21.2.2
> > libdrm: 2.4.107
> > xserver/wayland: 1.20.11  Using wayland
> >
> > This bug happens with direct boot path as well:
> > RPi firmware -> Linux kernel (aarch64) with corresponding DTB
> >
> > I tried with Endless OS and Ubuntu's RPi 4B images.
> > An easy setup is using Ubuntu 21.10 RPi 4B image [2].  Then, replace
> > the kernel & device tree blob and edit the config.txt.
>
> Does it still appear if you raise the core clock in the config.txt file
> using: core_freq_min=3D600 ?

It still appears when I raise the core clock in the config.txt file:
core_freq_min=3D600

Jian-Hong Pan
