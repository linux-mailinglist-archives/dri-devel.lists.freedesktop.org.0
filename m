Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B44A6837
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 23:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E6710E229;
	Tue,  1 Feb 2022 22:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C592A10E229
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643755941;
 bh=RCD65NhYXOFlzyNe/FeS9DBnn5ix6Eu1bg/rYHyJd1I=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=RJDDovGgu4o2gaMW/lO3OIQpklc5hxOLy2eDNP8Tg1jUSCGtWsbqBdbP27v99V1ld
 UcnWPwy0W92qsaxzc0GYBKNw0Bt0bMSk1t3O3KQNvyRAvcRYFUJfmgkx46XlkEo/CM
 Cw+vFlAda4ipQNH3BGfRdJ4ATB+zswIxJp+e0CEM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEFvp-1n71eK0rDh-00AE5s; Tue, 01
 Feb 2022 23:52:21 +0100
Message-ID: <dd186ce6-56b3-fe68-daad-249b18ebd627@gmx.de>
Date: Tue, 1 Feb 2022 23:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220201185954.169768-1-deller@gmx.de>
 <20220201185954.169768-4-deller@gmx.de>
 <CAKMK7uFmMcC4p_zDq5G1Rpvjeg0zOz7v38mTj57JDZEis9fGAA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 3/3] fbcon: Add option to enable legacy hardware
 acceleration
In-Reply-To: <CAKMK7uFmMcC4p_zDq5G1Rpvjeg0zOz7v38mTj57JDZEis9fGAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PY6+MV2CfpN47XnVmSm28qZi//5LbpWrKFh1sF5MW5wp4z8RNUc
 qz54Rl1tmpazkJxHVXnY1N4FtFDP6KOM8VKKWzSdu5lNDE7BklXYDGWXdMDcpSV7rqv2w6j
 y3l+E8W6uMY+Je9qNghR6V+TnM9pj7q/RUZHDgr7SGr6s+3HXw6ugNjNtfzNE6F3J3fwPXB
 fGR25EXot/JjMyWTLICJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yTquaLbApA8=:n0B/7fiKt79wtz7WFnhVHK
 Wm+6+CRH4y0j5wdt6GdZWPHKCFx+2q6P6uRp/GNcNoEXEprY8ZK3WV6BF7I54amLICjoj34YX
 MCivoBJeVsATBq0tC6M2dhnkpD/aPiYq9LzSmJs/xpzjEQvTmW6xnvDAZyJ2p/bWziEyaaaV0
 t/jL3gzbNQfyaiHPZSnOdEAhsaA9hGuppOEFtkmCDo5AbyOiWisSLQwgOoo4MvH6Uzxb+IAYc
 eoqk/kHsMwqV9LaD+T84Qd7YooG9xbj7nnUo2/grZH5qUmV0Mmg4obsMlESN0IbcM6b7fHtsB
 mCtFNcJuOZ3viLE3iD1rsKY6Rt5jwN89qA/g5SuW3fs/MfqzHaO1dAJq3dO4bWE89BFEDNppz
 iD2ByFdyJROirsvIbrgeD5M9noZH1Ngdoo9+43kfTTxPLx9x6oftKATXAmd+8P/NeClQ5/1X9
 sMuxoWcrbBH2T+L51cPp2uRJDpZ02meSkB+kfXARe68uw0bSOra6LhP6pRDBkbWXaKS0Rti0l
 w2HxiKrJ/2ynaAOvD3/LkyyssF8q07IxyfNfPmlg0Re120XHj+Pabkg52aV3PbrZ7DEVZ9F8s
 Zu73Ot+rx76Z3+10j0LGUvzY3o69Y3GKFe7aMEPXf+ZIQrR3CWoxWrNoQYrh490kO9qSkU9Om
 Zvj/yh0SPTP+nNb6ZeuWGtQUP/r07v7Wkmbp/tJScc0bK51FnHB8qdjdrnNWNE7FYw8bQRjKO
 valFat04bW85qPYeeo3weG3Z9T/OeeY8Gdm7FNsWY8MIHPgUUseGhGIwnCb7mjBqgKqS8deFh
 InAZFt2GxEghB/4pWiDfOdgXyqRVSmz9T1p+0mGVaE+d9ddb6kVJV5+7d2zKFACHOTKZ1Ltdd
 5tjAjodRXQmDNjbQo7W0VEVJNjfdHYye7xEGO3YW72uXUle6wQCP6c8sx9ZtTvXKj3KCX1ewW
 grD7AJIncY7QnebeLw5rX+DfFlzyn9v9s8Zf1uAf/kp4OIvKTPYqlJeW7gRKpU+RiEpv09FbK
 Fpi+gaaOa4j4CE/UFqVefQhOMxCt8MH1vi5xu3J/jI222pSb1j8WwHWyY6i3faIUfxeLl+w74
 NECwK9obxoGsaw=
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

Hello Daniel,

