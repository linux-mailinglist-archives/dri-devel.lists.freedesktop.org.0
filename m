Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BD5EC0AE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 13:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8373E10E8DB;
	Tue, 27 Sep 2022 11:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6210E8DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 11:12:49 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N3sRi-1pKxeu3h9U-00zoFp; Tue, 27 Sep 2022 13:12:36 +0200
Message-ID: <40da8a17-5331-690b-3bd9-3317b0d0441c@i2se.com>
Date: Tue, 27 Sep 2022 13:12:35 +0200
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
 <20220927094200.2cfw2ukick3oqr4a@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220927094200.2cfw2ukick3oqr4a@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lGgJDx0FZhjBMBEw1lu78ApOu0dLclyngQTPUG0iPFDUPlYO0iP
 1qdG97Uq1nTOpEAlhJnnedsjKi9BVxBpeATlHByPpv392dhfjSPE2f4N/mlk0CjZhrIR2NF
 GriWRMbSkfdMdrRn3CsTXh6NINabYmgmEpDz3FOJs0S5TD8oWtRU3NqfCUfLo+7Zdgvc3+j
 CrZF6GaOGCeWdpwkw/Nqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fj/5VyTRU3I=:xefdXDksbyax5KSq7LgfaA
 0foVbbsm3GagyGb55SG9sSFVrVrYnMeW10M3vHE8/RTS8Y57ibg+6PS9hSTbJ3eCYOHNG5z3H
 oqIeMsHZ4A6cngs2yP2XAiCD1g9z72anvWmLSKYmajN4EE7J92nVQeDiAmkNCJuYx/4AqMOv8
 vwfNRsfj3en4SIRTt9ojSyX6ZAd0wxSm/qyWbCN6MgPNlm4wzGsJvKAnNvTTMN4ELt/KroAZU
 Me0/NcyQg2NkMt/tSwDhEb8Y2gS7VlUhyi+To/MsGfuj2x+PfrqTpBcj5xvi4tnhj+GtW66rD
 ApHdH90yFbysMTF5pPZFCma9MjGcrfl2+6rzmtW4fGV9fY0JjQTFRa1OBeexU4h/AGOtmERvr
 hl1bkrSowLof/WGfDY6V2sQir32P4gSr3qg+a/GCHMo9960HCTPWRdu7DG9cAMN7JR7Xgk097
 3YW3P5HcyIhK/4dyHWJJ807Fr5yIGttW315eKC9yIG1t08uh3bsae8TYhKrNiHbmHoOOFYp/c
 fZhPNT9PpLDe8M0Nu5kmTpXfSwX9zFK3K9VnoQGmwJltxuGeZ4nLykuKlcYfQAsPEqS2q4/es
 2DJZMfwabS/+1YOu9CL3fhNauwqO264DX1EDJtTPyIpAUo9I2XFy6XV/eHsum7Y8ygL+7tPpr
 5GgvJKVg9WtpPmH3V6ZZolzLRL73JyemVgKa11VVi2ZWQb/peT+kNiu+gijkkc9vWl8ite7Bj
 pg0jX+HJARfDKbU89SMf6SZwE5GnI0/b4jSPItDmcT4jDtLeIIpCkcKbhCDGJf+4wU16hr7qS
 0JNwQgB
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

Am 27.09.22 um 11:42 schrieb Maxime Ripard:
> On Tue, Sep 27, 2022 at 09:25:54AM +0200, Maxime Ripard wrote:
>> Hi Stefan,
>>
>> On Mon, Sep 26, 2022 at 08:50:12PM +0200, Stefan Wahren wrote:
>>> Am 26.09.22 um 14:47 schrieb Maxime Ripard:
>>>> On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
>>>>> On 26.09.2022 14:08:04, Stefan Wahren wrote:
>>>>>> Hi Marc,
>>>>>>
>>>>>> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
>>>>>>> On 22.09.2022 17:06:00, Maxime Ripard wrote:
>>>>>>>>> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
>>>>>>>>> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>>>>>>>>>
>>>>>>>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>>>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
>>>>>>>>> 9-01)
>>>>>>>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
>>>>>>>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>>>>>>>>>
>>>>>>>>> As soon a the vc4 module is loaded the following warnings hits 4
>>>>>>>>> times, then the machine stops.
>>>>>>> [...]
>>>>>>>
>>>>>>>> The warning itself is fixed, both upstream and in stable (5.19.7).
>>>>>>> Ok. Debian is using 5.19.6
>>>>>>>
>>>>>>>> It shouldn't have any relation to the hang though. Can you share your
>>>>>>>> setup?
>>>>>>> - config.txt:
>>>>>>>
>>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>>> gpu_mem=16
>>>>>>> disable_splash=1
>>>>>>>
>>>>>>> arm_64bit=1
>>>>>>> enable_uart=1
>>>>>>> uart_2ndstage=1
>>>>>>>
>>>>>>> os_prefix=/u-boot/
>>>>>>>
>>>>>>> [pi3]
>>>>>>> force_turbo=1
>>>>>>> -------->8-------->8-------->8-------->8--------
>>>>>>>
>>>>>>> - Raspberry Pi 3 Model B+
>>>>>>> - no HDMI connected
>>>>>> Does it mean, the issue only occurs without HDMI connected?
>>>>>> If you didn't test with HDMI yet, could you please do?
>>>>> The error occurs with HDMI not connected, as vc4 is the gfx driver I
>>>>> thought this might be of interest. :)
>>>>>
>>>>> I don't have a HDMI monitor here, but I'll come back to you as soon as I
>>>>> get access to one (might take some time).
>>>> It's not the first time an issue like this one would occur. I'm trying
>>>> to make my Pi3 boot again, and will try to bisect the issue.
>>> yes the issue is only triggered without HDMI connected. I was able to
>>> reproduce with an older vc4 firmware from 2020 (don't want to upgrade yet).
>>> Kernel was also an arm64 build with defconfig.
>>>
>>> Here some rough starting point for bisection:
>>>
>>> 5.18.0 good
>>> 5.19.0 bad
>>> 5.19.6 bad
>> Sorry it took a bit of time, it looks like I found another bug while
>> trying to test this yesterday.
>>
>> Your datapoints are interesting though. I have a custom configuration
>> and it does boot 5.19 without an HDMI connected.
>>
>> So I guess it leaves us with either the firmware version being different
>> (I'm using a newer version, from March 2022), or the configuration. I'll
>> test with defconfig.
> So it turns out compiling vc4 as a module is the culprit.

Do you mean regardless of the kernel version in your case?

In my test cases i build vc4 always as module.

> It's not clear to me why at this point, but the first register write in
> vc4_hdmi_reset stalls.
Sounds like timing issue or a missing dependency (clock or power domain)
>
> Maxime
