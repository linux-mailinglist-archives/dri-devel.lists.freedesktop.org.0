Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46323967200
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 15:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A009810E010;
	Sat, 31 Aug 2024 13:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="d+SgYgIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718910E010
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xVas2nbtwjp9aJsPq4W6cm0leZn3Xl11wuSo0LagmYc=; b=d+SgYgIaeWmE5w0q11SZJGy9SX
 /27jGu9sSm0xKIhHODE5vwQ0ivyRJQTLcaFDiUJ4/0BadsaeNdpmYrC+ORJ4R2GzCRMgPoagqJYIc
 GToc1c2K1VcZQIUJuby0zA22v/qr647yFhtjhi1o5Hm6ydrPFhCQv+j5rK85Nsn8GTj3JQbFuzjpS
 vV1tm+3v+x1k+oX/JsGQPIMadW7Vq4bqazMfxX/Tv1SvUH6N5H7fr7nRfR97d7c8p5Z5eTc/u8Iyf
 nleqaHazP2U1/QrmMucudPHdwl38+Dpp3aoRtDtD+pfiJtJV0aceKNIkqasxeo3P9kMj+KtMIbwQO
 mWNzwBzQ==;
Received: from i53875be3.versanet.de ([83.135.91.227] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1skOb9-0003xk-5H; Sat, 31 Aug 2024 15:57:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
Date: Sat, 31 Aug 2024 15:58:31 +0200
Message-ID: <10210346.L8ug28u51p@diego>
In-Reply-To: <57wj2vwjv7eehlix2bmvbm3z4agv5fsyp6vmwwqzotkdsadx7n@azqg2kkaeuxz>
References: <20240831-b4-rk3588-bridge-upstream-v5-0-9503bece0136@collabora.com>
 <20240831-b4-rk3588-bridge-upstream-v5-1-9503bece0136@collabora.com>
 <57wj2vwjv7eehlix2bmvbm3z4agv5fsyp6vmwwqzotkdsadx7n@azqg2kkaeuxz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi,

Am Samstag, 31. August 2024, 08:16:26 CEST schrieb Krzysztof Kozlowski:
> On Sat, Aug 31, 2024 at 12:55:29AM +0300, Cristian Ciocaltea wrote:

> > +  clocks:
> > +    minItems: 4
> > +    maxItems: 6
> > +    items:
> > +      - description: Peripheral/APB bus clock
> > +      - description: EARC RX biphase clock
> > +      - description: Reference clock
> > +      - description: Audio interface clock
> > +    additionalItems: true
> 
> What is the usefulness of all this? How can you even be sure that each
> implementation of this core will have exactly these clocks?
>
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    maxItems: 6
> > +    items:
> > +      - const: pclk
> > +      - const: earc
> > +      - const: ref
> > +      - const: aud
> > +    additionalItems: true
> > +
> > +  interrupts:
> > +    minItems: 4
> > +    maxItems: 5
> > +    items:
> > +      - description: AVP Unit interrupt
> > +      - description: CEC interrupt
> > +      - description: eARC RX interrupt
> > +      - description: Main Unit interrupt
> 
> If these are real pins, then this seems more possible, but
> additionalItems does not make me happy.

So while not "pins", the interrupts are separately specified in the
SoC's list of interrupts in the GIC:

RK3588 has:

201  irq_hdmitx0_oavp
202  irq_hdmitx0_ocec
203  irq_hdmitx0_oearcrx
204  irq_hdmitx0_omain
392  irq_hdmitx0_hpd

and another set of all of them for hdmitx1

and RK3576 using the same hdmi IP has:

370  irq_hdmitx_oavp
371  irq_hdmitx_ocec
372  irq_hdmitx_oearcrx
373  irq_hdmitx_omain
399  irq_hdmitx_hpd

so I guess the fifth interrupt is meant to be the hotplug?
Though I guess this should be specificed in the name-list too.

From the SoC's manual it looks like the controller is set up from
different modules.
Like AVP is the audio-video-packet-module, there is a Main and CEC Module
as well as a eARC RX controller inside. I'd guess it might be possible
other SoC vendors could leave out specific modules?


TL;DR I think those clocks and interrupts are dependent on how the
IP core was synthesized, so for now I'd think we can only guarantee
that they are true for rk3588 and rk3576.

So I guess they should move to the rockchip-specific part of the binding
until we have more hdmi-qp controllers in the field?

Heiko


