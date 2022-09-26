Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FD65EB086
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 20:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3728510E4F2;
	Mon, 26 Sep 2022 18:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48510E4F2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:50:21 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MSKly-1onnFl1lZw-00Sh5w; Mon, 26 Sep 2022 20:50:13 +0200
Message-ID: <7f334d11-9517-6423-572b-998f678e5718@i2se.com>
Date: Mon, 26 Sep 2022 20:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Marc Kleine-Budde <mkl@pengutronix.de>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
 <20220922150600.h4srjmgxc52qiv6r@houat>
 <20220926102130.eeekt5skt4mav5f4@pengutronix.de>
 <63b460d1-4e2f-b0f1-836d-9178bb19f609@i2se.com>
 <20220926124048.i3lxy4lvtq756trp@pengutronix.de>
 <20220926124743.5s7x3dwhzienqs3x@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220926124743.5s7x3dwhzienqs3x@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Bm1yeoD6pg089lnnP7UGht2JhPvekuwzQfQg1ZUwFVzes48BKB8
 COMVvLAthEf5Lk3I4gicarBuCYsOahLN5rAMstnI1sWbcz5VUpqmGwno8INeu88hlGSjsgT
 O/CHdKYn75Z6ETLzYGPQbWUrf9H4OUhm96DWjUldeILw9gRtuaNoVuMLW6a3VdvrxZGH+BP
 koLGPYDUpoHnuzrhm7Rwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xm2GDNSDAtA=:XjQ1IFiNkdDwYxVQ4S0FO/
 lsJJkOQGEfCLYWmOjyWh0cO23X1x/TrNsVRBbIUYTgdYLdEkVuj/URvTEqWjtnh9gwvqjsT9i
 xxStKIGF5vcbpgdCmKywSrjGZ/tTECyRQ2M1auOIroF/myy8VgmdxRuH5cHkDI6R8dPt5QV+/
 kKrlN9W0S2ybFxeBaXsBJTg09q1Qs8S3pkumXvbkfZbFXvXRerBXUzcOhnfOt8hS54g8jBil6
 2qH+uOil3Zg67lnrDGlKmXR5+scSKcIe14XWfXCYAcj9mvdQARJwA2cR3H4LKPzNivut7NeJH
 +gxCuKkEB32Be4xBf8wgd6073T9To8giqMXdYhCHMhj12RIMXkEePk3dRi2TxMIeojMXhjLOA
 6wLqjN/v8bCXrSWzG5qmNGeanO6v4w0o/hZTHuh/+xDqlUb0zVzQrummkmxv522Y/622xeVU1
 Cn86asOwfB70XXFQFDJ8IbNxTBDfPRTrtuSVkEzRyQajJ9siLttf7HSQEeYbqdUcX49B9J6dH
 zJmdoCzn2y4hryB3LsMkRTj8RRKIJS2/YDStBn8qVZcWgik6nGktDgy0z8moZKQJtChOKVZD2
 nNegEUAi7NnZfDQAKRfToR0/dTuPDJ/QMPGqA6xZ1GC7/zKA92miPqggqyVIRJ/f037Ic+s6t
 9UpZra3vbUTYJ96EsNi7YJEqHFmNxG6RSDOoo/ZRasp0Vxwx0Hq7iqRdcbYj2W2c3x9NP6D1c
 IqJw9UTTpzFkGv8GrGIjF1aG1R6k7ASOXbxRBbmDTLI2hmQpUkz26YsPX4CTCPuvj2Rq0LnkH
 +fizlMi
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 26.09.22 um 14:47 schrieb Maxime Ripard:
> On Mon, Sep 26, 2022 at 02:40:48PM +0200, Marc Kleine-Budde wrote:
>> On 26.09.2022 14:08:04, Stefan Wahren wrote:
>>> Hi Marc,
>>>
>>> Am 26.09.22 um 12:21 schrieb Marc Kleine-Budde:
>>>> On 22.09.2022 17:06:00, Maxime Ripard wrote:
>>>>>> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
>>>>>> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>>>>>>
>>>>>> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
>>>>>> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian.org) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
>>>>>> 9-01)
>>>>>> | [    0.000000] Machine model: Raspberry Pi 3 Model B+
>>>>>> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware from 2022-03-24T13:21:11
>>>>>>
>>>>>> As soon a the vc4 module is loaded the following warnings hits 4
>>>>>> times, then the machine stops.
>>>> [...]
>>>>
>>>>> The warning itself is fixed, both upstream and in stable (5.19.7).
>>>> Ok. Debian is using 5.19.6
>>>>
>>>>> It shouldn't have any relation to the hang though. Can you share your
>>>>> setup?
>>>> - config.txt:
>>>>
>>>> -------->8-------->8-------->8-------->8--------
>>>> gpu_mem=16
>>>> disable_splash=1
>>>>
>>>> arm_64bit=1
>>>> enable_uart=1
>>>> uart_2ndstage=1
>>>>
>>>> os_prefix=/u-boot/
>>>>
>>>> [pi3]
>>>> force_turbo=1
>>>> -------->8-------->8-------->8-------->8--------
>>>>
>>>> - Raspberry Pi 3 Model B+
>>>> - no HDMI connected
>>> Does it mean, the issue only occurs without HDMI connected?
>>> If you didn't test with HDMI yet, could you please do?
>> The error occurs with HDMI not connected, as vc4 is the gfx driver I
>> thought this might be of interest. :)
>>
>> I don't have a HDMI monitor here, but I'll come back to you as soon as I
>> get access to one (might take some time).
> It's not the first time an issue like this one would occur. I'm trying
> to make my Pi3 boot again, and will try to bisect the issue.

yes the issue is only triggered without HDMI connected. I was able to 
reproduce with an older vc4 firmware from 2020 (don't want to upgrade 
yet). Kernel was also an arm64 build with defconfig.

Here some rough starting point for bisection:

5.18.0 good
5.19.0 bad
5.19.6 bad

>
> Maxime
