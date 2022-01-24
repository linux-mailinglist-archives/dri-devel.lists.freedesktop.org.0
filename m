Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844D499D35
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CD410E177;
	Mon, 24 Jan 2022 22:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C9C10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:20:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b13so59375807edn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=eEy59pkxkuOQH3FeW+pSfh3uQlALKWQv5HMjnvMU5rg=;
 b=DQwAVK1iR3fLgmXYXEfL7+7cLKX03sBRjER8fTgucQYkrJNUWacuLJM2YnsodGggbU
 e21TjvZqBRoT9nS5oWjuI8nC5b0SGohIAKgtlU6LYkBfEqrrL0UYlIscsJh+fv1aMMod
 AiiwUTWTxp3o67D2YG91nlfEAi6w57aHkyTfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=eEy59pkxkuOQH3FeW+pSfh3uQlALKWQv5HMjnvMU5rg=;
 b=P6iyvQlRWxc5UStIhzoyYhspZLfzMmSZ+y/kCu6q0By8VHRyVrVy6GisCqAQsfaOgD
 sz14XKM7k6RdOsS70J35AyVBycP22PkBqK4Cm5DPVg+d7xubHcYfKW7Nqxfyzflvmp8M
 L/8koO538ucebgoX2XBYwlv7xRF+UFO3vbwLkcYYJqUg+S21uUGVYPFJMVifTl8eVKUL
 oCLOyrpBINXWy8rt+HU9PCy7UuXYzohr2F1vJc3S+ntJOF9zg0sa97cPyAoQW9HTcxZa
 WNTPAhAFC+ZHklDlBs9UxspLguB6VWeA210Zq75WJKoF7ldlrFtiCFQZOUw46I0+q8+x
 YivQ==
X-Gm-Message-State: AOAM531sf50WnBDXevfJjydRlcuUs05Es6GxJQAiMQob3x/4S0OYauOI
 kOEy0zXA+O345cEFG/l3YZ7ZXg==
X-Google-Smtp-Source: ABdhPJyTlhbl2apt+k2wVRRqmfZTzbLvqudlvHMLRnIH7f9F66oC+tM4Wg6VWcmjXE8/cwmhAEcyxw==
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr17368585edr.265.1643062798593; 
 Mon, 24 Jan 2022 14:19:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w22sm5362604ejj.64.2022.01.24.14.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:19:58 -0800 (PST)
Date: Mon, 24 Jan 2022 23:19:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/2] Fix regression introduced by disabling
 accelerated scrolling in fbcon
Message-ID: <Ye8mDFcWSiXoRJbD@phenom.ffwll.local>
Mail-Followup-To: Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sven Schnelle <svens@stackframe.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Claudio Suarez <cssk@net-c.es>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220124210319.325512-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124210319.325512-1-deller@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 Sam Ravnborg <sam@ravnborg.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 10:03:17PM +0100, Helge Deller wrote:
> This series reverts two patches which disabled scrolling acceleration in
> fbcon/fbdev. Those patches introduced a regression for fbdev-supported graphic
> cards because of the performance penalty by doing screen scrolling by software
> instead of using existing 2D hardware acceleration.
> 
> This series has been discussed on linux-fbdev, dri-devel and linux-kernel
> mailing lists. The consensus is that they will be reverted, but in addition
> it's being worked on to find a solution which allows to disable parts of the
> classic fbdev hardware acceleration code which isn't needed in DRM-only
> configurations.

That's not my take at least.

> The patchset is planned to be kept in fbdev's for-next git branch and later
> pushed into kernel v5.18 if no issues are found until then.

Neither this. I don't think we've resovled maintainership of fbdev core
code and fbcon yet. That is the part that drm folks very much still
maintained, as a quick git shortlog will show.

Maintaining these parts outside of drm trees just doesn't make sense,
since none of the other graphics relevant development happens outside of
drm.
-Daniel

> 
> Helge
> 
> ---
> Changes in v2 compared to v1:
> - adjusted the stable tags (one v5.10+, the other v5.16+)
> - moved the analysis and reasoning why those should be reverted into
>   the commit message. That simplifies to analyze later why they were
>   reverted.
> - resorted the To an Cc mail recipient lists
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
> 
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
