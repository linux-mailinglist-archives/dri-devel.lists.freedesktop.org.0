Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E78CFD9C5
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 13:21:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E285210E59B;
	Wed,  7 Jan 2026 12:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="I6e2KnPP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B382110E59B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1767788457; x=1768393257; i=deller@gmx.de;
 bh=xHVBz58HYLX1Yu8H9LwYGjrL9lA9EOImWTKzrV9riyE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=I6e2KnPPdeWSTEhIBYOyXPSApXF8i9xlAd+7YIETN2/LMZOBZ2k9MaNzMRye6LmB
 enZsvYDX74KPL+DgELpoknSfM7yiN1mtgNkYl1RKe+JIu/whAGCH1wWrQKybssNt+
 vv30lbIsy+MpZGQY9iqJp6O74hmRYNLDA7zW6o0oEhybpC2Hc34hq149J99X/hYBX
 JwDaXYG9MVkz2wPjb0TsgK9YoNNsnz1UbwLslrcuA/3dDTxIMjtOtA04iNDUAtapA
 Rwalr+X0Rvg1rDC5TijsDklr3uyWjN+mq2a6VYpaZIt9ajdA5yCYzSSQuz5bjtxMc
 G5AQfwesDajQStIHkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1wCW2F2QXj-00ewHj; Wed, 07
 Jan 2026 13:20:56 +0100
Message-ID: <487ac672-3a2e-4897-aaba-7ae44bcf341a@gmx.de>
Date: Wed, 7 Jan 2026 13:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Vincent Mailhol <mailhol@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
 <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
 <dda4052e-b843-43fa-850c-a1bb20e4a8e3@kernel.org>
 <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vmOm9Iz0rY/vcNDMw4F92fRZYBogbJY0mxmW/XAOIOpoZMeSa56
 PydOg3OfkxMDiKVnKNeOZCu5R86rQMoqEPKILReaV3Pr0W4kMct5kfbJ28razXB5+aoO5wk
 pF94qF4Z7G1DPI4Mvbv+DhWG7AjWCr/3h+JvjAevBlRLYVRGGeHyTHRc9l0sMfCvDKp06mO
 Q2vXjj1IGjpmHt9Xv9lMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eF9UcERzAh4=;UxMVD+53GX2T7LuRPLQuh2adPDW
 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
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

