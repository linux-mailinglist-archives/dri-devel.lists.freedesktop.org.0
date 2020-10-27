Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF38B29AD51
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 14:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCDD6E1F8;
	Tue, 27 Oct 2020 13:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872B6E1F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 13:30:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id l16so1442646eds.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wudM5QwSA7l9nftYeilMZoiCCrd5fiqvQMUjjhFgGSI=;
 b=PYVULImcz4Gnw1D04xpjc7uvWArCoNx6vXY4XNxSB1csz3VRtD5dmEaYz8rBijDZrV
 Lnx6KlbQB5TfWQMwSmg1VSKDph3GRaYI8gCg2s1VXSyZp8AVZAt5VDEv5V2HA3xFtCWH
 FMAlOkuUl+Jah3vd4YXsfW1CpfJdxHwAfSZx7HM1aai17vpMwEgAjOqtu6YDKp73YO0s
 9ZTWzN7l04bvlMX9VZThvwmO0UbES/E82rcU/aGpH+3Xt7NF2jKZCz9HuBfZYvZu8EqS
 cdKznbSFIPbsVZpjMeTFDdHqCcpxmfyiqWlHYBvTROodcB1FYiF6XXEnd5Z3tlyD2AX6
 2qzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wudM5QwSA7l9nftYeilMZoiCCrd5fiqvQMUjjhFgGSI=;
 b=WZSFvp0VAfjsc0Wx/y8vX0KWGZ8sKApV1c6GqHyChicsag4zCcqDZZQWFhDyokZYhc
 Ny6NbwMMT7POaBV0eq2pIPC+NUhO/z6Hj5gVQZdBU/HhNHv0cqGA170qWh1xbgYa3wX1
 LofEZBJ6+i9MtA2tWpU9q32cqMWDe25OAli860H92JzLPKJcNmXW7gQJ2ArUMIgf/iC1
 FQLfjsypiYBU4BNlH4SQLMkhoMDz72VRLnYtrm4DhC7oIqTlKPXW0O/2+7f/ulhJNDYq
 q8Gz9yQBeeuh8eLaWQ565k8SaoHbCZzMo2yaZHEFLthJN+eU/VALvd8fAD+Qhtp0NMPv
 0uQg==
X-Gm-Message-State: AOAM533cHNqsUt21HzKlSoTqTuqZ7m/bBcy3IEpJFh5XoiE1jfJjFQpk
 OW8UVWjhdCGDWaYIviCy8jg=
X-Google-Smtp-Source: ABdhPJyKqvL1G68+mtN3mL7LT5Bd5npDhA+ZcNbEOm7IUY11Z/Hx999HcvRW/1K0hoGytjj30+zKTA==
X-Received: by 2002:a50:fb13:: with SMTP id d19mr2265371edq.215.1603805411492; 
 Tue, 27 Oct 2020 06:30:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s12sm990258edu.28.2020.10.27.06.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 06:30:10 -0700 (PDT)
Date: Tue, 27 Oct 2020 14:30:08 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 21/52] ARM: tegra: Add interconnect properties to
 Tegra20 device-tree
Message-ID: <20201027133008.GH1822510@ulmo>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-22-digetx@gmail.com>
 <20201027091247.GK4244@kozik-lap>
MIME-Version: 1.0
In-Reply-To: <20201027091247.GK4244@kozik-lap>
User-Agent: Mutt/1.14.7 (2020-08-29)
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, devicetree@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0446478515=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0446478515==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline


--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2020 at 10:12:47AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2020 at 01:17:04AM +0300, Dmitry Osipenko wrote:
> > Add interconnect properties to the Memory Controller, External Memory
> > Controller and the Display Controller nodes in order to describe hardwa=
re
> > interconnection.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  arch/arm/boot/dts/tegra20.dtsi | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
> > index 9347f7789245..2e1304493f7d 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -111,6 +111,17 @@ dc@54200000 {
> > =20
> >  			nvidia,head =3D <0>;
> > =20
> > +			interconnects =3D <&mc TEGRA20_MC_DISPLAY0A &emc>,
>=20
> I think you just added the defines and did not include them here, so
> this should not even build. Did you test it?

The dt-bindings/memory/tegra20-mc.h header is already included in
existing DTS files for MC hot flush resets, so this should be fine.

Thierry

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YIOAACgkQ3SOs138+
s6GYyg/9G9pB/bwzgqQzz+wOHyuNUCHPbkIx9CUIUnXDndybQYoKI/moPxY1ulfd
AygGLzhvDB/jOVPQbwykmE08zxduCfUaJrN0gSRpK1UjaUJ8DTW5Et4cvYegiH0C
nq1edcOtncfzxoeOCR4FdBMML1WxzfU5io5SEhaVcVgvyj6Av4MEfjLUSZX6aNzQ
vtmdx6GE5/ppkA47N/45K/p4ltdUo79NaFFocOoTM2LIAyR5b1wCpxzdQHivcsNI
6pqTq6jcXI2OMPl6/RGb0adksk7r4xJ5X/om6TxMSm9rds6TZWJujmhs4QH/WLFp
CBUQRWDFFic15MG6gaamN/bvUPE7w6Ue90b/c53CT0mYI6KhxpNoAUsJKWhgxWWx
iBOmUo1g1Wh50meliaNrvMdwyEJfi1ZDGEecz8LTXwX8jXMTiW8B9Nq/I1nGSy+T
iwkzs4cqWkQKjd9JsHKxWNAvHx/MNr6ilMssX8EPoG14xb+5bkwtPA94Dm5IbC3l
JMng8h98+LVsBd6JiJQnuyDv5AmaE3Tr5qHVA3NWXMatKKhOWzmqjyPrDQcCuvKJ
VGYb6t8ZpyedxjJjBUpkKp4yBD7bkuNBMaQ/QTsd5rNSF2PVoSLn5REgnFl9jSfB
gK5H5gs9J5ihRLtZQ7Lw2JyoTZ2vCMnAAW65LoFJp/oqp8A3O4c=
=uebE
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--

--===============0446478515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0446478515==--
