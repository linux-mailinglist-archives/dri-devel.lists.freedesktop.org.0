Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2C653D55
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 10:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A571710E534;
	Thu, 22 Dec 2022 09:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350B10E532
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:12:47 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 022B8CE652
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:04:00 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29F8840010;
 Thu, 22 Dec 2022 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1671699819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXGEgSRQtOF83p3PJb6wzT3SiQ4MMLvkHWipGGIuwXw=;
 b=OcJE8ze0QVLfDQunjRgATPRolml1Xl4LQzEsd5b3i8fl7y3eJ2Da15oo1hS+RRS+xRSnV2
 H7OCEdYPwWxUWk0lPxDDA+TeezJkck/Jh0aX1DNVEikjWghaRtzU2DH8lpW+9upLNHat0v
 RZmbcMS/WZrNYK4NaQZfCgxlzdc1RicTUGZtpFV1xbnYgzTIhnO5Vaf4A0NvzrWWBABcf1
 HUeWGqYTaAq9YyU+JgLSJkPx5fEccJ4a9J1WGODPhocNFv+hjNOhxL+86ICn+quCU28hB7
 jwXrN1+1by76KpLEMBfMVWEGShgRsW5YrYw5HBaAzVLZp0nhPBqo7GLpAod8fw==
Date: Thu, 22 Dec 2022 10:03:34 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Message-ID: <20221222100334.4ac85afa@booty>
In-Reply-To: <38c7cfe0-62e0-066a-d8dd-4ed4243a552e@gmail.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-2-luca.ceresoli@bootlin.com>
 <20221201231936.GB1660613-robh@kernel.org>
 <20221202091108.5f492d6f@booty>
 <38c7cfe0-62e0-066a-d8dd-4ed4243a552e@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dmitry,

On Tue, 20 Dec 2022 23:13:05 +0300
Dmitry Osipenko <digetx@gmail.com> wrote:

> 02.12.2022 11:11, Luca Ceresoli =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

...

> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-=
vip.yaml
> >>> @@ -0,0 +1,63 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.=
yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: NVIDIA Tegra VIP (parallel video capture) controller
> >>> +
> >>> +maintainers:
> >>> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - nvidia,tegra20-vip
> >>> +
> >>> +  "#address-cells":
> >>> +    const: 1
> >>> +
> >>> +  "#size-cells":
> >>> +    const: 0
> >>> +
> >>> +  channel@0:   =20
> >> Kind of odd there is only 1 channel with a unit-address. Are more=20
> >> channels coming? Please make the binding as complete as possible even =
if=20
> >> no driver support yet. =20
> > This was discussed in v1 with Krzysztof and the outcome was that it's
> > OK because it's likely that other SoCs have more, but the documentation
> > is not public so I cannot add examples.
> >=20
> > Full discussion (pretty short indeed):
> >=20
> > https://lore.kernel.org/linux-devicetree/5292cc1b-c951-c5c5-b2ef-c154ba=
f6d7fd@linaro.org/
> >=20
> > Do you agree that the unit-address should be kept? =20
>=20
> It's doubtful that there is a SoC having a VIP with multiple channels.
> I'd expect it to be multiple VIPs rather than channels. There are NVIDIA
> people to confirm that.
>=20
> The "channel" itself looks redundant to me, i.e. the reg and ports
> should be moved to the vip node.

OK, will do in v3 unless there are different opinions.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
