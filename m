Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 952407FD6B7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95910E5E7;
	Wed, 29 Nov 2023 12:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D20D10E542
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:26:10 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5cd2f1a198cso64268207b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 04:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701260769; x=1701865569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BClXgPLgGXGBMnRTdU0GNO6E3UTLxr7wrkB3O5VjiVA=;
 b=Ro3xrEkcsDCAtSHR7fElK9LXkuEPWbb5sxCAMU3Lwncof4OcMk1hcCKDvICiEAiZ5p
 xW9RFsxBn4/eyC5VsIys2bTJbXbYpGcXnOmgG4Wi6vDSjKWl8X6kcDi0OzkQOq5B948F
 Rk86wfDxx0xAjUKKhwCqqsgD0OFEhmioDaPnnU4TKcPWc/jaFJriQmhTMTcX7WBRq1kt
 hk6rhveFNE0+iHqaCMM9BYMzCTeuD2lpJ0VYr74z6hY4cEcM5f5o6cj+pj285glaGfuF
 2BgdCb8nvhSTat2uHFmGOZg1JJUIYr7s5iOZgjoGJNKv2s/iijsjACxNDvSo3ApL9aYh
 fs9w==
X-Gm-Message-State: AOJu0YwhdI4oV/6byraTQ4iyotytCjHr1Nx0Ptnn2cWpIqJaRJSZXxJl
 GOnltbhLnDrErnfe1uenWx+D5PqeY9PoMg==
X-Google-Smtp-Source: AGHT+IGrsgYo1lGEQmJMQ903tuR5kX+/uSAd33m+UDmt4fAOdXPQRuEYtZJSBe89TUiuuN4lBGMn1g==
X-Received: by 2002:a25:1342:0:b0:da0:3535:41f4 with SMTP id
 63-20020a251342000000b00da0353541f4mr18482700ybt.7.1701260768865; 
 Wed, 29 Nov 2023 04:26:08 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 g135-20020a25db8d000000b00da034601e2esm4203535ybf.52.2023.11.29.04.26.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 04:26:08 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5cc3dd21b0cso65906047b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 04:26:08 -0800 (PST)
X-Received: by 2002:a81:b617:0:b0:5ce:ff7e:e743 with SMTP id
 u23-20020a81b617000000b005ceff7ee743mr15259696ywh.17.1701260767780; Wed, 29
 Nov 2023 04:26:07 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
 <sw5e3mdtbmywbeo6sok4ul5qe72bb5ltsg5ago2vliqxlahvpl@rcivlupw77a5>
 <CAMuHMdVVb2VfEAgh+59juyTH28EvRMPHEsxT-MUiEQcmJHTD+Q@mail.gmail.com>
 <u42osuikwzf372mb5xkhiyaycxpmduc5ntyanjlauqca6roeh4@i7zqwu36lzko>
 <CAMuHMdW2wCeHU+4HRoT_CM6noMzQjanmvMk5=Wg0t98tg9o1Qw@mail.gmail.com>
 <mqi7tvvtkgeqxbdyas7cjzzssfjcskfdiigv4owztsuz6a2nrn@sgmkhj4ljefq>
In-Reply-To: <mqi7tvvtkgeqxbdyas7cjzzssfjcskfdiigv4owztsuz6a2nrn@sgmkhj4ljefq>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 13:25:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU241uVonA1BVwbNE+KGYKVrG8m+H4=Z9uuqp4k64ycnA@mail.gmail.com>
Message-ID: <CAMuHMdU241uVonA1BVwbNE+KGYKVrG8m+H4=Z9uuqp4k64ycnA@mail.gmail.com>
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

On Wed, Nov 29, 2023 at 12:34=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Wed, Nov 29, 2023 at 12:08:17PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 29, 2023 at 11:50=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > > On Wed, Nov 29, 2023 at 11:10:51AM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Nov 29, 2023 at 10:23=E2=80=AFAM Maxime Ripard <mripard@ker=
nel.org> wrote:
> > > > > On Wed, Nov 29, 2023 at 09:58:12AM +0100, Geert Uytterhoeven wrot=
e:
> > > > > > On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@=
kernel.org> wrote:
> > > > > > > On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven =
wrote:
> > > > > > > > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Can=
illas
> > > > > > > > <javierm@redhat.com> wrote:
> > > > > > > > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > > > > > > > > The Imagination Technologies PowerVR Series 6 GPU is cu=
rrently only
> > > > > > > > > > supported on Texas Instruments K3 AM62x SoCs.  Hence ad=
d a dependency on
> > > > > > > > > > ARCH_K3, to prevent asking the user about this driver w=
hen configuring a
> > > > > > > > > > kernel without Texas Instruments K3 Multicore SoC suppo=
rt.
> > > > > > > > > >
> > > > > > > > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton=
 PowerVR driver")
> > > > > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider=
.be>
> > > > > >
> > > > > > > > > In any case, I agree with you that restricting to only K3=
 makes sense.
> > > > > > > >
> > > > > > > > I am looking forward to adding || SOC_AM33XX || ARCH_RENESA=
S || ...,
> > > > > > > > eventually ;-)
> > > > > > >
> > > > > > > I disagree. This is to handle a generic IP, just like panfros=
t, lima, or
> > > > > > > etnaviv, and we certaintly don't want to maintain the Kconfig=
 list of
