Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437F4F9E6D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F11010E04C;
	Fri,  8 Apr 2022 20:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BEC10E04C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 20:54:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D5BE0839B7;
 Fri,  8 Apr 2022 22:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649451242;
 bh=5k4KKJbpXu0JjbXqQTv2ZQQXPX/d2iqZo/oiphjWtEs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IjxE1sO63nI00iV7qzUtmN2Ia9UkEK3mD6yAibTgH+qXm2U88/rVW1/4miiRMlaLJ
 B8Eirv/5T7mtUfPHt4JyIeVtIKp4vtucBurWIE0ZHmecfS4BZYgqtHRBQSzYXh9n+7
 nOo/E+iuvQxrgUq70P3pW/34xF9w+4r7DX0vjo7yJbW51QIqygwMallUApu5s7jPu8
 OtrBb+Vs6RhnLkA7q+PNRPA7ub+euT0NzNFbRjaTLbsxhgctOqIL7uzaVTY7wlbgzP
 3nqbxXamWTzTM+VfUP5hOlS3G3HEG0XCXYdGS6aN6fzUeutaiFk5qszBu3RA5BKOtD
 wtqd64GsFlLJw==
Message-ID: <bac0a6ab-a188-698f-e1d7-caf369d6b845@denx.de>
Date: Fri, 8 Apr 2022 22:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Document DSI
 data-lanes property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220407185617.179573-1-marex@denx.de>
 <YlCgcw06jJ14n+kT@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YlCgcw06jJ14n+kT@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/8/22 22:52, Rob Herring wrote:
> On Thu, 07 Apr 2022 20:56:16 +0200, Marek Vasut wrote:
>> It is necessary to specify the number of connected/used DSI data lanes when
>> using the DSI input port of this bridge. Document the 'data-lanes' property
>> of the DSI input port.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: devicetree@vger.kernel.org
>> To: dri-devel@lists.freedesktop.org
>> ---
>> NOTE: This is consistent with all the other DSI panel and bridge bindings which
>>        document 'data-lanes' property, all of which already use OF graph and have
>>        the 'data-lanes' property in the port@N subnode, see:
>>        $ git grep -l data-lanes Documentation/devicetree/bindings/display/
>> ---
>>   .../display/bridge/chipone,icn6211.yaml        | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

I suspect Maxime wants to have one more look at this and the 2/2 patch.
