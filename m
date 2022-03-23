Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926F4E4B3C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 04:08:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07110E18E;
	Wed, 23 Mar 2022 03:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C24A10E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:08:04 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:51852.492916150
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id CB0F11002BB;
 Wed, 23 Mar 2022 11:07:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 73c6cd2c2177406cb813e64aa6784a6a for jiaxun.yang@flygoat.com; 
 Wed, 23 Mar 2022 11:08:01 CST
X-Transaction-ID: 73c6cd2c2177406cb813e64aa6784a6a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <e0d3648e-3055-9f9b-878d-0fc22a93a806@189.cn>
Date: Wed, 23 Mar 2022 11:07:57 +0800
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
 <abe784ce-eb9e-0143-dbc3-d415bbedbb81@189.cn>
 <87d4f869-2ae8-f8d3-a55f-1a563cb21115@flygoat.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <87d4f869-2ae8-f8d3-a55f-1a563cb21115@flygoat.com>
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
Cc: devicetree@vger.kernel.org, liyi@loongson.cn, chenhuacai@kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/23 10:29, Jiaxun Yang wrote:
>
>
> 在 2022/3/23 1:53, Sui Jingfeng 写道:
>> Hi, Jiaxun
>>
>> Build all dts into vmlinuz will make the vmlinuz bigger and bigger.
>> How does the kernel get the dtb is another big issue, either from 
>> built-in
>> dtb or pass from the firmware(pmon and uefi etc). This should be
>> solved with another patch carefully. Providing board specific dts
>> helps to code review, it helps reviewers understand that there are
>> variant boards and have to be express with different OF graph.
> Hi,
>
> I insist my taste on those code. If the only intention is to demonstrate
> the usage of the driver then please just leave them in dt document
> or commit message.
>
>>
>> Now, there are about 6 dts under arch/mips/boot/dts/loongson/,
>> Suppose loongson have 1000+ different board, do you want built all
>> of them into vmlinuz?
> Note that we are supporting all those boards on "platform" bias. Which
> means if they share similar design then they will use the same DTS.
> If we have a new design then unfortunately our kernel binary must grow.
>
> For those who intended to build a size-optimized kernel they will be
> able to disable unused DTS in Kconfig.
>
> If you want to blame somebody for the problem then please don't
> blame us. We tried very hard to fit all those stuff into kernel's model
> of devices. You should blame those who did the initial design of
> Loongson's boot interface that failed to introduce a proper way
> to describe the platform.
>
>>
>> Besides, ls7a1000 and ls2k1000 lack a i2c driver, gpio driver,
>> pwm driver, clk driver, can you pay more attention to salve those
>> problems, please ?
> Are you trying to make a TODO list for your colleague :-)
>
> We , community developers, don't owe you anything. So please
> don't expect anything from us. I lost access to most Loongson
> devices since I'm currently study abroad, but I'm determined to
> keep platform code in a good shape. That's my duty as a maintainer.
>
> Thanks.
> - Jiaxun

Providing a few board specific dts doesn't hurt anybody.

Can we leave the problem(passing correct dts to the kernel) untouched and

solve it in the feature with a another patch, ok?

