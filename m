Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDB45C9EA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 17:24:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622D6E4FE;
	Wed, 24 Nov 2021 16:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [81.169.146.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800DF6E4FE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637771012;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=WkeyxDnipm2IfCekZmCiKiqZRWn6Vu+Xvk0lvgOQOOQ=;
 b=hy6ONITjwRwVgJTLrrZp34JxqWMaA09oCd9b7IkvSXvUktenVsJ3wKZBIMnqPSrBmg
 HcXbOQRrcMegCsdY1PznzlE/hW9KH5FySessqqDSytYraMlMOVFK16NH4+qzjI7CzL7O
 ohraAk5wSvwNbmZRO1IPYCgOE0ecZbjOusqtcM2CJa35pdnNQZhc6bB5F0f8OGh792j7
 9qzJqsHv/rtwvg3WLjSkDRDa2Gw9jvh5oeakSsG70woZaurWej1AjP2FYLeglE5c75Gp
 FyPRzRVOpTcJW60Bx2LXWgXJr4ykpidVMO1nX2OnEWiXNzz2BZulUYyJE6NC6V7eCA/G
 Sj4w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jsN+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAOGNV3mf
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Wed, 24 Nov 2021 17:23:31 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
Date: Wed, 24 Nov 2021 17:23:30 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <08D49974-2C22-404C-913C-11EB1C53A96A@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
 <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
 <1637722761.010276.888168.nullmailer@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips <linux-mips@vger.kernel.org>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> Am 24.11.2021 um 03:59 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Tue, 23 Nov 2021 19:13:56 +0100, H. Nikolaus Schaller wrote:
>> From: Sam Ravnborg <sam@ravnborg.org>
>>=20
>> Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
>> Based on .txt binding from Zubair Lutfullah Kakakhel
>>=20
>> We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml
>>=20
>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 =
+++++++++++++++++++
>> .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
>> 2 files changed, 79 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
>>=20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m =
dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> =
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l:36:5: [warning] wrong indentation: expected 2 but found 4 =
(indentation)

ok, fixed.

>=20
> dtschema/dtc warnings/errors:
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: 'unevaluatedPropertes' is not one of =
['$id', '$schema', 'title', 'description', 'examples',

ah, that is a typo (missing i in ...ties).

> 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', =
'additionalProperties', 'dependencies', 'dependentRequired', =
'dependentSchemas', 'patternProperties', 'properties', 'if', 'then', =
'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: 'oneOf' conditional failed, one must =
be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: A schema with a "$ref" to another schema either can define =
all properties used and use "additionalProperties" or can use =
"unevaluatedProperties"
> 	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
> Unknown file referenced: [Errno 2] No such file or directory: =
'/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/syn=
opsys,dw-hdmi.yaml'
> xargs: dt-doc-validate: exited with status 255; aborting
> =
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/displ=
ay/bridge/ingenic,jz4780-hdmi.yaml: ignoring, error in schema:=20
> warning: no schema found in file: =
./Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yam=
l
> =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.examp=
le.dts:19:18: fatal error: dt-bindings/clock/jz4780-cgu.h: No such file =
or directory
>   19 |         #include <dt-bindings/clock/jz4780-cgu.h>
>      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:373: =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.examp=
le.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1413: dt_binding_check] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1558736
>=20
> This check can fail if there are any dependencies. The base for a =
patch
> series is generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up =
to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.
>=20

