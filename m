Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA8AB0C05
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 09:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7749510E9CE;
	Fri,  9 May 2025 07:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="uf1RgzYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83B810E9CE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=k66pmCI1pT3vfBJYih/fR8R6maFESHCnrlUq6lhyU7E=; b=uf1RgzYa1jurRkM4LRmh7M2nKi
 X/tNKnrMcl9U3XpmbQXaWzo+GtVk2elzKzG+FacPEffuVMPfQzBsi4GYPHTJfh4wa3q8SS4uYbr5w
 38D7UiS497Wv+KxKTttiN6YWS9Gi2SXLmG5gfxG0GyTADF+EUp7qGoiC0pBINFIsW6SjWr0vTVAPz
 bH98GaqZTd6jGfDtZtFA8kexrzNPabyXJx9uekAdnvYdAWWixnZbkPqpObBteA5dPPAwxstxYIHMg
 yTrJZ6pR+o/+4FED01z3iFhYKVPZ/UXHDyQg9McHn3Bb9ptOo9OWt68bZ8HyFq8IR3vsDgSKTWFIH
 OItVOlXg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uDIRf-0007kz-JF; Fri, 09 May 2025 09:46:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Chaoyi Chen <kernel@airkyi.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Date: Fri, 09 May 2025 09:46:57 +0200
Message-ID: <1824349.VLH7GnMWUR@diego>
In-Reply-To: <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
References: <20250509070247.868-1-kernel@airkyi.com>
 <ccf4b15a-8399-4a7f-ae40-d01d0975921c@kernel.org>
 <5a4f6229-1450-4c96-bfac-5257f66b2ddf@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Freitag, 9. Mai 2025, 09:34:47 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Chaoyi Chen:
> Hi Krzysztof,
>=20
> On 2025/5/9 15:11, Krzysztof Kozlowski wrote:
> > On 09/05/2025 09:02, Chaoyi Chen wrote:
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: core-clk
> >> +      - const: pclk
> >> +      - const: spdif
> >> +      - const: grf
> >> +
> >> +  extcon:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> >> +    description:
> >> +      Phandle to the extcon device providing the cable state for the =
DP PHY.
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  phys:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > Just phandle. If this is an array (but why?), you need maxItems for
> > outer and inner dimensions.
>=20
> I think it could be phandle or phandle-array. Since the RK3399 DP has=20
> two PHYs, if we put in two PHYs here, the driver will pick one PHY port=20
> that is already plugged into the DP for output. If we fill in only one=20
> PHY here, then output is only allowed on the corresponding PHY.
>=20
> Will add restrictions and add more descriptions in v3.

Just looked that up in the documentation.

Only the rk3399 has used this controller at all so far. There is one
cdn-dp controller on it, but two phys for the two type-c blocks on
the soc.

The controller can then select which one to drive. So yep, there
are two phys.


Heiko


