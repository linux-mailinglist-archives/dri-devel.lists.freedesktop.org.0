Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A84A71BA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 14:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF4010E4AF;
	Wed,  2 Feb 2022 13:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B0310E4AF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643809278;
 bh=E0IWSTagHFdaRRy+uOp/MdvwmV/orbAmsdCNwaDpa50=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=LsMb97Y+PMq1IFMZC85lMielIv25vX+8t8hhUUT7kCKhla4RXVFiS4K9tJTR/HYDE
 EWmdntEg/H+pklrCk4Dq3fQ9Zqc7hDgm/YduuQz2dB4jaQPbKDpvAXcuhcG7EyskQf
 9v3OcPBBUuCcUAjAdzi6xGh/e14UUq4kCg/XtXU8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.163.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1nCUzc00rq-002myc; Wed, 02
 Feb 2022 14:41:18 +0100
Message-ID: <67bca423-f61b-27fa-783d-1d933de65d0c@gmx.de>
Date: Wed, 2 Feb 2022 14:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/3] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220201185954.169768-1-deller@gmx.de>
 <20220201185954.169768-4-deller@gmx.de>
 <CAKMK7uFmMcC4p_zDq5G1Rpvjeg0zOz7v38mTj57JDZEis9fGAA@mail.gmail.com>
 <dd186ce6-56b3-fe68-daad-249b18ebd627@gmx.de>
 <CAKMK7uGAMSGx4hNFAO5iqsL+ZeTS_L6Bx5YERkY=Bi2CGmJg-g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uGAMSGx4hNFAO5iqsL+ZeTS_L6Bx5YERkY=Bi2CGmJg-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aHe6GHJ0x6RuF5H7/X75+uv1uO5MhBN2ENkK0xaIP10jSdwfiE0
 mueButNiblylZOwJwyR6kx+f7NhIOgswDK5145G4pv06ovipYm444CNRJGmf0iyKZkaWHnp
 tSjk5NEQH06rQ8UuXmG9VFQ/PY/+JNz7Vb3j6f3k4QJ5vqTgXXmd+Bw798f7TFwZMOhjy0r
 e015D5gDuW3CkheKLudtQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lQaErjCr2hs=:A+lklxE73LKMG/giL8xgSz
 vvurpSMCvuNeyoYXHWbY4ygFzs01wkBwUupaandfEnSuK1MB7PO09QMoBqN1hKWCds50GO74z
 8fAMFXPipJ3e4TzZIM1UZVqgR9GB7VmACNd+b9BpKG9Jqv81OsIddP0Ou6Calha64y6mwjpm7
 sO3a/cmGSx8DYvt9toGpbLUIDtzPMlHPLM5wO97X9hCkWMvBbOCnXXRUpjEjl4DTgj/As1cYi
 9Uv3dPBVpkUM40MMqnt1RRiFG3wocDKD/9rMHxhkf7CeskbPNl8BIp7ScQ1qLKXQ97XJDheD/
 nPfixM2m4McDJ6+HUyHrj1Qx1CKHYl+MDr9qa5iuuPHOt0BM5nwOmTY16R2pGSHBA3xb3MFkd
 9szrd8U7OIVgITAnBUnjYpFElKvtArmG8Yc9CNcC1alUvyoHrWQ/Bf/z1Xvxva4Ecw87PjKYo
 1/fXsbZAsh4rDCyjITAXuOFU2aT+DyDacnJw06Clu4vSDRLSafeLRRBBsdVhVunE7KQ2DLawP
 6NBw45Zd+oZii0gHB/fCz4g/ld/F0+lHmPDr20WiUoIPm9dYrnKExwgyWUB8ieInAxrTON5KX
 IrsNjoJ+4qdzzQftnqPn+VZ8joqnjpXx96+BPXHl8PrTRPzYj0ta2Ck4bFfbopQFknc/djoU1
 1ktp+bGUayW300r9K9O1UHvDdTVv1fPKiO199xzu6LizPYdyv2RJ7MtMYWyp+AH9t8ySF1knq
 PQ9KSE6hCdWFYSRMxiAazFWlLc1GcPkIpVc66hIRQ7C76hwYT7Er4u3CMj8txVqer9yoJ/Cam
 Ewx2AthETGogFx3zrEvyM+VeMpw0b5+Jcuk0NT6qXuqU2FO4xyvGXQt2uNP7UOsWFDOYukYqQ
 WftoUfFCjP7g55GijUWEVNrvcmKMoWPPvf+WU5HSLn9ZgTaIp69kPel14fvfs1Rybv7dkuu9p
 vjwv0fBt3HxYcMIRzJGyqbZHamY3PbzqhWJpNrTMhLaqHUUxATQMJLQ1nMgu3tPkRixSu4YTd
 ZB3P52qmtUVcvha0c+984NLm5uzZxClxYepzmlM2+OkrWBn8Y3bxQblL1+1ATyHiZfCZzhggU
 roPHSrlPZfLESM=
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
Cc: linux-fbdev@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 12:05, Daniel Vetter wrote:
> On Tue, Feb 1, 2022 at 11:52 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Hello Daniel,
>>
>> On 2/1/22 21:11, Daniel Vetter wrote:
>>> On Tue, Feb 1, 2022 at 7:59 PM Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
>>>> enable bitblt and fillrect hardware acceleration in the framebuffer
>>>> console. If disabled, such acceleration will not be used, even if it =
is
>>>> supported by the graphics hardware driver.
>>>>
>>>> If you plan to use DRM as your main graphics output system, you shoul=
d
>>>> disable this option since it will prevent compiling in code which isn=
't
>>>> used later on when DRM takes over.
>>>>
>>>> For all other configurations, e.g. if none of your graphic cards supp=
ort
>>>> DRM (yet), DRM isn't available for your architecture, or you can't be
>>>> sure that the graphic card in the target system will support DRM, you
>>>> most likely want to enable this option.
>>>>
>>>> In the non-accelerated case (e.g. when DRM is used), the inlined
>>>> fb_scrollmode() function is hardcoded to return SCROLL_REDRAW and as =
such the
>>>> compiler is able to optimize much unneccesary code away.
>>>>
>>>> In this v3 patch version I additionally changed the GETVYRES() and GE=
TVXRES()
>>>> macros to take a pointer to the fbcon_display struct. This fixes the =
build when
>>>> console rotation is enabled and helps the compiler again to optimize =
out code.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> Cc: stable@vger.kernel.org # v5.10+
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>> ---
>>>>  drivers/video/console/Kconfig           | 11 +++++++
>>>>  drivers/video/fbdev/core/fbcon.c        | 39 ++++++++++++++++++-----=
--
>>>>  drivers/video/fbdev/core/fbcon.h        | 15 +++++++++-
>>>>  drivers/video/fbdev/core/fbcon_ccw.c    | 10 +++----
>>>>  drivers/video/fbdev/core/fbcon_cw.c     | 10 +++----
>>>>  drivers/video/fbdev/core/fbcon_rotate.h |  4 +--
>>>>  drivers/video/fbdev/core/fbcon_ud.c     | 20 ++++++-------
>>>>  7 files changed, 75 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kc=
onfig
>>>> index 840d9813b0bc..6029fd41d7d0 100644
>>>> --- a/drivers/video/console/Kconfig
>>>> +++ b/drivers/video/console/Kconfig
>>>> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>>>>         help
>>>>           Low-level framebuffer-based console driver.
>>>>
>>>> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>>> +       bool "Framebuffer Console hardware acceleration support"
>>>> +       depends on FRAMEBUFFER_CONSOLE
>>>> +       default n if DRM
>>>> +       default y
>>>> +       help
>>>> +         If you use a system on which DRM is fully supported you usu=
ally want to say N,
>>>> +         otherwise you probably want to enable this option.
>>>> +         If enabled the framebuffer console will utilize the hardwar=
e acceleration
>>>> +         of your graphics card by using hardware bitblt and fillrect=
 features.
