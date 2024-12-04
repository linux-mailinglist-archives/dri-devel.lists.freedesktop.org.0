Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FCA9E458C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 21:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEDE10E56B;
	Wed,  4 Dec 2024 20:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M2cEbKOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9105510E56B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 20:21:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 941C85C6F92;
 Wed,  4 Dec 2024 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3121C4CED1;
 Wed,  4 Dec 2024 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733343674;
 bh=Fvm8TjgK6dJo9sv6O3H2+X+LOIwV0o7fADFI/iSpstQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=M2cEbKOwrwNXj/0EW5nPs7opxCoG9ZxUJ6pP+Ao0yOfCpW+0b/QRhU8GIo5XzO2/W
 9giaByRFWJLRCKWF+ueHmf5tSkYX+aLu1kM497LHq/lAmlcprxdbRz5hpOO0tGip7o
 96tH3N7Uk9Ysb3154VA1c0Sz7UAO6ShuCbkTz2qrRdU5IdGIsjWk0uV/X9m4N/QUDY
 DlI2mpNybcduhZDH6L0P2JeKABEKKCjy1VKIaDs9fIzq/2Jb8T0cjjvf3UY00zfjHo
 KaXAy0e0iK83A/Sj08R7/R/wbpxfrgce6lLjgfTH0BIwk+1sHHR13uWFBKMtJUZ3nj
 EdkVwnlbvWKAg==
Message-ID: <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
 <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org>
 <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,
 th1520: Add support for Video Output subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com,
 frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com,
 jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com,
 maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, mripard@kernel.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, ulf.hansson@linaro.org,
 wefu@redhat.com
Date: Wed, 04 Dec 2024 12:21:11 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Michal Wilczynski (2024-12-04 02:11:26)
> On 12/3/24 16:45, Krzysztof Kozlowski wrote:
> > On 03/12/2024 14:41, Michal Wilczynski wrote:
>=20
> [1] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs=
/TH1520%20Video%20Image%20Processing%20User%20Manual.pdf
> >=20
> >> +      these registers reside in the same address space, access to
> >> +      them is coordinated through a shared syscon regmap provided by
> >> +      the specified syscon node.
> >=20
> > Drop last sentence. syscon regmap is a Linux term, not hardware one.
> >=20
> > Anyway, this needs to be constrained per variant.
> >=20
> >> +
> >>    "#clock-cells":
> >>      const: 1
> >>      description:
> >> @@ -36,8 +51,6 @@ properties:
> >> =20
> >>  required:
> >>    - compatible
> >> -  - reg
> >=20
> > No, that's a clear NAK. You claim you have no address space but in the
> > same time you have address space via regmap.
>=20
> I see your concern. The VOSYS subsystem's address space includes
> registers for various components, such as clock gates and reset
> controls, which are scattered throughout the address space as specified
> in the manual 4.4.1 [2]. Initially, I attempted to use a shared syscon
> regmap for access, but I realize this might not be the best approach.
>=20
> To address this, I'll specify the 'reg' property in each node to define
> the address ranges explicitly fragmenting the address space for the VOSYS
> manually.
>=20
> vosys_clk: clock-controller@ffef528050 {
>         compatible =3D "thead,th1520-clk-vo";
>         reg =3D <0xff 0xef528050 0x0 0x8>;
>         #clock-cells =3D <1>;
> };
>=20
> pd: power-domain@ffef528000 {
>         compatible =3D "thead,th1520-pd";
>         reg =3D <0xff 0xef528000 0x0 0x8>;
>         #power-domain-cells =3D <1>;
> };

You should have one node:

    clock-controller@ffef528000 {
      compatible =3D "thead,th1520-vo";
      reg =3D <0xff 0xef528050 0x0 0x1a04>;
      #clock-cells =3D <1>;
      #power-domain-cells =3D <1>;
    };
