Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110BD709ACB
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 17:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C5310E48C;
	Fri, 19 May 2023 15:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CA110E4BD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1684508491; i=deller@gmx.de;
 bh=IvStUG7M7caLMwF7N6Ng6OWDFU0M3kDknkOML58D3Pk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=jtYyJParjfIBsNpIgeTEdiVFqdd9LTqw2BdjR+ZdEJJM7k5y0zmcYv5h2kl5wvHug
 paRBVQMxJ8zvUp0iwjydoD39mfx3tFSSXbw3xbqM4P+7iNj+jqIIPZpvF10KCdpfhX
 Vj8AXkeVMnZ+R1CrT+GUfI3pWr0dj9X91fu0GE7PI6riHtR+M9/mO2hKdozcmVV+n0
 w/41OIYSLgya0sDPt2JQJvzBUsI8q1c8vBYEV33ifZZHsLcFJTLq7IvsBUjhrWK1co
 xShXqgrx84ewMPdE+rXXcYIVGP6qjKFG6nvLzrP0S0kxKSOsFCm6eOwN/RVN/1wAtm
 vdw+LTeyWS3MA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.152.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE6F-1pjrEW2KKp-00KhXV; Fri, 19
 May 2023 17:01:31 +0200
Message-ID: <419e1dab-9a0c-d665-87bb-95647d2a9fab@gmx.de>
Date: Fri, 19 May 2023 17:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230516202257.559952-1-arnd@kernel.org>
 <CAMuHMdWgVsY8Ur7s9Xy1xMGxOW0WFXWq934aAE9Z884tGuWG_A@mail.gmail.com>
 <ZGeJsYmPU/7CHJRV@ls3530>
 <CAMuHMdVTGcVoNh3EUK-K--=X5kf+c5Un6aDms-gP3QhgEKZUwg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdVTGcVoNh3EUK-K--=X5kf+c5Un6aDms-gP3QhgEKZUwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lyYwCz8pcJHDkWqx8qQinRv/BNFd8v6Q1b62XbLvrKrxSnxWL2U
 zBQZFehmlV2v1baGgX8zz9XBceVoWGkLqCJbxkwvHl3vNmDvMP2mOIJnw9xwbbu2ih9DZdv
 HvMpjn4b40x33r3Y+7bWfxFrWEgFBBLPPwvalv4a3kl6skKHliKPVKgffRu0qBDVj+Y05El
 TBC6i3OmZqTAk0yRIRDug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WPXdHxn0Ioc=;Nw3Tm5jXifxVcLxodMHl5s+/eci
 mtG57ZIIofCL1ColXscBDjtEaVWzhyByf7x/JtJitectvF/mTQletxWRZqNV4v02Rj/+J4dJJ
 Ssdmy8l9DaYZJ2Xbl3A3qC2jX81FzKJ2qBqd3uOyU5qgrwO5a0Uxhdvd+xQX7DuKR8OQOf4JW
 PpvOVJhIHay3SAXA2AxBE0VXUbPkoQPFn9YMqPFlVzokQAMGBKJLidJ34ZMH+mL15SQoHiKe6
 JqU05vJezNRZlZ22rubmWrQNle/vfalEOfMMLFLyzC+NcKWetm5ocVpCtl9MPvh8CtYY6Dlqn
 9G92/+8Cd6omiZoV0I5oGsk06UB5oQHXTTcI3iRVNKGJf97UCghw2MP1bloZc/eJgIbvA742h
 A0UP5fiOdsfZC3/GBSZ3VYO5CsMok8t8/DtIfyyre4BbVHAz/N00nPYH0aKfZNkErskYfMCZ6
 mTnZ0y0n/UNiKS/i7E8JL936Joph6KNsQNiHJoGKKpbzh/DlDG0Ansu30jNBhHk1Z0Psx/CXr
 vQpbayAjDZTdDUNF/au6t0GSLI2r5/yi8hY9+T+6YKPztK8hE4PnzJuz2V9ZmoTOykU4K4PvT
 Ixg8PnFXXCkoTPLUuXIF0btKLwC9PG0SxrQlaEeLMRzX5YrU6YtSyJvsJ8mZo9CjTgFTjJ7AI
 YbIrattmnaqEoMt07KgPkeBH3T0L+XOyJ+K2XaOZWTOkYck1TSp6RJ/GR9F6B92K0VbhpQpMY
 0v5x8oZeYvTNckb79utEKfUCsdJCaM9pzU/ZAAFL/1mfIzZgNwlHUx+2ZGZ9rBQlqq8Jy6gMn
 Iq0xKdkPpMlJYYnDrl4WhaSJkoQzoNmnzZKcDtbR6FdqeUdbYkwjz+y2Ww/pa5+UnPKcA9CNT
 2lpfykYZR4oDPvhbPC5kw+bFwFhoyt6AL1syDJ6ItBLWbG3brUvTtnC99H+8hHlRwaxDM2M9y
 ypmQY/V/uyrvNTXIDZnZWV7CmFk=
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
Cc: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/23 16:44, Geert Uytterhoeven wrote:
> Hi Helge,
>
> On Fri, May 19, 2023 at 4:37=E2=80=AFPM Helge Deller <deller@gmx.de> wro=
te:
>> * Geert Uytterhoeven <geert@linux-m68k.org>:
>>> On Tue, May 16, 2023 at 10:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>
>>>> There is a global function with this name on sparc, but no
>>>> global declaration:
>>>>
>>>> drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototyp=
e for 'get_fb_unmapped_area'
>>>>
>>>> Make the generic definition static to avoid this warning. On
>>>> sparc, this is never seen.
>>>>
>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1468,7 +1468,7 @@ __releases(&info->lock)
>>>>   }
>>>>
>>>>   #if defined(CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA) && !defined(CON=
FIG_MMU)
>>>> -unsigned long get_fb_unmapped_area(struct file *filp,
>>>> +static unsigned long get_fb_unmapped_area(struct file *filp,
>>>>                                     unsigned long addr, unsigned long=
 len,
>>>>                                     unsigned long pgoff, unsigned lon=
g flags)
>>>>   {
>>>
>>> LGTM, as this is unrelated to the SPARC function, and SPARC does
>>> not support nommu (yet? ;-)
>>>
>>> drivers/video/fbdev/Kconfig:config FB_PROVIDE_GET_FB_UNMAPPED_AREA
>>> drivers/video/fbdev/Kconfig-    bool
>>> drivers/video/fbdev/Kconfig-    depends on FB
>>> drivers/video/fbdev/Kconfig-    help
>>> drivers/video/fbdev/Kconfig-      Allow generic frame-buffer to
>>> provide get_fb_unmapped_area
>>> drivers/video/fbdev/Kconfig-      function.
>>>
>>> Probably you want to update this help text, too. E.g.
>>> "to provide shareable character device support on nommu"?
>>
>> I've added Geerts suggestions and made it dependend on !MMU.
>>
>> Applied to fbdev git tree as below.
>>
>> Thanks!
>> Helge
>>
>>
>>  From 9adfa68ca0ddd63007cdce60a8ffcb493bb30d97 Mon Sep 17 00:00:00 2001
>> From: Arnd Bergmann <arnd@arndb.de>
>> Subject: [PATCH] fbdev: fbmem: mark get_fb_unmapped_area() static
>>
>> There is a global function with this name on sparc, but no
>> global declaration:
>>
>> drivers/video/fbdev/core/fbmem.c:1469:15: error: no previous prototype =
for 'get_fb_unmapped_area'
>>
>> Make the generic definition static to avoid this warning. On
>> sparc, this is never seen.
>>
>> Edit by Helge:
>> Update Kconfig text as suggested by Geert Uytterhoeven and make it depe=
ndend on
>> !MMU.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
>> index 96e91570cdd3..1688875a07de 100644
>> --- a/drivers/video/fbdev/Kconfig
>> +++ b/drivers/video/fbdev/Kconfig
>> @@ -121,10 +121,10 @@ config FB_SYS_IMAGEBLIT
>>
>>   config FB_PROVIDE_GET_FB_UNMAPPED_AREA
>>          bool
>> -       depends on FB
>> +       depends on FB && !MMU
>
> I expect this to cause a Kconfig warning when enabling DRM_STM
> with MMU=3Dy (e.g. multi_v7_defconfig).
> ARCH_STM32 seems to support both MMU=3Dy and MMU=3Dn.

yes, probably.

I revert that part again, as it's the least invasive change.

Thanks.
Helge
