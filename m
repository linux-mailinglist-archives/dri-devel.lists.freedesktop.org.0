Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F2782F310
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 18:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519F10E032;
	Tue, 16 Jan 2024 17:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDED10E032
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 17:16:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 07E87B80E84;
 Tue, 16 Jan 2024 17:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC5FC433F1;
 Tue, 16 Jan 2024 17:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705425378;
 bh=YccJ3G4ylERWPrrdaVoG3THwwNeSrwk0EoXOTYZSinE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UoncxEI/P+JuQysmNbatwCoAKihQXSQfNnUv1m47oUb6oCNjjezYCQH+UA7isGykR
 RndPOGH9kISHGxxzWFjebt1h0kgU25Yyu4gfU4q6hYIysho995Z96y4w2javU269Va
 6tNA2b0NJIhrENxuggg4eIB3rIYlmTAqNV5z/GhONSVXGxl4rUEsGIbMaKD6OWUvQ2
 DrYLaQ01cJVrIbcg4mgTrSm0Uy/WfhTWoE+HK+Gd6zGdCpqGMI4mfOMno2c16Cqrnt
 9gQG57SPu7+x0JCg5t7m0Yv1nkpzt2y/k+tJD3NCSXNELcaXpRzN/UwjaSzP4Fq2Y4
 QJFo/8VFbrSRQ==
Date: Tue, 16 Jan 2024 17:16:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Message-ID: <20240116-unbundle-secret-477cd2fda3dc@spud>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-2-shengyang.chen@starfivetech.com>
 <20240109-worsening-material-fae02ff4e611@spud>
 <ZQ0PR01MB1062EDD1B18349619DF14654EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qw+MCndyFqEnJYvW"
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB1062EDD1B18349619DF14654EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 "wahrenst@gmx.net" <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Qw+MCndyFqEnJYvW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 09:40:21AM +0000, Shengyang Chen wrote:
> Hi, Conor
>=20
> Thanks for comment.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 2024=E5=B9=B41=E6=9C=8810=E6=97=A5 0:32
> > To: Shengyang Chen <shengyang.chen@starfivetech.com>
> > Cc: devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > neil.armstrong@linaro.org; quic_jesszhan@quicinc.com; sam@ravnborg.org;
> > airlied@gmail.com; daniel@ffwll.ch; maarten.lankhorst@linux.intel.com;
> > mripard@kernel.org; tzimmermann@suse.de; robh+dt@kernel.org;
> > krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; wahrenst@gmx.ne=
t;
> > dave.stevenson@raspberrypi.com; thierry.reding@gmail.com; Changhuang
> > Liang <changhuang.liang@starfivetech.com>; Keith Zhao
> > <keith.zhao@starfivetech.com>; Jack Zhu <jack.zhu@starfivetech.com>;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: =
Add
> > compatible property for waveshare 7inch touchscreen panel
> >=20
> > On Tue, Jan 09, 2024 at 03:09:48PM +0800, Shengyang Chen wrote:
> > > The waveshare 7" 800x480 panel is a clone of Raspberry Pi 7" 800x480
> > > panel It can be drived by Raspberry Pi panel's process but it needs
> > > different timing from Raspberry Pi panel. Add compatible property for=
 it.
> > >
> > > Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> > > Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
> > > ---
> > >  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 =
++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > index 11422af3477e..02f6b1b2ddc9 100644
> > > ---
> > > a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yam
> > > +++ l
> > > @@ -335,6 +335,8 @@ properties:
> > >        - vivax,tpc9150-panel
> > >          # VXT 800x480 color TFT LCD panel
> > >        - vxt,vl050-8048nt-c01
> > > +        # Waveshare 7" (800x480) touchscreen LCD panel
> > > +      - waveshare,7inch-touchscreen
> >=20
> > Is "7inch-touchscreen" really a specific enough identifier for this dev=
ice?
> >=20
>=20
> Referring to official website[1] and Neil's suggestion, maybe I should ch=
ange to
> "7inch-touchscreen-dsi-lcd" or "waveshare,7inch-dsi-sku19885" if the next=
 patch version is needed.

The one with the sku certainly seems more specific, if a next version is
needed I would use that.

Thanks,
Conor.

--Qw+MCndyFqEnJYvW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaa53AAKCRB4tDGHoIJi
0qMgAP9ieYp/4oV7UEcPqmkgbADwRvXtrtX7hF4KPTDrmg9+mAEAkS83+Hy60CD3
HdSRO+hHlw6yx6k7OA2nIQXeLxtnDQg=
=V79Y
-----END PGP SIGNATURE-----

--Qw+MCndyFqEnJYvW--
