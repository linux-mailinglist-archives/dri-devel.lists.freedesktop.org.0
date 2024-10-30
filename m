Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16429B5ED8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 10:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE9C10E76B;
	Wed, 30 Oct 2024 09:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="tXEWaHQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF87310E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730280629; x=1730885429; i=deller@gmx.de;
 bh=5zhNhKn2OwZBHVJqWu/+nl/eKNwuU2Z98DH7DMslhX4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=tXEWaHQWSO2Yqj7A0xdLpD1dAICreq7qG/ftuzm6SPFWwqOiIsSuC2k02qTSO2qD
 h8U8PsUiJWnT11w2nRss8mkU4CE/XIWgTGf3LESZ05eYQ2SH2hNUCcyCSdXr/ilQx
 HU4t5gLR334ETiy7DPEkYl/ItTPLqht4IFR8wQPmQoF1li4bC6fzrQpklm2SLS/F/
 SV2pZOIzArqhdqx1hs85EZjat7xz8CYO0d6fWsf19oXRcqmjHAB+Try9N6xAgFpfv
 BONhD1kACFyC4pO/wr9I1R27b4TfkfE1PbLmzUmyqOvxShvzmH6YfXFnbpClXhl6a
 3r+CJkU8rOkBD5SrlQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mdeb5-1terki1q77-00hHQD; Wed, 30
 Oct 2024 10:30:29 +0100
Message-ID: <3f655f6f-58a7-4526-91ae-6dc4793eeefb@gmx.de>
Date: Wed, 30 Oct 2024 10:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
 <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
 <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
 <46712e5b-701b-41c5-82f0-d6b41f5947af@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <46712e5b-701b-41c5-82f0-d6b41f5947af@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pEhUbw9mVNsZOjOPnkSclHePrkLYU+6R5Ve+YD9iAQnWIj1pfSC
 Jd2iw/UPmH6TBkUezWSIgInCTaS+Z92J0TM0YWsaq1/iZG7hs/HnN2AhX4HPYQH0qPMhl/A
 yv8tpYgg9YAVjFiwrE1UpiW1FowqZvHNFS9ooJAwtg4QGuJHkvRmePG/kKg5B3MbRVtdBDB
 MZrwLx97nd8NUAsoasjyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+hZVqUByNyA=;jORM4Om3CY4XR4GQRNVszJ+lHZq
 1wo489zvJ6ve2GNrsHEX6LyS/N5+pPMVOXi3WUB07tp144/oGUHcIFXSFgYEzhCftueoiuY1Q
 gu6+a6O1k2Mt17lMrQl6wFkVeqQo0r10RJjQ5OCLMfNbJA1JZJeuNSSO6WhZI0I/IoBp42RUn
 Pc9+XdeNHNYFH4DJ+f1z0zkkd+WwmRug4odR+zg4beUaQyzQdOFYYf1UPIxhaWOeG4TJ7Xlbi
 uxHtceqktBYdTnBLRy1hl638hhMpaECBtNos6CtEk1VaSUmM8IMPCmx9PDgb7r5UqKP7InAX/
 KHZ9FICec0ItDZBUnK4WKJiuFMyr5pzbjy6ORM+tjBcRUPL8BxhhOLvKGi8bNRkxaoBVMvSzi
 2gJZLcm90X5AAtp5K9XTntCfLSqH9fLUedrRXTGgdBVdqR+HexNwRc6XxTohhudrg9C55jGdf
 ge8Ctr4xfUjJoCWieYD/CN2hx3BKwvk2e0W8XWhmGAXR0ePzxQq+IsYNGchhsuwDHmPZq8UJI
 ij4JDtQ9Mxp/1Vu+ypVZzo1dIMIu2CCQKoGaC7YQXFb5D0t2ALJjnPwT/KBuLyNJIFGW8xbZu
 CrTnZuGTZEaMfokrdxJZ4VIwX7l+lSMUWwYC51lYE2gnlyaU1drTQQteSBhCLnB+Oge1ETumm
 jyJj8KP92IynHL8glxTEG1oZZjp7SpbClD20WUHZpTnSyDMoz7xv/SL1sG6Lwh/ziO84iQcST
 +tzGDBmFT48GHyoRCFGsYWfwRhjsA1boJmOAJS5fg9GeaioYbwHhgdtg0ZPm4Iqop4RrB+I/a
 glhNw4tPiVE1eOSNyrwLHaFA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/24 09:33, Thomas Zimmermann wrote:
> Hi
>
> Am 29.10.24 um 21:42 schrieb Helge Deller:
>> Hi Thomas,
>>
>> On 10/28/24 09:41, Thomas Zimmermann wrote:
>>> Am 25.10.24 um 17:37 schrieb Helge Deller:
>>>> On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
>>>>> The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sy=
sfs
>>>>> entries and access framebuffer device information. This patch wraps =
the
>>>>> relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the driv=
er to
>>>>> be built and used even if CONFIG_FB_DEVICE is not selected.
>>>>>
>>>>> The sysfs setting only controls access to certain framebuffer attrib=
utes
>>>>> and is not required for the basic display functionality to work corr=
ectly.
>>>>> (For information on DisplayLink devices and their Linux support, see=
:
>>>>> https://wiki.archlinux.org/title/DisplayLink).
>>>>>
>>>>> Tested by building with and without CONFIG_FB_DEVICE, both of which
>>>>> compiled and ran without issues.
>>>>
>>>> Gonzalo, I don't like this patch very much.
>>>>
>>>> It adds lots of #ifdefs around functions like dev_dbg().
>>>> Instead of ifdefs, aren't there other possibilities, e.g.
>>>> using fb_dbg() if appropriate?
>>>> Or using any other generic dbg() info or simply dropping the line?
>>>
>>> I talked Gonzalo into sending this patch. I think dev_dbg() calls
>>> should be replaced with fb_dbg(), same for _info() and _err(). That's
>>> probably worth doing anyway.
>>
>> Yes, but I doubt every of those calls can be replaced...
>>
>>>> But more important:
>>>> This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
>>>> If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
>>>> you want fbdev output at bootup, but otherwise just want to use DRM.
>>>
>>> It's unrelated to booting. CONFIG_FB_DEVICE enables/disables
>>> userspace interfaces (/dev/fb*, /sys/graphics/fb*). Even without,
>>> there's still fbcon that runs on top of the fbdev driver.
>>
>> Sure, I meant that if people enable a fdev driver, they most likely
>> want /dev/fb as well ..... unless they want to use mostly DRM drivers.
>>
>>>> But then, doesn't there exist a native DRM driver for this graphics
>>>> card which can be used instead?
>>>> If so, I suggest to not change this fbdev driver at all.
>>>
>>> Or can we talk about removing udlfb entirely? I tried before, but
>>> there was one person still using it. [1] He had concerns about udl's
>>> (the DRM driver) stability. I think DRM's udl has matured enough and
>>> is in better shape than udlfb. Maybe we can try again.> [1] https://lo=
re.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse.de/
>>
>> The stability was one of the issues, but IMHO the *main* issue he menti=
ons is this:
>>
>> The framebuffer driver is faster, it keeps back buffer and updates only
>> data that differ between the front and back buffer. The DRM driver does=
n't
>> have such optimization, it will update everything in a given rectangle =
-
>> this increases USB traffic and makes video playback more jerky.
>
> If that was a problem, it has long been solved. [1][2] The DRM udl drive=
r keeps a backbuffer in system memory. The DRM API provides built-in damag=
e handling, so that clients can mark the framebuffer regions that have bee=
n written. Udl will only update the regions that have been modified.
>
> For fbdev support specifically, the fbdev code mmaps the drivers interna=
l backbuffer to userspace and does deferred I/O and damage handling on the=
se pages. Hence, there's only one transfer over USB with no internal copyi=
ng. There used to be more internal copying, but that is gone. [3]

Sounds good.
Maybe you should ask Mikulas if it helps him?

> [1] https://patchwork.freedesktop.org/patch/501943/
> [2] https://patchwork.freedesktop.org/patch/506133/
> [3] https://patchwork.freedesktop.org/patch/590306/?series=3D131037&rev=
=3D4
>
>>
>> That's exactly the main concern I'm regularily bringing up and which
>> IMHO is the main reason we still have many fbdev drivers.
>> You added support for some of those graphics cards with native DRM
>> drivers, but all of them are unaccelerated. This hurts a lot on old
>> machines and as such specific cards are ugly slowly with DRM.
>> A good example for this is the kvm drm graphics driver which is sluggis=
h
>> and slow when using KVM.
>>
>> I'm happy to get rid of the fbdev drivers, but for that DRM really need=
s
>> to allow some sort of native fillrect, copyarea and imageblt operations=
 so
>> that we can get performance back on the old cards when implementing the=
m
>> as DRM driver.
>
> This is unrelated to udl.

No, it's not.
The udl fbdev driver implements those functions (like the other fbdev driv=
ers)
and as such fbcon on top of udl is accelerated, while fbcon on drm drivers
is unaccelerated.

Helge
