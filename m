Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A77967363
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 23:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D510E0D2;
	Sat, 31 Aug 2024 21:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="KrSdd8qh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7140510E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:53:58 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725141229; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L3xPZgUyOvsSTEjNm0dIQeb87imymYH4snOOTwEUh/809qZmduS9NVuHKdK1KAhc/VHPym5XNX2nejJiMhz4aEDrTzcRbW4HNsyRFBx4gDWc5QgNrJwbUFQTeCKPtiPgbOHHlI0/AxXiI49+6AkP8/TFFpcDQ4eg2U2TpMloPd0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725141229;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=x0RR3F/q7Ng0NQ6+zBACU56gYedu5cFaQzPMm5Tr+OA=; 
 b=Gn6fqpKd6yeBqdkkV9zOjf/luMT+xYyWR4Ico6bd8heSqT+bBvjp/GgJKq50Snbg9Ai5inemXzq8eLlKSjJ16Y7JDTUKMdvOSEj9j8OfQrzCCPrrHunTYQjAAEzNBVaFOpT3BR3ertbPnhld5UO7a0W5flXIADFV/1lEpXP3pOk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725141229; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=x0RR3F/q7Ng0NQ6+zBACU56gYedu5cFaQzPMm5Tr+OA=;
 b=KrSdd8qhTTzw0AjTdmXA7gDpavhgVnccJaW0qdQvNbGqD+jZsqbiXTPuaqYpcXW8
 ZUESfrud95oB0F/TwVwSjPCW3/a8TUojqYRnjNyuU9LefTWIzUskOgy/3cL21OI/EN/
 vHUgk5lt+DnwBsarwwBgzQJ1YLdWsFhVFn5K6/p4=
Received: by mx.zohomail.com with SMTPS id 17251412271561.7075273044212054;
 Sat, 31 Aug 2024 14:53:47 -0700 (PDT)
Message-ID: <aee7b364-39df-4eb4-a823-4e734f104982@collabora.com>
Date: Sun, 1 Sep 2024 00:53:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] dt-bindings: display: bridge: Add schema for
 Synopsys DW HDMI QP TX IP
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
References: <20240831-b4-rk3588-bridge-upstream-v5-0-9503bece0136@collabora.com>
 <20240831-b4-rk3588-bridge-upstream-v5-1-9503bece0136@collabora.com>
 <57wj2vwjv7eehlix2bmvbm3z4agv5fsyp6vmwwqzotkdsadx7n@azqg2kkaeuxz>
 <10210346.L8ug28u51p@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <10210346.L8ug28u51p@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 8/31/24 4:58 PM, Heiko Stübner wrote:
> Hi,
> 
> Am Samstag, 31. August 2024, 08:16:26 CEST schrieb Krzysztof Kozlowski:
>> On Sat, Aug 31, 2024 at 12:55:29AM +0300, Cristian Ciocaltea wrote:
> 
>>> +  clocks:
>>> +    minItems: 4
>>> +    maxItems: 6
>>> +    items:
>>> +      - description: Peripheral/APB bus clock
>>> +      - description: EARC RX biphase clock
>>> +      - description: Reference clock
>>> +      - description: Audio interface clock
>>> +    additionalItems: true
>>
>> What is the usefulness of all this? How can you even be sure that each
>> implementation of this core will have exactly these clocks?
>>
>>> +
>>> +  clock-names:
>>> +    minItems: 4
>>> +    maxItems: 6
>>> +    items:
>>> +      - const: pclk
>>> +      - const: earc
>>> +      - const: ref
>>> +      - const: aud
>>> +    additionalItems: true
>>> +
>>> +  interrupts:
>>> +    minItems: 4
>>> +    maxItems: 5
>>> +    items:
>>> +      - description: AVP Unit interrupt
>>> +      - description: CEC interrupt
>>> +      - description: eARC RX interrupt
>>> +      - description: Main Unit interrupt
>>
>> If these are real pins, then this seems more possible, but
>> additionalItems does not make me happy.
> 
> So while not "pins", the interrupts are separately specified in the
> SoC's list of interrupts in the GIC:
> 
> RK3588 has:
> 
> 201  irq_hdmitx0_oavp
> 202  irq_hdmitx0_ocec
> 203  irq_hdmitx0_oearcrx
> 204  irq_hdmitx0_omain
> 392  irq_hdmitx0_hpd
> 
> and another set of all of them for hdmitx1
> 
> and RK3576 using the same hdmi IP has:
> 
> 370  irq_hdmitx_oavp
> 371  irq_hdmitx_ocec
> 372  irq_hdmitx_oearcrx
> 373  irq_hdmitx_omain
> 399  irq_hdmitx_hpd
> 
> so I guess the fifth interrupt is meant to be the hotplug?

Yep, that's for the hotplug detection.

> Though I guess this should be specificed in the name-list too.

My understanding from Andy was that HPD interrupt is Rockchip platform
specific, hence I made it part of rockchip,rk3588-dw-hdmi-qp.yaml.

> From the SoC's manual it looks like the controller is set up from
> different modules.
> Like AVP is the audio-video-packet-module, there is a Main and CEC Module
> as well as a eARC RX controller inside. I'd guess it might be possible
> other SoC vendors could leave out specific modules?
> 
> 
> TL;DR I think those clocks and interrupts are dependent on how the
> IP core was synthesized, so for now I'd think we can only guarantee
> that they are true for rk3588 and rk3576.
> 
> So I guess they should move to the rockchip-specific part of the binding
> until we have more hdmi-qp controllers in the field?

If that's the case, then we should simply drop the common binding
altogether for now.

Thanks,
Cristian
