Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A067D7781A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 21:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327810E4FA;
	Thu, 10 Aug 2023 19:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E610E4FA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 19:30:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0132160E9F;
 Thu, 10 Aug 2023 19:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABBAC433CB;
 Thu, 10 Aug 2023 19:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691695827;
 bh=d4mQBWjLbcx61H9YHtMpK3a+gUbbTesFof4Bts3umRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NRW7TH8PRNpQmj9Ac3TqlrJ3tWZLVjbp9UDGLNq5AcBE+MB4tkEZtTQOTbdWqU43Y
 XLlsCgfBMUvoEPNoTUiuRr/wVXpaB9rh0pqV0a3qwDlvc5pb2Q/fwRuJkJOBEXMEuo
 0sKIFEzExMs8D1Vt/a1fPagAeeSC9SzGRVPPBStVkxxS8Scjf/gmpHoXSymR55uB0q
 LFr2umbfkFxVZziTbS9DHQImk4qS58tt+BTj5RpSy3gY63SMf+rk/bTAilUwxr9P7S
 6QMtNoAnvtgKlhKrTtsAVfNp4QpqEhuTDBlQV7xNsUVg2Rv0HEBnvToNYiCH5NLAF4
 AJG0/gp4Wb98Q==
Date: Thu, 10 Aug 2023 20:30:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
Subject: Re: [PATCH] dt-bindings: mxsfb: Exclude i.MX8MQ from power-domains
 requirement
Message-ID: <20230810-embroider-seduce-ee4506e7608b@spud>
References: <20230730184120.94984-1-david@ixit.cz>
 <ZMonFSqutQRqs61n@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yVk3JZ7fl+mjKj73"
Content-Disposition: inline
In-Reply-To: <ZMonFSqutQRqs61n@qwark.sigxcpu.org>
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
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--yVk3JZ7fl+mjKj73
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2023 at 11:51:17AM +0200, Guido G=FCnther wrote:
> Hi,
> On Sun, Jul 30, 2023 at 09:41:20PM +0300, David Heidelberg wrote:
> > i.MX8MQ uses as secondary compatible fsl,imx6sx-lcdif, which triggers
> > requirement of power-domains, thou it's not required.
> >=20
> > Fixes: f62678a77d58 ("dt-bindings: mxsfb: Document i.MX8M/i.MX6SX/i.MX6=
SL power-domains property")
> >=20
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  .../devicetree/bindings/display/fsl,lcdif.yaml        | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b=
/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index fc11ab5fc465..2d868276b0f9 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -129,8 +129,15 @@ allOf:
> >                - fsl,imx8mp-lcdif
> >                - fsl,imx93-lcdif
> >      then:
> > -      required:
> > -        - power-domains
> > +      if:
> > +        properties:
> > +          compatible:
> > +            not:
> > +              contains:
> > +                const: fsl,imx8mq-lcdif
> > +      then:
> > +        required:
> > +          - power-domains
>=20
> We currently enable the mipi power domain for the mipi dphy and nwl
> bridge only but not for LCDIF itself assuming it's not needed (as there's
> other outputs LCDIF can drive). I *think* this is correct but maybe
> Marek or Liu can confirm?

I'm happy to Ack this, but I've been sitting on it waiting to see if
Marek or Liu popped up..

--yVk3JZ7fl+mjKj73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNU6zQAKCRB4tDGHoIJi
0s2nAP9Dmws9nUO7FWU2dnCYapILH8BgEDhPZlOjfqFaw+mE+QD/atHR0u47ijBF
egbmUZYBYV2cDqiKmos4DpMp6XI4WAY=
=OYJ6
-----END PGP SIGNATURE-----

--yVk3JZ7fl+mjKj73--
