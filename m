Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91391634FAD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 06:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDB510E4E8;
	Wed, 23 Nov 2022 05:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817C410E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 05:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669181765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fm2z95zFBkrJo+OG+cEbfJqfzc4sPwppotEwP4eeDhQ=;
 b=N7kLE4VeS8QFm7mjblaBNzsXSLk1iVJZDGGN8cJC9GArIkWEmUpSJYGrvUhru3qAPPwynI
 Bb/R1S5m4rXoKeoJ+aLt7R5u8qNYFzV2k1JeFXoSqZ7bZGyfnr+Z+dx/qC3s7O2RPKzyq9
 j/QegTqWk1F/qw0PMFxRdv/TK4/hpCU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-QZd9u-m7NM26ytkiL6gqJg-1; Wed, 23 Nov 2022 00:36:04 -0500
X-MC-Unique: QZd9u-m7NM26ytkiL6gqJg-1
Received: by mail-lf1-f71.google.com with SMTP id
 cf15-20020a056512280f00b004a28ba148bbso6189284lfb.22
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 21:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fm2z95zFBkrJo+OG+cEbfJqfzc4sPwppotEwP4eeDhQ=;
 b=JaAWERrMq26HFVHQ/x+jmXiEwOoui7EiIHGEoKOsUsqWkzzDTGi3RSk9b1ttOKWg2c
 PjIt6IRdecdD3TVTrqoVgKjagl/KyibjiRTi86QuDPenxjv9znDE3SbeefeU73TCY0EE
 kUEitRIV0N7g3ryyX+RHorH0eRsxlFiglWVPj0xJ3yL2p783kUNNAlt58+xjs3XeooYz
 cLJAhuX/aBcA4kkS6B7Fqs08+qZDmcYHymxd6RfR1kU09KukO2EZMaOrgSvYo0UHl2Xv
 l0fTei+TaIqHGg20P5RIMK3+8ytjssmsAqOmGBq+29lJkvTI/vWGK3DG/oCdrlzzc30d
 nCSQ==
X-Gm-Message-State: ANoB5plLHLtweuE2iR7ZxZx5eqJYhOV3UNKbcGuZU4GXvXO3m5+T3E3M
 rKgCeXsj2u3rpWjVUsKaTHUPI/OU3yCAL4oUQs+Teb5Z39Cujin/MVmk3ShtFXbGN3s5MBN8Nxi
 lx8wnxX8Cyn0GoPkYJnZzspkdqKGTZS/zCVhT546SwK7j
X-Received: by 2002:ac2:5921:0:b0:4b3:cdf5:93f3 with SMTP id
 v1-20020ac25921000000b004b3cdf593f3mr8507174lfi.99.1669181762528; 
 Tue, 22 Nov 2022 21:36:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7EmAdgaB8z6/XlFfL3GYcrmaPlXFkV2QFwJYrqaxkfAnHDIeaFh8pRTCR3xvg4c2PyDsw5HZNh73j3bDrQq70=
X-Received: by 2002:ac2:5921:0:b0:4b3:cdf5:93f3 with SMTP id
 v1-20020ac25921000000b004b3cdf593f3mr8507165lfi.99.1669181762300; Tue, 22 Nov
 2022 21:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20221117183214.2473e745@canb.auug.org.au>
 <20221123162033.02910a5a@canb.auug.org.au>
In-Reply-To: <20221123162033.02910a5a@canb.auug.org.au>
From: David Airlie <airlied@redhat.com>
Date: Wed, 23 Nov 2022 15:35:50 +1000
Message-ID: <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 3:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 17 Nov 2022 18:32:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the drm-misc tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >
> > ld: drivers/video/fbdev/core/fbmon.o: in function `fb_modesetting_disabled':
> > fbmon.c:(.text+0x1e4): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbcmap.o: in function `fb_modesetting_disabled':
> > fbcmap.c:(.text+0x478): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbsysfs.o: in function `fb_modesetting_disabled':
> > fbsysfs.c:(.text+0xb64): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/modedb.o: in function `fb_modesetting_disabled':
> > modedb.c:(.text+0x129c): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> > ld: drivers/video/fbdev/core/fbcvt.o: in function `fb_modesetting_disabled':
> > fbcvt.c:(.text+0x0): multiple definition of `fb_modesetting_disabled'; drivers/video/fbdev/core/fbmem.o:fbmem.c:(.text+0x1bac): first defined here
> >
> > Caused by commit
> >
> >   0ba2fa8cbd29 ("fbdev: Add support for the nomodeset kernel parameter")
> >
> > This build does not have CONFIG_VIDEO_NOMODESET set.
> >
> > I applied the following patch for today.
> >
> > From 63f957a050c62478ed1348c5b204bc65c68df4d7 Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 17 Nov 2022 18:19:22 +1100
> > Subject: [PATCH] fix up for "fbdev: Add support for the nomodeset kernel parameter"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  include/linux/fb.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 3a822e4357b1..ea421724f733 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -807,7 +807,7 @@ extern int fb_find_mode(struct fb_var_screeninfo *var,
> >  #if defined(CONFIG_VIDEO_NOMODESET)
> >  bool fb_modesetting_disabled(const char *drvname);
> >  #else
> > -bool fb_modesetting_disabled(const char *drvname)
> > +static inline bool fb_modesetting_disabled(const char *drvname)
> >  {
> >       return false;
> >  }
> > --
> > 2.35.1
>
> This commit went away for a couple of linux-next releases, but now has
> reappeared in the drm tree :-(  What went wrong?

Nothing gone wrong as such, just the drm-misc-next pull request was
sent on a regular weekly cadence, then I merged it a few days later.
The fix for this is still in the drm-misc-next queue for the next PR
which I will get this week.

Dave.

