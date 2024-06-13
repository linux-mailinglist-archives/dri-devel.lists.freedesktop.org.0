Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A63E907E40
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABA010EBB5;
	Thu, 13 Jun 2024 21:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3U5j0THM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D91610EBB5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718314684;
 bh=wQRJ+B8dKBMEN9aK4yJ8U5SXpzhbb+OTGleMQUKuqZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=3U5j0THMUJ8g3TXgXNLOldlc/L+6S0af1DsD+nf4VruKtFSMI9zfD7UEWckCp6Oe8
 xZdSCfQlC3YXT8JdgSZ5UO18t5lpRAfiYVksp8zxTVVRSL429X3chvDThh6rWSF664
 O/FDXk+Ieg9s1fDnggez30MDPHvzEN5q6zgAcB0PCbplAgyNUyjqH1gOrfIC4ODqj3
 Im14L91ZzI2t/oSZ8T1c5L/GGpCrWjyFEqLuH1NKJl+2qdFQwyZN2HSFjCERToNIuJ
 5fRECQaz9HWZAIhveINAE+sdcQ9LjAo4W8RDFS3P57rk06CEq1r8xF8g8qkfkuUnnQ
 vigHnKwXkfKYQ==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A2AB37820CD;
 Thu, 13 Jun 2024 21:38:04 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id 046AC10608F7; Thu, 13 Jun 2024 23:38:04 +0200 (CEST)
Date: Thu, 13 Jun 2024 23:38:03 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/9] iommu/rockchip: Attach multiple power domains
Message-ID: <vmgk4wmlxbsb7lphq2ep3xnxx3mbv6e6lecihtftxoyp5lidvy@mectcwirrlek>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-2-060e48eea250@tomeuvizoso.net>
 <ffviz6ak6qsn2reg5y35aerzy7wxfx6fzix6xjyminbhfcguus@clszdjakdcjd>
 <CAAObsKCx+r5UuESnrPem1Rb1-BF4i8FVwu6uozWhABOWoq+M4Q@mail.gmail.com>
 <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3uic2ihq2a6l3k3w"
Content-Disposition: inline
In-Reply-To: <CAAObsKChaBZ2C5ezWsiZ_LoN6R2HFhFA9=UNSRYB6cyeo-jreg@mail.gmail.com>
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


--3uic2ihq2a6l3k3w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 13, 2024 at 11:34:02AM GMT, Tomeu Vizoso wrote:
> On Thu, Jun 13, 2024 at 11:24=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.=
net> wrote:
> > On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > > On Wed, Jun 12, 2024 at 03:52:55PM GMT, Tomeu Vizoso wrote:
> > > > IOMMUs with multiple base addresses can also have multiple power
> > > > domains.
> > > >
> > > > The base framework only takes care of a single power domain, as some
> > > > devices will need for these power domains to be powered on in a spe=
cific
> > > > order.
> > > >
> > > > Use a helper function to stablish links in the order in which they =
are
> > > > in the DT.
> > > >
> > > > This is needed by the IOMMU used by the NPU in the RK3588.
> > > >
> > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > ---
> > >
> > > To me it looks like this is multiple IOMMUs, which should each get
> > > their own node. I don't see a good reason for merging these
> > > together.
> >
> > I have made quite a few attempts at splitting the IOMMUs and also the
> > cores, but I wasn't able to get things working stably. The TRM is
> > really scant about how the 4 IOMMU instances relate to each other, and
> > what the fourth one is for.
> >
> > Given that the vendor driver treats them as a single IOMMU with four
> > instances and we don't have any information on them, I resigned myself
> > to just have them as a single device.
> >
> > I would love to be proved wrong though and find a way fo getting
> > things stably as different devices so they can be powered on and off
> > as needed. We could save quite some code as well.
>=20
> FWIW, here a few ways how I tried to structure the DT nodes, none of
> these worked reliably:
>=20
> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-de=
vices-power/arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-schema-subn=
odes//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1162
> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-de=
vices//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L1163
> https://gitlab.freedesktop.org/tomeu/linux/-/blob/6.10-rocket-multiple-io=
mmus//arch/arm64/boot/dts/rockchip/rk3588s.dtsi?ref_type=3Dheads#L2669
>=20
> I can very well imagine I missed some way of getting this to work, but
> for every attempt, the domains, iommus and cores were resumed in
> different orders that presumably caused problems during concurrent
> execution fo workloads.
>=20
> So I fell back to what the vendor driver does, which works reliably
> (but all cores have to be powered on at the same time).

Mh. The "6.10-rocket-multiple-iommus" branch seems wrong. There is
only one iommu node in that. I would have expected a test with

rknn {
    // combined device

    iommus =3D <&iommu1>, <&iommu2>, ...;
};

Otherwise I think I would go with the schema-subnodes variant. The
driver can initially walk through the sub-nodes and collect the
resources into the main device, so on the driver side nothing would
really change. But that has a couple of advantages:

1. DT and DT binding are easier to read
2. It's similar to e.g. CPU cores each having their own node
3. Easy to extend to more cores in the future
4. The kernel can easily switch to proper per-core device model when
   the problem has been identified

-- Sebastian

--3uic2ihq2a6l3k3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZrZrgACgkQ2O7X88g7
+pqvVQ//cIZokM7uuQmsxYEnzeSuLFKCBJ+oWnWgh4a++M1EuS1b/w0P6VZVbhIW
iEJSHCfTPBss/DPmCD1r7EbFZNZAV4YUo+rk8mwj+BXs2UqekcEFIsyaHoMKvqGo
i8NJGn2b2vqDx0UJg7vyjE84lETeT1d5MbVF6wPoP8JaUztKLIx4fl80aT88LTdS
i8gbGH7lSQzRcGm15LRYo63i8jlD5uB+nCoeZ0cVWgCBO0pTFAZd4rcrfl3YubT2
qozKnZYjsOnsWuoul/3CAqoXSci6wmvnkEQAo3CnIWAjHBW6/ym9qE4WhHM/TTVs
yeSaIOV6tBrSGM4JOrHRGv3yPNHG+ZitS2Kbu3W8Am0wtKcyzff52LoOvaM8wgVV
UBxrpXaFg7wuVU9t2wdb8vCwrl6N8zHk/hVUBA2pR+NI64eQ7oCCakzet3ZecegK
npkoGWt7nX+fihR62gS04M36rL1KPEuvPgp6BpFklhndvXeOxgRlaGI0fDxooHXM
KIzNF6cHZSDspUenm7oYNGzw5hRfOvy64fuyRXzOTOiNMrNZKS69I76SDqEuC3fw
k3Y3O9GHR0DwIH7N9OoW0b7YDkUXerqTrghj88+VsEQPU7ObVS/NO+HHWbVAuv40
weMFQJ5Ceqsm4+9tAMmJKZpoOPubYnRaYD+u8yxwoNVdPb3DEIo=
=08Xd
-----END PGP SIGNATURE-----

--3uic2ihq2a6l3k3w--
