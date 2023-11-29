Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9A7FD3A2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEDD10E455;
	Wed, 29 Nov 2023 10:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C60210E422
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:11:04 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5cc3dd21b0cso64675277b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701252663; x=1701857463;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pi3TJMcpykPrfIGwW4UJ8iDsoGVZIjDe1r3vVrq4QfQ=;
 b=aQkRb/9XUU9XuOZ+SccekvFagdNpEnJqDWeCZtDBETmSP3iFED7uVG3q7uZdZkKVuL
 W67KBg5cyw24V5gl3+j7NY24oz17z3r7hN+4cLRRtI+o3VloX4IvROr4NpBbgw9qYizK
 JxISM3WMGC4zjr4u3p/9L+foF1Dma+MAGJ8lE+7Ddxqv2bk7Odce1cQwIPIvGn08eyvF
 9/yN5MWCFvlDRi6ucbeoshrJ0Vfu/n6k/27joXPYBwQb+/nDqCXYlZpb4NhgaxaO+rOK
 vsmox/PkQTLZ4AVuFeNKu7EiBsTyNEIx7+LwneXq+OWmwDv8nBY6bDGZ3vhB1cDXiw+r
 PC5g==
X-Gm-Message-State: AOJu0YxsucYFJUdiloGwAwyB2SJk19mCY5eayrSgkqvQZJK+d8IqoaxF
 6U8KYP4sza02Oyb4jT1eDlCkr4OJNw5SrA==
X-Google-Smtp-Source: AGHT+IFA8olP/4LKsYxh+2oocRtIglA+E64LvN9jCV+wOWL1S6vKbvU3BEHWXZpQuKU31cccJScy6g==
X-Received: by 2002:a0d:d202:0:b0:5c5:a25f:7f62 with SMTP id
 u2-20020a0dd202000000b005c5a25f7f62mr21841331ywd.36.1701252663027; 
 Wed, 29 Nov 2023 02:11:03 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 s9-20020a819f09000000b005d13fc3fa6bsm1126565ywn.89.2023.11.29.02.11.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 02:11:02 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5cd2f1a198cso63026957b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:11:02 -0800 (PST)
X-Received: by 2002:a0d:c985:0:b0:5cd:6d0e:5369 with SMTP id
 l127-20020a0dc985000000b005cd6d0e5369mr20729304ywd.34.1701252662656; Wed, 29
 Nov 2023 02:11:02 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
 <sw5e3mdtbmywbeo6sok4ul5qe72bb5ltsg5ago2vliqxlahvpl@rcivlupw77a5>
In-Reply-To: <sw5e3mdtbmywbeo6sok4ul5qe72bb5ltsg5ago2vliqxlahvpl@rcivlupw77a5>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 11:10:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVb2VfEAgh+59juyTH28EvRMPHEsxT-MUiEQcmJHTD+Q@mail.gmail.com>
Message-ID: <CAMuHMdVVb2VfEAgh+59juyTH28EvRMPHEsxT-MUiEQcmJHTD+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, Nov 29, 2023 at 10:23=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Wed, Nov 29, 2023 at 09:58:12AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
> > > > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> > > > <javierm@redhat.com> wrote:
> > > > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > > > > The Imagination Technologies PowerVR Series 6 GPU is currently =
only
> > > > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a depe=
ndency on
> > > > > > ARCH_K3, to prevent asking the user about this driver when conf=
iguring a
> > > > > > kernel without Texas Instruments K3 Multicore SoC support.
> > > > > >
> > > > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR=
 driver")
> > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > > In any case, I agree with you that restricting to only K3 makes s=
ense.
> > > >
> > > > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...=
,
> > > > eventually ;-)
> > >
> > > I disagree. This is to handle a generic IP, just like panfrost, lima,=
 or
> > > etnaviv, and we certaintly don't want to maintain the Kconfig list of
> > > every possible architecture and SoC family it might or might not be
> > > found.
> >
> > While PowerVR is a generic IP, I believe it needs a non-generic
> > firmware, which is currently only available for AM62x SoCs.
>
> I'm not sure it's actually true, but let's consider it is. Then what? If
> the firmware isn't there and/or the DT bits too, then nothing will
> happen. We would have wasted a couple of 100kB on a system that is
> taking somewhere in the 100MB-10GB range, and that's pretty much it.

I am talking about posing the question to the user to enable the driver
or not.  Which applies to everyone who configures a kernel.

> If you have we take that patch in though, we have:
>
>   - To keep merging patches as firmwares become available.

You need to keep merging patches to update DT bindings, DTS,
SoC-specific drivers, the DRM driver itself, ... too.

>   - If we update linux-firmware only, then the driver is still not
>     loading even though it could.
>
>   - If we have gotten our firmware through some other mean, then the
>     driver is still not loading even though it could.

You will still need to update parts of the kernel, too.
As long as none of that has happened, asking about the PowerVR driver
on non-AM62x hardware is futile...

> It makes life harder for everyone: maintainers, users, devs, based on
> the state of some external project that might or might not be updated in
> sync.
>
> > Once it becomes truly generic, I'm happy to drop all platform
> > dependencies.  Until then, there is no point in asking everyone who
> > configures an arm64 kernel about this driver, unless they also enabled
> > K3 support.
>
> Whether it's truly generic, whatever that means, is irrelevant here.

It is.

BTW, playing the devil's advocate: why is there a dependency on ARM64?
PowerVR GPUs are also present on (at least) arm32 and Intel?
Oh, dropping that would expose this question to Linus, causing his
wrath to come down on you... ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
