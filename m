Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11EC455967
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760D96EB74;
	Thu, 18 Nov 2021 10:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 33811 seconds by postgrey-1.36 at gabe;
 Thu, 18 Nov 2021 10:50:52 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17756EB74
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:50:52 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id E918E1F07;
 Thu, 18 Nov 2021 18:50:48 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.93] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P11048T139933178128128S1637232636527390_; 
 Thu, 18 Nov 2021 18:50:43 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-RCPT-COUNT: 13
X-LOCAL-RCPT-COUNT: 2
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <10bc3a32f56e19b283f58911be9c68e0>
X-System-Flag: 0
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Daniel Stone <daniel@fooishbar.org>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
 <4310886.V3yF0ifEZO@diego>
 <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
From: Kever Yang <kever.yang@rock-chips.com>
Message-ID: <fba695b7-863a-c492-0209-41bc07c7baee@rock-chips.com>
Date: Thu, 18 Nov 2021 18:50:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021/11/18 下午5:53, Daniel Stone wrote:
> Hi,
>
> On Thu, 18 Nov 2021 at 09:26, Heiko Stübner <heiko@sntech.de> wrote:
>> Am Donnerstag, 18. November 2021, 02:27:10 CET schrieb Kever Yang:
>>> I don't agree with this, we do believe you have do some clean up to meet
>>> the requirement
>>>
>>> of upstream, but all the framework and feature implement are from
>>> Rockchip engineer,
>>>
>>> we have made a great effort to make everything work which block us to
>>> upstream this driver for now.
>> I don't fully understand what you mean here (language barrier probably),
>> but dropping non-essential functionality in a first round is pretty common
>> to at least get basic functionality working for everyone. With the special
>> features getting added again in later patches over time. This happenened
>> on the old vop as well.
>>
>> And of course, having a kernel that can "just" do normal graphics without
>> the additional features is still preferable over having _NO_ graphics support
>> at all ;-)
>>
>>> NAK for this series.
>> As you might've seen from previous graphics related patches, there
>> is a big number of people _and companies_ that seems to want/need
>> to work with the rk3566/rk3568 with a kernel based on mainline.
>>
>> --> Most likely even in real products!
> Yes, we've been trying to ship a real product based on RK356x. We
> started by using the vendor VOP2 driver, but it is broken beyond
> belief. The driver needs a fundamental ground-up rework, and all the
> additional features get in the way of doing this core rework to make
> it actually function correctly.
>
> So, NAK to the NAK. I would like to see the VOP2 support start simple,
> with more features being added one by one.
>
>> While Rockchip did say that they want to upstream VOP2 support, there
>> has been _NO_ movement or even information at all on this over at least
>> the last year(!), so it's pretty understandable that developers will do this
>> themself at some point, because they don't want to wait anymore for
>> something that might never happen.
>>
>> So a simple "NAK" without additional information is not really helpful here.
>>
>> If you don't like Sascha's series, I really want to know _WHEN_ Rockchip
>> plans on upstreaming at least basic graphis support themself.
>>
>> The kernel is often called a do-ocracy - the one who does the work, gets
>> to decide. So if you really don't like Sascha's series at all, I do expect
>> Rockchip to step up and provide a solution themself - and in a usable
>> timeframe.
> Exactly what Heiko said. If you would like to upstream the driver then
> that would be fantastic to see, but I'm afraid you do not get to
> prevent someone else from doing the work themselves.

First of all, we never stop any one to doing there work on upstream if 
the source code is write totally by themselves.

Second, there are also many modules are upstream by developers based on 
Rockchip source code, please note that
all of them have basic respect to our work, they do communicate with us 
first.


But this committer do not take any respect to our engineers and their 
hard working:
- He didn't contact with us;
- There isn't  any information about original author in the commit message;
     As I have known, if I use source code from another developer, I 
need to at least add a "Signed-off-by" with original author;
- This commit and mail does not even have a 'CC' to original author.

I NAK because I  think this is not part of the  open source spirit, and 
this kind of  behavior should not be encouraged.


Thanks,
- Kever


