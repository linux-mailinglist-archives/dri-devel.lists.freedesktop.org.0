Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E1499D3C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC7210E20E;
	Mon, 24 Jan 2022 22:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70E10E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643063893;
 bh=O/gWW4SdGdFvCDMPaydCCXLcqSMbdkD47ayl4x+bqCs=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=idrR5/2sy7iV86MX+VEH5JEzVpyebuoqIVaUZx24wIamcin4VaoTAEUtDnEg06VD9
 S16Q6p6FvPF7ryHjQQAS7QaTq079x4kJdSKVC1Sib1nmuH+IGJHKi3Kdu45NUFfrql
 TjU/DzPJrmzc1Qzgs+w86jlwIdBB71zlaUUpfNO4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.165.96]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1mwo0r0hmC-00OJvR; Mon, 24
 Jan 2022 23:38:13 +0100
Message-ID: <16884bfd-36ca-dd2e-43e4-4977861f8fa1@gmx.de>
Date: Mon, 24 Jan 2022 23:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220124210319.325512-1-deller@gmx.de>
 <Ye8mDFcWSiXoRJbD@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <Ye8mDFcWSiXoRJbD@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+mKwEBgUo8e6/rdx2wnM5rh8v/iJPUii7I6UYjR0LafD+acqlae
 rDVSPHpFVw/TqCh68N4Dcyveg6w3ot9oOtgpaEQeWF0+CwHsqvrKN0IdYxgEBS6bRSMIXRH
 puChEGqa7ZtuOWaBLGKMRDASdYDh2gYTQsIaG7RiDW1Q0WWelAODGGa9P7kHJDJfTqaU6kt
 VMGCrr0OSeS8sRlxIACKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P4h9ZZ/515I=:TShwa34J6E49MAcWMpgIEk
 oz9CcYOoBwrolQyCjXlY8COb3clzeUbg1OZvJLD20cKD1nq23Gu2EvaR+GF/Fj9M9Y1cpPm+E
 9r0wnP7XFBEWMKOdEvsWO7QuUYiN6+cdgeuFE8Xzn5UoteSzMuHpTFl8ruPv14IArlHIDldac
 AmuZlGXnUC3xz8Ky/BQfHQo+YQisn4U0F/XAVr78+vtw/pl6ZtCsl4xBJLJtoJFJNHp7+ATKd
 5BZNYvmf/nIJCefBK6eZMwCY4Ld/iG4r+l84OwD1rA+/FLu6K3rAjYmYMEKgRg/Cf8Wfb6D2a
 7JO3jXLrOW7MoLrQ1iTsU6FZD8Soek+rGT0JHG12Sc0FsCdvHCCV4tqAvqpSQhqfBAREAlBjV
 z4MUxahZZyhHCP+2K5BfGSUNR0sctqVbM3E+hSz0OWPgYc9X3wPbcUQPurhR/KxuHCPmLOuWT
 QNYQboTrPJA1QxRK+1tyiqLENNtNRvQi9kJeB919baluZKiu/Qwy93LUrKNLIwLhM5E8T4JJQ
 rN92tsz4kWuCmG7ZGw3nuR47WJoIOrERFdbXBInMUQUpUXpdL96NKY5/faL/vGHCTSUEDgR2+
 qQYu0TliHyDFNLYqAC3he81i2VOUHlPPM8sIfXq2RrrPrUoJ/jfY0iXTH6LC2xFVGdzJ/UQyZ
 y27msW4gMk0kRhQ2LFYuljnDvNtJhljpQWlAo1HtsOnos1QWHNlgik1t6TJqux2HriueyVNb6
 8K3rssNCKm+p5T9WEuaUcX9+I5zu4EeLvnuiyJQfPzvrHNofeugHI0Z8sYY1FZOSIpHUWtTyG
 /cr1zKqPAFLhlVGRP7mMUlr3z+hJ8hxR+g0FfMprs79ypR57x2JJTzDJ+CSWuNojb+kMBD1hA
 kakGYEqgF37Tk9sL4+XHtg2pOG5RHiFROIOMgFxvqKcUfule6xaJJQC3Vu+zeeENQtAU6RCuo
 KciOIJP+aaLohD/XyUSjwF+cMYydUAX2kPcW7yBv7pnMt6MmSJA1K14s963WiZFW5JeIhDzl+
 BAvTilH7bTAycS+lZVBpbTNbohOAspyHblWwtxBDzt4kBcXMyWrUXZZogtGrxGCIS29K9P/Tf
 nizlcv8pjNu6Ws=
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

On 1/24/22 23:19, Daniel Vetter wrote:
> On Mon, Jan 24, 2022 at 10:03:17PM +0100, Helge Deller wrote:
>> This series reverts two patches which disabled scrolling acceleration i=
n
>> fbcon/fbdev. Those patches introduced a regression for fbdev-supported =
graphic
>> cards because of the performance penalty by doing screen scrolling by s=
oftware
>> instead of using existing 2D hardware acceleration.
>>
>> This series has been discussed on linux-fbdev, dri-devel and linux-kern=
el
>> mailing lists. The consensus is that they will be reverted, but in addi=
tion
>> it's being worked on to find a solution which allows to disable parts o=
f the
>> classic fbdev hardware acceleration code which isn't needed in DRM-only
>> configurations.
>
> That's not my take at least.

Which is?
Didn't we discussed about introducing something like
CONFIG_FBCON_LEGACY_ACCELERATION ?

>> The patchset is planned to be kept in fbdev's for-next git branch and l=
ater
>> pushed into kernel v5.18 if no issues are found until then.
>
> Neither this. I don't think we've resovled maintainership of fbdev core
> code and fbcon yet. That is the part that drm folks very much still
> maintained, as a quick git shortlog will show.
>
> Maintaining these parts outside of drm trees just doesn't make sense,
> since none of the other graphics relevant development happens outside of

I have no objections if you are willing to take those two patches through
the drm tree.

Helge

>> ---
>> Changes in v2 compared to v1:
>> - adjusted the stable tags (one v5.10+, the other v5.16+)
>> - moved the analysis and reasoning why those should be reverted into
>>   the commit message. That simplifies to analyze later why they were
>>   reverted.
>> - resorted the To an Cc mail recipient lists
>>
>> Helge Deller (2):
>>   Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1
>>     (from TODO list)"
>>   Revert "fbcon: Disable accelerated scrolling"
>>
>>  Documentation/gpu/todo.rst              |  24 --
>>  drivers/video/fbdev/core/bitblit.c      |  16 +
>>  drivers/video/fbdev/core/fbcon.c        | 540 +++++++++++++++++++++++-
>>  drivers/video/fbdev/core/fbcon.h        |  59 +++
>>  drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-
>>  drivers/video/fbdev/core/fbcon_cw.c     |  28 +-
>>  drivers/video/fbdev/core/fbcon_rotate.h |   9 +
>>  drivers/video/fbdev/core/fbcon_ud.c     |  37 +-
>>  drivers/video/fbdev/core/tileblit.c     |  16 +
>>  drivers/video/fbdev/skeletonfb.c        |  12 +-
>>  include/linux/fb.h                      |   2 +-
>>  11 files changed, 703 insertions(+), 68 deletions(-)
>>
>> --
>> 2.31.1
