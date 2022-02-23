Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA94C158F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B2710E1C2;
	Wed, 23 Feb 2022 14:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B216C10E38B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:39:15 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E9AC58048A;
 Wed, 23 Feb 2022 09:39:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 23 Feb 2022 09:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=FgQTgqziNKWKER2EIGatrqwMgScYbE1jaY41Ku
 Ra9OM=; b=Yli2PPJDon/Sd3hWdozX4L17oVl7xLrv21xPwvKecUIpyd8aPy1+eQ
 PN29mJy2I0NrgpCdcxuxsni2F/BGR7WOXN4tTRXOGeJuamGKEymBaHfDqsyIyNcD
 xahS06C6zwAStN1A1Mk3pcsGwl2akNdlXJzlcSc5O/xr8+TLvdSsv6T6m3DNzLQ1
 MKSDLi+nKhqoxXUKqgiLBBqk6yRi+kqHZL5mgm9ePBJsQ5zZwJaBD8vImC2vzLvi
 4g8YL8kts6FypEX0dFFRj9xTE1XAOu3pVu7TQJbhgOSQvcUqB6S+3ifg6xd074Qk
 VeemYsCbaTufoebFyK4dUPM1BCrfHc2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FgQTgqziNKWKER2EI
 GatrqwMgScYbE1jaY41KuRa9OM=; b=fJcIHRF17UWKd0l8UNOFyNrRjbu8kDSvB
 j9nKZS5xD6s5+mep1mSmlY4AT3MPwU3ZkQ3EfiB0hM4iZGkuU1FQlGyNmLtm5tDe
 7jHteapsg/MRIyxLXkG1U4cBvHoAKog7OdOJYs5tgxB6IwoYfURQcoZjy5HiYzyL
 rQL0b2cN5R7Mo/QtQZ+LUOAQT0RvJJX+czf6rheaXsjAYhCmt1idGp0yEwKBmsGJ
 AXsycRUS0N+ttmx+PHDahoITWdsPjNgi3ieoKCSt4KHSSWykydxBnMXVhYCKhan4
 eldILqu8Ye/Mqa7HGDT5qe45rO4TSTUtbUmSQ/spOWDmILLaVYs+w==
X-ME-Sender: <xms:EkcWYuYja8czwuHjew1dyGXmSuW1IKamNvDwikHODq06sRG2mjSCTQ>
 <xme:EkcWYhYJ3f73iiAKCifKa2kr9MB21Hc3xt8JBOuYfNf0VFS7WYZqI-tIJv1yPD1Fb
 A9gVvgioma9HhTCcz4>
X-ME-Received: <xmr:EkcWYo_67oWoiTUGgonTnQtUWz7tZt1Ddxj9aFt-pxhubGm7botnBe6T68pxVybDmQNNR2FSluRZBn4QRMYcM7YhPCqrWsMBUOrTrn4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EkcWYgqVlP6Ct4NexodwRqXpnhoYgMrH9eEnml_fgpbDTez2YDNf9Q>
 <xmx:EkcWYpo1pjBxKyzP3kkl2grSbOaeCDSqqu2ZSVrVymR29meM7o5DeA>
 <xmx:EkcWYuTKy4G5BQHnSLw7ioA2cgW6wHA4QmmGS1yUOlB_Vk34BCFu4w>
 <xmx:E0cWYjZQST1x64XLUkl8j2Ez7BYtR7WdgwqkR66KWHn4p-JgHD4IYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 09:39:13 -0500 (EST)
Date: Wed, 23 Feb 2022 15:39:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220223143912.m727fie3vtdkvklo@houat>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
 <20220222082747.66otrkc4zwvhem7w@houat>
 <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wam4wqm3zed2h2ms"
Content-Disposition: inline
In-Reply-To: <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wam4wqm3zed2h2ms
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:46:35PM +0800, Sui Jingfeng wrote:
>=20
> On 2022/2/22 16:27, Maxime Ripard wrote:
> > > +	if (!of_device_is_available(output)) {
> > > +		of_node_put(output);
> > > +		drm_info(ddev, "connector%d is not available\n", index);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	disp_tims_np =3D of_get_child_by_name(output, "display-timings");
> > > +	if (disp_tims_np) {
> > > +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
> > > +		lconn->has_disp_tim =3D true;
> > > +		of_node_put(disp_tims_np);
> > > +		drm_info(ddev, "Found display timings provided by connector%d\n", =
index);
> > > +	}
> > > +
> > > +	connector_type =3D lsdc_get_connector_type(ddev, output, index);
> > > +
> > > +	if (output) {
> > > +		of_node_put(output);
> > > +		output =3D NULL;
> > > +	}
> > > +
> > > +DT_SKIPED:
> > > +
> > > +	/* Only create the i2c channel if display timing is not provided */
> > > +	if (!lconn->has_disp_tim) {
> > > +		const struct lsdc_chip_desc * const desc =3D ldev->desc;
> > > +
> > > +		if (desc->have_builtin_i2c)
> > > +			lconn->ddc =3D lsdc_create_i2c_chan(ddev, index);
> > > +		else
> > > +			lconn->ddc =3D lsdc_get_i2c_adapter(ddev, index);
> > This looks weird: the connector bindings have a property to store the
> > i2c controller connected to the DDC lines, so you should use that
> > instead.
> >=20
> This is not=A0 weird,=A0 ast, mgag200, hibmc do the same thing.

And none of them have DT support.

Maxime

--wam4wqm3zed2h2ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhZHEAAKCRDj7w1vZxhR
xXitAP9v7HOYqHz8i7UAxoCMoqbrhwBW9XOoHnf/jK5QqIkJuwEAuPDXzMoMz/sH
GrxQHl28jgBtPlbX7QJnoi4BgNwVNQA=
=4ezX
-----END PGP SIGNATURE-----

--wam4wqm3zed2h2ms--
