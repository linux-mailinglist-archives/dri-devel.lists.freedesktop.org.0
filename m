Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F7493CD7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEB910E1B1;
	Wed, 19 Jan 2022 15:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607C810E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642605583;
 bh=1wueW8BO2whJgvsCqgT7W/w+DL8z3im+ceSWmVhDJBs=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=ZCGIGcc48p7NH4m612POSZjIkPA/BEQbPqE7Hcj4txhvyjOMRsA6CieXRdAZof8+C
 FpxsE4DMHVPHjujgpVXQkUC0G0UVenqi8M0pK/o/mlMe08TwmsTkSd3+WrJk+lOz+g
 Wz4dZQQdyawMvF1lozEAzH1aVQl9bx168ugi8iQU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1mXHRN21FS-00n8Tz; Wed, 19
 Jan 2022 16:19:43 +0100
Message-ID: <31410fa2-293f-9b47-8fb1-e2486033fd22@gmx.de>
Date: Wed, 19 Jan 2022 16:18:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
In-Reply-To: <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6zO4hVKFAQeptRF1xDsaMUngTmTgz6fBOQmqxQHV9tYchko01GW
 AXojxLbLPhh04GfuWtYRoKaZNpCezkzKqHUcn1zl8UwTXXQbE/zPMI4qgsJPKV62qcNFlw/
 9V3Uq5pZI3w+MqzYXkwYsJp3sVVl6qn5bYyuY46EZFpY6wAY1dDAfsT7eUrSCiJeBbeXAGu
 Ek5VC3Cm1g4b/uWPzbLbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iRMuHJLEPBQ=:KKJiJoPvAvG6Zo4y71VOKc
 WrByrBlGbkLCfKP0wDoSYzbMf4mTfiMLNyf+MlD4mLhF+g3y2qM3ueH/k2ZtpmP7Fqy8+o8eQ
 QdyS5TiNCzP/BqCkuLr4v+k7kKDHNOqHeAJrv6Vx8XHF0cuyizWb8+G5F8Dil20RkzxJNGXH7
 VcQ4dOctutb5hxU5OpnYQUuMVp6cZPP7NcX9NZqxxu4TwKTfpzifyHXxvnxOD0MrDi+b98z20
 TD56McIS1R6G4a0P7kujxhLhIF9KbWaji/fXcDqtu28DPptDGuxzo0fLKWPN2uAqGP4D9JW3F
 VUYLl59j+lSbj8/tmWSIzHwZsnyWMq+Zgsu897fzmaaUHOBdceOVM1/AAnARzebzjgtn8LaCI
 Z+MPLZlO+7Ms4fh3WrDUTXQLSYHU4f0E5uIi8LbKP1Xl5sKt7h5qdk8OmzXyDhGPqKU5VpXWL
 Id+u54Ud0roTADv9995VS/KMKjCGiOvM5hHFlxV8ecxduXiGQlLxh858Tjbgww4FVXrCGOJeU
 ilEas9T7lOdVvKFefiaSJzRQZ/45wUErO3+trMOIhgoTuq3+Mu9pAkdAC/Buj9CpzQtO9uzPe
 v1DUAtTfBu2nR6R8rD0eb3HjeHfvRSXYtqD24NffaSMoY+jJ1ESakU07jFbcMnL2Mb49pmhXQ
 z2H6ENwKvoa5ZZ0YIMdBARaQCaLI7Aj/6nHuYkhpefgd1vcJDkm4+X9OYVqXCfhOEXvwtv+js
 Er150Fxvl8XJFA1ZoAwwMiUsEG21Z9YG7ztJ7m8cVp2SGnRdgagbGRSiwqzd2oTNRm8a/aeIm
 PdLXDTWFG90z0fFmIWE+XhtVr0oYZvUnDCTCmm+JM23tRVO3oSrnpsLcoTZi8Y7kPc2aDSRjk
 YfeVcXNH9rrq4FlGar/GtP4FGbuk6sTJvm/GJIZiLD67CnsZYam3Gx0KOraVbRQxb1qpDynIj
 Kz0/tmqOEutAHk0/FoSaVlYj1JwuoRcBcC9lVg/OkvFVUH2+ybvneK2UiD+7Vl7XHBXoMJ5UN
 wOvi1Or3jBcsMD4yMXqaUppLbT3lAj/VpHamm7Jpq8zaTlie34Oy9M3+qgbto8Eqg3vofJ0sV
 DrM1T3TKZVspJc=
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/22 15:34, Daniel Vetter wrote:
> On Wed, Jan 19, 2022 at 3:01 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> On Wed, Jan 19, 2022 at 2:29 PM Helge Deller <deller@gmx.de> wrote:
>>>
>>>>>
>>>>> Ah, no, that was just the soft scrollback code I was thinking of, wh=
ich
>>>
>>> Right.
>>> That was commit 973c096f6a85 and it was about vgacon, not fbcon.
>>
>> No, fbcon had some bug too, although I've paged out the details. See
>> commit 50145474f6ef ("fbcon: remove soft scrollback code").
>
> tbh I've paged it all out too.
>
>> If I remember correctly (and it's entirely possible that I don't), the
>> whole "softback_lines" logic had serious problems with resizing the
>> console (or maybe changing the font size).
>
> Yeah that pile of reverts was my motiviation to look into this and see
> what else we could rip out most likely and still have an fbcon that
> works as well as it does right now for almost all users (which is not
> so great, but oh well).
>
>> There may have been some other bad interaction with
>> foreground/background consoles too, I forget.
>
> Irrespective of this code being buggy or not buggy I think the bigger
> pictures, and really the reason I want to see as much code ditched
> from the fbdev/fbcon stack as we possible can, are very clear:
>
> - it's full of bugs

