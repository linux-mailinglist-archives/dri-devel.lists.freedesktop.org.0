Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644EBB94BA0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3C10E573;
	Tue, 23 Sep 2025 07:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="OuYfjoI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973191.qiye.163.com (mail-m1973191.qiye.163.com
 [220.197.31.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99A710E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 07:17:28 +0000 (UTC)
Received: from [172.16.12.153] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 23c09b919;
 Tue, 23 Sep 2025 15:17:21 +0800 (GMT+08:00)
Message-ID: <dc554831-4368-43f0-b92b-896fd920e239@rock-chips.com>
Date: Tue, 23 Sep 2025 15:17:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy:
 Support mode-switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-3-kernel@airkyi.com>
 <eb6ogrepo5acwcj5gpdolxxyg3xrx7kz6zrbizzseqyavvitfd@cnzurelqeh4t>
 <533d41bd-9293-4808-85f3-8fb6dc8bcda7@rock-chips.com>
 <mpyfe63tzxzxyyqf4vxwmrewzeosnaftlkko7pq2ynld6u3lcz@wlpixckov4hg>
 <8396dd15-9111-4ceb-a561-6ed57727546f@rock-chips.com>
 <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <jm32ujhxslsx5snes4o66t2grb5uxhsaapjqahektfck66g6hb@fx6f53yojlcr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99756f218d03abkunm5591869a139fab
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUgZT1ZNSE0dGUJJHklDTxhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=OuYfjoI0/KRTSG9Mvp5kZYif7pjSs177Xu8KZpj87g1akZkEF+pMJzmwB3eSidvVAne+dtdEcqRxOUpwCka9htscgTlWFbmWMlv7ZiMuYOV8WMKcRTDPeqIot1jzjkJ8XCw5tP08afglgbemTqC93ar2xwElmLvVYzlSaQtWkqc=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=YXgNszLNxTgYBQeXLiuoM2pl3d7cCmFzHYl2QZT0EDg=;
 h=date:mime-version:subject:message-id:from;
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

On 9/23/2025 12:51 PM, Dmitry Baryshkov wrote:

> On Tue, Sep 23, 2025 at 11:40:33AM +0800, Chaoyi Chen wrote:
>> On 9/23/2025 11:17 AM, Dmitry Baryshkov wrote:
>>
>>> On Tue, Sep 23, 2025 at 09:53:06AM +0800, Chaoyi Chen wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 9/23/2025 9:12 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Sep 22, 2025 at 09:20:34AM +0800, Chaoyi Chen wrote:
>>>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> The RK3399 SoC integrates two USB/DP combo PHYs, each of which
>>>>>> supports software-configurable pin mapping and DisplayPort lane
>>>>>> assignment. These capabilities enable the PHY itself to handle both
>>>>>> mode switching and orientation switching, based on the Type-C plug
>>>>>> orientation and USB PD negotiation results.
>>>>>>
>>>>>> While an external Type-C controller is still required to detect cable
>>>>>> attachment and report USB PD events, the actual mode and orientation
>>>>>> switching is performed internally by the PHY through software
>>>>>> configuration. This allows the PHY to act as a Type-C multiplexer for
>>>>>> both data role and DP altmode configuration.
>>>>>>
>>>>>> To reflect this hardware design, this patch introduces a new
>>>>>> "mode-switch" property for the dp-port node in the device tree bindings.
>>>>>> This property indicates that the connected PHY is capable of handling
>>>>>> Type-C mode switching itself.
>>>>>>
>>>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>>>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> ---
>>>>>>
>>>>>> Changes in v4:
>>>>>> - Remove "|" in description.
>>>>>>
>>>>>> Changes in v3:
>>>>>> - Add more descriptions to clarify the role of the PHY in switching.
>>>>>>
>>>>>> Changes in v2:
>>>>>> - Reuse dp-port/usb3-port in rk3399-typec-phy binding.
>>>>>>
>>>>>>     .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
>>>>>>     1 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> index 91c011f68cd0..83ebcde096ea 100644
>>>>>> --- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
>>>>>> @@ -51,6 +51,12 @@ properties:
>>>>>>           '#phy-cells':
>>>>>>             const: 0
>>>>>> +      mode-switch:
>>>>> Having the mode-switch here is a bit strange. I think the whole PHY
>>>>> device should be an orientation-switch and mode-switch. Otherwise it
>>>>> feels weird to me.
>>>> I think this is a difference in practice. In the previous binding, there was already an orientation-switch under the usb-port. I trying to add both an orientation-switch and a mode-switch to the top-level device in v2. And Krzysztof reminded me that adding a mode-switch under the dp-port would be better, so I changed it to the current form :)
>>> I couldn't find the comment on lore. Could you please point it out?
>> Sorry, it is v1. I added an orientation-switch and a mode-switch in the top-level PHY [0]. Comment is here: [1]
> My interpretation of [1] doesn't quite match yours. It doesn't say
> anything about moving mode-switch to dp-port. It basically pointed out
> that you already have two ports.

Yes, I think this can be easily changed, as long as the issue you mentioned below is resolved.


>
> Also, I'm not sure how the current construction works: you register
> switch and mux for the dev_fwnode(tcphy->dev), however the lookfup
> functions should be looking for a device corresponding to the port OF
> node (which doesn't exist).

In v1, that is fwnode = dev_fwnode(tcphy->dev) .  And dt like is:


&tcphy {
     port {
         tcphy0_orientation_switch: endpoint@0 { ... };
         tcphy_dp_altmode_switch: endpoint@1 { ... };
     };
};


Since the binding already includes a "usb3-port" and a "dp-port", it can not add another new port.

So after v1, that is fwnode = device_get_named_child_node(tcphy->dev, "usb3-port") . And dt like this:


&tcphy0_dp {
     port { ... };
};

&tcphy0_usb3 {
     port { ... };
};


Sorry, this looks a bit hacky. Do you have a better idea? Thank you.


>
>>
>> [0] https://lore.kernel.org/all/20250715112456.101-4-kernel@airkyi.com/
>>
>> [1] https://lore.kernel.org/all/4dfed94c-665d-4e04-b527-ddd34fd3db8f@kernel.org/
>>
>>
>>
>>>>
>>>>>> +        description:
>>>>>> +          Indicates the PHY can handle altmode switching. In this case,
>>>>>> +          requires an external USB Type-C controller to report USB PD message.
>>>>>> +        type: boolean
>>>>>> +
>>>>>>           port:
>>>>>>             $ref: /schemas/graph.yaml#/properties/port
>>>>>>             description: Connection to USB Type-C connector
>>>>>> -- 
>>>>>> 2.49.0
>>>>>>
>>>> -- 
>>>> Best,
>>>> Chaoyi
>>>>
>> -- 
>> Best,
>> Chaoyi
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
Best,
Chaoyi

