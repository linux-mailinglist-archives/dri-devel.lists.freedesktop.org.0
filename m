Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F19E3D8C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 16:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB5510E03A;
	Wed,  4 Dec 2024 15:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lBUUgytG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA35F10E03A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733324519;
 bh=7jcAdzZx2lqQzNAE8QFFcDHmNk++zheRlOY5LIlRKRw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lBUUgytGP51L3LiEeqXIUAZMK/wpp1ibsYPessz78EjYcd5woYyokmkZotqEqt7aA
 PoURH5dI9Xweu2fNwYOzmKYUggYFJ9Tj7mTEa0hp9Ik24SVdj+ghAxCVtkdCULcT66
 t+uB6uSQGLyRscDtSX+6+4PaQw8W8XnowXC5XVUNei6ldUTAqF8M3hcKdsnhThcKXe
 CDyqp393rZ2CvS+Ts158aduOLGMxYWJXN24CuiDgzRLX3V1aT3KwUPRLftUnl++Q1X
 OymoJRqGfs1fQkrGyE5Gokltjj3a4MpTIDsW6nwJnrb5GB0WQjAE38Q2NX18k3k7Gs
 rr3QRbx64tGxA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 148A117E3775;
 Wed,  4 Dec 2024 16:01:58 +0100 (CET)
Message-ID: <272b76ed-0ccc-46f2-8c43-92c047f2f0d3@collabora.com>
Date: Wed, 4 Dec 2024 16:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/7] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-3-angelogioacchino.delregno@collabora.com>
 <721896498fe9a5ba5a942fe837deb90d461b5090.camel@mediatek.com>
 <3d5f7106-6425-420c-abac-39feed11c95c@collabora.com>
 <4b1eb13d027717abaaaf4ee7aa927239ba314572.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4b1eb13d027717abaaaf4ee7aa927239ba314572.camel@mediatek.com>
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

Il 29/11/24 03:51, CK Hu (胡俊光) ha scritto:
> On Thu, 2024-11-28 at 11:32 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Il 28/11/24 07:02, CK Hu (胡俊光) ha scritto:
>>> Hi, Angelo:
>>>
>>> On Wed, 2024-11-20 at 13:45 +0100, AngeloGioacchino Del Regno wrote:
>>>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>>>
>>>>
>>>> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
>>>> and MT8188 SoCs.
>>>>
>>>> This fully supports the HDMI Specification 2.0b, hence it provides
>>>> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
>>>> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
>>>> xvYCC, with output resolutions up to 3840x2160p@60Hz.
>>>>
>>>> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
>>>> (VRR) and Consumer Electronics Control (CEC).
>>>>
>>>> This IP also includes support for HDMI Audio, including IEC60958
>>>> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
>>>> according to HDMI 2.0.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../mediatek/mediatek,mt8195-hdmi.yaml        | 150 ++++++++++++++++++
>>>>    1 file changed, 150 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
>>>> new file mode 100644
>>>> index 000000000000..273a8871461e
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
>>>> @@ -0,0 +1,150 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml*__;Iw!!CTRNKA9wMg0ARbw!lu0D_C3TwQ2-02jWYABnMIQ8vEoUwP0O4gbQndJnPUMpdi6wXdAHra9ivCfB7zoelDI7qsS20YdRlmP4bEKAABletXFX$
>>>> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!lu0D_C3TwQ2-02jWYABnMIQ8vEoUwP0O4gbQndJnPUMpdi6wXdAHra9ivCfB7zoelDI7qsS20YdRlmP4bEKAAFlnY-KY$
>>>> +
>>>> +title: MediaTek HDMI-TX v2 Encoder
>>>> +
>>>> +maintainers:
>>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> +  - CK Hu <ck.hu@mediatek.com>
>>>> +
>>>> +description: |
>>>> +  The MediaTek HDMI-TX v2 encoder can generate HDMI format data based on
>>>> +  the HDMI Specification 2.0b.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - mediatek,mt8188-hdmi-tx
>>>> +      - mediatek,mt8195-hdmi-tx
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: HDMI APB clock
>>>> +      - description: HDCP top clock
>>>> +      - description: HDCP reference clock
>>>> +      - description: VPP HDMI Split clock
>>>
>>> I would like to know more about HDMI v2.
>>> Would you map each v2 clock to v1 clock?
>>> If one clock has no mapping, is it a new feature that v1 does not has?
>>>
>>
>> The HDMIv2 HW block seems to be almost completely different from the v1, and
>> it is also interconnected in a different way compared to MT8173 (the path goes
>> through VPP1, while the v1 is just direct to DPI/MMSYS).
>>
>> The v1 block had specific clocks for the audio (i2s, I believe) and for the SPDIF,
>> and I have no idea how v1 does HDCP, but I don't see any specific clock for that.
>>
>> The v2 block is clocked from the HDCP clock, the (apb) bus has its own clock, and
>> the video out needs the vpp split clock.
>>
>> It's just different, and we can't shove the v2 binding inside of the v1 one, but
>> even if we could, since the v2 block is *that much* different from v1, it'd be a
>> mistake to do so.
>>
>> Since the binding describes hardware, and since this v2 HW is *very* different
>> from v1, it needs a new binding document, that is true even if you find a way to
>> get the clocks to match (which is not possible, anyway).
> 

Hey. Sorry about the late reply, it's been quite busy days here :-)

> v2 indeed is very different from v1, so it's not necessary to merge binding document.
> I would like to have more information about the difference in binding document,
> so that we could clearly understand that v1 and v2 are so different.
> 

Sounds reasonable.

> I think pixel clock is important for HDMI hardware, but I do not see it in HDMI v2.
> It is better has some documentation about why pixel clock disappear in HDMI v2.

Right. I'll write it in the PHY description.

   phys:
     maxItems: 1
     description:
        The HDMI TX PHY, clocking TMDS and pixel to this controller

> 
> I've some 'WHY' about v2.
> Why no audio clock in v2?

It's clocked by the HDCP CGs...

> Audio control part is moved out of HDMI block?
> 
> For HDCP, maybe v1 driver has not implement it so forget to add it in binding document.
> So just skip the HDCP.

...and the controller needs HDCP clocks for register access, so these are
main clocks and cannot be skipped.

> 
> The four clock in v2 does not exist in v1, so what is the function of each one?
> If possible, ask MediaTek staff for more information.

I'll try to ask to shove more information in this binding, let's see.

Cheers,
Angelo

> 
> Regards,
> CK
> 
>>
>> Cheers,
>> Angelo
>>
>>> Regards,
>>> CK
>>>
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: bus
>>>> +      - const: hdcp
>>>> +      - const: hdcp24m
>>>> +      - const: hdmi-split
>>>> +
>>>>
>>>> --
>>>> 2.47.0
>>>>
>>
>>


