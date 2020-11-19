Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CF2B9E07
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 00:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36D66E82C;
	Thu, 19 Nov 2020 23:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C906E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 23:20:03 +0000 (UTC)
Received: from earth.universe (dyndsl-095-033-168-206.ewe-ip-backbone.de
 [95.33.168.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFC7F221FE;
 Thu, 19 Nov 2020 23:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605828003;
 bh=v3f3dbc03INVmDTETPz4Zq4KStacH/1qk3Nk6YbidYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BobGQHxBYWNxd9L5BIujuUvbFOIQQUBCFOX23/flb16Sr5MD/7YeoTtWr7kNv8R+2
 pT39kM1jWGibttZg/Hb5dWhoEoBxp/wkzKlRrd5Q3S18xHKjg0s+BRVW8K8fc0ehbP
 i85f9yzp1VeK1oqbIE15GSM46S/WM8um4x/Lp7zY=
Received: by earth.universe (Postfix, from userid 1000)
 id 9838A3C0C8E; Fri, 20 Nov 2020 00:20:00 +0100 (CET)
Date: Fri, 20 Nov 2020 00:20:00 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v4] dt-bindings: display: panel: one file of all simple
 LVDS panels with dual ports
Message-ID: <20201119232000.qipbppfz42sop5sm@earth.universe>
References: <1605577645-32173-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1605577645-32173-1-git-send-email-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0476904859=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0476904859==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mtk4fn3djpn6py3c"
Content-Disposition: inline


--mtk4fn3djpn6py3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 17, 2020 at 09:47:25AM +0800, Liu Ying wrote:
> To complement panel-simple.yaml, create panel-simple-lvds-dual-ports.yaml.
> panel-simple-lvds-dual-ports.yaml is for all simple LVDS panels that
> have dual LVDS ports and require only a single power-supply.
> The first port receives odd pixels, and the second port receives even pix=
els.
> Optionally, a backlight and an enable GPIO can be specified as properties.
>=20
> Panels with swapped pixel order, if any, need dedicated bindings.
>=20
> Migrate 'auo,g133han01', 'auo,g185han01', 'auo,g190ean01',
> 'koe,tx26d202vm0bwa' and 'nlt,nl192108ac18-02d' over to the new file.
>=20
> The objectives with one file for all the simple LVDS panels with dual por=
ts are:
> - Make it simpler to add bindings for this kind of LVDS panels
> - Keep the number of bindings file lower
> - Keep the binding documentation for this kind of LVDS panels more consis=
tent
> - Make it possible for drivers to get pixel order via
>   drm_of_lvds_get_dual_link_pixel_order(), as the optional 'ports' proper=
ty is
>   allowed
>=20
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Is this part of a bigger patchset updating the fsl,imx6q-ldb
binding [0] (and driver), which has the following property?

 - fsl,dual-channel : boolean. if it exists, only LVDS channel 0 should
   be configured - one input will be distributed on both outputs in dual
   channel mode

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/display/imx/ldb.txt

I have an out of tree platform (HW is still in development, DT will=20
be upstreamed when hardware design is final) using "auo,g190ean01"
with that panel on i.MX6 and it currently works. It don't mind
updating the DT (new binding looks cleaner :)), but this patch by
itself seems to 'break' support for dual channel panels on i.MX6?

-- Sebastian

> v3->v4:
> * Add type and descriptions for dual-lvds-{odd,even}-pixels properties.
>   Also, update descriptions for port@0 and port@1 properties accordingly.=
 (Rob)
>=20
> v2->v3:
> * Do not allow 'port' property. (Rob)
> * Define port number. (Rob)
> * Specify 'dual-lvds-odd-pixels' and 'dual-lvds-even-pixels' properties. =
(Rob)
>=20
> v1->v2:
> * Correct pixel order in example LVDS panel node.
>=20
>  .../panel/panel-simple-lvds-dual-ports.yaml        | 130 +++++++++++++++=
++++++
>  .../bindings/display/panel/panel-simple.yaml       |  10 --
>  2 files changed, 130 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel=
-simple-lvds-dual-ports.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/pan=
el-simple-lvds-dual-ports.yaml
> new file mode 100644
> index 00000000..38a789b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-d=
ual-ports.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-=
ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple LVDS panels with one power supply and dual LVDS ports
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  This binding file is a collection of the LVDS panels that
> +  has dual LVDS ports and requires only a single power-supply.
> +  The first port receives odd pixels, and the second port receives even =
pixels.
> +  There are optionally a backlight and an enable GPIO.
> +  The panel may use an OF graph binding for the association to the displ=
ay,
> +  or it may be a direct child node of the display.
> +
> +  If the panel is more advanced a dedicated binding file is required.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +
> +  compatible:
> +    enum:
> +    # compatible must be listed in alphabetical order, ordered by compat=
ible.
> +    # The description in the comment is mandatory for each compatible.
> +
> +        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> +      - auo,g133han01
> +        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> +      - auo,g185han01
> +        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> +      - auo,g190ean01
> +        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS=
 TFT LCD panel
