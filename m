Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767A7B011F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 11:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE75810E4C3;
	Wed, 27 Sep 2023 09:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 27 Sep 2023 09:56:06 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838310E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1695808566; x=1727344566;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oj/BIJaPlLOZ5a4Bm+3wRDEKMjmwS+415AzmToQmxko=;
 b=JqQ+Evba55538iECDWS/5SoA2bScTKsbu8tBhBVQMkJwxBLS4DWpLuNf
 xJ99GKsfOFs6X5ahTE8E5HunKtgOWDgbyqNN6x0HuFaTQLa+4HRxOSGMS
 hrh7D1U3yxqfsYjCVv15Ne1Z9PbsVwlKNSlr6q45pfBnNHe+muesJ17Bs
 kjeqc0oRlih6KHkMBsB7SIBOJ+TFhz6L0hi0W2APVPAMbXo56pcM+F9gw
 BSH0n5d9gUHKsWuIafxEOoqirzPR+ubLsR2mQ8k2jxz9oCuL9TOOmY0I9
 iwa6v0nAMsOrXsNpvTNRjR9STgxkkEEZxqOvTIFn68kGNSRJ8V/v3xRaV w==;
X-CSE-ConnectionGUID: +8y/5vKTQAWpUgUoFVJWOw==
X-CSE-MsgGUID: FCeDeZE/SGCJlrPGv/SrHA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
 d="asc'?scan'208";a="173847249"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 02:48:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 27 Sep 2023 02:48:03 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 27 Sep 2023 02:48:00 -0700
Date: Wed, 27 Sep 2023 10:47:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Moudy Ho =?utf-8?B?KOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Message-ID: <20230927-crunching-prancing-36fe3eb79607@wendy>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T9lGne2QQapOBRac"
Content-Disposition: inline
In-Reply-To: <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor@kernel.org" <conor@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--T9lGne2QQapOBRac
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 07:19:28AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=E5=
=8E=9F) wrote:
> On Fri, 2023-09-22 at 16:51 +0100, Conor Dooley wrote:
> > On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
> > > On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
> > > > Add a compatible string for the COLOR block in MediaTek MT8195
> > > > that
> > > > is controlled by MDP3.
> > > >=20
> > > > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/display/mediatek/mediatek,color.yaml   =20
> > > >  | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > index f21e44092043..b886ca0d89ea 100644
> > > > ---
> > > > a/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > +++
> > > > b/Documentation/devicetree/bindings/display/mediatek/mediatek,col
> > > > or.yaml
> > > > @@ -26,6 +26,7 @@ properties:
> > > >            - mediatek,mt2701-disp-color
> > > >            - mediatek,mt8167-disp-color
> > > >            - mediatek,mt8173-disp-color
> > > > +          - mediatek,mt8195-mdp3-color
> > >=20
> > > How come this one is a "mdp3" not a "disp"?
> >=20
> > I don't know what mdp3 means & googling gives me no answers. What's
> > the
> > "disp" one controlled by, since it isn't controlled by mdp3?
> >=20
>=20
> Hi Conor,
>=20
> Mediatek's Media Data Path ver.3 (MDP3) is associated with MMSYS and
> acts as an independent driver that operates between VDEC and DISP.
> By controlling multiple components, it carries out tasks like
> converting color formats, resizing, and applying specific Picture
> Quality (PQ) effects.
> The driver can be found at "driver/media/platform/mediatek/mdp3".
> Since the same hardware components are configured in both MDP3 and
> DISP, considering previous discussions, I attemped to integrate into a
> single binding, named after the controlling user.

I'm still kinda struggling to understand this. Do you mean that the
hardware can be controlled by either of the disp and mdp3 drivers, and
a compatible containing "disp" would use one driver, and one containing
"mdp3" would use another?


--T9lGne2QQapOBRac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRP6PgAKCRB4tDGHoIJi
0kh7AP9O7MKYjrnar798S6fbop9AWuqH31/FShl/0JtdCf2N/wD/R/G17q/VHosy
cmzXFHme+vk2cMO0cR0geJwglqggtQo=
=5FSm
-----END PGP SIGNATURE-----

--T9lGne2QQapOBRac--
