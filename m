Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A838B4336D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2C510E987;
	Thu,  4 Sep 2025 07:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="NH7GAz86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441AA10E987;
 Thu,  4 Sep 2025 07:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756969689; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GL62wGC45A2lfwNmxK3TvV+dA8GVYqqoCli0Vfbho9/hiqN6gwieBzshVdY7q7+XiGwf1Anv720UQLPoGHZ5DSXO/uiU1s3mFSLx9WFuyWQ3STE9rLvm45R6yTextg2fFw6d9TLf8Sus+9EbrIDXTXGELJyE9Bk/f//mZGGPE7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756969689;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=U92wAadGlZGVk5xT5ZZbqnMlSjqsBe3r1oVXLxvdA00=; 
 b=ewN3dqtbOAl9ZapX4b0yMP4Sem5lMGn1cG1tVX9b0bkWPv5d5xC86bF0WN279Xlh8ZA1puhbM2vO6GrBvcL/F3AB7Ny+/JGEMC7vN74V9h08y4gukyqoR3dh+kZ50PfWrybuOj7HRyDAw0ZPTuXHWjIHlhdoEQZFt/38WpYKpBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756969689; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=U92wAadGlZGVk5xT5ZZbqnMlSjqsBe3r1oVXLxvdA00=;
 b=NH7GAz864YOPnmwGKqID7Dk4LrahqybEbzr6AYVqgt5aGhbdtm3D4O7YKv+9dcBk
 9UZlYPWCSr1qoprBDkgKvAT8Qy3LM5RZuz20rE4ocO+ZsXnzUaijXuHDsHVt6PJCZUO
 CWE0FOfPHG6WOkkeb5oJVVo+Xf7A9I7tKcWfVBNAUyIogOVBlfDk1LiEJ/Gm342qmQb
 VhR7FO73FSg/oSeGU1i+v0qd041ti3DbW9ybpYY6Gvw7+yaWuLduZ/NDLkmJ1XBOnjc
 s+5PV7T3S2nki1p08A4AfQkzFbhsJJUVoGjpjmjY4iuhbb+RadaRvaKI1z7Dk0qCqn5
 AfkiSt4NLA==
Received: by mx.zohomail.com with SMTPS id 17569696873581023.1645151047042;
 Thu, 4 Sep 2025 00:08:07 -0700 (PDT)
Message-ID: <d660ad830b5c1fcafd398049897ab1acd68c5dca.camel@icenowy.me>
Subject: Re: drm/etnaviv: detecting disabled Vivante GPU?
From: Icenowy Zheng <uwu@icenowy.me>
To: Andre Przywara <andre.przywara@arm.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Date: Thu, 04 Sep 2025 15:08:02 +0800
In-Reply-To: <20250904002924.2bc63b73@minigeek.lan>
References: <20250904002924.2bc63b73@minigeek.lan>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-09-04=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 00:29 +0100=EF=BC=
=8CAndre Przywara=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> the Allwinner A523/A527/T527 family of SoCs feature a Vivante
> "VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
> See https://linux-sunxi.org/A523#Family_of_sun55iw3=C2=A0for a table, the
> row labelled "NPU" indicates which model has the IP. We suspect it's
> all the same die, with the NPU selectively fused off on some
> packages.
>=20
> Board vendors seem to use multiple SKUs of the SoC on the same board,

In the case of Amlogic things, they seem to provide different DT's, see
arch/arm64/boot/dts/amlogic/meson-g12b-a311d-bananapi-m2s.dts and
arch/arm64/boot/dts/amlogic/meson-g12b-s922x-bananapi-m2s.dts ; the
A311D is NPU-equipped SKU. (Although I don't know why they included
different DTSI's and then still enable &npu node in a311d variant of
board DT)

> so it's hard to say which particular board has the NPU or not. We
> figured that on unsupported SoCs all the NPU registers read as 0,
> though, so were wondering if that could be considered as a bail-out
> check for the driver?
> At the moment I get this, on a SoC with a disabled NPU:
> [=C2=A0=C2=A0=C2=A0 1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu=
_ops)
> [=C2=A0=C2=A0=C2=A0 1.683849] etnaviv-gpu 7122000.npu: model: GC0, revisi=
on: 0
> [=C2=A0=C2=A0=C2=A0 1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
> [=C2=A0=C2=A0=C2=A0 1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv=
 on minor 0
> [=C2=A0=C2=A0=C2=A0 1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, =
mask:
> 0x00000000
>=20
> Chen-Yu got this on his board featuring the NPU:
> =C2=A0=C2=A0=C2=A0 etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003
>=20
> If I get the code correctly, then etnaviv_gpu_init() correctly
> detects
> the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
> etnaviv_drv.c then somewhat ignores this, since it keeps looking for
> more
> GPUs, and fails to notice that *none* showed up:
> /sys/kernel/debug/dri/etnaviv/gpu is empty in my case.
>=20
> Quick questions:
> - Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
> =C2=A0 registers) an invalid ID, so we can use that to detect those
> disabled
> =C2=A0 NPUs? If not, can any other register used to check this? The whole
> =C2=A0 block seems to be RAZ/WI when the NPU is disabled.
>=20
> - Would it be acceptable to change the logic to error out of the
> =C2=A0 driver's init or probe routine when no GPU/NPU has been found, at
> =C2=A0 best with a proper error message? As it stands at the moment, the
> =C2=A0 driver is loaded, but of course nothing is usable, so it keeps
> =C2=A0 confusing users.
>=20
> Happy to provide a patch, but just wanted to test the waters.
>=20
> Cheers,
> Andre

