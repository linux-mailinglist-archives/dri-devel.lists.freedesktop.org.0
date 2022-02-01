Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5734A5E99
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4415110E5CF;
	Tue,  1 Feb 2022 14:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1436E10E27F;
 Tue,  1 Feb 2022 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643727136;
 bh=Ppu2fe2SknRqCjzPrLpnrgoT74PeIL15x7uU295nYeg=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=Cq9r3Q4WKKEjm0CRulBWduKgYFnnGfjEnR24ea08TpxOKDjosBoMReQJ/NyFwigSj
 rrHMv+Gp3Cf9/kotxTSRunQHc/8eKn16gVdS00P0VyCvWdgriZBkqrXGHUVd4UzPEm
 gyHdYyoNFw6u352SzovoETa3Hubsvagmuuxa+dNY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1mdMlq3VsH-00bq89; Tue, 01
 Feb 2022 15:52:15 +0100
Message-ID: <313c4c72-364b-1d61-09c1-e4a83cbefe6a@gmx.de>
Date: Tue, 1 Feb 2022 15:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-4-daniel.vetter@ffwll.ch>
 <9c22b709-cbcf-6a29-a45e-5a57ba0b9c14@gmx.de>
 <CAKMK7uGvOVe8kkJCTkQBEFw+3i2iAMANsyG9vGqZkcROZ9he4A@mail.gmail.com>
 <63018892-68e8-01b6-1e8f-853892e15c97@gmx.de>
 <CAKMK7uHPn77GA12fFjmvkRUDQXSBkbYK5X=rJp8sfO_xarys_g@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 03/21] fbcon: Restore fbcon scrolling acceleration
