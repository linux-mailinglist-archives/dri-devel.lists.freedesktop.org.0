Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3414AED26
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF49010E60B;
	Wed,  9 Feb 2022 08:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46C10E60B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:52:20 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EA74580152;
 Wed,  9 Feb 2022 03:52:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 09 Feb 2022 03:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5AsuKlg9T3wRs6EodVp0NmABKRFh6ykn6emryp
 MFqcE=; b=tJSbjzcafZKt16I56xV6jV5vxF1WGT5F2+4G9QjLLNk423jTTeO2Rc
 zHnaWdr4mAAI6soRoHBZs56pjt7JAyvUzDI6GRCzQyj1a1gmZ7g+T2wmruVOYhGj
 U/i8/jIg/iMTj3m7IC0/YXArfNPbCRIVDNcaXxkb7ake0Bexf2mKo3K2mth34ue9
 WLD/Ki/AzraJGy50OZolC5AQjIFIQIrBZDPoNZ06+D6S+73CfEI/dq20rVCx1pd1
 cC9msnw+U26YI4SnONvNadAzIHz1jx1T6tAsQ4IVX3uKRycsWBDPf5gB3N4FcDig
 1icVgoCuAhNoi87sqBua/4Aubd977JjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5AsuKlg9T3wRs6Eod
 Vp0NmABKRFh6ykn6emrypMFqcE=; b=VbtCkvnpzlBFH8WTmpIt6LRDreCQoQJub
 Fzshu4pCLO2vq7pubT2yKFTwOh33ovalCRzkgYSFDs630Mn0JznhTazTWLuminSU
 TGtgVwpIdKX9mF95t51To8n6ZHd2o22kRHvqvXqKgBWHMNGJUOywiLKq1/nrTHzA
 U+AoPm1h6GAcJhtILdf7WEt3n+5sUIfpqQ7oIWwoKb4ZqArlIMDXa/dbBCufPPHJ
 guqKP+1Dln9I5NvE17l0JStDxAOyQH3xDRTjmz/wyw2lfz5w47HGc+HJo6QGJJjv
 o7gpY1rPw7VatRLSZWGQwb8KttgfDtgCmtoUqcT3wc/KqRDUb84Ig==
X-ME-Sender: <xms:woADYq-0eSssQcGmiFliY3197FJPDabzDoC5c-S9rmwOLV775OJ_1Q>
 <xme:woADYqtEcXYvnyvCziOKFwlhuM7_YdaFtgdOJ9NbhwXNdDn_Zt9COsgBJll-AVbkD
 SvRVm4Tt4AhVHFectY>
X-ME-Received: <xmr:woADYgA38MA3W3u_26f06nr8SC5tbUkS9nWe-Fu400YyD4TsPT9NfVPv1JlUkACVYB5DVpbsR_OoORf2kChjlYi5mTc_XN8zhy4PTyE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:woADYifXlPCUf4Pfw4h2SaQnZtk1p0MS281dIBhl632sONAVXFFHfQ>
 <xmx:woADYvNp5I5KNjAOyPv_QIUqQYGc9vVFIxWKktj5IhiM1bXk7_mYZw>
 <xmx:woADYskKXPWxqIOgq3sOBSXwGBjJfH41bx-0ka5XOLVCipe0HYtfNA>
 <xmx:w4ADYoz22sbKeC_hoJ5t4JY_gwAnhHwWZLPgo9_GLLuWGA3EgMUojg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 03:52:17 -0500 (EST)
Date: Wed, 9 Feb 2022 09:52:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220209085215.65qbdsgwtnvujdng@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ya7qckwy2foywkx2"
Content-Disposition: inline
In-Reply-To: <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
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


