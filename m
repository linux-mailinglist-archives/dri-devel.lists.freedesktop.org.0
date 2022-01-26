Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878F49C876
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 12:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA9010E882;
	Wed, 26 Jan 2022 11:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B424E10E882
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 11:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643195900;
 bh=+PuqQOa8ZIasq9nywZV54YoR4zKFhnHcgqEzAOKfTdA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=K/RNfBZN9xjeHAexpSxt3QsddHquW+fJOSFxykEQ+0jJMiCNcDiYTFhmXQTLoc1M/
 V3rwgNYvhVrxt/5aIsN25LE/hXO7HqOvN8ONSQLp0fvs6bJqEKUWf8k6oCen50jKtd
 3vxkYF2d0tQD/UfgjlqHfR7ro2AdUmhzrvLgpYZI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.143.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZktj-1mjJ3E3hOJ-00WjWx; Wed, 26
 Jan 2022 12:18:19 +0100
Message-ID: <f671a112-880d-1526-a395-360947b40c5a@gmx.de>
Date: Wed, 26 Jan 2022 12:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/4] fbtft: Unorphan the driver
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <20220125202118.63362-2-andriy.shevchenko@linux.intel.com>
 <YfEG2qVO9K9G+g1d@kroah.com>
 <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uGoRC9a4cMCADTipV67oivfWvTw=6RYm2kOthB_bhWnXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TT1QJY2gC8uB7kkLOHzSTdzit3og0cbZ6iIm4K+D70BWn9LFy20
 l82OzF7oSlgOVk10ARiXac/4IMSPwdE94cHTsIYXjVflcT4ta0BeI7P90ST1AdNSDoeG8KD
 g5vbiwlbnl1KldKuVDL7LnVecVnEwdpoMTHL4ohOG/+YJHxM/whCTfoJc61b90H3pvhHOpj
 6nGxFKXFupb5oRYAAP8oQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mTSrC5H5Tvo=:bA6ryL8DJGrwAfD6QK0RLg
 PukffV8q/3LZpSbB+HmwmiWEHRsqaExtyg9RhnZwx7aq5fhxQ1y1KMEIapBfH2j/pdXpMSrNE
 i2CMHd/OQ4Aj6ilbtYnw5wsK3diaplPrs2Vg9ajkP/kXgP4C8jm1hwP+XDvfjaWiZyYsIogPk
 EN70Fa4lMxKOmioQHQkpy5R1dknyBOdKbajldqX043Zo0P5qooY12udATTo9fOsZNmnWUD3nr
 SHAQ2KCYyIi+LOWI5aiZcicDzj6OhEHuFOLCrVLup5aYq0dt7X8GezZAmf7X0/yVZzhlUzv84
 nioT3TNzcheckIsoKJLxmFduYpBPhSINodSZv6D8UBTGg3xGb5GTbzY6ZjGdInBFPObcaa4of
 arikV7daPmMyph8GKLZmK0PHxJrOnmUE5BVCLvPSWolv1n6ee2TZscHN1BhDq6u4uT7dlF0nB
 kPp+jlEWM85BRuvr2VwAtoIIeLnePv9iA5JrS5nyN267eszqDU6S4XJr1WUpy1f1Sn2xlA6SS
 OZpikJ+RaQSwXoLY4PFsAXPMiOekOHoCc9qWvx0p1e1dRYp4FvIFYXG0sUJQ0FURpUUkW3Z0M
 ApUhAJxP0BkeVBxxEoZde8KeYRp/cgYrMGdjxuBDI5pzmd5O0q9QaeBVf3r8wKQpY456xBCTF
 VHrd+XHLbUlTablmXGi691iTQb/KcuDCyUbpdR4JHBn17KvVdte5nSIMIZsPsbUpukXuyujT+
 Y2plKZog6KcZP3artQeQzSIRefI29Iu0TXTdQcea5397zAEPTvAbD9xL+zr/OiejpOJN1CS7j
 ddC3tSorFAFdzJpGJCZtFOvWnRD++UmbxMpzqB84ojW3XvZ54AO71u4IDMmwT6uTUAU4yhxDE
 A3AIwVvIZ77N5T2vax9zfhKwIAYMYfsMrQnD7J0tWB86G/Qtk5lesBPQCG0SWNgtiY6KoLw7r
 29RP9atqlPlcMlWv9EoXUhvyDZNRRx2h2PJerMYW4XXWKz8SNmcXbT5cW4tfwP4XeKzyVELp1
 +jpg9VcZHGk20iTk2RAJjw3Kc+Q2+Tb/FUOgx5rg/PzI6yPMIMgbv7ya+DRIsda/uZXtlGdKA
 sTLxv3C0F6l3IHoD9uzlJscnzfEAYLa1FQ1
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
Cc: Andy Shevchenko <andy@kernel.org>, linux-fbdev@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>,
 Carlis <zhangxuezhi1@yulong.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/22 11:31, Daniel Vetter wrote:
> On Wed, Jan 26, 2022 at 9:31 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Tue, Jan 25, 2022 at 10:21:14PM +0200, Andy Shevchenko wrote:
>>> Let's maintain occasional fixes to the fbtft driver.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>  MAINTAINERS | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index ea3e6c914384..16e614606ac1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7372,9 +7372,11 @@ F:     Documentation/fault-injection/
>>>  F:   lib/fault-inject.c
>>>
>>>  FBTFT Framebuffer drivers
>>> +M:   Andy Shevchenko <andy@kernel.org>
>>>  L:   dri-devel@lists.freedesktop.org
>>>  L:   linux-fbdev@vger.kernel.org
>>> -S:   Orphan
>>> +S:   Maintained
>>> +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbt=
ft.git
>>
>> I'm ok with the files moving if the dri developers agree with it.  It's
>> up to them, not me.
>
> On one hand I'm happy anytime someone volunteers to help out.
>
> On the other hand ... why does it have to be resurrecting fbdev?
> There's an entire community of people who really know graphics and
> display and spent considerable amount of effort on creating useful and
> documented helpers for pretty much anything you might ever want to do.
> And somehow we have to go back to typing out things the hard way, with
> full verbosity, for an uapi that distros are abandoning (e.g. even for
> sdl the direction is to run it on top of drm with a compat layer,
> afaiui fedora is completely ditching any userspace that still even
> uses /dev/fb/0). And yes I know there's still some gaps in drm,
> largely for display features which were really en vogue about 20 years
> ago. And we're happy to add that support, if someone who still has
> such hardware can put in the little bit of work needed ...
>
> I don't get this.

You are describing a transitioning over to DRM - which is Ok.
But on that way there is no need to ignore, deny or even kill usage scenar=
ios
which are different compared to your usage scenarios (e.g. embedded device=
s,
old platforms, slow devices, slow busses, no 3D hardware features,
low-color devices, ...).

Helge
