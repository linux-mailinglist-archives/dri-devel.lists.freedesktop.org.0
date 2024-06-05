Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C17B8FD326
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 18:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E8C10E07A;
	Wed,  5 Jun 2024 16:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ml+IkuTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F240C10E07A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 16:51:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 47A5C88300;
 Wed,  5 Jun 2024 18:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717606312;
 bh=6d3FwQ+gfkfd/RiDUwCPApXYKBOzfh9S4dPrG+42lS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ml+IkuTk3WA8z3g3yvZ0tAwoJLEer4N7TZMWC7yfyIqwTs9jYVYXPgFfTP9rdCxKm
 HJoDvb/7FKFwpxp850vZVk6CZl9tKsiNF0cOCuHjsfkX7vwif6LNEtetcP/Y8ZG6A/
 bh13yx7EWWcpDliNKPeNWksjggFkqjfZ45Y+HHW49WOPJlVqVZmWX/7MT+b14qj8xQ
 HE2faEWJ4th4VlHemM5vgrcqRtcbBQKuMb72SjxTR0ITpFwEvmOb67VNzmikmeKGEo
 yr6D09TqNhL0Yy1OoxjsMgjcRaLQOg4rHR2ZROD9yMRs1yvE+WgjxJbewr7b5uqdK0
 I2PmFd8TKieBg==
Message-ID: <aef956d3-0cf9-4811-800d-7904ada3738d@denx.de>
Date: Wed, 5 Jun 2024 18:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
To: Rob Herring <robh@kernel.org>
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
 <20240605160331.GA3222592-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240605160331.GA3222592-robh@kernel.org>
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

On 6/5/24 6:03 PM, Rob Herring wrote:

Hi,

>> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
>> index 2ad0cd6dd49e0..dcf56e996ee22 100644
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
> 
> You didn't test adding this property. You will find it isn't allowed.
> That's because 'properties/port' schema above doesn't allow extra
> properties (on the port and endpoint).

Fixed

>> +                description:
>> +                  Display port output Pre-Emphasis settings for both ports.
> 
> Both ports? This schema is for just port 2.

'lanes' is better here. The array can be used to configure each DP main 
link lane separately, the chip supports two lanes.
