Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06524CA29
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 11:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75B796E55E;
	Thu, 20 Jun 2019 09:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B536E55E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:01:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v19so2284287wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 02:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ApmKWG8RYgQutCkY7F4q2aQQ4gQQ7EE8HDouVdFzSzM=;
 b=V0eb6lQJ+C6F4EHdFg/a+bHPshscwr/LAh7SjWSdZWA+7QHPTrCj7ZDEmqoloZyfJ9
 e54ETjRKNzXoJjc8auug0UiGs/vHSC/TQ82fiJWFugU8Sl4be8M2ykOYFxO/CxKLAVUV
 IQB2OdDN8sdzLXhXt35g1567ZG45jeuTWvR9BbduTVoZWyxoz+FB4lTG8B84/bXsmUUl
 JBFPDWj8/ciI6Go6vSEZ/Vw/egKtxWzHzHV9r5Zumf17QvlbGgizKOOMXdAoXtoGyhO3
 8gy6o1wX298256QVP9Oc+Gj/AGvv7N6ZUIjvYv5s1sVj5TWq+TONS6ELLwJtB4zYDp2j
 o0HQ==
X-Gm-Message-State: APjAAAUdUzokd2349TZ+LDVr1tm4yyNKSP5shnEVVl4p1eXTMIb3tZoh
 /02Dd3w8doRutQr9QuxIXeQ=
X-Google-Smtp-Source: APXvYqwp8M5F3vV3/L9sNQJkRl4wG6hlL+WvCRQXON2yrHilljG3Y3TaHE34zoIt81ZeCtn0zBartQ==
X-Received: by 2002:a1c:3c84:: with SMTP id j126mr1889805wma.102.1561021283877; 
 Thu, 20 Jun 2019 02:01:23 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id x11sm3656962wmg.23.2019.06.20.02.01.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:01:23 -0700 (PDT)
Date: Thu, 20 Jun 2019 11:01:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/4] dt-bindings: display: Convert common panel
 bindings to DT schema
Message-ID: <20190620090122.GB26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190619215156.27795-1-robh@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ApmKWG8RYgQutCkY7F4q2aQQ4gQQ7EE8HDouVdFzSzM=;
 b=sm1t6jJeAA/r+Ko0TxTtJSadIuS3MBGwmN13VPshbyzufGz2NFOo+8QNmfv+MaazAw
 9YDCinrhgtDsmVfpNDYcuXAcvXnYnQNaXtoDMGTqMaY8ePN+5WfN4xiZYrPV+krbW+dO
 ibv2GC/beb5rLuxVwfr4OFLmS8AkiAYf82iby7owk0KscHQFRTrab6y5tVt/lki2cy38
 Jg2e/D9A8zBNLj9MvXY9eY/u+iGg6kyYoGj12BFZbj+Dxhx5PANwd6gwsB8Aj0QMUIYq
 nrgYDceBVdPeoxNSiHZZW2peYnkBHPSHq48lXvs3B+0hZVx86LXSvnLjh9SZa3JuB6E7
 IwVg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1876732216=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1876732216==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:53PM -0600, Rob Herring wrote:
> Convert the common panel bindings to DT schema consolidating scattered
> definitions to a single schema file.
>=20
> The 'simple-panel' binding just a collection of properties and not a
> complete binding itself. All of the 'simple-panel' properties are
> covered by the panel-common.txt binding with the exception of the
> 'no-hpd' property, so add that to the schema.
>=20
> As there are lots of references to simple-panel.txt, just keep the file
> with a reference to panel-common.yaml for now until all the bindings are
> converted.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Note there's still some references to panel-common.txt that I need to=20
> update or just go ahead and convert to schema.
>=20
>  .../bindings/display/panel/panel-common.txt   | 101 -------------
>  .../bindings/display/panel/panel-common.yaml  | 143 ++++++++++++++++++
>  .../bindings/display/panel/panel.txt          |   4 -
>  .../bindings/display/panel/simple-panel.txt   |  29 +---
>  4 files changed, 144 insertions(+), 133 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-common.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-common.yaml

I know it was this way before, but perhaps remove the redundant panel-
prefix while at it?

