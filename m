Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13820934F77
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 16:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2A310E0D4;
	Thu, 18 Jul 2024 14:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ALuzJ1og";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBA910E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 14:56:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0219761B8E;
 Thu, 18 Jul 2024 14:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B2BC116B1;
 Thu, 18 Jul 2024 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721314588;
 bh=tSgqzWNmJO+WCgofyEUACVT6HAG617pXetzG54A/Z6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ALuzJ1oggJxtH/KZEsTWCjeelDTTE2keK3kqYC7RAOd2nC6Ot+MAbBuLmb43D7DMS
 f8tgQ5R0zAEBCyWCZTRst7SQLqDxHmGS9Znne/lZwayAihXz6aP3GsT33LBn/n5xQ5
 D385VLNAzYoAWIcNX6Ww+9hLCj2lRwi+/f7xWxvrvLas/yB7lKl6Xw+H4ByrOv2VDX
 zXXakVPDdzey//QKMzAwnbHlwldxdQeOGlClIzWUg7wbD0CLVGaYnFzbSkTexAU+uH
 luVDf3WN+2I+hdfANGM9nU6hLCluTs9yXrljburJuji7pxd85KFVTHeGAgqH5nvPod
 VpB3QvOlKBvoA==
Date: Thu, 18 Jul 2024 15:56:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <20240718-frightful-naturist-a049ea7c0548@spud>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
 <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D1ox+EeWBIBWunlR"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--D1ox+EeWBIBWunlR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> Hi,
>=20
> On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
> >
> > On 18/07/2024 02:21, Doug Anderson wrote:
> > > Conor (and/or) Krzysztof and Rob,
> > >
> > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > >>
> > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backli=
ght
> > >>> control over the DP AUX channel. While it works almost correctly wi=
th the
> > >>> generic "edp-panel" compatible, the backlight needs special handlin=
g to
> > >>> work correctly. It is similar to the existing ATNA33XC20 panel, jus=
t with
> > >>> a larger resolution and size.
> > >>>
> > >>> Add a new "samsung,atna45af01" compatible to describe this panel in=
 the DT.
> > >>> Use the existing "samsung,atna33xc20" as fallback compatible since =
existing
> > >>> drivers should work as-is, given that resolution and size are disco=
verable
> > >>> through the eDP link.
> > >>>
> > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > >>
> > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Can you comment on whether you would consider this bindings a "Fix"
> > > since it's a dependency for later patches in this series (which are
> > > "Fix"es) to pass dtbs_check? See:
> > >
> > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro=
=2Eorg
> >
> > The patch itself is not a fix, for sure, but it might be a dependency of
> > a fix (which you wrote above), thus could be pulled to stable as a
> > dependency.
> >
> > I do not care about dtbs_check warnings in stable kernels, mostly
> > because dtbs_check warnings depend heavily on dtschema and dtschema
> > follows mainline kernel. Basically if you had warnings-free v6.8 but try
> > to run dtbs_check now with latest dtschema, your results will differ.
> >
> > At some point in the future, I could imagine "no new dtbs_check warnings
> > in stable kernels" requirement or at least preference, but so far I
> > don't think there is any benefit.
>=20
> In this case it's not about whether it makes it to the stable kernel
> but about which main kernel it goes through.
>=20
> If we land the bindings in drm-misc-next right now then it'll be a
> long time before it makes it into Linus's tree because of the way that
> drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
> see the drm-misc merging strategy at:
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
>=20
> If we land the dts change (a fix) through the Qualcomm tree as a fix
> then it should target 6.11.
>=20
> This means that the 6.11 tree will have a dtbs_check error because it
> has the dts change (a fix) but not the bindings change (not a fix).
>=20
> One way to resolve this would be to treat this bindings as a "fix" and
> land it through "drm-misc-fixes". That would make the bindings and
> device tree change meet up in Linux 6.11.
>=20
> Did I get that all correct?

Is not not fairly established that a dependency for a fix can go onto a
fixes branch even if it is not a fix in and of itself?

--D1ox+EeWBIBWunlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpktFwAKCRB4tDGHoIJi
0l0hAP9oMgUCY0L0L+JXoet8nWv2zNgwIfTwZXavs+Iu/ca2qwD/Z1fYgBBK5XEW
GbXUIu/b+CkSuZDq65FI6d8WHUhECgg=
=5e8A
-----END PGP SIGNATURE-----

--D1ox+EeWBIBWunlR--
