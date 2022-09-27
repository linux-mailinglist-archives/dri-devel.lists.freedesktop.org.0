Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D835EBDDA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 10:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10710E0B4;
	Tue, 27 Sep 2022 08:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA50D10E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 08:56:13 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYvTy-1ohWF93u2i-00UpHW; Tue, 27 Sep 2022 10:56:04 +0200
Message-ID: <92ae063d-1db6-54bf-7d62-5691e8042c45@i2se.com>
Date: Tue, 27 Sep 2022 10:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
 <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
 <20220927072554.y4yrmgtlaim4b5mv@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220927072554.y4yrmgtlaim4b5mv@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GH8AD7Kq+Qk4u69U13/HcuM0ShSYbpXOL1bKZqqjagyMIQJazya
 jp8i1u1EhsZg6ITRJTAE/mFqVj9BPG/6kh95olS+g2uA+8ZAO3dBtmQm0ve4RtVNN6fCQ7v
 ga1dLvJHoTZD2IMVB7gY1jTqkM3/CUzl6+sBOBl4ZgEFirOPj5+q9pIL+E9jO3yER60zgqs
 PJaSkj2et7WjmK3vYTIXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YRQ8Nu9k3CU=:nhMdpkzzyVLmObfco5lGms
 CVFBA82TjM+LhxBO3H2oi5NFhKYBZWjfoVTcNFUrrSa+AbU7u+9tlf4iR8VVAr/REiGn9oZwE
 3anzocbP9Hh2bEFKTFXPH+jhEo5yFeYA1azqtt2bdKKkalU4BY424pMinVKCgN49w0KNQdV9i
 ryYvFklm+nK1laL7NdsS2nzOP6SP7SnBmAT0hiB6F68AIG0ZV0zjQFDLuJFqWG7v1OKXEUl6J
 J/7Dq3kbymohcU/xDEbyp25gpAx7opFWjuZToOOwt+c4kQPeU8UlK/PDDLbot50TOdOKBY6Ez
 42eW3Jv/0OygvL8ca/PCOrItrOxRZakDQYPBVBEvesVIXD4pifcJFuuaqf86HwMuyLWHQ0Qoq
 nNIixxqPI9CNsF32B14YcUk49Gy6B39rdnMExw8elNpQ22JEaD43h3E76G9XK3/mAopuTE8mm
 1sCjtAbppqIVD2Wn/bbu+NP9UpPOh0oYFdUC3r/5bbHfRYKlhFFW6fXUluBMz+Jtcnbz9FpGq
 BJ+GsFOGYA3KFJobrPOWAfMpmjNbc0C9C/1PaV35NDCDsZ+Ixm8Uadsx/wTt9U9fZcrmD/OCe
 F8BHCTCgnlOBrm18aN4Sf5D9j9opxuFulid5qAGyhvAM+tvWeyyufe5QWf+NWksVDi32TrdOP
 UnsHGjVHkDdZiB+TS+BDVwmNsqNKmoZeWIfqxY2KRawU4CuCxxZmp0G6FLLgo8Ia5oIBFMesZ
 Uzn5YWG0dHycHVXLJrBw9MmaskAL5JUq9s8FOqH8KcUyxXOR9YXL6tn2i7pVT0harFtOnRmdE
 PRPKmUL
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
Cc: regressions@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 27.09.22 um 09:25 schrieb Maxime Ripard:
> Hi Stefan,
>
> On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
>> Am 26.09.22 um 14:47 schrieb Maxime Ripard:
>>> On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
>>>> On 26.09.2022 14:08:04, Stefan Wahren wrote:
>>>>> Hi Marc,
>>>>>
>>>>> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
>>>>>> On 22.09.2022 17:06:00, Maxime Ripard wrote:
>>>>>>>> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
>>>>>>>> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>>>>>>>>
>>>>>>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
>>>>>>>> 9-01)
>>>>>>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
>>>>>>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>>>>>>>>
>>>>>>>> As soon a the vc4 module is loaded the following warnings hits 4
>>>>>>>> times, then the machine stops.
>>>>>> [...]
>>>>>>
>>>>>>> The warning itself is fixed, both upstream and in stable (5.19.7).
>>>>>> Ok. Debian is using 5.19.6
>>>>>>
>>>>>>> It shouldn't have any relation to the hang though. Can you share your
>>>>>>> setup?
>>>>>> - config.txt:
>>>>>>
>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>> gpu_mem=16
>>>>>> disable_splash=1
>>>>>>
>>>>>> arm_64bit=1
>>>>>> enable_uart=1
>>>>>> uart_2ndstage=1
>>>>>>
>>>>>> os_prefix=/u-boot/
>>>>>>
>>>>>> [pi3]
>>>>>> force_turbo=1
>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>>
>>>>>> - Raspberry Pi 3 Model B+
>>>>>> - no HDMI connected
>>>>> Does it mean, the issue only occurs without HDMI connected?
>>>>> If you didn't test with HDMI yet, could you please do?
>>>> The error occurs with HDMI not connected, as vc4 is the gfx driver I
>>>> thought this might be of interest. :)
>>>>
>>>> I don't have a HDMI monitor here, but I'll come back to you as soon as I
>>>> get access to one (might take some time).
>>> It's not the first time an issue like this one would occur. I'm trying
>>> to make my Pi3 boot again, and will try to bisect the issue.
>> yes the issue is only triggered without HDMI connected. I was able to
>> reproduce with an older vc4 firmware from 2020 (don't want to upgrade yet).
>> Kernel was also an arm64 build with defconfig.
>>
>> Here some rough starting point for bisection:
>>
>> 5.18.0 good
>> 5.19.0 bad
>> 5.19.6 bad
> Sorry it took a bit of time, it looks like I found another bug while
> trying to test this yesterday.
>
> Your datapoints are interesting though. I have a custom configuration
> and it does boot 5.19 without an HDMI connected.
i will try to bisect this, too.
>
> So I guess it leaves us with either the firmware version being different
> (I'm using a newer version, from March 2022), or the configuration. I'll
> test with defconfig.
>
> Maxime
