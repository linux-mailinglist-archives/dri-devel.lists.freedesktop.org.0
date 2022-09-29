Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5595EF6D7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C8010EA84;
	Thu, 29 Sep 2022 13:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD9010EA84
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:46:13 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M8xwu-1oYyRZ22H0-0066Td; Thu, 29 Sep 2022 15:46:03 +0200
Message-ID: <a659a49d-6609-4c1a-d01b-86f8f7e9740d@i2se.com>
Date: Thu, 29 Sep 2022 15:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
 <20220927094200.2cfw2ukick3oqr4a@houat>
 <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
 <20220927114240.xilpcte2s3b5bmcf@houat>
 <20220927122512.h5tsnhbjivcnesph@houat>
 <20220927131517.3yyuswqlndcwr4pz@houat>
 <20220929093513.cp2pbnbgesw3mgoy@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220929093513.cp2pbnbgesw3mgoy@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ufmWP4D6+sIfVgTub5zqBATRYE1KmOKQBjEm12G6z7GFUmP3bil
 iaoL+CR7ECzPxU/xNz/URItMdUggo8WWehkiVX457lYzXMBZr7/wYLzOlGZGTXPgzSVE6IG
 mrhO9FXhy2WhHqoRWAKfVzLFsu/piuEbmePK8EMBsOcLrC4LSGVD+cWBK7xGR9Mh8+47qbH
 VfH/7wYnETqAdHOfz5NIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dzybu1bniyA=:hYAubmQCo5/if1G5pPAPQR
 Ogca4A435QUM6Wba6+CVdFg/pfY/umGTeOhPsfXZu2wIWzDGVQkRGFluli5kSpUA1G0wWyHDW
 yWuDzqtDn1Ct7SaK3LSShS37tR1C+xK79X0yYJbHjlG/H1LjO/nKLva2hIQmocx7zbJw99zk8
 aQHrOl2kMIdSK7nTMXDrHf3ohwpJo1V+AMrofvtCIomyik6M7zSs6eu1Kb74IbswKXz5R9yWz
 CLOFKSADsLifXPI6hAhw04woQVe0dD994EcIbxc++DJXzK5371fWuaXmdcowynaFzbdjfiJhm
 VMsJLuCemFlnoFSs0kopPdZDPQ6HkGo+W5yiAVER9FBxmx79wbmeA0guWIBc+Qx2RShzdCVyk
 h6jsSU7ZUUyOspzHIIbCjL3dhvOQtVIQ3iai4T8Uvvs2uzzLdsZQbfTB4KZUY1f93K1JkTD2y
 t2RkWeYQdRBiKc3JCm9HWIHXq04T3qSK89gZkEOjod5A5CFgKiCdjGBvjPs3P7KHDnLVdKdr4
 k7owLGb/7wp+Bn85F4O70FBq39LrGzcII45du8++1D00vgT6OI6NDriSrN4j6doBB/jhjrmeU
 qWkv5WClBPRXYxXzZD5cyh1Ufko9SQyXzIiqouVyONzOyNc58uvHMsXTcXn5YHl0lh96fb1iG
 iiQuIrnzHgDM3M4MtvpQIcluW3fW2lsdtQAis7Abjpfc3Z2r0ghf3L8bwSzbwb3TML7/PNbTp
 pkBo1t/oh8Vs7IntQlgflgXxP0kS9OE3ozvBrKXoWRmF7jFCamQKOS2grgFvJVnPaXppNwOIz
 anC46Xh
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.09.22 um 11:35 schrieb Maxime Ripard:
> On Tue, Sep 27, 2022 at 03:15:17PM +0200, Maxime Ripard wrote:
>> On Tue, Sep 27, 2022 at 02:25:12PM +0200, Maxime Ripard wrote:
>>> On Tue, Sep 27, 2022 at 01:42:40PM +0200, Maxime Ripard wrote:
>>>> On Tue, Sep 27, 2022 at 01:12:35PM +0200, Stefan Wahren wrote:
>>>>> Am 27.09.22 um 11:42 schrieb Maxime Ripard:
>>>>>> On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
>>>>>>> Hi Stefan,
>>>>>>>
>>>>>>> On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
>>>>>>>> Am 26.09.22 um 14:47 schrieb Maxime Ripard:
>>>>>>>>> On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
>>>>>>>>>> On 26.09.2022 14:08:04, Stefan Wahren wrote:
>>>>>>>>>>> Hi Marc,
>>>>>>>>>>>
>>>>>>>>>>> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
>>>>>>>>>>>> On 22.09.2022 17:06:00, Maxime Ripard wrote:
>>>>>>>>>>>>>> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
>>>>>>>>>>>>>> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>>>>>>>>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
>>>>>>>>>>>>>> 9-01)
>>>>>>>>>>>>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
>>>>>>>>>>>>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> As soon a the vc4 module is loaded the following warnings hits 4
>>>>>>>>>>>>>> times, then the machine stops.
>>>>>>>>>>>> [...]
>>>>>>>>>>>>
>>>>>>>>>>>>> The warning itself is fixed, both upstream and in stable (5.19.7).
>>>>>>>>>>>> Ok. Debian is using 5.19.6
>>>>>>>>>>>>
>>>>>>>>>>>>> It shouldn't have any relation to the hang though. Can you share your
>>>>>>>>>>>>> setup?
>>>>>>>>>>>> - config.txt:
>>>>>>>>>>>>
>>>>>>>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>>>>>>>> gpu_mem=16
>>>>>>>>>>>> disable_splash=1
>>>>>>>>>>>>
>>>>>>>>>>>> arm_64bit=1
>>>>>>>>>>>> enable_uart=1
>>>>>>>>>>>> uart_2ndstage=1
>>>>>>>>>>>>
>>>>>>>>>>>> os_prefix=/u-boot/
>>>>>>>>>>>>
>>>>>>>>>>>> [pi3]
>>>>>>>>>>>> force_turbo=1
>>>>>>>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>>>>>>>>
>>>>>>>>>>>> - Raspberry Pi 3 Model B+
>>>>>>>>>>>> - no HDMI connected
>>>>>>>>>>> Does it mean, the issue only occurs without HDMI connected?
>>>>>>>>>>> If you didn't test with HDMI yet, could you please do?
>>>>>>>>>> The error occurs with HDMI not connected, as vc4 is the gfx driver I
>>>>>>>>>> thought this might be of interest. :)
>>>>>>>>>>
>>>>>>>>>> I don't have a HDMI monitor here, but I'll come back to you as soon as I
>>>>>>>>>> get access to one (might take some time).
>>>>>>>>> It's not the first time an issue like this one would occur. I'm trying
>>>>>>>>> to make my Pi3 boot again, and will try to bisect the issue.
>>>>>>>> yes the issue is only triggered without HDMI connected. I was able to
>>>>>>>> reproduce with an older vc4 firmware from 2020 (don't want to upgrade yet).
>>>>>>>> Kernel was also an arm64 build with defconfig.
>>>>>>>>
>>>>>>>> Here some rough starting point for bisection:
>>>>>>>>
>>>>>>>> 5.18.0 good
>>>>>>>> 5.19.0 bad
>>>>>>>> 5.19.6 bad
>>>>>>> Sorry it took a bit of time, it looks like I found another bug while
>>>>>>> trying to test this yesterday.
>>>>>>>
>>>>>>> Your datapoints are interesting though. I have a custom configuration
>>>>>>> and it does boot 5.19 without an HDMI connected.
>>>>>>>
>>>>>>> So I guess it leaves us with either the firmware version being different
>>>>>>> (I'm using a newer version, from March 2022), or the configuration. I'll
>>>>>>> test with defconfig.
>>>>>> So it turns out compiling vc4 as a module is the culprit.
>>>>> Do you mean regardless of the kernel version in your case?
>>>> No, I mean that, with vc4 as a module, 5.18 works but 5.19 doesn't, like
>>>> Marc said. But if vc4 is built in, both work.
>>>>
>>>>> In my test cases i build vc4 always as module.
>>>>>
>>>>>> It's not clear to me why at this point, but the first register write in
>>>>>> vc4_hdmi_reset stalls.
>>>>> Sounds like timing issue or a missing dependency (clock or power domain)
>>>> It felt like a clock or power domain issue to me indeed, but adding
>>>> clk_ignore_unused and pd_ignore_unused isn't enough, so it's probably
>>>> something a bit more complicated than just the clock / PD being
>>>> disabled.
>>> I found the offending patch:
>>> https://lore.kernel.org/dri-devel/20220225143534.405820-13-maxime@cerno.tech/
>>>
>>> That code was removed because it was made irrelevant by that earlier patch:
>>> https://lore.kernel.org/dri-devel/20220225143534.405820-10-maxime@cerno.tech/
>>>
>>> But it turns out that while it works when the driver is built-in, it
>>> doesn't when it's a module. If we add a clk_hw_get_rate() call right
>>> after that call to raspberrypi_fw_set_rate(), the rate returned is 0.
>>>
>>> I'm not entirely sure why, but I wonder if it's related to:
>>> https://github.com/raspberrypi/linux/issues/4962#issuecomment-1228593439
>> Turns out it's not, since the Pi3 is using the clk-bcm2835 driver.
>>
>> However, even reverting that patch fails. clk_set_min_rate fails because
>> the rate is protected, but it doesn't look like it is anywhere for that
>> clock, so I'm a bit confused.
>>
>> Even if we do remove the clock protection check in
>> clk_core_set_rate_nolock(), clk_calc_new_rates() will then fail because
>> the bcm2835 driver will round the clock rate below the minimum, which is
>> rejected.
>>
>> I'm not entirely sure what to do at this point. I guess the proper fix
>> would be to:
>>    - Figure out why it's considered protected when it's not (or shouldn't be)
>>    - Make the driver compute an acceptable rate for that clock
> This was due to 5.19.7 missing 88110a9f6209

Do you really mean this commit ("clk: bcm2835: fix 
bcm2835_clock_choose_div")?

I think this is applied in 5.19.7:

https://elixir.bootlin.com/linux/v5.19.7/source/drivers/clk/bcm/clk-bcm2835.c#L944

>
>>    - Reintroduce the clk_set_min_rate call to HDMI's runtime_resume, or
>>      some other equivalent code
> I just sent a series addressing this here:
> https://lore.kernel.org/r/20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech
Thanks
>
> Thanks for the report and the help :)
> Maxime