--ya7qckwy2foywkx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 11:47:16PM +0800, Sui Jingfeng wrote:
> On 2022/2/3 16:58, Maxime Ripard wrote:
> > > diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kcon=
fig
> > > new file mode 100644
> > > index 000000000000..7ed1b0fdbe1b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/lsdc/Kconfig
> > > @@ -0,0 +1,38 @@
> > > +config DRM_LSDC
> > > +	tristate "DRM Support for loongson's display controller"
> > > +	depends on DRM && PCI
> > > +	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
> > > +	select OF
> > > +	select CMA if HAVE_DMA_CONTIGUOUS
> > > +	select DMA_CMA if HAVE_DMA_CONTIGUOUS
> > > +	select DRM_KMS_HELPER
> > > +	select DRM_KMS_FB_HELPER
> > > +	select DRM_GEM_CMA_HELPER
> > > +	select VIDEOMODE_HELPERS
> > > +	select BACKLIGHT_PWM if CPU_LOONGSON2K
> > > +	select I2C_GPIO if CPU_LOONGSON2K
> > > +	select I2C_LS2X if CPU_LOONGSON2K
> > > +	default m
> > > +	help
> > > +	  This is a KMS driver for the display controller in the LS7A1000
> > > +	  bridge chip and LS2K1000 SoC. The display controller has two
> > > +	  display pipes and it is a PCI device.
> > > +	  When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
> > > +	  is located at system memory.
> > > +	  If "M" is selected, the module will be called lsdc.
> > > +
> > > +	  If in doubt, say "Y".
> > > +
> > > +config DRM_LSDC_VRAM_DRIVER
> > > +	bool "vram helper based device driver support"
> > > +	depends on DRM_LSDC
> > > +	select DRM_VRAM_HELPER
> > > +	default y
> > > +	help
> > > +	  When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
> > > +	  platform, the LS7A1000 bridge chip has dedicated video RAM. Using
> > > +	  "lsdc.use_vram_helper=3D1" in the kernel command line will enable
> > > +	  this driver mode and then the framebuffer will be located at the
> > > +	  VRAM at the price of losing PRIME support.
> > > +
> > > +	  If in doubt, say "Y".
> > This doesn't sound right. The driver should make the proper decision
> > depending on the platform, not the user or the distribution.
>=20
> The LS7A1000 north bridge chip has dedicated video RAM, but the DC in LS7=
A1000
> can also scanout from the system memory directly like a display controlle=
r in a
> SoC does. In fact, this display controller is envolved from early product=
 of
> Loongson 2H SoC. This driver still works even if the downstream PC board
> manufacturer doesn't solder a video RAM on the mother board.
>=20
> The lsdc_should_vram_helper_based() function in lsdc_drv.c will examine
> if the DC device node contain a use_vram_helper property at driver loadin=
g time.
> If there is no use_vram_helper property, CMA helper based DRM driver will=
 be used.
> Doing this way allow the user using "lsdc.use_vram_helper=3D0" override t=
he default
> behavior even through there is a "use_vram_helper;" property in the DTS.
>=20
> In short, It is intend to let the command line passed from kernel has hig=
her
> priority than the device tree. Otherwise the end user can not switch diff=
erent
> driver mode through the kernel command line once the DC device node conta=
in
> "use_vram_helper;" property.
>=20
> This driver's author already made the decision by the time when the patch=
 is
> sent out, even through this**may not proper.
>=20
> The CMA helper based driver will be used by default, if the DC device nod=
e contain
> "use_vram_helper;" then VRAM based driver will be used. This is my initia=
l intention.

DT isn't really a solution either. Let's take the distribution
perspective there. Suppose you're a Fedora or Debian developer, and want
to make a single kernel image, and ship a DT to the user for their board
without any modification. How is either the Kconfig solution or DT flags
solution any good there? It doesn't help them at all.

Maxime

--ya7qckwy2foywkx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgOAvwAKCRDj7w1vZxhR
xfmlAP9jrc/0alF0HbOEKem/PYILuIQZksQjvUqUpnADGQgZ2AD/YY/Mdq2iiu3Z
W6nZNr9i/aZ4agM5MHGTU59+JVzfAwA=
=9aeP
-----END PGP SIGNATURE-----

--ya7qckwy2foywkx2--
