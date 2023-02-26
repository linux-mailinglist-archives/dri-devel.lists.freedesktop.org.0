Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEA6A2F25
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 11:47:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643310E030;
	Sun, 26 Feb 2023 10:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E56710E030
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 10:47:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3336BB80B6B;
 Sun, 26 Feb 2023 10:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A19AC433EF;
 Sun, 26 Feb 2023 10:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677408469;
 bh=fLQt+ixMEJSno4VMGJ1WCh88kx568RB8kp9xOEK0ZLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d1Btl1zvFXWcXcQY0WO1bc/qjhN1GZgwcTiYMFxTOQOqDLawscMFk5ki2J3DAa1Xw
 wlTMXP0BwkWr99xwqquqlREx461suPqS+zKKLJyl36bSSfE6gNtGr1OfXMr9c6FPQ5
 t2XmTbirJcUKs7uPA1wVo03LrjngNw8FsZmg4wqQkfULn0riyheBkFbNWv7FWyGoqb
 hwgEEEKgCCAAU27m4wv6i0rhSBo4Y8g+8BiBI9I5Jyx9Ta7goKCuAI+hbk6XUU2nIw
 mWtAReJxcP/pF17LSnl0svyDSwDX9buC6PMxg+suQJmsh6CID0LGTSb4Z1rb/67YLl
 U4JVxL4tYEXEw==
Date: Sun, 26 Feb 2023 11:47:44 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
Message-ID: <20230226114744.7221f460@coco.lan>
In-Reply-To: <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Sun, 26 Feb 2023 08:39:32 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> [+CC: Jon, linux-doc]
> 
> On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
> > Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> > documatation for a few new RGB formats. For some reason these break the
> > pdfdocs build, even if the same style seems to work elsewhere in the
> > file.
> > 
> > Remove the trailing empty dash lines, which seems to fix the issue.
> > 
> > Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>  
> Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
> 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> > 
> > Note: the offending patch was merged via drm tree, so we may want to
> > apply the fix to the drm tree also.  
> 
> So, the offending commit is now in mainline without this fix...
> I believe this build regression -- a real build error of "make pdfdocs"
> -- should be fixed ASAP.
> 
> Tomi, Laurent has suggested a typo fix in the Changelog.
> Can you respin ?
> 
> Or, Laurent, can you do the fix on your own?
> 
> Hopefully, the fix can make v6.3-rc1.

Better to wait for media PR to be handled. There were some changes at
the documentation that affected the patch. I guess the bug is gone.
If not, we'll need to rebase the patch.

Regards,
Mauro

> 
>         Thanks, Akira
> 
> > 
> >  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index d330aeb4d3eb..ea545ed1aeaa 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -868,7 +868,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-RGBA1010102:
> >  
> >        - ``V4L2_PIX_FMT_RGBA1010102``
> > @@ -909,7 +908,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-ARGB2101010:
> >  
> >        - ``V4L2_PIX_FMT_ARGB2101010``
> > @@ -950,7 +948,6 @@ number of bits for each component.
> >        - r\ :sub:`6`
> >        - r\ :sub:`5`
> >        - r\ :sub:`4`
> > -      -
> >  
> >  .. raw:: latex
> >    



Thanks,
Mauro
