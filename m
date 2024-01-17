Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A426A8309D6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94A010E111;
	Wed, 17 Jan 2024 15:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32610E111
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 65B66B8110A;
 Wed, 17 Jan 2024 15:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A92BC433F1;
 Wed, 17 Jan 2024 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705505616;
 bh=w9AyQqO1uvaQ6Pzh2cbYZgNdKf4g5fbaWOyASO2Ljck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=juXSqzQD8NPfYymf7Aj8Yebd3glU+iuGGDJqcvvQAcE5Zs9pCkimxetanzpiDujUh
 nqWeTzNsoT4tFH+DYJgWg62B9ZBOjzHjnXUwwXRtrHRzaAgzjAsTGTS2oAHPGXgkqY
 fcKFw46TPlAgkFJmRBDHZpEG97wqDjNrQylWtYQMQbVemtGuk2SL1McJ3DDC7HfehA
 l5K30G3RJ4KW4W1Mx3vyJ53ntWSUhiidBZiIWRoyCnbieV42lb3109NVUirfphnl84
 BtEA2ulVgfIuo/rJX8Zk6p2hoV0VUmFRPnvJ14RPqPnTvrRQ5GLDSQiAjqGml2kIkb
 pG51k/Q4khj6A==
Date: Wed, 17 Jan 2024 15:33:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Dharma.B@microchip.com
Subject: Re: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Message-ID: <20240117-headlock-edge-56ddb1b273d2@spud>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-3-dharma.b@microchip.com>
 <20240116-rising-gap-df4124f191a0@spud>
 <20240116201052544a0791@mail.local>
 <6124f244-23bc-4b84-b678-f7214cf8c48e@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DoTaz71aMjV6NLTq"
Content-Disposition: inline
In-Reply-To: <6124f244-23bc-4b84-b678-f7214cf8c48e@microchip.com>
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DoTaz71aMjV6NLTq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 02:43:00AM +0000, Dharma.B@microchip.com wrote:
> On 17/01/24 1:40 am, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >=20
> > On 16/01/2024 18:03:19+0000, Conor Dooley wrote:
> >> On Tue, Jan 16, 2024 at 05:07:59PM +0530, Dharma Balasubiramani wrote:
> >>> Convert device tree bindings for Atmel's HLCDC PWM controller to YAML
> >>> format.
> >>>
> >>> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> >>> ---
> >>> changelog
> >>> v1 -> v2
> >>> - Remove the explicit copyrights.
> >>> - Modify title (not include words like binding/driver).
> >>> - Modify description actually describing the hardware and not the dri=
ver.
> >>> - Remove pinctrl properties which aren't required.
> >>> - Drop parent node and it's other sub-device node which are not relat=
ed here.
> >>> ---
> >>>   .../bindings/pwm/atmel,hlcdc-pwm.yaml         | 47 ++++++++++++++++=
+++
> >>>   .../bindings/pwm/atmel-hlcdc-pwm.txt          | 29 ------------
> >>>   2 files changed, 47 insertions(+), 29 deletions(-)
> >>>   create mode 100644 Documentation/devicetree/bindings/pwm/atmel,hlcd=
c-pwm.yaml
> >>>   delete mode 100644 Documentation/devicetree/bindings/pwm/atmel-hlcd=
c-pwm.txt
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> >>> new file mode 100644
> >>> index 000000000000..751122309fa9
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/pwm/atmel,hlcdc-pwm.yaml
> >>> @@ -0,0 +1,47 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>
> >> The original file has no license, but was originally written by a
> >> free-electrons employee, so the relicensing here is fine.
> >>
> >=20
> > I confirm relicensing is fine, even assigning the copyright to
> > Microchip (note that Bootlin is legally the same entity as
> > free-electrons)
> Thanks Conor and Alexandre.
> I will add the copyrights back in v3.

Just to note, in case you misunderstood my original comment here:
What I said had nothing to do with adding a Microchip copyright assignment
to the file, but rather about the fact that your patch relicenses the
binding from GPL v2 to GPL v2 OR BSD 2 Clause.

--DoTaz71aMjV6NLTq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZafzSQAKCRB4tDGHoIJi
0uhWAP9sPtOsSbgjeMwmrPgtE25/rPhVuUYA4EtnZYnFVOomLAEAn6o/t72tp2Hq
l57Y94vYJTKM0wa2J26KOcSljmIOewo=
=SrTr
-----END PGP SIGNATURE-----

--DoTaz71aMjV6NLTq--
