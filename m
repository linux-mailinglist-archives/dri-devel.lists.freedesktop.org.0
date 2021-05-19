Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFB388B74
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50C56ECF8;
	Wed, 19 May 2021 10:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D146E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:15:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id u133so6966426wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JifEb7sBQtGdz3Sa0iaMHHjpd5erUKdLklDKpuXS/+s=;
 b=kkOZDQJA70ycWnKkAXJYvSu6ds8gT5mVSqkWZssa0gJ1HySd6lRqlf2Y9w65WZ4gdu
 I37ci33uf3CEEXadQzILqkINTNfTa3a/HeW92csAAsWL+Xp7wSDBjRhOyQ7YR2mQD3Iy
 BXwnAxaR4IvDB27aqXxB7Z2H1ucmEJoNkwKJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JifEb7sBQtGdz3Sa0iaMHHjpd5erUKdLklDKpuXS/+s=;
 b=gjjzMec10JNC0R29wt6a6YOViGaEebZIvg58df7WNaqmjRkJgdyR7y9PocK6kv24GP
 L1Szh/PDlg6kIeYE49uBAVuRDLx2oWODzwEOkag78uNzZ8snTcoSItECpnYldTQl353V
 3yz3XYaX+06WJ3Umwwgc2C1e2dzW69b8sEXsekEcfqUnnBkakB6tHki2roQLj+SVRrS+
 WMU4RMo7OsjAo6a6kR66v4R7zcfkfJ2G7WMRs8it4zN6BYaxk2qrRwLEddyifssg9hAY
 UMC32pDxHsMrmtU1pm8LLm+wGDvirHgWXFvLox/UNLkHSlk+NJEZdDwnGrzTcyGNvBtV
 ikow==
X-Gm-Message-State: AOAM530AFHPmb4946KsuOxNDdpPFmk2xJpFw18mKhZTJeZ6wA3x0efJf
 WH+gfmdlGiGFAcKhIVv5JeZT7Xl68cgebA==
X-Google-Smtp-Source: ABdhPJxHuv8FxV/ryFhbRgUXeljJ8b82KwhaNqCsZd/e3bT2sWXNMvAGR3CW1NbY6XjDR6FZK5OpgQ==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr10056914wmc.181.1621419300098; 
 Wed, 19 May 2021 03:15:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e10sm25282232wrw.20.2021.05.19.03.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:14:59 -0700 (PDT)
Date: Wed, 19 May 2021 12:14:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [drm-rerere PATCH] nightly.conf: drop amd branches from drm-tip
Message-ID: <YKTlIX5ct9agqloB@phenom.ffwll.local>
References: <20210519084932.8666-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519084932.8666-1-jani.nikula@intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pan@phenom.ffwll.local
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 11:49:32AM +0300, Jani Nikula wrote:
> We've had a stale repo for amd in drm-tip since around v4.15 i.e. for
> more than three years. Nobody seems to notice or care. Drop the amd
> branches from drm-tip.
> 
> Having the current amd branches in drm-tip would be nice to have, if
> only to have a common drm integration tree. However, maintaining that
> has a cost due to the inevitable conflicts. We can add the branches back
> if and when there's interest in sharing the burden.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  nightly.conf | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/nightly.conf b/nightly.conf
> index 9211550ef75c..35fb1d9ba600 100644
> --- a/nightly.conf
> +++ b/nightly.conf
> @@ -40,12 +40,6 @@ git://anongit.freedesktop.org/drm-misc
>  https://anongit.freedesktop.org/git/drm/drm-misc
>  https://anongit.freedesktop.org/git/drm/drm-misc.git
>  "
> -drm_tip_repos[drm-amd]="
> -ssh://git.freedesktop.org/git/drm/drm-amd
> -git://anongit.freedesktop.org/drm/drm-amd
> -https://anongit.freedesktop.org/git/drm/drm-amd
> -https://anongit.freedesktop.org/git/drm/drm-amd.git
> -"
>  drm_tip_repos[drm]="
>  ssh://git.freedesktop.org/git/drm/drm
>  git://anongit.freedesktop.org/drm/drm
> @@ -76,17 +70,14 @@ drm_tip_config=(
>  	"drm			drm-fixes"
>  	"drm-misc		drm-misc-fixes"
>  	"drm-intel		drm-intel-fixes"
> -	"drm-amd		drm-amd-fixes"
>  
>  	"drm			drm-next"
>  	"drm-misc		drm-misc-next-fixes"
>  	"drm-intel		drm-intel-next-fixes"
> -	"drm-amd		drm-amd-next-fixes"
>  
>  	"drm-misc		drm-misc-next"
>  	"drm-intel		drm-intel-next"
>  	"drm-intel		drm-intel-gt-next"
> -	"drm-amd		drm-amd-next"
>  
>  	"sound-upstream		for-linus"
>  	"sound-upstream		for-next"
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
