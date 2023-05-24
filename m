Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0A70EEE7
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF5410E046;
	Wed, 24 May 2023 07:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 24 May 2023 07:03:58 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9059610E046
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684911839; x=1716447839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+2R1S8BzLBMD1ztIM0yjR1EZHQXg518QCyvLKtAnHR4=;
 b=VDYufalYNL4QCJOWSDGNctKBi9va0iuxKH1xop5leiNwd9eKVLhzNMz5
 PBaDoebQjRsKIhteEd4RlNkJC8x2KsRKIeJ+yAh/Q+qnIUvAHciTBzXTF
 HoVSosQebW9fSm4AmmuSkNpE+b7uKFeg+OzM04B5qDY/i9lzxxRq0mcVU
 Xh7NpZjT59XcAYyDsMNc+aVBafRY2wnyEqxPEpvybkbk4d2gnwlnCPxJt
 Q8kxk1f4Q91URx34HBXchrjJwVE1bGPp1y0piDMMlDmEYo1WO7VICxNUH
 koenN1GKDGbSbXAG0LJnlaWvgVGADXML+yvr3t0urtfnJbu936aM+hQe1 g==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
 d="asc'?scan'208";a="226743876"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 May 2023 23:56:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 23 May 2023 23:56:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 23 May 2023 23:56:47 -0700
Date: Wed, 24 May 2023 07:56:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230524-resample-dingbat-8a9f09ba76a5@wendy>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
 <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
 <20230523-unfailing-twisting-9cb092b14f6f@spud>
 <CALSSxFYMm5NYw41ERr1Ah-bejDgf9EdJd1dGNL9_sKVVmrpg3g@mail.gmail.com>
 <20230524-scientist-enviable-7bfff99431cc@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oixSSIk8//11vX0i"
Content-Disposition: inline
In-Reply-To: <20230524-scientist-enviable-7bfff99431cc@wendy>
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
Cc: andrew@lunn.ch, simon.horman@corigine.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, richardcochran@gmail.com, opendmb@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, davem@davemloft.net, robh+dt@kernel.org,
 christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--oixSSIk8//11vX0i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 07:51:07AM +0100, Conor Dooley wrote:
> Hey Justin,
> On Tue, May 23, 2023 at 04:27:12PM -0700, Justin Chen wrote:
> > On Tue, May 23, 2023 at 3:55=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > > On Tue, May 23, 2023 at 02:53:43PM -0700, Justin Chen wrote:
> > >
> > > > +  compatible:
> > > > +    enum:
> > > > +      - brcm,asp-v2.0
> > > > +      - brcm,bcm72165-asp
> > > > +      - brcm,asp-v2.1
> > > > +      - brcm,bcm74165-asp
> > >
> > > > +        compatible =3D "brcm,bcm72165-asp", "brcm,asp-v2.0";
> > >
> > > You can't do this, as Rob's bot has pointed out. Please test the
> > > bindings :( You need one of these type of constructs:
> > >
> > > compatible:
> > >   oneOf:
> > >     - items:
> > >         - const: brcm,bcm72165-asp
> > >         - const: brcm,asp-v2.0
> > >     - items:
> > >         - const: brcm,bcm74165-asp
> > >         - const: brcm,asp-v2.1
> > >
> > > Although, given either you or Florian said there are likely to be
> > > multiple parts, going for an enum, rather than const for the brcm,bcm=
=2E.
> > > entry will prevent some churn. Up to you.
> > >
> > Urg so close. Thought it was a trivial change, so didn't bother
> > retesting the binding. I think I have it right now...
> >=20
> >   compatible:
> >     oneOf:
> >       - items:
> >           - enum:
> >               - brcm,bcm72165-asp
> >               - brcm,bcm74165-asp
> >           - enum:
> >               - brcm,asp-v2.0
> >               - brcm,asp-v2.1
> >=20
> > Something like this look good?
>=20
> I am still caffeine-less, but this implies that both of
> "brcm,bcm72165-asp", "brcm,asp-v2.0"
> _and_
> "brcm,bcm72165-asp", "brcm,asp-v2.1"
> are. I suspect that that is not the case, unless "brcm,asp-v2.0" is a

I a word. s/are/are valid/

> valid fallback for "brcm,asp-v2.1"?
> The oneOf: also becomes redundant since you only have one items:.
>=20
> > Will submit a v5 tomorrow.
>=20
> BTW, when you do, could you use the address listed in MAINTAINERS rather
> than the one you used for this version?
>=20
> Cheers,
> Conor.

--oixSSIk8//11vX0i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG21GQAKCRB4tDGHoIJi
0sO/AP9cRQ7+VO/SYpcRQ4CrYP3yQKQE6FbJdUJJekywN8ZxsQD/YqL7dDng/AoJ
XO0iNPz9c8Ma+pbj6hsXOiqs/AvLHQI=
=/k6/
-----END PGP SIGNATURE-----

--oixSSIk8//11vX0i--