In-Reply-To: <CAKMK7uHPn77GA12fFjmvkRUDQXSBkbYK5X=rJp8sfO_xarys_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IRy4dUpPRyC6JoVz6eDbg44ZsDZq9HRZagPV8o8rpwmU0AsYWE9
 O62wvVZyQ6f0IcW5rn//EpW1cS0UG8iiJjLCEv6ptvqJ/fr6EtQTvPenfxV/0MwO8r9nIDS
 RJi5Y3cXjWc77t/8CDdpQUsA72tqfymYqezS8MevmF/Qk5zwLfmip0iPhAdNN3QMDPsBN8J
 3HXYUqsU9iVYLsEd5t8pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TRx9+vKgEdY=:uzc0Rl5U3PklLCw3iz9orL
 nNAX/AyTUB4fQrR+HTxJAX7uIrFG/N9VNUm3eIW5ouOw67SQc4CalniRc0hVswxtieWkAcRK2
 sambUbFxVS4NqbeQFJYEC0Vw+P3t4FeTtUMQftqPGNPS7iKP/+9ebJ2pNZGnteIO/lGZAPLiO
 YeXkvzwU2Hioo10DmK2a3xZWW9b1fz1RA6N9D2Xy876om1u0SG+SLrYyBajnNiQRJ8L76dHPy
 gACPKoXNHZcLQoF0SMEHDOkzUT9zp+rwjQLRfRnM3AZv6HT/Zq4wt6odXkUSbei17Og0Nla82
 kgtdKg54pkcBW54+yqWYnDXEO15A0f4t7qKZGU5r3B8FjCU07wzVEfS0xACRYkGWGzxKFoj8D
 G+F41JrD36At48klsv3Ld1cx73DD4aZ4XpUhWiOSwU9rNrGN3MzMNjHpTqmsxCmSbSpODqWKA
 U0MNwWHDqP0NaG3zBF6ZbwcGmziVIyjSystFWSD+7ZUzKJ/VzlZx2ygIrUFmOWE/V8D89grBl
 GELrJPpdku7Gps05ET0OGl1L6lB5oeS3u17Xm2KnzZwuTuG/4Mgb05U854BHdjQgmb1Zkd2Ba
 NCSZ2dblepP0bZbsaaySPmy9NPc3mQqMBCnXA+Dks1rSuUr3iPaLeeaoalDiHDWtpH0cMnYMW
 1xp8z/HQFxzaryxtEFy72r5Sg/n3WVdGuPP8DYy4bgYQk/OKzbkCAfov/nBDMKkHBWJb3IRd9
 LxHjhmNQhXScAqgcAjQEkiENsgmBm48zGPSZFjJhVJ5Xd0RQsAhdEh0VoOO3dxDj62vUzCrSs
 aTytdRdYO3uXfb43VhDcZk5LdEpmYlHPmA6UV0B1tFkP+HpqqOjV/tfJUbyiVb46r9qcZWvvS
 aIWOCyf0/3Pb+yL8nv/Vb5eMKXThfhM0YR8gq0thQAmgwV61HK2Mee3yHUDPYehI3czBygj1B
 x8kWjDJmwCbiCrd+gVJzzgkX3apBgXQHXaFx+mzPQ9mgLuFLJpNPa4udUTLTW2fD5cj1yrYle
 D1kEVtnQI4SQ5wKHh5u+7Ce/IfqU++pt6JpPd53cuy+qWBt3D0hjwexqcBdqnBn80XEW6Ykdm
 dDut2SJwCGi2D4=
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 DRI Development <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/1/22 14:45, Daniel Vetter wrote:
> On Tue, Feb 1, 2022 at 12:01 PM Helge Deller <deller@gmx.de> wrote:
>> On 2/1/22 11:36, Daniel Vetter wrote:
>>> On Tue, Feb 1, 2022 at 11:16 AM Helge Deller <deller@gmx.de> wrote:
>>>>
>>>> On 1/31/22 22:05, Daniel Vetter wrote:
>>>>> This functionally undoes 39aead8373b3 ("fbcon: Disable accelerated
>>>>> scrolling"), but behind the FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>>>>> option.
>>>>
>>>> you have two trivial copy-n-paste errors in this patch which still pr=
event the
>>>> console acceleration.
>>>
>>> Duh :-(
>>>
>>> But before we dig into details I think the big picture would be
>>> better. I honestly don't like the #ifdef pile here that much.
>>
>> Me neither.
>> The ifdefs give a better separation, but prevents that the compiler
>> checks the various paths when building.
>>
>>> I wonder whether your approach, also with GETVX/YRES adjusted
>>> somehow, wouldn't look cleaner?
>> I think so.
>> You wouldn't even need to touch GETVX/YRES because the compiler
>> will optimize/reduce it from
>>
>> #define GETVYRES(s,i) ({                           \
>>         (s =3D=3D SCROLL_REDRAW || s =3D=3D SCROLL_MOVE) ? \
>>         (i)->var.yres : (i)->var.yres_virtual; })
>>
>> to just become:
>>
>> #define GETVYRES(s,i) ((i)->var.yres)
>
> Yeah, but you need to roll out your helper to all the callsites. But
> since you #ifdef out info->scrollmode we should catch them all I
> guess.

Right. That was the only reason why I ifdef'ed it out.
Technically we don't need that ifdef.

>>> Like I said in the cover letter I got mostly distracted with fbcon
>>> locking last week, not really with this one here at all, so maybe
>>> going with your 4 (or 2 if we squash them like I did here) patches is
>>> neater?
>>
>> The benefit of my patch series was, that it could be easily backported =
first,
>> and then cleaned up afterwards. Even a small additional backport patch =
to disable
>> the fbcon acceleration for DRM in the old releases would be easy.
>> But I'm not insisting on backporting the patches, if we find good way f=
orward.
>>
>> So, either with the 4 (or 2) patches would be OK for me (or even your a=
pproach).
>
> The idea behind the squash was that it's then impossible to backport
> without the Kconfig,

Yes, my proposal was to simply revert the 2 patches and immediatly send
the Kconfig patch to disable it again.

> and so we'll only enable this code when people
> intentionally want it. Maybe I'm too paranoid?

I think you are too paranoid :-)
If all patches incl. the Kconfig patch are backported then people shouldn'=
t
do it wrong.

> Anyway, you feel like finishing off your approach? Or should I send
> out v2 of this with the issues fixed you spotted? Like I said either
> is fine with me.

Ok, then let me try to finish my approach until tomorrow, and then you
check if you can and want to add your locking and other patches on top of =
it.
In the end I leave the decision which approach to take to you.
Ok?

Helge
