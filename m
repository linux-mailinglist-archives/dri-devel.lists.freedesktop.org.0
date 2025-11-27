Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763DC8FE1B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0910E8CC;
	Thu, 27 Nov 2025 18:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="MrrmR/Eb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A788310E857
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:16:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764267379; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VHNPgFqZa0o6809/T+8jHJoMCBYjd2yZiYvEH43ecdDw0RDEoZBASvS8GXIRjf443u9HWsC87weywb65C5DIBcudiiLSfw66tyl4FaLNKaejlEIJIohOY954WwUx+6cfKsQdPDjAUxOAHUCJW2JVa5BuwC53SzyModibprg79Xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764267379;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=GA9FTV2ejX5xguOwyiDUL1hpvKOTwyB0xhI2crLeIWM=; 
 b=VzgCDjp9rcRegJe18G1VoZpp248pQnSYb2nnPRvNYWxHUdyyrlHItaUgv2yGSNf+L6cT0ioGjEOUEpK+K0iTAkjcNQ9RhPc7ICm06mhWm7aOWDC7aTqGKcy/QGw9e2DvPfDfeB5pm0C9OwDjdwtPltUGw2ChGO1r7cznhhdiZRQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764267379; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=GA9FTV2ejX5xguOwyiDUL1hpvKOTwyB0xhI2crLeIWM=;
 b=MrrmR/EbOR0f5Gb5Xbhy3YhzRySSoWvRdfWRmCgcQVrMezcKplDmR9LS92M5F8YU
 44hmR7lvwMtOD/5nw3ELxQb8PadU5cfnfMx7ngMJ02a3mou1wD1bDW4FltRjo9ZXijV
 BVrAa/6yr4xsF2CvbF/50U6ILU5JghWfinyStD5c=
Received: by mx.zohomail.com with SMTPS id 1764267377521567.410213066609;
 Thu, 27 Nov 2025 10:16:17 -0800 (PST)
Message-ID: <2dd059f5-96d4-44a1-84be-b14dce28cf06@collabora.com>
Date: Thu, 27 Nov 2025 15:15:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
 <20250912140619.GA1293647-robh@kernel.org>
 <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
 <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Hi Rob,

On 11/24/25 3:54 PM, Rob Herring wrote:
> On Wed, Oct 1, 2025 at 12:28 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
>>
>> Rob,
>>
>> On 9/12/25 11:06 AM, Rob Herring wrote:
>>> On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
>>>> Convert the existing text-based DT bindings for Marvell 8897/8997
>>>> (sd8897/sd8997) bluetooth devices controller to a DT schema.
>>>>
>>>> While here:
>>>>
>>>> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>>>>     schema definition as these are currently documented in file [0].
>>>> * DT binding users are updated to use bluetooth generic name
>>>>     recommendation.
>>>>
>>>> [0] Documentation/devicetree/bindings/net/btusb.txt
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>>> ---
>>>>    .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>>>>    .../devicetree/bindings/net/btusb.txt         |  2 +-
>>>>    .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
>>>
>>>>    .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>>>>    .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>>>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
>>>
>>> .dts files should be separate patches. Please send the bindings patches
>>> separately per subsystem so subsystem maintainers can apply them. All
>>> the Mediatek dts changes can be 1 series.
>>
>> Ack, will fix in v3.
> 
> Are you going to send v3 still?

Yes, will be sending out v3 asap, with the remaining changes.
Sorry for the delay.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

