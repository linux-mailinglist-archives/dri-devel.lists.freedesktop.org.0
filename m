Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A99D313BF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4103610E87D;
	Fri, 16 Jan 2026 12:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kpevwV+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757D410E87D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vH+PgOENTDXlzsxRREXIcCkNdXY313g9kTQGZXo/8ws=; b=kpevwV+wqObPrgd3tM98X8L2yC
 wMp2fOCeL4BSoevbskuu/MIdLXKwSmaccpQA1EkHWuv0w44WDEv7aR6jDV+2Yy7T6yTaTnqEoOK5s
 WKFDaBM9PyDiPc2eDTt0nSE8hvi5UY01nXY7Pna7NH2Vn6Au+ocGhnvNDNnaKp7hoaVoyqD2P8EOC
 Pj2Kr6iR5erFAANuSMdxELq9peHOM6fPxQaWjEIQYSR2KruYdxiv8MLEY5ZJbfRmrRKtwxykadKnh
 38dPKNcpPWUIzGmG/sXZsjl0Sh/ZJH+FnoumSQPWf8czruT2q+w0f8rKlQl9gfOKK30W2juabcIYJ
 XO+3TcZw==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgj9R-0069gt-66; Fri, 16 Jan 2026 13:42:05 +0100
Message-ID: <5188e604-7952-495b-98e1-a01b8afd87d7@igalia.com>
Date: Fri, 16 Jan 2026 09:41:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
 <121ede67-dbfc-4b79-8076-04693e9d3d53@gmail.com>
 <59cdede3-7757-4fe1-bb94-e7a93eea7611@igalia.com>
 <CALeDE9PGzTe4LXnDJcyhh_ietWkrf8Sp7xX=X6pZvdCWLx2huw@mail.gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <CALeDE9PGzTe4LXnDJcyhh_ietWkrf8Sp7xX=X6pZvdCWLx2huw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Peter,

On 16/01/26 07:56, Peter Robinson wrote:
> On Fri, 16 Jan 2026 at 10:15, Maíra Canal <mcanal@igalia.com> wrote:
>>
>> Hi Peter,
>>
>> On 16/01/26 00:53, Peter Robinson wrote:
>>> Hi Maira,
>>>
>>> On 14/01/2026 12:04, Maíra Canal wrote:
>>>> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
>>>> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D
>>>> device")
>>>> added driver support for V3D on BCM2712, but the corresponding device
>>>> tree node is still missing.
>>>>
>>>> Add the V3D device tree node to the BCM2712 DTS.
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>>
>>>> ---
>>>> v1 -> v2:
>>>>
>>>> - Rebased on top of linux-next (Stefan Wahren)
>>>> - Fixed node's address (2000000 -> 1002000000) (Stefan Wahren)
>>>> - Link to v1: https://lore.kernel.org/linux-
>>>> devicetree/20260113192902.48046-2-mcanal@igalia.com/
>>>> ---
>>>>    .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  4 ++++
>>>>    arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
>>>>    2 files changed, 18 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/
>>>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>>>> index 7d4742ebe247..97522c6803c5 100644
>>>> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>>>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>>>> @@ -247,3 +247,7 @@ &pcie1 {
>>>>    &pcie2 {
>>>>        status = "okay";
>>>>    };
>>>> +
>>>> +&v3d {
>>>> +    clocks = <&firmware_clocks 5>;
>>>
>>> Looking at the upstream DT [1] I think this also needs a clock-names entry.
>>
>> Differently from the `hvs` node [1] you sent (which specifies clock-
>> names), the `v3d` binding [2] doesn't have a clock-names property.
>> Therefore, it is not needed.
> 
> There's a name in the clk driver [1] so maybe the bindings should be updated?

Those are two separate concepts. In the DT, clock-names is used by vc4
to distinguish between multiple clock inputs [1]. In contrast, the v3d
driver has a single clock input [2], and does not rely on named clock
lookups.

Given that, I believe there is no need for a clock-names property in the
v3d binding, and updating the binding to mandate it would not provide
any functional benefit at this point.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/vc4/vc4_hvs.c#n1679 

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/v3d/v3d_drv.c#n363

Best regards,
- Maíra

> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/bcm/clk-raspberrypi.c#n26
> 
>> [1]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
>>
>> Best regards,
>> - Maíra
>>
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>> tree/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi#n233
>>>
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/
>>>> boot/dts/broadcom/bcm2712.dtsi
>>>> index 330a121ebfcb..661668ef7419 100644
>>>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>>> @@ -1,5 +1,6 @@
>>>>    // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +#include <dt-bindings/soc/bcm2835-pm.h>
>>>>    / {
>>>>        compatible = "brcm,bcm2712";
>>>> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
>>>>                msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
>>>>                brcm,msi-offset = <8>;
>>>>            };
>>>> +
>>>> +        v3d: gpu@1002000000 {
>>>> +            compatible = "brcm,2712-v3d";
>>>> +            reg = <0x10 0x02000000 0x00 0x4000>,
>>>> +                  <0x10 0x02008000 0x00 0x6000>,
>>>> +                  <0x10 0x02030800 0x00 0x0700>;
>>>> +            reg-names = "hub", "core0", "sms";
>>>> +
>>>> +            power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
>>>> +            resets = <&pm BCM2835_RESET_V3D>;
>>>> +            interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
>>>> +        };
>>>>        };
>>>>        vc4: gpu {
>>

