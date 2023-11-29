Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B67FD500
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371C810E19E;
	Wed, 29 Nov 2023 11:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136010E19E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:08:32 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5c8c8f731aaso67810377b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 03:08:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701256112; x=1701860912;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8VdKcHy5PeFkYHqGNDJ3lUZxHHY2sCDNAxHRZAwQzc=;
 b=lTEj6PynIrTmEiJoVgyIuUIOveofIFoifc0wFTLCxj6Pev8rb/P0wkcolL9l+PECm5
 7T2TiTAAzaaEsq556ayT80vEkUwt2FF1m/J30JBXPiDyCsWDV2D5qYFlmlRsX2LwiIu1
 x466rjzlXlCzpSF6voznnQoMoEJ0KtJJDKmug+MBNdbYZ8cgOnu5LJO7xLGDHTx50Dls
 LyBidApZ4s0070lLqCjRbBM317mUVGXEhSj7PinEmKobZErRZ5hRCOEyf9PeSlNlWU+4
 JnUL87KqZo1lxG2tZjtqN7BXsfzuixfFrTgN33tZ0dcJ6bb4Opm6dcqWSSN4tfbm92HC
 vzHA==
X-Gm-Message-State: AOJu0YxpbjKTpaJHrN6dvEPDA+BHCYC2TbR1fixk7dmyuuSLGUJSSrzS
 qWc+Jn3py2dduHJXwfcjfSsBgmujrpsdrA==
X-Google-Smtp-Source: AGHT+IE4Rxvu8v6RIExaU1rjTrCmKyKVchwXiUkV8/niVfJsmXuFrTxSzNqKP5bdX0vmzaR2Nn5MFA==
X-Received: by 2002:a0d:e60f:0:b0:5cb:e94d:17e1 with SMTP id
 p15-20020a0de60f000000b005cbe94d17e1mr19992443ywe.10.1701256111679; 
 Wed, 29 Nov 2023 03:08:31 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 s64-20020a817743000000b005956b451fb8sm4419990ywc.100.2023.11.29.03.08.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Nov 2023 03:08:30 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5cc77e23218so67594657b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 03:08:30 -0800 (PST)
X-Received: by 2002:a0d:dd04:0:b0:5ae:dff7:6159 with SMTP id
 g4-20020a0ddd04000000b005aedff76159mr19752324ywe.18.1701256109852; Wed, 29
 Nov 2023 03:08:29 -0800 (PST)
MIME-Version: 1.0
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
 <sw5e3mdtbmywbeo6sok4ul5qe72bb5ltsg5ago2vliqxlahvpl@rcivlupw77a5>
 <CAMuHMdVVb2VfEAgh+59juyTH28EvRMPHEsxT-MUiEQcmJHTD+Q@mail.gmail.com>
 <u42osuikwzf372mb5xkhiyaycxpmduc5ntyanjlauqca6roeh4@i7zqwu36lzko>
In-Reply-To: <u42osuikwzf372mb5xkhiyaycxpmduc5ntyanjlauqca6roeh4@i7zqwu36lzko>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:08:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW2wCeHU+4HRoT_CM6noMzQjanmvMk5=Wg0t98tg9o1Qw@mail.gmail.com>
Message-ID: <CAMuHMdW2wCeHU+4HRoT_CM6noMzQjanmvMk5=Wg0t98tg9o1Qw@mail.gmail.com>
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

On Wed, Nov 29, 2023 at 11:50=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Wed, Nov 29, 2023 at 11:10:51AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Nov 29, 2023 at 10:23=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > > On Wed, Nov 29, 2023 at 09:58:12AM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kern=
el.org> wrote:
> > > > > On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrot=
e:
> > > > > > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canilla=
s
> > > > > > <javierm@redhat.com> wrote:
> > > > > > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > > > > > > The Imagination Technologies PowerVR Series 6 GPU is curren=
tly only
> > > > > > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a =
dependency on
> > > > > > > > ARCH_K3, to prevent asking the user about this driver when =
configuring a
> > > > > > > > kernel without Texas Instruments K3 Multicore SoC support.
> > > > > > > >
> > > > > > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton Pow=
erVR driver")
> > > > > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > >
> > > > > > > In any case, I agree with you that restricting to only K3 mak=
es sense.
> > > > > >
> > > > > > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS ||=
 ...,
