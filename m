Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16AC4BD318
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 02:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF4010E24B;
	Mon, 21 Feb 2022 01:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBA1110E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:28:05 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55796.1374937723
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 9CEA6100114;
 Mon, 21 Feb 2022 09:27:51 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 33968a4650c64d8492bd84a8ba4934bc for jiaxun.yang@flygoat.com; 
 Mon, 21 Feb 2022 09:28:03 CST
X-Transaction-ID: 33968a4650c64d8492bd84a8ba4934bc
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <034c425e-bcd8-0fe4-f10c-3ef297ffcc72@189.cn>
Date: Mon, 21 Feb 2022 09:27:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 1/4] MIPS: Loongson64: dts: update the display
 controller device node
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-2-15330273260@189.cn>
 <a865b770-126e-a7c0-48bb-4f072b8dc5bd@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <a865b770-126e-a7c0-48bb-4f072b8dc5bd@flygoat.com>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/21 02:18, Jiaxun Yang wrote:
>
>
> 在 2022/2/20 14:55, Sui Jingfeng 写道:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> The display controller is a pci device, its PCI vendor id is 0x0014
>> its PCI device id is 0x7a06.
>>
>> 1) In order to let the driver to know which chip the DC is contained
>>     in, the compatible string of the display controller is updated
>>     according to the chip's name.
>>
>> 2) Add display controller device node for ls2k1000 SoC
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
> ^ The usage of Reported-by flag seems wired here.
> In most case we use it to credit people who find a bug that is already 
> in-tree.
> Reviewing effort is already credited by Reviewed-by flag.
>
> If you intend to let maintainers track their suggestions easier, the 
> common
> practice is to append suggester's name after each entry of changelog
> between versions.
>
> Thanks.

Ok, Now I know that. I will revise it next time, thank you.

>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> ---
>>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 8 ++++++++
>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 7 ++-----
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>
> [...]
> - Jiaxun
