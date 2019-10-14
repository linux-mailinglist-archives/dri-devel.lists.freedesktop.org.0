Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646AD6FEE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7FD6E5FE;
	Tue, 15 Oct 2019 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C87D6E235;
 Mon, 14 Oct 2019 10:00:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01915B744;
 Mon, 14 Oct 2019 10:00:27 +0000 (UTC)
Message-ID: <f6262e61f858c6f50164416f4ea816e203c0704f.camel@suse.de>
Subject: Re: [PATCH 07/11] dts: arm64: layerscape: add dma-ranges property
 to qoric-mc node
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Shawn Guo <shawnguo@kernel.org>
Date: Mon, 14 Oct 2019 12:00:25 +0200
In-Reply-To: <20191014082847.GH12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
 <20191014082847.GH12262@dragon>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1481985063=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1481985063==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZhF7YshJftYaREkjx+2D"


--=-ZhF7YshJftYaREkjx+2D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-10-14 at 16:28 +0800, Shawn Guo wrote:
> On Tue, Sep 24, 2019 at 08:12:38PM +0200, Nicolas Saenz Julienne wrote:
> > qoriq-mc's dpmacs DMA configuration is inherited from their parent node=
,
> > which acts a bus in this regard. So far it maked all devices as
> > dma-coherent but no dma-ranges recommendation is made.
> >=20
> > The truth is that the underlying interconnect has DMA constraints, so
> > add an empty dma-ranges in qoriq-mc's node in order for DT's DMA
> > configuration code to get the DMA constraints from it.
> >=20
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>=20
> Updated subject prefix as 'arm64: dts: ...', and applied the patch.

Hi Shawn,
these two patches are no longer needed. This series has been superseded by =
this
patch[1] 951d48855d ('of: Make of_dma_get_range() work on bus nodes', avail=
able
in linux-next) which fixed the issue directly in OF code.

Sorry for the noise.

Regards,
Nicolas

[1] https://lkml.org/lkml/2019/10/8/870


--=-ZhF7YshJftYaREkjx+2D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl2kRzkACgkQlfZmHno8
x/7Fhwf+OOorwS/yz7Mxwwgctc4wXslUVL4P1ubRvAEQYZ0UGUVtM1WJqXjukymn
ydYIWe6mnmNSQqGYAEBcjzP/We/MxjMkpvpyMWkiJXiZvwXRs43BAcW5/eyvHNfD
EEF3n4HCXZYSbmR9kDBwpZPKeoMCsQJbZuEF6rHwGNZeKA+tVpMZFEC17BGhW8LW
MGx2W+1mXq7lLuDI5AIfnMt5Cqgl1IcsCzq4a2uRzNLXEDiQ5MFXaHVzroE0wWOQ
O6GCM0HAcnR1wi0pZgEgDQyFQeiI4txKfLZ0P1z8zgVM+bFtNum4qIrtLbYm0Ny0
y7htdJL8WlxXRHkbLVXIj0D71OiRYQ==
=Ip4t
-----END PGP SIGNATURE-----

--=-ZhF7YshJftYaREkjx+2D--


--===============1481985063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1481985063==--

