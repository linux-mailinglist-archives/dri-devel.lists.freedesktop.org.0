Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF60A9EDAE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 12:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C8B10E3EA;
	Mon, 28 Apr 2025 10:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CljZnVi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DC910E3EA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:16:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A60E84396C;
 Mon, 28 Apr 2025 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745835388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aOZv2zdVkXsCWd9bP5Yd4I7as6l3L4TZW0Lw2hS1HA=;
 b=CljZnVi0ickz6gf0L4dBJL4EIrU93xzsDrr038fZY0AerxHfFIOjiuasmYdle0ECIiYBBR
 TnIvx4grk6Fo9M8Dp9RvGAQw4AuUT5SevFKn68mhSsQcnd98tdcwLZNKR1MgLyN/D02sfr
 gFqhAouAdhvIphwL6Kbo/z1i6yKtNReqX69ACzWRM17XU5wPs2razeqtWH2kvyyK6A0yGr
 TwmayLBWtmsx6/1AjXwG4adt+vFzIQuDkSZezFurNt9x74pU3uZx986Tz4GEW1vDmInF//
 jvx6EzGUgVPd06a8qoCHTqR7O7mdSLbN6KpqAd8xoKubao1JAV2w9GlFqcyh5g==
Date: Mon, 28 Apr 2025 12:16:25 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: display: panel: Fix port binding
Message-ID: <20250428121625.72c0bfa8@kmaincent-XPS-13-7390>
In-Reply-To: <20250428-refined-nyala-of-engineering-0556fb@kuoka>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-1-ff7da6192df2@bootlin.com>
 <20250428-refined-nyala-of-engineering-0556fb@kuoka>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehli
 hhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
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

On Mon, 28 Apr 2025 09:32:21 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Apr 24, 2025 at 05:07:39PM GMT, Kory Maincent wrote:
> > Faced a binding error check while adding the data-lanes property in the
> > ilitek,ili9881c binding. See the next patch for the binding changes.
> > Here is the error:
> > Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.example=
.dtb:
> > panel@0: port:endpoint: Unevaluated properties are not allowed
> > ('data-lanes' was unexpected) =20
>=20
> There is no error at this point so your rationale is not correct. You
> cannot use possible error as reason to fix something... You can use
> instead other arguments that the binding is incomplete or incorrect.

As I have said in the cover letter, I faced this error and this patch fixed=
 it
but I didn't get the ins and outs.
Indeed, I didn't understand the conflict between the port definition in
panel-common and the panel binding change from the 2nd patch.

> > Change the reference of properties/port to $defs/port-base to makes it
> > work.
> > The only difference between port and port-base is the unevaluatedProper=
ty
> > set to false. I have tried to use properties/port in both panel-common
> > and ilitek,ili9881c bindings but the error is still there. The only way
> > to not face the error is to use $defs/port-base reference. I don't
> > really understand the ins and outs, maybe it is a issue from the binding
> > check tool.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Changes in v2:
> > - New patch
> > ---
> >  Documentation/devicetree/bindings/display/panel/panel-common.yaml | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-common.yaml ind=
ex
> > 087415753d606ce67bceabaa9b0ba7d463282f92..635f67ced0cb7103684a1415ab740=
d83409a7dbb
> > 100644 ---
> > a/Documentation/devicetree/bindings/display/panel/panel-common.yaml +++
> > b/Documentation/devicetree/bindings/display/panel/panel-common.yaml @@
> > -76,7 +76,7 @@ properties: # Connectivity port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base =20
>=20
> This allows anything in the port in every other binding, so is not
> correct. You need to fully describe the port here with
> additionalProps:false, probably. Just like every other binding with
> port-base is doing.

Yeah that was expected.
As I said I tried with port-base but it throw me this error and I didn't ma=
nage
to remove it with only the panel binding change for now.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
