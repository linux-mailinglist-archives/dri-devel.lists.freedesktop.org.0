Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609888D6508
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:58:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DDC10E378;
	Fri, 31 May 2024 14:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OmMz+4zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA710E4C4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:58:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85C54CE18D9;
 Fri, 31 May 2024 14:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50720C116B1;
 Fri, 31 May 2024 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717167511;
 bh=g1eGXHdN0kkF++pfgnz1WIShz96T3A5ZcHkmqtw/Loc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmMz+4zslnz3CoeqQnw4R6MTFsDQPLnEs6swHFG8QQF9SYpF/35igdu+dIagmM9yN
 4A2Vkpnbrn+D8A9ONTwmM/yxSAtY+fB3+4wYewAn2xHme9a+bWLxYIb9ICJC7X+Q6s
 g/hBxxws2HElAZ5XTmy93gd0tFHDbycLSa4KrBHw7AUDGnLsGelmqYvdICYQyGkT0w
 UHtXY3hwlsppDvSryW6PhXu0rMyPGWmoOhnLjgboATs4lqNqACr2u9nMU+NTzMyzhS
 80r0loHtgrlHoxZbJ2b4co1qT7uj27CurSX70Lf/7mds00sRKp3Hv2BHX0n6CWe0nh
 i9ikqd5rw7bBA==
Date: Fri, 31 May 2024 15:58:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Message-ID: <20240531-rubbing-gala-4104e3051425@spud>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-2-wenst@chromium.org>
 <20240530-revisit-profanity-889f1bcae21a@spud>
 <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ys2BwcK/uLhX00G4"
Content-Disposition: inline
In-Reply-To: <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
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


--Ys2BwcK/uLhX00G4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 03:29:06PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 30, 2024 at 11:43=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, May 30, 2024 at 04:35:00PM +0800, Chen-Yu Tsai wrote:
> > > +        #include <dt-bindings/clock/mt8173-clk.h>
> > > +        #include <dt-bindings/power/mt8173-power.h>
> > > +
> > > +        mfgtop: clock-controller@13fff000 {
> >
> > The label here is used, so drop it.
>=20
> Assume you mean _not_ used. Dropping. :D

Correct :D

--Ys2BwcK/uLhX00G4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlnlkQAKCRB4tDGHoIJi
0giRAP94G90Cq94R7lpitEm0sZWkvKgob2eHruL8ul6FkP4EuwEAnm88tB8IKALh
7teTfUoOYj4sOcrhC/d5sE1XgPb58g8=
=BRoX
-----END PGP SIGNATURE-----

--Ys2BwcK/uLhX00G4--
