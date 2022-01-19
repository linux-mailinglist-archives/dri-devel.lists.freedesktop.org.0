Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DAD493DC4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D117F10E1E2;
	Wed, 19 Jan 2022 15:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D177F10E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642607743;
 bh=YI7Q13xa1667GBXT2yWDs/SWe72Hu8X9+CPfpHuc99A=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RC+x85sZczSRAQWVSK8ejYomi/BNayTf6lz+afsU5eO7YusQ2ncqCoHFNxMxUjvR0
 vAmlv6UFbjP6YNbPtfZxEYMgcq8L5c4+XOMDfx318IGA5xu4rr1WyWIgNHoaWnrIV/
 YOf1IiGj08Q29S2whMs79fIBCln49zZ4sBicRPO8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.183.52]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72sJ-1nEKR61YVT-008d9h; Wed, 19
 Jan 2022 16:55:43 +0100
Message-ID: <40d39363-bae8-93f2-71c6-7d5531f144bf@gmx.de>
Date: Wed, 19 Jan 2022 16:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Sven Schnelle <svens@stackframe.org>
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de> <Yef0j8+DBbwC7Kjv@kroah.com>
 <Yef15k2GtC40aJEu@kroah.com>
 <CAMuHMdVWFJEDwjf-htZ_D1484efmuPnz_L-qhcTeUE-GVpvZXA@mail.gmail.com>
 <4d8950c7-5f51-ca2b-4c93-741c7805a214@gmx.de>
 <CAHk-=wikFKjwdUBWCLCu=iL3rFq4BDDF0aBGdXC6ay74yJb+5Q@mail.gmail.com>
 <CAKMK7uEb53iu_HxYSnFZ59j=vXQdMvTWT7xosEo85XkAwzDMnA@mail.gmail.com>
 <8735ljkboo.fsf@x1.stackframe.org>
 <CAKMK7uHHF22+MBz5D2kBv07X2BR76UDi2-JP7eO-f=nm-pymcw@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uHHF22+MBz5D2kBv07X2BR76UDi2-JP7eO-f=nm-pymcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2z0TYX9D3a0a7Bay37UHJF18IENXDzXFGI/rMc7qUMCnERrLHXu
 9R0jxsNowo9md+SFIj73tzJAjebZpZS64c7i7Q8tU1il0PCTOt2HV7jfJjJHUznf9pO6/ml
 OCm7TtXAy7Oa1Yh46JU4VVNQ8Z7Bj5i/59YTFRRyj8m7BLXQTb5su9A/fd+8bXSu66a0LGn
 ooDTr7eLMAua5vXEINtCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T6BME9pdjQI=:tOIf66w0c6tKIjq1IicbBO
 aPMVUZDDlBJrLWD8XkXldQuAUYwKDyOcKPYTqUoQHitI5+Sw0rkgOgjT3fvbNx1psgTqc3SQf
 55fa841sVz9lVwIqAK5+lZrRMiMIvVM9bdrjvDypEquCQjtzVJyossFPsi2/TW4FULy7I0GQA
 pXMuGM0oNOkf4Dk5G8WKAvyUBt3/43puLz7rWkhjpzi2QbS15QTXG+3TF6UxO8IWrinDhimeb
 ZxTNTBHSRPCsoUoxm62mH9q0N+Re4c10RfaSWN+BC/BOxMv+fJlAu9jGhxTZIMAVB/C6Kr5Zj
 bClr46VFt0J9aqfNy788OWsiEkP8W1K4yZKZmCX77oDIsoTJk14EWX3s/zFtlyuUYaoFH3/Qx
 W4vJhQEprkk3nDuRclolD3Uxsd6drmXavOucrzoYBnQaktFP58dID0q9NjSUimcd44986mnAN
 GdByH7Oss5tSQwQDragzNc85Ym9/31yIqGihIoZFQqBIfhmKNJTI1T4B/Sz6UHtrliIttc2ad
 WRhwPELOu3ypJ4yHVYLXoTufdCbMFtkxRcDdiLLzBgkIlJOlQlfh3BeZHg1Xmf8eShSTTQ+mJ
 bIOEXS3CpAbwDo1/aWTqhJooWSnTnvWk61HF7EkoLJb7DTNfoMxKlaFPSgef67RMDxsN5hJ3q
 FFXpZ+UAw2fIKJLVU85EAMGw8wd9pxCcjJ/vYu3bqgMzfKRDHAXCXTjecGok/bz5APIFD9eBn
 T/13dg+ChWvz7S40E+XGeV/hqhKfJdnW1yGsmTcMhvB0wz8diP/BEw+uy/ZM8qp61sqz2cRZ6
 XGxLwzKaz3ccLJNm6c3zZ6zFPqRcu1n1KpyNfeNmGeY47yB/7F0jbBq3CAuXTj5OqaEKEMku0
 u+U1EVqV0K3zu2DYxTsliLSKw03amUPypqzNuFKcdFmc9O6QAcWED0B/1JYWqCuq2b71x1ixb
 y3AXZzA32WUisTTAiL14v5TdN01x3W4zShjuluzP8pz3mO2EvwWqMEzwpkrEDshgHovX+vpmh
 +kv7ZOT9IzR/GggInaXpodzeysbJAOpA1Pk/bM3hvf0ottZgUFOblptQqCH0CTkaJJN0BBE4y
 bACFjuhhFAciJE=
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
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/22 16:42, Daniel Vetter wrote:
> On Wed, Jan 19, 2022 at 4:06 PM Sven Schnelle <svens@stackframe.org> wro=
te:
>>
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
>> I think Helge should at least get a chance to fix the issues. If the
>> state is still the same in a year or so it should be discussed again.
>
> You don't need maintainership to fix issues. You need to submit patches.

The very first email of this thread is my patch.
And you just added your comments to this patch.

> If otoh you get the maintainership first to be able to cram in reverts
> without discussions, then it's very backwards.
I'm working on the Linux kernel since at least 23 years and am a maintaine=
r of parts of it.
I know that and would never push something which is controversal without d=
iscussions.

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
> I already added dri-devel so anything we drastically change can be
> discussed first. If that's indeed not strong enough then yes I can
> whack in full maintainer entry with a bugfix-only status.
>
> But really I try to not create facts with just editing MAINTAINERS
> first and ask questions later, that's just not a great way to
> collaborate.

Helge
