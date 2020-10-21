Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FEC294A38
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 11:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA906E888;
	Wed, 21 Oct 2020 09:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D166E888
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 09:11:33 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o3so1102233pgr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=//G+UIj6Ybk/x9mL4TyohFYn2Oa9jzE06o5FVAQeTEE=;
 b=TzBP30uCW5d36/00SdxUyrjlozilPchSsUCoLwI7yFPi8iQ0T1UGOtavURACcxKvWW
 ds9ZN6HcGykEGpeaJ4ftpraokGpfrUsv89ON2j90uyqcAARRWHZe7FcFEmrXszX+GGg3
 0mh2woqZ+3vcWh8CRIeTocID1Qrlun4epMvZ+yGHGRFrdkOkznxXB3qE/vbmST3x0Res
 yHZDNsZVpRUaOeDJFFk8y9hFLBQ5mxKGNUHRHT1qXuy56RMS8lGQNaa3FTR5Gr8K7eOO
 BtVoTZjy2X92O+sh+t3FncM4jqG7xmcM/dyHt5SGGKzGfpBIBc3PjVxQV4FI3CwVRN66
 7WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=//G+UIj6Ybk/x9mL4TyohFYn2Oa9jzE06o5FVAQeTEE=;
 b=Tvj0dyz1ZZNh1niVrbYA4uXyNOYPCda+22AlHvu64QSQt2VQhTCm6nZZdTm9kGWKy5
 0iyjeIPKEgWeurUNoIZhb8Ld6Ir3bLRraHw7cvuN2wmYnlc96CZvw3I8uQdVFh2ic341
 LOo7L6gEG5NoMw4k9WpQPE31O2mUsZJJkgb16SVcdBif5ykDCBVrlz+uKuF9JF5cIxXY
 DOOlzSlLaTHKBywKfBFK3AJ5IAF23jBd+yHoIoFIepFL2s7dS2zthUYXzo0G58GAUPRO
 tBzkT8Y1cK7cdToAXFiXd/HRMbunirm9lu4I54abh+S9ZVvCg70FkhfEwV1MRuA087cm
 fn3g==
X-Gm-Message-State: AOAM531+a1vc2t3317ZcqrlJLH4TBdSaMcJTf/Cf19ZcJUo9tp3K3/3+
 qHDM++yk/BaWtmItEOijE3PoAKmg+nLTNeMs
X-Google-Smtp-Source: ABdhPJylgLIzRqMcVRL0DqbajTp4iS4sVQSiy2MwnXEjYwngjCGe2vp7rV22q+cauSoZM1jSI1yVJw==
X-Received: by 2002:a63:5fd4:: with SMTP id t203mr2339063pgb.29.1603271493455; 
 Wed, 21 Oct 2020 02:11:33 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id q2sm1394183pfu.193.2020.10.21.02.11.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Oct 2020 02:11:32 -0700 (PDT)
Date: Wed, 21 Oct 2020 17:11:27 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/drm_vblank: use drm_warn_once() to warn undefined
 mode timing
Message-ID: <20201021091126.GI5182@dragon>
References: <20201016071254.2681-1-shawn.guo@linaro.org>
 <CAKMK7uHvDK6Cd2BBvUV-xtArD73gQVAp0ETBw=tLXrYUfOS-zw@mail.gmail.com>
 <20201016085407.GA5182@dragon>
 <CAKMK7uHbhBzS=DdrDgpzYYaiCCkVLj=sAMUi3puLxjoF-Z+NbQ@mail.gmail.com>
 <20201016114637.GB5182@dragon>
 <20201019154829.GG401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019154829.GG401619@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 05:48:29PM +0200, Daniel Vetter wrote:
> On Fri, Oct 16, 2020 at 07:46:41PM +0800, Shawn Guo wrote:
> > Indeed!  Adding drm_crtc_vblank_reset() into driver crtc reset hook
> > removes the WARNING for me.  Really appreciate your comments, Daniel!
> 
> This should work automatically if you're using the atomic state helpers.
> Please try to unify as much as possible, so you're not missing any future
> bugfixes in this area. Although I thought I've completely reviewed all
> drivers to fix as many as possible for this bug. Are you on some older
> kernel that didn't have this? Maybe good idea to submit the bugfix in
> upstream to stable, if that's the case.

Yes, I'm running a 4.19 stable kernel with msm/mdp5 device.  The bug was
addressed (unintentionally?) by one patch that is part of the series
adding Nexus 5 display support.  And later on, you commit 51f644b40b4b
("drm/atomic-helper: reset vblank on crtc reset") switches the driver to
use atomic state helper.

Shawn

[1] https://lore.kernel.org/patchwork/patch/1082564/

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
