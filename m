Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BD4ADA56
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8410E209;
	Tue,  8 Feb 2022 13:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24F810E209
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 13:46:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id d10so52527449eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=n+LaJyZileNVYfrYaX66cB1MBmYgBiVsCyxJAwLVUMM=;
 b=lI+BZuVcaX39tM3Hzn6AV7cMAOYQiuorb7ECkjKy19ZLPsqgt5HccWa6JVE5WSOUzf
 zkF5zK1pNUirlIF9c0I6rmjLcjRY61AIgt0gVX3PzKHHihcmAvkzPuyk6Vsiwh52MJlx
 nJbFdhibExMF4h5Vct0UMFUcQtBrt70JaaTJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=n+LaJyZileNVYfrYaX66cB1MBmYgBiVsCyxJAwLVUMM=;
 b=Foko4UxMeVt0Q7rFvRezDFrclJJdzMdYdhpnGhlVMaLKr33OeGrfAXJALjT02RrtyL
 UWAi//sOq4JRao4TELcKfsrCC9eDvzkGf9bSecM0UjRg5jNBJ+TZyUcfl0fm02JGULYy
 kaDjnKGu2rYFGsIzW+kBtdP7Cg91MBbfiv3jJkiNYkdkD3prgDRD41VfXtBgB4aZ/hB5
 QNtA3lcUckAjCDIe4tiWrBSkKEpl4YC/vOWhBzKxTA7cXACvJW+Vte7DkaPdyZiumSHn
 d/Hrmn/hhVcC9EOohrqymoBa1EPLf5u288DLfgCAYFHsP6yX6KOGxo8XMsUQFUXtrS1i
 vg8w==
X-Gm-Message-State: AOAM530yKvvRq1na2hKgkY2x05QnKbi12FLmQohIHOzFxeXLIsF/+TTz
 PM8rkfAcw7YVFeL8Xsyu7SWX5A==
X-Google-Smtp-Source: ABdhPJxVk+yKuksCrmEzucsFv8fLMfNwj3TQ4MGzWAZDuSk8mMV/chycYqMAJ3qCJ8UZgxkmkgB4aw==
X-Received: by 2002:a17:907:da3:: with SMTP id
 go35mr3771651ejc.456.1644327995333; 
 Tue, 08 Feb 2022 05:46:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm331032ejm.133.2022.02.08.05.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:46:34 -0800 (PST)
Date: Tue, 8 Feb 2022 14:46:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 10/21] fb: Delete fb_info->queue
Message-ID: <YgJ0OQxt4KIPD9uz@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Helge Deller <deller@gmx.de>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-11-daniel.vetter@ffwll.ch>
 <YfxJlH2NDnLk/GUw@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfxJlH2NDnLk/GUw@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 10:31:00PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 10:05:41PM +0100, Daniel Vetter wrote:
> > It was only used by fbcon, and that now switched to its own,
> > private work.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-fbdev@vger.kernel.org
> I would merge this with the patch that drops the usage

Yeah, but I like to split these out so that if this does break something,
it's much easier to revert. In case I overlooked something somewhere.

It's imo different if the cleanup is directly related to the preceeding
prep work, but this is a generic workqueue, and the cursor logic is rather
unrelated. And if I remember my history digging right, there were actually
other uses of this.
-Daniel

> 
> > ---
> >  include/linux/fb.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/include/linux/fb.h b/include/linux/fb.h
> > index 02f362c661c8..a8a00d2ba1f3 100644
> > --- a/include/linux/fb.h
> > +++ b/include/linux/fb.h
> > @@ -449,7 +449,6 @@ struct fb_info {
> >  	struct fb_var_screeninfo var;	/* Current var */
> >  	struct fb_fix_screeninfo fix;	/* Current fix */
> >  	struct fb_monspecs monspecs;	/* Current Monitor specs */
> > -	struct work_struct queue;	/* Framebuffer event queue */
> >  	struct fb_pixmap pixmap;	/* Image hardware mapper */
> >  	struct fb_pixmap sprite;	/* Cursor hardware mapper */
> >  	struct fb_cmap cmap;		/* Current cmap */
> > -- 
> > 2.33.0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
