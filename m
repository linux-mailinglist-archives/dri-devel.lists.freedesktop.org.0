Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99546832965
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 13:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861AA10E9C5;
	Fri, 19 Jan 2024 12:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Fri, 19 Jan 2024 12:12:01 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDCF10E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705666321; x=1737202321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j6iDGS0RH2zPYPqLFo5vTY1M1nOg2boEqT3Tjpt4eYs=;
 b=N+v0yPmEvlx1DwyjqbHdfOLLA9AgU4VxMAnFZVLE0KB1u0NcLhZWEM6g
 aALrhMFdFDEbdvTAXJDv/ReS3yEUOLY4hJoaw4XsuEF3e3Emsdx7ugjHc
 xboFIjZh9/1HhC4aI7/Aka3fszWwt8Tb5B3KTaRG8+VQpADOAcL2wdujN
 MlG44dZdttosCNeatmPFwIfq/ZNiSwEX5DvQ0LMoeMP0v51J/iaS1jNww
 nS+xfHLG9/jfTmbvyXsrGx7gBoaV/IMYPwKLqJH7luZcpg/7+S4ZkWygr
 u4bk/GAIC1/Z8mKhiG91eoIgNGQuD4KTqFjQBXKdVM0gFqFzBda+doisU Q==;
X-CSE-ConnectionGUID: A5LlJf7nQL6xcXZAQ6I1bw==
X-CSE-MsgGUID: tkta2MrESBqXD4cPHCDwpQ==
X-IronPort-AV: E=Sophos;i="6.05,204,1701154800"; 
 d="asc'?scan'208";a="14994207"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2024 05:04:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 05:04:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 19 Jan 2024 05:04:20 -0700
Date: Fri, 19 Jan 2024 12:03:43 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <Dharma.B@microchip.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Message-ID: <20240119-character-mardi-43571d7fe7d5@wendy>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a0WqJfirCmr9EVhF"
Content-Disposition: inline
In-Reply-To: <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
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
 Nicolas.Ferre@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--a0WqJfirCmr9EVhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 03:32:49AM +0000, Dharma.B@microchip.com wrote:
> On 18/01/24 9:10 pm, Conor Dooley wrote:
> > On Thu, Jan 18, 2024 at 02:56:12PM +0530, Dharma Balasubiramani wrote:
> >> Convert the atmel,hlcdc binding to DT schema format.
> >>
> >> Adjust the clock-names property to clarify that the LCD controller exp=
ects
> >> one of these clocks (either sys_clk or lvds_pll_clk to be present but =
not
> >> both) along with the slow_clk and periph_clk. This alignment with the =
actual
> >> hardware requirements will enable accurate device tree configuration f=
or
> >> systems using the HLCDC IP.
> >>
> >> Signed-off-by: Dharma Balasubiramani<dharma.b@microchip.com>
> >> ---
> >> changelog
> >> v2 -> v3
> >> - Rename hlcdc-display-controller and hlcdc-pwm to generic names.
> >> - Modify the description by removing the unwanted comments and '|'.
> >> - Modify clock-names simpler.
> >> v1 -> v2
> >> - Remove the explicit copyrights.
> >> - Modify title (not include words like binding/driver).
> >> - Modify description actually describing the hardware and not the driv=
er.
> >> - Add details of lvds_pll addition in commit message.
> >> - Ref endpoint and not endpoint-base.
> >> - Fix coding style.
> >> ...
> >>   .../devicetree/bindings/mfd/atmel,hlcdc.yaml  | 97 +++++++++++++++++=
++
> >>   .../devicetree/bindings/mfd/atmel-hlcdc.txt   | 56 -----------
> >>   2 files changed, 97 insertions(+), 56 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/mfd/atmel,hlcdc=
=2Eyaml
> >>   delete mode 100644 Documentation/devicetree/bindings/mfd/atmel-hlcdc=
=2Etxt
> >>
> >> diff --git a/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml b/=
Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >> new file mode 100644
> >> index 000000000000..eccc998ac42c
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/mfd/atmel,hlcdc.yaml
> >> @@ -0,0 +1,97 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id:http://devicetree.org/schemas/mfd/atmel,hlcdc.yaml#
> >> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Atmel's HLCD Controller
> >> +
> >> +maintainers:
> >> +  - Nicolas Ferre<nicolas.ferre@microchip.com>
> >> +  - Alexandre Belloni<alexandre.belloni@bootlin.com>
> >> +  - Claudiu Beznea<claudiu.beznea@tuxon.dev>
> >> +
> >> +description:
> >> +  The Atmel HLCDC (HLCD Controller) IP available on Atmel SoCs expose=
s two
> >> +  subdevices, a PWM chip and a Display Controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - atmel,at91sam9n12-hlcdc
> >> +      - atmel,at91sam9x5-hlcdc
> >> +      - atmel,sama5d2-hlcdc
> >> +      - atmel,sama5d3-hlcdc
> >> +      - atmel,sama5d4-hlcdc
> >> +      - microchip,sam9x60-hlcdc
> >> +      - microchip,sam9x75-xlcdc
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 3
> > Hmm, one thing I probably should have said on the previous version, but
> > I missed somehow: It would be good to add an items list to the clocks
> > property here to explain what the 3 clocks are/are used for - especially
> > since there is additional complexity being added here to use either the
> > sys or lvds clocks.
> May I inquire if this approach is likely to be effective?
>=20
>    clocks:
>      items:
>        - description: peripheral clock
>        - description: generic clock or lvds pll clock
>            Once the LVDS PLL is enabled, the pixel clock is used as the
>            clock for LCDC, so its GCLK is no longer needed.
>        - description: slow clock
>      maxItems: 3

Hmm that sounds very suspect to me. "Once the lvdspll is enabled the
generic clock is no longer needed" sounds like both clocks can be provided
to the IP on different pins and their provision is not mutually
exclusive, just that the IP will only actually use one at a time. If
that is the case, then this patch is nott correct and the binding should
allow for 4 clocks, with both the generic clock and the lvds pll being
present in the DT at the same time.

I vaguely recall internal discussion about this problem some time back
but the details all escape me.

Thanks,
Conor.

--a0WqJfirCmr9EVhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaplHwAKCRB4tDGHoIJi
0lj2AP9K84iq37Rz1ulvFhMipsNqhqMxklWv5GvyAq1ZD/lqSwEAq0vY9saiWwW2
ah0UOybo+9cGrmPqOmpiVe3FFc6voAU=
=dla+
-----END PGP SIGNATURE-----

--a0WqJfirCmr9EVhF--
