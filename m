Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A42868F6C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 12:50:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A826910E450;
	Tue, 27 Feb 2024 11:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DBa9swCK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4611710E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 11:50:54 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso3155428a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709034653; x=1709639453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDoS3gLGI0Ru88ibWZYCmaUVCnms/5yXvnI03PkRJbQ=;
 b=DBa9swCKMhLBr9mo2xCP5wNDmHL18TPgyhLOtW8q6u99e4YTjIWHf0pqVHeAqflom4
 5t9klZBsV/A9nwIZZC8YbfzpgHjqcnrBRMUdIaSPq16tIVc3YIi0oKkEgEyD7ug1T6S6
 90tmfJLP0zaPJOLZEM+kKmRATapw+PxCwSClw4SJvZEIHbgK6lG0l4Vj0PZmYEDHi7Nn
 j5FARcoHCV5eqCJg1VmTThMjYBVmoe6/Cgv3UzxtWV1jrN5LxJJwqeRM8Yq4tW8tLRKD
 hW7t+CJD8r9OVTWZ6x8JuN7wDU+RDdFQP8jsZRPLqRp4/1VW+WxZGODrhTiPTPqa//1o
 K2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709034653; x=1709639453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDoS3gLGI0Ru88ibWZYCmaUVCnms/5yXvnI03PkRJbQ=;
 b=LX5sDvBMK72680vyZJO0g0ffO9rrLKjjzePu5Mu/qjfVtzNn27zteAz2zx3adp6xrr
 9ILadT5qEMp/scJ5CxLKqD38oIlv7HbqnlgM0u3jZYSOhBAYkwj95gHXwSiZmd5Y1b+T
 bEuZTBRWGF6vVwY99oA6G8hgdcqq6z2t1YbiXm9gGlO278C68S2FCrVuiu6EYcNUPgwD
 OCx8mR5uc4nsRLlNMOad7bioH7KbPjtlZNKf0lqLEkykBhOiJd9sTK5SqJ1B5ioWdBJg
 ODsklU69fKh8Vb1FV6ur+vjoHOSwkrBRzepjJERtFYXmOiIUtKqzf1CLfVGv8kY+z2kL
 oyvA==
X-Gm-Message-State: AOJu0YwX24mfi81GnBoIB953POnm2ppHGgHsvu4/oztNfRB5nLXuCZ8m
 rlCti6PxrOg4dC5uAsP+s5OCkWhgvZgOpm/9niS2hYET3UZLjylVMnmsKLCVoYKFDFDsGWXjbtp
 LahUG0GbxD/dMnyAkl0R7oKIjOb0=
X-Google-Smtp-Source: AGHT+IELcr6v/ZNF99nQU0H9fb5ytljAs2NYlh9FX6CrCFlQCTtIeotChVLyYxSxOWpUFjR/B4u1AgxDqXdtxZrOxA0=
X-Received: by 2002:a05:6a20:d41b:b0:1a0:e5a7:60b7 with SMTP id
 il27-20020a056a20d41b00b001a0e5a760b7mr1460652pzb.29.1709034653492; Tue, 27
 Feb 2024 03:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
 <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
In-Reply-To: <39aead3b-b809-4c9c-8a5d-c0be2b36ea47@imgtec.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 Feb 2024 05:50:42 -0600
Message-ID: <CAHCN7xJnKNdsrs+UMvPqdkN+j8v+8UaoH=zargcKRi7dw0GLNA@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Adam Ford <aford@beaconembedded.com>, 
 Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Feb 27, 2024 at 3:31=E2=80=AFAM Matt Coster <Matt.Coster@imgtec.com=
> wrote:
>
> Hi Adam,
>
> Thanks for these patches! I'll just reply to this one patch, but my
> comments apply to them all.
>
> On 27/02/2024 03:45, Adam Ford wrote:
> > The GPU on the RZ/G2M is a Rogue GX6250 which uses firmware
> > rogue_4.45.2.58_v1.fw available from Imagination.
> >
> > When enumerated, it appears as:
> >   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v=
1.fw
> >   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>
> These messages are printed after verifying the firmware blob=E2=80=99s he=
aders,
> *before* attempting to upload it to the device. Just because they appear
> in dmesg does *not* imply the device is functional beyond the handful of
> register reads in pvr_load_gpu_id().
>
> Since Mesa does not yet have support for this GPU, there=E2=80=99s not a =
lot
> that can be done to actually test these bindings.
>
> When we added upstream support for the first GPU (the AXE core in TI=E2=
=80=99s
> AM62), we opted to wait until userspace was sufficiently progressed to
> the point it could be used for testing. This thought process still
> applies when adding new GPUs.
>
> Our main concern is that adding bindings for GPUs implies a level of
> support that cannot be tested. That in turn may make it challenging to
> justify UAPI changes if/when they=E2=80=99re needed to actually make thes=
e GPUs
> functional.

I wrongly assumed that when the firmware was ready, there was some
preliminary functionality, but it sounds like we need to work for
Series6XT support to be added to the driver.  I only used the AXE
compatible since it appeared to the be the only one and the existing
binding document stated "model/revision is fully discoverable" which I
interpreted to mean that the AXE compatible was sufficient.
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boo=
t/dts/renesas/r8a774a1.dtsi
> > index a8a44fe5e83b..8923d9624b39 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -2352,6 +2352,16 @@ gic: interrupt-controller@f1010000 {
> >                       resets =3D <&cpg 408>;
> >               };
> >
> > +             gpu: gpu@fd000000 {
> > +                     compatible =3D "renesas,r8a774a1-gpu", "img,img-a=
xe";
>
> The GX6250 is *not* an AXE core - it shouldn=E2=80=99t be listed as compa=
tible
> with one. For prior art, see [1] where we added support for the MT8173
> found in Elm Chromebooks R13 (also a Series6XT GPU).
>
> > +                     reg =3D <0 0xfd000000 0 0x20000>;
> > +                     clocks =3D <&cpg CPG_MOD 112>;
> > +                     clock-names =3D "core";
>
> Series6XT cores have three clocks (see [1] again). I don=E2=80=99t have a
> Renesas TRM to hand =E2=80=93 do you know if their docs go into detail on=
 the
> GPU integration?
>
> > +                     interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> > +                     power-domains =3D <&sysc R8A774A1_PD_3DG_B>;
> > +                     resets =3D <&cpg 112>;
> > +             };
> > +
> >               pciec0: pcie@fe000000 {
> >                       compatible =3D "renesas,pcie-r8a774a1",
> >                                    "renesas,pcie-rcar-gen3";
>
> As you probably expect by this point, I have to nack this series for
> now. I appreciate your effort here and I=E2=80=99ll be happy to help you =
land

I get that.  I wasn't sure if I should have even pushed this, but I
wanted to get a little traction, because I know there are people like
myself who want to use the 3D in the Renesas boards, but don't want to
use the closed-source blobs tied to EULA and NDA documents.

> these once Mesa gains some form of usable support to allow testing.

Is there a way for your group to add me to the CC list when future
updates are submitted?  I'd like to follow this and resubmit when it's
ready.
>
> Cheers,
> Matt
>
> [1]: https://gitlab.freedesktop.org/imagination/linux/-/blob/b3506b8bc45e=
d6d4005eb32a994df0e33d6613f1/arch/arm64/boot/dts/mediatek/mt8173.dtsi#L993-=
1006
