Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D662C9947
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF316E4D7;
	Tue,  1 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEFB6E8CC
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 21:49:13 +0000 (UTC)
Date: Mon, 30 Nov 2020 21:48:58 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ABT Y030XX067A panel
 bindings
To: Rob Herring <robh+dt@kernel.org>
Message-Id: <MXPMKQ.PSU8COVVM0IV2@crapouillou.net>
In-Reply-To: <CAL_JsqJDQMzHjtYa6ZCOxXW_U5nWrS+DhBj-w2myn-SkGB+KCA@mail.gmail.com>
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-3-paul@crapouillou.net>
 <20201101122900.GB1269759@ravnborg.org>
 <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
 <CAL_JsqLSGMFibm8tVKqNe1SFBzXTU2=M2jZmpfrHeGUqS3foRg@mail.gmail.com>
 <1XJMKQ.YER47WG3D7R41@crapouillou.net>
 <CAL_JsqJDQMzHjtYa6ZCOxXW_U5nWrS+DhBj-w2myn-SkGB+KCA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun. 30 nov. 2020 =E0 13:18, Rob Herring <robh+dt@kernel.org> a =

=E9crit :
> On Mon, Nov 30, 2020 at 12:39 PM Paul Cercueil <paul@crapouillou.net> =

> wrote:
>> =

>>  Hi Rob,
>> =

>>  Le lun. 30 nov. 2020 =E0 7:32, Rob Herring <robh+dt@kernel.org> a =

>> =E9crit
>>  :
>>  > On Mon, Nov 2, 2020 at 3:19 AM Paul Cercueil =

>> <paul@crapouillou.net>
>>  > wrote:
>>  >>
>>  >>
>>  >>
>>  >>  Le dim. 1 nov. 2020 =E0 13:29, Sam Ravnborg <sam@ravnborg.org> a
>>  >> =E9crit :
>>  >>  > On Sun, Nov 01, 2020 at 09:31:48AM +0000, Paul Cercueil wrote:
>>  >>  >>  The Asia Better Technology (ABT) Y030XX067A panel is a 3.0"
>>  >> 320x480
>>  >>  >>  24-bit IPS LCD panel. Its particularity is that it has
>>  >> non-square
>>  >>  >> pixels
>>  >>  >>  (as it is 4:3 for a resolution of 320x480), and that it
>>  >> requires odd
>>  >>  >>  lines to be sent as RGB and even lines to be sent as GRB on =

>> its
>>  >>  >> 8-bit
>>  >>  >>  bus.
>>  >>  >>
>>  >>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  >>  ---
>>  >>  >>   .../display/panel/abt,y030xx067a.yaml         | 54
>>  >>  >> +++++++++++++++++++
>>  >>  >>   1 file changed, 54 insertions(+)
>>  >>  >>   create mode 100644
>>  >>  >>
>>  >> =

>> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  >>  >>
>>  >>  >>  diff --git
>>  >>  >>
>>  >> =

>> a/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  >>  >>
>>  >> =

>> b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  >>  >>  new file mode 100644
>>  >>  >>  index 000000000000..6407e8bf45fa
>>  >>  >>  --- /dev/null
>>  >>  >>  +++
>>  >>  >>
>>  >> =

>> b/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
>>  >>  >>  @@ -0,0 +1,54 @@
>>  >>  >>  +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>  >>  >>  +%YAML 1.2
>>  >>  >>  +---
>>  >>  >>  +$id:
>>  >>  >> =

>> http://devicetree.org/schemas/display/panel/abt,y030xx067a.yaml#
>>  >>  >>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  >>  >>  +
>>  >>  >>  +title: Asia Better Technology 3.0" (320x480 pixels) 24-bit =

>> IPS
>>  >> LCD
>>  >>  >> panel
>>  >>  >>  +
>>  >>  >>  +description: |
>>  >>  >>  +  The panel must obey the rules for a SPI slave device as
>>  >>  >> specified in
>>  >>  >>  +  spi/spi-controller.yaml
>>  >>  >>  +
>>  >>  >>  +maintainers:
>>  >>  >>  +  - Paul Cercueil <paul@crapouillou.net>
>>  >>  >>  +
>>  >>  >>  +allOf:
>>  >>  >>  +  - $ref: panel-common.yaml#
>>  >>  >>  +
>>  >>  >>  +properties:
>>  >>  >>  +  compatible:
>>  >>  >>  +    const: abt,y030xx067a
>>  >>  >>  +
>>  >>  >>  +  backlight: true
>>  >>  >>  +  port: true
>>  >>  >>  +  power-supply: true
>>  >>  >>  +  reg: true
>>  >>  >>  +  reset-gpios: true
>>  >>  >
>>  >>  > The binding is missing:
>>  >>  > required:
>>  >>  >   - compatible
>>  >>  >   - reg
>>  >>  >   - power-supply
>>  >>  >   - reset-gpios
>>  >>  >   - ...
>>  >>  >
>>  >>  > additionalProperties: false
>>  >>  >
>>  >>  > So r-b only with these added.
>>  >>
>>  >>  Stupid mistake, sorry about that.
>>  >>
>>  >>  I'll V2.
>>  >
>>  > I don't have any V2 in my inbox, but looks like it is in =

>> linux-next
>>  > now:
>> =

>>  Yes, Sam told me on IRC I could fix it while applying and avoid the =

>> V2.
>> =

>>  > =

>> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/d=
isplay/panel/abt,y030xx067a.example.dt.yaml:
>>  > panel@0: 'spi-max-frequency' does not match any of the regexes:
>>  > 'pinctrl-[0-9]+'
>>  >  From schema:
>>  > =

>> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/d=
isplay/panel/abt,y030xx067a.yaml
>> =

>>  "make dt_binding_check
>>  =

>> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/display/panel/abt,y0=
30xx067a.yaml"
>>  doesn't complain here :(
> =

> Even if you do 'touch
> Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml'
> or do a clean build?
> =

> I can't think of any kernel or dt-schema changes which would explain
> the difference. This is purely related to 'additionalProperties:
> false'.

Ok, I see it now.
Should I use 'unevaluatedProperties: false' instead?

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
