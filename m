Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D24AECED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BF110E589;
	Wed,  9 Feb 2022 08:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7BD10E589
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:43:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86C8E5801B0;
 Wed,  9 Feb 2022 03:43:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 09 Feb 2022 03:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=e4SNWw1WtTCp7PF56Ssx0zWDy7EUAXFNe2S8oS
 +po3s=; b=hFyiVZGDMWtv3gen1AiZtgpuyh1rZdV7h4HBZzWAQ7J0tOz6geOiWu
 YqTrbHnACfOxK9NiK6//272qHuqd3DcWd0c6Nao5tl5qEiXtlysRgAKijU0+/QcC
 e1c4iFJ6vw9EjMfES0LDCOxQNEo/S3uWUU8S2Ew18wjQEkq9rXmkYMy+74jr7qZ/
 XFu7FlNehZ8iTPmEsehOvpzr/WubgmvpW8xiKz/+H2ocHYhS/XI/++lJ/+YYofuw
 BODwsN7Y4sucSi231AJ+R40y5i9+Fj56zBLP1BVIZn7YOjONfyd0hyfK/QXL7+gh
 crIZ2JoKnyf4eykrIOoYoQaGatVThLFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e4SNWw1WtTCp7PF56
 Ssx0zWDy7EUAXFNe2S8oS+po3s=; b=MdXDUF3S3B/nbiCsFioEnKoZrWHh+q8XB
 EqcQXIBjCIgP3uJ6HmKC0X9B+p/v/+q4yC50A+jPgOuS+LBDcPqip4SkxuV+zYFt
 OeU0/b3z17a1RmKSy5kMUyM/vOfPcC4bYUE0t6AUjkxuL0rvNG/Wfj+7WjEl1XX/
 MPNLQYfFMqx+DUzb+wZdGZYg6xyS3XgU8/EP+/z1yaEAKr2rdJYPKaJ5MAOfe/tp
 OVFEJ7q7d7dd20H2SUzsZq5ZkDJmH0akonUKzs5OwGaBu7+Yfa7RCVk9Asnz7PdJ
 2nLeHwYK5stabM6p+uHzGoY0Z5HnpDQMJNwCxSaGWPTVrlcWY0yNA==
X-ME-Sender: <xms:tH4DYkPtl1-LucRywoZanVl6Lrnloi8WBO6Tp6eWHDygsH0o9DbuFw>
 <xme:tH4DYq9TlE5BQbRzzS9AqVgN16KBdCs1jcqt2gJffqNWNQaLub3fpS4Xz_WrUKwgP
 cKyiQupWr5nnvk4hhI>
X-ME-Received: <xmr:tH4DYrQzC5fMP3U_DgY-6FQOjXPpHH6JzISZCNYBExzSQM-VXyvSRXh8NTWMXE0CB7H5hHTyV_VQ9UPYj0gAlfAsFAGJSVdZwu_aWYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgedtffduveeukeejtdefkeeljeehheeluefhkedtkeegteetledtffelfedu
 udeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdplhhkmhhlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegt
 vghrnhhordhtvggthh
X-ME-Proxy: <xmx:tH4DYssnDGdEgWSn_mOMmwMOCfpLpFHDk-smMxjdR8zpY3TRlSKifw>
 <xmx:tH4DYscXVcHJJ6B3l_EwIwo3FrSUiRYkEefYg_nWBxdVmSoO8cUjow>
 <xmx:tH4DYg2G8sLZdtHEfFQbJTJTN3NvNdDlHdqnOrvKgnwA6AxkLqP1WQ>
 <xmx:tn4DYrDIqBBOk_zHZjLl9Yy6WRcPWLN7LWtQE7KQ_3PdPABIy__fBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 03:43:32 -0500 (EST)
Date: Wed, 9 Feb 2022 09:43:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220209084331.fpq5ng3yuqxmby4q@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gllwwgxlqy73i5no"
Content-Disposition: inline
In-Reply-To: <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gllwwgxlqy73i5no
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 12:29:39AM +0800, Sui Jingfeng wrote:
> > > +static int lsdc_modeset =3D 1;
> > > +MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 =3D enable=
d(default), 0 =3D disabled)");
> > > +module_param_named(modeset, lsdc_modeset, int, 0644);
> > > +
> > > +static int lsdc_cached_coherent =3D 1;
> > > +MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 =3D=
 enabled(default), 0 =3D disabled)");
