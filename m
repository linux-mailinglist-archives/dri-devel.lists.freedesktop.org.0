Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D31463C70
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 18:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC96E3AC;
	Tue, 30 Nov 2021 17:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BC36E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638291671;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=UIf15iMEtDEvJh887G0IYN5tzrRPMwEaqTyUehQEpsc=;
 b=gcTD6DNbCqRZgz3hRCZCtBRA9Ot4gxTXz9DhxAeHr97rIeO6H8W956dM7G8rkpQQKD
 l4Jww2PBhgDF7Ko6tBTb2NU/SaNsbtuxrAYm0H4hb6u6U7rByUId+2Iq9eCRR1Z1J3KQ
 pKrCfI8N7jQX71gklajTwYLXpP4Ukf5KTeg+YldFYiL/9OOU+MeEidqg5RyRECuP1G5C
 GhM3kKUjMnhSPih6otLPI9Fnddx0fN+RTn+j6ZSy8/fwFCs47GRpBzFDq8UO1m8wKpO/
 ai87qt/r+DTJPVfY9+1e8kpKssTKltSyVxRpURukUsf3pb6Esvd2Xd1oao8SBFJvyc+a
 c3Pg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3iMERYA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.10 DYNA|AUTH)
 with ESMTPSA id e05ed8xAUH19Sxv
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 30 Nov 2021 18:01:09 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v9 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi
 DT Schema
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1637875562.255498.2858308.nullmailer@robh.at.kernel.org>
Date: Tue, 30 Nov 2021 18:01:08 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <A72D034E-EDBC-44F5-82DF-9EEBC5EC7E0B@goldelico.com>
References: <cover.1637789354.git.hns@goldelico.com>
 <d678e785d95487202ac0660eb66796e9fb5beb50.1637789354.git.hns@goldelico.com>
 <1637875562.255498.2858308.nullmailer@robh.at.kernel.org>
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
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, letux-kernel@openphoenux.org,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

> Am 25.11.2021 um 22:26 schrieb Rob Herring <robh@kernel.org>:
>=20
> On Wed, 24 Nov 2021 22:29:09 +0100, H. Nikolaus Schaller wrote:
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
>=20
> dtschema/dtc warnings/errors:
> Unknown file referenced: [Errno 2] No such file or directory: =
'/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/syn=
opsys,dw-hdmi.yaml'

I wasn't able to fix that.

If I change

 allOf:
-  - $ref: bridge/synopsys,dw-hdmi.yaml#
+  - $ref: synopsys,dw-hdmi.yaml#

then make dt_binding_check still reports:

Unknown file referenced: [Errno 2] No such file or directory: =
'/Users/hns/Library/Python/3.7/lib/python/site-packages/dtschema/schemas/b=
ridge/synopsys,dw-hdmi.yaml'

BR and thanks,
Nikolaus Schaller

> xargs: dt-doc-validate: exited with status 255; aborting
> make[1]: *** Deleting file =
'Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.exam=
ple.dt.yaml'
> Unknown file referenced: [Errno 2] No such file or directory: =
'/usr/local/lib/python3.8/dist-packages/dtschema/schemas/bridge/bridge/syn=
opsys,dw-hdmi.yaml'
> make[1]: *** [scripts/Makefile.lib:373: =
Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.examp=
le.dt.yaml] Error 255
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1413: dt_binding_check] Error 2
>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/patch/1559375
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

