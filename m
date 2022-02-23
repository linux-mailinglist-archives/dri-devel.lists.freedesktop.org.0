Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239004C173C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61A410E17F;
	Wed, 23 Feb 2022 15:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F0610E56F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 15:41:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 34AD75802FD;
 Wed, 23 Feb 2022 10:41:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 23 Feb 2022 10:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=M2/b5MIE6bQJByA3Vh9tC6cYzTZFNeBiNnMth2
 KLMVo=; b=Bnv7woDYcd7mmSSfipVO5la+dn+WX97gG+qYFku5RwmJ0b+uz29gKk
 W/2lgSs3Ox46zW5BJNzdu9QnQWAlaLv9ZEUY0uScxAuhSrTdfl0gsZRpbn1AcuYR
 rp4ogfiwhwIy7fX4XzhoNXVUe1eeXWt2U9LEcNfLrDCarGqOdsOMaBwLKq6lc07C
 TkJ7jeBpIQyorDeqGZ0InOnN44owKvZhafYZamH9gD/VG9LHBpIY8KrmyNlKXmeU
 eCiGVRY7pmgpwMCiDx8x4QwOzvl7/1CU5o57TZXUXTmaZH8/duxrLhtRBf3tyn49
 j2w6NdoCyh5lxb0a9vrXxRjbWQl/WwkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M2/b5MIE6bQJByA3V
 h9tC6cYzTZFNeBiNnMth2KLMVo=; b=QV9Juy7QQSjZuVHHhURF+1JcKbpnwuM2L
 VBX0qBqM9COq6G8JtlBAGoYKPbuEo+hs+LLmqfg83f1gF0NFFEBeGu+vJf1DmY8O
 RkOddVQ2IlNLls2Oj3ZkY6djaPU4zSBcDqnY6Z/0iUIHZy49MsCds/ZL33u9ch/v
 XetHOyJnIKeMMcKumKLPnQssQ+uO+DjUdMMOt4QblQzlekvmXrX7Cdw2zhJBzdDN
 jc0jXWr9dqAXKhvw3sk/mR4XmLh8trrHmi9ogmq8oIbzZSMIhdSgCAyKh2oBolEm
 4kYXV2zaSg26RpZYRA1icgL6iyLDAVcbbQrBkYREWdhapRc3V6SVw==
X-ME-Sender: <xms:sFUWYm-GEEjdbSALW-ne4zr0sLOEzsXQtkNn_Zyd5wc69QchaF-seA>
 <xme:sFUWYmsTGwCa4aj1bgfQeK6Cx2WlsgGywYi7Yg_ErHCOtJxzNXhtdN_z_Nh5HhqYF
 OHdd9nQg-pDWF5Imfw>
X-ME-Received: <xmr:sFUWYsC-_QYnAVMxuCBJ1m-eY9bXN7V78hbuLSoOd0TrLUfjscuc6K4DsF-X7mzly28hBjWUH6uJLxKEMMSh9bEaiPH4okiUoU0G8Q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sFUWYucjTpHs6Qn-MDTcCWWmXKBaJcOi8k7atOJd8k3NlTCjoAZtcQ>
 <xmx:sFUWYrOXvrls4gJweUQTNaIcB_4eu8l17ekbpWVprS4CJ_ltn8bFIg>
 <xmx:sFUWYokFXOZhIiRJnnF2QEvDa3gLV_16w0kxGw56zZN4sFSw0cYyug>
 <xmx:slUWYucAa7gT1-vE7e0qdSDMi9pH5PrgDoV3u88A1vtFcOMsjvpvWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 10:41:36 -0500 (EST)
Date: Wed, 23 Feb 2022 16:41:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220223154134.y7slxu3jaje2jtwr@houat>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
 <20220222082747.66otrkc4zwvhem7w@houat>
 <54ea69d7-2fac-74dc-2ef6-843a666cff85@189.cn>
 <20220223143912.m727fie3vtdkvklo@houat>
 <0d4a75c4-78bb-4aed-0fa8-88e9cc165896@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uwizgizeraqcnone"
Content-Disposition: inline
In-Reply-To: <0d4a75c4-78bb-4aed-0fa8-88e9cc165896@189.cn>
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


