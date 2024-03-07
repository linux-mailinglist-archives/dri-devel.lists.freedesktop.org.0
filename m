Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6D874FFD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE5310F15A;
	Thu,  7 Mar 2024 13:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vn7UrfPA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A71C10F154
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:31:29 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1dd0d46ecc3so6665875ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709818289; x=1710423089; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bu5jHGN23CR+6gfGrBm60h2lIXXTAwpxHU4qL8HSxTM=;
 b=Vn7UrfPAy65EQ2Bkr29kg0HuJZPgZZUBVXz5bb08hn4rFWqCgkOr+vu0S7UMvd0soN
 kSKYiC3ZVk4eqSlOfRGJHEzYlShFXMK+5uqA3F3Hq8DOXbNJqV1aOtYUowdgl45VSulp
 MxkgSJHxMoU2t5NYbWXJMuLX42KzUxmE2DIFHkuJTiEKBUxX5cSlMl2+nTZzq3deR9+U
 IrivI6WCspKHiLl3rYCW/KkFKTF4gBgm82xQK/yBiqSKMHPKA+0XEKiO7HhFwAW4D0QC
 vDGayRo29mBO7AD2QSOr7sVDiDaSo2tIrbnwSk2leWg4RdkQaZtZH3g9BL0H+hWtfOmy
 z3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709818289; x=1710423089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bu5jHGN23CR+6gfGrBm60h2lIXXTAwpxHU4qL8HSxTM=;
 b=YkCIb3baNjZ048dlptEnRWJ1yRfh97O0z4CEQgkdKiGQMjxfMhtnNOdwyDLcHISSvv
 YJ18Wojpdp06uqpqO3qIvsmLGL9WQfNrbv8L8GzVFplfRqDVy3RiIB5jHBwg12aII96Y
 4+/hzIrFG8uR7nLa8gg27vhzfi5U+rClw87qhJQ9P/7vz9UiW7w6YeG8QQrA4eU2bQzc
 wxERwJMdnIucR1xZpxxmhyWdXn//Ur9LoNi6Bu3ciFu+vG5Re8bMLptNvcKrrg1AAm8X
 FrGXg0szCs0mp/C1xvny/1tRyloHvHxc5agkC4Rq/V27LeSAQpBMKRjTh9b+19Krjock
 CQTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTrHkG4LCFUEbij4BKfcHAvgtaO8lYcCViigryFDvDhCxxr/NZRUYYAlm2i2k0SIbYtDga6TPTIN8BQciSX+O0NUUcolKdivmeu8LRX+ye
X-Gm-Message-State: AOJu0YwpNpYTcFzewPihevjubDd7C2UxFA3QdBRceQrcr4nAhuJiihux
 y0wxDNtd4DLfPq+4B+IcIDZTWlt7SInhcLzmZmSKBrRHJJkOl3UsSWRt9ubVhz1y/YUU2KDU2Cr
 foMJ8ANZ5CRQ7tlzgo505SvVaLds=
X-Google-Smtp-Source: AGHT+IEK7l6FfAHTkxBdGa0tA5qydpzfCH3ClijLcpozLPeH8dLk9bdt/6q9LL5YA48v4gr9VcIBYzazorjxzP6vkyU=
X-Received: by 2002:a17:90b:78a:b0:29a:d7ba:2c99 with SMTP id
 l10-20020a17090b078a00b0029ad7ba2c99mr16727101pjz.10.1709818288784; Thu, 07
 Mar 2024 05:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
 <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
 <d959159dac0effce1a80986bc87e18ffd24773b9.camel@imgtec.com>
 <f5eb761e9ec30927657ed02a55e3b91abede90fe.camel@imgtec.com>
In-Reply-To: <f5eb761e9ec30927657ed02a55e3b91abede90fe.camel@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 7 Mar 2024 07:31:17 -0600
Message-ID: <CAHCN7xKLbAbdm490+Sk_mZP_WQWtMM8Qmg7WBmdZ3JqpcTPfcg@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
To: Frank Binns <Frank.Binns@imgtec.com>
Cc: Matt Coster <Matt.Coster@imgtec.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh@kernel.org" <robh@kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "aford@beaconembedded.com" <aford@beaconembedded.com>
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

On Thu, Mar 7, 2024 at 6:37=E2=80=AFAM Frank Binns <Frank.Binns@imgtec.com>=
 wrote:
>
> On Thu, 2024-03-07 at 12:26 +0000, Frank Binns wrote:
> > On Tue, 2024-02-27 at 05:50 -0600, Adam Ford wrote:
> > > On Tue, Feb 27, 2024 at 3:31=E2=80=AFAM Matt Coster <Matt.Coster@imgt=
ec.com> wrote:
> > > > Hi Adam,
> > > >
> > > > Thanks for these patches! I'll just reply to this one patch, but my
> > > > comments apply to them all.
> > > >
> > > > On 27/02/2024 03:45, Adam Ford wrote:
> > > > > The GPU on the RZ/G2M is a Rogue GX6250 which uses firmware
> > > > > rogue_4.45.2.58_v1.fw available from Imagination.
> > > > >
> > > > > When enumerated, it appears as:
> > > > >   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.=
2.58_v1.fw
> > > > >   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
> > > >
> > > > These messages are printed after verifying the firmware blob=E2=80=
=99s headers,
> > > > *before* attempting to upload it to the device. Just because they a=
ppear
> > > > in dmesg does *not* imply the device is functional beyond the handf=
ul of
> > > > register reads in pvr_load_gpu_id().
> > > >
> > > > Since Mesa does not yet have support for this GPU, there=E2=80=99s =
not a lot
> > > > that can be done to actually test these bindings.
> > > >
> > > > When we added upstream support for the first GPU (the AXE core in T=
I=E2=80=99s
> > > > AM62), we opted to wait until userspace was sufficiently progressed=
 to