>>>
>>> This really doesn't have much to do with DRM but more about running
>>> questionable code. That's why I went with the generalized stern
>>> warning and default n, and explained when it's ok to do this (single
>>> user and you care more about fbcon performance than potential issues
>>> because you only run trusted stuff with access to your vt and fbdev
>>> /dev node).
>>
>> I think this is something we both will keep to have different opinion a=
bout :-)
>>
>> This console acceleration code is not exported or visible to userspace,
>> e.g. you can't access or trigger it via /dev/fb0.
>> It's only called internally from inside fbcon, so it's independed if
>> it's a single- or multi-user system.
>> The only way to "access" it is via standard stdio, where fbcon then
>> either scrolls the screen via redrawing characters at new positions
>> or by using hardware bitblt to move screen contents.
>> IMHO there is nothing which is critical here.
>> Even when I analyzed the existing bug reports, there was none which
>> affected that specific code.
>
> Maybe to clarify. The issues that generally result in this code going
> boom in syzbot are when you race console activity (which can be
> largely controlled through VT ioctls from userspace too, plus
> /dev/kmsg) against fbdev resizing on the /dev/fb/0 nodes. The locking
> there is kinda wild, and the code is very hard to understand. This is
> why we've resorted to just disabling/deleting this code because most
> cases we have no idea what's actually going on, aside from something
> is clearly not going right.

