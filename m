Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3FA2642A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 20:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7C910E0A2;
	Mon,  3 Feb 2025 19:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="AuGx21Xv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11CF10E0A2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1738612781; x=1739217581; i=deller@gmx.de;
 bh=x5+QUIWf9gsXt13yqf/QezU/dBtDClkkB+5cC5RYzCY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AuGx21Xv2ZCGJ/OgvutbOFVA/iOu8POlRj7DtNjUGQts0z2zAflDxMrZHAg9mvYW
 TMm3uBKZVmoF5f4I6fNDbWu2L3DKt8M+RRPhM/zpsmstnDwZJHtvaKI/Y4BSFiUNB
 Z+U9f1Bck2pK6CjFHdFJP9VEuFqB+IAv0Y0xlEVdeDgrTEF8u8TNVZVj1T6dZ6X5C
 BFAhF6ncW3twKFn1lkDxX2xgNX5fhtxA4Hy8eEaZ9gkPgEDXcJzXqyf/2u4L106wq
 CgEL7FJrlPtxEW7tRHWPK3XsZv6WgsvBbZBYZ6c58F0EXxFwNtNw4PIpWc53TtYZ5
 XoY1FkUVkX2itUVjLA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.6]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1tumKk2Hoh-00OSrv; Mon, 03
 Feb 2025 20:59:41 +0100
Message-ID: <ba5b7b47-1082-4949-8bf2-9bc5239af35b@gmx.de>
Date: Mon, 3 Feb 2025 20:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] Deduplicate cfb/sys drawing fbops
To: =?UTF-8?Q?Kajt=C3=A1r_Zsolt?= <soci@c64.rulez.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <f921492d-6c53-ce68-16b6-dc9c21f2b738@c64.rulez.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <f921492d-6c53-ce68-16b6-dc9c21f2b738@c64.rulez.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZIX0f/M9gih3rYsaT3egHu5kyFrFLIng7EOUxF+zY+WVEYVik9M
 W64kqxQ4DZ6E9+Q+PavmMpQD4M4YXZOYxrB6r4PeSmhYivkyAUuIkepjYb3ggjva9XuoUBB
 E1Dc2wHG/7lm9Sss5L0KxY5Z3aEt4pS9L/EDDvV5wpm1eYyqNhrFAAd3+Gpnh7eOY/NwZA2
 yUWuc+lK9z0Omw2ccRjpQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YSaVPfZlBO0=;LHTyEHP/sj2Awa8qroZkoUtHHa1
 lzzI8GwqI4IaDK0BxgIE72wgFUOvMZaBGQHbm8obDVs9i0i/74ZSvzOK528Lm0SxIQnNNY0pl
 eFdEZIiy8wm4Kki06wksBZO4+uYE/8Xbh5HMZsf7XsXFXeoCr+6Wm41kRlBR0QS+Uw08vblY5
 hPvHlaV7ELWQf52r2Tk1NjgCDSCmQm68ybwFMrpjUqONEq9rAnV0xDBTlJyO06rMRTrkxWKJZ
 nKlQSRl3uUG8E3LBKVS8S3NW/K8Qda9tg0b9Ar6SHEhlPNR5x0quyNm0YehoT4rRLR+HG7vXy
 5/X6qjKOCzmZnq9uKlS2OFsg/f63FxygHcVg2TF4XoOUebUwbtHWZ7kXStpsrCq3LVW9SJden
 vxo1hghkmYZ6wlQKF50SEl4bIMe7V1G9dZCYkK0usFMlkRqhtS5Fc6onWedZ2j9nRSYrAjC2o
 L5qIKdqY3eJOKf8rzSMie7A0EcT12p1aEnnhGTqphkuLKtPfsNABaani7XdJCjAiimb7kIRYL
 fhH1ouopsXs/RR0Gmh249j8/n8dbhJSWP24KA23N7JK0tj1hW7Hvoork95pH9s0ut7QHgO2Xy
 mt/PUpejgdNLp9lx3xxPa1BETZdI8qlb3EOune1dbRaNeTuhxtFBT26taz8eg2aw5XOGj7T3+
 3EQSpa6mM/do3z0MZOYFBZkQ5iQ4yovqVLXmThqiGnE0PcjbFf7wGdM2FF/2hr1/5am30Aq23
 Yt1CyUVZOsUHEVgRHJEOMA4kUcUupEecPbGAY/cMpTou1/He4ZMiglXd04ZictTttXXVrqjt3
 Iwyt4z+QHQtTdfiMW4keiVEytjM8F2/fpniD20NNZ5Md98tKjDfO8r2B6Nj63MXt6N+jQHJmW
 hDSGdIl6xe/mq7FJCPR0A0HOwJX3FJKVI4qtaThMVdHJm1v009jsF6YD7VTz+5+e5xuUrL00R
 eLwUs4H8HV/jU9w19HRsMU47e00iV8CLtzhvYGinNlXydfyxJsGhiRrrrrF2Kp3XTJEU0747A
 L8PaoJvFtBdPETRKIGeCTGTAmneRjeSnadI401sMJnSCb8u5zi3YMv5LGfvOGTMs7moZ2LX9M
 +mP0Tz+ZuAW50i56NgbGO+wxb2LGJ0G+BFWQhUlrS8PZCkHWuF7JpF/a3R/yAEBheNS1bKqah
 yPZZrkPXzO7sMdnGvCOjwTQNrRGsJtSti9q/eSvU7UJrsxE14YXEYpp0BJq2CKwaPr6mXwR3t
 XaLb8wakS1kqdggQBcmoC4rgMA/KOPuyiX9A7NqOZnwFbvQ54M8WNhKf8LIiR1Xte2qRC2Wfa
 MavVgXEFO6Uww6BgUXHfyC4Yv/dmj07wO8HNsNd3VnWySrhOF6tOxeFHY6lYd4Q7UUTpj7Yet
 z2cCrtRfhG9FrbZQ==
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

