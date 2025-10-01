Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2960BB15C7
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 19:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57D810E0FE;
	Wed,  1 Oct 2025 17:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ayZLW0XU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF4A10E0FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 17:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759339654; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Dkp23wMelI93bQRBVAh4qzEHuDMvqEOtoSvdXxl/dCc2RST94/dd+ECyBhd7rmZZQBzInVt+3r87Nj+j2eogPBFO2zcRxZ0oASTeprZ/CtDxaGmjUQ1L7s204PulOqJ9IJfFtaEbWhx3lCZXLWsDSdVR0hFA5M4aIpuXvg8cM00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759339654;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=; 
 b=D7FJuPtuW1gADbBSn6bbvkh0fP0Zx2wrTVz4MOQ332+7LEBrZ8QCh/J/fugV2uyGQ4+m55Hwc6Z+y2kXOiRJ350oRS1UihIhN+3Z/Sg2OiYMo7uILAXC8M9V0RmzpaSeHySMjHgJJT7p2y0VN4UJ6uPYj6qHSYRNS58idfhy6zA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759339654; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=;
 b=ayZLW0XUN4u7dJENrthFwUqHzKCDhi5MZ/2z3kwIntkS1giAhgscYr0ggvdmgqxu
 P1f5y5iKqKdyIhfIA/8gvQwUzkGiOQJ44EFtm8y5mUaEioqDTQ+FX/piTv/FbvMwjkL
 XKC7Kt6A08WtQwH6KFer0lKPTgDyK0iVLrO57yCI=
Received: by mx.zohomail.com with SMTPS id 1759339651509186.59741864627483;
 Wed, 1 Oct 2025 10:27:31 -0700 (PDT)
Message-ID: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
Date: Wed, 1 Oct 2025 14:27:15 -0300
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
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250912140619.GA1293647-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Rob,

On 9/12/25 11:06 AM, Rob Herring wrote:
> On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Marvell 8897/8997
>> (sd8897/sd8997) bluetooth devices controller to a DT schema.
>>
>> While here:
>>
>> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>>    schema definition as these are currently documented in file [0].
>> * DT binding users are updated to use bluetooth generic name
>>    recommendation.
>>
>> [0] Documentation/devicetree/bindings/net/btusb.txt
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>>   .../devicetree/bindings/net/btusb.txt         |  2 +-
>>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
> 
>>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> 
> .dts files should be separate patches. Please send the bindings patches
> separately per subsystem so subsystem maintainers can apply them. All
> the Mediatek dts changes can be 1 series.

Ack, will fix in v3.

> 
> The schema looks good.

Great, thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

