Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B4186690
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 09:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FB66E373;
	Mon, 16 Mar 2020 08:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02B06E373
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 08:33:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f3so13008477wrw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Np0PyQ3dN/K0XmXOWBC7J7/OCl/vL8McW1IXy4RBUgE=;
 b=bqhZBq8gCbsRh+Ix9GzmFj7etr9aCj5k2VDWtb9DCZDwiUCQ4xy5s1cpMAc2jIBpCo
 WwxG0+8bynS7HTBvZ+IMWiWgLzWMCoq2Jcy6TDEG7/yEMjhTa16mzIVokPevbP+2vpVz
 /IfRIBrdLITDf1yOGV5zCQasJlEzEhPdG8440=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Np0PyQ3dN/K0XmXOWBC7J7/OCl/vL8McW1IXy4RBUgE=;
 b=NBU4OsFGAkseuUSJT4rLqvf2OzhnrKlmxYoiG1aZCHPOLupBfittg+T/fc1bS7uFHz
 bUOW8AOsF5BG3DHFnZfaE+TWK1335f2VeEKLi6ZpuRTPsrJFautaqc2iCqG7dAQf7shy
 p6EmAgJXEstcaWRpe1zGzX1XHV59uNGtnRRtv5xA7pocx0OovkLCD+EKlmv7eHl5XXX5
 fmusk14TmGXWW0pPVPC978FT/S6XQ94jrsyVcPpBSBWF/YSP+NqMIOs3hQFNEfYzc+vq
 H9mlUvNdDRQoue7pd1yv0N27M8/Ytu54fFXYyIVlMtb7o9yWJCqHy29j8hhBdqibBXe1
 Rr9w==
X-Gm-Message-State: ANhLgQ2at0HF5XOmySr5rjW8XSJIu96EHf6BncfS6gHstGvEbpZjNSGy
 0XAchLbGKPOULe9BozyJoBoqEg==
X-Google-Smtp-Source: ADFU+vv5wVdXdcx4EeLmKazJGTmA1SjA1iRGsWULv81fmZZvk3NWZudyD95lysFKRly5AByJQvUxng==
X-Received: by 2002:a5d:6907:: with SMTP id t7mr19250023wru.159.1584347592539; 
 Mon, 16 Mar 2020 01:33:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g7sm93502349wrq.21.2020.03.16.01.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 01:33:11 -0700 (PDT)
Date: Mon, 16 Mar 2020 09:33:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 10/21] drm/tegra: remove checks for debugfs functions
 return value
Message-ID: <20200316083309.GD2363188@phenom.ffwll.local>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-11-wambui.karugax@gmail.com>
 <20200311143753.GC494173@ulmo>
 <alpine.LNX.2.21.99999.375.2003111750360.14786@wambui>
 <20200311232446.GA998881@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311232446.GA998881@ulmo>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 12:24:46AM +0100, Thierry Reding wrote:
> On Wed, Mar 11, 2020 at 05:54:46PM +0300, Wambui Karuga wrote:
> > Hey Thierry,
> > 
> > On Wed, 11 Mar 2020, Thierry Reding wrote:
> > 
> > > On Thu, Feb 27, 2020 at 03:02:21PM +0300, Wambui Karuga wrote:
> > > > Since 987d65d01356 (drm: debugfs: make
> > > > drm_debugfs_create_files() never fail) there is no need to check the
> > > > return value of drm_debugfs_create_files(). Therefore, remove the
> > > > return checks and error handling of the drm_debugfs_create_files()
> > > > function from various debugfs init functions in drm/tegra and have
> > > > them return 0 directly.
> > > > 
> > > > This change also includes removing the use of drm_debugfs_create_files
> > > > as a return value in tegra_debugfs_init() and have the function declared
> > > > as void.
> > > > 
> > > > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/dc.c   | 11 +----------
> > > >  drivers/gpu/drm/tegra/drm.c  |  8 ++++----
> > > >  drivers/gpu/drm/tegra/dsi.c  | 11 +----------
> > > >  drivers/gpu/drm/tegra/hdmi.c | 11 +----------
> > > >  drivers/gpu/drm/tegra/sor.c  | 11 +----------
> > > >  5 files changed, 8 insertions(+), 44 deletions(-)
> > > 
> > > Applied, thanks.
> > > 
> > There's a newer version[1] of this patch series as this specific patch
> > depends on other work in drm.
> 
> Oh yeah, I just noticed that this patch causes a build failure, so I
> backed it out again.
> 
> If there's dependencies on other work, it's probably best to take this
> through drm-misc, in which case:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> Let me know if you'd prefer me to apply this to drm/tegra instead.

Yeah I'm going to pull in the entire series through -misc rsn.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
