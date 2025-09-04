Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E7B435AC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F31310E997;
	Thu,  4 Sep 2025 08:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZHQtgma0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D00510E99A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 08:26:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 522E560278;
 Thu,  4 Sep 2025 08:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BEDC4CEF0;
 Thu,  4 Sep 2025 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756974393;
 bh=7Q+nT/bnhhDANIjFfQauFWMujYDGmFiqlcOY3hhxGc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZHQtgma0KMC/sQAXrWK3UnD7mPIQbRzm5JjQZ1SUJa8wM+4MsBPYTwpxP6vi8G1jq
 ljPkPU0tcpV43L1bTSdqHDx9/gOANqTjI0YEWT65PYj+Ixh42IJwtYJSE1LgFqiE9D
 rthMClIIkP2afuwcsWquze6zKujWhxlASSf7Hn7JybqV6ehLJdnP4EZuRFkmXPN1xj
 jfQuGpxMcpbWydlgYoY8VvoiPAfIYVVuoevt+XcqDsMaFfBll3WIdFSeaBoPNAV8fC
 l5v5viJpYoVVG8Hg7zBS9NvqIlW2CgVzAAe5TxayMa/wLLi7O9eS2QxFOTt/luapQY
 Rz0Vx8mOJ7mwg==
Date: Thu, 4 Sep 2025 10:26:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Cc: syyang <syyang@lontium.com>, robh@kernel.org, 
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, 
 jonas@kwiboo.se, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org
Subject: Re: [PATCH v2 1/2] This patch adds a new device tree binding
 documentation.
Message-ID: <20250904-aromatic-loon-of-honeydew-f7861e@kuoka>
References: <175691717884.2393851.6340903042726389490.robh@kernel.org>
 <20250904022524.1748587-1-syyang@lontium.com>
 <042523f7-2b75-4a04-8e0b-d1019ab84987@kernel.org>
 <CAFQXuNZpLBP3=MGmRRpwJu43ZtkNhrTzh8kOwFgKy20rqFiG7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAFQXuNZpLBP3=MGmRRpwJu43ZtkNhrTzh8kOwFgKy20rqFiG7Q@mail.gmail.com>
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

On Thu, Sep 04, 2025 at 04:08:30PM +0800, =E6=9D=A8=E5=AD=99=E8=BF=90 wrote:
> > > +
> > > +description: |
> >
> > Do not need '|' unless you need to preserve formatting.
> >
> Both lontium,lt9211.yaml and lontium,lt9611.yaml use "|", so please
> confirm if they need to be removed.

Add code which is needed, not code which you found somewhere. Why '|' is
needed here?

>=20
> > > +  The LT9611C are bridge devices which convert DSI to HDMI
> >
> > Why this cannot be added to lt9611 binding? Commit msg should clearly
> > answer that.
> >
> The lt9611 and lt9611c are chips of different specifications, and
> their related parameters are different.
> The VDD-supply of lt9611c is 1.2V; the vdd-supply of lt9611uxc is also
> 1.2V, while the vdd-supply of lt9611 is 1.8V.
> Now lt9611 and lt9611uxc are connected together. I'm not sure if this
> is a problem.
> If this lt9611c can also be bound to lt9611, and if you think it's
> okay, then I have no problem.

It is not a problem.

>=20
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - lontium,lt9611c
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#sound-dai-cells":
> >
> > Missing dai-common ref.
> >
> I don't understand .   I referred to:
> Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
>=20


You call this device a DAI, so your binding should reference dai-common
schema, like every other one. You can check simple codecs for examples.


> > > +    const: 0
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  reset-gpios:
> > > +    maxItems: 1
> > > +    description: GPIO connected to active high RESET pin.
> > > +
> > > +  vdd-supply:
> > > +    description: Regulator for 1.2V MIPI phy power.
> > > +
> > > +  vcc-supply:
> > > +    description: Regulator for 3.3V IO power.
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          Primary MIPI port-1 for MIPI input
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          Additional MIPI port-2 for MIPI input, used in combination
> > > +          with primary MIPI port-1 to drive higher resolution displa=
ys
> > > +
> > > +      port@2:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description:
> > > +          HDMI port for HDMI output
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@2
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - vdd-supply
> > > +  - vcc-supply
> > > +  - ports
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    i2c10 {
> > > +      #address-cells =3D <1>;
> > > +      #size-cells =3D <0>;
> > > +
> > > +      hdmi-bridge@41 {
> > > +        compatible =3D "lontium,lt9611c";
> > > +        reg =3D <0x41>;
> > > +        #sound-dai-cells =3D <0>;
> > > +        interrupts-extended =3D <&pio 128 GPIO_ACTIVE_HIGH>;
> > > +        reset-gpios =3D <&pio 127 GPIO_ACTIVE_HIGH>;
> > > +        vdd-supply =3D <&lt9611_1v2>;
> > > +        vcc-supply =3D <&lt9611_3v3>;
> > > +        status =3D "okay";
> >
> > Nope, drop.
> >
> remove  status =3D "okay"  ?

Yes. Instead of asking me, you can try to think about possibilities.
Ask yourself yourself - why do you need it here? What changes if you
have it? What changes if you drop it? Why reviewer asks for it - maybe
there is something behind. That way you will learn more about this.

I suggest to go through the slides of my OSSE25 talk about DT for
beginners.

Best regards,
Krzysztof

