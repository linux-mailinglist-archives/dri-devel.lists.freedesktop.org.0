Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD264EB59
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5BE10E115;
	Fri, 16 Dec 2022 12:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4A10E115
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671193316; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REiZSsUqtIjm8SFyqWxbMTgSG0022DL41CRgq8WVFdw=;
 b=taa4hIlYqn7MLmaXHu1vURaZAmYN/Z4nCFJxJbMyR963j7DDT9rTE/nzL9rpCj3J1Ys/OS
 64s9MPE6g7Gxw1CIIjdZbE2DeiJ3kzfpnAMuaLX5ecqHCrnz9K/u4xM6+PIyaVZLCUa8wx
 2EehLkok5/6lrjXczYp5yJ3PG7/aiT0=
Message-ID: <d1f6d19d3218d9f1acc9b38e44af413f72f8a824.camel@crapouillou.net>
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Robert Foss
 <robert.foss@linaro.org>
Date: Fri, 16 Dec 2022 13:21:54 +0100
In-Reply-To: <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
 <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
 <bb2b5b72-42b3-3a6c-d865-9e338e34aba0@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Le vendredi 16 d=C3=A9cembre 2022 =C3=A0 12:21 +0100, Krzysztof Kozlowski a
=C3=A9crit=C2=A0:
> On 16/12/2022 11:46, Paul Cercueil wrote:
>=20
> > > > =C2=A0properties:
> > > > =C2=A0=C2=A0 compatible:
> > > > -=C2=A0=C2=A0=C2=A0 const: ite,it66121
> > > > +=C2=A0=C2=A0=C2=A0 enum:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it66121
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it6610
>=20
> These should be ordered alphabetically. What's with the tendency of
> adding always to the end?

I'm too used to the "inverse christmas tree" sort :)

I can send a quickfix patch if you really want alphabetical order.

> > > >=20
> > > > =C2=A0=C2=A0 reg:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > > > --
> > > > 2.35.1
> > > >=20
> > >=20
> > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> >=20
> > Series applied to drm-misc-next.
> >=20
> I wished you give DT maintainers a bit more time than two days.

Noted. Sorry about that.

Cheers,
-Paul
