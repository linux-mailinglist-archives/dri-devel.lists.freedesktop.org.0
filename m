Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F331561FFBD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BDD10E48A;
	Mon,  7 Nov 2022 20:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82710E48A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1667854000; bh=VUOGtRW5QRcsoux1eIEKMXiDp1er4Kt2H8bnoQy1LKE=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=N7RisSlFhEn4jI2jJXrNfAbDlR9TZ0/4IALTvQZd+uUabVJZY7783gXOVuA6j7glk
 LnefvdkbONd4C57CMmy0I8yOjU8wsZgEKmOOSKB0yWoKvnPasX8bZXtzXon5oaVVYQ
 cMrL64JO6Wcxd6blB6B+bB5HE790kSAUDN8dyoG84js1iQkeqJzWzO2VheAYdzO0h6
 AdoFFpGe4Hok9/2yeWXZbJm9kQdCi8V2SMZetJ7vECFo3KBMjDjg/A7ea0KHt3XKuy
 oSZD+LFaQfMSuzzAkaMUWi3zzGsXL1XEhKMFGrBVqe2V1e4E6hBcWGaxo0hrKseYD0
 F7WZULX9zeHtw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.191.140]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KTo-1p1WeQ08Je-010Mw6; Mon, 07
 Nov 2022 21:46:40 +0100
Message-ID: <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
Date: Mon, 7 Nov 2022 21:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 javierm@redhat.com
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <6547fba2-a002-f339-2997-5b28df794095@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:L8/XBgG1PIjL93oNfV/gXI0qXEMGIaLBiQQUACow6nK11QidiuL
 2GCywnNwdO0yrImxxuFKy+4T8kMRLfJCZuMtN/PtSoORoXONYSbrVYX19IbU27Af5xGvuiU
 DtgrfF61+h+bWNPbuCgqAqdJfY6sJCWT0/5EEzev5qr/br/vOz68/xxRyXsFFdrZqJqNREj
 VJmxpFXkr96N3Yu9/5Ehw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+gWM8z4yrq8=;E7pJ1rO1R/NeDqKQejHtFMjrRea
 UEyiJQfHCpgQ/fkDMWO1tFxSscmI+Ru69CaEMnzTxpbEmURyDx6HNTj+w7TVsMZ80jn5xK5gM
 35N9qzXQR/bDNVlso4Qnq4CnRDTYGj5FZZx8IT3z8c0jUAvAVr3Lc3qiO1YTgB55Vnh9/YDRv
 dUoImcQpysglGGeE+BeZ976u0lw7ihBizuMVyD2rEaH5HwbG4/JKn9lsW8hcjWQpxH94jARqd
 ILm+w+DRP6L7eRoghc7uCQSBGBKjqsVzbdSxV+E44tOK+LFtbKNnwXfLOxIbLEdRC5x/kiUB+
 df0sgUrakR4QOob05YyvpXilsJHGfoh8SgEzVAe4xRhMsIf47EmAyBsHrI3wOoy06lwa6aQPU
 uQVqLcX928A2jgbp8/0U/6GkENKtTLkswVJNCpoXRDtDlJTHpcAwdPIADcuuUioaCqt9vtTHA
 oS7BiLDkX0P9XkHfQ3qEybI5VrYR/T4OST++1MLHdPlev0TGDjjeCUfM+DVr9hgBIqPahh4dT
 VI4Gf0bVKAWecbJT7iKmFJiUGIjH24PX58jO7T0XHNj2sjDJxwSvzBAWgb2yJfViejlxrIavy
 XqKNGQwJsC8jdD5g6wzb4ritnA8vRcK3jFjEVRMq1YiJnPMQYCTgZol6Y9w++FMPKQw/78LLC
 poSxxLjqTLCUIj9SORb7d+TXVPonCk0PRXM3XQOWl5LRVCUFK8ce+SyO8C33deNidzklLM2I9
 YqB/j0oyQBSaYgUDLOqfsQiEM89UGuSuYycl9gJ4mNjHnQEWO4ECl7mpz3fte600u3ZyrrOSI
 0lKqbuvzLQPxKBqUshAgxSfJIiuUkQpH1vg8f/Y/LZPhG/v68M4ecjph7K90ler9R3XJMw3q8
 1LjurwB5D3+1AQvgXU/3zqM86BLfOC3IeRSE8+DP7oLWT/VGTMUOBXHpW1zMDz0vN5eNGbVrr
 +sOHKQ==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/22 16:30, Thomas Zimmermann wrote:
