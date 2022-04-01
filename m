Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333BC4EF9CF
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626E310E032;
	Fri,  1 Apr 2022 18:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206010E032
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 18:25:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 07C58842CA;
 Fri,  1 Apr 2022 20:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648837531;
 bh=XX3/dORVYjGSc/6rQaCVo5APNbEVGR1F5PO+VN35/bU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NxVdtmh2P+xGLyJ3awPbQoNp1vRGyHC7Rzw1D/+wg98iHXsSak2MFa14uibiGWdFG
 lPlMlCKKmVtqvqZGqEcYGECDDH6PR4Kug2sCb95ls17WvlqJKd3yZcem2iExpuUg3/
 fsw3E/v7rEqCLm9xqK6/SH5LVJlLDwHSyRKM1TP0anVJzQPQf+jYK4WOM8kdJnSLW+
 45rmmQ04KOQv+FjjdnH46286+PfJu/tnWGftnI+2BTBpjtTyHPrIl3iKU0SsPIS1ru
 EXwiJ7Hb9k+u+8yyEchqy8QvMIf7V1C/Pm6lpNJQvQEQQcQEG9Ry9fAyTNPTf9+41c
 OFPv+FA2anhMQ==
Message-ID: <30ea889f-f65e-e887-e230-935d6207c919@denx.de>
Date: Fri, 1 Apr 2022 20:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
 <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
 <Ykc3wm5pqJIA1jCn@robh.at.kernel.org>
 <1fddec5f-5fb3-4ea0-a1e5-9d1b9e54de81@denx.de>
 <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAL_JsqLmin2qXdeNrvraAf=fGzttOAYxwFCUSbC5TeHYaN+LhQ@mail.gmail.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 20:21, Rob Herring wrote:
> On Fri, Apr 1, 2022 at 1:06 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 4/1/22 19:34, Rob Herring wrote:
>>> On Fri, Apr 01, 2022 at 03:22:19AM +0200, Marek Vasut wrote:
>>>> On 4/1/22 01:52, Rob Herring wrote:
>>>>> On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
>>>>>> MIPI-DSI devices, if they are controlled through the bus itself, have to
>>>>>> be described as a child node of the controller they are attached to.
>>>>>>
>>>>>> Thus, there's no requirement on the controller having an OF-Graph output
>>>>>> port to model the data stream: it's assumed that it would go from the
>>>>>> parent to the child.
>>>>>>
>>>>>> However, some bridges controlled through the DSI bus still require an
>>>>>> input OF-Graph port, thus requiring a controller with an OF-Graph output
>>>>>> port. This prevents those bridges from being used with the controllers
>>>>>> that do not have one without any particular reason to.
>>>>>>
>>>>>> Let's drop that requirement.
>>>>>>
>>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>>> ---
>>>>>>     .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
>>>>>>     .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
>>>>>>     2 files changed, 2 deletions(-)
>>>>>>
>>>>>
>>>>> I tend to agree with port@0 not being needed and really like
>>>>> consistency.
>>>>
>>>> The consistent thing to do would be to always use port@0 and OF graph, no ?
>>>
>>> I guess it depends how wide our scope for consistency is. Just DSI bus
>>> controlled bridges? DSI panels? All bridges and panels? Any panel
>>> without a control interface has the same dilemma as those can be a child
>>> of the display controller (or bridge) and not even use OF graph.
>>
>> I would likely opt for the OF graph in all cases, panels, bridges,
>> controllers. Then it would be consistent.
>>
>>> All simple panels don't require 'port' either. That's presumably only
>>> consistent because we made a single schema. I'd assume 'non-simple'
>>> panels with their own schema are not consistent.
>>
>> Maybe we would start requiring that port even for simple panels ?
>> The port is physically there on that panel after all.
> 
> Fix this in all the dts files and then I'll agree. Though I think this
> ship has already sailed. I'd like to someday get to platforms without
> warnings and not just keep adding new warnings.

I doubt we can fix existing DTs, but can we at least require it for new 
DTs ?