> > > > > > > every possible architecture and SoC family it might or might =
not be
> > > > > > > found.
> > > > > >
> > > > > > While PowerVR is a generic IP, I believe it needs a non-generic
> > > > > > firmware, which is currently only available for AM62x SoCs.
> > >
> > > I just asked, it's not true in most cases. There's some exceptions
> > > (GX6250 for example) that could require different firmwares depending=
 on
> > > the SoC it's used in, but it's not the case here.
> >
> > OK, please tell me how to use it on e.g. R-Car Gen3.
>
> I'm not very familiar with the R-Car family of SoCs.
>
> However, if I'm to trust that page: https://www.renesas.com/us/en/product=
s/automotive-products/automotive-system-chips-socs
>
> None of them feature the same GPU than the AM62x, so that question is
> completely different?

According to the documentation I have, they contain PowerVR Series6XT
or Series7XE GPUs.

DRM_POWERVR claims to support "Imagination Technologies PowerVR
(Series 6 or later) or IMG GPU".

> > > > > I'm not sure it's actually true, but let's consider it is. Then w=
hat? If
> > > > > the firmware isn't there and/or the DT bits too, then nothing wil=
l
> > > > > happen. We would have wasted a couple of 100kB on a system that i=
s
> > > > > taking somewhere in the 100MB-10GB range, and that's pretty much =
it.
> > > >
> > > > I am talking about posing the question to the user to enable the dr=
iver
> > > > or not.  Which applies to everyone who configures a kernel.
> > >
> > > If that user doesn't use a defconfig, doesn't use any variant of
> > > *defconfig make target. Plus, the driver still isn't enabled by defau=
lt.
> > >
> > > > > If you have we take that patch in though, we have:
> > > > >
> > > > >   - To keep merging patches as firmwares become available.
> > > >
> > > > You need to keep merging patches to update DT bindings, DTS,
> > > > SoC-specific drivers, the DRM driver itself, ... too.
> > >
> > > The DT binding and DRM driver is already there, the SoC specific driv=
ers
> >
> > The DT binding only lists "ti,am62-gpu" with "img,img-axe" as a fallbac=
k.
>
> Sure. And the driver matches on img,img-axe, so it would probe fine even
> with a different first compatible.
>
> > > are probably already there by the time you reach GPU enablement, and =
the
> > > DT doesn't have to be upstream.
> >
> > And getting it upstream requires updating the bindings...
>
> Right. And you still don't have to put it upstream, so the binding isn't
> a requirement either.

Oh, how we love out-of-tree...

> > > > >   - If we update linux-firmware only, then the driver is still no=
t
> > > > >     loading even though it could.
> > > > >
> > > > >   - If we have gotten our firmware through some other mean, then =
the
> > > > >     driver is still not loading even though it could.
> > > >
> > > > You will still need to update parts of the kernel, too.
> > >
> > > Not really, no. We can use the AM62x as an example. The only thing th=
at
> > > was required to enable the driver (excluding the driver itself of
> > > course) was a single DT patch, without anything you've mentioned so f=
ar.
> >
> > Who added:
> >
> > Documentation/devicetree/bindings/gpu/img,powervr.yaml-          - ti,a=
m62-gpu
> > Documentation/devicetree/bindings/gpu/img,powervr.yaml:      - const:
> > img,img-axe # IMG AXE GPU model/revision is fully discoverable
> >
> > ?
>
> Which is a formality, part of the upstreaming process, but not required
> at all from a technical point of view to make a driver probe.
>
> > > > As long as none of that has happened, asking about the PowerVR driv=
er
> > > > on non-AM62x hardware is futile...
> > >
> > > Maybe. Just like asking whether you want to enable the UMS driver on
> > > platforms that don't have a USB controller. Or, closer to us, whether
> > > you want to enable AMDGPU on platforms without a PCIe bus.
> > >
> > > We *never* do that.
> >
> > Thanks for not checking ;-)
> >
> >     if USB
> >     [...]
> >     source "drivers/usb/storage/Kconfig"
> >
> >     config DRM_AMDGPU
> >             tristate "AMD GPU"
> >             depends on DRM && PCI && MMU
>
> I'm not seeing any platform Kconfig option there.

There is no need for platform dependencies here because USB and PCI
are better gatekeepers.

> Most importantly, you were arguing that the GPU should be enabled only

s/enabled/visible/

> on systems where the GPU is in the SoC, with a firmware in
> linux-firmware, and the DT bits in.

For now, because it is really only supported on AM62x
If that claim is false, please tell me on which other platform it works.

> And you're now making it equivalent to "the framework handling that
> device is compiled in", which I fully agree with: of course a USB device
> driver should only be compiled if the USB framework is there.
>
> But "having the framework compiled" and "a controller is functional on a
> platform" is completely different, and you know that very well otherwise
> you wouldn't have sent that patch in the first place.

DRM is the framework.
DRM_POWERVR is a driver for hardware that can only be used
(for now) on a very limited platform subset.

> > AMDGPU is a PCI device, and can be plugged everywhere you see a PCI
> > slot.  Etnaviv could indeed use some dependencies...
>
> It might be plugged in any PCIe slot. It will not work with any PCIe
> controller.

Why not?

> Anyway, there's no point in discussing it further. We're at the point of
> sending blank threats so it's not super productive anyway.
>
> As far as I'm concerned, and if there's no new actual technical
> argument,

Linus has stated multiple times he does not want to see Kconfig
options that do not make sense and/or cannot be sued.  Such options
are wasting everyone's time.

> NAK.

Oh well...

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