CC'ed: driv-devel

On 2/2/25 13:39, Kajt=C3=A1r Zsolt wrote:
> A series on de-duplicating the common cfb and sys drawing routines will
> follow.
>
> Some background:
>
> It happens that I need to use both cfb and sys drawing routines.

For which driver do you need this?

> At low resolution where the aperture is large enough the framebuffer
> memory is directly mapped. As usual the cfb routines are used.
>
> In the high resolution scenario defio is used to make banking
> transparent, there the sys drawing routines are used.
>
> There are packed pixels, of course in the wrong order. So that needs
> CFB_REV_PIXELS_IN_BYTE, fine. Or almost.
>
> While the sys routines are based on cfb for some reason the former lacks
> pixel order reversing support. The result is that at low resolution the
> console is fine, but it's unreadable at high resolution due to the wrong
> pixel ordering.
>
> First I added the pixel reversal support to sys, console looks fine.
> Still I might have made mistakes when doing so, that might need
> further testing just to be sure. Hacked fillrect to run in userspace,
> wasn't easy and now I have to come up with edge cases...
>
> Had another look at the cfb routines and sys is basically a straight
> copy. Minus the pixel reversing, FB_READ/WRITE macro inlining by hand,
> comment style updates and a few changes here and there for I/O vs.
> system memory. The memory access differences could have been easily
> covered with a few small macros, strange.
>
> Cfb has a working pixel reversal as far as I know. Now all it needs is a
> few changes for the memory access differences and then I have the sys
> routines with pixel reversal. And can also be reasonably confident that
> it actually does what it needs to in special drawing scenarios.
>
> So the patches below take a copy of the cfb routines as header files,
> and add macros for the access, text and other differences. The comment
> style changes were taken from sys so that it's less different when
> compared. Then the cfb and sys files were cut down to just an include
> of the common code in the header plus a few defines for the macros used
> in the headers.
>
> I was thinking what to do with copyright/credits now. On the new headers
> it's clear as it's basically cfb, but the new cfb and sys suffered
> significant changes and not much remained. I kept the original authors
> but it might be questionable on sys, it just an includes cfb code now.
>
> I know at the moment there are no users for the pixel reversal function
> in sys and could have sent such changes later when truly required.
>
> However there are some maintainability benefits as it removes lots of
> duplicate code which might be worth to have meanwhile. The pixel
> reversal gets optimized out when not in use so I don't worry about that
> much.
>
> Zsolt Kajtar (12):
>    fbdev: core: Copy cfbcopyarea to fb_copyarea
>    fbdev: core: Make fb_copyarea generic
>    fbdev: core: Use generic copyarea for as cfb_copyarea
>    fbdev: core: Use generic copyarea for as sys_copyarea
>    fbdev: core: Copy cfbfillrect to fb_fillrect
>    fbdev: core: Make fb_fillrect generic
>    fbdev: core: Use generic fillrect for as cfb_fillrect
>    fbdev: core: Use generic fillrect for as sys_fillrect
>    fbdev: core: Copy cfbimgblt to fb_imageblit
>    fbdev: core: Make fb_imageblit generic
>    fbdev: core: Use generic imageblit for as cfb_imageblit
>    fbdev: core: Use generic imageblit for as sys_imageblit
>
>   drivers/video/fbdev/core/cfbcopyarea.c  | 425 +-----------------------
>   drivers/video/fbdev/core/cfbfillrect.c  | 362 +-------------------
>   drivers/video/fbdev/core/cfbimgblt.c    | 356 +-------------------
>   drivers/video/fbdev/core/fb_copyarea.h  | 421 +++++++++++++++++++++++
>   drivers/video/fbdev/core/fb_fillrect.h  | 359 ++++++++++++++++++++
>   drivers/video/fbdev/core/fb_imageblit.h | 356 ++++++++++++++++++++
>   drivers/video/fbdev/core/syscopyarea.c  | 356 +-------------------
>   drivers/video/fbdev/core/sysfillrect.c  | 314 +----------------
>   drivers/video/fbdev/core/sysimgblt.c    | 324 +-----------------
>   9 files changed, 1190 insertions(+), 2083 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_copyarea.h
>   create mode 100644 drivers/video/fbdev/core/fb_fillrect.h
>   create mode 100644 drivers/video/fbdev/core/fb_imageblit.h

