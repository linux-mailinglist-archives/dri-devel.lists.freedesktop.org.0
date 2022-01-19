Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07519493EA5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 17:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D3A10E16A;
	Wed, 19 Jan 2022 16:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCCF10E123
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642611383;
 bh=790ASOPuelDKgJCWbHfE72K9QtVauJVh+5rgqS6XWlg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=IO5N5LDnCrJ/sUXAXxb0DnYgrElXjrComLAgS5+zl6QcmTfdrRdy5Kb2UaCNF56AO
 4+chFyFSKxgAbG7fOYdjkHGvRXIrJbZAmmPUiwBwdOrKGZLZ38TZsoqilXSHUiahBC
 JSVeomxeOmq9hdljttLWEO4gLj5fKJY3ILBvGG0k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1mLj6F233Y-00xZhO; Wed, 19
 Jan 2022 17:56:23 +0100
Message-ID: <408c5dbd-a915-e3fc-fafb-738f6badc91a@gmx.de>
Date: Wed, 19 Jan 2022 17:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
 <ccec8635-6ec6-89c3-6738-65bd07a48508@suse.de>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
In-Reply-To: <ccec8635-6ec6-89c3-6738-65bd07a48508@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mCGZru8DeL3paShNjPqKyVgOekHsVUXzqSNQGg8DN6QsWjcg8iB
 nClHsEFZqoJUpviM1uVCxS1J5nDqsatiawqr+YD8RCrVJwTO62HJwFWKznhIwkZGf0Tqjin
 1gDbcTWRjMkW2BAJnIIPKFHUzS5ZNgxVXyzAHI0oBdodkkt+VAnXTQCBK2kJxY010TNf7jr
 nYMC5mUkUFMU9uTKjjwaA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CqdHO7XByJw=:Bjksvg/0loelnHY0g2Sn7o
 gQimfaj37A7jnR23nka+ASNgAktHt+dJppwpIBNFBovUjLAYf/0BDIRrM2olyn6qQ7Aw4eSMK
 MC0+9a5xxRJKqpH/yjBhdXhcsABAh29ykTiWDlyCKJs7Y5QXhV7O3C2mqYgFOEicupL1DsD24
 Z5QTyxDS65Ks1EGAFT/i3sef9gUt+e3muiSMquwgRxL8FO7q6x+UpTNwf2gfmHwuV47oDWWc3
 NM7NVnAtykAUU3b0BYcI6Bm4eFPZSOpJfUYd564LNzieBFmqWXw1EQHmcZ8zaKKxvcHF+DEKC
 z/EY1VzsILfNmHUHzTM5jntd4btxWS6i3pyN6SRg7cCOupvunlRkLC2TQnZvERYSeBThesitC
 wQJHHvbFQvDdhkNfO1rmuqy8Hq2ggqKcNcHO8os/0j2aLlpATpViC+bLyDrctplJ2f0CN6mxp
 VZI5cAPtYH0/H224ecshZIFfE2dJixShCNGLnPRJN6fmyYEIFTM4bUstEcSK5Uq2jGi6yOKAE
 iCpA1H19fZXbeNE5BzgaLgHOW5dk+dUdzG5A6A4ltbdxzDf7Drb8qA+rQttmNRK9l3b2uEkPK
 Y63F6PeStnOMT3g0LXavbFkB587q7e5FfSJvzZcq3WdTB1Y8+nn3MyQ/vvZuu/Hxe0BBtuDj3
 HB6XF9MiAiR8/ZPmrdBiGkgamQE/FntuX8dkpTIHbssDcaJuf2kvrLsl68CB3E/+3qyOd6Q+N
 +rgt8I388rhCtwHj6FPdpi+I4Z18gs6Py8jtCHv5JmWpyP7FemezWeYcqSQ8+l8t6OzaPlpVe
 iZCMr2TrMAg6Gw7EOh3sB1+BlUkldF2zlBQg/q4lT3WdZiaWt3MkVAXGqh+6XTr36F1PAK9F7
 aBqWjVtSVZK1Gdtbik+Ojs+09HgYMhgiPqyFpHuARt2SId6jCkRYv1QtH0qvHk99Uv3MyCU+2
 i3/kTT6vzs2vzrk+eUG9IG9UAX/u82uK6v+zOKCwMk7/npWk6bO3Gncg7ZMq9SpIGZNTMVRxL
 Kil8RcyDRtUwhF8SfB57lCaoEgFzIHeGqvsJd5WUG2jrfpyDpbD/5Hs8vw89tK95IGUVnZIMh
 1iFE/XW/in0eYI=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 1/19/22 16:37, Thomas Zimmermann wrote:
> Am 19.01.22 um 16:05 schrieb Sven Schnelle:
>> Daniel Vetter <daniel@ffwll.ch> writes:
>>
>>> On Wed, Jan 19, 2022 at 3:01 PM Linus Torvalds
>>> <torvalds@linux-foundation.org> wrote:
>>> Irrespective of this code being buggy or not buggy I think the bigger
>>> pictures, and really the reason I want to see as much code ditched
>>> from the fbdev/fbcon stack as we possible can, are very clear:
>>>
>>> - it's full of bugs
>>> - there's no test coverage/CI to speak of
>>> - it's very arcane code which is damn hard to understand and fix issue=
s within
>>> - the locking is busted (largely thanks to console_lock, and the
>>> effort to make that reasonable from -rt folks has been slowly creeping
>>> forward for years).
>>>
>>> Iow this subsystem is firmly stuck in the 90s, and I think it's best
>>> to just leave it there. There's also not been anyone actually capable
>>> and willing to put in the work to change this (pretty much all actual
>>> changes/fixes have been done by drm folks anyway, like me having a
>>> small pet project to make the fbdev vs fbcon locking slightly less
>>> busted).
>>
>> Saying it's stuck in the 90ies, and actively trying to prevent
>> Helge from taking over maintainership at the same time looks odd.
>
> The issues are in the design itself. It's impossible to model today's
> hardware and constraints with fbdev. It's impossible to change
> configuration in a reliable way (i.e., what DRM calls atomic). Fbdev
> mmaps plain video ram to userspace, which is one of the reasons why
> DRM's fbdev support is hard to improve.

That's fully understood, but I think you are mixing up things here...

The fbdev userspace api is most likely not the best way forward.
I'm sure that drm can and will provide better solutions for userspace.
And userspace will surely pick up those new interfaces.
DRM folks will drive it in the right direction, I'm sure!

But in addition fbdev/fbcon is the kernel framework for nearly
all existing graphic cards which are not (yet) supported by DRM.
They need fbdev/fbcon to show their text console and maybe a simple X serv=
er.
If you break fbdev for those cards, they are completely stuck.
Hopefully those drivers will be ported to DRM, but that's currently
not easily possible (or they would be so slow that they are unuseable).

So, I don't think you should try to improve DRM's /dev/fb0 support further=
,
but instead work forward for a new interface which perfectly suits DRM.
That's Ok, and my goal is not to prevent that.

>> I think Helge should at least get a chance to fix the issues. If the
>> state is still the same in a year or so it should be discussed again.
>
> You cannot fix that in 10yrs.
>
>>
>>> The other side is that being a maintainer is about collaboration, and
>>> this entire fbdev maintainership takeover has been a demonstration of
>>> anything but that. MAINTAINERS entry was a bit confusing since defacto
>>> drm has been maintaining it for years.
>>
>> It was marked as 'Orphaned'. Anyone is free to send a Patch/PR to take
>> over maintainership. If you have strong opinions about that code (And y=
ou
>> obviously have reading your mail, set it to 'maintained' and care about
>> it. Everything else is just wrong in my opinion.
>
> No, it's not wrong. Helge takes fbdev over the weekend, without notewort=
hy experience, and ignores advice from the people that have kept it alive =
over the past years. This isn't going to work in the long term.
>
> Best regards
> Thomas
>
>>
>> /Sven
>

