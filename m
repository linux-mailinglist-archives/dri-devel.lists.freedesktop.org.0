Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B6A40A9E
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 18:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1F10E240;
	Sat, 22 Feb 2025 17:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZYhhby/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74510E240
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 17:27:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C28C66112E;
 Sat, 22 Feb 2025 17:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A99C4CED1;
 Sat, 22 Feb 2025 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740245249;
 bh=CL61gAUqhb0sQMX+rTET5exH4siStwJSEMSACoiFGKo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYhhby/4+5agcCxUg89X9BuGaSUpK2vX48Zi2ELbrOmDCXhqRz09VtRY7G2+DiDBC
 Nc9lbo+FGDeBIfbYuE4iQKcOtg1B5iZ9uvMNDs4sdnzT+W43hfNxDfbJpIqcofEVqQ
 b3gi6tutBAyvMNwU9ZPH6ffIrDXE8DcmqqI9H0FwBJOH7FIOCbcfTfB9WCEl30Tcq3
 AANt0zcPRNgdWbJ8jFXyNxGHUohg4UNbEPUSeVZliARRtCNLa/+VkRfKGqHT9LFSfK
 72Oqf1cPmMpqz8lMLmD236A5/2ixgYB68+DB3PY++FgwOlHsTP3R50yITxKlOJqW3b
 VW71TkE0WbNaA==
Date: Sat, 22 Feb 2025 17:27:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>, Daniel
 Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <20250222172717.72b665fd@jic23-huawei>
In-Reply-To: <CAPVz0n0up=vkVzryYLauNCM2=hnz-o_ECm+ooXC8y=C2q+T_WQ@mail.gmail.com>
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-2-clamor95@gmail.com>
 <20250222142910.4e6b706d@jic23-huawei>
 <CAPVz0n0up=vkVzryYLauNCM2=hnz-o_ECm+ooXC8y=C2q+T_WQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Sat, 22 Feb 2025 16:39:31 +0200
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> =D1=81=D0=B1, 22 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:29 Jo=
nathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, 18 Feb 2025 15:26:59 +0200
> > Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> > =20
> > > Add bindings for the LM3533 - a complete power source for
> > > backlight, keypad, and indicator LEDs in smartphone handsets.
> > > The high-voltage inductive boost converter provides the
> > > power for two series LED strings display backlight and keypad
> > > functions. =20
> >
> > Wrap patch descriptions to 75 chars as describe in submitting-patches.r=
st
> > =20
>=20
> Alright, though why then checkpatch script has max line length 100 chars?
>=20
> https://github.com/torvalds/linux/commit/bdc48fa11e46f867ea4d75fa59ee87a7=
f48be144

Because that script is intended to catch when things are very wrong not
slightly so.  It provides guidance that you should look at and consider
whether to respond to.  Checking for short wrap is trickier to do as
perhaps the formatting is intended in some cases.


Jonathan

>=20
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com> =20