On 2/1/22 21:11, Daniel Vetter wrote:
> On Tue, Feb 1, 2022 at 7:59 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
>> enable bitblt and fillrect hardware acceleration in the framebuffer
>> console. If disabled, such acceleration will not be used, even if it is
>> supported by the graphics hardware driver.
>>
>> If you plan to use DRM as your main graphics output system, you should
>> disable this option since it will prevent compiling in code which isn't
>> used later on when DRM takes over.
>>
>> For all other configurations, e.g. if none of your graphic cards suppor=
t
>> DRM (yet), DRM isn't available for your architecture, or you can't be
>> sure that the graphic card in the target system will support DRM, you
>> most likely want to enable this option.
>>
>> In the non-accelerated case (e.g. when DRM is used), the inlined
>> fb_scrollmode() function is hardcoded to return SCROLL_REDRAW and as su=
ch the
>> compiler is able to optimize much unneccesary code away.
>>
>> In this v3 patch version I additionally changed the GETVYRES() and GETV=
XRES()
>> macros to take a pointer to the fbcon_display struct. This fixes the bu=
ild when
>> console rotation is enabled and helps the compiler again to optimize ou=
t code.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@vger.kernel.org # v5.10+
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> ---
>>  drivers/video/console/Kconfig           | 11 +++++++
>>  drivers/video/fbdev/core/fbcon.c        | 39 ++++++++++++++++++-------
>>  drivers/video/fbdev/core/fbcon.h        | 15 +++++++++-
>>  drivers/video/fbdev/core/fbcon_ccw.c    | 10 +++----
>>  drivers/video/fbdev/core/fbcon_cw.c     | 10 +++----
>>  drivers/video/fbdev/core/fbcon_rotate.h |  4 +--
>>  drivers/video/fbdev/core/fbcon_ud.c     | 20 ++++++-------
>>  7 files changed, 75 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kcon=
fig
>> index 840d9813b0bc..6029fd41d7d0 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>>         help
>>           Low-level framebuffer-based console driver.
>>
>> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>> +       bool "Framebuffer Console hardware acceleration support"
>> +       depends on FRAMEBUFFER_CONSOLE
>> +       default n if DRM
>> +       default y
>> +       help
>> +         If you use a system on which DRM is fully supported you usual=
ly want to say N,
>> +         otherwise you probably want to enable this option.
>> +         If enabled the framebuffer console will utilize the hardware =
acceleration
>> +         of your graphics card by using hardware bitblt and fillrect f=
eatures.
>
> This really doesn't have much to do with DRM but more about running
> questionable code. That's why I went with the generalized stern
> warning and default n, and explained when it's ok to do this (single
> user and you care more about fbcon performance than potential issues
> because you only run trusted stuff with access to your vt and fbdev
> /dev node).

I think this is something we both will keep to have different opinion abou=
t :-)

This console acceleration code is not exported or visible to userspace,
e.g. you can't access or trigger it via /dev/fb0.
It's only called internally from inside fbcon, so it's independed if
it's a single- or multi-user system.
The only way to "access" it is via standard stdio, where fbcon then
either scrolls the screen via redrawing characters at new positions
or by using hardware bitblt to move screen contents.
IMHO there is nothing which is critical here.
Even when I analyzed the existing bug reports, there was none which
affected that specific code.

Anyway, let's look at that part in your patch:

+       bool "Enable legacy fbcon code for hw acceleration"
+       depends on FRAMEBUFFER_CONSOLE
+       default n
+       help
+        Only enable this options if you are in full control of machine si=
nce
+        the fbcon acceleration code is essentially unmaintained and known
+        problematic.
+
+        If unsure, select n.

Since I'm willing to maintain that scrolling/panning code, I'd like to
drop the "is essentially unmaintained" part.
And the "known problematic" part is up to now just speculative (which woul=
d be
valid for other parts of the kernel too, btw).

As this whole disussions showed, there are some few architectures/platform=
s
which really still need this acceleration, while others don't.
So, why not leave the decision up to the arch maintainers, which may opt-i=
n
or opt-out, while keeping the default on "n"?

With that, here is a new proposal:

+config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
+       bool "Enable legacy fbcon hardware acceleration code"
+       depends on FRAMEBUFFER_CONSOLE
+       default y if (PARISC) # a few other arches may want to be listed h=
ere too...
+       default n
+       help
+         This option enables the fbcon (framebuffer text-based) hardware =
acceleration for
+	  graphics drivers which were written for the fbdev graphics interface.
+
+	  On modern machines, on mainstream machines (like x86-64) or when using=
 a modern
+	  Linux distribution those fbdev drivers usually aren't used.
+	  So enabling this option wouldn't have any effect, which is why you wan=
t
+	  to disable this option on such newer machines.
+
+	  If you compile this kernel for older machines which still require the =
fbdev
+	  drivers, you may want to say Y.
+
+         If unsure, select n.

Would that be acceptable?

Arch maintainers may then later send (or reply now with) patches, e.g.:
+       default y if (M68K && XYZ)
...


> Also you didn't keep any todo entry for removing DRM accel code,

That wasn't intentional.
I just sent 2 revert-patches and an fbcon-accel-enabling-patch.
I'll look up what you had in your patch series and add it as seperate patc=
h.

> and iirc some nouveau folks also complained that they at least
> once had some kind of accel, so that's another reason to not tie this
> to DRM.

The above proposal to add additional "default y if XYZ" would enable
them to opt-in.

> Anyway aside from this looks reasonable, can you pls respin with a
> more cautious Kconfig text?

Sure, I'll do as soon as we have a decision on the above Kconfig text.

Helge
