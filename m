Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37C4A9DA3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0581710E995;
	Fri,  4 Feb 2022 17:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F12010E995
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643995903;
 bh=K9vYJ4Z0wQ3bmff5arWtA3wK6fAgdN2CVw47Zm1w0tA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fhgfzqftvaiTA/QXEvDINOcKjkN56pSjouprienVeSM0FFUR/k/e6NjYcJxriV28y
 CNhFRgkl7xByQstWXX84adL91nOn2Z0JFiKzPMZC0mkkh7fcWZR814HFYMLdWdwde9
 o7orK0gyeAKEpkn5i8zEv/Z4RGsTydFo+Y737+CY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.130.18]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ml6mE-1mUrAZ02Zg-00lSqW; Fri, 04
 Feb 2022 18:31:43 +0100
Message-ID: <47416fc1-bc1d-1a25-2e30-d87e901b336a@gmx.de>
Date: Fri, 4 Feb 2022 18:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 3/3] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220202135531.92183-1-deller@gmx.de>
 <20220202135531.92183-4-deller@gmx.de>
 <CAMuHMdWTuFt12faj58sLv3H9rN0xK-+CCTkFeEiKdLSQTU2Lmg@mail.gmail.com>
 <ee851128-1080-d0ae-6c55-e1816bc89e74@gmx.de>
 <CAMuHMdWAs9RC843oL0ME+yJSrSdVVM0Ua+T-KcrX1QTjsO1DZQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdWAs9RC843oL0ME+yJSrSdVVM0Ua+T-KcrX1QTjsO1DZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tGtGgjiFkwAzVJSDTfPXM6zaoyGG29VK2i8+grG9iHRBlBukAsr
 rEA+UCYLwgIgxhJ/WbQrsBNE7QGdxcz/y7MBuDNQvqzu3aSPYYRmS9mc87gGjuPWELASrbW
 Vpp4AVuL6NLA/coalqCrXOSAhny31c/Nbh9pNUDEFdIdnoxNWW+VaK+X5Sq4NbHDlo0aOhD
 wNLNVNPGZWUUCG8iDNswA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xOis7iW2H68=:ds4/U5CgZ0KoAx+wwO174G
 m0HnBR7xERoa3wuHm/nRX13AaC9k8IR+7zHoyIcpJd6fV6KrMtt67Alf02EAb4hsGAoFlV/gX
 SDzFzFyePjW/w0VuW5KUrJwcAD/2OFCdJHsTCo5qnxExJtnFVfgsX3r8TXtmdwks/BytACk0c
 ZXa+y8WFVptbXfbUZm7vMEsnfATPhLg2+gZZJBibNlMYLAqNB6hSJ/alNm5L2CYMrjyq/zKeg
 rffjhXHCnaqRjt5MTeemakiqH0V/tTFhIxCxo2EPVypkvj2AUW3P/kmerXI6QEnb9s7iLBT6T
 I0bucx2kPslDzplkMc8cbVOhO3VkUZ/Hw4dV1xPQWiLkYUMMrUkb1q87jWcGKr51OwrfkAzIC
 HiFbIWPZzXR+oi67DuoiLvIj49e1JaMsslYcOXMPDPPUcfrKD574CbOVT9llCn2mY0ODlSvEc
 T26FAN7uvU4pZxZwqJIX8oc7tmC322ApDeQ2SnKH/xqCwtG7kxnC5urT7bBal1m+6Xw/7bZjI
 ypZmqQLf2KkdDajQ//OyVrpNyT3h42BceHSEibFkXkbLIpx7ZQuE+J+w+vBa55lMzOtN2Izvu
 nUUeVlfil8OGaiWdULcm378DK/01tU6Th0RKeJhDE9q+wIOxRI9n+5YUt1oXZF62VmbIiJApp
 CDzxyxoRWTFRn10QENsBQ/OkPjn1MLVHR08wP26UETo3L5VnAn3Cng4kGhqSWFX++z2cwZpu+
 G+e1FUJyJN0ab1v1QBjk21UUtN0XpkiZ2hp3ffFPT978u1tR6I4jWaorRyPp9/OrHFlglaGT5
 X7Uc+wECcr2OgyCgAH6tmPrPgUgZmAt0EJRuREeahXDdLKdd2LMv0KZYUaTLIpOnnbVA9enez
 6B5I+MssbBjEM2ejrQ1j8nFAY22jvVtvz/SJmdfuTION+QsWDOzKan6g/EAwRQMlO+C09L7/o
 Fu/1I1zn48lCBrIxOj1n3kmA3n6UKQuUSkJUI3NbPvaMXxbxKoAI1lEibVEwalcfVzNV1lUFD
 ZWuzRW1PP+QF/9HcLWcHTAc9ZbOfuniODmuTl/WU/QNjb3EagL2dlWoqDGdVoVkYNCcO0mgah
 lmykPJ6O4Amt9s=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 2/4/22 11:24, Geert Uytterhoeven wrote:
> On Fri, Feb 4, 2022 at 11:17 AM Helge Deller <deller@gmx.de> wrote:
>> On 2/4/22 09:37, Geert Uytterhoeven wrote:
>>> On Wed, Feb 2, 2022 at 8:05 PM Helge Deller <deller@gmx.de> wrote:
>>>> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
>>>> enable bitblt and fillrect hardware acceleration in the framebuffer
>>>> console. If disabled, such acceleration will not be used, even if it =
is
>>>> supported by the graphics hardware driver.
>>>
>>> Note that this also applies to vertical panning and wrapping.
>>
>> That's correct.
>> Would you mind to send a patch which adds this info?
>
> To add it where? "bitblt and fillrect" are only mentioned in the patch
> description.
>
> The Kconfig help entry just talks about "hardware acceleration",
> which can mean any trick supported by the hardware.

Yes, I thought about extending the Kconfig help entry text to
mention vertical panning and wrapping as well.
If you have an idea how that should be phrased, I think it
makes sense to add it.

Helge