Some notes regarding your patches:
- please add dri-devel@lists.freedesktop.org mailing list
- it seems you sent your patches manually.
   Using b4 on your Message-ID gives:
b4 am f921492d-6c53-ce68-16b6-dc9c21f2b738@c64.rulez.org
Grabbing thread from lore.kernel.org/all/f921492d-6c53-ce68-16b6-dc9c21f2b=
738@c64.rulez.org/t.mbox.gz
Analyzing 13 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
=2D--
   [PATCH RFC 1/12] Deduplicate cfb/sys drawing fbops
   ERROR: missing [2/12]!
   [PATCH RFC 3/12] Deduplicate cfb/sys drawing fbops
   [PATCH RFC 4/12] Deduplicate cfb/sys drawing fbops
   [PATCH RFC 5/12] Deduplicate cfb/sys drawing fbops
   [PATCH RFC 6/12] fbdev: core: Make fb_fillrect generic
   [PATCH RFC 7/12] fbdev: core: Use generic fillrect for as, cfb_fillrect
   [PATCH RFC 8/12] fbdev: core: Use generic fillrect for as, sys_fillrect
   [PATCH RFC 9/12] fbdev: core: Copy cfbimgblt to fb_imageblit
   [PATCH RFC 10/12] fbdev: core: Make fb_imageblit generic
   [PATCH RFC 11/12] fbdev: core: Use generic imageblit for as, cfb_imageb=
lit
   [PATCH RFC 12/12] fbdev: core: Use generic imageblit for as, sys_imageb=
lit
Total patches: 11
WARNING: Thread incomplete!
=2D--
- patch #2 is missing, and patches 1-5 have the same subject.
- When applying there are warnings:
git am ./20250202_soci_deduplicate_cfb_sys_drawing_fbops.mbx
Applying: Deduplicate cfb/sys drawing fbops
.git/rebase-apply/patch:451: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: Deduplicate cfb/sys drawing fbops
Applying: Deduplicate cfb/sys drawing fbops
Applying: Deduplicate cfb/sys drawing fbops
Applying: fbdev: core: Make fb_fillrect generic
Applying: fbdev: core: Use generic fillrect for as, cfb_fillrect
Applying: fbdev: core: Use generic fillrect for as, sys_fillrect
Applying: fbdev: core: Copy cfbimgblt to fb_imageblit
.git/rebase-apply/patch:199: space before tab in indent.
                 if (shift) {
.git/rebase-apply/patch:380: new blank line at EOF.
+
warning: 2 lines add whitespace errors.
Applying: fbdev: core: Make fb_imageblit generic
Applying: fbdev: core: Use generic imageblit for as, cfb_imageblit
Applying: fbdev: core: Use generic imageblit for as, sys_imageblit

I suggest you make yourself familiar with "git-publish" (https://github.co=
m/stefanha/git-publish).
It's a great tool which helps a lot for sending patches.

Helge