On 1/7/26 11:36, Geert Uytterhoeven wrote:
> Hi Vincent,
>=20
> On Tue, 6 Jan 2026 at 21:10, Vincent Mailhol <mailhol@kernel.org> wrote:
>> On 06/01/2026 at 12:48, Geert Uytterhoeven wrote:
>>> Thanks for your patch, which is now commit bd710b3da7308cb1
>>> ("video/logo: move logo selection logic to Kconfig") in fbdev/for-next=
.
>>>
>>> On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrot=
e:
>>>> Now that the path to the logo file can be directly entered in Kbuild,
>>>> there is no more need to handle all the logo file selection in the
>>>> Makefile and the C files.
>>>
>>> This may do the wrong thing when booting a multi-platform kernel.
>>>
>>>>
>>>> The only exception is the logo_spe_clut224 which is only used by the
>>>> Cell processor (found for example in the Playstation 3) [1]. This
>>>> extra logo uses its own different image which shows up on a separate
>>>> line just below the normal logo. Because the extra logo uses a
>>>> different image, it can not be factorized under the custom logo logic=
.
>>>>
>>>> Move all the logo file selection logic to Kbuild (except from the
>>>> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
>>>> one entry for each logo type (monochrome, 16-colors and 224-colors).
>>>>
>>>> [1] Cell SPE logos
>>>> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.=
sonytel.be/
>>>>
>>>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
>>>
>>>> --- a/drivers/video/logo/Kconfig
>>>> +++ b/drivers/video/logo/Kconfig
>>>
>>>> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
>>>>   config LOGO_LINUX_CLUT224_FILE
>>>>          string "224-color logo .ppm file"
>>>>          depends on LOGO_LINUX_CLUT224
>>>> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DEC=
STATION || ALPHA
>>>> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC
>>>
>>> E.g. an m68k multi-platform kernel including Mac support will scare
>>> non-Mac users into thinking their machine was assimilated by the
>>> Apple Empire...
>>>
>>>> +       default "drivers/video/logo/logo_parisc_clut224.ppm" if PARIS=
C
>>>> +       default "drivers/video/logo/logo_sgi_clut224.ppm" if SGI_IP22=
 || SGI_IP27 || SGI_IP32
>>>> +       default "drivers/video/logo/logo_sun_clut224.ppm" if SPARC
>>>> +       default "drivers/video/logo/logo_superh_clut224.ppm" if SUPER=
H
>>>>          default "drivers/video/logo/logo_linux_clut224.ppm"
>>>>          help
>>>>            Takes a path to a 224-color logo in the portable pixmap fi=
le
>>>
>>>> --- a/drivers/video/logo/logo.c
>>>> +++ b/drivers/video/logo/logo.c
>>>> @@ -48,59 +48,21 @@ const struct linux_logo * __ref fb_find_logo(int =
depth)
>>>>          if (nologo || logos_freed)
>>>>                  return NULL;
>>>>
>>>> -       if (depth >=3D 1) {
>>>>   #ifdef CONFIG_LOGO_LINUX_MONO
>>>> -               /* Generic Linux logo */
>>>> +       if (depth >=3D 1)
>>>>                  logo =3D &logo_linux_mono;
>>>>   #endif
>>>> -#ifdef CONFIG_LOGO_SUPERH_MONO
>>>> -               /* SuperH Linux logo */
>>>> -               logo =3D &logo_superh_mono;
>>>> -#endif
>>>> -       }
>>>>
>>>> -       if (depth >=3D 4) {
>>>>   #ifdef CONFIG_LOGO_LINUX_VGA16
>>>> -               /* Generic Linux logo */
>>>> +       if (depth >=3D 4)
>>>>                  logo =3D &logo_linux_vga16;
>>>>   #endif
>>>> -#ifdef CONFIG_LOGO_SUPERH_VGA16
>>>> -               /* SuperH Linux logo */
>>>> -               logo =3D &logo_superh_vga16;
>>>> -#endif
>>>> -       }
>>>>
>>>> -       if (depth >=3D 8) {
>>>>   #ifdef CONFIG_LOGO_LINUX_CLUT224
>>>> -               /* Generic Linux logo */
>>>> +       if (depth >=3D 8)
>>>>                  logo =3D &logo_linux_clut224;
>>>>   #endif
>>>> -#ifdef CONFIG_LOGO_DEC_CLUT224
>>>> -               /* DEC Linux logo on MIPS/MIPS64 or ALPHA */
>>>> -               logo =3D &logo_dec_clut224;
>>>> -#endif
>>>> -#ifdef CONFIG_LOGO_MAC_CLUT224
>>>> -               /* Macintosh Linux logo on m68k */
>>>> -               if (MACH_IS_MAC)
>>>
>>> MACH_IS_MAC can be a runtime check.
>>
>> OK. I missed this.
>>
>> I think there are two options to fix this:
>>
>>    1. Keep CONFIG_LOGO_MAC_CLUT224 untouched
>>    2. Remove logo_mac_clut224.ppm
>>
>> The first option is less controversial but I would like to ask you what
>> you think about removing the logo_mac_clut224 file.
>>
>> Here, we are speaking of the Macintosh 68k which ended sales in 1995,
>> right? So the user base should be rather small, I guess.
>=20
> Yes, the user base is small.
>=20
> BTW, the only reason you don't have this issue with MACH_DECSTATION and
> the various SGI_IP* options is that MIPS does not support multi-platform
> kernels.
>=20
>> And people who still want the custom MAC logo would still be able to ad=
d
>>
>>    CONFIG_LOGO_MAC_CLUT224=3D"path/to/logo_mac_clut224.ppm"
>=20
> LOGO_LINUX_CLUT224_FILE ;-)
>=20
>> to their config to restore the old behaviour anyway.
>>
>> My choice would go more toward the removal option but what do you think=
?
>=20
> I am not too attached to keeping the dynamic behavior for the Mac logo,
> I just wanted to point out the impact.
> I expect most people who care about logos (in products) just have their
> own custom out-of-tree code.  As fb_find_logo() and the underlying
> infrastructure still exists, I don't expect them to have too much
> trouble forward porting that to newer kernels.
>=20
> What do other people think?

This is about a small visible icon. It's not some relevant feature.
So, I think it's unfortunate that the patch then drops the specific mac lo=
go.
But adding additional coding and complexity to simply make this logo
visible for such a small user base IMHO does not justify the effort.

Helge