> > > +module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
> > > +
> > > +static int lsdc_dirty_update =3D -1;
> > > +MODULE_PARM_DESC(dirty_update, "enable dirty update(1 =3D enabled, 0=
 =3D disabled(default))");
> > > +module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
> > > +
> > > +static int lsdc_use_vram_helper =3D -1;
> > > +MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 =
=3D enabled, 0 =3D disabled(default))");
> > > +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
> > > +
> > > +static int lsdc_verbose =3D -1;
> > > +MODULE_PARM_DESC(verbose, "Enable/disable print some key information=
");
> > > +module_param_named(verbose, lsdc_verbose, int, 0644);
> >
> > It's not really clear to me why you need any of those parameters. Why
> > would a user want to use a non coherent mapping for example?
> >=20
> Because we are Mips architecture. Paul Cercueil already explained it
> in his mmap GEM buffers cachedpatch  <https://lkml.kernel.org/lkml/202008=
22164233.71583-1-paul@crapouillou.net/T/>. I drag part of it to here for
> convenient to reading:
>=20
> /Traditionally, GEM buffers are mapped write-combine. Writes to the buffer
> are accelerated, and reads are slow. Application doing lots////of
> alpha-blending paint inside shadow buffers, which is then memcpy'd////into
> the final GEM buffer.///
> "non coherent mapping" is actually cached and it is for CMA helpers
> base driver, not for VRAM helper based driver. For Loongson CPU/SoCs.
> The cache coherency is maintained by hardware, therefore there no
> need to worry about coherency problems. This is true at least for
> ls3a3000, ls3a4000 and ls3a5000.
>=20
> "non coherent" or "coherent" is not important here, the key point is
> that the backing memory of the framebuffer is cached with non coherent
> mapping, you don't need a shadow buffer layer when using X server's
> modesetting driver.
>=20
> Read and write to the framebuffer in system memory is much faster than
> read and write to the framebuffer in the VRAM.
>=20
> Why CMA helper based solution is faster than the VRAM based solution on M=
ips platform?
>=20
> Partly because of the CPU have L1, L2 and L3 cache, especially L3 cache
> is as large as 8MB, read and write from the cache is fast.
>=20
> Another reason is as Paul Cercueil said, read from VRAM with write-combine
> cache mode is slow. it is just uncache read.
> Please note that we don't have a GPU here, we are just a display controll=
er.
>=20
> For the VRAM helper based driver case, the backing memory of the framebuf=
fer
> is located at VRAM, When using X server's modesetting driver, we have to =
enable
> the ShadowFB option, Uncache acceleration support(at the kernel size) sho=
uld
> also be enabled. Otherwise the performance of graphic application is just=
 slow.
>=20
> Beside write-combine cache mode have bugs on our platform, a kernel side
> developer have disabled it. Write-combine cache mode just boil down to un=
cached
> now. See [1] and [2]
>=20
> [1]https://lkml.org/lkml/2020/8/10/255
> [2]https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtie=
zhu@loongson.cn/T/
>
> This is the reason why we prefer CMA helper base solution with non cohere=
nt mapping,
> simply because it is fast.
>=20
> As far as I know, Loongson's CPU does not has the concept of write-combin=
e,
> it only support three caching mode:  uncached, cached and uncache acceler=
ation.
> write-combine is implemented with uncache acceleration on Mips.

My point wasn't just about the VRAM vs CMA stuff, it was about why do
you need all those switches in the first place?

Take the verbose parameter for example: it's entirely redundant with the
already existing, documented, DRM logging infrastructure.

Then, you have "modeset", and I'm not sure why it's supposed to be
there, at all. This is a modesetting driver, why would I want to disable
modesetting entirely?

More fundamentally (and this extends to the CMA, caching and VRAM stuff
you explained above), why can't the driver pick the right decision all
the time and why would that be under the user control?

You were mentioning that you need to work-around MIPS memory management.
Then fine, just do that on MIPS, and don't it on the other architectures
that don't need it. There's no need for a knob.

Maxime

--gllwwgxlqy73i5no
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgN+swAKCRDj7w1vZxhR
xWWcAP48yidh+QiEzNhw7kqNLofKta0Ed9GODCtO98/Fa8LRuwEA5xKXu2ByzsHD
iv6Q2TXa6lvKdV8aLFv2WYKGKNnC0w0=
=Du2J
-----END PGP SIGNATURE-----

--gllwwgxlqy73i5no--
