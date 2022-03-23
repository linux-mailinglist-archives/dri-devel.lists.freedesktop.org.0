Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5B74E4AA1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 02:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AC310E04C;
	Wed, 23 Mar 2022 01:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 952C310E04C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 01:53:22 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:44820.495833220
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id EF32B1002A9;
 Wed, 23 Mar 2022 09:53:15 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 437bde2d691948a680665d3a4e627624 for jiaxun.yang@flygoat.com; 
 Wed, 23 Mar 2022 09:53:20 CST
X-Transaction-ID: 437bde2d691948a680665d3a4e627624
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
Date: Wed, 23 Mar 2022 09:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 2/7] MIPS: Loongson64: dts: introduce ls3A4000
 evaluation board
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
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-3-15330273260@189.cn>
 <2644866a-8db2-923e-4227-2aa6d8e375fe@flygoat.com>
 <2c671752-6684-f87b-7b2d-90568d36adde@189.cn>
 <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <005099b5-33ed-4cb7-f8e4-10e1de780311@flygoat.com>
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


On 2022/3/23 00:06, Jiaxun Yang wrote:
>
>
> 在 2022/3/22 13:38, Sui Jingfeng 写道:
>>
>> On 2022/3/22 21:05, Jiaxun Yang wrote:
>>>
>>>
>>> 在 2022/3/21 16:29, Sui Jingfeng 写道:
>>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>>
>>>> The board name is LS3A4000_7A1000_EVB_BOARD_V1.4, it consist of 1.8Ghz
>>>> mips64r5 4-core CPU and LS7A1000 bridge chip. It has PCIe GEN2 x8 
>>>> slot,
>>>> therefore can play with discrete graphics card.
>>>
>>> Hi Jingfeng,
>>>
>>> As we've discussed before if you are going to introduce new dts then 
>>> you *MUST*
>>> include it in makefile and wire it up in code.
>>>
>>> A dts file doing nothing lying in the tree is just suspicious.
>>>
>>> Thanks.
>>> - Jiaxun
>>>
>> Hi, Jiaxun,
>>
>> I know what you means, but it is the kernel side developer's job.
>> I am just a naive graphic driver developer,I can not care so much.
>> Below is my private patch which can be used to built specific dts
>> into the linux kernel, therefore make the verification easier.
> Hi Jingfeng,
>
> In kernel world we take care all the stuff we touched ourself :-)
>
> If you are not confident with them please drop those DTS from the 
> patchset
> besides the generic one. I can do the rest for you after getting this 
> set merged.
>
> Thanks.
> - Jiaxun
>
Hi, Jiaxun

Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
How does the kernel get the dtb is another big issue, either from built-in
dtb or pass from the firmware(pmon and uefi etc). This should be
solved with another patch carefully. Providing board specific dts
helps to code review, it helps reviewers understand that there are
variant boards and have to be express with different OF graph.

Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
Suppose loongson have 1000+ different board, do you want built all
of them into vmlinuz?

Besides, ls7a1000 and ls2k1000 lack a i2c driver, gpio driver,
pwm driver, clk driver, can you pay more attention to salve those
problems, please ?

