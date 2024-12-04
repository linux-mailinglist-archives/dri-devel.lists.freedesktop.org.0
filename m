Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE5F9E4592
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 21:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B167C10E570;
	Wed,  4 Dec 2024 20:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ii4Df9ET";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC17C10E570
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 20:22:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A1825C6D0F;
 Wed,  4 Dec 2024 20:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5556C4CECD;
 Wed,  4 Dec 2024 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733343769;
 bh=0trD3xgMuTcQ522NBjE3lOKrUeCloP+XOtSvdc704e8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ii4Df9ETJjJlTt+OFI6XJ4qtn4c1zLT2QMdivBw/V6WxCbffn+5GnT/x9V0jfnriG
 Ckj+ctFI030Oqp5kY2Ttv0zR6kOW749IuqszjgSBILW1RheoF2Qa5KYC5gQAeHkeYY
 60YmmVLwIiVObrU/sYeTsQfk677+TlpgqBD3deYZ0bMgchJ8BxteVjNdjA/02aIGEH
 dFzHP0jZ+vrXV/0LwSRwq4WXz2bREIb3pdAc/V4tfUOzKq/PcbQEXs5+DxByl0mhPX
 DX69u3WXwSYfdZICNYAciKuIOrB+b/3OnAnc+F9VlSw4N7qgQRppPV9nKXsxdcxBle
 T2bU/8iVNzqkQ==
Message-ID: <d15dc75cb5d0346bb56c58d4a933cf7e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
 <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com>
 <20241203134137.2114847-6-m.wilczynski@samsung.com>
 <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org>
 <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
 <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
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
Date: Wed, 04 Dec 2024 12:22:47 -0800
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

Quoting Stephen Boyd (2024-12-04 12:21:11)
> Quoting Michal Wilczynski (2024-12-04 02:11:26)
> >=20
> > To address this, I'll specify the 'reg' property in each node to define
> > the address ranges explicitly fragmenting the address space for the VOS=
YS
> > manually.
> >=20
> > vosys_clk: clock-controller@ffef528050 {
> >         compatible =3D "thead,th1520-clk-vo";
> >         reg =3D <0xff 0xef528050 0x0 0x8>;
> >         #clock-cells =3D <1>;
> > };
> >=20
> > pd: power-domain@ffef528000 {
> >         compatible =3D "thead,th1520-pd";
> >         reg =3D <0xff 0xef528000 0x0 0x8>;
> >         #power-domain-cells =3D <1>;
> > };
>=20
> You should have one node:
>=20
>     clock-controller@ffef528000 {
>       compatible =3D "thead,th1520-vo";
>       reg =3D <0xff 0xef528050 0x0 0x1a04>;

Apologies for the typo. Here's the correct line:

	reg =3D <0xff 0xef528000 0x0 0x1a04>;

>       #clock-cells =3D <1>;
>       #power-domain-cells =3D <1>;
>     };
>