>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common=
=2Etxt b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> deleted file mode 100644
> index 5d2519af4bb5..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -Common Properties for Display Panel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -This document defines device tree properties common to several classes of
> -display panels. It doesn't constitue a device tree binding specification=
 by
> -itself but is meant to be referenced by device tree bindings.
> -
> -When referenced from panel device tree bindings the properties defined i=
n this
> -document are defined as follows. The panel device tree bindings are
> -responsible for defining whether each property is required or optional.
> -
> -
> -Descriptive Properties
> -----------------------
> -
> -- width-mm,
> -- height-mm: The width-mm and height-mm specify the width and height of =
the
> -  physical area where images are displayed. These properties are express=
ed in
> -  millimeters and rounded to the closest unit.
> -
> -- label: The label property specifies a symbolic name for the panel as a
> -  string suitable for use by humans. It typically contains a name inscri=
bed on
> -  the system (e.g. as an affixed label) or specified in the system's
> -  documentation (e.g. in the user's manual).
> -
> -  If no such name exists, and unless the property is mandatory according=
 to
> -  device tree bindings, it shall rather be omitted than constructed of
> -  non-descriptive information. For instance an LCD panel in a system that
> -  contains a single panel shall not be labelled "LCD" if that name is not
> -  inscribed on the system or used in a descriptive fashion in system
> -  documentation.
> -
> -
> -Display Timings
> ----------------
> -
> -- panel-timing: Most display panels are restricted to a single resolutio=
n and
> -  require specific display timings. The panel-timing subnode expresses t=
hose
> -  timings as specified in the timing subnode section of the display timi=
ng
> -  bindings defined in
> -  Documentation/devicetree/bindings/display/panel/display-timing.txt.
> -
> -
> -Connectivity
> -------------
> -
> -- ports: Panels receive video data through one or multiple connections. =
While
> -  the nature of those connections is specific to the panel type, the
> -  connectivity is expressed in a standard fashion using ports as specifi=
ed in
> -  the device graph bindings defined in
> -  Documentation/devicetree/bindings/graph.txt.
> -
> -- ddc-i2c-bus: Some panels expose EDID information through an I2C-compat=
ible
> -  bus such as DDC2 or E-DDC. For such panels the ddc-i2c-bus contains a
> -  phandle to the system I2C controller connected to that bus.
> -
> -
> -Control I/Os
> -------------
> -
> -Many display panels can be controlled through pins driven by GPIOs. The =
nature
> -and timing of those control signals are device-specific and left for pan=
el
> -device tree bindings to specify. The following GPIO specifiers can howev=
er be
> -used for panels that implement compatible control signals.
> -
> -- enable-gpios: Specifier for a GPIO connected to the panel enable contr=
ol
> -  signal. The enable signal is active high and enables operation of the =
panel.
> -  This property can also be used for panels implementing an active low p=
ower
> -  down signal, which is a negated version of the enable signal. Active l=
ow
> -  enable signals (or active high power down signals) can be supported by
> -  inverting the GPIO specifier polarity flag.
> -
> -  Note that the enable signal control panel operation only and must not =
be
> -  confused with a backlight enable signal.
> -
> -- reset-gpios: Specifier for a GPIO coonnected to the panel reset control
> -  signal. The reset signal is active low and resets the panel internal l=
ogic
> -  while active. Active high reset signals can be supported by inverting =
the
> -  GPIO specifier polarity flag.
> -
> -Power
> ------
> -
> -- power-supply: display panels require power to be supplied. While sever=
al
> -  panels need more than one power supply with panel-specific constraints
> -  governing the order and timings of the power supplies, in many cases a=
 single
> -  power supply is sufficient, either because the panel has a single powe=
r rail,
> -  or because all its power rails can be driven by the same supply. In th=
at case
> -  the power-supply property specifies the supply powering the panel as a=
 phandle
> -  to a regulator.
> -
> -Backlight
> ----------
> -
> -Most display panels include a backlight. Some of them also include a bac=
klight
> -controller exposed through a control bus such as I2C or DSI. Others expo=
se
> -backlight control through GPIO, PWM or other signals connected to an ext=
ernal
> -backlight controller.
> -
> -- backlight: For panels whose backlight is controlled by an external bac=
klight
> -  controller, this property contains a phandle that references the contr=
oller.
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> new file mode 100644
> index 000000000000..6fe87254edad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Properties for Display Panels
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  This document defines device tree properties common to several classes=
 of
> +  display panels. It doesn't constitue a device tree binding specificati=
on by
> +  itself but is meant to be referenced by device tree bindings.
> +
> +  When referenced from panel device tree bindings the properties defined=
 in this
> +  document are defined as follows. The panel device tree bindings are
> +  responsible for defining whether each property is required or optional.
> +
> +

Are the two blank lines here on purpose? The original document had two
blank lines here, but that was mostly for readability I would guess. The
YAML format doesn't really need additional formatting for readability,
so perhaps just remove the extra blank line?

> +properties:
> +  # Descriptive Properties
> +  width-mm:
> +    description: The width-mm and height-mm specify the width and height=
 of the
> +      physical area where images are displayed. These properties are exp=
ressed
> +      in millimeters and rounded to the closest unit.
> +
> +  height-mm:
> +    description: The width-mm and height-mm specify the width and height=
 of the
> +      physical area where images are displayed. These properties are exp=
ressed
> +      in millimeters and rounded to the closest unit.

I suppose there's no way in YAML to share the description between both
the width-mm and height-mm properties? It's a little unfortunate that we
have to copy, but if there's no better way, guess we'll have to live
with it.

> +
> +  label:
> +    description: |
> +      The label property specifies a symbolic name for the panel as a
> +      string suitable for use by humans. It typically contains a name in=
scribed
> +      on the system (e.g. as an affixed label) or specified in the syste=
m's
> +      documentation (e.g. in the user's manual).
> +
> +      If no such name exists, and unless the property is mandatory accor=
ding to
> +      device tree bindings, it shall rather be omitted than constructed =
of
> +      non-descriptive information. For instance an LCD panel in a system=
 that
> +      contains a single panel shall not be labelled "LCD" if that name i=
s not
> +      inscribed on the system or used in a descriptive fashion in system
> +      documentation.
> +
> +  rotation:
> +    description:
> +      Display rotation in degrees counter clockwise (0,90,180,270)
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [ 0, 90, 180, 270 ]
> +
> +  # Display Timings
> +  panel-timing:

Am I the only one bugged by the redundancy in this property name? What
else is the timing going to express if not the timing of the panel that
it's part of. "timing" really would be enough. Anyway, not much we can
do about it now.

> +    type: object
> +    description:
> +      Most display panels are restricted to a single resolution and
> +      require specific display timings. The panel-timing subnode express=
es those
> +      timings as specified in the timing subnode section of the display =
timing
> +      bindings defined in
> +      Documentation/devicetree/bindings/display/panel/display-timing.txt.
> +
> +  # Connectivity
> +  ports:
> +    type: object
> +    description:
> +      Panels receive video data through one or multiple connections. Whi=
le
> +      the nature of those connections is specific to the panel type, the
> +      connectivity is expressed in a standard fashion using ports as spe=
cified
> +      in the device graph bindings defined in
> +      Documentation/devicetree/bindings/graph.txt.
> +
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Some panels expose EDID information through an I2C-compatible
> +      bus such as DDC2 or E-DDC. For such panels the ddc-i2c-bus contain=
s a
> +      phandle to the system I2C controller connected to that bus.
> +
> +  no-hpd:
> +    type: boolean
> +    description:
> +      This panel is supposed to communicate that it's ready via HPD
> +      (hot plug detect) signal, but the signal isn't hooked up so we sho=
uld
> +      hardcode the max delay from the panel spec when powering up the pa=
nel.
> +
> +  # Control I/Os
> +
> +  # Many display panels can be controlled through pins driven by GPIOs. =
The nature
> +  # and timing of those control signals are device-specific and left for=
 panel
> +  # device tree bindings to specify. The following GPIO specifiers can h=
owever be
> +  # used for panels that implement compatible control signals.
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: |
> +      Specifier for a GPIO connected to the panel enable control signal.=
 The
> +      enable signal is active high and enables operation of the panel. T=
his
> +      property can also be used for panels implementing an active low po=
wer down
> +      signal, which is a negated version of the enable signal. Active lo=
w enable
> +      signals (or active high power down signals) can be supported by in=
verting
> +      the GPIO specifier polarity flag.
> +
> +      Note that the enable signal control panel operation only and must =
not be
> +      confused with a backlight enable signal.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifier for a GPIO coonnected to the panel reset control signal.

This is preexisting, but: "connected".

> +      The reset signal is active low and resets the panel internal logic
> +      while active. Active high reset signals can be supported by invert=
ing the
> +      GPIO specifier polarity flag.
> +
> +  # Power
> +  power-supply:
> +    description:
> +      Display panels require power to be supplied. While several panels =
need
> +      more than one power supply with panel-specific constraints governi=
ng the
> +      order and timings of the power supplies, in many cases a single po=
wer
> +      supply is sufficient, either because the panel has a single power =
rail, or
> +      because all its power rails can be driven by the same supply. In t=
hat case
> +      the power-supply property specifies the supply powering the panel =
as a
> +      phandle to a regulator.
> +
> +  # Backlight
> +
> +  # Most display panels include a backlight. Some of them also include a=
 backlight
> +  # controller exposed through a control bus such as I2C or DSI. Others =
expose
> +  # backlight control through GPIO, PWM or other signals connected to an=
 external
> +  # backlight controller.
> +
> +  backlight:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      For panels whose backlight is controlled by an external backlight
> +      controller, this property contains a phandle that references the
> +      controller.
> +
> +...
> diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/=
Documentation/devicetree/bindings/display/panel/panel.txt
> deleted file mode 100644
> index e2e6867852b8..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panel.txt
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -Common display properties
> --------------------------
> -
> -- rotation:	Display rotation in degrees counter clockwise (0,90,180,270)
> diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel=
=2Etxt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> index b2b872c710f2..e11208fb7da8 100644
> --- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
> @@ -1,28 +1 @@
> -Simple display panel
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -panel node
> -----------
> -
> -Required properties:
> -- power-supply: See panel-common.txt
> -
> -Optional properties:
> -- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- no-hpd: This panel is supposed to communicate that it's ready via HPD
> -  (hot plug detect) signal, but the signal isn't hooked up so we should
> -  hardcode the max delay from the panel spec when powering up the panel.
> -
> -Example:
> -
> -	panel: panel {
> -		compatible =3D "cptt,claa101wb01";
> -		ddc-i2c-bus =3D <&panelddc>;
> -
> -		power-supply =3D <&vdd_pnl_reg>;
> -		enable-gpios =3D <&gpio 90 0>;
> -
> -		backlight =3D <&backlight>;
> -	};
> +See panel-common.yaml in this directory.

We can address the nits above separately, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LS18ACgkQ3SOs138+
s6HfLw/+MowHEi6aMiOK6YEM/MW41vS28dSf0/lmdYsfULR/rQI7EAU+KUhN88lK
7ZHCPNGQbgZk+U9YkjOvExxAlEVPQj3Mzj3y4+qihvr3Vt33OWIvvzT719p9hGuq
FReOKOJFse/kg47xRPn4/7ueqYoM6mB2stKqx0gZpBuZVvqSWWHE28QdYS1wTclQ
yRUFu9Ox8sSAiK+Il1Qb5qDw+moFCyyUmE3LcJbyrMNK1YuG/zOBuiDm9i5owBdQ
YS01WpLyTMDLdRNEMOKigZ0maQq/Ny8KoUNaXlOdsj5wiTqRxcfYBWs+aew6L+iN
AWrmm1Ap2uBaQevFjjBgU+QRDH/Hll6/LohlZuvuugPqU00FFbVYbIl8WhyTiGVP
6CSgnaj2chtGENFHGKFEq0c+49X14SE7PVEHQnavBxE0KgNIUrK4Me8Svfo1OIrz
87utW697p/XJOQ0E1Z18gYXjRdH2MFolSSKKk3CC+kT8KPSg47tAiG8haxSNYa8r
hf8/dO2fj/tOKmnRR8Amg3GSLcW1qQ4VTok5gbpYbIdXLSv2YqLyr2Z9FZRsINVU
G6jwpn8Y/RWrFdfjWeVo3tIvZZvf5ejZ3D5QeFlOCj054xI3+/2+Z4xylxj+TwtI
c9drwIXpTtMVJoG8aaJetamlk6DIpZbYN0nN2LQimoteJcueeiA=
=Q6gG
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--

--===============1876732216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1876732216==--
