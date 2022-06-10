Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD5546E01
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372AD10E270;
	Fri, 10 Jun 2022 20:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDE710E270
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:06:33 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MZCvh-1oCjSL2Cor-00VABk; Fri, 10 Jun 2022 22:06:24 +0200
Message-ID: <8ebe4d75-0abd-cb90-f3d0-dfc8c0cab1c2@i2se.com>
Date: Fri, 10 Jun 2022 22:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Peter Robinson <pbrobinson@gmail.com>, Peter Mattern <pmattern@arcor.de>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
 <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
 <CALeDE9OkN5Vq-_L=VzSdKK0=6dKrNBX1q3zm3ZaNX8Jy9VJ35w@mail.gmail.com>
 <fb2035d3-5322-7b03-e9fc-89ce1f892db6@i2se.com>
In-Reply-To: <fb2035d3-5322-7b03-e9fc-89ce1f892db6@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:yD67V/9WqA1ib/cUMvWfIJD1zj6JdOl15XjKhtMVCCx7s072WHa
 CMLPwo3PSHUClj15oXWh2EzJBs6MD08WSCrIodYd7CE5/gy6si+fE+bi/6Cq3BuLALA6v5a
 grgaZKglaPQeq4whSZdVkjT2rGp+Fk27xl55NGCZLLEJpQmEvvcCzLDaW1Z3V8qp5OavUdG
 xRdXuxlNYisLol+IgySeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A90LunTwC+c=:LNt2oe08OljzfnUzeF6k3K
 OQWXzJ6WNtlT9RjuVUAxnrzJVNn8IHjutJGQbyvNmMEKhbsBGLTaG+bnpqZDLc1ZPZhXWf/3U
 ClCspVX0JOPPgWwyQcm561TIoOEoa46ComNyCiB9AkiAYj9QyCTNA0mAMkqeWJtVp0ayKxSEF
 iHfPB/MbHG3h+aFvmIopXzfFLkvalJWuKRYwzhsDnagbFrMhSabBtdYQCt0KRIrm2jgcUH9hr
 //vNqdM6LHd3Nllh2qU/yXoy0Cz9kTxz3fjYTAzdQcqcF8K7mOCdMJQifIclZ6SqYNq3zACcY
 fbpUW5qnQAF1wAVuJEc+xzUKp/uGrPmma7Q/nWeHsCTLAomUr4th8zGZYkW9/KB9kVenAOOai
 UonvqMDP/YqcjGeyxodv5QamTNaHEanvBEmZD6zZy64X+pHtqkkEueVqdDS2z/xfaCTk+UNW1
 BiKq6hm9DtzK2Aw/fcN4hfqF/sz/GGSCOcjHH0EwZgo3xdadEjBr9tfbmQ/uHpA+wlDtK+YL3
 Wa+ba+O7iZqYosoEBlMS8PHDMZUGKDzG7RzQYnk+sbZJEd5sl9ZMF9oJCbFdOXZh2wYGgHWPB
 NtQTGUtDoHyHqs1PY/4e5zWUbLBnwn27fvKRgeIpECfJph1H2IJkV7N5K4Nvwep2f+k9eV5p2
 B1uszZu6LTEepDx1sDxpd+0qLeTu1gwD1qBuycsvKBnnpVyuosXgJBp4CK8j3c9BYs2PCfTl6
 +NyvL3CJqbqUn5JnxBCoaYpYlYtaSj18a29st0eSbpRQoRqIZF9+sSaoBzA=
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 09.06.22 um 23:33 schrieb Stefan Wahren:
> Hi Peter,
>
> Am 09.06.22 um 13:52 schrieb Peter Robinson:
>>>>>> As of Linux 5.18.0, module vc4 apparently isn't working on 
>>>>>> Raspberry Pi
>>>>>> 3B any more.
>>>>>>
>>>>>> If a monitor is attached to the device, the boot messages show up as
>>>>>> usual, but right when KMS starts, the screen turns black. 
>>>>>> Similarly, the
>>>>>> screen also turns black when the module is blacklisted at boot 
>>>>>> time and
>>>>>> loaded from the running system.
>>>>>> The problem looks quite similar to the one posted some months ago 
>>>>>> in [1].
>>>> If I understand you properly, it results in a blank screen if the
>>>> monitor is connected, but the system is still responsive?
>>>>
>>>> If so, it's a very different problem than the link you provided, since
>>>> it was occurring when no monitor was connected and resulted in a total
>>>> system hang.
>>>>
>>>>>> Unfortunately, looking through systemd's journal didn't seem to 
>>>>>> yield
>>>>>> any real hint. Nevertheless, the results from grepping vc4 are
>>>>> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
>>>>> can confirm the regression. Maxime would know what might be up here?
>>> i assume you are using the downstream DTB?
>> In this case it's the one in the Linux kernel (not sure if that's
>> upstream or downstream in this context) not the one provided by the
>> RPi firmware.
>
> okay thanks. I tried the kernel config but its huge.
>
> Is it correct that the issue occurs with your kernel config, but not 
> with multi_v7_defconfig?

FWIW here is what i tried to reproduce the issue:

- enable CONFIG_DRM_VC4_HDMI_CEC
- apply the relevant config.txt options from Peter R.
- update my gcc toolchain to 11.3
- switch compiler optimization from speed to size

But the display always works.

Please tell the size of your bcm2837-rpi-3-b.dtb

