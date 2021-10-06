Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9098424194
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 17:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE18B6ED34;
	Wed,  6 Oct 2021 15:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B28C6E4A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633527146; x=1665063146;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=wZiREG20BjEiTJRnwZWlOCnyxxSCgmhJ1maroNiROi4=;
 b=Je9YHgDGsAzacsCgOfIZTItfakqk3wqEq3HAtTZw1mIDLiejVtcGODRu
 lEwNKpAmIveaaCDwNv5U1F2Fp87Tw40dKrwOuKxpbgNVLrOh7N7S8P++/
 B72OaQm6j+HM8/ZZM2OVkuDOmy/ptYYeukmzMLwaRIN45q6TJZ9Tzzf4P
 JmHLiVTvdSEkSQ3puyzT/CvqHzjAR0rTyVpir9kAdxXDPZSA9T4wZiyxB
 eM9dUo9uk4tsItLFI80bLFQxczoflS7WI4pQdtZuOvGvWwcNFkXBn7s26
 rF9yoUwrC4YdvODhW88It861/a3qBci37DQVQe6JMvi7XmQFecFzNRUeC g==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19898161"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Oct 2021 15:32:23 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Oct 2021 15:32:23 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Oct 2021 15:32:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633527143; x=1665063143;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=wZiREG20BjEiTJRnwZWlOCnyxxSCgmhJ1maroNiROi4=;
 b=BoLoD/PCUrZwzV2UZg7TaFprGYd6xFzdHGveky64hsV6gGGE34WE/M7w
 FWL3H9sdoO1GDxliHZvxsd4MLN9qivQZdthI4drmazhGgUiQJVgmOByh9
 StlWFIRZA+mAmf+/i7V8arnr1yirJcKaKZO6EtIxYawpztaMQjNfpdC3n
 kXLkCw5RBhGQQR2280erBtU2vRwz65m+geectHGXdmGkxN0Cb6IX3/CQY
 MpkXGxePqaWFzsnR0nTXTmqQ6asnQEVefJoYfY3Sl2h1iBwcTP1BEH2U5
 A07rURUG1fXONH0KEkOuah+6Hdj3U+53csv7Vv2QLwdVXHfpdvLrAQQEF Q==;
X-IronPort-AV: E=Sophos;i="5.85,350,1624312800"; d="scan'208";a="19898160"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Oct 2021 15:32:23 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id AC94E280065;
 Wed,  6 Oct 2021 15:32:23 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Wed, 6 Oct 2021 15:32:23
 +0200
Subject: AW: (EXT) Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 vcc supply bindings
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: "Rob Herring" <robh@kernel.org>
Cc: "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 Andrzej
 Hajda <a.hajda@samsung.com>, "Neil Armstrong" <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, "dri-devel"
 <dri-devel@lists.freedesktop.org>, =?us-ascii?Q?devicetree=40vger=2Eke?=
 =?us-ascii?Q?rnel=2Eorg?= <devicetree@vger.kernel.org>
Date: Wed, 6 Oct 2021 13:32:23 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.GYPgnunSRpO/+9Q/n9b1tA.gI0jmLa61wE@vtuxmail01.tq-net.de>
X-Mailman-Approved-At: Wed, 06 Oct 2021 15:43:56 +0000
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

On Wed, Oct 6, 2021 at 3:21 PM Rob Herring
<robh+dt@kernel.org> wrote:

> On Wed, Oct 6, 2021 at 2:47 AM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Add a VCC regulator which needs to be enabled before the EN pin is
> > released.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >=C2=A0 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++++
> >=C2=A0 1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > index 07b20383cbca..149cff3233c2 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > @@ -32,6 +32,9 @@ properties:
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: GPIO specifier for bridge_en pin (active high).
> >
> > +=C2=A0 vcc-supply:
> > +=C2=A0=C2=A0=C2=A0 description: A 1.8V power supply (see regulator/regulator.yaml).
> > +
> >=C2=A0=C2=A0=C2=A0 ports:
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/graph.yaml#/properties/ports
> >
> > @@ -94,6 +97,7 @@ required:
> >=C2=A0=C2=A0=C2=A0 - compatible
> >=C2=A0=C2=A0=C2=A0 - reg
> >=C2=A0=C2=A0=C2=A0 - enable-gpios
> > +=C2=A0 - vcc-supply
>
> You generally can't make added properties required unless all DT files
> already had this property. It breaks compatibility.

I agree, but AFAICS none of the in-kernel DT files uses this binding. I used
'grep -re "ti,sn65dsi8[34]" arch/*/boot/dts' to check. Only
ti,sn65dsi86 is used on some qcom boards, but this is a completly different
binding and driver.

Best regards,
Alexander

