Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF8B50138
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2B10E79E;
	Tue,  9 Sep 2025 15:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.b="jMBIfvOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DA210E559
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 15:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
 s=protonmail; t=1757346209; x=1757605409;
 bh=x9Ob/glSFueHSPO0Wj/dOLbbFRpTBrMxJISHgqFSZ14=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=jMBIfvOxy9+Ao7hYxmZScjkS1BLtG8iLGw4n108iE8nSZGfhW8enmg8RAyBPmP6BY
 E+UHWrwC54nm1MgodC3GrYy2cTO8nZbiDjuXftayZZcC2ZLvMJMmWwRx8JkW96J2dD
 1mBdyOLSTGhkoJgq+Gu7lBl7HCEPBAg9vymZOhyNCXuoASsHxx0CTIVDBN4VkarVKB
 D5d/u4Q0eic+0R9HOeq/S5BHTiVNjh4Vbun4GF8gu2RhFc2k/apqy/01mNsGudDmDH
 jsZKa8bBIWfz9y9EtLP+jgWGLPpyDxvjAoBiX7klsi2dgu84eADM56B6IXQb06xoIS
 9L4zaiATsVGmw==
Date: Mon, 08 Sep 2025 15:43:22 +0000
To: "Rob Herring (Arm)" <robh@kernel.org>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pavel Machek <pavel@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jacopo Mondi <jacopo@jmondi.org>, Hans de Goede <hansg@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 dri-devel@lists.freedesktop.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-leds@vger.kernel.org,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Daniel Thompson <danielt@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: leds: add generic LED consumer
 documentation
Message-ID: <COW1cS_CD75b8_MjT5gZA2c8oVf7iAbYPP7RR0TfJwPCqyhpf7LJn8YRjePaJHKnqE4TQZq4UTvmHGlSiv6rVJjdQSmp70FAjg5zkPbEeh0=@vinarskis.com>
In-Reply-To: <175734087835.1809005.14330068317471966084.robh@kernel.org>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
 <20250908-leds-v3-1-5944dc400668@vinarskis.com>
 <175734087835.1809005.14330068317471966084.robh@kernel.org>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: eae4543f989db2525140815fbb8eb7d8efde1f9a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 09 Sep 2025 15:29:21 +0000
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






On Monday, September 8th, 2025 at 16:15, Rob Herring (Arm) <robh@kernel.org=
> wrote:

>=20
>=20
>=20
> On Mon, 08 Sep 2025 01:18:03 +0200, Aleksandrs Vinarskis wrote:
>=20
> > Introduce common generic led consumer binding, where consumer defines
> > led(s) by phandle, as opposed to trigger-source binding where the
> > trigger source is defined in led itself.
> >=20
> > Add already used in some schemas 'leds' parameter which expects
> > phandle-array. Additionally, introduce 'led-names' which could be used
> > by consumers to map LED devices to their respective functions.
> >=20
> > Signed-off-by: Aleksandrs Vinarskis alex@vinarskis.com
> > ---
> > .../devicetree/bindings/leds/leds-consumer.yaml | 89 ++++++++++++++++++=
++++
> > 1 file changed, 89 insertions(+)
>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/l=
eds/leds-consumer.example.dtb: camera@36 (ovti,ov02c10): Unevaluated proper=
ties are not allowed ('led-names', 'leds' were unexpected)
> from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02e10.yam=
l#

Rob: this is because the 1st patch that adds `led-consumer.yaml` uses
ov02e10 in its example, while the property is added to
`video-interface-devices.yaml` (which is used by ov02e10 and other
cameras) only in the 2nd patch. As I see it, reversing the order of 1st
and 2nd patch would likewise cause 'error' when 1st patch is checked
without the 2nd one. I don't think that 1st and 2nd patches should be
combined, but if you prefer to do that so the warning goes away - please
let me know.

When running checks on the entire series/last commit, no binding errors
are present.

Alex

>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
08-leds-v3-1-5944dc400668@vinarskis.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in this patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
