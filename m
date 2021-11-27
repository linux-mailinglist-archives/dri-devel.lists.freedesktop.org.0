Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBFB46011F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 20:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7236E17E;
	Sat, 27 Nov 2021 19:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA086E17E
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 19:26:52 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d24so26655328wra.0
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 11:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=89TQIfFMi5YcjZndEermwrf0AkyDoyzUG6bDIxitI4Y=;
 b=HUJpYejgaxfyWI6FpnqGcfAhCMCEr2D6LDN0gcB4SuTSnAZuS1UNAbVqizSg7xc9g+
 Zmyt0bmyMWVJoZN4k6IzzYdJeHUSjvQprh+lRLGW2rHb9n2J8uU01p7MpxstS101R1f/
 D4u6RmxDVDugEaSME+2QZDhm2CszDNgJ3e+Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=89TQIfFMi5YcjZndEermwrf0AkyDoyzUG6bDIxitI4Y=;
 b=mA6B6XzHESNEKLuxbodVwVJhhlV9ajqsoSjqjqalHaJCbb5C3Lckth8BRH7/ynx0/0
 vETp1K6mVsKPrP2Yn3kR6lILFA4wgH9I523OnPxzYDQapu1W28e7eCZBMex8ccptvXaU
 Uz7zLYWQkSDiNWPhsT/oF1uuqXwX9ZMY5S0Pfo+d6105veNFo0lh3MDE/EKj0nrIhALL
 B4mbnQRr+jK27l+3QtoJHvlvmHUDj63BB9jZKFsql0DQAMVA8oZM/NmawW2TPqmZUjwf
 p9kMxtgy0Hkfmc1Jn4HEnFIHTtnuXv0FRMo5Hp3YytYoHPtAp/YTKQ6hb6fnpPznH0d2
 jb3g==
X-Gm-Message-State: AOAM530Kt1tE7075C5X0TxW9GAm/li8J1sqG83Y9HU2wbRuU81aYlkZP
 E9kMdSK9Jo1V74eIyOv0Kc2JHQ==
X-Google-Smtp-Source: ABdhPJxgeqxmYvRq4/UvvikJwlN1aQmyd/Q4yh/D789U9or7uv4rdJy+HLzB9k4Tp7otyhxN440x7Q==
X-Received: by 2002:a5d:6347:: with SMTP id b7mr23300469wrw.36.1638041210365; 
 Sat, 27 Nov 2021 11:26:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p12sm9122810wro.33.2021.11.27.11.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 11:26:49 -0800 (PST)
Date: Sat, 27 Nov 2021 20:26:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm: Fix build error caused by missing drm_nomodeset.o
Message-ID: <YaKGeKU7HJOgEu9r@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20211127191910.709356-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127191910.709356-1-javierm@redhat.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 kernel test robot <lkp@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 27, 2021 at 08:19:10PM +0100, Javier Martinez Canillas wrote:
> The patch for commit ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter
> to the DRM subsystem") was generated with config 'diff.noprefix true'.
> 
> But later was applied using 'cat nomodeset.mbox | dim apply-branch' on a
> machine with 'diff.noprefix false'. And command 'git am --scissors -3' as

Huh that's a dangerous setting, I guess a dim patch to check for this and
very loudly complain would be good? Care to type that up?  It's no big
deal because strange git settings for dim is pretty much a game of
whack-a-mole, but we should tackle them when they pop up.

> used by the dim tool doesn't handle that case well, since the 3-way merge
> wrongly resolves the path for new file drivers/gpu/drm/drm_nomodeset.c as
> gpu/drm/drm_nomodeset.c instead.
> 
> It led to the following build error as reported by the kernel test robot:
> 
>   make[4]: *** No rule to make target 'drivers/gpu/drm/drm_nomodeset.o', needed by 'drivers/gpu/drm/built-in.a'.
> 
> Fixes: ("6a2d2ddf2c34 drm: Move nomodeset kernel parameter to the DRM subsystem")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Build testing before pushing should be done, not the other way round :-)

Also this is pretty much why we want gitlab CI and real branches.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
>  {gpu => drivers/gpu}/drm/drm_nomodeset.c | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {gpu => drivers/gpu}/drm/drm_nomodeset.c (100%)
> 
> diff --git a/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomodeset.c
> similarity index 100%
> rename from gpu/drm/drm_nomodeset.c
> rename to drivers/gpu/drm/drm_nomodeset.c
> -- 
> 2.33.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
