Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D73D2FF39
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7610E860;
	Fri, 16 Jan 2026 10:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aQRvMtG5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310A10E862
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 10:56:16 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64bea6c5819so3205787a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 02:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768560975; x=1769165775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s7DoksDpFPnlJ6YY9IWEVIqBsN/FrhlIGvYVSfP8/oE=;
 b=aQRvMtG51eg3w1v7gEyRi2PHTu7UQJmXWkKIHJskCOtqRnk4CjRsgW+htKFT3YJ1eE
 F1tIfKXCTC4ccYvWTFR6dhMt8hQDIdEhWhd6SIQ5gt6g355InfWMnU64gCQIy0ngpPdQ
 3nwSFdizWqg2JlWB+dJT+NbnvkxCOimuSMUffsB8x2H8VIouJ5f0pVLA5NVIQnSj6LTT
 gKslsR/f72mUM/S/BI4TLtoHsvN4A8buVeojb3hsXTatoEtlwsJA/yOde7A8DOmxjmsu
 57+/mWDSKmcwMQQNkRvSxAE4fmG19SH8//71YJAviai4EeHMaWAajm3FAxLGJIYV3gje
 CVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768560975; x=1769165775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=s7DoksDpFPnlJ6YY9IWEVIqBsN/FrhlIGvYVSfP8/oE=;
 b=jSCjCtIK4RQ33OLt0VmK1nzU6mTUM9DcE5q8fopMzsbZ8VGTD/dFUxuiBXW0u7Pdy8
 Ykp391V5pmXDjtFO4ZfweKyREG8+k3RyQmaLQ4kMpsYxI1ayzbxtrH27Z+9h0MOTIjQp
 1MkAdiSxDq/U3MISv0Fk8BSsE/h2Dh76ZZxr6MQ4pkKod10+NUkmfr7zL378rfVn/Mzi
 1mwDTxzTtOTdPOyAWnZBsWJ88iITG0parRdkA1AJp5JU+VVA1LYX0k+RVwwi0/en9zYh
 yWT0jG9zG9WrLl4QEJTKteHp17T+d9/+6CvBSxptc4ilNuGVF+SXSwILLN5WgqEENqSz
 Rd7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9KdYYbjg/Wvm0a/xCdRpwJ7eIE6Du3V5vXaTtKA+DpFw1129MOModEcnX9bHL08x4aQMK/yFZz14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYvd2VYjHxYRuhT72aciQsqOHf7sIuRWgFoOj2w3gawvbNgLUJ
 znNUplYJ669Mr/aNmKG4bmwjESpLtq9Vo6ZH3Cy+Zp9roVFGlgd0wZvBG5HbukW9uEPTGOwX5VL
 LlW6HeBmj4vFdGlpb+7nLNXXp5RJVyKI=
X-Gm-Gg: AY/fxX5RhykmUOb+hzz6VH1k4fzejsqmPK1bHROfi1L/qObrWvE4lbwgra+6UFTuvNO
 q5s5IZG9uP0WbxCQhkaTYreIT+mX+TamUQY+vZyujVY/L9fDT+J/wH6TESKQLlFlgtp3YktOQTY
 rgdhbSb4TLAow2pT9Iu2kOxpqbeH9TxM06566HabY0z5SXq7foY70eS4gw94TlplcaGsSs4NFoi
 6FapEkYu6IV79rbC5rvWODv2bJfe9UJ+4CXaeLz4++/jwCAZOUVTwGYmRO3quEqcxV9RG3X60di
 9UFeSkwD3SEBC3r4FxRtXhbWBuZnuoxluLV6mof/NFtWxQdpILKU0eHwt19sOj3N2gZKuCWbusD
 MhkvXb+h5c1Afihh/ypMFOT0hOegJqGPdBdMG
X-Received: by 2002:a17:907:724d:b0:b87:124c:5f54 with SMTP id
 a640c23a62f3a-b87932b6908mr228135666b.59.1768560974807; Fri, 16 Jan 2026
 02:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20260114120610.82531-1-mcanal@igalia.com>
 <121ede67-dbfc-4b79-8076-04693e9d3d53@gmail.com>
 <59cdede3-7757-4fe1-bb94-e7a93eea7611@igalia.com>
In-Reply-To: <59cdede3-7757-4fe1-bb94-e7a93eea7611@igalia.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 16 Jan 2026 10:56:03 +0000
X-Gm-Features: AZwV_Qh3vURpqiUWdDMv2MS1A-8fDyVxPzhEs3rm4JOXQLN-4xJ2oEQjFFmdjQk
Message-ID: <CALeDE9PGzTe4LXnDJcyhh_ietWkrf8Sp7xX=X6pZvdCWLx2huw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
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

On Fri, 16 Jan 2026 at 10:15, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Hi Peter,
>
> On 16/01/26 00:53, Peter Robinson wrote:
> > Hi Maira,
> >
> > On 14/01/2026 12:04, Ma=C3=ADra Canal wrote:
> >> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x"=
)
> >> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D
> >> device")
> >> added driver support for V3D on BCM2712, but the corresponding device
> >> tree node is still missing.
> >>
> >> Add the V3D device tree node to the BCM2712 DTS.
> >>
> >> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >>
> >> ---
> >> v1 -> v2:
> >>
> >> - Rebased on top of linux-next (Stefan Wahren)
> >> - Fixed node's address (2000000 -> 1002000000) (Stefan Wahren)
> >> - Link to v1: https://lore.kernel.org/linux-
> >> devicetree/20260113192902.48046-2-mcanal@igalia.com/
> >> ---
> >>   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  4 ++++
> >>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++=
++
> >>   2 files changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/
> >> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> index 7d4742ebe247..97522c6803c5 100644
> >> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> >> @@ -247,3 +247,7 @@ &pcie1 {
> >>   &pcie2 {
> >>       status =3D "okay";
> >>   };
> >> +
> >> +&v3d {
> >> +    clocks =3D <&firmware_clocks 5>;
> >
> > Looking at the upstream DT [1] I think this also needs a clock-names en=
try.
>
> Differently from the `hvs` node [1] you sent (which specifies clock-
> names), the `v3d` binding [2] doesn't have a clock-names property.
> Therefore, it is not needed.

There's a name in the clk driver [1] so maybe the bindings should be update=
d?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/clk/bcm/clk-raspberrypi.c#n26

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>
> Best regards,
> - Ma=C3=ADra
>
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
> > tree/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi#n233
> >
> >> +};
> >> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/
> >> boot/dts/broadcom/bcm2712.dtsi
> >> index 330a121ebfcb..661668ef7419 100644
> >> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> >> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> >> @@ -1,5 +1,6 @@
> >>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/soc/bcm2835-pm.h>
> >>   / {
> >>       compatible =3D "brcm,bcm2712";
> >> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
> >>               msi-ranges =3D <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING =
8>;
> >>               brcm,msi-offset =3D <8>;
> >>           };
> >> +
> >> +        v3d: gpu@1002000000 {
> >> +            compatible =3D "brcm,2712-v3d";
> >> +            reg =3D <0x10 0x02000000 0x00 0x4000>,
> >> +                  <0x10 0x02008000 0x00 0x6000>,
> >> +                  <0x10 0x02030800 0x00 0x0700>;
> >> +            reg-names =3D "hub", "core0", "sms";
> >> +
> >> +            power-domains =3D <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> >> +            resets =3D <&pm BCM2835_RESET_V3D>;
> >> +            interrupts =3D <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> >> +                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
> >> +        };
> >>       };
> >>       vc4: gpu {
>