> > > > the point it could be used for testing. This thought process still
> > > > applies when adding new GPUs.
> > > >
> > > > Our main concern is that adding bindings for GPUs implies a level o=
f
> > > > support that cannot be tested. That in turn may make it challenging=
 to
> > > > justify UAPI changes if/when they=E2=80=99re needed to actually mak=
e these GPUs
> > > > functional.
> > >
> > > I wrongly assumed that when the firmware was ready, there was some
> > > preliminary functionality, but it sounds like we need to work for
> > > Series6XT support to be added to the driver.  I only used the AXE
> > > compatible since it appeared to the be the only one and the existing
> > > binding document stated "model/revision is fully discoverable" which =
I
> > > interpreted to mean that the AXE compatible was sufficient.
> >
> > The comment is related to there being a few models/revisions of AXE [1]=
[2][3],
> > which we can distinguish between by reading a register.
> >
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm=
64/boot/dts/renesas/r8a774a1.dtsi
> > > > > index a8a44fe5e83b..8923d9624b39 100644
> > > > > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > > @@ -2352,6 +2352,16 @@ gic: interrupt-controller@f1010000 {
> > > > >                       resets =3D <&cpg 408>;
> > > > >               };
> > > > >
> > > > > +             gpu: gpu@fd000000 {
> > > > > +                     compatible =3D "renesas,r8a774a1-gpu", "img=
,img-axe";
> > > >
> > > > The GX6250 is *not* an AXE core - it shouldn=E2=80=99t be listed as=
 compatible
> > > > with one. For prior art, see [1] where we added support for the MT8=
173
> > > > found in Elm Chromebooks R13 (also a Series6XT GPU).
> > > >
> > > > > +                     reg =3D <0 0xfd000000 0 0x20000>;
> > > > > +                     clocks =3D <&cpg CPG_MOD 112>;
> > > > > +                     clock-names =3D "core";
> > > >
> > > > Series6XT cores have three clocks (see [1] again). I don=E2=80=99t =
have a
> > > > Renesas TRM to hand =E2=80=93 do you know if their docs go into det=
ail on the
> > > > GPU integration?
> > > >
> > > > > +                     interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_=
HIGH>;
> > > > > +                     power-domains =3D <&sysc R8A774A1_PD_3DG_B>=
;
> > > > > +                     resets =3D <&cpg 112>;
> > > > > +             };
> > > > > +
> > > > >               pciec0: pcie@fe000000 {
> > > > >                       compatible =3D "renesas,pcie-r8a774a1",
> > > > >                                    "renesas,pcie-rcar-gen3";
> > > >
> > > > As you probably expect by this point, I have to nack this series fo=
r
> > > > now. I appreciate your effort here and I=E2=80=99ll be happy to hel=
p you land
> > >
> > > I get that.  I wasn't sure if I should have even pushed this, but I
> > > wanted to get a little traction, because I know there are people like
> > > myself who want to use the 3D in the Renesas boards, but don't want t=
o
> > > use the closed-source blobs tied to EULA and NDA documents.
> > >
> > > > these once Mesa gains some form of usable support to allow testing.
> > >
> > > Is there a way for your group to add me to the CC list when future
> > > updates are submitted?  I'd like to follow this and resubmit when it'=
s
> > > ready.
> >
> > Sure, we'll keep you updated as things progress.
> >
>
> Oh, I forgot to add, in the meantime, would you find it useful for us to =
create
> a Series6XT branch on GitLab where we can include these patches? We can c=
reate a
> corresponding Mesa branch that we'll update as we progress support for GX=
6250.
> This should make it easier for you (and others) to test and hopefully mak=
e it
> easier for others to contribute while we work to get support into a good =
state.

That works for me.  Do you want me to make any changes to the series?
I know there was some discussion about the number of clocks for the
Renesas variants.

adam
>
> > Thanks
> > Frank
> >
> > [1] https://www.imaginationtech.com/product/img-axe-1-16m/
> > [2] https://www.imaginationtech.com/product/img-axe-1-16/
> > [3] https://www.imaginationtech.com/product/img-axe-2-16/
> >
> > > > Cheers,
> > > > Matt
> > > >
> > > > [1]: https://gitlab.freedesktop.org/imagination/linux/-/blob/b3506b=
8bc45ed6d4005eb32a994df0e33d6613f1/arch/arm64/boot/dts/mediatek/mt8173.dtsi=
#L993-1006