> > > > > > eventually ;-)
> > > > >
> > > > > I disagree. This is to handle a generic IP, just like panfrost, l=
ima, or
> > > > > etnaviv, and we certaintly don't want to maintain the Kconfig lis=
t of
> > > > > every possible architecture and SoC family it might or might not =
be
> > > > > found.
> > > >
> > > > While PowerVR is a generic IP, I believe it needs a non-generic
> > > > firmware, which is currently only available for AM62x SoCs.
>
> I just asked, it's not true in most cases. There's some exceptions
> (GX6250 for example) that could require different firmwares depending on
> the SoC it's used in, but it's not the case here.

OK, please tell me how to use it on e.g. R-Car Gen3.

> > > I'm not sure it's actually true, but let's consider it is. Then what?=
 If
> > > the firmware isn't there and/or the DT bits too, then nothing will
> > > happen. We would have wasted a couple of 100kB on a system that is
> > > taking somewhere in the 100MB-10GB range, and that's pretty much it.
> >
> > I am talking about posing the question to the user to enable the driver
> > or not.  Which applies to everyone who configures a kernel.
>
> If that user doesn't use a defconfig, doesn't use any variant of
> *defconfig make target. Plus, the driver still isn't enabled by default.
>
> > > If you have we take that patch in though, we have:
> > >
> > >   - To keep merging patches as firmwares become available.
> >
> > You need to keep merging patches to update DT bindings, DTS,
> > SoC-specific drivers, the DRM driver itself, ... too.
>
> The DT binding and DRM driver is already there, the SoC specific drivers

The DT binding only lists "ti,am62-gpu" with "img,img-axe" as a fallback.

> are probably already there by the time you reach GPU enablement, and the
> DT doesn't have to be upstream.

And getting it upstream requires updating the bindings...

> > >   - If we update linux-firmware only, then the driver is still not
> > >     loading even though it could.
> > >
> > >   - If we have gotten our firmware through some other mean, then the
> > >     driver is still not loading even though it could.
> >
> > You will still need to update parts of the kernel, too.
>
> Not really, no. We can use the AM62x as an example. The only thing that
> was required to enable the driver (excluding the driver itself of
> course) was a single DT patch, without anything you've mentioned so far.

Who added:

Documentation/devicetree/bindings/gpu/img,powervr.yaml-          - ti,am62-=
gpu
Documentation/devicetree/bindings/gpu/img,powervr.yaml:      - const:
img,img-axe # IMG AXE GPU model/revision is fully discoverable

?

> > As long as none of that has happened, asking about the PowerVR driver
> > on non-AM62x hardware is futile...
>
> Maybe. Just like asking whether you want to enable the UMS driver on
> platforms that don't have a USB controller. Or, closer to us, whether
> you want to enable AMDGPU on platforms without a PCIe bus.
>
> We *never* do that.

Thanks for not checking ;-)

    if USB
    [...]
    source "drivers/usb/storage/Kconfig"

    config DRM_AMDGPU
            tristate "AMD GPU"
            depends on DRM && PCI && MMU

> If only because we can't. We don't have a per-SoC Kconfig option, so
> even if we were to merge your patch, we would still ask about the
> PowerVR driver on, let's say, the AM69 that isn't an AM62x and is just
> as futile according to you. Or for the TDA4VM, or...

That's why we use per-family options.  It's the next best thing we have.

> The other reason is that it's just impossible to maintain. You wouldn't
> expect everyone, once they got their USB support in, to amend the
> Kconfig dependencies for every USB driver out there, would you?

USB devices are (usually) truly generic, and can be plugged in
everywhere you see a USB port.

> > > It makes life harder for everyone: maintainers, users, devs, based on
> > > the state of some external project that might or might not be updated=
 in
> > > sync.
> > >
> > > > Once it becomes truly generic, I'm happy to drop all platform
> > > > dependencies.  Until then, there is no point in asking everyone who
> > > > configures an arm64 kernel about this driver, unless they also enab=
led
> > > > K3 support.
> > >
> > > Whether it's truly generic, whatever that means, is irrelevant here.
> >
> > It is.
> >
> > BTW, playing the devil's advocate: why is there a dependency on ARM64?
> > PowerVR GPUs are also present on (at least) arm32 and Intel?
>
> I would welcome any patch extending that requirement, or droping that
> requirement.
>
> > Oh, dropping that would expose this question to Linus, causing his
> > wrath to come down on you... ;-)
>
> Don't threaten me with a good time.
>
> Also, it's already the case for AMDGPU or etnaviv, so I'm not sure what
> Linus would have to say about it exactly.

AMDGPU is a PCI device, and can be plugged everywhere you see a PCI
slot.  Etnaviv could indeed use some dependencies...

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