--uwizgizeraqcnone
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 11:14:12PM +0800, Sui Jingfeng wrote:
>=20
> On 2022/2/23 22:39, Maxime Ripard wrote:
> > On Tue, Feb 22, 2022 at 10:46:35PM +0800, Sui Jingfeng wrote:
> > > On 2022/2/22 16:27, Maxime Ripard wrote:
> > > > > +	if (!of_device_is_available(output)) {
> > > > > +		of_node_put(output);
> > > > > +		drm_info(ddev, "connector%d is not available\n", index);
> > > > > +		return NULL;
> > > > > +	}
> > > > > +
> > > > > +	disp_tims_np =3D of_get_child_by_name(output, "display-timings"=
);
> > > > > +	if (disp_tims_np) {
> > > > > +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
> > > > > +		lconn->has_disp_tim =3D true;
> > > > > +		of_node_put(disp_tims_np);
> > > > > +		drm_info(ddev, "Found display timings provided by connector%d\=
n", index);
> > > > > +	}
> > > > > +
> > > > > +	connector_type =3D lsdc_get_connector_type(ddev, output, index);
> > > > > +
> > > > > +	if (output) {
> > > > > +		of_node_put(output);
> > > > > +		output =3D NULL;
> > > > > +	}
> > > > > +
> > > > > +DT_SKIPED:
> > > > > +
> > > > > +	/* Only create the i2c channel if display timing is not provide=
d */
> > > > > +	if (!lconn->has_disp_tim) {
> > > > > +		const struct lsdc_chip_desc * const desc =3D ldev->desc;
> > > > > +
> > > > > +		if (desc->have_builtin_i2c)
> > > > > +			lconn->ddc =3D lsdc_create_i2c_chan(ddev, index);
> > > > > +		else
> > > > > +			lconn->ddc =3D lsdc_get_i2c_adapter(ddev, index);
> > > > This looks weird: the connector bindings have a property to store t=
he
> > > > i2c controller connected to the DDC lines, so you should use that
> > > > instead.
> > > >=20
> > > This is not=A0 weird,=A0 ast, mgag200, hibmc do the same thing.
> > And none of them have DT support.
> >=20
> > Maxime
>=20
> You are wrong, ast driver have dt support. See ast_detect_config_mode() in
> drm/ast/ast_main.c
>=20
> static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
> {
> =A0=A0 =A0struct device_node *np =3D dev->dev->of_node;
> =A0=A0 =A0struct ast_private *ast =3D to_ast_private(dev);
> =A0=A0 =A0struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> =A0=A0 =A0uint32_t data, jregd0, jregd1;
>=20
> =A0=A0 =A0/* Defaults */
> =A0=A0 =A0ast->config_mode =3D ast_use_defaults;
> =A0=A0 =A0*scu_rev =3D 0xffffffff;
>=20
> =A0=A0 =A0/* Check if we have device-tree properties */
> =A0=A0 =A0if (np && !of_property_read_u32(np, "aspeed,scu-revision-id",
> =A0=A0 =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 scu_rev)) {
> =A0=A0 =A0=A0=A0=A0 /* We do, disable P2A access */
> =A0=A0 =A0=A0=A0=A0 ast->config_mode =3D ast_use_dt;
> =A0=A0 =A0=A0=A0=A0 drm_info(dev, "Using device-tree for configuration\n"=
);
> =A0=A0 =A0=A0=A0=A0 return;
> =A0=A0 =A0}
>=20
> =A0....
>=20
> }

It doesn't seem to probe from the DT though. It uses 4 properties, and
none of them are documented. It's still a widely different case than
your driver that uses the connector binding, and therefore has access to
the ddc bus there.

Maxime

--uwizgizeraqcnone
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhZVrQAKCRDj7w1vZxhR
xS48AQCiz86aru05sqZwXNd++y8Km72yvxlQbVk5ANA9UCjlYAD+KYiiiZuOLSqM
9g3/jplVDK9jJSxClRqmlsO5loCq/QI=
=H2N/
-----END PGP SIGNATURE-----

--uwizgizeraqcnone--
