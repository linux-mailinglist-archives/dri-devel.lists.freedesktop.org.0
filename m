Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E90A493A43
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E131810F0ED;
	Wed, 19 Jan 2022 12:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0931010F0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642595353;
 bh=AzTwOkP2qFnqwWKULceIA25l5VnbUIb4mxUkPf/nTzo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RfMii8tw7jSZtIvm9xiEwlmoEvvajRQGG0f5Bek3CszkjEYjqxiJGTgGU9ep1ZCOU
 f3uFvF2v/7LDarAuqEs7IdpCb71k2gZb6tsFS4Gdu4G18WSYpuUgrguYh2Hyms60w4
 5ScBtF+5b3z7Rpq4ImuT41xvHpJ66pvyOOk0E97o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ygY-1nGE5n230Q-0064UN; Wed, 19
 Jan 2022 13:29:13 +0100
Message-ID: <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
Date: Wed, 19 Jan 2022 13:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kH6rz4fWH4V5I9BuuMjlUgUgN4zBgAIh8HdN1Q57L7UUprT5obY
 YPluvR3niGe8oQy8iy5Csh7ruQsVz2XkUrPl9vr24Xhb9586ElsISuWodSPaPMIZBzDTek0
 EZ8UoUWc7QgpZJoHd7Vp8Dgm62X8A94TaQ/qpJTWtBZUPdBy0fTF+bDKW4leQfLggle0ys2
 HpJ3Qq18ysc/QI2tfGjcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y12KkCrP0wM=:LVLC78OFUBA0Maz52K+ooI
 c5vjpiraec9GiDC5ssk80QeQinJphuKF6ECxaZFsoE75u6q/BVx5B4VQgMVv2jn/oN/ff57B+
 eC/JbIkuesva7Wg/Y3phJcfGB1fHh9K+NW7KL5suEnMekUe5utmETAHEAQTuIrU9iQIGjMNxM
 FieYF0jay2AUkHabSuamsOcfW46QtK5lfusSU1wKdLWynnc9g8FLehoFpe7B2/V9waAnA1QOb
 ezALILRsXqWGHC5hkrs2X3KRJsOMqFxz1dFj8FBc8uPUozxkDJePAl5xqurjy1npLmstqTR1/
 aiKvfLmAJHGOfHMggzvomC3SM0lyvn/KR6WiEaOQwnWe75HS3nGc5/hCsDmX9KmAqzRxIVkfm
 5QvEtI1GG8azB9EISmUbYKKwT48nbvRNL66rTpb6bi9R9DTxuDO1NGj4Qnaofp0K4z0AD/LoN
 EpzEjYGy3ff+sj9H2uOQmB8y6/04HdSHkFXm5j+NuGBqe9Yt28LBHJusiVY2BENVautCBy1PL
 kKezZRWPhsPLmiXDgAmQlDHmnFlIWpBaoA9zjAKWfT1SvV0nW9ciQ/KL+V3qGSCU8MFCQZBiK
 IE0BH1SfLui4waAy/fxhK/Vzvq8bNM+Xn11zVO/BJca2iudX9l6tNWwOr4Q9GqseRa6ORqBnw
 H2nw91Zdy8y2Lugkx56PrWxr7fR1skVgxC4Q5e88ZeQfgOp9ocKL9y0RhKxcW5Fr8atRu8ri2
 aL6skB9QEUGES6cmoDCJSU1KXMvF9Z2KfgfXTmsGWyVdoAoHyQX8naM1bWy7x+Qq8ZL+JQHfo
 06gu6Z7JhRurQrrCYfokFmrQqUwR/8iG1+MwoWCyTPhgmNjYrdZuTYYUkvULGUIGT3/and8Cr
 fhM5pZT32Hs62/aN23oMuq/neT/P2OC23FGm4MeVyTOebQ9rcaT962KYiP5Ju2ozeANRlPle7
 YGP96uwsWfNmSq8p3UFcwTdVn0Si3P2ogeYyOjXgtHXf+DD6sjgCUHmnUn7hVc2r+ehVJnezR
 DhuzQ/iSJ8GOCmn/+eZUC/4c3P7DfZvkC/fOFSoMQ//HQZBU72oI10c1cDQsdkvkr/VQHzwew
 +LDc1+Stqv12rA=
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
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Greg,

On 1/19/22 12:47, Geert Uytterhoeven wrote:
> On Wed, Jan 19, 2022 at 12:28 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>> On Wed, Jan 19, 2022 at 12:22:55PM +0100, Greg Kroah-Hartman wrote:
>>> On Wed, Jan 19, 2022 at 12:08:39PM +0100, Helge Deller wrote:
>>>> This reverts commit 39aead8373b3c20bb5965c024dfb51a94e526151.
>>>>
>>>> Revert this patch.  This patch started to introduce the regression th=
at
>>>> all hardware acceleration of more than 35 existing fbdev drivers were
>>>> bypassed and thus fbcon console output for those was dramatically slo=
wed
>>>> down by factor of 10 and more.
>>>>
>>>> Reverting this commit has no impact on DRM, since none of the DRM dri=
vers are
>>>> tagged with the acceleration flags FBINFO_HWACCEL_COPYAREA,
>>>> FBINFO_HWACCEL_FILLRECT or others.
>>>>
>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>
>>> As for "why", I think there was a number of private bugs that were
>>> reported in this code, which is why it was removed.  I do not think it
>>> can be safely added back in without addressing them first.  Let me go
>>> dig through my email to see if I can find them...
>>
>> Ah, no, that was just the soft scrollback code I was thinking of, which

Right.
That was commit 973c096f6a85 and it was about vgacon, not fbcon.

I did mentioned it in my cover letter, together with my analysis of
the reported bugs.

Maybe I should have put all the information from the cover letter into
the patch here as well. If you haven't read the cover letter yet, please d=
o.

Helge

> So the bugs argument is moot.
>
>> was a different revert and is still gone, thankfully :)
>
> FTR, not everyone else was thankful about that one...
>
>> This one was just removed because Daniel noticed that only 3 drivers
>> used this (nouveau, omapdrm, and gma600), so this shouldn't have caused
>> any regressions in any other drivers like you are reporting here.
>>
>> So perhaps this regression is caused by something else?
>
> 1. Daniel's patch was not CCed to linux-fbdev,
> 2. When I discovered the patch, I pointed out that the premise of 3
>    drivers was not true, and that it affects 32 more fbdev drivers[1] .
>    The patch was applied regardless.
> 3. When the patch was suggested for backporting, I pointed out the
>    same[2].
>    The patch was backported regardless.
>
> [1] https://lore.kernel.org/r/alpine.DEB.2.22.394.2010311116530.379363@r=
amsan.of.borg/
> [2] https://lore.kernel.org/r/CAMuHMdXRgam2zahPEGcw8+76Xm-0AO-Ci9-YmVa5J=
pTKVHphRw@mail.gmail.com/
>
> Gr{oetje,eeting}s,
>
>                         Geert
