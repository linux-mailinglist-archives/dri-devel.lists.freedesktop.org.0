Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A197B493ACB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 14:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C8710E742;
	Wed, 19 Jan 2022 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound5i.eu.mailhop.org (outbound5i.eu.mailhop.org
 [35.156.234.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676ED10E464
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 13:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1642597357; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=AUHV1nsFWmrPcpqlXBv7Yud0hqF+DBIvT2lFjL/wnm0wG8EEjiBFqsYGDmSWVrh+1JVP/XTbw5Noi
 P9u1T3a91hIf0M4N7lVlOV+XgeMkVwLxaEY63bH4wFU2vEhq1NmpJIrpSIfHoJSltbWaBGB7SXaz/S
 tEC+lvBLuqG5sofhyv95CyTGNLdnSZS6acu7JwhY7KlOuYDMSl7C+55UydtplwXRRjIyjAG2iyE0pK
 vfsBhXJgxCEDotYCbXJNv5QqyoRjdNAgEadQBj+ijL643s0KWddZ4bEGLmEASBx7A87YtC2xUwliQC
 f6ykVvMu4OSY0EEPNWso+vhgpid586A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:dkim-signature:dkim-signature:from;
 bh=mM9bLZllLp6WR65cBIP3lh4VI/VKsNc4pyQsMAa398o=;
 b=mfv2NlGXgKDeBq7ZFKZt6mnqdCfMorQ9M9A2Pcp0/B95fuDHxCZC4ZJKPLlIeCWuRsg0XYMOprXXZ
 toBWmt/Rf/Jc1+83vsFdTa0KH8n0okvcVSs77IZYrp6OGTmToPfScxCVbPfanP7vX+Ewll3+TG1EG2
 FM7KN52i9Bzz8mDlrPYXGHsuSuCYc32A04qnvNOVw+xADEsmNVFLo3PoJWxkB/MwEinN6ll1WcEUun
 zy7ovFbaa6EXlB0MYQHp9M4LEETWozzsowpbd+WwWGfLeFlRaM/avRsxemqg06xYfncrjWJoRICmel
 9up8wh2Lr5hFjgjinPVn8GoPR6+1uQw==
ARC-Authentication-Results: i=1; outbound2.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=mM9bLZllLp6WR65cBIP3lh4VI/VKsNc4pyQsMAa398o=;
 b=DNkhnUT7ut6iuCBCgELVbH8Tl8vwCFuUJ8GE0VeHVP560HOgYzotORtHjocI8Ttaf6q/tkpjHxpG1
 hpsF1tpojO0WT0x1vKVe2hFgqi1YudgR8cFo/TNlnz4zn5iqWMTourkEVJJJEhecgBTmshHYx5c/Hp
 V0wRiceJtFLanGn4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-type:mime-version:message-id:in-reply-to:date:references:subject:cc:
 to:from:from; bh=mM9bLZllLp6WR65cBIP3lh4VI/VKsNc4pyQsMAa398o=;
 b=J0RbRaZARuiEkUZzC8m8nKbKVTZE7BU1CvdS9HvvAL5KBmhLvpdm1TW4l+VbL7ELDrYeZ7h92s28S
 u68g+sEoqY30OjYW0JEkaDSz+E8DNuCnnnB+mUf8vhyuUdpxfFRQfetVVeH1rKKA2KPjd9ossUwttc
 NXxQtSmbSRlwBC/fca/riQCLPE0u1WvQDfPfpwkPsnzvpU5MK7pzXvoAaBsvCkH01L6qq5del1gVpW
 6eY5DeF9xdagy3/r/IQK9fsNYzspv5uR2xkukRySUCZLeZABLrfeIH5P/D+kKbd3YdSBe6NF69j0r1
 NSDWESTGspLbeT3A9fVUr6eXM3kb4dQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 0ec14c04-7928-11ec-a077-973b52397bcb
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound2.eu.mailhop.org (Halon) with ESMTPSA
 id 0ec14c04-7928-11ec-a077-973b52397bcb;
 Wed, 19 Jan 2022 13:02:31 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1nAAbc-0058X8-Ai; Wed, 19 Jan 2022 15:02:28 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
References: <20220119110839.33187-1-deller@gmx.de>
Date: Wed, 19 Jan 2022 14:02:25 +0100
In-Reply-To: <20220119110839.33187-1-deller@gmx.de> (Helge Deller's message of
 "Wed, 19 Jan 2022 12:08:37 +0100")
Message-ID: <87k0evkhem.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Claudio Suarez <cssk@net-c.es>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Helge Deller <deller@gmx.de> writes:

> This series reverts two patches which disabled scrolling acceleration in
> fbcon/fbdev. Those patches introduced a regression for fbdev-supported graphic
> cards because of the performance penalty by doing screen scrolling by software
> instead of using hardware acceleration.
>
> Console scrolling acceleration was disabled by dropping code which checked at
> runtime the driver hardware possibilities for the BINFO_HWACCEL_COPYAREA or
> FBINFO_HWACCEL_FILLRECT flags and if set, it enabled scrollmode SCROLL_MOVE
> which uses hardware acceleration to move screen contents.  After dropping those
> checks scrollmode was hard-wired to SCROLL_REDRAW instead, which forces all
> graphic cards to redraw every character at the new screen position when
> scrolling.
>
> This change effectively disabled all hardware-based scrolling acceleration for
> ALL drivers, because now all kind of 2D hardware acceleration (bitblt,
> fillrect) in the drivers isn't used any longer.
>
> The original commit message mentions that only 3 DRM drivers (nouveau, omapdrm
> and gma500) used hardware acceleration in the past and thus code for checking
> and using scrolling acceleration is obsolete.
>
> This statement is NOT TRUE, because beside the DRM drivers there are around 35
> other fbdev drivers which depend on fbdev/fbcon and still provide hardware
> acceleration for fbdev/fbcon.
>
> The original commit message also states that syzbot found lots of bugs in fbcon
> and thus it's "often the solution to just delete code and remove features".
> This is true, and the bugs - which actually affected all users of fbcon,
> including DRM - were fixed, or code was dropped like e.g. the support for
> software scrollback in vgacon (commit 973c096f6a85).
>
> So to further analyze which bugs were found by syzbot, I've looked through all
> patches in drivers/video which were tagged with syzbot or syzkaller back to
> year 2005. The vast majority fixed the reported issues on a higher level, e.g.
> when screen is to be resized, or when font size is to be changed. The few ones
> which touched driver code fixed a real driver bug, e.g. by adding a check.
>
> But NONE of those patches touched code of either the SCROLL_MOVE or the
> SCROLL_REDRAW case.
>
> That means, there was no real reason why SCROLL_MOVE had to be ripped-out and
> just SCROLL_REDRAW had to be used instead. The only reason I can imagine so far
> was that SCROLL_MOVE wasn't used by DRM and as such it was assumed that it
> could go away. That argument completely missed the fact that SCROLL_MOVE is
> still heavily used by fbdev (non-DRM) drivers.
>
> Some people mention that using memcpy() instead of the hardware acceleration is
> pretty much the same speed. But that's not true, at least not for older graphic
> cards and machines where we see speed decreases by factor 10 and more and thus
> this change leads to console responsiveness way worse than before.
>
> That's why I propose to revert those patches, re-introduce hardware-based
> scrolling acceleration and fix the performance-regression for fbdev drivers.
> There isn't any impact on DRM when reverting those patches.
>
> Helge Deller (2):
>   Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1
>     (from TODO list)"
>   Revert "fbcon: Disable accelerated scrolling"
>
>  Documentation/gpu/todo.rst              |  24 --
>  drivers/video/fbdev/core/bitblit.c      |  16 +
>  drivers/video/fbdev/core/fbcon.c        | 540 +++++++++++++++++++++++-
>  drivers/video/fbdev/core/fbcon.h        |  59 +++
>  drivers/video/fbdev/core/fbcon_ccw.c    |  28 +-
>  drivers/video/fbdev/core/fbcon_cw.c     |  28 +-
>  drivers/video/fbdev/core/fbcon_rotate.h |   9 +
>  drivers/video/fbdev/core/fbcon_ud.c     |  37 +-
>  drivers/video/fbdev/core/tileblit.c     |  16 +
>  drivers/video/fbdev/skeletonfb.c        |  12 +-
>  include/linux/fb.h                      |   2 +-
>  11 files changed, 703 insertions(+), 68 deletions(-)

Thanks Helge!

Feel free to add my:

Acked-by: Sven Schnelle <svens@stackframe.org>
