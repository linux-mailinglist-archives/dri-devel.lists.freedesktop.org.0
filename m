Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F71755E596
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3B10E76D;
	Tue, 28 Jun 2022 15:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222FE10F7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 15:04:47 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o6ClP-0005Ih-K7; Tue, 28 Jun 2022 17:04:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/16] dt-bindings: display: convert ilitek,
 ili9341.txt to dt-schema
Date: Tue, 28 Jun 2022 17:04:26 +0200
Message-ID: <22692709.6Emhk5qWAg@diego>
In-Reply-To: <3361801.QJadu78ljV@diego>
References: <20220627194003.2395484-1-mail@conchuod.ie>
 <20220627194003.2395484-2-mail@conchuod.ie> <3361801.QJadu78ljV@diego>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <mail@conchuod.ie>,
 Conor Dooley <conor.dooley@microchip.com>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Paul Walmsley <paul.walmsley@sifive.com>, dmaengine@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 28. Juni 2022, 17:00:56 CEST schrieb Heiko St=FCbner:
> Hi Conor,
>=20
> Am Montag, 27. Juni 2022, 21:39:49 CEST schrieb Conor Dooley:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > A dt-schema binding for the Ilitek ili9341 was created as
> > panel/ilitek,ili9341.yaml but the txt binding was ignored in the
> > process. Move the remaining items in the txt binding to the yaml one &
> > delete it.
> >=20
> > The example in the txt binding has a spi-max-frequency which disagrees
> > with the yaml replacement (and its own documentation) so change that to
> > conform with the binding. There are no users in tree of the Adafruit
> > yx240qv29 to check against.
> >=20
> > Link: https://cdn-learn.adafruit.com/assets/assets/000/046/879/original=
/SPEC-YX240QV29-T_Rev.A__1_.pdf
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> in your v1 you already got a [0]
> Reviewed-by: Rob Herring <robh@kernel.org>
> for this patch
>=20
> Looking at the diffstat, which didn't change, you should
> include such tags in followup revisions, to prevent
> reviewers from double efforts.

and now I see that the review actually happened _after_ v2 was send ;-)


> [0] https://lore.kernel.org/r/20220627232054.GA3155668-robh@kernel.org
>=20
> > ---
> >  .../bindings/display/ilitek,ili9341.txt       | 27 -----------
> >  .../display/panel/ilitek,ili9341.yaml         | 48 +++++++++++++------
> >  2 files changed, 34 insertions(+), 41 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/ilitek,il=
i9341.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.t=
xt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > deleted file mode 100644
> > index 169b32e4ee4e..000000000000
> > --- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -Ilitek ILI9341 display panels
> > -
> > -This binding is for display panels using an Ilitek ILI9341 controller =
in SPI
> > -mode.
> > -
> > -Required properties:
> > -- compatible:	"adafruit,yx240qv29", "ilitek,ili9341"
> > -- dc-gpios:	D/C pin
> > -- reset-gpios:	Reset pin
> > -
> > -The node for this driver must be a child node of a SPI controller, hen=
ce
> > -all mandatory properties described in ../spi/spi-bus.txt must be speci=
fied.
> > -
> > -Optional properties:
> > -- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
> > -- backlight:	phandle of the backlight device attached to the panel
> > -
> > -Example:
> > -	display@0{
> > -		compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> > -		reg =3D <0>;
> > -		spi-max-frequency =3D <32000000>;
> > -		dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > -		reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > -		rotation =3D <270>;
> > -		backlight =3D <&backlight>;
> > -	};
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili=
9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.=
yaml
> > index 6058948a9764..94ca92878434 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.ya=
ml
> > @@ -23,6 +23,7 @@ properties:
> >        - enum:
> >            # ili9341 240*320 Color on stm32f429-disco board
> >            - st,sf-tc240t-9370-t
> > +          - adafruit,yx240qv29
> >        - const: ilitek,ili9341
> > =20
> >    reg: true
> > @@ -47,31 +48,50 @@ properties:
> >    vddi-led-supply:
> >      description: Voltage supply for the LED driver (1.65 .. 3.3 V)
> > =20
> > -additionalProperties: false
> > +unevaluatedProperties: false
> > =20
> >  required:
> >    - compatible
> >    - reg
> >    - dc-gpios
> > -  - port
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - st,sf-tc240t-9370-t
> > +then:
> > +  required:
> > +    - port
> > =20
> >  examples:
> >    - |+
> > +    #include <dt-bindings/gpio/gpio.h>
> >      spi {
> >          #address-cells =3D <1>;
> >          #size-cells =3D <0>;
> >          panel: display@0 {
> > -                 compatible =3D "st,sf-tc240t-9370-t",
> > -                              "ilitek,ili9341";
> > -                 reg =3D <0>;
> > -                 spi-3wire;
> > -                 spi-max-frequency =3D <10000000>;
> > -                 dc-gpios =3D <&gpiod 13 0>;
> > -                 port {
> > -                         panel_in: endpoint {
> > -                           remote-endpoint =3D <&display_out>;
> > -                      };
> > -                 };
> > -             };
> > +            compatible =3D "st,sf-tc240t-9370-t",
> > +                         "ilitek,ili9341";
> > +            reg =3D <0>;
> > +            spi-3wire;
> > +            spi-max-frequency =3D <10000000>;
> > +            dc-gpios =3D <&gpiod 13 0>;
> > +            port {
> > +                panel_in: endpoint {
> > +                    remote-endpoint =3D <&display_out>;
> > +                };
> > +            };
> > +        };
> > +        display@1{
> > +            compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> > +            reg =3D <1>;
> > +            spi-max-frequency =3D <10000000>;
> > +            dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > +            rotation =3D <270>;
> > +            backlight =3D <&backlight>;
> >          };
> > +    };
> >  ...
> >=20
>=20
>=20