> +      - koe,tx26d202vm0bwa
> +        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> +      - nlt,nl192108ac18-02d
> +
> +  ports:
> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: The first sink port.
> +        properties:
> +          reg:
> +            const: 0
> +
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +            description: The first sink port for odd pixels.
> +
> +        required:
> +          - reg
> +          - dual-lvds-odd-pixels
> +
> +      port@1:
> +        type: object
> +        description: The second sink port.
> +        properties:
> +          reg:
> +            const: 1
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +            description: The second sink port for even pixels.
> +
> +        required:
> +          - reg
> +          - dual-lvds-even-pixels
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +    additionalProperties: false
> +
> +  backlight: true
> +  enable-gpios: true
> +  power-supply: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +examples:
> +  - |
> +    panel: panel-lvds {
> +      compatible =3D "koe,tx26d202vm0bwa";
> +      power-supply =3D <&vdd_lcd_reg>;
> +
> +      ports {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        port@0 {
> +          dual-lvds-odd-pixels;
> +          reg =3D <0>;
> +
> +          panel_lvds0_in: endpoint {
> +            remote-endpoint =3D <&lvds0_out>;
> +          };
> +        };
> +
> +        port@1 {
> +          dual-lvds-even-pixels;
> +          reg =3D <1>;
> +
> +          panel_lvds1_in: endpoint {
> +            remote-endpoint =3D <&lvds1_out>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index f9750b0..62618e4 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -57,14 +57,8 @@ properties:
>        - auo,g104sn02
>          # AU Optronics Corporation 12.1" (1280x800) TFT LCD panel
>        - auo,g121ean01
> -        # AU Optronics Corporation 13.3" FHD (1920x1080) TFT LCD panel
> -      - auo,g133han01
>          # AU Optronics Corporation 15.6" (1366x768) TFT LCD panel
>        - auo,g156xtn01
> -        # AU Optronics Corporation 18.5" FHD (1920x1080) TFT LCD panel
> -      - auo,g185han01
> -        # AU Optronics Corporation 19.0" (1280x1024) TFT LCD panel
> -      - auo,g190ean01
>          # AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
>        - auo,p320hvn03
>          # AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD p=
anel
> @@ -167,8 +161,6 @@ properties:
>        - kingdisplay,kd116n21-30nv-a010
>          # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD =
panel
>        - koe,tx14d24vm1bpa
> -        # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS=
 TFT LCD panel
> -      - koe,tx26d202vm0bwa
>          # Kaohsiung Opto-Electronics. TX31D200VM0BAA 12.3" HSXGA LVDS pa=
nel
>        - koe,tx31d200vm0baa
>          # Kyocera Corporation 12.1" XGA (1024x768) TFT LCD panel
> @@ -205,8 +197,6 @@ properties:
>        - neweast,wjfh116008a
>          # Newhaven Display International 480 x 272 TFT LCD panel
>        - newhaven,nhd-4.3-480272ef-atxl
> -        # NLT Technologies, Ltd. 15.6" FHD (1920x1080) LVDS TFT LCD panel
> -      - nlt,nl192108ac18-02d
>          # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
>        - nvd,9128
>          # OKAYA Electric America, Inc. RS800480T-7X0GP 7" WVGA LCD panel
> --=20
> 2.7.4
>=20

--mtk4fn3djpn6py3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl+2/ZgACgkQ2O7X88g7
+pr+ig//eB5XfH8ddT6VqizMW9/PL69TNj2BN+qCMDPeoVXrKg7HoSAHy+KRzNUX
T6RJMVkYyXtce2wyAf9EppV5IL61q+c2IoLarrZouBgtaPTMCYifls8ObyWKxqOt
pfj5sEWBv8CCpozpkqHQF3sZ6+6IqfK7i6M1s2Hn6ZoO6BsefS+3tLHBQ66Sa6iV
3qo9zp439U1jhXRJwe9RvBrsgxZUyOjMrta0WAc22KBIIe7xcbeKjTzbV/hlAx0/
Dzqkdv2E6mP6fBNS5JY0pR8TT9roPOAcdavSd82gBVZiR15//oKTZfVkjE37f5L2
fQYNJEnZ9U0PnPfUXPIAQt0A86SesITAbzIRK8m3aHEmsgg1VYQmueARvQZk9rER
2Mhy0a/19KApXDmviLVieYktrI7M9yMM7/5nv4Cf0LfWPnWUeZQsyeOaE7VWILN2
wxJVODTNZd0Ix6sMxWEHUfzLOKgAzaCPZ9a+hIb2kpSaVlz2O54IYlcxJL4wX0Du
R7e08HaMle5K1JFesXyYxlCjAM2WmfjFqrPsVjXM4bYBY2ApoINbUviKyEg8EfBY
ooKWZPGL0AdDm7/1GZT1GP7N3fm7YT9anHvG5PcEz8OzupZiBklsQEsqs8qUe55w
658seDXCKmsM5WbHyXaeNhrJmt/v89nvnNKAO6skiJrOhpINc9Y=
=L+4l
-----END PGP SIGNATURE-----

--mtk4fn3djpn6py3c--

--===============0476904859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0476904859==--
