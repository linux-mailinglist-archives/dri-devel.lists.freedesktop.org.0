Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B33A82105
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 11:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B4D10E33D;
	Wed,  9 Apr 2025 09:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="opqHZhyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 64904 seconds by postgrey-1.36 at gabe;
 Wed, 09 Apr 2025 09:28:50 UTC
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11E10E33D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 09:28:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8E07432BC;
 Wed,  9 Apr 2025 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744190929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7l8DdiwAsT9iakA4gFPB1pBO6OTN/7Blo3PFVtSEWc=;
 b=opqHZhyM1IneIaZeMbXDIzm+KCDAUoF2l/oHki5jyFHJYMeo13n5cPGexNc7QKJihDwxAN
 +m6MJkjCT/KuNEhDGN1ZUZVm+MJ8veq5ACAT7VPlZHWBdYbAwVeGSR9h/uebXqZXI5qFql
 DlQxLtwFLOoiOA5mAxFko00jBknccCrBd9EW9IVbsoZQUk3KngguS4zIPlfFX+y8lAEY3/
 d+UggslpBftKF9/y9Q9P4HRfJnsxAM33NLGZhOR8GZo77fw/6xsFuGVDQGOL6LjJG2ZksK
 /LKq4lMh6j2uco/mjpy7KWxQA5Ws3ryXaO4JqZ96wjelLwLztD8Ss7mmAv5lFQ==
Date: Wed, 9 Apr 2025 11:28:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: ili9881c: Add
 dsi-lanes property
Message-ID: <20250409112846.2fb20426@kmaincent-XPS-13-7390>
In-Reply-To: <20250408-statuesque-poised-firefly-ed8db1@houat>
References: <20250408-feature_sfto340xc-v1-0-f303d1b9a996@bootlin.com>
 <20250408-feature_sfto340xc-v1-1-f303d1b9a996@bootlin.com>
 <20250408-statuesque-poised-firefly-ed8db1@houat>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhst
 heslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
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

On Tue, 8 Apr 2025 17:44:32 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> hi,
>=20
> On Tue, Apr 08, 2025 at 05:27:00PM +0200, Kory Maincent wrote:
> > Add the dsi-lanes property to specify the number of DSI lanes used by t=
he
> > panel. This allows configuring the panel for either two, three or four
> > lanes.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml |=
 5
> > +++++ 1 file changed, 5 insertions(+)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > index
> > baf5dfe5f5ebdd92f460a78d0e56e1b45e7dd323..e36550616f6aac86c79832a48132c=
e8c11ebcf7a
> > 100644 ---
> > a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml =
+++
> > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml =
@@
> > -27,6 +27,11 @@ properties: reg: maxItems: 1=20
> > +  dsi-lanes:
> > +    description: Number of DSI lanes to be used must be <2>, <3> or <4>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [2, 3, 4]
> > + =20
>=20
> We have the data-lanes property for that already

Indeed but there is no such usage in panel bindings, only in bridge binding=
s.

You are saying that I should add something like that:
  port:                                                                    =
   =20
    $ref: /schemas/graph.yaml#/properties/port

    properties:                                                            =
=20
      endpoint:                                                            =
=20
        $ref: /schemas/media/video-interfaces.yaml#                        =
=20
        unevaluatedProperties: false                                       =
=20

        data-lanes:
          minItems: 2
          maxItems: 4                                              =20

And use drm_of_get_data_lanes_count in the drivers.

If we do so, maybe this binding should land in panel-common.yaml instead?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
