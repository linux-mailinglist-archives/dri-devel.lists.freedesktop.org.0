Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3A18A080
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718466E91E;
	Wed, 18 Mar 2020 16:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17BC6E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:31:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k18so26423094oib.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ez9hpvifTc2STDnZtWKDhLfk74UGNnWXuwCGbU6A4rw=;
 b=Ws724cGhkpDJrESIGX/4T3R9+qJJbPVIP3NXUhB8BNrmbiBj21FBy60UbqlLjSLNz7
 xKFVpYYR88qi+iqmDYupAoTTc+twjo1LdLcZAmkHp9o8z2VCL/7KdhcQw87kxU01V4aD
 1lRoWT482c+50v7UlLEtXLyPtI2Zkax61bzGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ez9hpvifTc2STDnZtWKDhLfk74UGNnWXuwCGbU6A4rw=;
 b=pxh4TMWI4aTaO1aeE3TQ5yruU1YK6/so0WYbp2RAZQDH8bM5Vg+mxzX4ZiLrsf5fXu
 CY+nBwmtEOSCkukMThzv9gAFTsx9C/dfFIIPYKwBoQ8eoXYTbCZuIPulXJhtFYsv4BWv
 qJNeyE2pEItx5VDmBZS1+WpQjNwrfrXvJ51g0Of6VCGIrQ7Nrnkf3fbikNnlnyhakVv6
 stbbmSSxDr+5jOY4dsWBg1RJ/uZMKpzv/OtCfcPvFcNy4zVrhX6d2+kUjzb+uymUGhjX
 SprOVgaJLXM/DzTfr/J6SWjKK4Bzx1KyWIb6mnGMNkwSJewMyOP6SgV/RgT4H8B3wZHk
 Ma/Q==
X-Gm-Message-State: ANhLgQ28QBjEpOV1DfbghzWdF0RT0MI5h6yqe9dqwX1tg/OgR9PlHqnx
 lGKriw2zxL/67qdsv7P8NAvdafhAj5GKllOgHSgk9A==
X-Google-Smtp-Source: ADFU+vuoiOaP8HEDosLzk/qwSJgLByHWnhyt7zF/h7nFcLuR+AupnswWjQNZ/+htP3HpMXmztbG+XG7/OOKNLAEPmjQ=
X-Received: by 2002:aca:5345:: with SMTP id h66mr3974889oib.110.1584549119226; 
 Wed, 18 Mar 2020 09:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
In-Reply-To: <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2020 17:31:47 +0100
Message-ID: <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 5:03 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
>
>
> On Wed, 18 Mar 2020, Daniel Vetter wrote:
>
> > On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
> >> Since 987d65d01356 (drm: debugfs: make
> >> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> >> fails and should return void. Therefore, remove its use as the
> >> return value of drm_vram_mm_debugfs_init(), and have the function
> >> return 0 directly.
> >>
> >> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
> >> introducing build issues and build breakage.
> >>
> >> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
> >> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
> >>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> >> index 92a11bb42365..c8bcc8609650 100644
> >> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> >> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> >> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
> >>   */
> >>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
> >>  {
> >> -    int ret = 0;
> >> -
> >>  #if defined(CONFIG_DEBUG_FS)
> >
> > Just noticed that this #if here is not needed, we already have a dummy
> > function for that case. Care to write a quick patch to remove it? On top
> > of this patch series here ofc, I'm in the processing of merging the entire
> > pile.
> >
> > Thanks, Daniel
> Hi Daniel,
> Without this check here, and compiling without CONFIG_DEBUG_FS, this
> function is run and the drm_debugfs_create_files() does not have access to
> the parameters also protected by an #if above this function. So the change
> throws an error for me. Is that correct?

Hm right. Other drivers don't #ifdef out their debugfs file functions
... kinda a bit disappointing that we can't do this in the neatest way
possible.

Greg, has anyone ever suggested to convert the debugfs_create_file
function (and similar things) to macros that don't use any of the
arguments, and then also annotating all the static functions/tables as
__maybe_unused and let the compiler garbage collect everything?
Instead of explicit #ifdef in all the drivers ...
-Daniel

>
> Thanks,
> wambui karuga
>
> >> -    ret = drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> >> -                                   ARRAY_SIZE(drm_vram_mm_debugfs_list),
> >> -                                   minor->debugfs_root, minor);
> >> +    drm_debugfs_create_files(drm_vram_mm_debugfs_list,
> >> +                             ARRAY_SIZE(drm_vram_mm_debugfs_list),
> >> +                             minor->debugfs_root, minor);
> >>  #endif
> >> -    return ret;
> >> +    return 0;
> >>  }
> >>  EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
> >>
> >> --
> >> 2.25.1
> >>
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
