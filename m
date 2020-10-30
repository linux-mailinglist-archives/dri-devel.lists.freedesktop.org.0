Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15D29FFFB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:31:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49896ED03;
	Fri, 30 Oct 2020 08:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B56ED03;
 Fri, 30 Oct 2020 08:30:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09U8UaPB113645;
 Fri, 30 Oct 2020 03:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604046636;
 bh=CzNQBwZKghppT04NXnze7g8o+ankWdaMI3TDyZqHlZw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=mK0hGOuZOholBu+L3sSHTXU8AVHo0SNxAXDj2wrHoNZEOBntBbWNJtOAYcs+9eRz3
 wUcYgrGkmb1iba27F2B/xinm9EpGPtljj3Zm31xyJ/x9E4nMNUZQ/g9FvECobR094Z
 SEsOybPpZOJGPUB6nC6O6phQSkGOzVnWDEf0atmk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09U8Ua2b031844
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Oct 2020 03:30:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 30
 Oct 2020 03:30:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 30 Oct 2020 03:30:35 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09U8UVt4091602;
 Fri, 30 Oct 2020 03:30:32 -0500
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
 <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <df3f5733-21b3-809c-71d7-0bd83f29ae62@ti.com>
Date: Fri, 30 Oct 2020 10:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: George Kennedy <george.kennedy@oracle.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/10/2020 15:22, Daniel Vetter wrote:
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
> 
> Now the problem is that most modern-ish drivers really only treat
> fbcon as an dumb kernel console until userspace takes over, and Oops
> printer for some emergencies. Looking at drm drivers and the basic
> vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> acceleration:
> 
> - nouveau, seems to be enabled by default
> - omapdrm, when a DMM remapper exists using remapper rewriting for
>   y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>   flag, so unused (and could be deleted already I think).
> 
> No other driver supportes accelerated fbcon. And fbcon is the only
> user of this accel code (it's not exposed as uapi through ioctls),
> which means we could garbage collect fairly enormous amounts of code
> if we kill this.
> 
> Plus because syzbot only runs on virtual hardware, and none of the
> drivers for that have acceleration, we'd remove a huge gap in testing.
> And there's no other even remotely comprehensive testing aside from
> syzbot.
> 
> This patch here just disables the acceleration code by always
> redrawing when scrolling. The plan is that once this has been merged
> for well over a year in released kernels, we can start to go around
> and delete a lot of code.
> 
> v2:
> - Drop a few more unused local variables, somehow I missed the
> compiler warnings (Sam)
> - Fix typo in comment (Jiri)
> - add a todo entry for the cleanup (Thomas)
> 
> v3: Remove more unused variables (0day)
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Peilin Ye <yepeilin.cs@gmail.com>
> Cc: George Kennedy <george.kennedy@oracle.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst       | 18 +++++++++++++
>  drivers/video/fbdev/core/fbcon.c | 45 ++++++--------------------------
>  2 files changed, 26 insertions(+), 37 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 6b224ef14455..bec99341a904 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -277,6 +277,24 @@ Contact: Daniel Vetter, Noralf Tronnes
>  
>  Level: Advanced
>  
> +Garbage collect fbdev scrolling acceleration
> +--------------------------------------------
> +
> +Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
> +SCROLL_REDRAW. There's a ton of code this will allow us to remove:
> +- lots of code in fbcon.c
> +- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
> +  directly instead of the function table (with a switch on p->rotate)
> +- fb_copyarea is unused after this, and can be deleted from all drivers
> +
> +Note that not all acceleration code can be deleted, since clearing and cursor
> +support is still accelerated, which might be good candidates for further
> +deletion projects.

Apparently omapdrm's accelerated panning has been broken for some time, and no one has noticed. It does:

strcmp(fbi->fix.id, MODULE_NAME), which is a comparison of omapdrmdrmfb == omapdrm and always fails.

Fixing that, and applying this patch, things work fine (unaccelerated, of course). I did notice a
single call to omap_fbdev_pan_display() when loading the drivers. This comes from fbcon_switch ->
bit_update_start -> fb_pan_display. Maybe this is from the clearing you mention above?

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
