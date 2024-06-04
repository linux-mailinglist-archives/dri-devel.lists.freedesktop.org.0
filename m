Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06B8FBA51
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021A10E577;
	Tue,  4 Jun 2024 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="raqeS7DL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8080810E30F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:27:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C219D884D2;
 Tue,  4 Jun 2024 19:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522025;
 bh=y5WTHCt79SQfJ12FXU8PBZFTTrxRb97gCWjJe0nRVWo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=raqeS7DL1h/dHw0nEfMubYrX8Fi8S5XFr4fQsfV9tj5M12tgtGOHs6KsStp75R824
 RJ/aJpeDa5bnZYobA2mkg63EVQZIZWcI9Jd2iLLXf1QH5uFloaSaSdKyAYPN+yo1aH
 od0Jtx/hNiLKKwfU7dFHV9oD/VslDuCIQ9vHOdvSoMxCOTYzqrO2n3ZAYeaBYKNwTk
 PXkAYylp1nHz9HEHqAdmSsr5CtZHkhLiSX0+nV3914GIY3SofBxxzyIOM8TbqFEY4n
 wxDS8FrvyFyVvJvKBNYIq+J6ytQJFKHfYgqKLJWPh24Bocl7l3CbbXDf3EMLFckiSU
 LuanGCji5K/AA==
Message-ID: <c912cee0-88e1-4c3f-b4dd-8df967b76abb@denx.de>
Date: Tue, 4 Jun 2024 18:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com
References: <20240531204339.277848-1-marex@denx.de>
 <3302939.44csPzL39Z@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3302939.44csPzL39Z@steina-w>
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

On 6/4/24 11:42 AM, Alexander Stein wrote:
> Hi Marek,

Hi,

>> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>> @@ -98,6 +98,24 @@ properties:
>>               reference to a valid eDP panel input endpoint node. This port is
>>               optional, treated as DP panel if not defined
>>   
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              toshiba,pre-emphasis:
>> +                description:
>> +                  Display port output Pre-Emphasis settings for both ports.
> 
> Is this a property of the port or the endpoint?

Endpoint I think.

>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                minItems: 2
>> +                maxItems: 2
>> +                items:
>> +                  enum:
>> +                    - 0 # -6dB de-emphasis
>> +                    - 1 # -3.5dB de-emphasis
>> +                    - 2 # No de-emphasis
> 
> Is there a reason you reversed the notation here? de-emphasis <-> pre-emphasis.
> Commit message also says:
>> in range 0=0dB, 1=3.5dB, 2=6dB .

Copy-paste error from 
Documentation/devicetree/bindings/usb/snps,dwc3.yaml , fixed in V2, thanks .