I'm sure that there are bugs. Not just in fbcon/fbdev.
Other than that, if there are bugs I'm sure they are independend
of the question if you use hardware acceleration or not.

> - there's no test coverage/CI to speak of
> - it's very arcane code which is damn hard to understand and fix issues =
within
> - the locking is busted (largely thanks to console_lock, and the
> effort to make that reasonable from -rt folks has been slowly creeping
> forward for years).
>
> Iow this subsystem is firmly stuck in the 90s, and I think it's best
> to just leave it there. There's also not been anyone actually capable
> and willing to put in the work to change this (pretty much all actual
> changes/fixes have been done by drm folks anyway, like me having a
> small pet project to make the fbdev vs fbcon locking slightly less
> busted).

Yes, drm folks fixed a lot of bugs in the generic fbcon code.
I think everyone is thankful for this.

> The other side is that being a maintainer is about collaboration, and
> this entire fbdev maintainership takeover has been a demonstration of
> anything but that. MAINTAINERS entry was a bit confusing since defacto
> drm has been maintaining it for years, but for the above reasons we've
> done that by just aggressively deleting stuff that isn't absolutely
> needed - hence why I figured "orphaned" is a reasonable description of
> the state of things. This entire affair of rushing in a maintainer
> change over the w/e and then being greeted by a lot of wtf mails next
> Monday does leave a rather sour aftertaste. Plus that thread shows a
> lot of misunderstandings of what's all been going on and what drm can
> and cannot do by Helge, which doesn't improve the entire "we need
> fbdev back" argument.

I'm happy to *really* maintain fbdev code & drivers.
Up to now only those parts which were still needed by drm (like fbcon)
were fixed & "maintained" by drm folks.
Nearly all other patches sent to the fbdev list were ignored and even new
submissions for fbdev drivers were denied.
Now in next step really important infrastructure for fbdev-drivers was
ripped out of fbcon, like suddenly denying fbdev-drivers to use hardware
acceleration.
According to the docs the next step would have been to drop even more
code from the fbdev drivers.
This is not what "maintain" really is about.

> But if the overall consensus is that that fbdev needs to be brought
> back to it's full 90s glory then I think we need a copy of that code
> for drm drivers (should work out if we intercept fb_open() and put our
> own file_ops in there, maybe some more fun with fbcon), so that at
> least for anything modern using drm driver we can keep on maintaining
> that compat support code.

It's not about to keep something alive or to stop future developments.
It's about fairness and not actively breaking other parts of the kernel
for no good reason.

> And with maintaining here I don't mean build a museum around it, but
> actually try to keep/move the thing towards a state where we can still
> tell distros that enabling it is an ok thing to do and not just a CVE
> subscription (well it is that too right now, but at least we can fix a
> lot of them by just deleting code).
>
> I think until that mess is sorted out resurrecting code that's not
> strictly needed is just not a bright idea.

That's wrong.
It's strictly needed by more than 35 fbdev drivers and as such
you introduced a regression for those.

> Also wrt the issue at hand of "fbcon scrolling": The way to actually
> do that with some speed is to render into a fully cached shadow buffer
> and upload changed areas with a timer. Not with hw accelerated
> scrolling, at least not if we just don't have full scale development
> teams for each driver because creating 2d accel that doesn't suck is
> really hard. drm fbdev compat helpers give you that shadow buffer for
> free (well you got to set some options).
>
> Unfortunately just ditching fbdev/fbcon compat is not an option for
> many distros still, althought things are very slowly moving towards
> that. Until we've arrived there I can't just pretend to not care about
> what's going on in drivers/video.

I'm happy to take care about it.
That's why I stepped up as maintainer.

Helge
