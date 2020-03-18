Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A6218A2F4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 20:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0DF6E94C;
	Wed, 18 Mar 2020 19:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938A6E94C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 19:10:55 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id 13so18077353oiy.9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mF3uqR0dI65g7bnW0IoscUYfl1Pu8OWv3Jeasc6I3BA=;
 b=j9cqkV9WTwaRvdcnzXTDaIt+vzNztv/R+bD2UgJMLQtJeMU12eT/rGdhjyO/W0T/xM
 1HVP7sesYmegIVG5wXh4mssL83KThrLmHOVhVNTxAqe/PN0hJokGjjKlQIDb3gZfTQU1
 joonWCXOEMZStzU2POcK99QCo7KXD+wLcj/5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mF3uqR0dI65g7bnW0IoscUYfl1Pu8OWv3Jeasc6I3BA=;
 b=WmmTzXsp4dm7/ASgBDP2YgXGJgBuhxwlH9XojLGLzpoTMmLUszPok/WOuACWN7bkcD
 qVMfgcZ0G0/BadL002xE5VsavW8gw0D/18F/SG7Qa2tn+cLcAwU3XoVwE5+X7AyQ9YQh
 oUbADwkUn6aURELPKfEwQBT9WUl+PkJhQUlaMzbx4ib78EtowzcY+boTpkaeOm2RMegN
 BLX0c+yFUCG6CKZQbXMHF9YB+rAlrU9mxi7FkgduYB/F0GK7IbvJnEIaesZjS2ujKWlJ
 lFvCy9HLdNdjc16Ohugio1hnZ3rSukTPKqHfyZa65XScSYtkrEIcD7tpGsBggcd/1MNa
 j0rA==
X-Gm-Message-State: ANhLgQ1jHuRBNMSNoKvoBPxq0BuNGGfvIPeBrHDsaAxW8tVup0OZ6APq
 fjjwGXKFIoaUkqVFxcU5TXR5bCT0rpe0dsDjSA6JDg==
X-Google-Smtp-Source: ADFU+vtvzb3ld5iCKPCDgez2fALttjMFd7OTN00Q0ZMjrPaTHDJx/5l+Ix8tro1kM1/JytRME65AEbqBNk+Hg/Bb3XU=
X-Received: by 2002:aca:be08:: with SMTP id o8mr4150691oif.101.1584558654804; 
 Wed, 18 Mar 2020 12:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-11-wambui.karugax@gmail.com>
 <20200318152627.GY2363188@phenom.ffwll.local>
 <alpine.LNX.2.21.99999.375.2003181857010.54051@wambui>
 <CAKMK7uGwJ6nzLPzwtfUY79e1fSFxkrSgTfJuDeM4px6c0v13qg@mail.gmail.com>
 <20200318165846.GC3090655@kroah.com>
In-Reply-To: <20200318165846.GC3090655@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2020 20:10:43 +0100
Message-ID: <CAKMK7uGbg5Lax+eXJda4k9LNd7JBb+LRtRw4S+bZ4GbNGT--ZA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 5:58 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 18, 2020 at 05:31:47PM +0100, Daniel Vetter wrote:
> > On Wed, Mar 18, 2020 at 5:03 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
> > >
> > >
> > >
> > > On Wed, 18 Mar 2020, Daniel Vetter wrote:
> > >
> > > > On Tue, Mar 10, 2020 at 04:31:14PM +0300, Wambui Karuga wrote:
> > > >> Since 987d65d01356 (drm: debugfs: make
> > > >> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> > > >> fails and should return void. Therefore, remove its use as the
> > > >> return value of drm_vram_mm_debugfs_init(), and have the function
> > > >> return 0 directly.
> > > >>
> > > >> v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
> > > >> introducing build issues and build breakage.
> > > >>
> > > >> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
> > > >> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > > >> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > >> ---
> > > >>  drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
> > > >>  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > >> index 92a11bb42365..c8bcc8609650 100644
> > > >> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> > > >> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> > > >> @@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
> > > >>   */
> > > >>  int drm_vram_mm_debugfs_init(struct drm_minor *minor)
> > > >>  {
> > > >> -    int ret = 0;
> > > >> -
> > > >>  #if defined(CONFIG_DEBUG_FS)
> > > >
> > > > Just noticed that this #if here is not needed, we already have a dummy
> > > > function for that case. Care to write a quick patch to remove it? On top
> > > > of this patch series here ofc, I'm in the processing of merging the entire
> > > > pile.
> > > >
> > > > Thanks, Daniel
> > > Hi Daniel,
> > > Without this check here, and compiling without CONFIG_DEBUG_FS, this
> > > function is run and the drm_debugfs_create_files() does not have access to
> > > the parameters also protected by an #if above this function. So the change
> > > throws an error for me. Is that correct?
> >
> > Hm right. Other drivers don't #ifdef out their debugfs file functions
> > ... kinda a bit disappointing that we can't do this in the neatest way
> > possible.
> >
> > Greg, has anyone ever suggested to convert the debugfs_create_file
> > function (and similar things) to macros that don't use any of the
> > arguments, and then also annotating all the static functions/tables as
> > __maybe_unused and let the compiler garbage collect everything?
> > Instead of explicit #ifdef in all the drivers ...
>
> No, no one has suggested that, having the functions be static inline
> should make it all "just work" properly if debugfs is not enabled.  The
> variables will not be used, so the compiler should just optimize them
> away properly.
>
> No checks for CONFIG_DEBUG_FS should be needed anywhere in .c code.

So the trouble with this one is that the static inline functions for
the debugfs file are wrapped in a #if too, and hence if we drop the
#if around the function call stuff won't compile. Should we drop all
the #if in the .c file and assume the compiler will remove all the
dead code and dead functions?
-Daniel (who has no idea how this all works really)
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
