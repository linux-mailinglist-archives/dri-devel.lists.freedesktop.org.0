Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905064E9B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 11:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C6510E5B0;
	Fri, 16 Dec 2022 10:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8110E5B0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1671187590; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csXYHnw/KgLTki+mcBGYXSrGC78KzWSKoY0JKsxj6gc=;
 b=KSdYCNv6j6I7YSsfN07giHrg/o64EqcwqsHYSX5BNtRbZfZLbtg5EY+ztrNOlGovwoyyuO
 kVZ2amMCSBnE4/TRjIYQgsEgiSHmJBNqNIpQBKVU9fJvFgFvfBfnEOtdvE89hiPxSeR0Vj
 jlRz4XfqGW+UNQCwRStXdzJ5zIpCKCk=
Message-ID: <c78e92ae3cbea037abdd31ecd64e997c8dd1def2.camel@crapouillou.net>
Subject: Re: [PATCH 01/10] dt-bindings: display: bridge: it66121: Add
 compatible string for IT6610
From: Paul Cercueil <paul@crapouillou.net>
To: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Dec 2022 11:46:28 +0100
In-Reply-To: <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-2-paul@crapouillou.net>
 <CAG3jFytgK0noWteGvXTdSm9as9Q=qfhf_ep3Z8Wv2ofmLzGb=A@mail.gmail.com>
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

Le jeudi 15 d=C3=A9cembre 2022 =C3=A0 11:55 +0100, Robert Foss a =C3=A9crit=
=C2=A0:
> On Wed, 14 Dec 2022 at 13:58, Paul Cercueil <paul@crapouillou.net>
> wrote:
> >=20
> > Add a new ite,it6610 compatible string to the IT66121 binding
> > documentation, since the two chips are very similar.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0.../devicetree/bindings/display/bridge/ite,it66121.yaml=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4
> > +++-
> > =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> > b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> > index 1b2185be92cd..72957be0ba3c 100644
> > ---
> > a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> > +++
> > b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> > @@ -17,7 +17,9 @@ description: |
> >=20
> > =C2=A0properties:
> > =C2=A0=C2=A0 compatible:
> > -=C2=A0=C2=A0=C2=A0 const: ite,it66121
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it66121
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ite,it6610
> >=20
> > =C2=A0=C2=A0 reg:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> > --
> > 2.35.1
> >=20
>=20
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Series applied to drm-misc-next.

Thanks for the reviews!

Cheers,
-Paul