> Hi
>
> Am 07.11.22 um 14:57 schrieb Helge Deller:
>> On 11/7/22 11:49, Thomas Zimmermann wrote:
>>> Support the kernel's nomodeset parameter for all PCI-based fbdev
>>> drivers that use aperture helpers to remove other, hardware-agnostic
>>> graphics drivers.
>>>
>>> The parameter is a simple way of using the firmware-provided scanout
>>> buffer if the hardware's native driver is broken.
>>
>> Nah... it's probably not broken, but you want it disabled in order
>> to use the DRM driver instead?
>
> No, it's really for broken native drivers or any kind of problematic
> modesetting. Most DRM drivers already respect the nomodeset option
> and won't load when given. All you'd get are the generic drivers,
> such as simpledrm, efifb or simplefb.
>
> There are better options of configuring video output on the kernel
> command line.  But as graphics output is such a fundamental feature
> to using a computer, we found that a simple and easy option to
> workaround erroneous systems would benefit DRM users; hence the
> nomodeset parameter.
>
> As fbdev drivers also do modesetting, supporting the parameter simply
> unifies the behavior.

Ok.

>>> The same effect
>>> could be achieved with per-driver options, but the importance of the
>>> graphics output for many users makes a single, unified approach
>>> worthwhile.
>>>
>>> With nomodeset specified, the fbdev driver module will not load. This
>>> unifies behavior with similar DRM drivers. In DRM helpers, modules
>>> first check the nomodeset parameter before registering the PCI
>>> driver. As fbdev has no such module helpers, we have to modify each
>>> driver individually.
>>
>> Ok.
>>
>>> The name 'nomodeset' is slightly misleading, but has been chosen for
>>> historical reasons. Several drivers implemented it before it became a
>>> general option for DRM. So keeping the existing name was preferred ove=
r
>>> introducing a new one.
>>
>>> diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/=
aty/aty128fb.c
>>> index 57e398fe7a81c..1a26ac2865d65 100644
>>> --- a/drivers/video/fbdev/aty/aty128fb.c
>>> +++ b/drivers/video/fbdev/aty/aty128fb.c
>>> @@ -2503,7 +2504,12 @@ static int aty128fb_init(void)
>>> =C2=A0 {
>>> =C2=A0 #ifndef MODULE
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *option =3D NULL;
>>> +#endif
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (video_firmware_drivers_only())
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>
>> I think it makes sense to give at least some info, why a specific
>> driver wasn't loaded, e.g. something like this kernel message:
>> aty128fb: Driver disabled due to "nomodeset" kernel parameter.
>>
>> If you e.g. change the function video_firmware_drivers_only()
>> to become video_firmware_drivers_only(const char *drivername)
>> then you could print such a message in video_firmware_drivers_only()
>
> Well, we do have such a message in disable_modeset() already. [1]
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_n=
omodeset.c#L18

Yes, I saw it, but that message quite generic.
If for example my atyfb doesn't show up, I would grep dmesg for "aty" and
not "nomodeset"...


>> And I don't like very much the name of function video_firmware_drivers_=
only(),
>> but don't have any other better idea right now either...
>
> It's part of the 'video' module, hence the prefix. The 'nomodeset'
> option used to be implemented in several DRM drivers. It's an awful
> name, but we didn't want to remove it or introduce a new one for the
> same feature. So we kept nomodeset for all of DRM.  Then we started
> bikeshedding the function name that returns the setting. And
> firmware-drivers-only is the best description of what is happening
> here. So that's how the name happend.

video_modesetting_disabled() ?
(Just an idea)

Helge
