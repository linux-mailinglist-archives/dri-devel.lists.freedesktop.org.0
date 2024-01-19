Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ECC833021
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3868E10EA79;
	Fri, 19 Jan 2024 21:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D0210EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1705698885; x=1706303685; i=deller@gmx.de;
 bh=s73c+PV9RBdRHuJzCkyzdkZLfx9DoZuk0cF3aGXh9PQ=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=hhqNldkZiPi7/qTppdHaj3I6sOcDgkYU33fcFSF/sueLemJJ5pM92QA7cJyYn4EA
 DOZpttdZc6pPuayOFDPILB9KlDjKTAZmKlZP7pTibp83jX7gKd2pBGwaaGMlZwwo1
 M6c1cViMx7gDJX7RbzclubPgejWEqDAdDYXrgpbnBtwauutkBIBrs16NDGkoFgYtq
 7FM3ilhbsF3myAX9oSSqgWgfFDwM6zRkc5ao9lkRCc0473RmVilUKw00PhPAmrGEw
 /59YJE5zmDdb4lOaWIgmGSuKoKb7prsL2Bze6dS7G/meZc9MBfa8sPb7a7n0cx9DB
 vEhVLewNFuhCCzofLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.146.202]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1rVtkR1mgo-0063Ro; Fri, 19
 Jan 2024 22:14:45 +0100
Message-ID: <b6350dac-0be6-45f9-9309-d196ea455dea@gmx.de>
Date: Fri, 19 Jan 2024 22:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: no console on current -git
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
 <0293b14b-6188-4229-9fb6-29fbbdb8dc83@gmx.de>
 <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <9e09464a-d58c-4f17-9318-26f0813a3023@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wI6PavTWyK/1hLNhp/ONCgpT/GrJrivjIT9bLA5ikrUXVcScRhC
 LVHbXd53Tx+G5Q8evkoIzYQwKlWebi7dg6KrxVpIyXInVMNzRas0WfSDLTbBs/VUxhCLbFk
 0iozpUd8X76u6lTvoxh81WS2a6ZrYGS+QFttXwfZPFZb66aplDu52Ukf7VH61f/HkuwPJUA
 xDbEX+u6iDeRVn0csM8sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pUHXn6D2Kwo=;EjUffMTjKPWQtDnl2tB1Yg4ggOl
 A2c+ukjYdBcs0htKnG0hm4G+c+SCc1xfb+pMLnUIez7X1/8SoJ1HGLG3YY1f0CUV8IaquSiz5
 chO7QxWE4aVG3j9MjeTz6hwjIMXmJqEDQ2T9Zw3l+SrLYdpQaEJdptt4ljUUUdsyvn50Cfvm8
 tgvye6lOtajKYrgjbHpiGGu0OPywJQJJ9Dhe//d0dg4WIBvQeGTFJ1kLs1QTVizHHtfXUxKrV
 7S9edHthzsOcd3PeHGD0RQpvy6gB5ihtW1b7gvhDEQkHJskwPkpwFtBoZU4a9TH2c5LV8QnN4
 27geTlss1gGlA9cbbQ6HNJbxpg6EtQ4HiXjWHPbOaIcQWGKH7jxpfVJhKpKZQae7B3HMsjFOI
 kHMm8nNJpeJt7SEl+ICSNytRNiqa5rvwcSGJwAsZx4TVatm+zhKYBxO1C+REWGmlaqEWY7Smp
 XpcsBi6zo9hbjvPkxHOVNr6PHqTLpCm/FOuAkYlQ/sBqvOJsDzqa/zYtFfEbOP+cELDIdDh7z
 UVSmRzslQ3xmNCtLnwY1+hKOykyg1BTxfmnmKZgKx3jPYA/sBOoxOahWf9Kw5n1IXeQTXfseX
 ZqwUrdxUjsAyvIevU0wCsAhkWV50U8JUPpZA+3RT82HejKPMVy19Rvm6CNZfUVNGuesg8clqC
 TOc5M3qaZZ6dhZBcRQ8wSYAGBwTg/sp71h10Gw1Rfhk6uEb4FPeYoPdfO15YisgZcXCXN3eoV
 54zpJs6aMFlaWFVvGHRnCTGI2D5hW0Eb0epwX2L8bUnFQhsHUrCblOGXRwR2FTpzU/RVnZozU
 GUubuPxPbSDpkpiZT1BRy06bUbRgDX6hm6Kdfh7MNLB45zfm7N4B4CrEUjZ3F5onpx5ckp+H6
 PUIQsM6YwDRCeffenmt3OGPMroBkuJHqS7WVe69jLd6hNFzaDJL689GiIKY6aiKXgn+lrA2o9
 MUFwfSYHvVDD8Zdv58ZxaMybR0E=
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
Cc: avier Martinez Canillas <javierm@redhat.com>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/24 22:01, Jens Axboe wrote:
> On 1/19/24 1:55 PM, Helge Deller wrote:
>> Adding Mirsad Todorovac (who reported a similar issue).
>>
>> On 1/19/24 19:39, Jens Axboe wrote:
>>> My trusty R7525 test box is failing to show a console, or in fact anyt=
hing,
>>> on current -git. There's no output after:
>>>
>>> Loading Linux 6.7.0+ ...
>>> Loading initial ramdisk ...
>>>
>>> and I don't get a console up. I went through the bisection pain and
>>> found this was the culprit:
>>>
>>> commit df67699c9cb0ceb70f6cc60630ca938c06773eda
>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>> Date:   Wed Jan 3 11:15:11 2024 +0100
>>>
>>>       firmware/sysfb: Clear screen_info state after consuming it
>>>
>>> Reverting this commit, and everything is fine. Looking at dmesg with a
>>> buggy kernel, I get no frame or fb messages. On a good kernel, it look=
s
>>> ilke this:
>>>
>>> [    1.416486] efifb: probing for efifb
>>> [    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 30=
72k
>>> [    1.416605] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D=
1
>>> [    1.416607] efifb: scrolling: redraw
>>> [    1.416608] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
>>> [    1.449746] fb0: EFI VGA frame buffer device
>>>
>>> Happy to test a fix, or barring that, can someone just revert this
>>> commit please?
>>
>> I've temporarily added a revert patch into the fbdev for-next tree for =
now,
>> so people should not face the issue in the for-next series:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/=
commit/?h=3Dfor-next
>> I'd like to wait for Thomas to return on monday to check the issue
>> as there are some other upcoming patches in this area from him.
>
> Given the issue (and that I'm not the only one reporting it), can we
> please just get that pushed so it'll make -rc1? It can always get
> re-introduced in a fixed fashion. I don't run -next here, I rely on
> mainline working for my testing.

I agree, it would be good to get it fixed for -rc1.
So, it's ok for me, but I won't be able to test the revert short time righ=
t now.
If you can assure that the revert fixes it, and builds in git-head,
I can now prepare the pull request for Linus now (or he just reverts
commit df67699c9cb0 manually).

Helge
