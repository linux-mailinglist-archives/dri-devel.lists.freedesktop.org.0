Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D408FD328
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF9910E190;
	Wed,  5 Jun 2024 16:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="SNFbD22Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C51E10E07A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:51:55 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B9DCB881A2;
 Wed,  5 Jun 2024 18:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717606313;
 bh=rVfcNH8WIbB0r/vFRDdU0pF+tcrg2c6t8y4LuiC7xTY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SNFbD22Yklo8wnJO3O7oA3tjywoVepOSnAN/3kk6+RTgKgiOTS3nz8vca9/rwU/gh
 ugbQSDfllJgNN8CfPx0mznMqCH1DtR/1ffXDv2/PaKWEgvMomjwLDJ2lwYrWg60U1s
 +PUs1mZoMd44Z4hmbE5PKcqo9yLZA4vcY7w1ywtfCweUQ6GwPclH6B+2dPPrM3Tb+V
 t1/oe66QpP5dDn3O0Zylnr1i7nerFmWk0hq/EnOUQ2zmawpWegaz0LC0dqpglgUQvs
 BjLvOK5mn9gUJu3UU+OgNNe6ThYK0PswHFFGgD8LjoZ7/i+LguyLRugCbRTW/PaSqd
 XsLXycu21VkUA==
Message-ID: <00e9ef90-3bbe-4556-8da9-462f65928781@denx.de>
Date: Wed, 5 Jun 2024 18:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
To: Rob Herring <robh@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com
References: <20240531204339.277848-1-marex@denx.de>
 <3302939.44csPzL39Z@steina-w> <20240605160533.GB3222592-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240605160533.GB3222592-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 6/5/24 6:05 PM, Rob Herring wrote:

>>> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>>> index 2ad0cd6dd49e0..dcf56e996ee22 100644
>>> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>>> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>>> @@ -98,6 +98,24 @@ properties:
>>>               reference to a valid eDP panel input endpoint node. This port is
>>>               optional, treated as DP panel if not defined
>>>   
>>> +        properties:
>>> +          endpoint:
>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>> +            unevaluatedProperties: false
>>> +
>>> +            properties:
>>> +              toshiba,pre-emphasis:
>>> +                description:
>>> +                  Display port output Pre-Emphasis settings for both ports.
>>
>> Is this a property of the port or the endpoint?
> 
> What's the difference? Either is the same data path.
> 
> The preference is custom properties in endpoint node, not port nodes.

Let's keep it in the endpoint node.

There is some mention in the TC9595 datasheet that the DP might operate 
in some split mode, where each DP lane is used to feed one display (?), 
so I assume in that case there might be two endpoints (?), but that is 
not supported right now.

If that is ever needed, I guess this array would have minItems 1 and 
maxItems 2 and another endpoint would be added to the schema for this 
port 2.
