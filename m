Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B53C8918D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4706B10E58E;
	Wed, 26 Nov 2025 09:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="O8XkSE8k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1010E58E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764150649; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vq6V27VOi3pqmFR3nYPN+F28Ob3QjjvrTFNqOJPrCwsPzfq6fgzT8IDbNriOTaksKk5q8g3vRcoMwYKrSDhD5IdRJfOaLWo7d2bvnn6QG01dj1LQtZ7Mlg8lI3rOnRDmolONekN6sdQZUbgLEhaQfAzwFuKNjqetk4cf7hEZC2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764150649;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=cGcQhwRu7CBTzlhQkSvbP/GEOTbwssNmYI3Qff2lHHE=; 
 b=AFfo/Lj7B+cG+kEr8acGty6ck9Rk2PekB57kbt81WaFZRX5IL5bTbD1bN6zMew/wlYY8hkIuTwiGAp65xiG+QWIg8D/ijtMmmnq7+UwaUN7wj8KyhL8+Wj74i/yBbELAgMxXTg3BK0YHSun46R29mKdjISkaicHfK4INBM2vNQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764150648; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=cGcQhwRu7CBTzlhQkSvbP/GEOTbwssNmYI3Qff2lHHE=;
 b=O8XkSE8kw1i4BbMEGqGCFcj2RawPC0MhLnVYFr+RHNIex9ME+g1f2Ufv0PK7FOJ8
 GXP+/Szy2gGEZkVFMPXRBqdmSI3OjCNXlB3EHAT3OMEVjge+mESSuU0B81YQvCXP1j/
 uleB4fwMAyuTW8iSC/tp6zRvZrrnRllfiB6dDP6uhBz8ILTnvvbOnA04EyZgZYeOsUK
 ViTOehL4ta5XDrYbQWl7JfdPvUZzweKrjgA+i1WqlyDhLGq4B/pXTGmpHwWknS8q8Y4
 JQkieFmpdPVlbjbNPUD8K/QZ9TZh5oLpNnw+FQMMuPL4MCWtiwHVotPppGWgYlei9Sp
 mDFrVkM5IA==
Received: by mx.zohomail.com with SMTPS id 1764150647026294.37960967272056;
 Wed, 26 Nov 2025 01:50:47 -0800 (PST)
Message-ID: <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 26 Nov 2025 17:50:36 +0800
In-Reply-To: <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-11-24=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 12:01 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 24/11/2025 11:52, Icenowy Zheng wrote:
> > Verisilicon has a series of display controllers prefixed with DC
> > and
> > with self-identification facility like their GC series GPUs.
> >=20
> > Add a device tree binding for it.
> >=20
> > Depends on the specific DC model, it can have either one or two
> > display
> > outputs, and each display output could be set to DPI signal or "DP"
> > signal (which seems to be some plain parallel bus to HDMI
> > controllers).
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>=20
> Wrong DCO chain order. You send it as icenowy.me, so this must be
> last
> SoB. This identity is the last one certifying DCO. Please kindly read
> submitting patches, so you know what you are certifying here.
>=20
> > ---
> > Changes in v3:
> > - Added SoC-specific compatible string, and arm the binding with
> > clock /
> > =C2=A0 port checking for the specific SoC (with a 2-output DC).
> >=20
> > Changes in v2:
> > - Fixed misspelt "versilicon" in title.
> > - Moved minItems in clock properties to be earlier than items.
> > - Re-aligned multi-line clocks and resets in example.
> >=20
> > =C2=A0.../bindings/display/verisilicon,dc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 146
> > ++++++++++++++++++
> > =C2=A01 file changed, 146 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > new file mode 100644
> > index 0000000000000..522a544498bea
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
> > @@ -0,0 +1,146 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/verisilicon,dc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Verisilicon DC-series display controllers
> > +
> > +maintainers:
> > +=C2=A0 - Icenowy Zheng <uwu@icenowy.me>
> > +
> > +properties:
> > +=C2=A0 $nodename:
> > +=C2=A0=C2=A0=C2=A0 pattern: "^display@[0-9a-f]+$"
> > +
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - thead,th1520-=
dc8200
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: verisilicon,dc
>=20
> I do not see any explanation of exception for generic compatibles,
> maybe
> except "self-identification" remark. Rob already pointed this out, so
> be
> explicit in commit msg why you are using a generic compatible.

Well I only get the meaning of "a SoC specific compatible is required"
in his review message.

I think my binding now requires both a SoC-specific compatible and a
generic compatible, which should be okay to satisfy Rob's original
review.

>=20
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 minItems: 4
>=20
> This is not flexible. Device either has or has not these clocks.

The existence of all these clocks are verified by diagrams in manuals
of two different SoCs with DC8200 (T-Head TH1520 and StarFive JH7110).

Maybe a explicit `maxItems: 5` is needed here, but as my DT passes
dtbs_check, I don't think it's necessary?

Or maybe I should drop the flexibility now and use a `minItems: 5` here
(and leave DC8000 support as another story)? (The Eswin EIC7700 manual
does not have a diagram showing external connections of the DC, like
the two SoCs I mentioned above).

>=20
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DC Core clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: DMA AXI bus clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Configuration AHB bus cl=
ock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output 0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Pixel clock of output 1
> > +
>=20
>=20
>=20
> Best regards,
> Krzysztof

