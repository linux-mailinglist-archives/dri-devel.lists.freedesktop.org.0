Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936F5B8A668
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37B010E05F;
	Fri, 19 Sep 2025 15:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fPpnGcTc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2018110E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:49:45 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BABAD6DF;
 Fri, 19 Sep 2025 17:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1758296903;
 bh=uzz8UtcR8/EpP02NCPWiEvxG4gfkUH/EZNqtISIb7gU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fPpnGcTc4YjA80wmVNlEPgddwWAhvxA9LK74u+F2Ii53E94D+KvtcAOZBDxNQ4Vvu
 KSds7oq75mUOfBvI0yKI+bvDjHdW2WMpLzO6D2G1PYSc04fDHgwQMYrOuZ6lGRovCQ
 OW7+88ZbPWdElF/4ZzeAZ1moiZs8z0Jo7EJLmR4o=
Message-ID: <cd0c59f8-bb83-4d1b-9bda-96be3a960154@ideasonboard.com>
Date: Fri, 19 Sep 2025 18:49:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250904210147.186728-1-marek.vasut+renesas@mailbox.org>
 <20250904210147.186728-4-marek.vasut+renesas@mailbox.org>
 <4ffcf4fc-17a9-4669-af07-f81ddb46aee9@ideasonboard.com>
 <d76ff19c-7b0f-4aa9-8ae2-d08c82d70410@mailbox.org>
 <aebc10ec-73ed-4843-95c5-9ba5a2759ccb@ideasonboard.com>
 <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <b4c0e78a-eecb-4a18-9199-18ea91c8df31@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 19/09/2025 18:42, Marek Vasut wrote:
> On 9/19/25 5:21 PM, Tomi Valkeinen wrote:
> 
> Hello Tomi,
> 
>>>> On 05/09/2025 00:01, Marek Vasut wrote:
>>>>> This controller can have both bridges and panels connected to it. In
>>>>> order to describe panels properly in DT, pull in dsi-controller.yaml
>>>>> and disallow only unevaluatedProperties, because the panel node is
>>>>> optional. Include example binding with panel.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>> V2: Drop the dsi0: and dsi1: controller labels
>>>>> ---
>>>>>    .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 +++++++++++++
>>>>> +++++-
>>>>>    1 file changed, 51 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/
>>>>> renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/
>>>>> bridge/renesas,dsi-csi2-tx.yaml
>>>>> index c167795c63f64..51d685ed82891 100644
>>>>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>>>> csi2-tx.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-
>>>>> csi2-tx.yaml
>>>>> @@ -14,6 +14,9 @@ description: |
>>>>>      R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2
>>>>> mode, with up
>>>>>      to four data lanes.
>>>>>    +allOf:
>>>>> +  - $ref: /schemas/display/dsi-controller.yaml#
>>>>> +
>>>>
>>>> Did you try with a bridge? dsi-controller.yaml only allows a panel. I
>>>> think I discussed this with someone not long ago, but I couldn't find
>>>> any patch sent for that.
>>> Nope, I only have these two 5" and 7" RPi Display 2 panels.
>>
>> Ok. My point was just that the dsi-controller.yaml doesn't allow
>> "bridge" node (you can just rename the panel to bridge to test). I
>> thought someone (I just can't remember who was it =) will send a patch
>> for it, but I think that hasn't happened.
> Do you want me to drop the bridge part from the commit message (I assume
> yes) ?

It's not clear to me if the binding before this patch supported both
panels and bridges as DSI peripherals, or neither, only "external" ones,
i.e. i2c?.

If it supported bridges earlier, and now doesn't, it's a regression in
the binding.

What I want is for someone to fix dsi-controller.yaml (hint hint!), but
as for this patch, assuming there's no regression, I think it's fine to
just mention that only panels are currently supported due to
dsi-controller.yaml.

 Tomi

