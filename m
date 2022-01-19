Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168A3493A9F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58C110F25A;
	Wed, 19 Jan 2022 12:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65CE10F256
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:46:07 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id c36so4165072uae.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jSJaWLFbSmKDo2PDFLJ/OlDDjxv/sePlYig27gKKORM=;
 b=oGyWAa6nfFfRO01DrKmvb73aUA3eY+dwbvPBijb6YYYuO90DgcQ8rLOlw70cGh3sEZ
 lXjNQmdw7QNUtALoFxOw04+DZ0P7YzjJgG1cIXyjOd0jUZOMIFjZEDpJ93idzgUvpcdG
 1FPZ9RXMPoo+7dKf7Znpi4SHjwYh+75aZfO3QVHNo7bHaZOJKqQYJt2XgSz4R0nN01ZH
 5GZ++xLBbCAp0qLEmXiiinLQ9JR+oE1oK4hFcRsVBi8MCT9FFEy7pNnZMStwgV93F4Mi
 yJ1ZxI8MidPQwaY5KSaiWFtg1JLY5GguqWksonejXa7A1il6YGfyCsdMJ8bCIFBvOmDA
 FmzQ==
X-Gm-Message-State: AOAM531/c7MjeEnLXUqrutxl5uZlrMmbeTx1mjUQ83QFaqCTFLJfeRVT
 8TK/gNje7IB73INYpTt0RWAd5Vc+KCoeKw==
X-Google-Smtp-Source: ABdhPJxqykPL5QQUSTxXHiPIAOvJqgCUIbF2XE95ewjlJ7scMy8mFlyqSqCahUfpO88HufFpPYdt7A==
X-Received: by 2002:a05:6102:509e:: with SMTP id
 bl30mr10960477vsb.61.1642596366679; 
 Wed, 19 Jan 2022 04:46:06 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id h6sm3682912vkk.41.2022.01.19.04.46.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 04:46:05 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id w21so4222101uan.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:46:04 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr11968203uai.89.1642596364458; 
 Wed, 19 Jan 2022 04:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
In-Reply-To: <20220119110839.33187-1-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Jan 2022 13:45:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXj2WsQ2htP63vXD_PRuhrqry3GgD8U1tJQ99BkQPQL=w@mail.gmail.com>
Message-ID: <CAMuHMdXj2WsQ2htP63vXD_PRuhrqry3GgD8U1tJQ99BkQPQL=w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix regression introduced by disabling accelerated
 scrolling in fbcon
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

Hi Helge,

On Wed, Jan 19, 2022 at 12:10 PM Helge Deller <deller@gmx.de> wrote:
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

Thank you for this series, and the prior analysis!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