Yes, that's clear. But that (missing) locking needs to be on a higher leve=
l
in the call chain, so the same lock fixes would fix scroll-redraw and hw
acceleration.

> Also the multi-user here means "you run untrusted code from other
> people", not "you run multiple things in parallel" or "multiple people
> are logged in at the same time".
>
>> Anyway, let's look at that part in your patch:
>>
>> +       bool "Enable legacy fbcon code for hw acceleration"
>> +       depends on FRAMEBUFFER_CONSOLE
>> +       default n
>> +       help
>> +        Only enable this options if you are in full control of machine=
 since
>> +        the fbcon acceleration code is essentially unmaintained and kn=
own
>> +        problematic.
>> +
>> +        If unsure, select n.
>>
>> Since I'm willing to maintain that scrolling/panning code, I'd like to
>> drop the "is essentially unmaintained" part.
>> And the "known problematic" part is up to now just speculative (which w=
ould be
>> valid for other parts of the kernel too, btw).
>>
>> As this whole disussions showed, there are some few architectures/platf=
orms
>> which really still need this acceleration, while others don't.
>> So, why not leave the decision up to the arch maintainers, which may op=
t-in
>> or opt-out, while keeping the default on "n"?
>>
>> With that, here is a new proposal:
>>
>> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> +       bool "Enable legacy fbcon hardware acceleration code"
>> +       depends on FRAMEBUFFER_CONSOLE
>> +       default y if (PARISC) # a few other arches may want to be liste=
d here too...
>> +       default n
>> +       help
>> +         This option enables the fbcon (framebuffer text-based) hardwa=
re acceleration for
>> +         graphics drivers which were written for the fbdev graphics in=
terface.
>> +
>> +         On modern machines, on mainstream machines (like x86-64) or w=
hen using a modern
>> +         Linux distribution those fbdev drivers usually aren't used.
>> +         So enabling this option wouldn't have any effect, which is wh=
y you want
>> +         to disable this option on such newer machines.
>> +
>> +         If you compile this kernel for older machines which still req=
uire the fbdev
>> +         drivers, you may want to say Y.
>> +
>> +         If unsure, select n.
>>
>> Would that be acceptable?
>
> Perfect.

Great!!


>> Arch maintainers may then later send (or reply now with) patches, e.g.:
>> +       default y if (M68K && XYZ)
>> ...
>
> Yeah makes sense.
>
>>> Also you didn't keep any todo entry for removing DRM accel code,
>>
>> That wasn't intentional.
>> I just sent 2 revert-patches and an fbcon-accel-enabling-patch.
>> I'll look up what you had in your patch series and add it as seperate p=
atch.
>
> tbh I think it's fine either way. I think it's still rather unclear
> which way drm will go, least because there's not many people who can
> occasionally squeeze some time away to move things forward. Could be
> that we add a new emergency logging console in the kernel for drm, and
> distros switch over to kmscon (which is in userspace, and accelerated
> iirc if you have gl, so most modern systems). Or whether we just
> improve fbcon until it's solid enough. Or some other option.
>
> So given that just dropping the todo sounds ok, it was just a bit
> inconsistent with the Kconfig :-)

Ok, I leave it out.

>>> and iirc some nouveau folks also complained that they at least
>>> once had some kind of accel, so that's another reason to not tie this
>>> to DRM.
>>
>> The above proposal to add additional "default y if XYZ" would enable
>> them to opt-in.
>>
>>> Anyway aside from this looks reasonable, can you pls respin with a
>>> more cautious Kconfig text?
>>
>> Sure, I'll do as soon as we have a decision on the above Kconfig text.
>
> Ideally if you can send them out today so it's not missing the
> drm-misc-fixes train that leaves tomorrow, that would be best.

Cool. I'll send the new series in a few minutes.

Thanks!
Helge
