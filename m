Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7537C8E8FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 14:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C03110E17B;
	Thu, 27 Nov 2025 13:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="NevznnII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327B10E17B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 13:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764251255; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AMwSHeQ/vxT8K1YbNvYUSgylTjKlArp4r4fiaGvm/cKDv4dbjwctTi2yaqWmZM6jhAjFqYDOF0Dj1UEV2d5SEFmnkkfDhk4tvycGdn5RMxD4BD5tr25eiAZELRy92Lsw6Qbmi7tNl3213hU7tO8NxwGrwVzuI7uYL3vi4bvc6sQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764251255;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=b0oMnunnjuobG7eO1qvntmjm1GhyPkGJUrptzNeT38o=; 
 b=Mo9WfSq+g0Y1vhrbyK04/qyxAhbaUDVNbty788sHNudiHszZWuGQdWhPs3X1MHlnAEAwH2+effveKIICSGYbIE98uFhaGibmAoekoIbCqNJBOTsEt1lymitxYAuY718/gw1B56aXVl6akGW0TRx6CgVYKlLHeZ8wzqHOh1Yfgto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764251255; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=b0oMnunnjuobG7eO1qvntmjm1GhyPkGJUrptzNeT38o=;
 b=NevznnIIn59XEHlVsufetcVaa7qfNmwKdJLGscdLrhvL/rJhsbh+zKjlDzPYGDnn
 V0SwbK4ECYIb3eC849j5CX32dSlOqdPZlD3QjYehC6NvCo9DwnZN0tjza431fXhTKRq
 9fV9FZxWzvrE46QSslYmerkr2/E8fKzMhSVzU+8lqc7oaHhJ9EzUsfnHev4cqWMqI2h
 Dx+dHQt6a2cyuwJQUUXvb9+oj2RRxEsRrhj1uZk4zq350udzqwAVo/NKsSKtJsaPotz
 6KpnXzeV+NmAE5jMUSlGWV/O3sWqKlp+b9Y9wK9OQ0T4ZMzxZfw5uB6oI852mF8ITdC
 l6LveB5DmQ==
Received: by mx.zohomail.com with SMTPS id 1764251253052907.8324349863465;
 Thu, 27 Nov 2025 05:47:33 -0800 (PST)
Message-ID: <b7b9396950cb92c227acef5461941020a282e551.camel@icenowy.me>
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
Date: Thu, 27 Nov 2025 21:47:23 +0800
In-Reply-To: <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <544ae21cc1b5f488d03a5650d9275ff22b237d63.camel@icenowy.me>
 <0b7ba974-d8d5-4417-8182-3e9299315058@kernel.org>
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

=E5=9C=A8 2025-11-26=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:22 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 26/11/2025 10:50, Icenowy Zheng wrote:
> > > > +maintainers:
> > > > +=C2=A0 - Icenowy Zheng <uwu@icenowy.me>
> > > > +
> > > > +properties:
> > > > +=C2=A0 $nodename:
> > > > +=C2=A0=C2=A0=C2=A0 pattern: "^display@[0-9a-f]+$"
> > > > +
> > > > +=C2=A0 compatible:
> > > > +=C2=A0=C2=A0=C2=A0 items:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - thead,th1=
520-dc8200
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: verisilicon,dc
> > >=20
> > > I do not see any explanation of exception for generic
> > > compatibles,
> > > maybe
> > > except "self-identification" remark. Rob already pointed this
> > > out, so
> > > be
> > > explicit in commit msg why you are using a generic compatible.
> >=20
> > Well I only get the meaning of "a SoC specific compatible is
> > required"
> > in his review message.
> >=20
> > I think my binding now requires both a SoC-specific compatible and
> > a
> > generic compatible, which should be okay to satisfy Rob's original
> > review.
>=20
> You will get then the same questions for me - what justifies generic
> compatible. You should be on this explicit, because otherwise people
> misinterpret some commits and patches, and they think the generic
> compatible is allowed for them as well.

I came across a comment on Mali Valhall bindings that says `Mali
Valhall GPU model/revision is fully discoverable`, just after the
compatible string.

Should I add a comment like this, or should I make things more clear in
the commit message?

>=20
> >=20
> > >=20
> > > > +
> > > > +=C2=A0 reg:
> > > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > > +
> > > > +=C2=A0 interrupts:
> > > > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > > +
> > > > +=C2=A0 clocks:
> > > > +=C2=A0=C2=A0=C2=A0 minItems: 4
> > >=20
> > > This is not flexible. Device either has or has not these clocks.
> >=20
> > The existence of all these clocks are verified by diagrams in
> > manuals
>=20
> So not flexible, then:
>=20
> > of two different SoCs with DC8200 (T-Head TH1520 and StarFive
> > JH7110).
> >=20
> > Maybe a explicit `maxItems: 5` is needed here, but as my DT passes
> > dtbs_check, I don't think it's necessary?
>=20
> No, drop minItems only.
>=20
> >=20
> > Or maybe I should drop the flexibility now and use a `minItems: 5`
> > here
> > (and leave DC8000 support as another story)? (The Eswin EIC7700
> > manual
> > does not have a diagram showing external connections of the DC,
> > like
> > the two SoCs I mentioned above).
>=20
> You document here only the devices explicitly mentioned in the
> binding.
> You cannot add here constraints or clocks for some device which is
> not
> in the binding and I see only th1520 in the binding.
>=20
> Best regards,
> Krzysztof

