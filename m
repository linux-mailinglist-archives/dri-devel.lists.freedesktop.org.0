Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8260A455C91
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 14:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6486ECDC;
	Thu, 18 Nov 2021 13:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Thu, 18 Nov 2021 13:22:09 UTC
Received: from smtphy.263.net (sg-smtp01.263.net [54.255.195.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21A76ECD9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 13:22:09 +0000 (UTC)
Received: from smtp.263.net (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id BD3179E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 21:14:33 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.233])
 by smtp.263.net (Postfix) with ESMTP id 5BD6F18C0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 21:14:30 +0800 (CST)
Received: from localhost (unknown [192.168.167.70])
 by regular1.263xmail.com (Postfix) with ESMTP id 8C9EF14A0;
 Thu, 18 Nov 2021 21:14:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from [172.16.12.89] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31296T140158641805056S1637241264970100_; 
 Thu, 18 Nov 2021 21:14:26 +0800 (CST)
X-IP-DOMAINF: 1
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-RCPT-COUNT: 13
X-LOCAL-RCPT-COUNT: 2
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-UNIQUE-TAG: <733c4135ae7513b928b6ecc7489c4be9>
X-System-Flag: 0
Subject: Re: [PATCH v1 00/12] drm/rockchip: RK356x VOP2 support
To: Daniel Stone <daniel@fooishbar.org>, Kever Yang <kever.yang@rock-chips.com>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <3bbf42f3-bd9c-ed66-e421-8d78fbeb22ad@rock-chips.com>
 <4310886.V3yF0ifEZO@diego>
 <CAPj87rPNSt7nZX93prAYD3Emf-34RdTZWp_1TOuAybBebObZhQ@mail.gmail.com>
 <fba695b7-863a-c492-0209-41bc07c7baee@rock-chips.com>
 <CAPj87rO86Mom-076Z5QX9hd=0bQi=AQcofkc1fSR4-VV2Zo6aQ@mail.gmail.com>
From: Andy Yan <andy.yan@rock-chips.com>
Message-ID: <e948ee33-d1ea-cd53-a792-2e044eed1529@rock-chips.com>
Date: Thu, 18 Nov 2021 21:14:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAPj87rO86Mom-076Z5QX9hd=0bQi=AQcofkc1fSR4-VV2Zo6aQ@mail.gmail.com>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel:

On 11/18/21 8:07 PM, Daniel Stone wrote:
> Hi Kever,
>
> On Thu, 18 Nov 2021 at 10:50, Kever Yang <kever.yang@rock-chips.com> wrote:
>> On 2021/11/18 下午5:53, Daniel Stone wrote:
>>> Exactly what Heiko said. If you would like to upstream the driver then
>>> that would be fantastic to see, but I'm afraid you do not get to
>>> prevent someone else from doing the work themselves.
>> First of all, we never stop any one to doing there work on upstream if
>> the source code is write totally by themselves.
>>
>> Second, there are also many modules are upstream by developers based on
>> Rockchip source code, please note that
>> all of them have basic respect to our work, they do communicate with us
>> first.
>>
>> But this committer do not take any respect to our engineers and their
>> hard working:
>> - He didn't contact with us;
>> - There isn't  any information about original author in the commit message;
>>       As I have known, if I use source code from another developer, I
>> need to at least add a "Signed-off-by" with original author;
>> - This commit and mail does not even have a 'CC' to original author.
>>
>> I NAK because I  think this is not part of the  open source spirit, and
>> this kind of  behavior should not be encouraged.
> OK, I see where you're coming from, and I agree that the attribution
> should have been handled more carefully.
>
> On the other hand, please consider this from the other perspective.
> Sascha has been free to take the downstream Rockchip BSP code and
> attempt to upstream it to the Linux kernel, which you are unhappy
> about. But then the Rockchip driver was developed totally downstream,
> with no attempt to ever communicate with the upstream Linux or DRM/KMS
> developers. Rockchip advertises that it is shipped as a Linux kernel
> with a KMS driver. But we were never informed, or CCed, or anything.
>
> If you would like the community to more actively work with you - then
> please yourself work more actively with the community. The first
> commit of the VOP2 driver was in July 2020, and that was of the full
> driver so presumably it started quite some time before then. So that
> is a minimum of 17 months that you have had to engage with upstream
> ...
>
> Technically, the driver cannot be upstreamed as-is. It looks as if it
> were a pre-atomic driver, that was half-converted to atomic, and then
> has been half-converted to atomic helpers as well. Things like
> reference counting and global state are not handled correctly at all.
> You can see this if you try to run Weston on top of the VOP2 driver:
> the framerate is decimated because the event handling massively
> over-synchronises, and the event timestamps which arrive are
> incorrect. This would be fixed by correctly using the event helpers
> that we have had in the tree for years (which would also eliminate the
> unnecessary framebuffer reference handling). It also does not work
> with the GPU drivers in the tree because it lacks the one-liner to
> correctly handle dma_resv synchronisation, which makes it both too
> fast as it displays content which is not ready, and too slow because
> it can't do it at full frame rate.


We have different team run Android , X11, Weston on rk356x, especially 
for android, we can run at 60 fps.

Our vop2 driver is developed on Linux 4.19, am not sure which version of 
kernel you put our drivers on.

>
> Similarly, on the RK3566 EVB, the DSI does not work unless HDMI is
> also active, but when HDMI is active at the same time as DSI, it just

I am very sure rk3566 evb DSI can work without HDMI.

But take care that the vop on rk3566 has a special limitation: there are 
three

windows(Cluster1/Esmart1/Smart1) that have a mirror lock, that means they

can't be programed framebuffer address independently , they can only

share framebuffer address with Cluster0/Esmart0/Smart0. We use these feature

on Android.

I have comment these limitation in our driver.

Compared to old vop, vop is strong but a bit complicated, we try very had to

make it work on as much display framework as possible.

We have upstream plane, but I am really in a rush this year. So sorry 
for the late of upstream, but we glad to work with community.

So Sascha, please feel free to go on with your work.

> shows a blank screen. I believe the root cause of this is that the
> VOP2 driver does not use any of the atomic state correctly, and
> instead stores its own state in driver-global structures, using a lot
> of unnecessary mutexes to try to synchronise this state. Not only does
> this synchronisation not actually work, but it causes a severe
> performance degradation due to mutex contention.
>
> I believe the best path forward to an upstream VOP2 driver is a patch
> series consisting of:
>    - start from a blank slate, using the atomic framework and helpers
> as they were intended to be, with basic support for the VOP2 and one
> or two connector types, doing linear XRGB only
>    - any cleanups which would enable this to share more code with
>    - add YUV support, including planar buffers
>    - add AFBC support, with the AFBC enable/disable correctly
> synchronised through atomic state (this is necessary since the AFBC
> decoder is not directly on the planes per se but shared)
>    - add more connector types
>    - add writeback support
>    - add other Rockchip-specific codepaths such as HDR10
>
> Cheers,
> Daniel
>
>
>


