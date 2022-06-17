Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120354F688
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 13:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CAA411AD27;
	Fri, 17 Jun 2022 11:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C794811AD27
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 11:16:01 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id n11so4213269iod.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t/crlnZbBJQszYNcH9+aCU70dM7HBkp9N2s5QyPNLUk=;
 b=KjYSoJjQbHSzBiIh2OvctpgUON2u4IbMNHkuAcnrPX5S/8O+2ZqVL+M1OTWti1TgGE
 U3a+c0waowlN8KRIlHNwYNlX5PWBWecrqUFBF2t3EinouRe/3mJ3rUJmCVzpd4yKgyB7
 XAQjJrF5yzz/4IN635jYJA6DDgneEYjQIzB19Mv89dJJg1k3jF0EPSbZbfZy8eD5BmJv
 umqzL5gXktsRNmAiumwyLQQIsRbOm0kcPe2HywZwOMl/bFqj4uo9yMOhxmtIYtFNnKfx
 7kpkppI8wiEpDGOFh8+AmBeXhAgGr/cVeZamCja94WfRWTAgXgfTFpQckCHWWnOziQwd
 aSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/crlnZbBJQszYNcH9+aCU70dM7HBkp9N2s5QyPNLUk=;
 b=iJ6qFQdaLDDEbDPBvezAnh0+vRICstXY5Hkg+jhCYN8zJFQTYhfFJq4jZWyiNrMVPI
 tq1075VgE+S0gBI4NuvCMay5bDKl3XCDIkZN6NqXahY8VcoAQf30nDuJPNIaNJ0jI658
 AhMMfJV/ucULh79AMjFZdHGcOkBcHkgy7yXN91x9Q/BA5S4mJh0KsZBNOVBKU1l8fCo6
 8HIsmnxvkgwEykk4f1avXKP4qdBSZGfUtIRZ8yYzO/filB0Tv8XXIT2/iSvBHIYzGI3r
 x2i2hqAxOolT+tfTTElrxApxJ8ADvXqUkwSNm8lwylJlArpFqCUXut4ZjT1ww/kZFSzD
 5gQA==
X-Gm-Message-State: AJIora85795ajW57Uu3PHx5hKBa/wiw4/rjuOS/bkOijccjsrEPRcAQh
 fJQK9cuwjiaUzC6Pf043ZC4NG1lgmKs1MtfiiF1rHQuR8OI=
X-Google-Smtp-Source: AGRyM1tFKZjYJUHdgUMGn9EB6+U2f/oxJq7gDzAwy6h/11fXVSFDBb4uXbC7kjFkRKwg/y/yQilyfk1BrMK1DcJRUUI=
X-Received: by 2002:a5d:9d8d:0:b0:669:cd5e:f953 with SMTP id
 ay13-20020a5d9d8d000000b00669cd5ef953mr4655343iob.153.1655464561141; Fri, 17
 Jun 2022 04:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
 <1655127197.567546.3564136.nullmailer@robh.at.kernel.org>
In-Reply-To: <1655127197.567546.3564136.nullmailer@robh.at.kernel.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 19:15:49 +0800
Message-ID: <CABtFH5JPu5tOg4wGJf5ay1-NJHLcPTK4XxADGTksHW1-6wjMRQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, szunichen@gmail.com,
 pavel@ucw.cz, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jic23@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8813=E6=97=A5 =
=E9=80=B1=E4=B8=80 =E6=99=9A=E4=B8=8A9:33=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 13 Jun 2022 19:11:37 +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
> >  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
> >  2 files changed, 297 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt63=
70.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to f=
ind schema file matching $id: http://devicetree.org/schemas/leds/backlight/=
mediatek,mt6370-backlight.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: pmic@34: backlight: False schema does not allo=
w {'compatible': ['mediatek,mt6370-backlight'], 'mediatek,bled-channel-use'=
: b'\x0f'}
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/mfd/mediatek,mt6370.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: pmic@34: charger: False schema does not allow =
{'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]]=
, 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1,=
 5]], 'usb-otg-vbus-regulator': {'regulator-name': ['mt6370-usb-otg-vbus'],=
 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[58000=
00]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[300=
0000]], 'phandle': [[2]]}}
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/mfd/mediatek,mt6370.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: pmic@34: tcpc: False schema does not allow {'c=
ompatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, =
4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C']=
, 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try=
-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527=
944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]]=
, '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpo=
int': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpo=
int': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpo=
int': [[4294967295]]}}}}}
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/mfd/mediatek,mt6370.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: pmic@34: indicator: False schema does not allo=
w {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#=
size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator']=
, 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '=
#size-cells': [[0]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'re=
g': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@=
3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-micr=
oamp': [[6000]]}}
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/mfd/mediatek,mt6370.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: pmic@34: flashlight: False schema does not all=
ow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], =
'#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'functi=
on': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-micr=
oamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us'=
: [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': [=
'flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp':=
 [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[12=
48000]]}}
>         From schema: /builds/robherring/linux-dt-review/Documentation/dev=
icetree/bindings/mfd/mediatek,mt6370.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/=
mediatek,mt6370.example.dtb: backlight: mediatek,bled-channel-use: b'\x0f' =
is not of type 'object', 'array', 'boolean', 'null'
>         From schema: /usr/local/lib/python3.10/dist-packages/dtschema/sch=
emas/dt-core.yaml
> Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /e=
xample-0/i2c/pmic@34/backlight: failed to match any schema with compatible:=
 ['mediatek,mt6370-backlight']
> Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /e=
xample-0/i2c/pmic@34/charger: failed to match any schema with compatible: [=
'mediatek,mt6370-charger']
> Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /e=
xample-0/i2c/pmic@34/indicator: failed to match any schema with compatible:=
 ['mediatek,mt6370-indicator']
> Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /e=
xample-0/i2c/pmic@34/flashlight: failed to match any schema with compatible=
: ['mediatek,mt6370-flashlight']
> Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /e=
xample-0/i2c/pmic@34/tcpc: failed to match any schema with compatible: ['me=
diatek,mt6370-tcpc']
>

Before we submitted these patches, we had already checked by running
this command below,
"make DT_CHECKER_FLAGS=3D-m dt_binding_check
DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/mfd/mediatek,mt6370.yam=
l".
But we could not find any errors like your error msg after the checking pro=
cess.

Our mfd dt-binding patch is dependent on "backlight dt-binding",
"charger dt-binding", "tcpc dt-binding", "indicator dt-binding" and
"flashlight dt-binding" patches.
Would you please apply them before you check mfd dt-binding patch?
Thank you so much!

> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Best regards,
ChiaEn Wu
