Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEA7787C8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 09:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B5010E665;
	Fri, 11 Aug 2023 07:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 11 Aug 2023 07:01:48 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D17110E665
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 07:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1691737308; x=1723273308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BsK4TCop8Tvvq64YuM67VXvxRYKw44rbaUJs8CrYGWQ=;
 b=Ahm6QfN+YuWQka2sg/HU2ufGxZbetzT+CDrGcEm8wpiuF0iA1ealeu6y
 9tT56wjzpa2/7E/OhFTy2/mG3ygAlw3wLQulCJwfK/JQxrdUy5SeADA17
 8sVs+35kVi9l66jy/g9NUxixMWJpx9WE/pF9/SRs4BzPMuQvcEMmj0a5B
 BmPonO3RRgOJYn3UbuqWYUk0DhmHpjclZzopTW95lGvFrMs0hti8CmzvN
 ilCwh1COlpFusBVmVfnCjQpgPybxtoys7EZK+Alsqz5KkkbUDc9AtnL+b
 gw2+cyrf0qf+j6CYlxsVdaF7W6JBJUYoeSVVAivUJ44KPgE0L1Y8IsYUM w==;
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
 d="asc'?scan'208";a="229270610"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Aug 2023 23:54:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 10 Aug 2023 23:54:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 10 Aug 2023 23:54:29 -0700
Date: Fri, 11 Aug 2023 07:53:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Message-ID: <20230811-purgatory-obliged-1f0755ac88d2@wendy>
References: <20230730184120.94984-1-david@ixit.cz>
 <ZMonFSqutQRqs61n@qwark.sigxcpu.org>
 <20230810-embroider-seduce-ee4506e7608b@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ItxO9H8fCtDVgFN+"
Content-Disposition: inline
In-Reply-To: <20230810-embroider-seduce-ee4506e7608b@spud>
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
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
 Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>, kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--ItxO9H8fCtDVgFN+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 08:30:21PM +0100, Conor Dooley wrote:
> On Wed, Aug 02, 2023 at 11:51:17AM +0200, Guido G=FCnther wrote:
> > Hi,
> > On Sun, Jul 30, 2023 at 09:41:20PM +0300, David Heidelberg wrote:
> > > i.MX8MQ uses as secondary compatible fsl,imx6sx-lcdif, which triggers
> > > requirement of power-domains, thou it's not required.
> > >=20
> > > Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document i.MX8M/i.MX6SX/i.M=
X6SL power-domains property")
> > >=20
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > ---
> > >  .../devicetree/bindings/display/fsl,lcdif.yaml        | 11 +++++++++=
--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml=
 b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > index fc11ab5fc465..2d868276b0f9 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > @@ -129,8 +129,15 @@ allOf:
> > >                - fsl,imx8mp-lcdif
> > >                - fsl,imx93-lcdif
> > >      then:
> > > -      required:
> > > -        - power-domains
> > > +      if:
> > > +        properties:
> > > +          compatible:
> > > +            not:
> > > +              contains:
> > > +                const: fsl,imx8mq-lcdif
> > > +      then:
> > > +        required:
> > > +          - power-domains
> >=20
> > We currently enable the mipi power domain for the mipi dphy and nwl
> > bridge only but not for LCDIF itself assuming it's not needed (as there=
's
> > other outputs LCDIF can drive). I *think* this is correct but maybe
> > Marek or Liu can confirm?
>=20
> I'm happy to Ack this, but I've been sitting on it waiting to see if
> Marek or Liu popped up..

Well, I got two positive responses, so
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.



--ItxO9H8fCtDVgFN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNXbAAAKCRB4tDGHoIJi
0ivxAQCX4HLM88F3C85q+xIpWfw/hZxtiBMY3aKnSvpKM2M+nAEAtRYGseVn9VrH
EcVfsRku0eySutPtAoQsqd9peXJm/g8=
=jTU0
-----END PGP SIGNATURE-----

--ItxO9H8fCtDVgFN+--
