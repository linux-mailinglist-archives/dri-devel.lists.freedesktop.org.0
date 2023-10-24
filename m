Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B527D56DE
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 17:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1D10E3E0;
	Tue, 24 Oct 2023 15:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BBA10E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 15:47:43 +0000 (UTC)
Received: from i53875a19.versanet.de ([83.135.90.25] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1qvJd5-0005MZ-2h; Tue, 24 Oct 2023 17:47:39 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date: Tue, 24 Oct 2023 17:47:37 +0200
Message-ID: <11399368.MucGe3eQFb@diego>
In-Reply-To: <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <3083498.U7HbjWM52l@diego>
 <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sboyd@kernel.org,
 sam@ravnborg.org, mturquette@baylibre.com, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

Am Freitag, 20. Oktober 2023, 17:03:08 CEST schrieb Chris Morgan:
> On Thu, Oct 19, 2023 at 07:45:17PM +0200, Heiko St=FCbner wrote:
> > Hey Chris,
> >=20
> > Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> > > On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > > > On 18/10/2023 18:18, Chris Morgan wrote:
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > >=20
> > > > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy =
and
> > > > > powered by the Rockchip RK3566 SoC.
> > > > >=20
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml =
b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > index a349bf4da6bc..a6612185a7ff 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > @@ -674,6 +674,11 @@ properties:
> > > > >            - const: powkiddy,rgb30
> > > > >            - const: rockchip,rk3566
> > > > > =20
> > > > > +      - description: Powkiddy RK2023
> > > > > +        items:
> > > > > +          - const: powkiddy,rk2023
> > > >=20
> > > > This cuold be just enum in previous entry :/ but I remember we talk=
ed
> > > > about this once with Heiko.
> > >=20
> > > For hardware that requires a different device tree, is that possible?
> > > While most of the devices I've worked on for the RK3566 series are ve=
ry
> > > similar for the moment only 1 is identical (the RG353P and the RG353M)
> > > and can use the same device tree.
> >=20
> > In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also h=
as
> > different devicetrees but is part of the same family of device designs.
> >=20
> > So similar Powkiddy RK3568 based gaming handhelds also sound like
> > a nice family name in the description ;-) .
>=20
> Gotcha, I can do that. Would you like for me to go back and do the same
> for the Anbernic devices as well? I can do it as part of a seperate
> patch series.

that doing that for the Anberic devices would be really nice too, so
yes please :-) .

Thanks
Heiko


