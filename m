Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED92B27D8D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 11:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941EB10E8FB;
	Fri, 15 Aug 2025 09:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="dGiTHQlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE6A10E8FB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 09:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755251602; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=koHlOkAgBWsUbUj+b24o/ctUd2mqOBqSeG4hv5l5rm+kkMCxaBfgD8KyfJGwIblmsj8SbL5UP6lbO/cyGtSNFmvJYwfXiO5zcDsRP4GTvaJ3HPAkNqdpPadOuNDiioSPAnQrI0l8iPOmqfc3wqiuhgFNu43E0tBase2P0TwBilE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755251602;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4R7tfCuYW4ZartBCW5YVMr9XfWVj465U64fgiTEkXis=; 
 b=ZiJTO94CyuhBtoV18GI/qII0uRZ5oGao6SZwUEzQQbC0mN4oapdpdlNxUQ2tNzD3w4JIu1wQtM0QnyM7CY8Qjv9b5rtXKF07FDb/8LIpZx3WjSfN3jXF4z4hJ0cADjAyM9kiVCKVdYfTFUYnwDNVwsJ7YYYaNUmwwpE0udlCI3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755251602; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=4R7tfCuYW4ZartBCW5YVMr9XfWVj465U64fgiTEkXis=;
 b=dGiTHQlJXwDfK3pjDKBjJBKsOC68jlD1/jjKV8gxOixvhk8FxYn2D1xZeR8o56xq
 DR9yBVRnAQkFWf+oFZ7eh7+qjNnfpXlly8RlnClnL3viSri4Hnd1HEiDhOjcu9K5rMO
 lWFbQwWEFWUAoPhmKzH8MCtMy+p40PtYnv31E6mI56V1oPaxsc37t0hRyDa9eqWSkpp
 IGzja9J56MTPWH2+Rbctn7WEC0ldB2Za/6Z6WPkNWmCiG8yUFhGci9u1y7zD9fQZimY
 2XbTcVLeSLL9NJkpCyc/bqQ+WKJajubKPav4XqNU0JV1+FmxHh6xhzN5UD6XRqDZIr6
 ovEjMhg0Pg==
Received: by mx.zohomail.com with SMTPS id 1755251600358465.4611508627105;
 Fri, 15 Aug 2025 02:53:20 -0700 (PDT)
Message-ID: <4655d43b17c732947246f0e0deac14265fa07ca1.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/8] dt-bindings: display: add versilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew Fustini
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal
 Wilczynski <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao
 Zi <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Fri, 15 Aug 2025 17:53:10 +0800
In-Reply-To: <5af90b60-d65b-4e80-9a27-44938bbd450b@kernel.org>
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <20250814164048.2336043-3-uwu@icenowy.me>
 <20250814220444.GA3988176-robh@kernel.org>
 <5af90b60-d65b-4e80-9a27-44938bbd450b@kernel.org>
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

=E5=9C=A8 2025-08-15=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 11:09 +0200=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 15/08/2025 00:04, Rob Herring wrote:
> > > +
> > > +maintainers:
> > > +=C2=A0 - Icenowy Zheng <uwu@icenowy.me>
> > > +
> > > +properties:
> > > +=C2=A0 $nodename:
> > > +=C2=A0=C2=A0=C2=A0 pattern: "^display@[0-9a-f]+$"
> > > +
> > > +=C2=A0 compatible:
> > > +=C2=A0=C2=A0=C2=A0 const: verisilicon,dc
> >=20
> > If the clocks or resets varies by platform, then you need an SoC=20
> > specific compatible still. If these clocks/resets are straight from
> > the=20
> > RTL and any other number of clocks/resets is wrong, then we can
> > stick=20
> > with just this compatible.
>=20
> Shouldn't we have here always SoC compatible? Can it be ever used
> alone,
> outside of given SoC?
>=20
> I could imagine now:
>=20
> items:
> =C2=A0 - {}
> =C2=A0 - const: verisilicon,dc

I followed the `vivante,gc` situation here, because the registers
before 0x1400 (where real display-related things start) seems to follow
the same scheme with GC-series GPUs, including the identification
registers.

>=20
>=20
> Best regards,
> Krzysztof

