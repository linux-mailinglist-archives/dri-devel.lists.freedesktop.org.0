Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC743684B8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2425E6E3DA;
	Thu, 22 Apr 2021 16:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB616E3DA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 16:22:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 317EF81D3B;
 Thu, 22 Apr 2021 18:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1619108536;
 bh=4gpqWFxwNYO1QYUDHarnRmhKuH2r+gsiCwEhJJ3k7pg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dqhE8JQ6biJwaMcEXLVp2m4iE0QB3oDulwp481eV5+/YNCsaefTF0cJs2O2HP9Hnm
 xsnfHw+tQxFw0FN5ixdtbaQEjsxLzgwI/6y5SDiErZOWwmExv/vq2TLN2Bzn3x48hj
 egAT2pdz6mH2RbBGVvrlOq51F5nrLxMIuGuxU1RVZyEqcdiE25U9LyfhaoB4qMGIzd
 JjGWtlRr6nVQ8pjjKZtrgpFk8OY+S9i1ckq4IuHeDly7b9c1D2RmA69cgCbWl2UDY7
 GLfVUdWwtmyzJafRkfCjOWCFYke30A0LyPkDfJGlYQuKsyCvNG+K1nZzROXFReWMMV
 1+AtAvX6XHg1w==
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20210421223122.112736-1-marex@denx.de>
 <CAMty3ZB9iHY6-YV7JRrhekR_7yA=m2dgwR=5a+D3=h4hAMi7WQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <eadb679b-4fb0-505f-8f56-242fa3ebd1b5@denx.de>
Date: Thu, 22 Apr 2021 18:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZB9iHY6-YV7JRrhekR_7yA=m2dgwR=5a+D3=h4hAMi7WQ@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: devicetree <devicetree@vger.kernel.org>, Claudius Heine <ch@denx.de>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/22/21 10:43 AM, Jagan Teki wrote:

[...]

>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>> new file mode 100644
>> index 000000000000..42d11b46a1eb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip
> 
> Can it possible to wait for my v4 to have dual-link LVDS supported
> which is quite discussing points on previous versions?

This driver already has the dual-link LVDS support on DSI84 and it is 
tested on real hardware. So is the single-link LVDS on DSI83, on 
multiple hardware instances.

In addition to that, this driver has proper regmap support and constant 
time calculation of DSI83/84 clock register settings.

Note that I did wait for your v4 for over two weeks already, it just 
didn't materialize, so I determined it might be a good idea to restart 
work on this driver instead.

Maybe you can test this driver and check what is missing for your usecase?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
