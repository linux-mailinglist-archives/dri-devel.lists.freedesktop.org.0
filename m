Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39618A44AB
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 20:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF4710E754;
	Sun, 14 Apr 2024 18:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WUo13HAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA8A10E614
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 18:44:14 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so2274312276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1713120253; x=1713725053;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sf5vLAJueA07TKl2QntJTPXKSYE+dZtO6DFJk50gtZ8=;
 b=WUo13HAflne5hwmvi42mamKRH4KBSn5LgOixXFb410Prn3vJRxddOS8CAG7QyePK26
 SWw8q2BjZzdh+RrGymlEnGQG5fPFkGWcVSGQc0yNVLyF/bmuKF+goDrt7LVBftHJTrec
 GrLYBxFhnlbyjprwlCqyhf+DWdTE0Mpe0QOuN/lJDAHdQx7fJ07gBbgIKXl3Ut9edKpY
 HvJV28VHXVauI3wC1Fiudetg8YAexMwiwZH388uC4mh1McaallIJWAy6Jd1UzY8YD29D
 Rbbinbc+kBsTBdrEINi+ktgw0kfFf5Fdq2ztgHfqEnA5QHp6IQdfWfgCBRxwaGWa7yBN
 P4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713120253; x=1713725053;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sf5vLAJueA07TKl2QntJTPXKSYE+dZtO6DFJk50gtZ8=;
 b=R4tCl3ll3h9AwJYFLvIg6qUwnff+733ZfhQXjWiareZ1Kjn6ZwNQn5OtQbxpBtE5Yy
 wkz7Emj0zVmBpFtxi1smaywc9WnsAXtgzoctdHkvz5iWpJUPbmCiSEnh6bQdpAa5J2D/
 zztiefMnwiu2hJk9m2npf5DBUN7tt+6Zj1h1iR81+b1kAnKdnvYPjXdFoftV6BDnsxQO
 bnmFO+4V7Goa6QhJEWce6BYb9P2nIswhPifyjnHU28TGiDVmVNVBDSpTjOx2PYU2Ds/a
 pziEH50r2d1jf+bj/yMBMYJ1elNMjp4XWEzXJrDOj6XT+Z7XYKmV7LengeKJXiryTizE
 u6Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1iHHGVj7XhU6gN5IN0F2t/KKNYc9fp8lixa6DIDaYdPVgbzbQh9pq7sJ9aIBZGgeTKNKww//e1/m3ka3FwtEMGKSHtSyozFjhr1yTnPfE
X-Gm-Message-State: AOJu0YzD4MLECD/wTrsH1Rrr+m3PsKduKLWPQAp4KBL/QUgdLq8oSmwi
 d9ZppzkTytl9ltmcPxtkJv5qYWLaMhAwelWTVuSYu20AJLLSAjpRusXyaIQpC+GWKAyRH52zE54
 6IPQQYqV/P/fNKkEVrLD0+8VriiDh3quQT5N1MQ==
X-Google-Smtp-Source: AGHT+IGVydNa1vTd9hyzDQ9SfhKJzHNE7/2Sntj3xyFftSnE1kP1GUi5CqazY6KprU8+LfUkVsdqCz5iVlF/BC2ym80=
X-Received: by 2002:a25:901:0:b0:dc7:46ef:8b9e with SMTP id
 1-20020a250901000000b00dc746ef8b9emr8075460ybj.29.1713120248451; Sun, 14 Apr
 2024 11:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240412132559.2365947-1-mcanal@igalia.com>
 <41694292-af1f-4760-a7b6-101ed5dd6f9d@gmx.net>
In-Reply-To: <41694292-af1f-4760-a7b6-101ed5dd6f9d@gmx.net>
From: Phil Elwell <phil@raspberrypi.com>
Date: Sun, 14 Apr 2024 19:43:57 +0100
Message-ID: <CAMEGJJ2mkuBZjo+OAnkVCEi=73zMpXNUwzRqsAOckMhUeN_WJw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: bcm2835: Enable 3D rendering through V3D
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andre Przywara <andre.przywara@arm.com>,
 Romain Perier <romain.perier@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel-dev@igalia.com
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

Hello all,

On Fri, 12 Apr 2024 at 18:17, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Ma=C3=ADra,
>
> [add Phil & Dave]
>
> Am 12.04.24 um 15:25 schrieb Ma=C3=ADra Canal:
> > RPi 0-3 is packed with a GPU that provides 3D rendering capabilities to
> > the RPi. Currently, the downstream kernel uses an overlay to enable the
> > GPU and use GPU hardware acceleration. When deploying a mainline kernel
> > to the RPi 0-3, we end up without any GPU hardware acceleration
> > (essentially, we can't use the OpenGL driver).
> >
> > Therefore, enable the V3D core for the RPi 0-3 in the mainline kernel.
> thanks for trying to improve the combination Raspberry Pi OS + Mainline
> Kernel. I think i'm able to reproduce the issue with Raspberry Pi 3 B +
> on Buster.

Buster? We launched Buster with 4.19 and ended on 5.10. We've moved
onto Bookworm now. A lot has changed in that time...

> From the kernel side everything looks good:
>
> [   11.054833] vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc=
4])
> [   11.055118] vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4]=
)
> [   11.055340] vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4]=
)
> [   11.055521] vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops
> vc4_crtc_ops [vc4])
> [   11.055695] vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops
> vc4_crtc_ops [vc4])
> [   11.055874] vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops
> vc4_crtc_ops [vc4])
> [   11.056020] vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4]=
)
> [   11.063277] Bluetooth: hci0: BCM4345C0
> 'brcm/BCM4345C0.raspberrypi,3-model-b-plus.hcd' Patch
> [   11.070466] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor =
0
> [   11.174803] Console: switching to colour frame buffer device 240x75
> [   11.205125] vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
>
> But in Raspberry Pi OS there is a systemd script which is trying to
> check for the V3D driver /usr/lib/systemd/scripts/gldriver_test.sh
> Within the first check "raspi-config nonint is_kms" is called, which
> always seems to fail. If i run strace on this command it seems to check
> for /proc/device-tree/soc/v3d@7ec00000/status which doesn't exists in
> the Mainline device tree.
>
> Maybe there is a chance to improve the userspace tool?

...such as the raspi-config tool, which now always succeeds for is_kms.

Phil

> >
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > ---
> >
> > I decided to add the status property to the `bcm2835-common.dtsi`, but
> > there are two other options:
> >
> > 1. To add the status property to the `bcm2835-rpi-common.dtsi` file
> > 2. To add the status property to each individual RPi model, e.g.
> > `bcm2837-rpi-3-b.dts`.
> >
> > Let me know which option is more suitable, and if `bcm2835-common.dtsi`
> > is not the best option, I can send a v2.
> >
> > Best Regards,
> > - Ma=C3=ADra
> >
> >   arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/=
boot/dts/broadcom/bcm2835-common.dtsi
> > index 9261b67dbee1..851a6bce1939 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> > +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> > @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
> >                       compatible =3D "brcm,bcm2835-v3d";
> >                       reg =3D <0x7ec00000 0x1000>;
> >                       interrupts =3D <1 10>;
> > +                     status =3D "okay";
> >               };
> >
> >               vc4: gpu {
>
