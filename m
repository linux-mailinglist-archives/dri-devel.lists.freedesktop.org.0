Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEEB17B7E4
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA946EC73;
	Fri,  6 Mar 2020 08:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B916E34C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 15:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 10B6A296C1B
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
 <CAFqH_53crnC6hLExNgQRjMgtO+TLJjT6uzA4g8WXvy7NkwHcJg@mail.gmail.com>
 <CA+E=qVfGiQseZZVBvmmK6u2Mu=-91ViwLuhNegu96KRZNAHr_w@mail.gmail.com>
 <CAFqH_505eWt9UU7Wj6tCQpQCMZFMfy9e1ETSkiqi7i5Zx6KULQ@mail.gmail.com>
 <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <5245a8e4-2320-46bd-04fd-f86ce6b17ce7@collabora.com>
Date: Thu, 5 Mar 2020 16:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CA+E=qVff5_hdPFdaG4Lrg7Uzorea=JbEdPoy+sQd7rUGNTTZ5g@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vasily,

On 14/2/20 23:22, Vasily Khoruzhick wrote:
> On Fri, Feb 14, 2020 at 2:20 PM Enric Balletbo Serra
> <eballetbo@gmail.com> wrote:
>>
>> Hi Vasily,
>>
>> Missatge de Vasily Khoruzhick <anarsoul@gmail.com> del dia dv., 14 de
>> febr. 2020 a les 23:17:
>>>
>>> On Fri, Feb 14, 2020 at 1:53 PM Enric Balletbo Serra
>>> <eballetbo@gmail.com> wrote:
>>>>
>>>> Hi Vasily,
>>>>
>>>> Missatge de Vasily Khoruzhick <anarsoul@gmail.com> del dia dv., 14 de
>>>> febr. 2020 a les 22:36:
>>>>>
>>>>> On Thu, Feb 13, 2020 at 6:54 AM Enric Balletbo i Serra
>>>>> <enric.balletbo@collabora.com> wrote:
>>>>>>
>>>>>> From: Nicolas Boichat <drinkcat@chromium.org>
>>>>>>
>>>>>> ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
>>>>>> that has an internal microcontroller.
>>>>>>
>>>>>> The only reason a Linux kernel driver is necessary is to reject
>>>>>> resolutions that require more bandwidth than what is available on
>>>>>> the DP side. DP bandwidth and lane count are reported by the bridge
>>>>>> via 2 registers on I2C.
>>>>>
>>>>> It is true only for your particular platform where usb-c part is
>>>>> managed by firmware. Pinephone has the same anx7688 but linux will
>>>>> need a driver that manages usb-c in addition to DP.
>>>>>
>>>>> I'd suggest making it MFD driver from the beginning, or at least make
>>>>> proper bindings so we don't have to rework it and introduce binding
>>>>> incompatibilities in future.
>>>>>
>>>>
>>>> Do you have example code on how the ANX7866 is used in pinephone?
>>>> There is a repo somewhere?
>>>
>>> I don't think it's implemented yet. I've CCed Icenowy in case if she
>>> has anything.
>>>
>>
>> It would be good to join the effort. Just because I am curious, there
>> are public schematics for the pinephone that is using that bridge?
> 
> Schematics is available here:
> https://wiki.pine64.org/index.php/PinePhone_v1.1_-_Braveheart#Schematic
> 

Would you mind to check which firmware version is running the anx7688 in
PinePhone, I think should be easy to check with i2c-tools.

Thanks in advance,
 Enric

[snip]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
